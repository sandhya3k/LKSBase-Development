pageextension 50107 pageextension50107 extends "Bank Acc. Reconciliation Lines"
{
    layout
    {
        addafter("Check No.")
        {
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Reversed; Rec.Reversed)
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
    }
}

