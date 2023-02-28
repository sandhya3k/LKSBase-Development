page 50060 "Posted RTB Lines"
{
    PageType = Card;
    SourceTable = "Sales Invoice Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                //TBD
                /*
                field("Amount To Customer"; Rec."Amount To Customer")
                {ApplicationArea = All;
                }
                */
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field("Other Detail 1"; Rec."Other Detail 1")
                {
                    ApplicationArea = All;
                }
                field("Other Detail 2"; Rec."Other Detail 2")
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

