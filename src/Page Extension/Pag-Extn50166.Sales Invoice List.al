pageextension 50166 pageextension50166 extends "Sales Invoice List"
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Sales Invoice List"(Page 9301)".

    layout
    {
        addafter("Location Code")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Prof. Chrg. Amt."; Rec."Prof. Chrg. Amt.")
            {
                ApplicationArea = All;
            }
            field("Reimbursable Exp. Amt."; Rec."Reimbursable Exp. Amt.")
            {
                ApplicationArea = All;
            }
            //TBD //field("Amount to Customer"; Rec."Amount to Customer") //TBD


        }
        addafter("Job Queue Status")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
        }

    }
    trigger OnOpenPage()
    begin
        rec.SetRange(Cancelled, false);
    end;
}

