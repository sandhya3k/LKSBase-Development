pageextension 50084 pageextension50084 extends "General Ledger Entries"
{
    layout
    {

        addafter("Posting Date")
        {
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
                Caption = 'Creation date';
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = all;
            }
        }
        addafter("G/L Account No.")
        {
            // field("Description 3"; Rec."Description 3")
            // {
            //     ApplicationArea = All;
            // }

        }
        addafter(Description)
        {
            field("Cheque No."; Rec."Cheque No.")
            {
                ApplicationArea = All;
            }
            field("External Doc. Date"; Rec."External Doc. Date")
            {
                ApplicationArea = All;
            }
            field("Cheque Date"; Rec."Cheque Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Group Head"; Rec."Group Head")
            {
                ApplicationArea = All;
            }
        }
        addafter(Reversed)
        {
            field("Issuing Bank Name"; Rec."Issuing Bank Name")
            {
                ApplicationArea = All;
            }
            field("Payment Made By"; Rec."Payment Made By")
            {
                ApplicationArea = All;
            }
        }
    }
}

