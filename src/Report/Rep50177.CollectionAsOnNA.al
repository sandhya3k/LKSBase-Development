report 50177 "Collection As On (N/A)"
//PAN UPG Rename from 51000 to 50177
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CollectionAsOnNA.rdlc';

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = SORTING("Dimension Code", Code) WHERE("Dimension Code" = FILTER('BRANCH'));
            column(Collections_for______FORMAT_Report_Date_; 'Collections for' + ' ' + Format(Report_Date))
            {
            }
            column(Collection1; Collection1)
            {
            }
            column(Collection; Collection)
            {
            }
            column(Collection2; Collection2)
            {
            }
            column(DimName; DimName)
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Collection1_Control1000000012; Collection1)
            {
            }
            column(Collection_Control1000000013; Collection)
            {
            }
            column(Collection2_Control1000000014; Collection2)
            {
            }
            column(Credit_Note_Amount; Credit_Note_Amount)
            {
            }
            column(Amount_In_Rs__LacsCaption; Amount_In_Rs__LacsCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Daily_ReceiptsCaption; Daily_ReceiptsCaptionLbl)
            {
            }
            column(Monthly_ReceiptCaption; Monthly_ReceiptCaptionLbl)
            {
            }
            column(Collective_ReceiptCaption; Collective_ReceiptCaptionLbl)
            {
            }
            column(Credit_NoteCaption; Credit_NoteCaptionLbl)
            {
            }
            column(Dimension_Value_Dimension_Code; "Dimension Code")
            {
            }
            column(Dimension_Value_Code; Code)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Dim_Value.Reset;
                Dim_Value.SetRange(Dim_Value."Dimension Code", 'Branch');
                Dim_Value.SetRange(Dim_Value.Code, "Dimension Value".Code);
                if Dim_Value.Find('-') then
                    DimName := Dim_Value.Name;


                Collection := 0;
                R_GL.Reset;
                R_GL.SetRange(R_GL."Global Dimension 1 Code", "Dimension Value".Code);
                R_GL.SetRange(R_GL."G/L Account No.", '31-01-001001', '31-01-100000');
                R_GL.SetFilter(R_GL."Posting Date", '%1', Report_Date);
                if R_GL.Find('-') then begin
                    repeat
                        Collection += R_GL."Credit Amount";
                    until
                      R_GL.Next = 0;
                end;

                Collection1 := 0;
                R_GL.Reset;
                R_GL.SetRange(R_GL."Global Dimension 1 Code", "Dimension Value".Code);
                R_GL.SetRange(R_GL."G/L Account No.", '31-01-001001', '31-01-100000');
                R_GL.SetFilter(R_GL."Posting Date", '%1..%2', MonthStartDt, Report_Date);
                if R_GL.Find('-') then begin
                    repeat
                        Collection1 += R_GL."Credit Amount";
                    until
                      R_GL.Next = 0;
                end;

                Collection2 := 0;
                R_GL.Reset;
                R_GL.SetRange(R_GL."Global Dimension 1 Code", "Dimension Value".Code);
                R_GL.SetRange(R_GL."G/L Account No.", '31-01-001001', '31-01-100000');
                R_GL.SetFilter(R_GL."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if R_GL.Find('-') then begin
                    repeat
                        Collection2 += R_GL."Credit Amount";
                    until
                      R_GL.Next = 0;
                end;

                Credit_Note_Amount := 0;
                //TBD
                /*                
                Cr_Note.SetRange(Cr_Note."Shortcut Dimension 1 Code", "Dimension Value".Code);
                Cr_Note.SetFilter(Cr_Note."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if Cr_Note.Find('-') then begin
                    repeat
                        Credit_Note_Amount += Cr_Note."Amount To Customer";
                    until
                    Cr_Note.Next = 0;
                end;
                */
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Collection, Collection2, Collection1, Credit_Note_Amount);

                AccountingPeriod.SetFilter(AccountingPeriod."Starting Date", '<=1', Report_Date);
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
        Report_Date := WorkDate;
        ;
    end;

    trigger OnPreReport()
    begin
        MonthStartDt := CalcDate('<-CM>', Report_Date);
        MonthEndDate := CalcDate('<CM>', Report_Date);
    end;

    var
        R_SIL: Record "Sales Invoice Line";
        Billing: Decimal;
        R_GL: Record "G/L Entry";
        Expenses: Decimal;
        Collection: Decimal;
        TODATE: Date;
        R_SIH: Record "Sales Invoice Header";
        FromDate: Date;
        Collection1: Decimal;
        R_GL1: Record "G/L Entry";
        Billing1: Decimal;
        R_SIL1: Record "Sales Invoice Line";
        BR1: Code[20];
        Report_Date: Date;
        PrintToExcel: Boolean;
        AccountingPeriod: Record "Accounting Period";
        FYStartingDate: Date;
        Collection2: Decimal;
        MonthStartDt: Date;
        MonthEndDate: Date;
        Credit_Note_Amount: Decimal;
        Cr_Note: Record "Sales Cr.Memo Line";
        Dim_Value: Record "Dimension Value";
        DimName: Text[30];
        Curr_Rate: Decimal;
        Curr_Exch_Rate: Record "Currency Exchange Rate";
        Amount_In_Rs__LacsCaptionLbl: Label 'Amount In Rs. Lacs';
        LocationCaptionLbl: Label 'Location';
        Daily_ReceiptsCaptionLbl: Label 'Daily Receipts';
        Monthly_ReceiptCaptionLbl: Label 'Monthly Receipt';
        Collective_ReceiptCaptionLbl: Label 'Collective Receipt';
        Credit_NoteCaptionLbl: Label 'Credit Note';
}

