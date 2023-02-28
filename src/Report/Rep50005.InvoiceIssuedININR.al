report 50005 "Invoice Issued IN INR"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/InvoiceIssuedININR.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Global Dimension 1 Code", "Global Dimension 2 Code") ORDER(Ascending) WHERE("Document Type" = FILTER(Invoice));
            RequestFilterFields = "Global Dimension 1 Code";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(Invoice_Issued_Report_for_______FORMAT_ReportDate_; 'Invoice Issued Report for' + ' ' + Format(ReportDate))
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Invoice_Issued_on_______FORMAT_ReportDate_; 'Invoice Issued on' + ' ' + Format(ReportDate))
            {
            }
            column(DimName; DimName)
            {
            }
            column(Amount1; Amount1)
            {
            }
            column(Amount2; Amount2)
            {
            }
            column(Amount3; Amount3)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Amount__LCY__; "Cust. Ledger Entry"."Amount (LCY)")
            {
            }
            column(Amount3_Control1000000008; Amount3)
            {
            }
            column(Amount1_Control1000000009; Amount1)
            {
            }
            column(Amount2_Control1000000011; Amount2)
            {
            }
            column(Invoice_IssuedCaption; Invoice_IssuedCaptionLbl)
            {
            }
            column(Branch_NameCaption; Branch_NameCaptionLbl)
            {
            }
            column(This_periodCaption; This_periodCaptionLbl)
            {
            }
            column(Fiscal_Year_untilCaption; Fiscal_Year_untilCaptionLbl)
            {
            }
            column(Total_Billed_Amount_In_INRCaption; Total_Billed_Amount_In_INRCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                DimValue.Reset;
                DimValue.SetRange(DimValue."Dimension Code", 'Branch');
                DimValue.SetRange(DimValue.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                if DimValue.Find('-') then
                    DimName := DimValue.Name;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Cust. Ledger Entry".Amount);
                CurrReport.CreateTotals("Cust. Ledger Entry"."Amount (LCY)");
                CurrReport.CreateTotals(Amount1);
                CurrReport.CreateTotals(Amount2);
                CurrReport.CreateTotals(Amount3);


                AccountingPeriod.SetFilter("Starting Date", '<=%1', PeriodStartingDate);
                AccountingPeriod.SetRange("New Fiscal Year", true);
                AccountingPeriod.Find('+');
                FYStartingDate := AccountingPeriod."Starting Date";
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
        ReportDate := WorkDate;
    end;

    trigger OnPostReport()
    begin
        if PrintToExcel then
            MakeExcelInfo;
    end;

    trigger OnPreReport()
    begin

        MonthStartDt := CalcDate('<-CM>', ReportDate);
        MonthEndDate := CalcDate('<CM>', ReportDate);
        CurrentDate := ReportDate;
        PeriodStartingDate := MonthStartDt;

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        ReportDate: Date;
        Amount1: Decimal;
        Amount2: Decimal;
        Amount3: Decimal;
        AccountingPeriod: Record "Accounting Period";
        PeriodStartingDate: Date;
        FYStartingDate: Date;
        CustLedgeEnry: Record "Cust. Ledger Entry";
        MonthStartDt: Date;
        MonthEndDate: Date;
        CurrentDate: Date;
        CompanyInfo: Record "Company Information";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        DimValue: Record "Dimension Value";
        DimName: Text[30];
        Dim: Record Dimension;
        Invoice_IssuedCaptionLbl: Label 'Invoice Issued';
        Branch_NameCaptionLbl: Label 'Branch Name';
        This_periodCaptionLbl: Label 'Current Month';
        Fiscal_Year_untilCaptionLbl: Label 'Fiscal Year until';
        Total_Billed_Amount_In_INRCaptionLbl: Label 'Total Billed Amount In INR';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(CompanyInfo.Name,FALSE,'',TRUE,FALSE,FALSE,'');
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

    local procedure MakeExcelDataHeader()
    begin
    end;


    procedure MakeExcelDataBody()
    begin
    end;


    procedure CreateExcelbook()
    begin
    end;
}

