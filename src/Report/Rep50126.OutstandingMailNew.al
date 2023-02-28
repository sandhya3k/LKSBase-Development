report 50126 "Outstanding Mail New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/OutstandingMailNew.rdlc';

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = SORTING("Dimension Code", Code) ORDER(Ascending) WHERE("Dimension Code" = FILTER('OWNER2'), Code = FILTER('ALOK.YADAV'));

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
                ReportRun.SaveAsExcel('C:\outstanding Invoice(group Head)\' + "Dimension Value".Code + '.xls');
                */

                /*
                FileRec.RESET;
                FileRec.SETRANGE(Path,'C:\outstanding Invoice(group Head)\');
                FileRec.SETRANGE("Is a file",TRUE);
                FileRec.SETRANGE(Name,"Dimension Value".Code+'.xls');
                IF FileRec.FINDFIRST THEN BEGIN
                  smtpsetup.GET();
                  SmtpSend.CreateMessage(smtpsetup."Email Sender Name",smtpsetup."Email Sender Email",smtpsetup."Receipt Email",
                  'RE: Outstanding statement for the period ending'+' '+FORMAT(EndingDate)+' '+'updated'+' until yesterday','',TRUE);
                  SmtpSend.AddCC(smtpsetup."Email Sender Email");
                  SmtpSend.AppendBody('Dear Sir/Madam,');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('Outstanding Statement of Account of all the clients for the period ending'+' '+
                                       FORMAT(EndingDate) +' '+'reflected under your name as '+ "Dimension Value".Code+' '+'is attached');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('Regards');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('<br><br>');
                  SmtpSend.AppendBody('K. Viswanathan');
                //  SmtpSend.AppendBody('<br><br>');
                //  SmtpSend.AppendBody('=================');
                //  SmtpSend.AppendBody('<br><br>');
                //  SmtpSend.AppendBody('=================');
                  SmtpSend.AddAttachment('C:\Outstanding Invoice\'+"Dimension Value".Code+'.xls');
                  SmtpSend.Send;
                END;
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

