pageextension 50036 pageextension50036 extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No.")
        {
            field("Pre-Assigned No."; rec."Pre-Assigned No.")
            {
                ApplicationArea = All;
                Caption = 'RTB No.';
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field("Ship-to Address"; Rec."Ship-to Address")
            {
                ApplicationArea = All;
            }
            field("Ship-to Address 2"; Rec."Ship-to Address 2")
            {
                ApplicationArea = All;
            }
            field("Ship-to City"; Rec."Ship-to City")
            {
                ApplicationArea = All;
            }
        }
        addafter(Amount)
        {
            field("User ID"; rec."User ID")
            {
                ApplicationArea = All;
            }
        }
    }
}

