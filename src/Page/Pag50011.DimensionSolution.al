page 50011 "Dimension-Solution"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = WHERE("Dimension Code" = FILTER('SOLUTION'));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
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

