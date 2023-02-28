report 50067 "Memo Raised Aa On(Excel)"
{
    // //TEAM::6.01::1426-->Report is created for consolidate transaction entries.
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Memo Raised Aa On(Excel)';
    DefaultLayout = RDLC;
    RDLCLayout = './res/MemoRaisedAaOnExcel.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Location Code") ORDER(Ascending);
            RequestFilterFields = "Currency Code", "Posting Date";
            column(Memos_Raised_As_On______FORMAT_Report_Date_; 'Memos Raised As On' + ' ' + Format(Report_Date))
            {
            }
            column(Daily_Memos_100000; Daily_Memos / 100000)
            {
            }
            column(Monthly_Memos_100000; Monthly_Memos / 100000)
            {
            }
            column(Collective_Memos_100000; Collective_Memos / 100000)
            {
            }
            column(DimName; DimName)
            {
            }
            column(Daily_Memos_100000_Control1000000000; Daily_Memos / 100000)
            {
            }
            column(Monthly_Memos_100000_Control1000000014; Monthly_Memos / 100000)
            {
            }
            column(Collective_Memos_100000_Control1000000015; Collective_Memos / 100000)
            {
            }
            column(Reim_Expence_100000; Reim_Expence / 100000)
            {
            }
            column(S_tax1_100000; S_tax1 / 100000)
            {
            }
            column(Amount_In_Rs__LacsCaption; Amount_In_Rs__LacsCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Daily_MemosCaption; Daily_MemosCaptionLbl)
            {
            }
            column(Monthly_MemosCaption; Monthly_MemosCaptionLbl)
            {
            }
            column(Collective_MemosCaption; Collective_MemosCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Total_Expenditure_included_in_the_bills_issuedCaption; Total_Expenditure_included_in_the_bills_issuedCaptionLbl)
            {
            }
            column(Total_Service_Tax_Incluede_in_the_bills_issuedCaption; Total_Service_Tax_Incluede_in_the_bills_issuedCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            column(Sales_Invoice_Header_Location_Code; "Location Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //For Currency Exchange Rate
                Curr_Rate := 0;
                Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Currency Code", "Sales Invoice Header"."Currency Code");
                Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Starting Date", "Sales Invoice Header"."Posting Date");
                if Curr_Exch_Rate.Find('+') then
                    Curr_Rate := Curr_Exch_Rate."Relational Exch. Rate Amount";

                Dim_Value.Reset;
                Dim_Value.SetRange(Dim_Value."Dimension Code", 'Branch');
                Dim_Value.SetRange(Dim_Value.Code, "Sales Invoice Header"."Shortcut Dimension 1 Code");
                if Dim_Value.FindSet then
                    DimName := Dim_Value.Name;

                //For Invoice Amount
                Inv_Amt := 0;
                //TBD
                /*
                S_Inv_Line.SetFilter(S_Inv_Line."Location Code", "Sales Invoice Header"."Location Code");
                S_Inv_Line.SetRange(S_Inv_Line."Posting Date", "Sales Invoice Header"."Posting Date");
                S_Inv_Line.SetRange(S_Inv_Line."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line.SetFilter(S_Inv_Line."Posting Date", '%1', Report_Date);
                if S_Inv_Line.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            Daily_Memos += S_Inv_Line."Amount To Customer" * Curr_Rate
                        else
                            Daily_Memos += S_Inv_Line."Amount To Customer"
                    until
                       S_Inv_Line.Next = 0;



                S_Inv_Line.Reset;
                S_Inv_Line.SetFilter(S_Inv_Line."Location Code", "Sales Invoice Header"."Location Code");
                S_Inv_Line.SetRange(S_Inv_Line."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line.SetFilter(S_Inv_Line."Posting Date", '%1..%2', MonthStartDt, Report_Date);
                if S_Inv_Line.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            Monthly_Memos += S_Inv_Line."Amount To Customer" * Curr_Rate
                        else
                            Monthly_Memos += S_Inv_Line."Amount To Customer"
                    until
                         S_Inv_Line.Next = 0;

                S_Inv_Line1.Reset;
                S_Inv_Line1.SetFilter(S_Inv_Line1."Location Code", "Sales Invoice Header"."Location Code");
                S_Inv_Line1.SetRange(S_Inv_Line1."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line1.SetFilter(S_Inv_Line1."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if S_Inv_Line1.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            Collective_Memos += S_Inv_Line1."Amount To Customer" * Curr_Rate
                        else
                            Collective_Memos += S_Inv_Line1."Amount To Customer"
                     until
                       S_Inv_Line1.Next = 0;
                */

                //For Reimbursable Income
                Reim_Expence := 0;
                S_Inv_Line1.Reset;
                S_Inv_Line1.SetRange(S_Inv_Line1."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line1.SetRange(S_Inv_Line1."Posting Date", FYStartingDate, Report_Date);
                S_Inv_Line1.SetFilter(S_Inv_Line1.Description, 'REIMBURSABLE|Reimburseable expenses');
                if S_Inv_Line1.FindFirst then begin
                    repeat
                        if Curr_Rate > 0 then
                            Reim_Expence += S_Inv_Line1.Amount * Curr_Rate
                        else
                            Reim_Expence += S_Inv_Line1.Amount;
                    until
                         S_Inv_Line1.Next = 0;
                end;

                //For service tax calcultaion
                //STax:=0;
                //TBD
                /*
                S_Inv_Line1.Reset;
                S_Inv_Line1.SetRange(S_Inv_Line1."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line1.SetFilter(S_Inv_Line1."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                S_Inv_Line1.SetFilter(S_Inv_Line1."Service Tax Group", 'LEGAL');
                if S_Inv_Line1.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            STax += Round(S_Inv_Line1."Service Tax Amount" * Curr_Rate)
                        else
                            STax += Round(S_Inv_Line1."Service Tax Amount");
                    until
                      S_Inv_Line1.Next = 0;

                //STaxShe:=0;
                S_Inv_Line1.Reset;
                S_Inv_Line1.SetRange(S_Inv_Line1."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line1.SetFilter(S_Inv_Line1."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                S_Inv_Line1.SetFilter(S_Inv_Line1."Service Tax Group", 'LEGAL');
                if S_Inv_Line1.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            STaxShe += Round(S_Inv_Line1."Service Tax SHE Cess Amount" * Curr_Rate)
                        else
                            STaxShe += Round(S_Inv_Line1."Service Tax SHE Cess Amount")
                    until
                      S_Inv_Line1.Next = 0;


                //STaxEcess:=0;
                S_Inv_Line1.Reset;
                S_Inv_Line1.SetRange(S_Inv_Line1."Document No.", "Sales Invoice Header"."No.");
                S_Inv_Line1.SetFilter(S_Inv_Line1."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                S_Inv_Line1.SetFilter(S_Inv_Line1."Service Tax Group", 'LEGAL');
                if S_Inv_Line1.FindSet then
                    repeat
                        if Curr_Rate > 0 then
                            STaxEcess += Round(S_Inv_Line1."Service Tax eCess Amount" * Curr_Rate)
                        else
                            STaxEcess += Round(S_Inv_Line1."Service Tax eCess Amount")
                    until
                      S_Inv_Line1.Next = 0;
                */

                S_tax1 := STax + STaxShe + STaxEcess


                /*
                S_tax:=0;
                IF Curr_Rate >0 THEN
                    S_tax  :=S_tax1*Curr_Rate
                ELSE
                    S_tax  :=S_tax1;
                */
                //For Service Tax END

                /*
                S_Inv_Line1.RESET;
                S_Inv_Line1.SETRANGE(S_Inv_Line1."Document No.","Sales Invoice Header"."No.");
                S_Inv_Line1.SETFILTER(S_Inv_Line1."Posting Date",'%1..%2',FYStartingDate,Report_Date);
                S_Inv_Line1.SETFILTER(S_Inv_Line1.Description,'REIMBURSABLE');
                  IF S_Inv_Line1.FIND('-') THEN
                       REPEAT
                          IF Curr_Rate > 0 THEN
                             Reim_Expence+=S_Inv_Line1."Amount To Customer"*Curr_Rate
                          ELSE
                             Reim_Expence+=S_Inv_Line1."Amount To Customer"
                        UNTIL
                          S_Inv_Line1.NEXT = 0;
                */

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Daily_Memos, Monthly_Memos, Collective_Memos, S_tax, Reim_Expence);

                AccountingPeriod.SetFilter(AccountingPeriod."Starting Date", '<=1', Report_Date);
                AccountingPeriod.SetRange("New Fiscal Year", true);
                if AccountingPeriod.Find('+') then
                    FYStartingDate := AccountingPeriod."Starting Date";
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            column(Amt_In_INR_100000; Amt_In_INR / 100000)
            {
            }
            column(Cr_Monthly_Amt_100000; Cr_Monthly_Amt / 100000)
            {
            }
            column(Cr_Daily_Amt_100000; Cr_Daily_Amt / 100000)
            {
            }
            column(Credit_NoteCaption; Credit_NoteCaptionLbl)
            {
            }
            column(Sales_Cr_Memo_Header_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Curr_Rate1 := 0;
                Curr_Exch_Rate1.Reset;
                Curr_Exch_Rate1.SetRange(Curr_Exch_Rate1."Currency Code", "Sales Cr.Memo Header"."Currency Code");
                Curr_Exch_Rate1.SetRange(Curr_Exch_Rate1."Starting Date", "Sales Cr.Memo Header"."Posting Date");
                if Curr_Exch_Rate1.Find('+') then
                    Curr_Rate1 := Curr_Exch_Rate1."Relational Exch. Rate Amount";


                Cr_Daily_Amt := 0;
                //TBD
                /*
                S_Cr_Line.Reset;
                S_Cr_Line.SetRange(S_Cr_Line."Posting Date", "Sales Cr.Memo Header"."Posting Date");
                S_Cr_Line.SetRange(S_Cr_Line."Document No.", "Sales Cr.Memo Header"."No.");
                S_Cr_Line.SetFilter(S_Cr_Line."Posting Date", '%1', Report_Date);
                if S_Cr_Line.Find('-') then
                    repeat
                        if Curr_Rate > 0 then
                            Cr_Daily_Amt += S_Cr_Line."Amount To Customer" * Curr_Rate
                        else
                            Cr_Daily_Amt += S_Cr_Line."Amount To Customer"
                    until
                       S_Cr_Line.Next = 0;

                Cr_Monthly_Amt := 0;
                S_Cr_Line1.Reset;
                S_Cr_Line1.SetRange(S_Cr_Line1."Document No.", "Sales Cr.Memo Header"."No.");
                S_Cr_Line1.SetFilter(S_Cr_Line1."Posting Date", '%1..%2', MonthStartDt, Report_Date);
                if S_Cr_Line1.Find('-') then
                    repeat
                        if
                        Curr_Rate > 0 then
                            Cr_Monthly_Amt += S_Cr_Line1."Amount To Customer" * Curr_Rate
                        else
                            Cr_Monthly_Amt += S_Cr_Line1."Amount To Customer"
                    until
                       S_Cr_Line1.Next = 0;

                Cr_Collective_Amt := 0;
                S_Cr_Line2.Reset;
                S_Cr_Line2.SetFilter(S_Cr_Line2."Location Code", "Sales Cr.Memo Header"."Location Code");
                S_Cr_Line2.SetRange(S_Cr_Line2."Document No.", "Sales Cr.Memo Header"."No.");
                S_Cr_Line2.SetFilter(S_Cr_Line2."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if S_Cr_Line2.Find('-') then
                    repeat
                        Cr_Collective_Amt += S_Cr_Line2."Amount To Customer";
                    until
                         S_Cr_Line2.Next = 0;
                */

                if Curr_Rate1 > 0 then
                    Amt_In_INR := Cr_Collective_Amt * Curr_Rate1
                else
                    Amt_In_INR := Cr_Collective_Amt
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Cr_Collective_Amt, Cr_Monthly_Amt, Cr_Daily_Amt, Amt_In_INR);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Report Date"; Report_Date)
                {
                    ApplicationArea = All;
                }
            }
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
        Report_Date := WorkDate;
    end;

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        if PrintToExcel then
            MakeExcelInfo;

        MonthStartDt := CalcDate('<-CM>', Report_Date);
        MonthEndDate := CalcDate('<CM>', Report_Date);
    end;

    var
        Location: Text[30];
        Daily_Memos: Decimal;
        Daily_Memos1: Decimal;
        Monthly_Memos: Decimal;
        Monthly_Memos1: Decimal;
        Collective_Memos: Decimal;
        Collective_Memos1: Decimal;
        Dim_Value: Record "Dimension Value";
        S_Inv_Line: Record "Sales Invoice Line";
        Curr_Rate: Decimal;
        Curr_Exch_Rate: Record "Currency Exchange Rate";
        Curr_Exch_Rate1: Record "Currency Exchange Rate";
        Inv_Amt: Decimal;
        Report_Date: Date;
        DimName: Text[30];
        MonthStartDt: Date;
        CurrentDate: Date;
        MonthEndDate: Date;
        S_Inv_Line1: Record "Sales Invoice Line";
        AccountingPeriod: Record "Accounting Period";
        PeriodStartingDate: Date;
        FYStartingDate: Date;
        STax: Decimal;
        STaxI: Decimal;
        STaxShe: Decimal;
        STaxSheI: Decimal;
        STaxEcess: Decimal;
        STaxEcessI: Decimal;
        S_tax: Decimal;
        Service_tax: Decimal;
        Reim_Expence: Decimal;
        S_Cr_Line: Record "Sales Cr.Memo Line";
        Cr_Collective_Amt: Decimal;
        S_Cr_Header: Record "Sales Cr.Memo Header";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Compinfo: Record "Company Information";
        Amt_In_INR: Decimal;
        Curr_Rate1: Decimal;
        Cr_Monthly_Amt: Decimal;
        Cr_Daily_Amt: Decimal;
        S_Cr_Line1: Record "Sales Cr.Memo Line";
        S_Cr_Line2: Record "Sales Cr.Memo Line";
        S_tax1: Decimal;
        Reim_Expence1: Decimal;
        Reim_Expence2: Decimal;
        Amount_In_Rs__LacsCaptionLbl: Label 'Amount In Rs. Lacs';
        LocationCaptionLbl: Label 'Location';
        Daily_MemosCaptionLbl: Label 'Daily Memos';
        Monthly_MemosCaptionLbl: Label 'Monthly Memos';
        Collective_MemosCaptionLbl: Label 'Collective Memos';
        Grand_TotalCaptionLbl: Label 'Grand Total';
        Total_Expenditure_included_in_the_bills_issuedCaptionLbl: Label 'Total Expenditure included in the bills issued';
        Total_Service_Tax_Incluede_in_the_bills_issuedCaptionLbl: Label 'Total Service Tax Incluede in the bills issued';
        Credit_NoteCaptionLbl: Label 'Credit Note';


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
        ExcelBuf.AddInfoColumn('Memo Issued As On..',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        */

    end;

    local procedure MakeExcelDataHeader()
    begin
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
        ExcelBuf.CreateSheet('Memo Issued As On..','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure SIH2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Memo Raised As On'+' '+FORMAT(Report_Date),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIH3()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Amount in Rs. Lacs',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIH1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('LOCATION',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('DAILY MEMOS',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('MONTHLY MEMOS',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('COLLECTIVE MEMOS',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure SIHGF1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(DimName,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Daily_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Monthly_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Collective_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIHF1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('GRAND TOTAL',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Daily_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Monthly_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Collective_Memos)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIHF2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total Expenditure included in bills issued',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Reim_Expence)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIHF3()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total Service Tax included in bills issued',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((S_tax1)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SCRH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Credit Note',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Cr_Daily_Amt)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Cr_Monthly_Amt)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn((Amt_In_INR)/100000,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

