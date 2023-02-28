page 50109 "E-Invoicing Information"
{
    PageType = CardPart;
    SourceTable = "Posted Sales Extended";

    layout
    {
        area(content)
        {
            field("IRN No."; Rec."IRN No.")
            {
                ApplicationArea = All;
            }
            field("Ack No."; Rec."Ack No.")
            {
                ApplicationArea = All;
            }
            field("Ack Date"; Rec."Ack Date")
            {
                ApplicationArea = All;
            }
            field("QR Code"; Rec."QR Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

