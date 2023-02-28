page 50008 "Expense Detail List_1"
{
    CardPageID = "Expense Detail Card";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Expense Detail";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Voucher No."; Rec."Expense Voucher No.")
                {
                    ApplicationArea = All;
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Voucher Date"; Rec."Voucher Date")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
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

