xmlport 50085 "CRTB Information"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'AutoFileName';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
            {
                XmlName = 'Sales_Cr_Memo_Header';
                fieldelement(Pre_Assgined_No; "Sales Cr.Memo Header"."Pre-Assigned No.")
                {
                }
                fieldelement(No; "Sales Cr.Memo Header"."No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*
                    AutoFileName:=COPYSTR("Sales Cr.Memo Header"."Pre-Assigned No.",1,15);
                    AutoFileName:='O:\'+AutoFileName+'.CSV';
                    currXMLport.FILENAME(AutoFileName);
                    */

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
        AutoFileName: Text[30];
}

