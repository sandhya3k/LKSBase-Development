page 50111 "EInvoice Info"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Posted Sales Extended";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posted Document Type"; Rec."Posted Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
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
                field("Cancel Remarks"; Rec."Cancel Remarks")
                {
                    ApplicationArea = All;
                }
                field("QR Code"; Rec."QR Code")
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

