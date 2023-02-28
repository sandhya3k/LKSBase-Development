report 50127 "Mail To Group Head"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    // RDLCLayout = './res/MailToGroupHead.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = WHERE("Dimension Code" = FILTER('GROUPHEAD'));

            trigger OnAfterGetRecord()
            var
                ReportRun: Report "Cusotmer Collection_mod";
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
                ReportRun.Setfilters(DateFilter1, EndingDate, "Dimension Value".Code, "Dimension Value".Code, false);
                //3K
                TempBlob.CreateOutStream(OutStr);
                ReportRun.SaveAs('', ReportFormat::Excel, OutStr);
                TempBlob.CreateInStream(InStr);

                EmailMessage.Create("Dimension Value"."Group_Head Email",
                //EmailMessage.Create('pandurangan1988@gmail.com',
                'Customer collection Report for the period from ' + ' ' + Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);
                EmailMessage.AppendToBody('Dear Sir/Madam,');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('Customer Collection Report in the subject matter is attached for the collection made for the period from' + ' ' +
                                     Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'under your group as ' + "Dimension Value".Name);
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
                ReportRun.SaveAsExcel('C:\Group head collection\' + "Dimension Value".Name + '.xls');

                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\Group head collection\');
                FileRec.SetRange("Is a file", true);
                FileRec.SetRange(Name, "Dimension Value".Name + '.xls');
                if FileRec.FindFirst then begin
                    smtpsetup.Get();
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", "Dimension Value"."Group_Head Email",
                    'Customer collection Report for the period from ' + ' ' + Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);
                    //SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Receipt Email",
                    //'Customer collection Report for the month of '+' '+ FORMAT(DateFilter1,0,'<Month Text>')+' , '+FORMAT(DateFilter1,0,'<Year4>')+','+'upto'+' '+FORMAT(EndingDate)+' '+'updated'+' until yesterday','',TRUE);

                    SmtpSend.AddCC(smtpsetup."Email Sender Email");

                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Customer Collection Report in the subject matter is attached for the collection made for the period from' + ' ' +
                                         Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'under your group as ' + "Dimension Value".Name);
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Regards');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('K. Viswanathan');
                    SmtpSend.AddAttachment('C:\Group head collection\' + "Dimension Value".Name + '.xls', '');
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
        //TBD
        /*
        SMTPRec.Get;
        SMTPRec."User ID" := 'viswa.accounts@lakshmisri.com';
        SMTPRec."Email Sender Email" := 'viswa.accounts@lakshmisri.com';
        SMTPRec."Email Sender Name" := 'Accounts';
        //TBD //SMTPRec.Password := SMTPRec."Password 2";
        SMTPRec."Password Key" := SMTPRec."Password 2"; //3k-UPG
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
}

