pageextension 50095 pageextension50095 extends "Vendor List"
{
    layout
    {
        modify("Search Name")
        {
            Visible = false;
        }
        modify(Blocked)
        {
            Visible = false;
        }
        addafter("Purchaser Code")
        {
            field("E-Mail"; rec."E-Mail")
            {
                ApplicationArea = All;
            }
            field("Home Page"; rec."Home Page")
            {
                ApplicationArea = All;
            }
        }
    }
}

