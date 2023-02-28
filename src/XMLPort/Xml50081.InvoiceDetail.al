xmlport 50081 "Invoice Detail"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Invoice Header"; "Sales Invoice Header")
            {
                XmlName = 'Sales_Inv_Head';
                fieldelement(Pre_Assigned_No; "Sales Invoice Header"."Pre-Assigned No.")
                {
                }
                fieldelement(No; "Sales Invoice Header"."No.")
                {
                }
                //TBD
                /*
                fieldelement(Amt_To_Cust; "Sales Invoice Header"."Amount to Customer")
                {
                }
                */
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
        AutoFileName: Text[50];
        SalesInvHeader: Record "Sales Invoice Header";
}

