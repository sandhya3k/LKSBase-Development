page 50098 "Vetha Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1000000001)
            {
                ShowCaption = false;
                part("Customer List"; "Customer List")
                {
                    ApplicationArea = All;
                    Caption = 'Customer List';
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            group(Action1000000003)
            {
                action("RTB Ahmedabad")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Ahmedabad';
                    RunObject = Page "RTB Ahmedabad List";
                }
                action("RTB Hyderabad")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Hyderabad';
                    RunObject = Page "RTB Hyderabad List";
                }
                action("RTB Bangalore")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Bangalore';
                    RunObject = Page "RTB Bangalore List";
                }
                action("RTB Delhi")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Delhi';
                    RunObject = Page "RTB Delhi List";
                }
                action("RTB Mumbai")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Mumbai';
                    RunObject = Page "RTB Mumbai List";
                }
                action("RTB Chennai")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Chennai';
                    RunObject = Page "RTB Chennai List";
                }
                action("RTB Kolkata")
                {
                    ApplicationArea = All;
                    Caption = 'RTB Kolkata';
                    RunObject = Page "RTB Kolkata List";
                }
                action("Page Cancelled RTB")
                {
                    ApplicationArea = All;
                    Caption = 'Cancelled RTB';
                    RunObject = Page "Sales Invoice List-TRUE";
                }
                action("Page Cancelled CRTB")
                {
                    ApplicationArea = All;
                    Caption = 'Cancelled CRTB';
                    RunObject = Page "Sales Credit Memos-TRUE";
                }
                action("Ship-to Address List")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Address List';
                    RunObject = Page "Ship-to Address List";
                }
                action("Contact List")
                {
                    ApplicationArea = All;
                    Caption = 'Contact List';
                    RunObject = Page "Contact List";
                }
            }
        }
    }
}

