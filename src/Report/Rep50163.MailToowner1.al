report 50163 "Mail To owner 1"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './res/MailToowner1.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = WHERE("Dimension Code" = FILTER('OWNER1'));

            trigger OnAfterGetRecord()
            var
                ReportRun: Report "Customer Collection Mod";
                Email: Codeunit Email;
                EmailMessage: Codeunit "Email Message";
                TempBlob: Codeunit "Temp Blob";
                OutStr: OutStream;
                InStr: InStream;
                EmailTo: List of [Text];
                EmailScenario: Enum "Email Scenario";
                HtmlBody: Text;
                FileMgmt: Codeunit "File Management";
            //TBD
            /*
            smtpsetup: Record "SMTP Mail Setup";
            SmtpSend: Codeunit "SMTP Mail";
            FileRec: Record File;
            */
            begin
                ReportRun.Setfilters(DateFilter1, EndingDate, "Dimension Value".Code, true);
                TempBlob.CreateOutStream(OutStr);
                ReportRun.SaveAs('', ReportFormat::Excel, OutStr);
                TempBlob.CreateInStream(InStr);

                EmailMessage.Create("Dimension Value".Owner_2Email,
                //EmailMessage.Create('pandurangan1988@gmail.com',
                'Customer collection Report for the period from ' + ' ' + Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);

                EmailMessage.AppendToBody('Dear Sir/Madam,');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('Customer Collection Report is attached for the collection made for the period from' + ' ' +
                                     Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'under your name as "Owner 1" and named as' + "Dimension Value".Code +
                                     ' This report is meant' +
                                    ' for monitoring purpose and the values should not be considered separately for Collection consolidation' +
                                    ' purpose for the Groups as it could amount to duplication of Collection values.');
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
                //TBD
                /*
                ReportRun.SaveAsExcel('C:\WindowTestOwn1\' + "Dimension Value".Code + '.xls');

                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\WindowTestOwn1\');
                FileRec.SetRange("Is a file", true);
                FileRec.SetRange(Name, "Dimension Value".Code + '.xls');
                if FileRec.FindFirst then begin
                    smtpsetup.Get();
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", "Dimension Value".Owner_2Email,
                    'Customer collection Report for the period from ' + ' ' + Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);
                    //SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Receipt Email",
                    //'Customer collection Report for the month of '+' '+ FORMAT(DateFilter1,0,'<Month Text>')+' , '+FORMAT(DateFilter1,0,'<Year4>')+','+'upto'+' '+FORMAT(EndingDate)+' '+'updated'+' until yesterday','',TRUE);

                    SmtpSend.AddCC(smtpsetup."Email Sender Email");

                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Customer Collection Report is attached for the collection made for the period from' + ' ' +
                                         Format(DateFilter1) + ' to ' + ' ' + Format(EndingDate) + ' ' + 'under your name as "Owner 1" and named as' + "Dimension Value".Code +
                                         ' This report is meant' +
                                        ' for monitoring purpose and the values should not be considered separately for Collection consolidation' +
                                        ' purpose for the Groups as it could amount to duplication of Collection values.');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Regards');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('K. Viswanathan');
                    SmtpSend.AddAttachment('C:\WindowTestOwn1\' + "Dimension Value".Code + '.xls', '');
                    SmtpSend.Send;
                end
                */

                /*
                ELSE BEGIN
                FileRec.SETRANGE(Name,"Dimension Value".Code+'.xls');
                IF FileRec.FINDFIRST  THEN BEGIN
                   smtpsetup.GET();
                
                  smtpsetup.GET();
                  SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email","Dimension Value".Owner_2Email,
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
        SMTPRec."Password Key" := SMTPRec."Password 2"; //3K-UPG
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

