page 50014 "Dimension-Branch"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = WHERE("Dimension Code" = FILTER('BRANCH'));

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
                field("Branch-Region ID"; Rec."Branch-Region ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Branch-Head"; Rec."Branch-Head")
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

