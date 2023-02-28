page 50015 "Dimension-Group"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = WHERE("Dimension Code" = FILTER('GROUP'));

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
                field("Group-Branch ID"; Rec."Group-Branch ID")
                {
                    ApplicationArea = All;
                }
                field("Group-Region ID"; Rec."Group-Region ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Group-Head"; Rec."Group-Head")
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

