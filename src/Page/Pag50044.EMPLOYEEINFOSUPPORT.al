page 50044 "EMPLOYEE INFO SUPPORT"
{
    PageType = Card;
    SourceTable = "Emp Info Support";

    layout
    {
        area(content)
        {
            field("Posted Document No."; Rec."Posted Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = All;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                }
                field(Degisation; Rec.Degisation)
                {
                    ApplicationArea = All;
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = All;
                }
                field(HRA; Rec.HRA)
                {
                    ApplicationArea = All;
                }
                field(Conveyance; Rec.Conveyance)
                {
                    ApplicationArea = All;
                }
                field("Special Allowance"; Rec."Special Allowance")
                {
                    ApplicationArea = All;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = All;
                }
                field(Arears; Rec.Arears)
                {
                    ApplicationArea = All;
                }
                field("Professional Tax"; Rec."Professional Tax")
                {
                    ApplicationArea = All;
                }
                field("Loan-Recovery"; Rec."Loan-Recovery")
                {
                    ApplicationArea = All;
                }
                field(PF; Rec.PF)
                {
                    ApplicationArea = All;
                }
                field(ESI; Rec.ESI)
                {
                    ApplicationArea = All;
                }
                field("Other Deduction"; Rec."Other Deduction")
                {
                    ApplicationArea = All;
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = All;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
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

