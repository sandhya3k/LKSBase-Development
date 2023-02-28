pageextension 50103 pageextension50103 extends "Bank Account List"
{
    layout
    {
        addafter("Bank Acc. Posting Group")
        {
            field("Balance (LCY)"; Rec."Balance (LCY)")
            {
                ApplicationArea = All;
            }
            field("Net Change (LCY)"; Rec."Net Change (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
}

