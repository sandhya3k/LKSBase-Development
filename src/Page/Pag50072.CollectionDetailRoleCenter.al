page 50072 "Collection Detail Role Center"
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
                RunObject = Report "DepositSlip HDFC<>HDFC";
            }
            action("Deposit Slip to HDFC ")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DepositSlip HDFC=HDFC";
            }
            action("Deposit in Citi Bank or IOB")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Deposit Slip Citi or IOB";
            }
            action("Deposit Slip Bank Account Wise")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Deposit Slip Citi or IOB";
                Visible = false;
            }
            action("Deposit Slip Bank Acc. Wise-1")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise2;
                Visible = false;
            }
            action("Deposit Slip Bank Acc. Wise-2")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise3;
                Visible = false;
            }
            action("Bounce Cheque detail")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = Report "Bounce Cheque detail";
            }
            action("Duplication cheque details")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Duplication cheque details";
            }
            action("Daily Collection MIS to MP")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DailyCollectionMISto MP";
            }
            action("Periodical collection Report")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Periodical collectionReport";
            }
            action("Pending Coll. Posting Detail")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report PendingCollectionPostingDetail;
            }
            action("Pending Exp. Posting Detail")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report PendingExpensePostingDetail;
            }
        }
    }
}

