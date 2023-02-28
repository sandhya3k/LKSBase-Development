pageextension 50129 pageextension50129 extends "Employee Card"
{
    layout
    {
        modify("Company E-Mail")
        {
            Caption = 'Email';
        }
        addafter(Gender)
        {
            field("Full Name"; Rec."Full Name")
            {
                ApplicationArea = All;
            }
            field("Reporting To"; Rec."Reporting To")
            {
                ApplicationArea = All;
            }
            field("HR Code"; Rec."HR Code")
            {
                ApplicationArea = All;
            }
        }
    }
}

