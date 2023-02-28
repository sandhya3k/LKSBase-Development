page 50016 "Dimension-Case"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = WHERE("Dimension Code" = FILTER('CASE'));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                Visible = true;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Case-Office ID"; Rec."Case-Office ID")
                {
                    ApplicationArea = All;
                }
                field("Case-Client ID"; Rec."Case-Client ID")
                {
                    ApplicationArea = All;
                }
                field("Case-Process"; Rec."Case-Process")
                {
                    ApplicationArea = All;
                }
                field(Correspondence_Contact_ID; Rec.Correspondence_Contact_ID)
                {
                    ApplicationArea = All;
                }
                field(Billing_Contact_ID; Rec.Billing_Contact_ID)
                {
                    ApplicationArea = All;
                }
                field("Case-Document Name"; Rec."Case-Document Name")
                {
                    ApplicationArea = All;
                }
                field("Case-Activity Type"; Rec."Case-Activity Type")
                {
                    ApplicationArea = All;
                }
                field("Case-Solution"; Rec."Case-Solution")
                {
                    ApplicationArea = All;
                }
                field("Case-Branch"; Rec."Case-Branch")
                {
                    ApplicationArea = All;
                }
                field("Case-Practice"; Rec."Case-Practice")
                {
                    ApplicationArea = All;
                }
                field("Case-Area"; Rec."Case-Area")
                {
                    ApplicationArea = All;
                }
                field("Case-Rain Maker"; Rec."Case-Rain Maker")
                {
                    ApplicationArea = All;
                }
                field("Case-Rain Giver"; Rec."Case-Rain Giver")
                {
                    ApplicationArea = All;
                }
                field("Case-Forum"; Rec."Case-Forum")
                {
                    ApplicationArea = All;
                }
                field("Case-Sub Forum"; Rec."Case-Sub Forum")
                {
                    ApplicationArea = All;
                }
                field("Case-Creation Date"; Rec."Case-Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Case-Referance Type"; Rec."Case-Referance Type")
                {
                    ApplicationArea = All;
                }
                field("Case-Forum City"; Rec."Case-Forum City")
                {
                    ApplicationArea = All;
                }
                field("Case-Target Forum"; Rec."Case-Target Forum")
                {
                    ApplicationArea = All;
                }
                field("Case-Target Sub Forum"; Rec."Case-Target Sub Forum")
                {
                    ApplicationArea = All;
                }
                field("Case-Target Forum City"; Rec."Case-Target Forum City")
                {
                    ApplicationArea = All;
                }
                field("Case-Owner1"; Rec."Case-Owner1")
                {
                    ApplicationArea = All;
                }
                field("Case-Owner2"; Rec."Case-Owner2")
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

