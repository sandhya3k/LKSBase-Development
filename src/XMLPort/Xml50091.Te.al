xmlport 50091 Te
{

    schema
    {
        textelement(Root)
        {
            tableelement("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                XmlName = 'CustLedgerEntry';
                fieldelement("RtbNo."; "Cust. Ledger Entry"."RTBNo.")
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

