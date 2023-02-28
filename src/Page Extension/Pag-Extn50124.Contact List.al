pageextension 50124 pageextension50124 extends "Contact List"
{
    layout
    {
        addafter("No.")
        {
            field(County; Rec.County)
            {
                ApplicationArea = All;
            }

            field("Home Page"; Rec."Home Page")
            {
                ApplicationArea = All;
            }
        }
        addafter("Search Name")
        {
            field("E-Mail 2"; Rec."E-Mail 2")
            {
                ApplicationArea = All;
            }
            field("Office ID"; Rec."Office ID")
            {
                ApplicationArea = All;
            }
            field("Client ID"; Rec."Client ID")
            {
                ApplicationArea = All;
            }
            field(Department; Rec.Department)
            {
                ApplicationArea = All;
            }
            field(Designation; Rec.Designation)
            {
                ApplicationArea = All;
            }
            field("F Name"; Rec."F Name")
            {
                ApplicationArea = All;
            }
            field("M Name"; Rec."M Name")
            {
                ApplicationArea = All;
            }
            field("L Name"; Rec."L Name")
            {
                ApplicationArea = All;
            }
            field("Phone 2"; Rec."Phone 2")
            {
                ApplicationArea = All;
            }
            field("Mobile 2"; Rec."Mobile 2")
            {
                ApplicationArea = All;
            }
            field("Pref Way of Comm"; Rec."Pref Way of Comm")
            {
                ApplicationArea = All;
            }
            field("Time Slot"; Rec."Time Slot")
            {
                ApplicationArea = All;
            }
            field(Initials; Rec.Initials)
            {
                ApplicationArea = All;
            }
        }
    }
}

