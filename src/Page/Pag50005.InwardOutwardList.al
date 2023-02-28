page 50005 "Inward/Outward List"
{
    PageType = Card;
    SourceTable = "Inward/Outward";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Amount to Customer"; Rec."Amount to Customer")
                {
                    ApplicationArea = All;
                }
                field("Courier No."; Rec."Courier No.")
                {
                    ApplicationArea = All;
                }
                field("Date of Delivery at Client"; Rec."Date of Delivery at Client")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
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

