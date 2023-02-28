page 50032 "PO Information"
{
    PageType = Card;
    SourceTable = "PO Information";

    layout
    {
        area(content)
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Posting  Date"; Rec."Posting  Date")
                {
                    ApplicationArea = All;
                }
                field("PO Date"; Rec."PO Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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

