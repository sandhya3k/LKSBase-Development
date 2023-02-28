pageextension 50004 pageextension50004 extends "General Ledger Setup"
{
    layout
    {
        addafter("Check G/L Account Usage")
        {
            field("Amount Rounding Precision"; Rec."Amount Rounding Precision")
            {
                ApplicationArea = All;
            }
            field("Amount Decimal Places"; Rec."Amount Decimal Places")
            {
                ApplicationArea = All;
            }
        }
        addafter("Adjust for Payment Disc.")
        {
            field("Customer Aging Email User ID"; Rec."Customer Aging Email User ID")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 8 Code")
        {
            field("Shortcut Dimension 9 Code"; Rec."Shortcut Dimension 9 Code")
            {
                ApplicationArea = All;
                Caption = 'Forum';
            }
            field("Shortcut Dimension 10 Code"; Rec."Shortcut Dimension 10 Code")
            {
                ApplicationArea = All;
                Caption = 'Forum City';
            }
            field("Shortcut Dimension 11 Code"; Rec."Shortcut Dimension 11 Code")
            {
                ApplicationArea = All;
                Caption = 'Group';
            }
            field("Shortcut Dimension 12 Code"; Rec."Shortcut Dimension 12 Code")
            {
                ApplicationArea = All;
                Caption = 'Owner 1';
            }
            field("Shortcut Dimension 13 Code"; Rec."Shortcut Dimension 13 Code")
            {
                ApplicationArea = All;
                Caption = 'Owner 2';
            }
            field("Shortcut Dimension 14 Code"; Rec."Shortcut Dimension 14 Code")
            {
                ApplicationArea = All;
                Caption = 'Process';
            }
            field("Shortcut Dimension 15 Code"; Rec."Shortcut Dimension 15 Code")
            {
                ApplicationArea = All;
                Caption = 'Solution';
            }
            field("Shortcut Dimension 16 Code"; Rec."Shortcut Dimension 16 Code")
            {
                ApplicationArea = All;
                Caption = 'Sub Forum';
            }
        }
    }
}

