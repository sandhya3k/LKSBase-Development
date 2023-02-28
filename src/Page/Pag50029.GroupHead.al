page 50029 "Group Head"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Group Master";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Group Heade"; Rec.Group)
                {
                    ApplicationArea = All;
                }
                field("Group Name"; Rec."Group Name")
                {
                    ApplicationArea = All;
                }
                field("Email Id"; Rec."Email Id")
                {
                    ApplicationArea = All;
                }
                field("Copy Email Id"; Rec."Copy Email Id")
                {
                    ApplicationArea = All;
                }
                field("Common copy to"; Rec."Common copy to")
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

