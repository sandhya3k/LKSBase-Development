report 50070 "Report of Bank Ledger(Payment)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/ReportofBankLedgerPayment.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE("Document No." = FILTER('BP*'));
            RequestFilterFields = "Bank Account No.";
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
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Location_Code_; '')
            {
            }
            column(ABS__Bank_Account_Ledger_Entry___Amount__LCY___; Abs("Bank Account Ledger Entry"."Amount (LCY)"))
            {
            }
            column(ABS__Bank_Account_Ledger_Entry___Amount__LCY____Control1000000023; Abs("Bank Account Ledger Entry"."Amount (LCY)"))
            {
            }
            column(ABS__Bank_Account_Ledger_Entry___Amount__LCY____Control1000000018; Abs("Bank Account Ledger Entry"."Amount (LCY)"))
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Party_Vendor_NameCaption; Party_Vendor_NameCaptionLbl)
            {
            }
            column(Bank_IssueCaption; Bank_IssueCaptionLbl)
            {
            }
            column(Cheque_NoCaption; Cheque_NoCaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(Voucher_typeCaption; Voucher_typeCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
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
                //"G/L_Entry".SETFILTER("G/L_Entry"."G/L Account No.",'31-02-110000..31-02-300000');
                "G/L_Entry".SetFilter("G/L_Entry"."Source Code", 'BANKPYMTV');
                if "G/L_Entry".Find('-') then
                    Voucher_Type := "G/L_Entry"."Source Code";



                Client_Name := '';
                "G/L_Entry".Reset;
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                if "G/L_Entry".Find('-') then
                    Client_Name := "G/L_Entry".Description;
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
        Client_Name: Text[100];
        Cust: Record Customer;
        Cust_Ledg_Entry: Record "Cust. Ledger Entry";
        Bank_Name: Text[100];
        Voucher_Type: Text[50];
        "G/L_Entry": Record "G/L Entry";
        Bank: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        Posting_DateCaptionLbl: Label 'Posting Date';
        Document_No_CaptionLbl: Label 'Document No.';
        Party_Vendor_NameCaptionLbl: Label 'Party/Vendor Name';
        Bank_IssueCaptionLbl: Label 'Bank Issue';
        Cheque_NoCaptionLbl: Label 'Cheque No';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Voucher_typeCaptionLbl: Label 'Voucher type';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Cheque_AmtCaptionLbl: Label 'Cheque Amt';
}

