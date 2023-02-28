report 50141 "Outstanding Bill Mail Owner"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './res/OutstandingBillMailOwner.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = ORDER(Ascending) WHERE("Dimension Code" = FILTER('OWNER2'));

            trigger OnAfterGetRecord()
            var
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
                ReportRun.Setfilters(DateFilter1, EndingDate, "Dimension Value".Code, '', '');
                //3K 
                TempBlob.CreateOutStream(OutStr);
                ReportRun.SaveAs('', ReportFormat::Excel, OutStr);
                TempBlob.CreateInStream(InStr);

                EmailMessage.Create("Dimension Value".Owner_2Email,
                //EmailMessage.Create('pandurangan1988@gmail.com',
                                'RE: Bill Report Including Credit Note for the For the period from' + ' ' + FORMAT(DateFilter1) + ' '
                                + 'to ' + FORMAT(EndingDate), '', TRUE);

                EmailMessage.AppendToBody('Dear Sir/Madam,');
                EmailMessage.AppendToBody('<br><br>');
                EmailMessage.AppendToBody('Bills and CRN Report is attached for the Bills and Credit Notes Generated for the period from' + ' ' + FORMAT(DateFilter1) + ' to '
                                     + FORMAT(EndingDate) + ' ' + 'reflected under your name as ' + "Dimension Value".Code + '. ');
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
                ReportRun.SaveAsExcel('C:\Bill_CRN_Merged_Report\' + "Dimension Value".Code + '.xls');
                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\Bill_CRN_Merged_Report\');
                FileRec.SetRange("Is a file", true);
                FileRec.SetRange(Name, "Dimension Value".Code + '.xls');
                if FileRec.FindFirst then begin
                    smtpsetup.Get();
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", "Dimension Value".Owner_2Email,
                    'RE: Bill Report Including Credit Note for the For the period from' + ' ' + Format(DateFilter1) + ' '
                    + 'to ' + Format(EndingDate), '', true);
                    //SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Receipt Email",
                    //'RE: Bill Report Including Credit Note for the For the Month'+' '+FORMAT(EndingDate,0,'<Month Text>')+' '
                    //+'updated'+' until ' + FORMAT(EndingDate),'',TRUE);

                    SmtpSend.AddCC(smtpsetup."Email Sender Email");
                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Bills and CRN Report is attached for the Bills and Credit Notes Generated for the period from' + ' ' + Format(DateFilter1) + ' to '
                                         + Format(EndingDate) + ' ' + 'reflected under your name as ' + "Dimension Value".Code + '. ');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Regards');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('K. Viswanathan');
                    SmtpSend.AddAttachment('C:\Bill_CRN_Merged_Report\' + "Dimension Value".Code + '.xls', '');
                    SmtpSend.Send;
                end;
                */

                Clear(ReportRun);
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
        ReportRun: Report "Merged Bill and CRN";
        DateFilter1: Date;
        EndingDate: Date;
}

