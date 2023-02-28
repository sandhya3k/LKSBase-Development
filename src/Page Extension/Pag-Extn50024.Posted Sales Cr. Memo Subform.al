pageextension 50024 pageextension50024 extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Other Detail 1"; rec."Other Detail 1")
            {
                ApplicationArea = All;
            }
            field("Other Detail 2"; rec."Other Detail 2")
            {
                ApplicationArea = All;
            }
        }
    }
}

