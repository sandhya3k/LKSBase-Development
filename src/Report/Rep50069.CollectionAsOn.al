report 50069 "Collection As On"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Collection As On';
    DefaultLayout = RDLC;
    RDLCLayout = './res/CollectionAsOn.rdl';

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Location Code") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(Collections_As_On______FORMAT_Report_Date_; 'Collections As On' + ' ' + Format(Report_Date))
            {
            }
            column(Compinfo_Picture; Compinfo.Picture)
            {
            }
            //TBD column(Bank_Account_Ledger_Entry__Location_Code_; "Location Code")
            column(Bank_Account_Ledger_Entry__Location_Code_; "Location Code")
            {
            }
            // column(Location_Code;"Location Code")
            column(Collection_100000; Collection / 100000)
            {
            }
            column(Collection1_100000; Collection1 / 100000)
            {
            }
            column(Bank_Account_Ledger_Entry__Location_Code__Control1000000019; "Location Code")
            {
            }
            column(Collection2_100000; Collection2 / 100000)
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Collection1_100000_Control1000000012; Collection1 / 100000)
            {
            }
            column(Collection_100000_Control1000000013; Collection / 100000)
            {
            }
            column(Collection2_100000_Control1000000014; Collection2 / 100000)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Collective_ReceiptsCaption; Collective_ReceiptsCaptionLbl)
            {
            }
            column(Monthly_ReceiptsCaption; Monthly_ReceiptsCaptionLbl)
            {
            }
            column(Daily_ReceiptsCaption; Daily_ReceiptsCaptionLbl)
            {
            }
            column(Amount_in_Rs__LacsCaption; Amount_in_Rs__LacsCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //TBD 
                Bank_Ledger_Entry.SetCurrentKey(Bank_Ledger_Entry."Location Code", Bank_Ledger_Entry."Posting Date");

                Collection := 0;
                Bank_Ledger_Entry.Reset;
                //TBD //
                Bank_Ledger_Entry.SetRange(Bank_Ledger_Entry."Location Code", "Location Code");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Document No.", "Document No.");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Posting Date", '%1', Report_Date);
                if Bank_Ledger_Entry.Find('-') then begin
                    repeat
                        Collection += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                    until
                      Bank_Ledger_Entry.Next = 0;
                end;


                Collection1 := 0;
                Bank_Ledger_Entry.Reset;
                //TBD //
                Bank_Ledger_Entry.SetRange(Bank_Ledger_Entry."Location Code", "Location Code");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Document No.", "Document No.");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Posting Date", '%1..%2', MonthStartDt, Report_Date);
                if Bank_Ledger_Entry.Find('-') then begin
                    repeat
                        Collection1 += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                    //MESSAGE('%1',Bank_Ledger_Entry."Debit Amount (LCY)");
                    until
                      Bank_Ledger_Entry.Next = 0;
                end;

                Collection2 := 0;
                Bank_Ledger_Entry.Reset;
                //TBD //
                Bank_Ledger_Entry.SetRange(Bank_Ledger_Entry."Location Code", "Location Code");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Document No.", "Document No.");
                Bank_Ledger_Entry.SetFilter(Bank_Ledger_Entry."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if Bank_Ledger_Entry.Find('-') then begin
                    repeat
                        Collection2 += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                    //MESSAGE('%1',Bank_Ledger_Entry."Debit Amount (LCY)");
                    until
                      Bank_Ledger_Entry.Next = 0;
                end;

                //TBD

                Credit_Note_Amount := 0;
                CustLedEntry.SetRange(CustLedEntry."Document Type", "Document Type"::"Credit Memo");
                CustLedEntry.SetRange(CustLedEntry."Location Code", "Location Code");
                CustLedEntry.SetFilter(CustLedEntry."Posting Date", '%1..%2', FYStartingDate, Report_Date);
                if Cr_Note.Find('-') then begin
                    repeat
                        Credit_Note_Amount += CustLedEntry.Amount;
                    until
                    Cr_Note.Next = 0;
                end;
                // */

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Collection, Collection2, Collection1);

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
        Compinfo.Get;
        Compinfo.CalcFields(Picture);
        Report_Date := WorkDate;
    end;

    trigger OnPreReport()
    begin
        MonthStartDt := CalcDate('<-CM>', Report_Date);
        MonthEndDate := CalcDate('<CM>', Report_Date);
    end;

    var
        CustLedEntry: Record "Cust. Ledger Entry";
        Collection: Decimal;
        Collection1: Decimal;
        Collection2: Decimal;
        AccountingPeriod: Record "Accounting Period";
        FYStartingDate: Date;
        Report_Date: Date;
        Bank_Ledger_Entry: Record "Bank Account Ledger Entry";
        Credit_Note_Amount: Decimal;
        Cr_Note: Record "Sales Cr.Memo Line";
        MonthStartDt: Date;

        MonthEndDate: Date;
        Compinfo: Record "Company Information";
        LocationCaptionLbl: Label 'Location';
        Collective_ReceiptsCaptionLbl: Label 'Collective Receipts';
        Monthly_ReceiptsCaptionLbl: Label 'Monthly Receipts';
        Daily_ReceiptsCaptionLbl: Label 'Daily Receipts';
        Amount_in_Rs__LacsCaptionLbl: Label 'Amount in Rs. Lacs';
}

