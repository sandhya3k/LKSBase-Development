xmlport 50090 "Outstanding Information"
{

    schema
    {
        textelement(Root)
        {
            tableelement("Outstanding Information"; "Outstanding Information")
            {
                XmlName = 'Outstanding_Information';
                fieldelement(RTB_No; "Outstanding Information"."RTB No.")
                {
                }
                fieldelement(Doc_No; "Outstanding Information"."Document No.")
                {
                }
                fieldelement(Remaining_Amt; "Outstanding Information"."Remaining Amt.")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    /*
                    IF OutstandingInformation.FIND('+') THEN
                       LineNo := OutstandingInformation."Line No." +10000
                    ELSE
                       LineNo :=10000;
                    */

                    "Outstanding Information"."Posting Date" := Today;
                    OutstandingInformation1.Init;
                    OutstandingInformation1."RTB No." := RTBNo;
                    OutstandingInformation1."Document No." := InvoiceNo;
                    OutstandingInformation1."Remaining Amt." := Amount;
                    OutstandingInformation1."Line No." := LineNo;

                end;
            }
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

    var
        OutstandingInformation: Record "Outstanding Information";
        LineNo: Integer;
        OutstandingInformation1: Record "Outstanding Information";
        RTBNo: Code[20];
        InvoiceNo: Code[20];
        Amount: Decimal;
}

