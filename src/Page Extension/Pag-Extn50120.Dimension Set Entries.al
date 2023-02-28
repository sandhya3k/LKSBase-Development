pageextension 50120 pageextension50120 extends "Dimension Set Entries"
{
    layout
    {
        addafter("Dimension Value Name")
        {
            field("Dimension Set ID"; Rec."Dimension Set ID")
            {
                ApplicationArea = All;
            }
            field("Dimension Value ID"; Rec."Dimension Value ID")
            {
                ApplicationArea = All;
            }
        }
    }
}

