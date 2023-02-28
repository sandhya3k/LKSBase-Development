report 50001 "Customer Ledger"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustomerLedger.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Customer Posting Group", "Date Filter";
            column(GETFILTERS; GetFilters)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(Customer__Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
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
            column(Amt_in_Foreign_CurrencyCaption; Amt_in_Foreign_CurrencyCaptionLbl)
            {
            }
            column(Amount_in_INRCaption; Amount_in_INRCaptionLbl)
            {
            }
            column(Payment_IdCaption; Payment_IdCaptionLbl)
            {
            }
            column(Payment_DateCaption; Payment_DateCaptionLbl)
            {
            }
            column(Document_typeCaption_Control1000000015; Document_typeCaption_Control1000000015Lbl)
            {
            }
            column(Memo_No_Caption; Memo_No_CaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
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
            column(Amt_in_Foreign_currencyCaption_Control1000000021; Amt_in_Foreign_currencyCaption_Control1000000021Lbl)
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
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Customer No." = FIELD("No."), "Posting Date" = FIELD("Date Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date", "Entry Type", "Currency Code");
                column(Customer__No__; Customer."No.")
                {
                }
                column(Customer_Name; Customer.Name)
                {
                }
                column(StartBalanceLCY; StartBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(DrText; DrText)
                {
                    AutoFormatType = 1;
                }
                column(InvoiceNo__; "InvoiceNo.")
                {
                }
                column(InvDocType; InvDocType)
                {
                }
                column(InvDocDate; InvDocDate)
                {
                }
                column(InvCurrency; InvCurrency)
                {
                }
                column(InvAmtFC; InvAmtFC)
                {
                }
                column(InvAmt; InvAmt)
                {
                }
                column(PayInvo__; "PayInvo.")
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
                column(MemoDate; MemoDate)
                {
                }
                column(checkno; checkno)
                {
                }
                column(checkdt; checkdt)
                {
                }
                column(PayCurrency; PayCurrency)
                {
                }
                column(ABS_PayAmtFC_; Abs(PayAmtFC))
                {
                }
                column(ABS_PayAmt_; Abs(PayAmt))
                {
                }
                column(Branchcode; Branchcode)
                {
                }
                column(PayInvo___Control1000000060; "PayInvo.")
                {
                }
                column(PayDocDate_Control1000000062; PayDocDate)
                {
                }
                column(PayDocType___Control1000000063; "PayDocType.")
                {
                }
                column(PayAmtFC; PayAmtFC)
                {
                }
                column(ABS_PayAmt__Control1000000065; Abs(PayAmt))
                {
                }
                column(InvAmtFC_Control1000000054; InvAmtFC)
                {
                }
                column(InvAmt_Control1000000055; InvAmt)
                {
                }
                column(ABS_PayAmt__Control1000000057; Abs(PayAmt))
                {
                }
                column(DrText_Control1000000038; DrText)
                {
                    AutoFormatType = 1;
                }
                column(EndingBal; EndingBal)
                {
                }
                column(Opening_Balance_IN_INRCaption; Opening_Balance_IN_INRCaptionLbl)
                {
                }
                column(Closing__Balance_IN_INRCaption; Closing__Balance_IN_INRCaptionLbl)
                {
                }
                column(Detailed_Cust__Ledg__Entry_Entry_No_; "Entry No.")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Customer_No_; "Customer No.")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Posting_Date; "Posting Date")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "InvoiceNo." := '';
                    InvDocDate := 0D;
                    InvDocType := 0;
                    InvCurrency := '';
                    ApplyInvNo := '';
                    Branchcode := '';
                    if ("Document Type" = "Document Type"::Invoice) and ("Entry Type" = "Entry Type"::"Initial Entry") then begin
                        "InvoiceNo." := "Document No.";
                        InvDocType := "Document Type";
                        InvDocDate := "Posting Date";
                        Branchcode := "Initial Entry Global Dim. 1";
                        // IF "Currency Code" ='' THEN
                        //InvAmtFC :=0
                        //  ELSE
                        // BEGIN;
                        InvAmtFC := "Detailed Cust. Ledg. Entry".Amount;
                        InvAmt := "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                        //  END ;

                        if "Currency Code" = '' then
                            InvCurrency := 'Rupees'
                        else
                            InvCurrency := "Currency Code";
                    end;


                    //For Document Type Payment
                    "PayInvo." := '';
                    PayDocDate := 0D;
                    "PayDocType." := 0;
                    PayAmtFC := 0;
                    PayAmt := 0;
                    PayCurrency := '';



                    if (("Document Type" = "Document Type"::Payment) and (("Initial Document Type" = "Initial Document Type"::Invoice)
                    ) and (Unapplied = false))
                        or (("Document Type" = "Document Type"::"Credit Memo") and ("Entry Type" = "Entry Type"::"Initial Entry"))
                        then begin
                        PayDocDate := "Posting Date";
                        "PayDocType." := "Document Type";

                        //IF "Currency Code"='' THEN
                        // PayAmtFC :=0
                        //ELSE
                        PayAmtFC := Amount;
                        PayAmt := "Amount (LCY)";

                        if "Document Type" <> "Document Type"::Invoice then
                            "PayInvo." := "Document No.";

                        if "Currency Code" = '' then
                            PayCurrency := 'Rupees'
                        else
                            PayCurrency := "Currency Code";

                        "InvoiceNo." := '';
                        InvDocType := 0;
                        InvDocDate := 0D;
                        InvAmtFC := 0;
                        InvAmt := 0;
                        InvCurrency := '';

                        //Check No. & check date

                        checkno := '';
                        checkdt := 0D;
                        CustLedgerEntry.Reset;
                        CustLedgerEntry.SetRange(CustLedgerEntry."Document No.", "Detailed Cust. Ledg. Entry"."Document No.");
                        CustLedgerEntry.SetFilter(CustLedgerEntry."Cheque No.", '<>%1', '');
                        //CustLedgerEntry.SETRANGE(CustLedgerEntry."Entry No.","Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                        if CustLedgerEntry.Find('-') then begin
                            checkno := CustLedgerEntry."Cheque No.";
                            checkdt := CustLedgerEntry."Cheque Date"
                        end;


                        //Memo No. & Memo Date

                        MemoNo := '';
                        MemoDate := 0D;
                        R_DetCustledg1.Reset;
                        R_DetCustledg1.SetCurrentKey("Cust. Ledger Entry No.", "Entry Type");
                        R_DetCustledg1.SetRange(R_DetCustledg1."Cust. Ledger Entry No.", "Cust. Ledger Entry No.");
                        R_DetCustledg1.SetRange(R_DetCustledg1."Document Type", R_DetCustledg1."Document Type"::Invoice);
                        R_DetCustledg1.SetRange(R_DetCustledg1.Unapplied, false);
                        R_DetCustledg1.SetRange(R_DetCustledg1."Entry Type", R_DetCustledg1."Entry Type"::"Initial Entry");
                        if R_DetCustledg1.FindFirst then
                            repeat
                                MemoNo := R_DetCustledg1."Document No.";
                                MemoDate := R_DetCustledg1."Posting Date";
                            until
                            R_DetCustledg1.Next = 0;
                    end
                    else begin
                        MemoDate := 0D;
                        MemoNo := '';
                        checkno := '';
                        checkdt := 0D;
                    end;


                    //TCPL_4216_V001.0_DT181110 START code for credit note
                    if ("Document Type" = "Document Type"::"Credit Memo") then begin
                        MemoNo := '';
                        MemoDate := 0D;
                        cle2.Reset;
                        cle2.SetRange(cle2."Document Type", cle2."Document Type"::Invoice);
                        cle2.SetRange(cle2."Closed by Entry No.", "Cust. Ledger Entry No.");
                        if cle2.FindFirst then
                            repeat
                                MemoNo := cle2."Document No.";
                                MemoDate := cle2."Posting Date";
                            until
                            cle2.Next = 0;
                    end;

                    //TCPL_4216_V001.0_DT181110 END
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(InvAmt);
                    CurrReport.CreateTotals(InvAmtFC);
                    CurrReport.CreateTotals(PayAmtFC);
                    CurrReport.CreateTotals(PayAmt);
                    CurrReport.CreateTotals(PayInvAmtFC);
                    Min := Customer.GetRangeMin(Customer."Date Filter");
                    Max := Customer.GetRangeMax(Customer."Date Filter");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartBalanceLCY := 0;
                R_DetCustledg.Reset;
                R_DetCustledg.SetFilter(R_DetCustledg."Customer No.", "No.");
                R_DetCustledg.SetFilter(R_DetCustledg."Posting Date", '%1..%2', 0D, Min - 1);
                if R_DetCustledg.FindFirst then
                    repeat
                        StartBalanceLCY := StartBalanceLCY + R_DetCustledg."Amount (LCY)";
                    until
                       R_DetCustledg.Next = 0;

                ClosingBalance := 0;
                R_DetCustledg.Reset;
                R_DetCustledg.SetFilter(R_DetCustledg."Customer No.", "No.");
                R_DetCustledg.SetFilter(R_DetCustledg."Posting Date", '%1..%2', Min, Max);
                if R_DetCustledg.FindFirst then
                    repeat
                        ClosingBalance := ClosingBalance + R_DetCustledg."Amount (LCY)";
                    until
                       R_DetCustledg.Next = 0;
                EndingBal := StartBalanceLCY + ClosingBalance;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(StartBalanceLCY);
                CurrReport.CreateTotals("Debit Amount", "Credit Amount");
                CurrReport.CreateTotals(BalDebit, BalCredit);

                Min := Customer.GetRangeMin(Customer."Date Filter");
                Max := Customer.GetRangeMax(Customer."Date Filter");
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

    trigger OnPreReport()
    begin
        CompInfo.Get
    end;

    var
        CompInfo: Record "Company Information";
        Name: Text[30];
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
        PrintAmountsInLCY: Boolean;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ApplycationStatus: Text[30];
        Cust: Record Customer;
        MemoDate: Date;
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        DrCrText: Text[2];
        DrCrTextBalance: Text[2];
        R_DetCustledg: Record "Detailed Cust. Ledg. Entry";
        R_SalesInv: Record "Sales Invoice Header";
        R_DetCustledg1: Record "Detailed Cust. Ledg. Entry";
        StartBalanceLCY: Decimal;
        BalDebit: Decimal;
        BalCredit: Decimal;
        CustDateFilter: Text[30];
        CustBalanceLCY: Decimal;
        DrText: Text[30];
        "Min": Date;
        Min1: Integer;
        "Max": Date;
        ClosingBalance: Decimal;
        EndingBal: Decimal;
        cle2: Record "Cust. Ledger Entry";
        ApplyInvNo: Code[20];
        R_DetCustledg2: Record "Detailed Cust. Ledg. Entry";
        ApplydocNo: Integer;
        R_DetCustledg3: Record "Detailed Cust. Ledg. Entry";
        checkno: Code[50];
        checkdt: Date;
        Branchcode: Code[15];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Memo_Bill_No_CaptionLbl: Label 'Memo/Bill No.';
        Document_typeCaptionLbl: Label 'Document type';
        Bill_Dt_CaptionLbl: Label 'Bill Dt.';
        CurrencyCaptionLbl: Label 'Currency';
        Amt_in_Foreign_CurrencyCaptionLbl: Label 'Amt in Foreign Currency';
        Amount_in_INRCaptionLbl: Label 'Amount in INR';
        Payment_IdCaptionLbl: Label 'Payment Id';
        Payment_DateCaptionLbl: Label 'Payment Date';
        Document_typeCaption_Control1000000015Lbl: Label 'Document type';
        Memo_No_CaptionLbl: Label 'Memo No.';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Cheque_Dt_CaptionLbl: Label 'Cheque Dt.';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        Amt_in_Foreign_currencyCaption_Control1000000021Lbl: Label 'Amt in Foreign currency';
        Cheque_Amount_in_INRCaptionLbl: Label 'Cheque Amount in INR';
        Opening_Balance_IN_INRCaptionLbl: Label 'Opening Balance IN INR';
        Closing__Balance_IN_INRCaptionLbl: Label 'Closing  Balance IN INR';
}

