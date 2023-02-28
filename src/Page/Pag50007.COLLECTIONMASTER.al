page 50007 "COLLECTION MASTER"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Common Master";
    SourceTableView = ORDER(Ascending)
                      WHERE("Company Head" = FILTER(LKS),
                            "Master Type" = FILTER(Client));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "Master Type";
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                }
                field("Master Type"; Rec."Master Type")
                {
                    ApplicationArea = All;
                }
                field("Master ID"; Rec."Master ID")
                {
                    ApplicationArea = All;
                }
                field("Master Description"; Rec."Master Description")
                {
                    ApplicationArea = All;
                }
                field("Division Type"; Rec."Division Type")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
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

