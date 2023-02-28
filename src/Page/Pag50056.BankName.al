page 50056 "Bank Name"
{
    PageType = Card;
    SourceTable = "Bank Name";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
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

