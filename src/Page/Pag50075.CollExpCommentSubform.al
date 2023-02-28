page 50075 "Coll.Exp. Comment Subform"
{
    PageType = ListPart;
    SourceTable = "Coll.Exp.Comment Line";
    SourceTableView = SORTING("Voucher No.", "Company Head", Division, "Line No.")
                      WHERE("Document Type" = FILTER(Collection));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Voucher No."; Rec."Voucher No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = All;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

