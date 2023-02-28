report 50068 "Report of Bank Ledger Recpt"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Report of Bank Ledger Recpt"';
    DefaultLayout = RDLC;
    RDLCLayout = './res/ReportofBankLedgerRecpt.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE("Document No." = FILTER('BP*'));
            //TBD //RequestFilterFields = "Bank Account No.", "Posting Date", "Location Code";
            RequestFilterFields = "Bank Account No.", "Posting Date";
            column(CompanyInfo_Picture; CompanyInfo.Picture)
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
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Posting_Date_; "Bank Account Ledger Entry"."Posting Date")
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Document_No__; "Bank Account Ledger Entry"."Document No.")
            {
            }
            column(Client_Name; Client_Name)
            {
            }
            column(Bank_Name; Bank_Name)
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Cheque_No__; "Bank Account Ledger Entry"."Cheque No.")
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Cheque_Date_; "Bank Account Ledger Entry"."Cheque Date")
            {
            }
            column(Voucher_Type; Voucher_Type)
            {
            }
            //TBD column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Location_Code_; "Bank Account Ledger Entry"."Location Code")
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Location_Code_; '')
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Amount__LCY__; "Bank Account Ledger Entry"."Amount (LCY)")
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Amount__LCY___Control1000000023; "Bank Account Ledger Entry"."Amount (LCY)")
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Amount__LCY___Control1000000018; "Bank Account Ledger Entry"."Amount (LCY)")
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Bank_DepositedCaption; Bank_DepositedCaptionLbl)
            {
            }
            column(Cheque_NoCaption; Cheque_NoCaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(Document_typeCaption; Document_typeCaptionLbl)
            {
            }
            column(Location_codeCaption; Location_codeCaptionLbl)
            {
            }
            column(Cheque_AmtCaption; Cheque_AmtCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Bank.Reset;
                Bank.SetFilter(Bank."No.", "Bank Account Ledger Entry"."Bank Account No.");
                if Bank.Find('-') then
                    Bank_Name := Bank.Name;

                "G/L_Entry".Reset;
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetFilter("G/L_Entry"."Source Code", 'BANKRCPTV');
                if "G/L_Entry".Find('-') then
                    Voucher_Type := "G/L_Entry"."Source Code";

                Client_Name := '';
                Cust.Reset;
                Cust_Ledg_Entry.Reset;
                Cust_Ledg_Entry.SetFilter(Cust_Ledg_Entry."Document No.", "Bank Account Ledger Entry"."Document No.");
                if Cust_Ledg_Entry.Find('-') then
                    Cust.SetFilter(Cust."No.", Cust_Ledg_Entry."Customer No.");
                if Cust.Find('-') then
                    Client_Name := Cust.Name;

                Voucher_Type := '';
                Bank_Acc_Leg_Entry.Reset;
                Bank_Acc_Leg_Entry.SetFilter(Bank_Acc_Leg_Entry."Document No.", "Document No.");
                if Bank_Acc_Leg_Entry.Find('-') then begin
                    if Bank_Acc_Leg_Entry.Reversed = true then
                        Voucher_Type := 'REVERSED'
                    else
                        if
                   Bank_Acc_Leg_Entry."Journal Batch Name" = 'BOUNCE' then
                            Voucher_Type := 'BOUNCED'
                        else
                            Voucher_Type := 'RECEIPT'

                end;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Bank Account Ledger Entry"."Amount (LCY)");
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Client_Name: Text[60];
        Cust: Record Customer;
        Cust_Ledg_Entry: Record "Cust. Ledger Entry";
        Bank_Name: Text[100];
        Voucher_Type: Text[50];
        "G/L_Entry": Record "G/L Entry";
        Bank: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        Bank_Acc_Leg_Entry: Record "Bank Account Ledger Entry";
        Bounce: Boolean;
        Bank_Acc_Leg_Entry1: Record "Bank Account Ledger Entry";
        Posting_DateCaptionLbl: Label 'Posting Date';
        Document_No_CaptionLbl: Label 'Document No.';
        Client_NameCaptionLbl: Label 'Client Name';
        Bank_DepositedCaptionLbl: Label 'Bank Deposited';
        Cheque_NoCaptionLbl: Label 'Cheque No';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Document_typeCaptionLbl: Label 'Document type';
        Location_codeCaptionLbl: Label 'Location code';
        Cheque_AmtCaptionLbl: Label 'Cheque Amt';
}

