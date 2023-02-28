pageextension 50154 pageextension50154 extends "Accounting Manager Role Center"
{
    layout
    {
        modify(Control1902304208)
        {
            Visible = false;
        }
        addfirst(Control1900724808)
        {
            part("Approval For RTB CRTB"; Dash_LKS)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("&Closing Trial Balance")
        {
            action("Sales Invoice/ Credit Memo Pdf")
            {
                ApplicationArea = All;
                Caption = 'Sales Invoice/ Credit Memo Pdf';
                Image = "Report";
                RunObject = Report "Posted sales Invoice PDF";
            }
        }
        addafter("Cost Accounting Analysis")
        {
            action("Auto Post Collection Data")
            {
                ApplicationArea = All;
                Caption = 'Auto Post Collection Data';
                Image = "Report";
                RunObject = Report "DepositSlip HDFC=HDFC";
                Visible = false;
            }
            action("Inv. Outstanding")
            {
                ApplicationArea = All;
                RunObject = XMLport "Inv. Outstanding1000";
                Visible = false;
            }
            action("Sales Credit Memo-CSV")
            {
                ApplicationArea = All;
                Caption = 'Cancelled Posted Credit Memo-CSV';
                RunObject = Report "Credit Memo Detail-XML";
            }
            action("Cancelled Credit Memo-CSV")
            {
                ApplicationArea = All;
                Caption = 'Cancelled Credit Memo-CSV';
                RunObject = Report "Cancelled Credit Memo-XML";
            }
            action("RTB-CSV")
            {
                ApplicationArea = All;
                Caption = 'RTB-CSV';
                RunObject = Report "Invoice Detail-XML";
            }
            action("Cancelled RTB")
            {
                ApplicationArea = All;
                Caption = 'Cancelled RTB';
                Image = "Report";
                RunObject = Report "Cancelled RTB-XML";
            }
            action("Deposit Slip other than HDFC ")
            {
                ApplicationArea = All;
                Image = "Report";
                RunObject = Report "DepositSlip HDFC<>HDFC";
            }
            action("Deposit Slip to HDFC ")
            {
                ApplicationArea = All;
                Image = "report";
                RunObject = Report "DepositSlip HDFC=HDFC";
            }
            action("Deposit in Citi Bank or IOB")
            {
                ApplicationArea = All;
                Image = "REPORT";
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
                Image = Repor;
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
            action("Pending Exp. Posted")
            {
                ApplicationArea = All;
                Image = "report";
                RunObject = Report PendingExpensePosting;
            }
            action("TDS Report")
            {
                ApplicationArea = All;
                Caption = 'TDS Report';
                Image = "Report";
                RunObject = Report "TDS Report";
            }
        }
        addafter("Incoming Documents")
        {
            action("E-Invoice Information")
            {
                ApplicationArea = All;
                RunObject = Page "EInvoice Info";
            }
        }
        addfirst(Journals)
        {
            action("Client Bank Name")
            {
                ApplicationArea = All;
                RunObject = Page "Client Bank Name";
            }
        }
        addafter("Issued Fin. Charge Memos")
        {
            action(Action1000000023)
            {
                ApplicationArea = All;
                Caption = 'Cancelled RTB';
                RunObject = Page "Sales Invoice List-TRUE";
            }
            action("Page Cancelled CRTB")
            {
                ApplicationArea = All;
                Caption = 'Page Cancelled CRTB>';
                RunObject = Page "Sales Credit Memos-TRUE";
            }
        }
        addafter("Navi&gate")
        {
            action("LCMS Data Update")
            {
                ApplicationArea = All;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "LCM DATA UPDATE";
            }
            action("Collection Entry")
            {
                ApplicationArea = All;
                Caption = 'Collection Entry';
                Image = "Page";
                RunObject = Page "Collection Detail List";
            }
            action("Collection Entry Modified")
            {
                ApplicationArea = All;
                Image = "Page";

                RunObject = Page "Collection Detail List Account";
            }
            action("Expence Entry")
            {
                ApplicationArea = All;
                Caption = 'Expense Entry';
                Image = "Page";
                RunObject = Page "Expense Detail List";
            }
        }
    }
}

