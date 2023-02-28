pageextension 50117 pageextension50117 extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Posted Shipment Nos.")
        {
            field("Collection No."; Rec."Collection No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

