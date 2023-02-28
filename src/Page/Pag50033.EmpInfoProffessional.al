page 50033 "Emp Info Proffessional"
{
    PageType = Card;
    SourceTable = "Emp Info Professional";

    layout
    {
        area(content)
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            repeater(Control1000000000)
            {
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
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field(Classification; Rec.Classification)
                {
                    ApplicationArea = All;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                }
                field(Wing; Rec.Wing)
                {
                    ApplicationArea = All;
                }
                field(Level; Rec.Level)
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
                field("Payment Typer"; Rec."Payment Typer")
                {
                    ApplicationArea = All;
                }
                field("Annual  Compensation"; Rec."Annual  Compensation")
                {
                    ApplicationArea = All;
                }
                field("Monthly Compensation"; Rec."Monthly Compensation")
                {
                    ApplicationArea = All;
                }
                field("Firm Factor"; Rec."Firm Factor")
                {
                    ApplicationArea = All;
                }
                field("Group Factor"; Rec."Group Factor")
                {
                    ApplicationArea = All;
                }
                field("Fixed"; Rec.Fixed)
                {
                    ApplicationArea = All;
                }
                field("Firm Varriable"; Rec."Firm Varriable")
                {
                    ApplicationArea = All;
                }
                field("Group Variable"; Rec."Group Variable")
                {
                    ApplicationArea = All;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                }
                field("Arrear Gross"; Rec."Arrear Gross")
                {
                    ApplicationArea = All;
                }
                field("TDS Rates"; Rec."TDS Rates")
                {
                    ApplicationArea = All;
                }
                field("Amount Of TDS"; Rec."Amount Of TDS")
                {
                    ApplicationArea = All;
                }
                field("Net Payable"; Rec."Net Payable")
                {
                    ApplicationArea = All;
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                }
                field(Loan; Rec.Loan)
                {
                    ApplicationArea = All;
                }
                field("Other Deduction"; Rec."Other Deduction")
                {
                    ApplicationArea = All;
                }
                field("Net Paid"; Rec."Net Paid")
                {
                    ApplicationArea = All;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
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

