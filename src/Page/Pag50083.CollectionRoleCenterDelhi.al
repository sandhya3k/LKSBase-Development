page 50083 "Collection Role Center-Delhi"
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
            action("Collection Detail List")
            {
                ApplicationArea = All;
                RunObject = Page "Collection Detail List";
            }
        }
        area(reporting)
        {
            action("DepositSlipBankAccountWise 1")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DepositSlip HDFC<>HDFC";
            }
            action("DepositSlipBankAccountWise 2")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Deposit Slip Citi or IOB";
            }
            action("DepositSlipBankAccountWise 3")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise2;
            }
            action("DepositSlipBankAccountWise 4")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise3;
            }
            action("Bounce Cheque detail")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Bounce Cheque detail";
            }
            action("Duplication cheque details")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Duplication cheque details";
            }
            action("DailyCollectionMISto MP")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DailyCollectionMISto MP";
            }
            action("Periodical collectionReport")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "Periodical collectionReport";
            }
            action(PendingCollectionPostingDetail)
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report PendingCollectionPostingDetail;
            }
            action(PendingExpensePostingDetail)
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report PendingExpensePostingDetail;
            }
        }
    }
}

