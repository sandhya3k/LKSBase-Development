report 50063 "Daily Bill/Memo Issued(Excel)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Daily Bill/Memo Issued(Excel)';
    DefaultLayout = RDLC;
    RDLCLayout = './res/DailyBillMemoIssuedExcel.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Location Code") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column("Min"; Min)
            {
            }
            column("Max"; Max)
            {
            }
            column(Sales_Invoice_Header__No__; "No.")
            {
            }
            column(Sales_Invoice_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Invoice_Header__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Sell_to_Customer_Name_; "Sales Invoice Header"."Sell-to Customer Name")
            {
            }
            column(Curr_Code_; "Curr Code")
            {
            }
            column(BILLAMT; BILLAMT)
            {
            }
            column(BILLAMTLCY; BILLAMTLCY)
            {
            }
            column(Prof_Fee; Prof_Fee)
            {
            }
            column(Reim_Exp; Reim_Exp)
            {
            }
            column(S_Tax; S_Tax)
            {
            }
            column(Category; Category)
            {
            }
            column(BILLAMT_Control1000000014; BILLAMT)
            {
            }
            column(BILLAMTLCY_Control1000000015; BILLAMTLCY)
            {
            }
            column(Prof_Fee_Control1000000026; Prof_Fee)
            {
            }
            column(Reim_Exp_Control1000000027; Reim_Exp)
            {
            }
            column(S_Tax_Control1000000030; S_Tax)
            {
            }
            column(Sales_Invoice_Header__Location_Code_; "Location Code")
            {
            }
            column(BILLAMT_Control1000000023; BILLAMT)
            {
            }
            column(BILLAMTLCY_Control1000000024; BILLAMTLCY)
            {
            }
            column(Prof_Fee_Control1000000031; Prof_Fee)
            {
            }
            column(Reim_Exp_Control1000000032; Reim_Exp)
            {
            }
            column(S_Tax_Control1000000033; S_Tax)
            {
            }
            column(Bill_No_Caption; Bill_No_CaptionLbl)
            {
            }
            column(Bill_DateCaption; Bill_DateCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Billing_CurrencyCaption; Billing_CurrencyCaptionLbl)
            {
            }
            column(Total_Amount__in_Billing_currency_Caption; Total_Amount__in_Billing_currency_CaptionLbl)
            {
            }
            column(Total_amount_in_INRCaption; Total_amount_in_INRCaptionLbl)
            {
            }
            column(Total_amount_of_Professional_FeesCaption; Total_amount_of_Professional_FeesCaptionLbl)
            {
            }
            column(Total_Amount_of_Reimburseable_ExpensesCaption; Total_Amount_of_Reimburseable_ExpensesCaptionLbl)
            {
            }
            column(Amount_of_Service_TaxCaption; Amount_of_Service_TaxCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(CategoryCaption; CategoryCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Owner1 := '';
                Owner2 := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Sales Invoice Header"."Shortcut Dimension 2 Code");
                if DimVal.Find('-') then begin
                    Owner1 := DimVal."Case-Owner1";
                    Owner2 := DimVal."Case-Owner2";
                    Category := DimVal."Case-Process";
                end;

                Cont.Reset;
                Cont.SetRange(Cont."No.", "Bill-to Contact No.");
                if Cont.Find('-') then begin
                    Contactname := Cont."F Name" + Cont."M Name" + Cont."L Name";
                end;

                CurRate := 0;
                CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                CurrExchangerate.SetRange(CurrExchangerate."Starting Date", 0D, "Posting Date");
                if CurrExchangerate.Find('+') then begin
                    CurRate := CurrExchangerate."Relational Exch. Rate Amount";
                end;

                if "Sales Invoice Header"."Currency Code" = '' then
                    "Curr Code" := 'INR'
                else
                    "Curr Code" := "Sales Invoice Header"."Currency Code";

                BILLAMT := 0;
                //TBD
                /*                
                SIL.SetRange(SIL."Document No.", "No.");
                if SIL.Find('-') then begin
                    repeat
                        BILLAMT += SIL."Amount To Customer";
                    until
                      SIL.Next = 0;
                end;
                */

                BILLAMTLCY := 0;
                if CurRate > 0 then
                    BILLAMTLCY := BILLAMT * CurRate
                else
                    BILLAMTLCY := BILLAMT;

                Taxable := 0;
                stax := 0;
                staxshe := 0;
                staxecess := 0;
                R_SIL.SetRange(R_SIL."Document No.", "Sales Invoice Header"."No.");
                //TBD //R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                if R_SIL.Find('-') then begin
                    repeat
                        Taxable += R_SIL."Line Amount";
                    //TBD
                    /*
                    stax += R_SIL."Service Tax Amount";
                    staxshe += R_SIL."Service Tax SHE Cess Amount";
                    staxecess += R_SIL."Service Tax eCess Amount";
                    */
                    until
                      R_SIL.Next = 0;
                end;
                S_TAX1 := stax + staxshe + staxecess;

                S_Tax := 0;
                if CurRate > 0 then
                    S_Tax := S_TAX1 * CurRate
                else
                    S_Tax := S_TAX1;

                Prof_Fee := 0;
                R_SIL2.SetRange(R_SIL2."Document No.", "Sales Invoice Header"."No.");
                R_SIL2.SetFilter(R_SIL2.Description, 'PROFESSIONAL');
                if R_SIL2.FindFirst then begin
                    repeat
                        if CurRate > 0 then
                            Prof_Fee += R_SIL2.Amount * CurRate
                        else
                            Prof_Fee += R_SIL2.Amount;
                    until
                       R_SIL2.Next = 0;
                end;

                Reim_Exp := 0;
                R_SIL1.SetRange(R_SIL1."Document No.", "Sales Invoice Header"."No.");
                R_SIL1.SetFilter(R_SIL1.Description, 'REIMBURSABLE');
                if R_SIL1.Find('-') then begin
                    repeat
                        if CurRate > 0 then
                            Reim_Exp += R_SIL1.Amount * CurRate
                        else
                            Reim_Exp += R_SIL1.Amount
                    until
                    R_SIL1.Next = 0;
                end;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(BILLAMTLCY, BILLAMT, S_Tax, Prof_Fee, Reim_Exp);

                Min := "Sales Invoice Header".GetRangeMin("Sales Invoice Header"."Posting Date");
                Max := "Sales Invoice Header".GetRangeMax("Sales Invoice Header"."Posting Date");
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
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Owner1: Text[60];
        Owner2: Text[60];
        DimVal: Record "Dimension Value";
        Cont: Record Contact;
        Contactname: Text[200];
        SIH: Record "Sales Invoice Header";
        CurrExchangerate: Record "Currency Exchange Rate";
        SIL: Record "Sales Invoice Line";
        BILLAMT: Decimal;
        BILLAMTLCY: Decimal;
        CurRate: Decimal;
        CustLedgEntry: Record "Cust. Ledger Entry";
        AmountLCY: Decimal;
        CompanyInfo: Record "Company Information";
        S_Tax: Decimal;
        Prof_Fee: Decimal;
        Reim_Exp: Decimal;
        Taxable: Decimal;
        stax: Decimal;
        staxshe: Decimal;
        staxecess: Decimal;
        R_SIL: Record "Sales Invoice Line";
        R_SIL1: Record "Sales Invoice Line";
        R_SIL2: Record "Sales Invoice Line";
        S_TAX1: Decimal;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Compinfo: Record "Company Information";
        "Curr Code": Code[10];
        PrintDetail: Boolean;
        "Min": Date;
        "Max": Date;
        Category: Code[30];
        Bill_No_CaptionLbl: Label 'Bill No.';
        Bill_DateCaptionLbl: Label 'Bill Date';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Client_NameCaptionLbl: Label 'Client Name';
        Billing_CurrencyCaptionLbl: Label 'Billing Currency';
        Total_Amount__in_Billing_currency_CaptionLbl: Label 'Total Amount (in Billing currency)';
        Total_amount_in_INRCaptionLbl: Label 'Total amount in INR';
        Total_amount_of_Professional_FeesCaptionLbl: Label 'Total amount of Professional Fees';
        Total_Amount_of_Reimburseable_ExpensesCaptionLbl: Label 'Total Amount of Reimburseable Expenses';
        Amount_of_Service_TaxCaptionLbl: Label 'Amount of Service Tax';
        FromCaptionLbl: Label 'From';
        ToCaptionLbl: Label 'To';
        CategoryCaptionLbl: Label 'Category';
        Grand_TotalCaptionLbl: Label 'Grand Total';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(Compinfo.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Report',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('Daily Bill_Memo Issued',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Bill No',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Bill Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Billing currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount(Billing currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Professional Fee',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Reimbusable Exp. ',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('S_Tax',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Category',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('Daily Bill_Memo Issued','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure SIHH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Bill No',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Bill Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Billing Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Professional Fee',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Reimbusable Exp. ',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('S_Tax',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIHB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Invoice Header"."No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Shortcut Dimension 1 Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer Name",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Curr Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMTLCY,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Prof_Fee,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Reim_Exp,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(S_Tax,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Category,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIHF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMTLCY,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Prof_Fee,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Reim_Exp,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(S_Tax,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

