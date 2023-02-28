pageextension 50130 pageextension50130 extends "Employee List"
{
    layout
    {
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        addafter("Job Title")
        {
            field("Full Name"; Rec."Full Name")
            {
                ApplicationArea = All;
            }
            field("HR Code"; Rec."HR Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Post Code")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field("Region ID"; Rec."Region ID")
            {
                ApplicationArea = All;
            }
            field("Group ID"; Rec."Group ID")
            {
                ApplicationArea = All;
            }
            field(Solution; Rec.Solution)
            {
                ApplicationArea = All;
            }
            field(Practice; Rec.Practice)
            {
                ApplicationArea = All;
            }
            field("Area"; Rec.Area)
            {
                ApplicationArea = All;
            }
            field(Domain; Rec.Domain)
            {
                ApplicationArea = All;
            }
        }
        addafter("Search Name")
        {
            field("Reporting To"; Rec."Reporting To")
            {
                ApplicationArea = All;
            }
            field("Employee Role"; Rec."Employee Role")
            {
                ApplicationArea = All;
            }
            field(Designation; Rec.Designation)
            {
                ApplicationArea = All;
            }
        }
    }
}

