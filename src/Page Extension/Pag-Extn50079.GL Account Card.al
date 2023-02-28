pageextension 50079 pageextension50079 extends "G/L Account Card"
{
    layout
    {
        addafter("Direct Posting")
        {
            field("Income Account"; Rec."Income Account")
            {
                ApplicationArea = All;
            }
        }
    }
}

