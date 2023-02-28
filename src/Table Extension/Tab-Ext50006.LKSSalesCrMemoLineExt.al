tableextension 50006 "LKSSalesCrMemoLineExt" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50000; "Item Description"; Text[250])
        {
        }
        field(50001; "Other Detail 1"; Text[250])
        {
        }
        field(50002; "Other Detail 2"; Text[250])
        {
        }
        field(50003; "Supporting Bill No."; Text[50])
        {
        }
        field(50004; "Supporting Bill Dt."; Date)
        {
        }
        field(50005; "Date of Expense"; Date)
        {
        }
        field(50006; "Service Tax Applicable"; Boolean)
        {
        }
    }
}

