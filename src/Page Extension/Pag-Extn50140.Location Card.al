pageextension 50140 pageextension50140 extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("GST Reg No."; Rec."GST Reg No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

