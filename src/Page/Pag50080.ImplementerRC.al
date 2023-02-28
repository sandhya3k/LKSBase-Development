page 50080 "Implementer RC"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
        }
    }

    actions
    {
        area(sections)
        {
            group("Financial Management")
            {
                Caption = 'Financial Management';
                action("<Action1000000101>")
                {
                    ApplicationArea = All;
                    Caption = 'General Ledger';
                    RunObject = Page "Chart of Accounts";
                }
                action("<Action1000000102>")
                {
                    ApplicationArea = All;
                    Caption = 'Cash Management';
                    RunObject = Page "Location List";
                }
                action("<Action1000000103>")
                {
                    ApplicationArea = All;
                    Caption = 'Cost Accounting';
                    RunObject = Page "Vendor List";
                }
                action("<Action1000000104>")
                {
                    ApplicationArea = All;
                    Caption = 'Cash Flow';
                    RunObject = Page "Item List";
                }
                action("<Action1000000105>")
                {
                    ApplicationArea = All;
                    Caption = 'Receivables';
                    RunObject = Page "Sales List";
                }
                action("<Action1000000106>")
                {
                    ApplicationArea = All;
                    Caption = 'Payables';
                    RunObject = Page "Purchase List";
                }
                action("<Action1000000107>")
                {
                    ApplicationArea = All;
                    Caption = 'Fixed Assets';
                    RunObject = Page "Fixed Asset List";
                }
                action("<Action1000000108>")
                {
                    ApplicationArea = All;
                    Caption = 'Inventory';
                    RunObject = Page "Item List";
                }
            }
            group("Sales & Marketing")
            {
                Caption = 'Sales & Marketing';
                action(A1)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';
                action(Action1000000013)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                action(Action1000000011)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Manufacturing)
            {
                Caption = 'Manufacturing';
                action(Action1000000009)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Projects)
            {
                Caption = 'Projects';
                action(Action1000000007)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                action(Action1000000005)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                action(Action1000000003)
                {
                    ApplicationArea = All;
                    Caption = 'A1';
                }
            }
        }
        area(creation)
        {
            action(NewDoc)
            {
                ApplicationArea = All;
                Caption = 'NewDoc';
            }
        }
    }
}

