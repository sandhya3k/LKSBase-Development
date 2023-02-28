page 50068 "Common Master List"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Common Master";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Master ID"; Rec."Master ID")
                {
                    ApplicationArea = All;
                }
                field("Master Description"; Rec."Master Description")
                {
                    ApplicationArea = All;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; rec.City)
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

