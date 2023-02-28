report 50082 "Cust Ledger Acc. New"
{
    // // VERSIONS SUMMARY
    //    ================
    // 
    // // EIS
    // 
    //    VERSION HISTORY
    //    ---------------
    //    1.0     21/03/2003 - Manoj
    // 
    //    // Description
    //       --------------
    //       New Report.
    // //Fields Summary (Table Customer Ledger Entry)
    //   Customer No. : From Cust. ledger Entry
    //   Zone         : Customer Posting Group from Cus. Ledger Entry
    //   CustName     : Name from customer table related to customer No.
    //   OpenBalance  : Startbalance calculated for datefilter
    //   DebitAmount  : from cust. ledger entry
    //   CreditAmount : from cust. ledger entry
    //   Balance      : StartBalance + Amount(LCY)
    //   Type         : Document type
    //   Document No. : from cust. ledger entry
    //   Date         : Document Date
    //   Due Date     : Due Date from cust. ledger entry
    //   Description  : From customer ledger entry
    //   Debit Amount : From customer ledger entry
    //   Credit Amount: From customer ledger entry
    //   Balance      : StartBalance + Amount(LCY)
    //   Entry No.    : From customer ledger entry
    // 
    // // GENERAL COMMENTS
    //    ================
    //    All customizations are made for EG. They will be
    //    marked with version abbreviation and version no. Newly made
    //    variables will be added at the and of the list, separated by
    //    a blank variable "EIS-VARIABLES". Newly made functions will
    //    be added separated by a (local) dummy functions "EIS-FUNCTIONS".
    // 
    // // COPYRIGHT
    //    =========
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustLedgerAccNew.rdlc';

    Caption = 'Customer Ledger Account';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("Global Dimension 1 Code") ORDER(Ascending);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group", "Date Filter", "Global Dimension 1 Filter";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(text1; text1)
            {
            }
            column(text2; text2)
            {
            }
            column(Name__________City; Name + '     ' + City)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY_Control1000000044; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Customer_Customer__No__; Customer."No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Customer_Posting_Group_; "Customer Posting Group")
            {
            }
            column(Cust__Ledger_Entry___Debit_Amount_; "Cust. Ledger Entry"."Debit Amount")
            {
            }
            column(Cust__Ledger_Entry___Credit_Amount_; "Cust. Ledger Entry"."Credit Amount")
            {
            }
            column(StartBalanceLCY_Control1000000050; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY____Cust__Ledger_Entry__Amount; StartBalanceLCY + "Cust. Ledger Entry".Amount)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY_Control29; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Cust__Ledger_Entry___Amount__LCY__; "Cust. Ledger Entry"."Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(CustBalanceLCY; CustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Cust__Ledger_Entry___Debit_Amount__Control1000000083; "Cust. Ledger Entry"."Debit Amount")
            {
            }
            column(Cust__Ledger_Entry___Credit_Amount__Control1000000084; "Cust. Ledger Entry"."Credit Amount")
            {
            }
            column(BalDebit; BalDebit)
            {
            }
            column(BalCredit; BalCredit)
            {
            }
            column(Customer_LedgerCaption; Customer_LedgerCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(This_report_also_includes_customers_that_only_have_balances_Caption; This_report_also_includes_customers_that_only_have_balances_CaptionLbl)
            {
            }
            column(Customer_No_Caption; Customer_No_CaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(ZoneCaption; ZoneCaptionLbl)
            {
            }
            column(Open__Bal_Caption; Open__Bal_CaptionLbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(ZoneCaption_Control1000000025; ZoneCaption_Control1000000025Lbl)
            {
            }
            column(Debit_AmountCaption_Control1000000031; Debit_AmountCaption_Control1000000031Lbl)
            {
            }
            column(Credit_AmountCaption_Control1000000032; Credit_AmountCaption_Control1000000032Lbl)
            {
            }
            column(BalanceCaption_Control1000000033; BalanceCaption_Control1000000033Lbl)
            {
            }
            column(Open__Bal_Caption_Control1000000045; Open__Bal_Caption_Control1000000045Lbl)
            {
            }
            column(TypeCaption; TypeCaptionLbl)
            {
            }
            column(Document__No_Caption; Document__No_CaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Invoice__Dr__Amt_Caption; Invoice__Dr__Amt_CaptionLbl)
            {
            }
            column(Payment_Rec___Cr__Amt_Caption; Payment_Rec___Cr__Amt_CaptionLbl)
            {
            }
            column(BalanceCaption_Control1000000016; BalanceCaption_Control1000000016Lbl)
            {
            }
            column(Ch__NoCaption; Ch__NoCaptionLbl)
            {
            }
            column(Cheq__DtCaption; Cheq__DtCaptionLbl)
            {
            }
            column(BranchCaption; BranchCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Global_Dimension_2_Code_Caption; "Cust. Ledger Entry".FieldCaption("Global Dimension 2 Code"))
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Memo_No_Caption; Memo_No_CaptionLbl)
            {
            }
            column(Cheque_AmtCaption; Cheque_AmtCaptionLbl)
            {
            }
            column(Curr__CodeCaption; Curr__CodeCaptionLbl)
            {
            }
            column(Voucher_TypeCaption; Voucher_TypeCaptionLbl)
            {
            }
            column(Account_NameCaption; Account_NameCaptionLbl)
            {
            }
            column(Creation_DateCaption; Creation_DateCaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Opening_BalanceCaption_Control1000000043; Opening_BalanceCaption_Control1000000043Lbl)
            {
            }
            column(Total_Caption; Total_CaptionLbl)
            {
            }
            column(Total__Before_PeriodCaption; Total__Before_PeriodCaptionLbl)
            {
            }
            column(Balance_Total_DebitCaption; Balance_Total_DebitCaptionLbl)
            {
            }
            column(Balance_Total_CreditCaption; Balance_Total_CreditCaptionLbl)
            {
            }
            column(Customer_Global_Dimension_1_Code; "Global Dimension 1 Code")
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
                DataItemLink = "Customer No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Date Filter" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date") ORDER(Ascending) WHERE(Reversed = FILTER(<> true));
                column(StartBalanceLCY___Amount; StartBalanceLCY + Amount)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Posting_Date_; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(CustBalanceLCY_Control56; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Debit_Amount_; "Cust. Ledger Entry"."Debit Amount")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Credit_Amount_; "Cust. Ledger Entry"."Credit Amount")
                {
                }
                column(DOCTYPE; DOCTYPE)
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Chequeno; Chequeno)
                {
                }
                column(ChDate; ChDate)
                {
                }
                column(DimName; DimName)
                {
                }
                column(Cust__Ledger_Entry__Global_Dimension_2_Code_; "Global Dimension 2 Code")
                {
                }
                column(MemoDate; MemoDate)
                {
                }
                column(MemoNo; MemoNo)
                {
                }
                column(ChequeAmt; ChequeAmt)
                {
                }
                column(Curr_Code; Curr_Code)
                {
                }
                column(V_Type; V_Type)
                {
                }
                column(Account_Name; Account_Name)
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Document_Date_; "Cust. Ledger Entry"."Document Date")
                {
                }
                column(StartBalanceLCY___Amount_Control47; StartBalanceLCY + Amount)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Customer_No__; "Customer No.")
                {
                }
                column(Cust__Ledger_Entry__Customer_Posting_Group_; "Customer Posting Group")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Debit_Amount__Control1000000034; "Cust. Ledger Entry"."Debit Amount")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Credit_Amount__Control1000000036; "Cust. Ledger Entry"."Credit Amount")
                {
                }
                column(StartBalanceLCY_Control1000000051; StartBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustName; CustName)
                {
                }
                column(StartBalanceLCY____Cust__Ledger_Entry___Amount__LCY__; StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(ContinuedCaption_Control46; ContinuedCaption_Control46Lbl)
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Date_Filter; "Date Filter")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Customer.Get("Cust. Ledger Entry"."Customer No.") then
                        CustName := Customer.Name;
                    CalcFields(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)", "Credit Amount", "Debit Amount");
                    CustLedgEntryExists := true;
                    //IF PrintAmountsInLCY THEN BEGIN
                    //  CustAmount := "Amount (LCY)";
                    //  CustRemainAmount := "Remaining Amt. (LCY)";
                    //  CustCurrencyCode := '';
                    //END ELSE BEGIN
                    CustAmount := Amount;
                    CustRemainAmount := "Remaining Amount";
                    CustCurrencyCode := "Currency Code";
                    //END;
                    CustBalanceLCY := CustBalanceLCY + Amount;
                    //CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    if ("Document Type" = "Document Type"::Payment) or ("Document Type" = "Document Type"::Refund) then
                        CustEntryDueDate := 0D
                    else
                        CustEntryDueDate := "Due Date";
                    /*
                    CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                    CustBalanceLCY := StartBalanceLCY;
                    */

                    if not CustLedgEntryExists and ((StartBalanceLCY = 0) or not PrintAllHavingBal) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;

                    /*
                    GLEntry.RESET;
                    GLEntry.SETRANGE(GLEntry."Document No.","Cust. Ledger Entry"."Document No.");
                    IF GLEntry.FIND('-')  THEN
                       Narration:=GLEntry.Description
                    ELSE
                       Narration:='';
                    */

                    DOCTYPE := Format("Cust. Ledger Entry"."Document Type");

                    Chequeno := '';
                    ChDate := 0D;
                    "BkA/CLdENTRY".SetRange("BkA/CLdENTRY"."Document No.", "Document No.");
                    if "BkA/CLdENTRY".Find('-') then begin
                        Chequeno := "BkA/CLdENTRY"."Cheque No.";
                        ChDate := "BkA/CLdENTRY"."Cheque Date";
                    end
                    else begin
                        Chequeno := "Cust. Ledger Entry"."Cheque No.";
                        ChDate := "Cust. Ledger Entry"."Cheque Date";
                    end;



                    if ("Cust. Ledger Entry"."Document No." <> Var1) and
                    ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Payment) then begin
                        ChequeAmt := 0;
                        //Cust_Ledger_2.RESET;
                        //Cust_Ledger_2.SETRANGE(Cust_Ledger_2."Document No.","Document No.");
                        "BkA/CLdENTRY1".Reset;
                        "BkA/CLdENTRY1".SetRange("BkA/CLdENTRY1"."Document No.", "Document No.");
                        if "BkA/CLdENTRY1".FindSet then begin
                            ChequeAmt := "BkA/CLdENTRY1".Amount;
                            //     message('%1',ChequeAmt);
                        end;
                    end
                    else
                        ChequeAmt := 0;

                    Var1 := "Cust. Ledger Entry"."Document No.";
                    //TEAM::4216 Code for narration

                    DimValue.Reset;
                    DimValue.SetRange(DimValue."Dimension Code", 'Branch');
                    DimValue.SetRange(DimValue.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                    if DimValue.Find('-') then
                        DimName := DimValue.Name;

                    MemoNo := '';
                    MemoDate := 0D;
                    V_CLE.Reset;
                    V_CLE.SetRange(V_CLE."Entry No.", "Cust. Ledger Entry"."Closed by Entry No.");
                    V_CLE.SetFilter(V_CLE."Document Type", 'Invoice');
                    if V_CLE.Find('-') then begin
                        MemoNo := V_CLE."Document No.";
                        MemoDate := V_CLE."Posting Date";
                    end
                    else
                        V_CLE.Reset;
                    V_CLE.SetRange(V_CLE."Closed by Entry No.", "Cust. Ledger Entry"."Entry No.");
                    V_CLE.SetFilter(V_CLE."Document Type", 'Invoice');
                    if V_CLE.Find('-') then begin
                        MemoNo := V_CLE."Document No.";
                        MemoDate := V_CLE."Posting Date"
                    end;


                    /*
                    //4217
                    V_DCLE.RESET;
                    V_DCLE.SETRANGE(V_DCLE."Cust. Ledger Entry No.",V_CLE."Entry No.");
                    V_DCLE.SETRANGE(V_DCLE."Document No.","Document No.");
                    V_DCLE.SETFILTER(V_DCLE."Entry Type",'Initial Entry');
                    V_DCLE.SETFILTER(V_DCLE."Initial Document Type",'Invoice');
                    IF V_DCLE.FINDSET THEN BEGIN
                       V_CLE.SETRANGE(V_CLE."Entry No.",V_DCLE."Cust. Ledger Entry No.");
                       IF V_CLE.FINDSET THEN BEGIN
                          MemoNo := V_CLE."Document No.";
                          MemoDate := V_CLE."Posting Date";
                    END;
                    END;
                    //4217
                    */

                    Curr_Code := '';
                    Cust_Ledger.Reset;
                    Cust_Ledger.SetFilter(Cust_Ledger."Document No.", "Cust. Ledger Entry"."Document No.");
                    if Cust_Ledger.Find('-') then
                        if
"Cust. Ledger Entry"."Currency Code" = '' then
                            Curr_Code := 'INR'
                        else
                            Curr_Code := "Cust. Ledger Entry"."Currency Code";
                    ///END

                    V_Type := '';
                    Cust_Ledger_1.Reset;
                    Cust_Ledger_1.SetFilter(Cust_Ledger_1."Document No.", "Document No.");
                    if Cust_Ledger_1.Find('-') then begin
                        if Cust_Ledger_1."Journal Batch Name" = 'PIJVREPT' then
                            V_Type := 'JV RECEIPT'
                        else
                            if
                       Cust_Ledger_1."Journal Batch Name" = 'BOUNCE' then
                                V_Type := 'BOUNCED'
                            else
                                if
                           Cust_Ledger_1."Journal Batch Name" = 'JVWRITEOFF' then
                                    V_Type := 'WRITEOFF'
                                else
                                    V_Type := '';
                    end;

                    /*
                    Account_Name := '';
                    G_L_Entry.SETRANGE(G_L_Entry."Entry No.","Cust. Ledger Entry"."Entry No.");
                    G_L_Entry.SETFILTER(G_L_Entry."G/L Account No.",'<>99-99-999999');
                    IF G_L_Entry.FIND('-')THEN   BEGIN
                          Account_Name :=G_L_Entry."G/L Account No.";
                    END
                    */

                end;

                trigger OnPreDataItem()
                begin
                    CustLedgEntryExists := false;
                    CurrReport.CreateTotals(CustAmount, "Amount (LCY)", Amount);
                    CurrReport.CreateTotals("Cust. Ledger Entry"."Debit Amount", "Cust. Ledger Entry"."Credit Amount");
                    CurrReport.CreateTotals("Cust. Ledger Entry".Amount);
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(Customer_Name_Control48; Customer.Name)
                {
                }
                column(EndBalance; EndBalance)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry___Credit_Amount__Control1000000086; "Cust. Ledger Entry"."Credit Amount")
                {
                }
                column(Cust__Ledger_Entry___Debit_Amount__Control1000000094; "Cust. Ledger Entry"."Debit Amount")
                {
                }
                column(StartBalanceLCY_Control1000000097; StartBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(Customer__Customer_Posting_Group__Control1000000098; Customer."Customer Posting Group")
                {
                }
                column(Customer__No__; Customer."No.")
                {
                }
                column(Customer_Name_Control15; Customer.Name)
                {
                }
                column(CustBalanceLCY_Control17; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustAmount; CustAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry___Debit_Amount__Control1000000056; "Cust. Ledger Entry"."Debit Amount")
                {
                }
                column(Cust__Ledger_Entry___Credit_Amount__Control1000000057; "Cust. Ledger Entry"."Credit Amount")
                {
                }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if not CustLedgEntryExists and ((StartBalanceLCY = 0) or not PrintAllHavingBal) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;

                    //TCPL_4216 START
                    if EndBalance = 0 then
                        //IF (StartBalanceLCY=0) AND ("Cust. Ledger Entry".Amount=0) THEN
                        CurrReport.Skip;
                    //TCPL_4216 END
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals("Cust. Ledger Entry".Amount);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartBalanceLCY := 0;
                if CustDateFilter <> '' then
                    if GetRangeMin("Date Filter") <> 0D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        SetRange("Global Dimension 1 Code", Customer."Global Dimension 1 Filter");
                        //  SETRANGE("Global Dimension 1 Code","Cust. Ledger Entry"."Global Dimension 1 Code");
                        CalcFields("Net Change");
                        //  CALCFIELDS("Net Change (LCY)");
                        StartBalanceLCY := "Net Change";
                        //  StartBalanceLCY := "Net Change (LCY)";
                        SetFilter("Date Filter", CustDateFilter);
                    end;

                opening := 0;
                CLE.Reset;
                if br <> '' then begin
                    CLE.SetRange(CLE."Global Dimension 1 Code", br);
                    //MESSAGE(FORMAT(br));
                end;
                CLE.SetRange(CLE."Customer No.", Customer."No.");
                CLE.SetFilter(CLE."Posting Date", '%1..%2', 0D, GetRangeMin("Date Filter") - 1);
                if CLE.Find('-') then begin
                    repeat
                        CLE.CalcFields(CLE.Amount);
                        opening += CLE.Amount;
                    until
                    CLE.Next = 0;
                end;
                //TBD CurrReport.PrintOnlyIfDetail := not (PrintAllHavingBal and (StartBalanceLCY <> 0));
                CustBalanceLCY := StartBalanceLCY;
                //EndBalance := StartBalanceLCY + "Cust. Ledger Entry".Amount;
                EndBalance := StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)";
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
                CurrReport.CreateTotals("Cust. Ledger Entry"."Amount (LCY)", StartBalanceLCY);
                CurrReport.CreateTotals("Cust. Ledger Entry"."Debit Amount", "Cust. Ledger Entry"."Credit Amount");
                CurrReport.CreateTotals(BalDebit, BalCredit);
                CurrReport.CreateTotals("Cust. Ledger Entry".Amount);
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

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelBook;
    end;

    trigger OnPreReport()
    begin
        CompInfo.Get;

        if ((CustWise = false) and (ZoneWise = false)) then
            text1 := 'Detail'
        else
            text1 := 'Summary';
        if (ZoneWise = true) then
            text2 := 'Zone Wise'
        else
            text2 := '';
        CustFilter := Customer.GetFilters;
        CustDateFilter := Customer.GetFilter("Date Filter");
        with "Cust. Ledger Entry" do
            if PrintAmountsInLCY then begin
                AmountCaption := FieldCaption("Amount (LCY)");
                RemainingAmtCaption := FieldCaption("Remaining Amt. (LCY)");
            end else begin
                AmountCaption := FieldCaption(Amount);
                RemainingAmtCaption := FieldCaption("Remaining Amount");
            end;


        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Text000: Label 'Period: %1';
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        PrintAllHavingBal: Boolean;
        CustFilter: Text[250];
        CustDateFilter: Text[30];
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        CustAmount: Decimal;
        CustRemainAmount: Decimal;
        CustBalanceLCY: Decimal;
        CustCurrencyCode: Code[10];
        CustEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        CustLedgEntryExists: Boolean;
        CustWise: Boolean;
        ZoneWise: Boolean;
        CustName: Text[80];
        text1: Text[30];
        text2: Text[30];
        CustpostGroup: Record "Customer Posting Group";
        Description: Text[80];
        BalDebit: Decimal;
        BalCredit: Decimal;
        CustAddress: Text[250];
        GLEntry: Record "G/L Entry";
        Narration: Text[300];
        ShowNarr: Boolean;
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer" temporary;
        CompInfo: Record "Company Information";
        DOCTYPE: Text[30];
        "BkA/CLdENTRY": Record "Bank Account Ledger Entry";
        Chequeno: Code[35];
        ChDate: Date;
        PostedNarr: Record "Posted Narration";
        Narr: Text[1024];
        MemoNo: Code[20];
        R_DetCustledg: Record "Detailed Cust. Ledg. Entry";
        MemoDate: Date;
        R_custlgentry: Record "Cust. Ledger Entry";
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DimValue: Record "Dimension Value";
        DimName: Code[20];
        ChequeAmt: Decimal;
        Var1: Code[20];
        CreateCustLedgEntry: Record "Cust. Ledger Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        V_DCLE: Record "Detailed Cust. Ledg. Entry";
        V_CLE: Record "Cust. Ledger Entry";
        Curr_Code: Code[10];
        V_Type: Text[30];
        Cust_Ledger: Record "Cust. Ledger Entry";
        Cust_Ledger_1: Record "Cust. Ledger Entry";
        Cust_Ledger_2: Record "Cust. Ledger Entry";
        G_L_Entry: Record "G/L Entry";
        G_L_Acc: Record "G/L Account";
        Account_Name: Text[50];
        "BkA/CLdENTRY1": Record "Bank Account Ledger Entry";
        CLE: Record "Cust. Ledger Entry";
        opening: Decimal;
        br: Code[20];
        EndBalance: Decimal;
        Customer_LedgerCaptionLbl: Label 'Customer Ledger';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        This_report_also_includes_customers_that_only_have_balances_CaptionLbl: Label 'This report also includes customers that only have balances.';
        Customer_No_CaptionLbl: Label 'Customer No.';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Debit_AmountCaptionLbl: Label 'Debit Amount';
        ZoneCaptionLbl: Label 'Zone';
        Open__Bal_CaptionLbl: Label 'Open. Bal.';
        Credit_AmountCaptionLbl: Label 'Credit Amount';
        BalanceCaptionLbl: Label 'Balance';
        ZoneCaption_Control1000000025Lbl: Label 'Zone';
        Debit_AmountCaption_Control1000000031Lbl: Label 'Debit Amount';
        Credit_AmountCaption_Control1000000032Lbl: Label 'Credit Amount';
        BalanceCaption_Control1000000033Lbl: Label 'Balance';
        Open__Bal_Caption_Control1000000045Lbl: Label 'Open. Bal.';
        TypeCaptionLbl: Label 'Type';
        Document__No_CaptionLbl: Label 'Document  No.';
        DateCaptionLbl: Label 'Date';
        Invoice__Dr__Amt_CaptionLbl: Label 'Invoice (Dr. Amt)';
        Payment_Rec___Cr__Amt_CaptionLbl: Label 'Payment Rec. (Cr. Amt)';
        BalanceCaption_Control1000000016Lbl: Label 'Balance';
        Ch__NoCaptionLbl: Label 'Ch. No';
        Cheq__DtCaptionLbl: Label 'Cheq. Dt';
        BranchCaptionLbl: Label 'Branch';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Memo_No_CaptionLbl: Label 'Memo No.';
        Cheque_AmtCaptionLbl: Label 'Cheque Amt';
        Curr__CodeCaptionLbl: Label 'Curr. Code';
        Voucher_TypeCaptionLbl: Label 'Voucher Type';
        Account_NameCaptionLbl: Label 'Account Name';
        Creation_DateCaptionLbl: Label 'Creation Date';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        Opening_BalanceCaption_Control1000000043Lbl: Label 'Opening Balance';
        Total_CaptionLbl: Label 'Total ';
        Total__Before_PeriodCaptionLbl: Label 'Total  Before Period';
        Balance_Total_DebitCaptionLbl: Label 'Balance Total Debit';
        Balance_Total_CreditCaptionLbl: Label 'Balance Total Credit';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control46Lbl: Label 'Continued';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(CompInfo.Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
         */

    end;


    procedure CreateExcelBook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('Customer Ledger Account','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
         */

    end;


    procedure MakeExcelDataHeader()
    begin
    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[30];
    begin
    end;


    procedure HEADER()
    begin
        /*
        ExcelBuf.AddColumn('Company Name',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CompInfo.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('DATE',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(TODAY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('USER ID',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(USERID,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('FILTERS',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.GETFILTERS,FALSE,'',FALSE,FALSE,TRUE,'');
        
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Type',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Voucher Type',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Document No.',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Date',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Creation Date',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Cheque No',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Cheque Date',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Curr. Code',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Cheque Amt',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Branch',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Case',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Invlice (Dr) Amount',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Receipt (Cr) Amount',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Balance',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Memo No.',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Memo Date',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('G/L Account',FALSE,'',TRUE,FALSE,TRUE,'');
         */

    end;


    procedure PIHGH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."No.",FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.City,FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Opening Balance',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',TRUE,FALSE,TRUE,'');
         */

    end;


    procedure CB2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.City,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Opening Balance',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Address,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."Address 2",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.City,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."Post Code",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."Phone No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
         */

    end;


    procedure CLET1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Continue...',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY +"Cust. Ledger Entry"."Amount (LCY)",FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
         */

    end;


    procedure CLEF1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Customer No.",FALSE,'',FALSE,FALSE,TRUE,'');
        //ExcelBuf.AddColumn("Customer Posting Group",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.City,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Opening Balance',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
         */

    end;


    procedure CLEB2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(DOCTYPE,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(V_Type,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Posting Date",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document Date",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Chequeno,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(ChDate,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Curr_Code,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(ChequeAmt,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(DimName,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 2 Code",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CustBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(MemoNo,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(MemoDate,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Account_Name,FALSE,'',FALSE,FALSE,TRUE,'');
        //ExcelBuf.NewRow;
         */

    end;


    procedure CLEB3()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Narration,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        */

    end;


    procedure CLET2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Continue...',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY +"Cust. Ledger Entry"."Amount (LCY)",FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        */

    end;


    procedure CLEF5()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Customer No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Customer Posting Group",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CustName,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        */

    end;


    procedure IB1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer."Customer Posting Group",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        */

    end;


    procedure IB2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CustBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        */

    end;


    procedure CGF14()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."Customer Posting Group",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
         */

    end;


    procedure CF15()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total  Before Period',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn( "Cust. Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',FALSE,FALSE,TRUE,'');
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(StartBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)",FALSE,'',FALSE,FALSE,TRUE,'');
        
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Balance Total debit',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(BalDebit,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Balance Total credit',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(BalCredit,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
         */

    end;
}

