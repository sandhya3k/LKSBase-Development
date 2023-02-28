report 50172 "Email Dig Sign"
{
    // IF DimenValue.GET(SalesInvHeader."Owner 2") THEN;
    //     IF EmailsToCopy <> '' THEN
    //       EmailsToCopy := EmailsToCopy + ';' + DimenValue."Owner_2Email_Outs." + ';' + 'bill@lakshmisri.com'
    //     ELSE
    //       EmailsToCopy := DimenValue."Owner_2Email_Outs." + ';' + 'bill@lakshmisri.com';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/EmailDigSign.rdlc';


    dataset
    {
        dataitem("Integer"; "Integer")
        {

            trigger OnAfterGetRecord()
            var
                NameT: Text[30];
                DimenValue: Record "Dimension Value";
                Owner1Email: Text[40];
                Owner2Email: Text[40];
                CustRec: Record Customer;
                //TBD SmtpSend: Codeunit "SMTP Mail";
                DimSetentry: Record "Dimension Set Entry";
                NameofTheFile: Text[100];
                CrrCo: Code[20];
                Email: Codeunit Email;
                EmailMessage: Codeunit "Email Message";
                TempBlob: Codeunit "Temp Blob";
                OutStr: OutStream;
                InStr: InStream;
                EmailTo: List of [Text];
                EmailScenario: Enum "Email Scenario";
                HtmlBody: Text;
                FileMgmt: Codeunit "File Management";
            begin
                Clear(ContactEmail);
                Clear(Owner2);
                Clear(Owner1);

                I += 1;
                //TBD
                /*
                if I <> 1 then
                    FileRec.Next;

                NameofTheFile := FileRec.Name;
                NameT := FileRec.Name;
                */
                NameT := ConvertStr(NameT, '.', ',');
                NameT := SelectStr(1, NameT);
                SalesInvHeader.Get(NameT);


                ContactR.Reset;
                ContactR.SetRange(ContactR."No.", SalesInvHeader."Bill-to Contact No.");
                if ContactR.Find('-') then begin
                    ContactEmail := ContactR."E-Mail";
                end;

                if DimensionSetEntryRec.Get(SalesInvHeader."Dimension Set ID", 'OWNER1') then
                    Owner1 := DimensionSetEntryRec."Dimension Value Code";
                if DimensionSetEntryRec.Get(SalesInvHeader."Dimension Set ID", 'OWNER2') then
                    Owner2 := DimensionSetEntryRec."Dimension Value Code";

                //CustRec.GET(SalesInvHeader."Sell-to Customer No.");
                //IF CustRec."E-Mail" <> '' THEN BEGIN
                if ContactEmail <> '' then begin
                    //TBD smtpsetup.Get();

                    if DimenValue.Get('OWNER1', Owner1) then;
                    EmailsToCopy := DimenValue.Owner_2Email;

                    if DimenValue.Get('OWNER2', Owner2) then;
                    if EmailsToCopy <> '' then
                        EmailsToCopy := EmailsToCopy + ';' + DimenValue.Owner_2Email + ';' + 'bill@lakshmisri.com'
                    else
                        EmailsToCopy := DimenValue.Owner_2Email + ';' + 'bill@lakshmisri.com';



                    DimSetentry.Reset;
                    DimSetentry.SetRange("Dimension Set ID", SalesInvHeader."Dimension Set ID");
                    DimSetentry.SetRange("Dimension Code", 'CASE');
                    if DimSetentry.FindFirst then;
                    //TBD //SalesInvHeader.CalcFields("Amount to Customer");
                    if SalesInvHeader."Currency Code" = '' then
                        CrrCo := 'INR'
                    else
                        CrrCo := SalesInvHeader."Currency Code";


                    //3K
                    //EmailMessage.Create(ContactEmail, 
                    EmailMessage.Create('pandurangan1988@gmail.com',
                        //3K 'Invoice No. ' + SalesInvHeader."No." +  ' of ' + CustRec.Name + ', Curr. Code - ' + CrrCo +', Amount - ' + FORMAT(SalesInvHeader."Amount to Customer") + ', Case Id - ' + DimSetentry."Dimension Value Code",'',TRUE);
                        'Invoice No. ' + SalesInvHeader."No." + ' of ' + CustRec.Name + ', Curr. Code - ' + CrrCo + ', Amount - ' + FORMAT(0) + ', Case Id - ' + DimSetentry."Dimension Value Code", '', TRUE);
                    EmailMessage.AppendToBody('Dear Sir/Madam,');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('A digitally signed original invoice in terms of Section 31 of CGST Act 2017 read with Rule 46 of CGST Rules 2017, ');
                    EmailMessage.AppendToBody(' towards service rendered by us is attached herewith. Please go through the invoice and if found in order, release the payment at the earliest. ');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('It may also be noted that as per section 13 (Time of Supply of services) of the Central Goods and Services Tax (CGST)');
                    EmailMessage.AppendToBody('Act, 2017, the time of supply in case of supplies in respect of which tax is paid or liable to be paid on reverse charge basis');
                    EmailMessage.AppendToBody(', shall be the earlier of the following dates, namely:–– (a)');
                    EmailMessage.AppendToBody('the date of payment as entered in the books of account of the recipient or the date on which the payment is debited in his bank account, whichever is earlier or (b) the date immediately following sixty days from the');
                    EmailMessage.AppendToBody(' date of issue of invoice or any other document, by whatever name called, in lieu thereof by the supplier.');
                    EmailMessage.AppendToBody('The services provided by a firm of advocates by way of legal services, directly or indirectly, ');
                    EmailMessage.AppendToBody('attracts GST under reverse charge and it may be noted that in terms of the said section 13, ');
                    EmailMessage.AppendToBody('the liability to pay GST on such services shall arise not later than the sixty first day from the date of issue of invoice by the law firm.');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('Kindly acknowledge receipt of this mail and invoice.');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('Thank you for your support and cooperation.');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('Accounts Section');
                    EmailMessage.AppendToBody('<br>');
                    EmailMessage.AppendToBody('Lakshmikumaran & Sridharan');
                    EmailMessage.AppendToBody('<br>');
                    EmailMessage.AppendToBody('B6/10, Safdarjung Enclave, New Delhi - 110029');
                    EmailMessage.AppendToBody('<br>');
                    EmailMessage.AppendToBody('Telephone: 011-41400501 to 41400505');

                    //FileMgmt.BLOBExport(TempBlob, "Dimension Value".Code + '.xls', true);
                    //PANDU if TempBlob.Length() > 0 then
                    //PANDU EmailMessage.AddAttachment("Dimension Value".Code, 'xls', InStr);
                    if EmailMessage.Attachments_First() then
                        if not Email.Send(EmailMessage, EmailScenario::Default) then
                            Error(GetLastErrorText());//3K END
                    //TBD
                    /*
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", ContactEmail,
                    //TBD //'Invoice No. ' + SalesInvHeader."No." + ' of ' + CustRec.Name + ', Curr. Code - ' + CrrCo + ', Amount - ' + Format(SalesInvHeader."Amount to Customer") + ', Case Id - ' + DimSetentry."Dimension Value Code", '', true);
                    'Invoice No. ' + SalesInvHeader."No." + ' of ' + CustRec.Name + ', Curr. Code - ' + CrrCo + ', Amount - ' + ', Case Id - ' + DimSetentry."Dimension Value Code", '', true);


                    //SmtpSend.AddCC('bhupendra.bhakuni@lakshmisri.com');
                    SmtpSend.AddCC(EmailsToCopy);
                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('A digitally signed original invoice in terms of Section 31 of CGST Act 2017 read with Rule 46 of CGST Rules 2017, ');
                    SmtpSend.AppendBody(' towards service rendered by us is attached herewith. Please go through the invoice and if found in order, release the payment at the earliest. ');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('It may also be noted that as per section 13 (Time of Supply of services) of the Central Goods and Services Tax (CGST)');
                    SmtpSend.AppendBody('Act, 2017, the time of supply in case of supplies in respect of which tax is paid or liable to be paid on reverse charge basis');
                    SmtpSend.AppendBody(', shall be the earlier of the following dates, namely:–– (a)');
                    SmtpSend.AppendBody('the date of payment as entered in the books of account of the recipient or the date on which the payment is debited in his bank account, whichever is earlier or (b) the date immediately following sixty days from the');
                    SmtpSend.AppendBody(' date of issue of invoice or any other document, by whatever name called, in lieu thereof by the supplier.');
                    SmtpSend.AppendBody('The services provided by a firm of advocates by way of legal services, directly or indirectly, ');
                    SmtpSend.AppendBody('attracts GST under reverse charge and it may be noted that in terms of the said section 13, ');
                    SmtpSend.AppendBody('the liability to pay GST on such services shall arise not later than the sixty first day from the date of issue of invoice by the law firm.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Kindly acknowledge receipt of this mail and invoice.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Thank you for your support and cooperation.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Accounts Section');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('Lakshmikumaran & Sridharan');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('B6/10, Safdarjung Enclave, New Delhi - 110029');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('Telephone: 011-41400501 to 41400505');

                    SmtpSend.AddAttachment('C:\Final_SalesInvoices_CreditNote Signed\' + NameofTheFile, 'Invoice.pdf');
                    SmtpSend.Send;
                    */
                end else begin
                    //TBD smtpsetup.Get();

                    if DimenValue.Get('OWNER1', Owner1) then;
                    EmailsToCopy := DimenValue.Owner_2Email;

                    if DimenValue.Get('OWNER2', Owner2) then begin
                        if EmailsToCopy <> '' then
                            EmailsToCopy := EmailsToCopy + ';' + DimenValue.Owner_2Email
                        else
                            EmailsToCopy := DimenValue.Owner_2Email;
                    end;


                    DimSetentry.Reset;
                    DimSetentry.SetRange("Dimension Set ID", SalesInvHeader."Dimension Set ID");
                    DimSetentry.SetRange("Dimension Code", 'CASE');
                    if DimSetentry.FindFirst then;
                    //TBD //SalesInvHeader.CalcFields("Amount to Customer");
                    if SalesInvHeader."Currency Code" = '' then
                        CrrCo := 'INR'
                    else
                        CrrCo := SalesInvHeader."Currency Code";

                    //TBD
                    /*
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", EmailsToCopy,
                    //TBD //'Invoice No. ' + SalesInvHeader."No." + ' of ' + CustRec.Name + ', Curr. Code - ' + SalesInvHeader."Currency Code" + ', Amount - ' + Format(SalesInvHeader."Amount to Customer") + ', Case Id - ' + DimSetentry."Dimension Value Code", '', true);
                    'Invoice No. ' + SalesInvHeader."No." + ' of ' + CustRec.Name + ', Curr. Code - ' + SalesInvHeader."Currency Code" + ', Amount - ' + ', Case Id - ' + DimSetentry."Dimension Value Code", '', true);
                    //SmtpSend.AddCC('bhupendra.bhakuni@lakshmisri.com');
                    SmtpSend.AddCC('bill@lakshmisri.com;Accounts@lakshmisri.com');
                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('A digitally signed original invoice in terms of Section 31 of CGST Act 2017 read with Rule 46 of CGST Rules 2017, ');
                    SmtpSend.AppendBody(' towards service rendered by us is attached herewith. Please go through the invoice and if found in order, release the payment at the earliest. ');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('It may also be noted that as per section 13 (Time of Supply of services) of the Central Goods and Services Tax (CGST)');
                    SmtpSend.AppendBody('Act, 2017, the time of supply in case of supplies in respect of which tax is paid or liable to be paid on reverse charge basis');
                    SmtpSend.AppendBody(', shall be the earlier of the following dates, namely:–– (a)');
                    SmtpSend.AppendBody('the date of payment as entered in the books of account of the recipient or the date on which the payment is debited in his bank account, whichever is earlier or (b) the date immediately following sixty days from the');
                    SmtpSend.AppendBody(' date of issue of invoice or any other document, by whatever name called, in lieu thereof by the supplier.');
                    SmtpSend.AppendBody('The services provided by a firm of advocates by way of legal services, directly or indirectly, ');
                    SmtpSend.AppendBody('attracts GST under reverse charge and it may be noted that in terms of the said section 13, ');
                    SmtpSend.AppendBody('the liability to pay GST on such services shall arise not later than the sixty first day from the date of issue of invoice by the law firm.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Kindly acknowledge receipt of this mail and invoice.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Thank you for your support and cooperation.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Accounts Section');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('Lakshmikumaran & Sridharan');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('B6/10, Safdarjung Enclave, New Delhi - 110029');
                    SmtpSend.AppendBody('<br>');
                    SmtpSend.AppendBody('Telephone: 011-41400501 to 41400505');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('No Contact E-mail ID for this Invoice. Hence this E-mail is sent to Owner 1 and Owner 2 with the request to get this Invoice delivered to the Client and to update Client E-mail ID in the system.');
                    SmtpSend.AddAttachment('C:\Final_SalesInvoices_CreditNote Signed\' + NameofTheFile, 'Invoice.pdf');
                    SmtpSend.Send;
                    */
                end;
            end;

            trigger OnPreDataItem()
            begin
                //TBD
                /*
                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\Final_SalesInvoices_CreditNote Signed\');
                FileRec.SetRange("Is a file", true);
                Integer.SetRange(Number, 1, FileRec.Count);
                if FileRec.FindFirst then;
                */
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    var
    //TBD SMTPRec: Record "SMTP Mail Setup";
    begin
        if (UpperCase(UserId) <> 'LSLAW\BHUPENDER') and (UpperCase(UserId) <> 'LSLAW\KUMAR.S') and (UpperCase(UserId) <> 'LSLAW\K.VISWANATHAN') then
            Error('You can not run the report');

        //TBD 
        /*
        EmailUserDI := SMTPRec."User ID";
        //TBD //EmailPass := SMTPRec.Password;
        SenderUserName := SMTPRec."Email Sender Name";
        SMTPRec.Get;
        SMTPRec."User ID" := 'noreply@lakshmisri.com';
        SMTPRec."Email Sender Email" := 'noreply@lakshmisri.com';
        SMTPRec."Email Sender Name" := 'Noreply';
        //TBD //SMTPRec.Password := 'Nr@12345';
        SMTPRec.Modify
        */
    end;

    var
        //TBD FileRec: Record File;
        I: Integer;
        EmailsToCopy: Text;
        SalesInvHeader: Record "Sales Invoice Header";
        EmailUserDI: Text[50];
        EmailPass: Text[50];
        SenderUserName: Text[50];
        //TBD smtpsetup: Record "SMTP Mail Setup";
        ContactR: Record Contact;
        ContactEmail: Text;
        DimensionSetEntryRec: Record "Dimension Set Entry";
        Owner1: Code[30];
        Owner2: Code[30];
}

