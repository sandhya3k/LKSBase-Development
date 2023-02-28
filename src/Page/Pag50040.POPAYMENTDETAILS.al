page 50040 "PO PAYMENT DETAILS"
{
    PageType = Card;
    SourceTable = "PO Information";

    layout
    {
        area(content)
        {
            field("Posted Document No."; Rec."Posted Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            repeater(Control1000000000)
            {
                Editable = false;
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
                field("Document No."; Rec."Document No.")
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
                field("Line No."; Rec."Line No.")
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

