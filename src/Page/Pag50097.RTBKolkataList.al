page 50097 "RTB Kolkata List"
{
    CardPageID = "RTB Kolkata";
    PageType = List;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Invoice));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Adjust Against Adv."; Rec."Adjust Against Adv.")
                {
                    ApplicationArea = All;
                }
                field("Confirmation Reference"; Rec."Confirmation Reference")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                //TBD
                /*
                field("Amount to Customer"; Rec."Amount to Customer")
                {ApplicationArea =All;
                }
                */
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Location Code", 'KOLKATA');
        Rec.SetRange(Cancelled, false);
    end;
}

