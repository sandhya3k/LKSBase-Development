report 50185 "Bank Recocilation-M12"
//PAN UPG Rename from 70012 to 50185
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankRecocilationM12.rdlc';

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
            //TBD
            /*
            column(PhoneNo; CompInfo."STD Code" + '-' + CompInfo."Phone No.")
            {
            }
            */
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
            column(LocAdd; LocAdd)
            {
            }
            column(LocAdd2; LocAdd2)
            {
            }
            //TBD
            /*
            column(CIN_CompInfo; CompInfo."Company Registration  No.")
            {
            }
            */
            column(transactiondate; transactiondate)
            {
            }
            column(Descr; Descr)
            {
            }
            column(chqNo; chqNo)
            {
            }
            column(valDate; valDate)
            {
            }
            column(amttt; amttt)
            {
            }
            column(chqdptclrd; chqdptclrd)
            {
            }
            column(chqissnotclrd; chqissnotclrd)
            {
            }
            column(ShowTransaction; ShowTransaction)
            {
            }
            column(DocN; DocN)
            {
            }
            dataitem("Bank Account Ledger Debit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE(Amount = FILTER(>= 0), Reversed = FILTER(false), "Statement Status" = FILTER(Open));
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
                column(DebitDocNo; "Bank Account Ledger Debit"."Document No.")
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
                column(DrPostDate; (PostDateDr))
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
                    /*
                    //IF "Bank Account Ledger Entry".Open = FALSE THEN BEGIN
                       BankAccStmtLine.RESET;
                       BankAccStmtLine.SETRANGE(BankAccStmtLine."Bank Account No.","Bank Account Ledger Credit"."Bank Account No.");
                       BankAccStmtLine.SETRANGE("Statement No.", "Bank Account Ledger Debit"."Statement No.");
                       BankAccStmtLine.SETRANGE("Statement Line No.","Bank Account Ledger Debit"."Statement Line No.");
                       BankAccStmtLine.FIND('-');
                       IF BankAccStmtLine."Value Date" >= DateTo THEN
                          CurrReport.SKIP;
                    //END;
                    */
                    //"Bank Account Ledger Debit".SETFILTER("Bank Account Ledger Debit"."Statement No.",'>%1',StatementNo);
                    "Bank Account Ledger Debit".SetFilter("Bank Account Ledger Debit"."Posting Date", '%1..%2', 20100101D, DateTo);

                end;
            }
            dataitem("Bank Account Ledger Credit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE(Amount = FILTER(<= 0), Reversed = FILTER(false), "Statement Status" = FILTER(Open));
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
                column(CreditDocNo; "Bank Account Ledger Credit"."Document No.")
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
                column(CrPostDate; (PostDateCr))
                {
                }
                column(chqnotcleard; chqnotcleard)
                {
                }

                trigger OnPreDataItem()
                begin
                    //"Bank Account Ledger Credit".SETFILTER("Bank Account Ledger Credit"."Statement No.",'>%1',StatementNo) ;
                    "Bank Account Ledger Credit".SetFilter("Bank Account Ledger Credit"."Posting Date", '%1..%2', 20100101D, DateTo);
                end;
            }
            dataitem("Bank Account Statement Line Dr"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = ORDER(Ascending) WHERE("Statement Amount" = FILTER(> 0));
                column(TransactionDateDr; Format("Bank Account Statement Line Dr"."Transaction Date"))
                {
                }
                column(DocNoDr; "Bank Account Statement Line Dr"."Document No.")
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
                    //"Bank Account Statement Line Dr".SETFILTER("Bank Account Statement Line Dr"."Transaction Date",'%1..%2',DateFrom,DateTo);
                    "Bank Account Statement Line Dr".SetFilter("Bank Account Statement Line Dr"."Value Date", '%1..%2', DateFrom, DateTo);
                end;
            }
            dataitem("Bank Account Statement Line Cr"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = ORDER(Ascending) WHERE("Statement Amount" = FILTER(< 0));
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
                column(DocNoCr; "Bank Account Statement Line Cr"."Document No.")
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
                column(chqissclrd; chqissclrd)
                {
                }

                trigger OnPreDataItem()
                begin
                    //"Bank Account Statement Line Cr".SETFILTER("Bank Account Statement Line Cr"."Transaction Date",'%1..%2',DateFrom,DateTo);
                    "Bank Account Statement Line Cr".SetFilter("Bank Account Statement Line Cr"."Value Date", '%1..%2', DateFrom, DateTo);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                RecBank.Reset;
                if RecBank.Get("Bank Account"."No.") then
                    BankAddress4 := RecBank.Name;
                BankAddress5 := RecBank."Bank Account No.";
                /*RecLoc.RESET;
                IF RecLoc.GET(RecBank."Location Code") THEN
                   LocAdd:=RecLoc.Address+''+RecLoc."Address 2"+''+RecLoc.City+''+RecLoc."Post Code";
                   LocAdd2:='Tel.'+RecLoc."Phone No."+''+'Fax:'+RecLoc."Fax No.";  *///7287

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
                if BankAccStmt.FindLast then
                    CloBalBank := BankAccStmt."Statement Ending Balance";
                OpenBalBank := BankAccStmt."Balance Last Statement";
                StatementNo := BankAccStmt."Statement No.";
                StatementDate := BankAccStmt."Statement Date";

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
                field("Show Transactions"; ShowTransaction)
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
        BankAccStmtLine: Record "Bank Account Statement Line";
        StatementNo: Code[30];
        StatementDate: Date;
        ShowTransaction: Boolean;
        RecLoc: Record Location;
        RecBank: Record "Bank Account";
        BankAddress: Text[50];
        BankAddress2: Text[50];
        BankAddress3: Text[50];
        BankAddress4: Text[100];
        BankAddress5: Code[20];
        LocAdd: Text[100];
        LocAdd2: Text[100];
        chqnotcleard: Label 'Cheque Deposited And Not Cleared';
        transactiondate: Label ' Date';
        Descr: Label 'Description';
        chqNo: Label 'Cheque No.';
        valDate: Label 'Value Date';
        amttt: Label 'Amount';
        chqissnotclrd: Label 'Cheque Issued And Not Cleared';
        chqissclrd: Label 'Cheque Issued And Cleared';
        chqdptclrd: Label 'Cheque Deposited And Cleared';
        DocN: Label 'Document No.';
}

