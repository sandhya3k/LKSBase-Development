report 50015 "Invoice Issued"
{
    // //TEAM::1426/01/19-04-2010 Report Create for Invoce Issued Details
    DefaultLayout = RDLC;
    RDLCLayout = './res/InvoiceIssued.rdlc';

    UseRequestPage = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Location Code") ORDER(Ascending);
            RequestFilterFields = "Shortcut Dimension 1 Code";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(ReportDate; ReportDate)
            {
            }
            column(AmtInInr; AmtInInr)
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Location_Code_; "Sales Invoice Header"."Location Code")
            {
            }
            column(AmtInInr1; AmtInInr1)
            {
            }
            column(AmtInInr2; AmtInInr2)
            {
            }
            column(AmtInFc; AmtInFc)
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Location_Code__Control1000000021; "Sales Invoice Header"."Location Code")
            {
            }
            column(AmtInFc1; AmtInFc1)
            {
            }
            column(AmtInFc2; AmtInFc2)
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Location_Code__Control1000000008; "Sales Invoice Header"."Location Code")
            {
            }
            column(AmtEuro; AmtEuro)
            {
            }
            column(AmtEuro1; AmtEuro1)
            {
            }
            column(AmtEuro2; AmtEuro2)
            {
            }
            column(Sales_Invoice_Header__Amount_to_Customer_; 0)
            {
            }
            column(Sales_Invoice_Header__Amount_to_Customer__Control1000000006; 0)
            {
            }
            column(AmtInInr_Control1000000022; AmtInInr)
            {
            }
            column(AmtInFc_Control1000000023; AmtInFc)
            {
            }
            column(AmtEuro_Control1000000026; AmtEuro)
            {
            }
            column(AmtInInr1_Control1000000033; AmtInInr1)
            {
            }
            column(AmtInFc1_Control1000000034; AmtInFc1)
            {
            }
            column(AmtEuro1_Control1000000035; AmtEuro1)
            {
            }
            column(AmtEuro2_Control1000000036; AmtEuro2)
            {
            }
            column(AmtInInr2_Control1000000037; AmtInInr2)
            {
            }
            column(AmtInFc2_Control1000000038; AmtInFc2)
            {
            }
            column(Bill_IssuedCaption; Bill_IssuedCaptionLbl)
            {
            }
            column(Report_DateCaption; Report_DateCaptionLbl)
            {
            }
            column(Location_CodeCaption; Location_CodeCaptionLbl)
            {
            }
            column(Current_DateCaption; Current_DateCaptionLbl)
            {
            }
            column(Fiscal_Year_untilCaption; Fiscal_Year_untilCaptionLbl)
            {
            }
            column(This_periodCaption; This_periodCaptionLbl)
            {
            }
            column(Billed_Amt_In_INRCaption; Billed_Amt_In_INRCaptionLbl)
            {
            }
            column(Billed_Amt_IN_Non_USDCaption; Billed_Amt_IN_Non_USDCaptionLbl)
            {
            }
            column(Billed_Amt_IN_Non_EUROCaption; Billed_Amt_IN_Non_EUROCaptionLbl)
            {
            }
            column(Total_INRCaption; Total_INRCaptionLbl)
            {
            }
            column(Total_Non_EUROCaption; Total_Non_EUROCaptionLbl)
            {
            }
            column(Total_Non_USDCaption; Total_Non_USDCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            column(Sales_Invoice_Header_Posting_Date; "Posting Date")
            {
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(AmtInInr);
                CurrReport.CreateTotals(AmtInFc);
                CurrReport.CreateTotals(AmtEuro);
                CurrReport.CreateTotals(AmtInInr1);
                CurrReport.CreateTotals(AmtInFc1);
                CurrReport.CreateTotals(AmtEuro1);
                CurrReport.CreateTotals(AmtInInr2);
                CurrReport.CreateTotals(AmtInFc2);
                CurrReport.CreateTotals(AmtEuro2);


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
        ReportDate := Today;
    end;

    trigger OnPreReport()
    begin
        MonthStartDt := CalcDate('<-CM>', ReportDate);
        MonthEndDate := CalcDate('<CM>', ReportDate);
        CurrentDate := ReportDate;
        PeriodStartingDate := MonthStartDt;
    end;

    var
        AmtInInr: Decimal;
        AmtInFc: Decimal;
        AmtEuro: Decimal;
        ReportDate: Date;
        MonthStartDt: Date;
        MonthEndDate: Date;
        LastMonth: Date;
        LastYear: Date;
        AmtInInr1: Decimal;
        AmtInFc1: Decimal;
        AmtEuro1: Decimal;
        AmtInInr2: Decimal;
        AmtInFc2: Decimal;
        AmtEuro2: Decimal;
        SaleInvHeader: Record "Sales Invoice Header";
        CurrentDate: Date;
        AccountingPeriod: Record "Accounting Period";
        PeriodStartingDate: Date;
        FYStartingDate: Date;
        Bill_IssuedCaptionLbl: Label 'Bill Issued';
        Report_DateCaptionLbl: Label 'Report Date';
        Location_CodeCaptionLbl: Label 'Location Code';
        Current_DateCaptionLbl: Label 'Current Date';
        Fiscal_Year_untilCaptionLbl: Label 'Fiscal Year until';
        This_periodCaptionLbl: Label 'Current Month';
        Billed_Amt_In_INRCaptionLbl: Label 'Billed Amt In INR';
        Billed_Amt_IN_Non_USDCaptionLbl: Label 'Billed Amt IN Non USD';
        Billed_Amt_IN_Non_EUROCaptionLbl: Label 'Billed Amt IN Non EURO';
        Total_INRCaptionLbl: Label 'Total INR';
        Total_Non_EUROCaptionLbl: Label 'Total Non EURO';
        Total_Non_USDCaptionLbl: Label 'Total Non USD';


    procedure SetEndingDate()
    begin
    end;
}

