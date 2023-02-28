pageextension 50002 pageextension50002 extends "Countries/Regions"
{
    layout
    {
        addafter("VAT Scheme")
        {
            field("Country Code for E Invoicing"; rec."Country Code for E Invoicing")
            {
                ApplicationArea = All;
            }
        }
    }
}

