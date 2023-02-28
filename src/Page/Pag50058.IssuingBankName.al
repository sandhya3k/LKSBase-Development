page 50058 "Issuing Bank Name"
{
    PageType = Card;
    SourceTable = "Bank Name";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Bank  Name"; rec."Bank  Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

