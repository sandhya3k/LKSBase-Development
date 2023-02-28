report 50035 "Bank Deposit slip"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankDepositslip.rdlc';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Issuing Bank Name") ORDER(Ascending) WHERE("Source Code" = FILTER('BANKRCPTV'), "Journal Batch Name" = FILTER(<> 'BOUNCE'));
            RequestFilterFields = "Bal. Account Type", "Bal. Account No.", "Account Type", "Account No.", "Currency Code", "Issuing Bank Name";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(Bank_Acc_Name; Bank_Acc.Name)
            {
            }
            column(Bank_Acc__Bank_Account_No__; Bank_Acc."Bank Account No.")
            {
            }
            column(Gen__Journal_Line__Posting_Date_; "Posting Date")
            {
            }
            column(Gen__Journal_Line__Cheque_Date_; "Cheque Date")
            {
            }
            column(Gen__Journal_Line__Cheque_No__; "Cheque No. 2")
            {
            }
            column(Gen__Journal_Line__Issuing_Bank_Name_; "Issuing Bank Name")
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Currency_Code_; "Gen. Journal Line"."Currency Code")
            {
            }
            column(Gen__Journal_Line_Amount; Amount)
            {
            }
            column(Gen__Journal_Line__Amount__LCY__; "Amount (LCY)")
            {
            }
            column(Gen__Journal_Line__Document_No__; "Document No.")
            {
            }
            column(CurRate; CurRate)
            {
            }
            column(Cust_Name; Cust_Name)
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Amount__LCY__; "Gen. Journal Line"."Amount (LCY)")
            {
            }
            column(Gen__Journal_Line_Amount_Control1000000020; Amount)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Creation_DateCaption; Creation_DateCaptionLbl)
            {
            }
            column(Gen__Journal_Line__Cheque_Date_Caption; FieldCaption("Cheque Date"))
            {
            }
            column(Gen__Journal_Line__Cheque_No__Caption; FieldCaption("Cheque No."))
            {
            }
            column(Client_BankCaption; Client_BankCaptionLbl)
            {
            }
            column(Bank_Deposit_SlipCaption; Bank_Deposit_SlipCaptionLbl)
            {
            }
            column(Bank_Deposited_Caption; Bank_Deposited_CaptionLbl)
            {
            }
            column(Currency_CodeCaption; Currency_CodeCaptionLbl)
            {
            }
            column(Gen__Journal_Line_AmountCaption; FieldCaption(Amount))
            {
            }
            column(Amount__INR_Caption; Amount__INR_CaptionLbl)
            {
            }
            column(Gen__Journal_Line__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Curr__RateCaption; Curr__RateCaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Bank_Account_No_Caption; Bank_Account_No_CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(Gen__Journal_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Bank_Acc.Get("Gen. Journal Line"."Bal. Account No.") then
                    Bank_Name := "Gen. Journal Line"."Bal. Account No." else
                    if Bank_Acc.Get("Gen. Journal Line"."Account No.") then
                        Bank_Name := "Gen. Journal Line"."Account No.";

                CurRate := 0;
                CurrExchangerate.Reset;
                CurrExchangerate.SetRange(CurrExchangerate."Starting Date", "Posting Date");
                CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                if CurrExchangerate.Find('+') then
                    CurRate := CurrExchangerate."Relational Exch. Rate Amount";

                Cust.Reset;
                Cust.SetRange(Cust."No.", "Gen. Journal Line"."Bal. Account No.");
                if Cust.Find('-') then begin
                    Cust_Name := Cust.Name;
                end;

                Cust.Reset;
                Cust.SetRange(Cust."No.", "Gen. Journal Line"."Account No.");
                if Cust.Find('-') then begin
                    Cust_Name := Cust.Name;
                end;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Gen. Journal Line".Amount, "Gen. Journal Line"."Amount (LCY)");
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

    var
        Bank_Name: Text[100];
        Bank_Acc: Record "Bank Account";
        CurRate: Decimal;
        CurrExchangerate: Record "Currency Exchange Rate";
        Gen_Jur_Line: Record "Gen. Journal Line";
        Cust_Name: Text[100];
        Cust: Record Customer;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Creation_DateCaptionLbl: Label 'Creation Date';
        Client_BankCaptionLbl: Label 'Client Bank';
        Bank_Deposit_SlipCaptionLbl: Label 'Bank Deposit Slip';
        Bank_Deposited_CaptionLbl: Label 'Bank Deposited:';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        Amount__INR_CaptionLbl: Label 'Amount (INR)';
        Curr__RateCaptionLbl: Label 'Curr. Rate';
        Client_NameCaptionLbl: Label 'Client Name';
        Bank_Account_No_CaptionLbl: Label 'Bank Account No.';
        TotalCaptionLbl: Label 'Total';
}

