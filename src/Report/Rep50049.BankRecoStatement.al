report 50049 "Bank Reco Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankRecoStatement.rdlc';
    Caption = 'Bank Account Statement';

    dataset
    {
        dataitem("Bank Account Statement"; "Bank Account Statement")
        {
            DataItemTableView = SORTING("Bank Account No.", "Statement No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Bank Account No.", "Statement No.";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Bank_Account_Statement__TABLECAPTION__________BankAccStmtFilter; "Bank Account Statement".TableCaption + ': ' + BankAccStmtFilter)
            {
            }
            column(BankAccStmtFilter; BankAccStmtFilter)
            {
            }
            column(Bank_Account_Statement__Balance_Last_Statement_; "Balance Last Statement")
            {
            }
            column(Bank_Account_Statement__Bank_Account_Statement___Statement_Ending_Balance_; "Bank Account Statement"."Statement Ending Balance")
            {
            }
            column(Bank_Account_StatementCaption; Bank_Account_StatementCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Bank_Account_Statement_Line_DescriptionCaption; Bank_Account_Statement_Line_DescriptionCaptionLbl)
            {
            }
            column(Bank_Account_Statement_Line__Transaction_Date_Caption; Bank_Account_Statement_Line__Transaction_Date_CaptionLbl)
            {
            }
            column(Bank_Account_Statement_Line__Document_No__Caption; "Bank Account Statement Line".FieldCaption("Document No."))
            {
            }
            column(Bank_Account_Statement_Line_DescriptionCaption_Control51; "Bank Account Statement Line".FieldCaption(Description))
            {
            }
            column(Bank_Account_Statement_Line__Value_Date_Caption; Bank_Account_Statement_Line__Value_Date_CaptionLbl)
            {
            }
            column(Bank_Account_Statement_Line__Statement_Amount_Caption; "Bank Account Statement Line".FieldCaption("Statement Amount"))
            {
            }
            column(Cheque_No_Caption; Cheque_No_CaptionLbl)
            {
            }
            column(Cheque_Deposit_And_ClearedCaption; Cheque_Deposit_And_ClearedCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Bank_Account_Statement_Bank_Account_No_; "Bank Account No.")
            {
            }
            column(Bank_Account_Statement_Statement_No_; "Statement No.")
            {
            }
            dataitem("Bank Account Statement Line"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."), "Statement No." = FIELD("Statement No.");
                DataItemTableView = SORTING("Bank Account No.", "Statement No.", "Statement Line No.");
                column(Bank_Account_Statement_Line__Transaction_Date_; Format("Transaction Date"))
                {
                }
                column(Bank_Account_Statement_Line__Document_No__; "Document No.")
                {
                }
                column(Bank_Account_Statement_Line__Statement_Amount_; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line_Description; Description)
                {
                }
                column(Bank_Account_Statement_Line__Value_Date_; Format("Value Date"))
                {
                }
                column(ChequeNo; ChequeNo)
                {
                }
                column(Bank_Account_Statement_Line__Statement_Amount__Control41; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line__Statement_Amount__Control41Caption; Bank_Account_Statement_Line__Statement_Amount__Control41CaptionLbl)
                {
                }
                column(Bank_Account_Statement_Line_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement_Line_Statement_No_; "Statement No.")
                {
                }
                column(Bank_Account_Statement_Line_Statement_Line_No_; "Statement Line No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals("Statement Amount", "Applied Amount");
                end;
            }
            dataitem("Bank Account Ledger Debit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE("Debit Amount" = FILTER(<> 0), Open = FILTER(true));
                column(amt1; amt1)
                {
                }
                column(Bank_Account_Ledger_Debit__Bank_Account_Ledger_Debit___Cheque_No__; "Bank Account Ledger Debit"."Cheque No.")
                {
                }
                column(amt1_Control1000000023; amt1)
                {
                }
                column(Cheque_Deposited_But_Not_ClearedCaption; Cheque_Deposited_But_Not_ClearedCaptionLbl)
                {
                }
                column(Posting_DateCaption; Posting_DateCaptionLbl)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(Cheque_No_Caption_Control1000000013; Cheque_No_Caption_Control1000000013Lbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Bank_Account_Ledger_Debit_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Account_Ledger_Debit_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //"Bank Account Ledger Debit"."Posting Date" < "Bank Account Statement Line"."Value Date";
                    if ("Bank Account Ledger Debit"."Statement No." = '')
                        and ("Bank Account Ledger Debit"."Statement Status" =
                              "Bank Account Ledger Debit"."Statement Status"::Open) then
                        amt1 := "Bank Account Ledger Debit"."Debit Amount";
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(amt1);
                end;
            }
            dataitem("Bank Account Ledger Credit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE("Credit Amount" = FILTER(<> 0), Open = FILTER(true));
                column(amt2; amt2)
                {
                }
                column(Bank_Account_Ledger_Credit__Bank_Account_Ledger_Credit___Cheque_No__; "Bank Account Ledger Credit"."Cheque No.")
                {
                }
                column(Cheque_Issued_But_Not_ClearedCaption; Cheque_Issued_But_Not_ClearedCaptionLbl)
                {
                }
                column(Posting_DateCaption_Control1000000015; Posting_DateCaption_Control1000000015Lbl)
                {
                }
                column(DescriptionCaption_Control1000000016; DescriptionCaption_Control1000000016Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000017; Cheque_No_Caption_Control1000000017Lbl)
                {
                }
                column(AmountCaption_Control1000000018; AmountCaption_Control1000000018Lbl)
                {
                }
                column(Bank_Account_Ledger_Credit_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Account_Ledger_Credit_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if ("Bank Account Ledger Credit"."Statement No." = '')
                        and ("Bank Account Ledger Credit"."Statement Status" =
                              "Bank Account Ledger Credit"."Statement Status"::Open) then
                        amt2 := "Bank Account Ledger Credit"."Credit Amount";
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(amt2)
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(
                  "Bank Account Statement Line"."Statement Amount",
                  "Bank Account Statement Line"."Applied Amount");
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
        BankAccStmtFilter := "Bank Account Statement".GetFilters;
    end;

    var
        BankAccStmtFilter: Text[250];
        ChequeNo: Code[50];
        BankAccLedger: Record "Bank Account Ledger Entry";
        amt1: Decimal;
        amt2: Decimal;
        B_repass: Boolean;
        Bank_Account_StatementCaptionLbl: Label 'Bank Account Statement';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bank_Account_Statement_Line_DescriptionCaptionLbl: Label 'Balance As Per Last Statement';
        Bank_Account_Statement_Line__Transaction_Date_CaptionLbl: Label 'Posting Date';
        Bank_Account_Statement_Line__Value_Date_CaptionLbl: Label 'Value Date';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Cheque_Deposit_And_ClearedCaptionLbl: Label 'Cheque Deposit And Cleared';
        TotalCaptionLbl: Label 'Closing Balance As Per Bank :';
        Bank_Account_Statement_Line__Statement_Amount__Control41CaptionLbl: Label 'Total';
        Cheque_Deposited_But_Not_ClearedCaptionLbl: Label 'Cheque Deposited But Not Cleared';
        Posting_DateCaptionLbl: Label 'Posting Date';
        DescriptionCaptionLbl: Label 'Description';
        Cheque_No_Caption_Control1000000013Lbl: Label 'Cheque No.';
        AmountCaptionLbl: Label 'Amount';
        Cheque_Issued_But_Not_ClearedCaptionLbl: Label 'Cheque Issued But Not Cleared';
        Posting_DateCaption_Control1000000015Lbl: Label 'Posting Date';
        DescriptionCaption_Control1000000016Lbl: Label 'Description';
        Cheque_No_Caption_Control1000000017Lbl: Label 'Cheque No.';
        AmountCaption_Control1000000018Lbl: Label 'Amount';
}

