page 50036 "Narasimhan Role Center"
{
    Caption = 'Collection Detail Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Collection Detail Role Center")
            {
                Caption = 'Collection Detail Role Center';
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Periodical collection Report")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Periodical collectionReport";
            }
            action("Customer List")
            {
                ApplicationArea = All;
                RunObject = Page "Customer List";
            }
        }
    }
}

