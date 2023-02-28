report 50016 "Cust. Ledger Entry1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustLedgerEntry1.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(Customer_Customer_Name; Customer.Name)
            {
            }
            column(Opening_Balance_As_On_______FORMAT_GETRANGEMIN__Date_Filter___; 'Opening Balance As On' + ' ' + Format(GetRangeMin("Date Filter")))
            {
            }
            column(ABS_OpeningDRBal_OpeningCRBal_; Abs(OpeningDRBal - OpeningCRBal))
            {
            }
            column(DrCrTextBalance; DrCrTextBalance)
            {
            }
            column(CustBalanceLCY; CustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalAdjLCY; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Customer_LedgerCaption; Customer_LedgerCaptionLbl)
            {
            }
            column(Memo_Bill_No_Caption; Memo_Bill_No_CaptionLbl)
            {
            }
            column(Document_typeCaption; Document_typeCaptionLbl)
            {
            }
            column(Bill_Dt_Caption; Bill_Dt_CaptionLbl)
            {
            }
            column(CurrencyCaption; CurrencyCaptionLbl)
            {
            }
            column(Amount_in_Foreign_CurrencyCaption; Amount_in_Foreign_CurrencyCaptionLbl)
            {
            }
            column(Amount_in_INRCaption; Amount_in_INRCaptionLbl)
            {
            }
            column(Payment_DateCaption; Payment_DateCaptionLbl)
            {
            }
            column(Document_typeCaption_Control1000000009; Document_typeCaption_Control1000000009Lbl)
            {
            }
            column(Memol_No_Caption; Memol_No_CaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Application_statusCaption; Application_statusCaptionLbl)
            {
            }
            column(Cheque_No_Caption; Cheque_No_CaptionLbl)
            {
            }
            column(Cheque_Dt_Caption; Cheque_Dt_CaptionLbl)
            {
            }
            column(Currency_CodeCaption; Currency_CodeCaptionLbl)
            {
            }
            column(Amount_in_Foreign_currencyCaption_Control1000000019; Amount_in_Foreign_currencyCaption_Control1000000019Lbl)
            {
            }
            column(Cheque_Amount_in_INRCaption; Cheque_Amount_in_INRCaptionLbl)
            {
            }
            column(Customer_No_; "No.")
            {
            }
            column(Customer_Date_Filter; "Date Filter")
            {
            }
            column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date");
                column(InvoiceNo__; "InvoiceNo.")
                {
                }
                column(ABS_InvAmtFC_; Abs(InvAmtFC))
                {
                }
                column(InvCurrency; InvCurrency)
                {
                }
                column(InvDocDate; InvDocDate)
                {
                }
                column(PayDocDate; PayDocDate)
                {
                }
                column(PayDocType__; "PayDocType.")
                {
                }
                column(MemoNo; MemoNo)
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_No__; "Cust. Ledger Entry"."Cheque No.")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_Date_; "Cust. Ledger Entry"."Cheque Date")
                {
                }
                column(PayCurrency; PayCurrency)
                {
                }
                column(PayInvAmtFC; PayInvAmtFC)
                {
                }
                column(InvDocType; InvDocType)
                {
                }
                column(ABS_InvAmt_; Abs(InvAmt))
                {
                }
                column(ABS_PayAmt_; Abs(PayAmt))
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }
                column(Cust__Ledger_Entry_Posting_Date; "Posting Date")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Cust__Ledger_Entry_Date_Filter; "Date Filter")
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = FIELD("Entry No.");

                    trigger OnAfterGetRecord()
                    begin
                        if ("Detailed Cust. Ledg. Entry"."Document Type" = "Detailed Cust. Ledg. Entry"."Document Type"::Invoice) or
                            ("Detailed Cust. Ledg. Entry"."Document Type" = "Detailed Cust. Ledg. Entry"."Document Type"::"Credit Memo") then begin
                            Customer.Get("Detailed Cust. Ledg. Entry"."Customer No.");
                            "InvoiceNo." := "Detailed Cust. Ledg. Entry"."Document No.";
                            InvDocType := "Detailed Cust. Ledg. Entry"."Document Type";
                            InvDocDate := "Detailed Cust. Ledg. Entry"."Posting Date";
                            if "Detailed Cust. Ledg. Entry"."Currency Code" = '' then
                                InvAmtFC := 0
                            else
                                InvAmtFC := "Detailed Cust. Ledg. Entry".Amount;
                            InvAmt := "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                            if "Detailed Cust. Ledg. Entry"."Currency Code" = '' then
                                InvCurrency := 'Rupees'
                            else
                                InvCurrency := "Detailed Cust. Ledg. Entry"."Currency Code";
                            "PayInvo." := '';
                            PayDocDate := 0D;
                            "PayDocType." := 0;
                            PayAmtFC := 0;
                            PayAmt := 0;
                            PayCurrency := '';
                        end;

                        //For Document Type Payment
                        if ("Detailed Cust. Ledg. Entry"."Document Type" = "Detailed Cust. Ledg. Entry"."Document Type"::Payment) or
                             ("Detailed Cust. Ledg. Entry"."Document Type" = 0)
                          then begin
                            Customer.Get("Detailed Cust. Ledg. Entry"."Customer No.");
                            "PayInvo." := "Detailed Cust. Ledg. Entry"."Document No.";
                            PayDocDate := "Detailed Cust. Ledg. Entry"."Posting Date";
                            "PayDocType." := "Detailed Cust. Ledg. Entry"."Document Type";
                            if "Detailed Cust. Ledg. Entry"."Currency Code" = '' then
                                PayAmtFC := 0
                            else
                                PayAmtFC := "Detailed Cust. Ledg. Entry".Amount;
                            PayAmt := "Detailed Cust. Ledg. Entry"."Amount (LCY)";

                            //Applied Doc. No Begin
                            MemoNo := '';
                            DetailCustLedgerEntry.Reset;
                            DetailCustLedgerEntry.SetRange("Cust. Ledger Entry No.", "Entry No.");
                            if DetailCustLedgerEntry.FindFirst then
                                repeat
                                    if DetailCustLedgerEntry."Document Type" = DetailCustLedgerEntry."Document Type"::Invoice then
                                        MemoNo := DetailCustLedgerEntry."Document No."
                                until
                                     DetailCustLedgerEntry.Next = 0;

                        end;
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                if CustomerNo <> "No." then begin
                    CustomerNo := "No.";
                    OpeningDRBal := 0;
                    OpeningCRBal := 0;
                    /*
                    DetailCustLedgerEntry.RESET;
                    //DetailCustLedgerEntry.SETRANGE(DetailCustLedgerEntry."Customer No.","No.");
                    //DetailCustLedgerEntry.SETFILTER("Posting Date", '%1..%2', 0D,(("Date Filter")-1));

                         DetailCustLedgerEntry.CALCSUMS(Amount);
                      IF DetailCustLedgerEntry.Amount > 0 THEN
                        OpeningDRBal := DetailCustLedgerEntry.Amount;
                      IF DetailCustLedgerEntry.Amount < 0 THEN
                        OpeningCRBal := -DetailCustLedgerEntry.Amount;

                      DrCrTextBalance:='';
                      IF OpeningDRBal - OpeningCRBal > 0 THEN
                        DrCrTextBalance := 'Dr';
                      IF OpeningDRBal - OpeningCRBal < 0 THEN
                        DrCrTextBalance := 'Cr';
                    */
                end;

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompInfo.Get;
    end;

    var
        CompInfo: Record "Company Information";
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        DrCrText: Text[2];
        DrCrTextBalance: Text[2];
        CustomerNo: Code[20];
        DetailCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
        "InvoiceNo.": Text[30];
        InvDocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        InvDocDate: Date;
        InvCurrency: Text[30];
        InvAmtFC: Decimal;
        InvAmt: Decimal;
        Total1: Decimal;
        "PayInvo.": Text[30];
        "PayDocType.": Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund,JV;
        PayDocDate: Date;
        PayCurrency: Text[30];
        PayAmtFC: Decimal;
        PayAmt: Decimal;
        Total2: Decimal;
        PayDocNo: Text[30];
        PayInvAmtFC: Decimal;
        PayInvAmt: Decimal;
        CustLedgEntryExists: Boolean;
        PrintOnlyOnePerPage: Boolean;
        CustWise: Boolean;
        MemoNo: Code[20];
        TransDebits: Decimal;
        TransCredits: Decimal;
        DrCrTextBalance2: Text[2];
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;
        CustLedgEntry: Record "Cust. Ledger Entry";
        CustDateFilter: Text[30];
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        ExcludeBalanceOnly: Boolean;
        CustBalanceLCY: Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Customer_LedgerCaptionLbl: Label 'Customer Ledger';
        Memo_Bill_No_CaptionLbl: Label 'Memo/Bill No.';
        Document_typeCaptionLbl: Label 'Document type';
        Bill_Dt_CaptionLbl: Label 'Bill Dt.';
        CurrencyCaptionLbl: Label 'Currency';
        Amount_in_Foreign_CurrencyCaptionLbl: Label 'Amount in Foreign Currency';
        Amount_in_INRCaptionLbl: Label 'Amount in INR';
        Payment_DateCaptionLbl: Label 'Payment Date';
        Document_typeCaption_Control1000000009Lbl: Label 'Document type';
        Memol_No_CaptionLbl: Label 'Memol No.';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Application_statusCaptionLbl: Label 'Application status';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Cheque_Dt_CaptionLbl: Label 'Cheque Dt.';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        Amount_in_Foreign_currencyCaption_Control1000000019Lbl: Label 'Amount in Foreign currency';
        Cheque_Amount_in_INRCaptionLbl: Label 'Cheque Amount in INR';
}

