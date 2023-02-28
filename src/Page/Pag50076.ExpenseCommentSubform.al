page 50076 "Expense Comment Subform"
{
    PageType = ListPart;
    SourceTable = "Coll.Exp.Comment Line";
    SourceTableView = SORTING("Voucher No.", "Company Head", Division, "Line No.")
                      WHERE("Document Type" = FILTER(Expense));

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
                field(Date; rec.Date)
                {
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        rec."Document Type" := rec."Document Type"::Expense;
                    end;
                }
                field(Comment; rec.Comment)
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

