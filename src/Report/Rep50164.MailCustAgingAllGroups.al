report 50164 "Mail Cust. Aging (All Groups)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './res/MailCustAgingAllGroups.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {

            trigger OnAfterGetRecord()
            var
                ReportRun: Report "Customer Detailed Aging Email2";
                //TBD
                /*
                smtpsetup: Record "SMTP Mail Setup";
                SmtpSend: Codeunit "SMTP Mail";
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
            begin
                //ReportRun.Setfilters(DateFilter1,EndingDate,'','',"Dimension Value".Code);
                //MESSAGE('%1  %2',FilterType,"Dimension Value".Code);
                ReportRun.SetFilter(FilterType, "Dimension Value".Code, "Dimension Value".Code, "Dimension Value".Code, "Dimension Value".Code,
                 DateFilter1, EndingDate, EndingDateLimitTotal);
                Clear(FolderCaption);
                GetFolderCaption;
                //3K
                TempBlob.CreateOutStream(OutStr);
                ReportRun.SaveAs('', ReportFormat::Excel, OutStr);
                TempBlob.CreateInStream(InStr);


                if (FilterType = FilterType::Owner2) or (FilterType = FilterType::Owner1) then
                    EmailToSent := "Dimension Value".Owner_2Email
                else
                    EmailToSent := "Dimension Value"."Group_Head Email";

                EmailMessage.Create(EmailToSent,
                //EmailMessage.Create('pandurangan1988@gmail.com',
                'Clients Otstanding Report for the period ending ' + ' ' + FORMAT(EndingDate) + ' ' + 'updated' + ' until yesterday', '', TRUE);

                EmailMessage.AppendToBody('Dear Sir/Madam,');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('Clients Outstanding Report is attached for the period ending' + ' ' +
                                     FORMAT(EndingDate) + ' ' + 'under your name as ' + "Dimension Value".Name);
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('Regards');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('K. Viswanathan');

                //FileMgmt.BLOBExport(TempBlob, "Dimension Value".Code + '.xls', true);
                if TempBlob.Length() > 0 then
                    EmailMessage.AddAttachment("Dimension Value".Code + '.xlsx', '.xlsx', InStr);
                if EmailMessage.Attachments_First() then
                    if not Email.Send(EmailMessage, EmailScenario::Default) then
                        Error(GetLastErrorText());

                //3K END
                //TBD
                /*
                ReportRun.SaveAsExcel('C:\' + FolderCaption + '\' + "Dimension Value".Name + '.xls');
                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\' + FolderCaption + '\');
                FileRec.SetRange("Is a file", true);
                FileRec.SetRange(Name, "Dimension Value".Name + '.xls');
                if FileRec.FindFirst then begin
                    smtpsetup.Get();
                    if (FilterType = FilterType::Owner2) or (FilterType = FilterType::Owner1) then
                        EmailToSent := "Dimension Value".Owner_2Email
                    else
                        EmailToSent := "Dimension Value"."Group_Head Email";
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", EmailToSent,
                    'Clients Otstanding Report for the period ending ' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);
                    //SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Receipt Email",
                    //'Billing Including Credit Note Report for the month of '+' '+ FORMAT(DateFilter1,0,'<Month Text>')+' , '+FORMAT(DateFilter1,0,'<Year4>')+','+'upto'+' '+FORMAT(EndingDate)+' '+'updated'+' until yesterday','',TRUE);

                    SmtpSend.AddCC(smtpsetup."Email Sender Email");

                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Clients Outstanding Report is attached for the period ending' + ' ' +
                                         Format(EndingDate) + ' ' + 'under your name as ' + "Dimension Value".Name);
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Regards');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('K. Viswanathan');
                    SmtpSend.AddAttachment('C:\' + FolderCaption + '\' + "Dimension Value".Name + '.xls', '');
                    SmtpSend.Send;
                end
                */

                /*
                ELSE BEGIN
                FileRec.SETRANGE(Name,"Dimension Value".Code+'.xls');
                IF FileRec.FINDFIRST  THEN BEGIN
                   smtpsetup.GET();
                
                  smtpsetup.GET();
                  SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Email Sender Email",
                  'Customer collection Report for the month of '+' '+ FORMAT(DateFilter1,0,'<Month Text>')+' , '+FORMAT(DateFilter1,0,'<Year4>')+','+'upto'+' '+FORMAT(EndingDate)+' '+'updated'+' until yesterday','',TRUE);
                  SmtpSend.AddCC(smtpsetup."Email Sender Email");
                
                  SmtpSend.AppendBody('Dear Sir/Madam,');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('Customer Collection Report in the subject matter is attached for the collection made for this month upto'+' '+
                                       FORMAT(EndingDate) +' '+'under your name as '+ "Dimension Value".Code);
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('Regards');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('K. Viswanathan');
                
                  SmtpSend.Send;
                END;
                */

            end;

            trigger OnPostDataItem()
            begin
                /*FileRec.SETRANGE(Path,'C:\WindowTest');
                IF FINDFIRST THEN
                  REPEAT
                    ERASE;
                  UNTIL
                  FileRec.NEXT = 0;  */

            end;

            trigger OnPreDataItem()
            begin
                //"Dimension Value".SETRANGE(Code,'AMIT.JAIN');
                case FilterType of
                    FilterType::Owner2:
                        SetFilter("Dimension Code", 'OWNER2');
                    FilterType::GroupHead:
                        SetFilter("Dimension Code", 'GROUPHEAD');
                    FilterType::SubGroup:
                        SetFilter("Dimension Code", 'SUBGRP-OWNER2');
                    FilterType::Owner1:
                        SetFilter("Dimension Code", 'OWNER1');
                end;
                Message('ok');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1000000001)
                {
                    ShowCaption = false;
                    field("Starting Date"; DateFilter1)
                    {
                        ApplicationArea = All;
                    }
                    field("Ending Date"; EndingDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Ending Date (Limit Total)"; EndingDateLimitTotal)
                    {
                        ApplicationArea = All;
                    }
                    field("Filter Type"; FilterType)
                    {
                        ApplicationArea = All;
                    }
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

    trigger OnPreReport()
    var
    //TBD SMTPRec: Record "SMTP Mail Setup";
    begin

        if FilterType = FilterType::" " then
            Error('Filter Type must have a value');
        //TBD
        /*
        SMTPRec.Get;
        SMTPRec."User ID" := 'viswa.accounts@lakshmisri.com';
        SMTPRec."Email Sender Email" := 'viswa.accounts@lakshmisri.com';
        SMTPRec."Email Sender Name" := 'Accounts';
        //TBD //SMTPRec.Password := SMTPRec."Password 2";
        SMTPRec."Password Key" := SMTPRec."Password 2";
        SMTPRec.Modify
        */
    end;

    trigger OnPostReport()
    begin
        message('The report has been processed successfully');
    end;

    var
        DateFilter1: Date;
        EndingDate: Date;
        FilterType: Option " ",Owner2,GroupHead,SubGroup,Owner1;
        FolderCaption: Text[50];
        EmailToSent: Text[50];
        EndingDateLimitTotal: Date;

    local procedure GetFolderCaption()
    begin
        case FilterType of
            FilterType::Owner2:
                FolderCaption := 'Outstanding Invoice';
            FilterType::GroupHead:
                FolderCaption := 'outstanding Invoice(group Head)';
            FilterType::SubGroup:
                FolderCaption := 'Outstanding Invoice(Sub Group)';
            FilterType::Owner1:
                FolderCaption := 'Outstanding Invoice(Owner1)';
        end;
    end;
}

