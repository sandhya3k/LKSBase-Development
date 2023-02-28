page 50108 "Posted Approve Payment"
{
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Approval For the LCMS";
    SourceTableView = WHERE(Status = FILTER(<> Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Rtb No"; Rec."Rtb No")
                {
                    ApplicationArea = All;
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = All;
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = All;
                }
                field("Payment Amount LCY"; Rec."Payment Amount LCY")
                {
                    ApplicationArea = All;
                }
                field("Payment Date time"; Rec."Payment Date time")
                {
                    ApplicationArea = All;
                }
                field("Payment Location"; Rec."Payment Location")
                {
                    ApplicationArea = All;
                }
                field(Writeoff; Rec.Writeoff)
                {
                    ApplicationArea = All;
                }
                field(Unapply; Rec.Unapply)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(Reversal; Rec.Reversal)
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("Applies Remaining Amount"; Rec."Applies Remaining Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Applied Amount';
                }
                field("Applies Remaining Amount LCY"; Rec."Applies Remaining Amount LCY")
                {
                    ApplicationArea = All;
                    Caption = 'Applied Amount LCY';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Creation Date-Time"; Rec."Creation Date-Time")
                {
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                }
                field("Aproved Date-Time"; Rec."Aproved Date-Time")
                {
                    ApplicationArea = All;
                }
                field("Unapplied By"; Rec."Unapplied By")
                {
                    ApplicationArea = All;
                }
                field("Unapplied Date-Time"; Rec."Unapplied Date-Time")
                {
                    ApplicationArea = All;
                }
                field("API status"; Rec."API status")
                {
                    ApplicationArea = All;
                }
                field("API Exception"; Rec."API Exception")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    var

}

