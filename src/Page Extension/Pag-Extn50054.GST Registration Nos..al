pageextension 50054 pageextension50054 extends "GST Registration Nos."
{
    layout
    {
        addafter("Input Service Distributor")
        {
            field("User Name"; rec."User Name")
            {
                ApplicationArea = All;
            }
            field(Password; rec.Password)
            {
                ApplicationArea = All;
            }
        }
    }
}

