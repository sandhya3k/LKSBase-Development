report 50125 "Outstanding Mail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/OutstandingMail.rdlc';

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
            begin
                //TBD
                /*
                ReportRun.Setfilters(DateFilter1, EndingDate, "Dimension Value".Code);
                ReportRun.SaveAsExcel('C:\Outstanding Invoice\' + "Dimension Value".Code + '.xls');
                
                FileRec.Reset;
                FileRec.SetRange(Path, 'C:\Outstanding Invoice\');
                FileRec.SetRange("Is a file", true);
                FileRec.SetRange(Name, "Dimension Value".Code + '.xls');
                if FileRec.FindFirst then begin
                    smtpsetup.Get();
                    SmtpSend.CreateMessage(smtpsetup."Email Sender Name", smtpsetup."Email Sender Email", "Dimension Value".Owner_2Email,
                    'RE: Outstanding statement for the period ending' + ' ' + Format(EndingDate) + ' ' + 'updated' + ' until yesterday', '', true);
                    SmtpSend.AddCC(smtpsetup."Email Sender Email");
                    SmtpSend.AppendBody('Dear Sir/Madam,');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Outstanding Statement of Account of all the clients for the period ending' + ' ' +
                                         Format(EndingDate) + ' ' + 'reflected under your name as ' + "Dimension Value".Code + ' ' + 'is attached');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('Regards');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('<br><br>');
                    SmtpSend.AppendBody('K. Viswanathan');
                    SmtpSend.AddAttachment('', 'C:\Outstanding Invoice\' + "Dimension Value".Code + '.xls');
                    SmtpSend.Send;
                end;

                //TBD //Clear(ReportRun);
                */
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

    var

        DateFilter1: Date;
        EndingDate: Date;
}

