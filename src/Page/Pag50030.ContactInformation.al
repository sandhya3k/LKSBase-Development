page 50030 "Contact Information1"
{
    PageType = Card;
    SourceTable = Contact;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
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
                field(Department; rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Designation; rec.Designation)
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
                field("E-Mail 2"; Rec."E-Mail 2")
                {
                    ApplicationArea = All;
                }
                field("Time Slot"; Rec."Time Slot")
                {
                    ApplicationArea = All;
                }
                field("Last Time Modified"; Rec."Last Time Modified")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field(Initials; rec.Initials)
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

