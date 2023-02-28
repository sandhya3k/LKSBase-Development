xmlport 50082 "CREDIT NOTE"
{
    Direction = Export;
    FileName = 'y:\RTB.CSV';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
            {
                XmlName = 'Sales_Cr_Memo_Header';
                fieldelement(No; "Sales Cr.Memo Header"."No.")
                {
                }
                fieldelement(Pre_Assigned_No; "Sales Cr.Memo Header"."Pre-Assigned No.")
                {
                }
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
}

