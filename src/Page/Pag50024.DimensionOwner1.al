page 50024 "Dimension - Owner 1"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = WHERE("Dimension Code" = FILTER('OWNER1'));

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

