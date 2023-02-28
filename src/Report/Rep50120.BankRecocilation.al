report 50120 "Bank Recocilation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankRecocilation.rdlc';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(CompName; CompInfo.Name)
            {
            }
            column(CompAdd; CompInfo.Address)
            {
            }
            column(CompAdd2; CompInfo."Address 2")
            {
            }
            column(CompCity; CompInfo.City)
            {
            }
            //TBD column(PhoneNo; CompInfo."STD Code" + '-' + CompInfo."Phone No.")
            column(PhoneNo; CompInfo."Phone No.")
            {
            }
            column(BankAccNo; "Bank Account"."No.")
            {
            }
            column(BankName; "Bank Account".Name)
            {
            }
            column(DateRange; DateFilter)
            {
            }
            column(CloBalBank; CloBalBank)
            {
            }
            column(STRSUBSTNO___1_To__2___DateFrom__DateTo_; StrSubstNo('%1 To %2', DateFrom, DateTo))
            {
            }
            column(OpeningBalBank; OpenBalBank)
            {
            }
            column(OpeninBalBook; OpenBalBook)
            {
            }
            column(CloBalBook; CloBaldec)
            {
            }
            column(DateFrom; DateFrom)
            {
            }
            column(DateTo; DateTo)
            {
            }
            column(ReveEntry; ReversedEntry)
            {
            }
            column(TextCrdr; TextCrdr)
            {
            }
            column(TextCrdr1; TextCrdr1)
            {
            }
            dataitem("Bank Account Ledger Debit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE(Amount = FILTER(>= 0), Open = FILTER(true), Reversed = FILTER(false));
                column(DebitPostDt; Format("Bank Account Ledger Debit"."Posting Date"))
                {
                }
                column(DebitDesc; "Bank Account Ledger Debit".Description)
                {
                }
                column(DebitChqNo; "Bank Account Ledger Debit"."Cheque No.")
                {
                }
                column(Reversed; "Bank Account Ledger Debit".Reversed)
                {
                }
                column(DebitAmt; Abs("Bank Account Ledger Debit"."Amount (LCY)"))
                {
                }
                column(DebitEntryNo; "Bank Account Ledger Debit"."Entry No.")
                {
                }
                column(DebitAccNo; "Bank Account Ledger Debit"."Bank Account No.")
                {
                }
                column(DrAmt; DebitAmt)
                {
                }
                column(DrCheckNo; ChequeNoDr)
                {
                }
                column(DrDesc; DescDr)
                {
                }
                column(DrPostDate; Format(PostDateDr))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ReversedEntry := '';
                    BankAccLed1.Reset;
                    BankAccLed1.SetFilter(BankAccLed1."Document No.", "Bank Account Ledger Debit"."Document No.");
                    BankAccLed1.SetRange(BankAccLed1.Reversed, false);
                    if BankAccLed1.FindFirst then
                        ReversedEntry := BankAccLed1."Document No.";
                    //   MESSAGE('%1',ReversedEntry);
                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Debit".SetFilter("Bank Account Ledger Debit"."Posting Date", '%1..%2', 0D, DateTo);
                end;
            }
            dataitem("Bank Account Ledger Credit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE(Amount = FILTER(<= 0), Open = FILTER(true), Reversed = FILTER(false));
                column(CreditPostDt; Format("Bank Account Ledger Credit"."Posting Date"))
                {
                }
                column(CreditAccNo; "Bank Account Ledger Credit"."Bank Account No.")
                {
                }
                column(CreditEntryNo; "Bank Account Ledger Credit"."Entry No.")
                {
                }
                column(CreditDesc; "Bank Account Ledger Credit".Description)
                {
                }
                column(CreditChqNo; "Bank Account Ledger Credit"."Cheque No.")
                {
                }
                column(CreditAmt; Abs("Bank Account Ledger Credit"."Amount (LCY)"))
                {
                }
                column(CrAmt; CreditAmt)
                {
                }
                column(CrCheckNo; ChequeNoCr)
                {
                }
                column(CrDesc; DescCr)
                {
                }
                column(CrPostDate; Format(PostDateCr))
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Credit".SetFilter("Bank Account Ledger Credit"."Posting Date", '%1..%2', 0D, DateTo);
                end;
            }
            dataitem("Bank Account Statement Line Dr"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Value Date") ORDER(Ascending) WHERE("Statement Amount" = FILTER(> 0), Reversed = FILTER(false));
                column(TransactionDateDr; Format("Bank Account Statement Line Dr"."Transaction Date"))
                {
                }
                column(DrDoc; "Bank Account Statement Line Dr"."Document No.")
                {
                }
                column(DescriptionDr; "Bank Account Statement Line Dr".Description)
                {
                }
                column(StatementAmountDr; Abs("Bank Account Statement Line Dr"."Statement Amount"))
                {
                }
                column(ValueDateDr; Format("Bank Account Statement Line Dr"."Value Date"))
                {
                }
                column(CheckNoDr; "Bank Account Statement Line Dr"."Check No.")
                {
                }
                column(StatementNoDr; "Bank Account Statement Line Dr"."Statement No.")
                {
                }
                column(BankAcDr; "Bank Account Statement Line Dr"."Bank Account No.")
                {
                }
                column(BankStmtLineDr; "Bank Account Statement Line Dr"."Statement Line No.")
                {
                }
                column(ab; "Bank Account Statement Line Dr"."Bank Account No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement Line Dr".SetFilter("Bank Account Statement Line Dr"."Value Date", '%1..%2', DateFrom, DateTo);
                end;
            }
            dataitem("Bank Account Statement Line Cr"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Value Date") ORDER(Ascending) WHERE("Statement Amount" = FILTER(< 0), Reversed = FILTER(false));
                column(TransactionDateCr; Format("Bank Account Statement Line Cr"."Transaction Date"))
                {
                }
                column(CrDoc; "Bank Account Statement Line Cr"."Document No.")
                {
                }
                column(DescriptionCr; "Bank Account Statement Line Cr".Description)
                {
                }
                column(StatementAmountCr; Abs("Bank Account Statement Line Cr"."Statement Amount"))
                {
                }
                column(ValueDateCr; Format("Bank Account Statement Line Cr"."Value Date"))
                {
                }
                column(CheckNoCr; "Bank Account Statement Line Cr"."Check No.")
                {
                }
                column(StatementNoCr; "Bank Account Statement Line Cr"."Statement No.")
                {
                }
                column(BankStmtLineCr; "Bank Account Statement Line Cr"."Statement Line No.")
                {
                }
                column(BankAcCr; "Bank Account Statement Line Cr"."Bank Account No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement Line Cr".SetFilter("Bank Account Statement Line Cr"."Value Date", '%1..%2', DateFrom, DateTo);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CloBaldec := 0;
                BankAccLed.Reset;
                BankAccLed.SetCurrentKey("Bank Account No.", "Posting Date");
                BankAccLed.SetRange(BankAccLed."Bank Account No.", "Bank Account"."No.");
                //BankAccLed.SETFILTER(BankAccLed."Posting Date",'%1..%2',0D,TODAY);
                BankAccLed.SetFilter(BankAccLed."Posting Date", '%1..%2', 0D, DateTo);
                if BankAccLed.FindSet(false, false) then
                    repeat
                        CloBaldec += BankAccLed.Amount;
                    until BankAccLed.Next = 0;

                OpenBalBook := 0;
                BankAccLed.Reset;
                BankAccLed.SetCurrentKey("Bank Account No.", "Posting Date");
                BankAccLed.SetRange(BankAccLed."Bank Account No.", "Bank Account"."No.");
                //BankAccLed.SETFILTER(BankAccLed."Posting Date",'%1..%2',0D,TODAY);
                BankAccLed.SetFilter(BankAccLed."Posting Date", '..%1', DateFrom - 1);
                if BankAccLed.FindSet(false, false) then
                    repeat
                        OpenBalBook += BankAccLed.Amount;
                    until BankAccLed.Next = 0;






                if CloBaldec > 0 then
                    TextCrdr := 'Dr.'
                else
                    if CloBaldec < 0 then
                        TextCrdr := 'Cr.'
                    else
                        TextCrdr := '';

                OpenBalBank := 0;
                CloBalBank := 0;
                BankAccStmt.Reset;
                BankAccStmt.SetRange(BankAccStmt."Bank Account No.", "Bank Account"."No.");
                BankAccStmt.SetFilter(BankAccStmt."Statement Date", '%1', DateTo);
                if BankAccStmt.FindFirst then
                    CloBalBank := BankAccStmt."Statement Ending Balance";
                OpenBalBank := BankAccStmt."Balance Last Statement";

                if CloBalBank > 0 then
                    TextCrdr1 := 'Dr.'
                else
                    if CloBalBank < 0 then
                        TextCrdr1 := 'Cr.'
                    else
                        TextCrdr1 := '';
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                //DateFilter:=GETFILTER("Date Filter");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("From Date"; DateFrom)
                {
                    ApplicationArea = All;
                }
                field("To Date"; DateTo)
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

    var
        CompInfo: Record "Company Information";
        BankAccLed: Record "Bank Account Ledger Entry";
        CloBaldec: Decimal;
        TextCrdr: Text[3];
        BankAccStmt: Record "Bank Account Statement";
        CloBalBank: Decimal;
        DateFilter: Text;
        TextCrdr1: Text;
        DebitAmt: Decimal;
        CreditAmt: Decimal;
        ChequeNoDr: Text[30];
        ChequeNoCr: Text[30];
        DescDr: Text[100];
        DescCr: Text[100];
        PostDateDr: Date;
        PostDateCr: Date;
        BankAccLed1: Record "Bank Account Ledger Entry";
        DateFrom: Date;
        DateTo: Date;
        OpenBalBank: Decimal;
        OpenBalBook: Decimal;
        ReversedEntry: Text[30];
        Amt: Decimal;
}

