page 50010 "Accounting Mgr Role Center"
{
    // <changelog>
    //     <change releaseversion="IN6.00"/>
    // </changelog>

    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;
    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(Control99; "Finance Performance")
                {
                    Visible = false;
                }
                part(Control1902304208; "Account Manager Activities")
                {
                }
                systempart(Control1901420308; Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                ShowCaption = false;
                part(Control103; "Trailing Sales Orders Chart")
                {
                    Visible = false;
                }
                part(Control106; "My Job Queue")
                {
                    Visible = false;
                }

                part(Control1907692008; "My Customers")
                {
                }
                part(Control1902476008; "My Vendors")
                {
                }
                systempart(Control1901377608; MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Day Book")
            {
                Caption = 'Day Book';
                Image = "Report";
                RunObject = Report "Day Book";
            }
            action("Cash Book")
            {
                Caption = 'Cash Book';
                Image = "Report";
                RunObject = Report "Cash Book";
            }
            action("Bank Book")
            {
                Caption = 'Bank Book';
                Image = "Report";
                RunObject = Report "Bank Book";
            }
            action("<Report Cust Ledger Acc. New>")
            {
                Image = "Report";
                RunObject = Report "Cust Ledger Acc. New";
            }
            action("<Report Reimburseable>")
            {
                Image = "Report";
                RunObject = Report Reimburseable;
            }
            action("Customer Detailed Aging (NEW)")
            {
                Image = "Report";
                RunObject = Report "Customer Detailed Aging (NEW)";
            }
            action("Cust. Detail with Date Filter")
            {
                Image = "Report";
                RunObject = Report "Cust. Detail with Date Filter";
            }
            action("Bill/Memo Issued (Excel)")
            {
                Image = "Report";
                RunObject = Report "Bill/Memo Issued (Excel)1";
            }
            action("Bill/Memo Issued with GSTN (Excel)")
            {
                Caption = '<Bill/Memo Issued with GSTN (Excel)>';
                Image = "Report";
                RunObject = Report "Bill/Memo Issued (Excel)1";
            }
            action("Credit Notes(Excel)")
            {
                Image = "Report";
                RunObject = Report "Credit Notes(Excel)";
            }
            action(Ledgers)
            {
                Caption = 'Ledgers';
                Image = "Report";
                RunObject = Report Ledger;
            }
            action("Daily Bill/Memo Issued(Excel)")
            {
                Image = "Report";
                RunObject = Report "Daily Bill/Memo Issued(Excel)";
            }
            action("Memo Raised Aa On(Excel)")
            {
                Image = "Report";
                RunObject = Report "Memo Raised Aa On(Excel)";
            }
            action("Report of Bank Ledger Recpt")
            {
                Image = "Report";
                RunObject = Report "Report of Bank Ledger Recpt";
            }
            action("Credit Notes(Summary)")
            {
                Image = "Report";
                RunObject = Report "Credit Notes(Summary)";
            }
            action("Daily Collection")
            {
                Image = "Report";
                RunObject = Report "Daily Collection";
            }
            action("Collection As On")
            {
                Image = "Report";
                RunObject = Report "Collection As On";
            }
            action("Collection Detailed Report")
            {
                Image = "Report";
                RunObject = Report "Collection Detailed Report";
            }
            action("TDS Report G/L Wise")
            {
                RunObject = Report "TDS Report New";
            }
            action("Bill/Memo Issued(Summary)")
            {
                Image = "Report";
                RunObject = Report "Bill/Memo Issued(Summary)";
            }
            action("Writte Off")
            {
                Image = "Report";
                RunObject = Report "Writte Off";
            }
            action("Bounce Cheque")
            {
                Image = "Report";
                RunObject = Report "Bounce Cheque";
            }
            action("GL Colection")
            {
                Image = "Report";
                RunObject = Report "GL Colection";
            }
            action("Cusotmer Collection")
            {
                Image = "Report";
                RunObject = Report "Cusotmer Collection";
            }
            action("Bank Recocilation")
            {
                Image = "Report";
                RunObject = Report "Bank Recocilation UAT";
            }
            action("Accounts Voucher Report")
            {
                Image = "Report";
                RunObject = Report "Accounts Voucher Report";
            }
            action("Customer Detailed Aging(Group")
            {
                Image = "Report";
            }
            action("Pdf (Sales invoice/ Cr Memo)")
            {
                Caption = 'Pdf (Sales invoice/ Cr Memo)';
                Image = "Report";
                RunObject = Report "Posted sales Invoice PDF";
            }
            action("Email digital Sign PDFs")
            {
                Caption = 'Email digital Sign PDFs';
                Image = UpdateDescription;
                RunObject = Report "Email Dig Sign";
            }
            separator(Action1000000005)
            {
            }
            action("Auto Post Collection Data")
            {
                Caption = 'Auto Post Collection Data';
                Image = "Report";
                RunObject = Report "DepositSlip HDFC=HDFC";
                Visible = false;
            }
            action("Inv. Outstanding")
            {
                RunObject = XMLport "Inv. Outstanding1000";
                Visible = false;
            }
            // action("DepositSlip Bank")
            // {
            //     Image = "Report";
            //     RunObject = Report Report90002;
            //     Visible = false;
            // }
            action("Sales Credit Memo-CSV")
            {
                Caption = 'Cancelled Posted Credit Memo-CSV';
                RunObject = Report "Credit Memo Detail-XML";
            }
            action("Cancelled Credit Memo-CSV")
            {
                Caption = 'Cancelled Credit Memo-CSV';
                RunObject = Report "Cancelled Credit Memo-XML";
            }
            action("RTB-CSV")
            {
                Caption = 'RTB-CSV';
                RunObject = Report "Invoice Detail-XML";
            }
            action("Cancelled RTB")
            {
                Caption = 'Cancelled RTB';
                Image = "Report";
                RunObject = Report "Cancelled RTB-XML";
            }
            action("Deposit Slip other than HDFC ")
            {
                Image = "Report";
                RunObject = Report "DepositSlip HDFC<>HDFC";
            }
            action("Deposit Slip to HDFC ")
            {
                Image = "report";
                RunObject = Report "DepositSlip HDFC=HDFC";
            }
            action("Deposit in Citi Bank or IOB")
            {
                Image = "REPORT";
                RunObject = Report "Deposit Slip Citi or IOB";
            }
            action("Deposit Slip Bank Account Wise")
            {
                Image = "Report";
                RunObject = Report "Deposit Slip Citi or IOB";
                Visible = false;
            }
            action("Deposit Slip Bank Acc. Wise-1")
            {
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise2;
                Visible = false;
            }
            action("Deposit Slip Bank Acc. Wise-2")
            {
                Image = "Report";
                RunObject = Report DepositSlipBankAccountWise3;
                Visible = false;
            }
            action("Bounce Cheque detail")
            {
                Image = Repor;
                RunObject = Report "Bounce Cheque detail";
            }
            action("Duplication cheque details")
            {
                Image = "Report";
                RunObject = Report "Duplication cheque details";
            }
            action("Daily Collection MIS to MP")
            {
                Image = "Report";
                RunObject = Report "DailyCollectionMISto MP";
            }
            action("Periodical collection Report")
            {
                Image = "Report";
                RunObject = Report "Periodical collectionReport";
            }
            action("Pending Coll. Posting Detail")
            {
                Image = "Report";
                RunObject = Report PendingCollectionPostingDetail;
            }
            action("Pending Exp. Posting Detail")
            {
                Image = "Report";
                RunObject = Report PendingExpensePostingDetail;
            }
            action("Pending Exp. Posted")
            {
                Image = "report";
                RunObject = Report PendingExpensePosting;
            }
            action("TDS Report")
            {
                Caption = 'TDS Report';
                Image = "Report";
                RunObject = Report "TDS Report";
            }
        }
        area(embedding)
        {
            action("Chart of Accounts")
            {
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
            }
            action("Bank Accounts")
            {
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
            }
            action(Customers)
            {
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
            }
            action(Balance)
            {
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
            }
            action("Sales Orders")
            {
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
            }
            action(Reminders)
            {
                Caption = 'Reminders';
                Image = Reminder;
                RunObject = Page "Reminder List";
            }
            action("Finance Charge Memos")
            {
                Caption = 'Finance Charge Memos';
                Image = FinChargeMemo;
                RunObject = Page "Finance Charge Memo List";
            }
            action(CashReceiptJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST("Cash Receipts"),
                                        Recurring = CONST(false));
                ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
            }
            action(PaymentJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
            }
            action(ICGeneralJournals)
            {
                ApplicationArea = Intercompany;
                Caption = 'IC General Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Intercompany),
                                        Recurring = CONST(false));
                ToolTip = 'Post intercompany transactions. IC general journal lines must contain either an IC partner account or a customer or vendor account that has been assigned an intercompany partner code.';
            }
            action(GeneralJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
            }
            // action("Bank Receipt Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Bank Receipt Voucher"),
            //                         Recurring = CONST(false));
            // }
            // action("Contra Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Contra Voucher"),
            //                         Recurring = CONST(false));
            // }
            // action("Journal Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Journal Voucher"),
            //                         Recurring = CONST(false));
            // }
            // action("Cash Payment Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Cash Payment Voucher"),
            //                         Recurring = CONST(false));
            // }
            // action("Bank Payment Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Bank Payment Voucher"),
            //                         Recurring = CONST(false));
            // }
            // action("Cash Receipt Voucher")
            // {
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = WHERE("Template Type" = CONST(General),
            //                         "Sub Type" = CONST("Cash Receipt Voucher"),
            //                         Recurring = CONST(false));
            // }
            action("Page RTB")
            {
                RunObject = Page "Sales Invoice List";
            }
            action("Page RTB Ahmedabad List")
            {
                Caption = 'RTB Ahmedabad';
                RunObject = Page "RTB Ahmedabad List";
            }
            action("Page RTB Hyderabad List")
            {
                Caption = 'RTB Hyderabad';
                RunObject = Page "RTB Hyderabad List";
            }
            action("Page RTB Bangalore List")
            {
                Caption = 'RTB Bangalore';
                RunObject = Page "RTB Bangalore List";
            }
            action("Page RTB Delhi List")
            {
                Caption = 'RTB Delhi';
                RunObject = Page "RTB Delhi List";
            }
            action("Page RTB Mumbai List")
            {
                Caption = 'RTB Mumbai';
                RunObject = Page "RTB Mumbai List";
            }
            action("Page RTB Chennai List")
            {
                Caption = 'RTB Chennai';
                RunObject = Page "RTB Chennai List";
            }
            action("Page RTB Kolkata List")
            {
                Caption = 'RTB Kolkata';
                RunObject = Page "RTB Kolkata List";
            }
            action("Page RTB Chandigarh List")
            {
                Caption = 'RTB Chandigarh';
                RunObject = Page "RTB CHANDIGARH List";
            }
            action("RTB Pune List")
            {
                Caption = 'RTB Pune List';
                RunObject = Page "RTB Pune List";
            }
            action("RTB Allahabad List")
            {
                Caption = 'RTB Allahabad List';
                RunObject = Page "RTB Allahabad List";
            }
            action("RTB Gurgaon List")
            {
                Caption = 'RTB Gurgaon List';
                RunObject = Page "RTB Gurgaon List";
            }
            action("Page Ship-to Address List")
            {
                Caption = 'Ship-to Address List';
                RunObject = Page "Ship-to Address List";
            }
            action("Page Sales Credit Memo")
            {
                Caption = 'CRTB';
                RunObject = Page "Sales Credit Memos";
            }
            action("Page Contact List")
            {
                Caption = 'Contact List';
                RunObject = Page "Contact List";
            }
            action("Page Purchase Invoice")
            {
                Caption = 'Purchase Invoice';
                RunObject = Page "Purchase Invoices";
            }
            action("Purchase Credit Memos")
            {
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                }
                action("Posted Purchase Invoices")
                {
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                }
                action("Posted Purchase Credit Memos")
                {
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                }
                action(Action1000000017)
                {
                    Caption = 'Cancelled RTB';
                    RunObject = Page "Sales Invoice List-TRUE";
                }
                action("Page Cancelled CRTB")
                {
                    Caption = 'Page Cancelled CRTB>';
                    RunObject = Page "Sales Credit Memos-TRUE";
                }
                action("Issued Reminders")
                {
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                }
                action("Issued Fin. Charge Memos")
                {
                    Caption = 'Issued Fin. Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                }
                action("G/L Registers")
                {
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                }
                action("Cost Accounting Registers")
                {
                    Caption = 'Cost Accounting Registers';
                    RunObject = Page "Cost Registers";
                }
                action("Cost Accounting Budget Registers")
                {
                    Caption = 'Cost Accounting Budget Registers';
                    RunObject = Page "Cost Budget Registers";
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action(Currencies)
                {
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                }
                action("Accounting Periods")
                {
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                }
                action("Number Series")
                {
                    Caption = 'Number Series';
                    RunObject = Page "No. Series";
                }
                action("Analysis Views")
                {
                    Caption = 'Analysis Views';
                    RunObject = Page "Analysis View List";
                }
                action("Account Schedules")
                {
                    Caption = 'Account Schedules';
                    RunObject = Page "Account Schedule Names";
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page Dimensions;
                }
                action("Bank Account Posting Groups")
                {
                    Caption = 'Bank Account Posting Groups';
                    RunObject = Page "Bank Account Posting Groups";
                }
            }
        }
        area(creation)
        {
            action("Sales &Credit Memo")
            {
                Caption = 'Sales &Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Credit Memo";
                RunPageMode = Create;
            }
            action("P&urchase Credit Memo")
            {
                Caption = 'P&urchase Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Credit Memo";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Approve Payment")
            {
                Caption = 'Approve Payment';
                Image = Approval;
                RunObject = page 50107;
            }
            action("Cas&h Receipt Journal")
            {
                Caption = 'Cas&h Receipt Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
            }
            action("Pa&yment Journal")
            {
                Caption = 'Pa&yment Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
            }
            separator(Action67)
            {
            }
            action("Analysis &View")
            {
                Caption = 'Analysis &View';
                Image = AnalysisView;
                RunObject = Page "Analysis View Card";
            }
            action("Analysis by &Dimensions")
            {
                Caption = 'Analysis by &Dimensions';
                Image = AnalysisViewDimension;
                RunObject = Page "Analysis by Dimensions";
            }
            action("Calculate Deprec&iation")
            {
                Caption = 'Calculate Deprec&iation';
                Ellipsis = true;
                Image = CalculateDepreciation;
                RunObject = Report "Calculate Depreciation";
            }
            action("Import Co&nsolidation from Database")
            {
                Caption = 'Import Co&nsolidation from Database';
                Ellipsis = true;
                Image = ImportDatabase;
                RunObject = Report "Import Consolidation from DB";
            }
            action("Bank Account R&econciliation")
            {
                Caption = 'Bank Account R&econciliation';
                Image = BankAccountRec;
                RunObject = Page "Bank Acc. Reconciliation List";
            }
            action("Adjust E&xchange Rates")
            {
                Caption = 'Adjust E&xchange Rates';
                Ellipsis = true;
                Image = AdjustExchangeRates;
                RunObject = Report "Adjust Exchange Rates";
            }
            action("P&ost Inventory Cost to G/L")
            {
                Caption = 'P&ost Inventory Cost to G/L';
                Image = PostInventoryToGL;
                RunObject = Report "Post Inventory Cost to G/L";
            }
            separator(Action97)
            {
            }
            action("C&reate Reminders")
            {
                Caption = 'C&reate Reminders';
                Ellipsis = true;
                Image = CreateReminders;
                RunObject = Report "Create Reminders";
            }
            action("Create Finance Charge &Memos")
            {
                Caption = 'Create Finance Charge &Memos';
                Ellipsis = true;
                Image = CreateFinanceChargememo;
                RunObject = Report "Create Finance Charge Memos";
            }
            separator(Action73)
            {
            }
            // action("Payment Service Tax")
            // {
            //     Caption = 'Payment Service Tax';
            //     RunObject = Page "Service Tax Payment";
            // }
            // action("VAT Settlement")
            // {
            //     Caption = 'VAT Settlement';
            //     RunObject = Page "VAT Settlement";
            // }
            action("TDS Adjustment Journal")
            {
                Caption = 'TDS Adjustment Journal';
                RunObject = Page "TDS Adjustment Journal";
            }
            separator(Action1500081)
            {
            }
            separator(Action80)
            {
                Caption = 'Administration';
                IsHeader = true;
            }
            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
            }
            separator("Legar Transction")
            {
                Caption = 'Legar Transction';
            }
            action("LCMS Data Update")
            {
                Image = "Report";
                RunObject = Page "LCM DATA UPDATE";
            }
            action("Collection Entry")
            {
                Caption = 'Collection Entry';
                Image = "Page";
                RunObject = Page "Collection Detail List";
            }
            action("Expence Entry")
            {
                Caption = 'Expense Entry';
                Image = "Page";
                RunObject = Page "Expense Detail List";
            }
        }
    }
}

