pageextension 50020 pageextension50020 extends "Posted Sales Invoice Subform"
{
    layout
    {

        addafter(Description)
        {
            field("Other Detail 1"; Rec."Other Detail 1")
            {
                ApplicationArea = All;
            }
            field("Other Detail 2"; Rec."Other Detail 2")
            {
                ApplicationArea = All;
            }
            field("Merge Lines"; Rec."Merge Lines")
            {
                ApplicationArea = All;
            }
            field("Merge Description"; Rec."Merge Description")
            {
                ApplicationArea = All;
            }
            field("Merge Description 2"; Rec."Merge Description 2")
            {
                ApplicationArea = All;
            }
            field("Supporting Bill No."; Rec."Supporting Bill No.")
            {
                ApplicationArea = All;
            }
            field("Supporting Bill Dt."; Rec."Supporting Bill Dt.")
            {
                ApplicationArea = All;
            }
            field("Date of Expense"; Rec."Date of Expense")
            {
                ApplicationArea = All;
            }
        }
    }
}

