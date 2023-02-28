xmlport 50083 "Cancelled RTB"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'nAutoFileName';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Header"; "Sales Header")
            {
                XmlName = 'Sales_Header';
                SourceTableView = WHERE (Cancelled = FILTER (true));
                fieldelement(No; "Sales Header"."No.")
                {
                }
                textelement(value1)
                {
                    XmlName = 'Cancelled';
                }
                fieldelement(Posting_Description; "Sales Header"."Posting Description")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    nAutoFileName := CopyStr("Sales Header"."No.", 1, 15);
                    nAutoFileName := 'O:\' + nAutoFileName + '.CSV';
                    currXMLport.Filename(nAutoFileName);
                    Value1 := '1';
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
        nAutoFileName: Text[30];
        Value: Integer;
}

