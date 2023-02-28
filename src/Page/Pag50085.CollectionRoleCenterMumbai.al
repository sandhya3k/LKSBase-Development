page 50085 "Collection Role Center-Mumbai"
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
            action("Expense Detail List")
            {
                ApplicationArea = All;
                Caption = 'Expense Detail List';
                RunObject = Page "Expense Detail List";
            }
            action("Collection Detail List")
            {
                ApplicationArea = All;
                RunObject = Page "Collection Detail List";
            }
        }
        area(reporting)
        {
            action("Deposit Slip other than HDFC ")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DepositSlip HDFC<>HDFC-Mumbai";
            }
            action("Deposit Slip to HDFC ")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DepositSlip HDFC=HDFC-Mumbai";
            }
            action("Deposit in Citi Bank or IOB")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Deposit Slip Citi orIOB-Mumbai";
            }
            action("Periodical Collection")
            {
                ApplicationArea = All;
                RunObject = Report "Periodical collection-Mumbai";
            }
            action("Expense Pending")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "PendingExpensePosting-Mumbai";
            }
        }
    }
}

