page 50071 "Expense Detail List"
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
                field(Division; rec.Division)
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
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        "Amount.Enable": Boolean;


    procedure EnableDisableFields()
    begin
        if rec.Submitted = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

