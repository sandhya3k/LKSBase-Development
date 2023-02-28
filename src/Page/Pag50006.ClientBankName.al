page 50006 "Client Bank Name"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Bank Name";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bank  Name"; Rec."Bank  Name")
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

