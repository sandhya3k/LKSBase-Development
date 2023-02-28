report 50145 "Customer Aging Mail"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './res/CustomerAgingMail.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No."), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Currency Code" = FIELD("Currency Filter"), "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Ship-to Contact") WHERE("Ship-to Contact" = FILTER(<> ''));
                RequestFilterFields = "Posting Date";

                trigger OnAfterGetRecord()
                var
                    ShipToContactFullName: Text[100];
                    ReportToMail: Report "Customer Detailed Aging Mail";
                    //TBD
                    /*
                    SmtpSend: Codeunit "SMTP Mail";
                    smtpsetup: Record "SMTP Mail Setup";
                    FileRec: Record File;
                    */
                    Email: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    EmailTo: List of [Text];
                    EmailScenario: Enum "Email Scenario";
                    HtmlBody: Text;
                    FileMgmt: Codeunit "File Management";
                    SIH: Record "Sales Invoice Header";
                    ContactRec: Record Contact;
                    ToEmail: Text[50];
                    EmailCheck: Boolean;
                    RemAmtSub: Decimal;
                    SingIns: Codeunit "Single Instance";
                begin
                    //ShipToContactFullName := Initials+' '+"F Name"+' '+"M Name"+' '+"L Name";

                    CalcFields("Remaining Amount", "Remaining Amt. (LCY)");
                    if "Remaining Amount" = 0 then
                        CurrReport.Skip;


                    if OldShipContact <> "Cust. Ledger Entry"."Ship-to Contact" then begin
                        if SIH.Get("Document No.") then;
                        Clear(ReportToMail);
                        ReportToMail.SetContact("Cust. Ledger Entry"."Ship-to Contact", StartDate, EndDate, OnlyOpen, Customer."No.");
                        //TBD ReportToMail.SaveAsPdf('C:\Outstanding\' + Customer."No." + '_' + "Cust. Ledger Entry"."Ship-to Contact" + '.pdf');
                        //3K
                        TempBlob.CreateOutStream(OutStr);
                        ReportToMail.SaveAs('', ReportFormat::Pdf, OutStr);
                        TempBlob.CreateInStream(InStr);
                        //3K End
                        if StrLen(SIH."Ship-to Contact") > 20 then begin
                            ContactRec.Reset;
                            ContactRec.SetFilter("No.", CopyStr(SIH."Bill-to Contact No.", 1, 19) + '*');
                            if ContactRec.FindFirst then;
                        end else
                            if ContactRec.Get(SIH."Bill-to Contact No.") then;


                        if ContactRec."E-Mail" <> '' then begin
                            ToEmail := ContactRec."E-Mail";
                            EmailCheck := true
                        end else
                            ToEmail := 'viswa.accounts@lakshmisri.com';
                        //MESSAGE('%1  %2  %3  %4',"Cust. Ledger Entry"."Ship-to Contact",ContactRec."E-Mail",EmailCheck,SIH."Bill-to Contact No.");
                        //3K
                        CLEAR(RemAmtSub);
                        RemAmtSub := SingIns.GetRemAmt();

                        CLEAR(CrrCode);
                        GetCopyEmails();
                        GetCopyEmails2();
                        EmailMessage.Create(ToEmail,
                        //EmailMessage.Create('tabrej.a@3ktechnologies.com',
                        'Outstanding statement as on ' + FORMAT(EndDate) + ' of ' + Customer.Name + ' - ' + CrrCode + ' - ' + FORMAT(RemAmtSub), '', TRUE);

                        IF NOT EmailCheck THEN BEGIN
                            EmailMessage.AppendToBody('No Contact Email ID for this outstanding Invoice(s). Hence this Email sent to Owner 2 alone.');
                            EmailMessage.AppendToBody('<br><br>');
                        END;
                        EmailMessage.AppendToBody('Dear Sir/Madam,');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('Please find attached an updated statement of your account with “Lakshmikumaran & Sridharan” as on' + ' ' + FORMAT(WORKDATE - 1) + '.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('Kindly have a check on the Invoice(s) listed in the statement and let us know whether it tallies with your account.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('We request you to please pay special attention for the invoice(s) that are kept pending payment for more than 3 months. If any of the listed invoices has already been paid, please '
                        + ' provide payment details including bank or cheque reference so that we can check with our bankers.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('This payment request is intended to cover the Invoices raised up to ' + FORMAT(TODAY - 30) + ' and treated as an intimation for the Invoices raised subsequent to this date.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('If you have not received any of the invoice(s) and/or need a copy, please let us know.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('Please do inform us if you have any issue in effecting payment of any of the outstanding invoice(s) by informing either to the Attorneys marked in this email or to accounts@lakshmisri.com.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('We look forward to hearing from you in this regard at your earliest convenience.');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody('Accounts Section');
                        EmailMessage.AppendToBody('<br>');
                        EmailMessage.AppendToBody('Lakshmikumaran & Sridharan');
                        EmailMessage.AppendToBody('<br>');
                        EmailMessage.AppendToBody('B6/10, Safdarjung Enclave, New Delhi - 110029');
                        EmailMessage.AppendToBody('<br>');
                        EmailMessage.AppendToBody('Telephone: 011-41400501 to 41400505');

                        //AddAttachment('C:\Outstanding\'+Customer."No."+'_'+"Cust. Ledger Entry"."Ship-to Contact" +'.pdf','Outstanding.pdf');
                        if TempBlob.Length() > 0 then
                            //EmailMessage.AddAttachment("Dimension Value".Code, 'xls', InStr);
                            EmailMessage.AddAttachment(Customer."No." + '_' + "Cust. Ledger Entry"."Ship-to Contact" + '.pdf', '.pdf', InStr);
                        if EmailMessage.Attachments_First() then
                            if not Email.Send(EmailMessage, EmailScenario::Default) then begin
                                //Error(GetLastErrorText());
                                IF EmailNotSent <> '' THEN
                                    EmailNotSent := EmailNotSent + '|' + "Cust. Ledger Entry"."Customer No."
                                ELSE
                                    EmailNotSent := "Cust. Ledger Entry"."Customer No.";
                            end;

                        //3K END
                        //TBD
                        /*
                        FileRec.Reset;
                        FileRec.SetRange(Path, 'C:\Outstanding\');
                        FileRec.SetRange("Is a file", true);
                        FileRec.SetRange(Name, Customer."No." + '_' + "Cust. Ledger Entry"."Ship-to Contact" + '.pdf');
                        if FileRec.FindFirst then begin
                            Clear(RemAmtSub);
                            RemAmtSub := SingIns.GetRemAmt();
                            smtpsetup.Get();
                            Clear(CrrCode);
                            GetCopyEmails();
                            GetCopyEmails2();
                            SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", ToEmail,
                            'Outstanding statement as on ' + Format(EndDate) + ' of ' + Customer.Name + ' - ' + CrrCode + ' - ' + Format(RemAmtSub), '', true);

                            //SmtpSend.AddCC('bhupendra.bhakuni@lakshmisri.com');
                            SmtpSend.AddCC(EmailsToCopy);
                            if not EmailCheck then begin
                                SmtpSend.AppendBody('No Contact Email ID for this outstanding Invoice(s). Hence this Email sent to Owner 2 alone.');
                                SmtpSend.AppendBody('<br><br>');
                            end;
                            SmtpSend.AppendBody('Dear Sir/Madam,');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('Please find attached an updated statement of your account with “Lakshmikumaran & Sridharan” as on' + ' ' + Format(WorkDate - 1) + '.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('Kindly have a check on the Invoice(s) listed in the statement and let us know whether it tallies with your account.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('We request you to please pay special attention for the invoice(s) that are kept pending payment for more than 3 months. If any of the listed invoices has already been paid, please '
                            + ' provide payment details including bank or cheque reference so that we can check with our bankers.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('This payment request is intended to cover the Invoices raised up to ' + Format(Today - 30) + ' and treated as an intimation for the Invoices raised subsequent to this date.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('If you have not received any of the invoice(s) and/or need a copy, please let us know.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('Please do inform us if you have any issue in effecting payment of any of the outstanding invoice(s) by informing either to the Attorneys marked in this email or to accounts@lakshmisri.com.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('We look forward to hearing from you in this regard at your earliest convenience.');
                            SmtpSend.AppendBody('<br><br>');
                            SmtpSend.AppendBody('Accounts Section');
                            SmtpSend.AppendBody('<br>');
                            SmtpSend.AppendBody('Lakshmikumaran & Sridharan');
                            SmtpSend.AppendBody('<br>');
                            SmtpSend.AppendBody('B6/10, Safdarjung Enclave, New Delhi - 110029');
                            SmtpSend.AppendBody('<br>');
                            SmtpSend.AppendBody('Telephone: 011-41400501 to 41400505');

                            SmtpSend.AddAttachment('C:\Outstanding\' + Customer."No." + '_' + "Cust. Ledger Entry"."Ship-to Contact" + '.pdf', 'Outstanding.pdf');
                            SmtpSend.Send;
                        end else begin
                            if EmailNotSent <> '' then
                                EmailNotSent := EmailNotSent + '|' + "Cust. Ledger Entry"."Customer No."
                            else
                                EmailNotSent := "Cust. Ledger Entry"."Customer No.";
                        end;
                        */
                    end;
                    //END;


                    OldShipContact := "Cust. Ledger Entry"."Ship-to Contact";
                end;

                trigger OnPostDataItem()
                var
                    //TBD
                    /*
                    SmtpSend: Codeunit "SMTP Mail";
                    smtpsetup: Record "SMTP Mail Setup";
                    */
                    EmailMessage: Codeunit "Email Message";
                begin
                    if EmailNotSent <> '' then begin
                        //TBD
                        /*
                        smtpsetup.Get();
                        SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", 'viswa.accounts@lakshmisri.com',//ToEmail,
                          'Clients No. (Email has not sent)', '', true);
                        SmtpSend.AppendBody('Below Mentioned are the client names the email has been sent for');
                        SmtpSend.AppendBody('<br><br>');
                        SmtpSend.AppendBody(EmailNotSent);
                        SmtpSend.Send;
                        */
                        //3K

                        EmailMessage.Create('viswa.accounts@lakshmisri.com',
                                          //EmailMessage.Create('pandurangan1988@gmail.com',
                                          'Clients No. (Email has not sent)', '', true);

                        EmailMessage.AppendToBody('Below Mentioned are the client names the email has been sent for');
                        EmailMessage.AppendToBody('<br><br>');
                        EmailMessage.AppendToBody(EmailNotSent);
                        //3K END
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Posting Date", StartDate, EndDate);
                    SetRange(Open, OnlyOpen);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Clear(OldShipContact);
            end;

            trigger OnPostDataItem()
            begin
                //TBD
                /*
                SMTPRec.Get;
                SMTPRec."User ID" := EmailUserDI;
                SMTPRec."Email Sender Email" := EmailUserDI;
                SMTPRec."Email Sender Name" := SenderUserName;
                //TBD //SMTPRec.Password := EmailPass;
                SMTPRec."Password Key" := EmailPass; //3k-UPG
                SMTPRec.Modify
                */
            end;

            trigger OnPreDataItem()
            begin

                //TBD
                /*
                EmailUserDI := SMTPRec."User ID";
                //TBD //EmailPass := SMTPRec.Password;
                EmailPass := SMTPRec."Password Key"; //3k-UPG
                SenderUserName := SMTPRec."Email Sender Name";
                SMTPRec.Get;
                SMTPRec."User ID" := 'noreply@lakshmisri.com';
                SMTPRec."Email Sender Email" := 'noreply@lakshmisri.com';
                SMTPRec."Email Sender Name" := 'Noreply';
                //TBD //SMTPRec.Password := 'Nr@12345';
                SMTPRec."Password Key" := 'Nr@12345'; //3k-UPG
                SMTPRec.Modify
                */
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = All;
                }
                field("Ending Date"; EndDate)
                {
                    Caption = 'Ending Date';
                    ApplicationArea = All;
                }
                field(OnlyOpen; OnlyOpen)
                {
                    ApplicationArea = All;
                    Caption = 'Show Open Entries Only';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
    trigger OnPostReport()
    begin
        message('The report has been processed successfully');
    end;

    var
        OldShipContact: Text[50];
        StartDate: Date;
        EndDate: Date;
        OnlyOpen: Boolean;
        EmailsToCopy: Text;
        //TBD SMTPRec: Record "SMTP Mail Setup";
        EmailUserDI: Text[50];
        EmailPass: Text[50];
        SenderUserName: Text[50];
        EmailNotSent: Text[1000];
        CrrCode: Code[20];


    procedure GetCopyEmails()
    var
        CLE: Record "Cust. Ledger Entry";
        OldOwnerEmail: Text[100];
        DimValue: Record "Dimension Value";
        TempOw: Text[50];
    begin

        Clear(EmailsToCopy);
        CLE.Reset;
        CLE.SetCurrentKey(OWNER2);
        CLE.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
        CLE.SetRange("Ship-to Contact", "Cust. Ledger Entry"."Ship-to Contact");
        if (StartDate <> 0D) and (EndDate <> 0D) then
            CLE.SetRange("Posting Date", StartDate, EndDate);
        CLE.SetRange(Open, true);
        if CLE.FindFirst then begin
            if CLE."Currency Code" <> '' then
                CrrCode := CLE."Currency Code"
            else
                CrrCode := 'Rs.';
            repeat
                if DimValue.Get('OWNER2', CLE.OWNER2) then;
                Clear(TempOw);
                TempOw := DimValue."Owner_2Email_Outs.";
                if TempOw <> '' then  //TEMP 6904
                  begin
                    if OldOwnerEmail <> TempOw then begin
                        if StrPos(EmailsToCopy, TempOw) = 0 then
                            if EmailsToCopy <> '' then
                                EmailsToCopy := EmailsToCopy + ';' + TempOw
                            else
                                EmailsToCopy := TempOw;
                    end;
                    OldOwnerEmail := TempOw;
                end else begin //TEMP 6904
                    if EmailNotSent <> '' then
                        EmailNotSent := EmailNotSent + ', ' + CLE."Customer No." + '-' + DimValue.Name
                    else
                        EmailNotSent := CLE."Customer No." + '-' + DimValue.Name;
                end;
            until
            CLE.Next = 0;
        end;
        if EmailsToCopy = '' then
            EmailsToCopy := 'bill@lakshmisri.com'
        else
            if StrPos(EmailsToCopy, 'bill@lakshmisri.com') = 0 then
                EmailsToCopy := EmailsToCopy + ';bill@lakshmisri.com';
    end;


    procedure GetCopyEmails2()
    var
        CLE: Record "Cust. Ledger Entry";
        OldOwnerEmail: Text[100];
        DimValue: Record "Dimension Value";
        TempOw: Text[50];
    begin

        //CLEAR(EmailsToCopy);
        CLE.Reset;
        CLE.SetCurrentKey(OWNER1);
        CLE.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
        CLE.SetRange("Ship-to Contact", "Cust. Ledger Entry"."Ship-to Contact");
        if (StartDate <> 0D) and (EndDate <> 0D) then
            CLE.SetRange("Posting Date", StartDate, EndDate);
        CLE.SetRange(Open, true);
        if CLE.FindFirst then begin
            if CLE."Currency Code" <> '' then
                CrrCode := CLE."Currency Code"
            else
                CrrCode := 'Rs.';
            repeat
                if DimValue.Get('OWNER1', CLE.OWNER1) then;
                Clear(TempOw);
                TempOw := DimValue."Owner_2Email_Outs.";
                if TempOw <> '' then begin
                    if OldOwnerEmail <> TempOw then begin
                        if StrPos(EmailsToCopy, TempOw) = 0 then
                            if EmailsToCopy <> '' then
                                EmailsToCopy := EmailsToCopy + ';' + TempOw
                            else
                                EmailsToCopy := TempOw;
                    end;
                end;
                OldOwnerEmail := TempOw;

            until
            CLE.Next = 0;
        end;
    end;
}

