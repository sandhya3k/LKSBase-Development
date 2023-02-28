report 50048 "Bank Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankReconciliation.rdlc';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(Reccompanyinfo_Name; Reccompanyinfo.Name)
            {
            }
            column(Reccompanyinfo_Address; Reccompanyinfo.Address)
            {
            }
            column(Reccompanyinfo__Address_2_; Reccompanyinfo."Address 2")
            {
            }
            column(Reccompanyinfo_City; Reccompanyinfo.City)
            {
            }
            column(Reccompanyinfo__Phone_No__; Reccompanyinfo."Phone No.")
            {
            }
            column(STRSUBSTNO___1_To__2___DateFrom__DateTo_; StrSubstNo('%1 To %2', DateFrom, DateTo))
            {
            }
            column(STRSUBSTNO__Code____1____No___; StrSubstNo('Code : %1', "No."))
            {
            }
            column(STRSUBSTNO__Bank____1___Name_; StrSubstNo('Bank : %1', Name))
            {
            }
            column(Total_amt_dr; Total_amt_dr)
            {
            }
            column(Total_amt_cr; Total_amt_cr)
            {
            }
            column(EndBal__BAL_As_Per_Ledger__Total_amt_cr_Total_amt_dr; EndBal + "BAL As Per Ledger" + Total_amt_cr - Total_amt_dr)
            {
            }
            column(EndBal__BAL_As_Per_Ledger_; EndBal + "BAL As Per Ledger")
            {
            }
            column(CBAL_DC2; CBAL_DC2)
            {
            }
            column(CBAL_DC1; CBAL_DC1)
            {
            }
            column(ADD_Crdt_diff; ADD_Crdt_diff)
            {
            }
            column(ADD_Debit_diff; ADD_Debit_diff)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1000000042; EmptyStringCaption_Control1000000042Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000054; EmptyStringCaption_Control1000000054Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000055; EmptyStringCaption_Control1000000055Lbl)
            {
            }
            column(BANK_RECONCILIATION_STATEMENTCaption; BANK_RECONCILIATION_STATEMENTCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1000000001; EmptyStringCaption_Control1000000001Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000009; EmptyStringCaption_Control1000000009Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000013; EmptyStringCaption_Control1000000013Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000015; EmptyStringCaption_Control1000000015Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000017; EmptyStringCaption_Control1000000017Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000019; EmptyStringCaption_Control1000000019Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000022; EmptyStringCaption_Control1000000022Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000025; EmptyStringCaption_Control1000000025Lbl)
            {
            }
            column(Less_Cheque_Deposited_But_Not_Cleared__Caption; Less_Cheque_Deposited_But_Not_Cleared__CaptionLbl)
            {
            }
            column(Add_Cheque_Issued_But_Not_Cleared__Caption; Add_Cheque_Issued_But_Not_Cleared__CaptionLbl)
            {
            }
            column(Closing_Balance_as_per_Bank___Caption; Closing_Balance_as_per_Bank___CaptionLbl)
            {
            }
            column(Closing_Balance_As_per_Book__Caption; Closing_Balance_As_per_Book__CaptionLbl)
            {
            }
            column(Cr_Caption; Cr_CaptionLbl)
            {
            }
            column(Dr_Caption; Dr_CaptionLbl)
            {
            }
            column(Less_Amount_Debit_to_Bank__Caption; Less_Amount_Debit_to_Bank__CaptionLbl)
            {
            }
            column(Add_Amount_Credit_to_Bank__Caption; Add_Amount_Credit_to_Bank__CaptionLbl)
            {
            }
            column(Cr_Caption_Control1000000061; Cr_Caption_Control1000000061Lbl)
            {
            }
            column(Dr_Caption_Control1000000062; Dr_Caption_Control1000000062Lbl)
            {
            }
            column(Bank_Account_No_; "No.")
            {
            }
            dataitem("Bank Ledger Entry Debit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date") ORDER(Ascending);
                column(Bank_Ledger_Entry_Debit__Posting_Date_; "Posting Date")
                {
                }
                column(Bank_Ledger_Entry_Debit__Bank_Ledger_Entry_Debit___Cheque_No__; "Bank Ledger Entry Debit"."Cheque No.")
                {
                }
                column(Bank_Ledger_Entry_Debit_Description; Description)
                {
                }
                column(Bank_Ledger_Entry_Debit__Debit_Amount_; "Debit Amount")
                {
                }
                column(dblVal1; dblVal1)
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
                column(Cheque_No_Caption; Cheque_No_CaptionLbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Bank_Ledger_Entry_Debit_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Ledger_Entry_Debit_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    BAL_LAST_STATEMENT := EndBal;
                    "bank reconciliation line rec".Reset;
                    "bank reconciliation line rec".SetFilter("bank reconciliation line rec"."Value Date", '>=%1&<=%2', 0D, DateTo);
                    "bank reconciliation line rec".SetFilter("bank reconciliation line rec"."Bank Account No.", "Bank Account"."No.");
                    /*
                       IF "bank reconciliation line rec".FIND('-') THEN
                       BEGIN
                          REPEAT
                            BAL_LAST_STATEMENT := BAL_LAST_STATEMENT + "bank reconciliation line rec"."Statement Amount";
                           // MESSAGE('%1',"bank reconciliation line rec"."Statement Amount");
                          UNTIL "bank reconciliation line rec".NEXT=0;
                       END;
                    */
                    ADD_Crdt_diff := 0;
                    ADD_Debit_diff := 0;
                    "bank reconciliation line rec".Reset;
                    "bank reconciliation line rec".SetFilter("bank reconciliation line rec"."Value Date", '>=%1&<=%2', 0D, DateTo);
                    "bank reconciliation line rec".SetFilter("bank reconciliation line rec"."Bank Account No.", "Bank Account"."No.");
                    "bank reconciliation line rec".SetFilter("bank reconciliation line rec".Type,
                                                             '=%1', "bank reconciliation line rec".Type::Difference);
                    if "bank reconciliation line rec".Find('-') then begin
                        repeat
                            if "bank reconciliation line rec"."Statement Amount" < 0 then
                                ADD_Crdt_diff := ADD_Crdt_diff + Abs("bank reconciliation line rec"."Statement Amount");
                            if "bank reconciliation line rec"."Statement Amount" >= 0 then
                                ADD_Debit_diff := ADD_Debit_diff + Abs("bank reconciliation line rec"."Statement Amount");
                        until "bank reconciliation line rec".Next = 0;
                    end;


                    "BAL As Per Ledger" := 0;
                    "Bank Ledger Entry Debit".Reset;

                    "Bank Ledger Entry Debit".SetCurrentKey("Bank Ledger Entry Debit"."Posting Date");
                    if DateFrom = 0D then
                        DateFrom := 0D;
                    if DateTo = 0D then
                        Error(text2);

                    "Bank Ledger Entry Debit".SetRange("Bank Ledger Entry Debit"."Posting Date", 0D, DateTo);
                    "Bank Ledger Entry Debit".SetFilter("Bank Ledger Entry Debit"."Bank Account No.", "Bank Account"."No.");
                    if "Bank Ledger Entry Debit".Find('-') then
                        repeat
                            "BAL As Per Ledger" := "BAL As Per Ledger" + "Bank Ledger Entry Debit".Amount;
                        until "Bank Ledger Entry Debit".Next = 0;

                    "Bank Ledger Entry Debit".Reset;

                    "Bank Ledger Entry Debit".SetCurrentKey("Bank Ledger Entry Debit"."Posting Date");
                    "Bank Ledger Entry Debit".SetFilter("Bank Ledger Entry Debit"."Bank Account No.", "Bank Account"."No.");
                    if DateFrom = 0D then
                        DateFrom := 0D;
                    if DateTo = 0D then
                        Error(text2);

                    "Bank Ledger Entry Debit".SetFilter("Bank Ledger Entry Debit"."Bank Account No.", "Bank Account"."No.");
                    "Bank Ledger Entry Debit".SetRange("Bank Ledger Entry Debit"."Posting Date", DateFrom, DateTo);

                    Total_bal_amt := BAL_LAST_STATEMENT;

                    if "BAL As Per Ledger" < 0 then begin
                        "BAL As Per Ledger" := (-1 * "BAL As Per Ledger");
                        CBAL_DC2 := 'Cr.';
                    end
                    else
                        CBAL_DC2 := 'Dr.';


                    if BAL_LAST_STATEMENT < 0 then begin
                        BAL_LAST_STATEMENT := Abs(BAL_LAST_STATEMENT);
                        CBAL_DC1 := 'Cr.';
                    end
                    else
                        CBAL_DC1 := 'Dr.';

                end;
            }
            dataitem("Bank Ledger Entry Credit"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date") ORDER(Ascending);
                RequestFilterHeading = '''''';
                column(Bank_Ledger_Entry_Credit__Posting_Date_; "Posting Date")
                {
                }
                column(Bank_Ledger_Entry_Credit__Credit_Amount_; "Credit Amount")
                {
                }
                column(Bank_Ledger_Entry_Credit_Description; Description)
                {
                }
                column(Bank_Ledger_Entry_Credit__Bank_Ledger_Entry_Credit___Cheque_No__; "Bank Ledger Entry Credit"."Cheque No.")
                {
                }
                column(dblVal2; dblVal2)
                {
                }
                column(Posting_DateCaption_Control1000000048; Posting_DateCaption_Control1000000048Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000049; Cheque_No_Caption_Control1000000049Lbl)
                {
                }
                column(DescriptionCaption_Control1000000050; DescriptionCaption_Control1000000050Lbl)
                {
                }
                column(AmountCaption_Control1000000051; AmountCaption_Control1000000051Lbl)
                {
                }
                column(Cheque_Issued_But_Not_ClearedCaption; Cheque_Issued_But_Not_ClearedCaptionLbl)
                {
                }
                column(Bank_Ledger_Entry_Credit_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Ledger_Entry_Credit_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnPreDataItem()
                begin

                    "Bank Ledger Entry Credit".Reset;

                    "Bank Ledger Entry Credit".SetCurrentKey("Bank Ledger Entry Credit"."Posting Date");
                    "Bank Ledger Entry Credit".SetFilter("Bank Ledger Entry Credit"."Bank Account No.", "Bank Account"."No.");
                    if DateFrom = 0D then
                        DateFrom := 0D;
                    if DateTo = 0D then
                        Error(text2);

                    "Bank Ledger Entry Credit".SetFilter("Bank Ledger Entry Credit"."Bank Account No.", "Bank Account"."No.");
                    "Bank Ledger Entry Credit".SetRange("Bank Ledger Entry Credit"."Posting Date", DateFrom, DateTo);
                end;
            }
            dataitem("Bank Account Statement Line"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Statement No.", "Statement Line No.") ORDER(Ascending);
                RequestFilterHeading = '''''';
                column(pd1; pd1)
                {
                }
                column(sh1; sh1)
                {
                }
                column(Bank_Account_Statement_Line_Description; Description)
                {
                }
                column(Bank_Account_Statement_Line__Statement_Amount_; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line__Value_Date_; "Value Date")
                {
                }
                column(Bank_Account_Statement_Line__Check_No__; "Check No.")
                {
                }
                column(dblVal3; dblVal3)
                {
                }
                column(AmountCaption_Control1000000080; AmountCaption_Control1000000080Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000082; Cheque_No_Caption_Control1000000082Lbl)
                {
                }
                column(DescriptionCaption_Control1000000083; DescriptionCaption_Control1000000083Lbl)
                {
                }
                column(Posting_DateCaption_Control1000000086; Posting_DateCaption_Control1000000086Lbl)
                {
                }
                column(Value_DateCaption; Value_DateCaptionLbl)
                {
                }
                column(Cheque_Issued_And_ClearedCaption; Cheque_Issued_And_ClearedCaptionLbl)
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
                    //CurrReport.CREATETOTALS("Bank Account Statement Line"."Statement Amount");
                end;
            }
            dataitem("Bank Account Statement Line0"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Transaction Date") ORDER(Ascending);
                RequestFilterHeading = '''''';
                column(pd2; pd2)
                {
                }
                column(sh2; sh2)
                {
                }
                column(Bank_Account_Statement_Line0_Description; Description)
                {
                }
                column(Bank_Account_Statement_Line0__Statement_Amount_; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line0__Value_Date_; "Value Date")
                {
                }
                column(Bank_Account_Statement_Line0__Check_No__; "Check No.")
                {
                }
                column(dblVal4; dblVal4)
                {
                }
                column(AmountCaption_Control1000000088; AmountCaption_Control1000000088Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000090; Cheque_No_Caption_Control1000000090Lbl)
                {
                }
                column(DescriptionCaption_Control1000000091; DescriptionCaption_Control1000000091Lbl)
                {
                }
                column(Posting_DateCaption_Control1000000094; Posting_DateCaption_Control1000000094Lbl)
                {
                }
                column(Value_DateCaption_Control1000000111; Value_DateCaption_Control1000000111Lbl)
                {
                }
                column(Cheque_Deposit_And_ClearedCaption; Cheque_Deposit_And_ClearedCaptionLbl)
                {
                }
                column(Bank_Account_Statement_Line0_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement_Line0_Statement_No_; "Statement No.")
                {
                }
                column(Bank_Account_Statement_Line0_Statement_Line_No_; "Statement Line No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement Line0".Reset;
                    "Bank Account Statement Line0".SetFilter("Bank Account Statement Line0"."Value Date", '>=%1&<=%2', DateFrom, DateTo);
                    "Bank Account Statement Line0".SetFilter("Bank Account Statement Line0"."Bank Account No.", "Bank Account"."No.");
                    "Bank Account Statement Line0".SetFilter("Bank Account Statement Line0"."Statement Amount", '>=0');


                    //   IF "Bank Account Statement Line".FIND('-') THEN
                    //         MESSAGE('Uttam0');
                end;
            }
            dataitem("Bank Account Statement Line1"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Transaction Date") ORDER(Ascending);
                RequestFilterHeading = '''''';
                column(Bank_Account_Statement_Line1__Document_No__; "Document No.")
                {
                }
                column(Bank_Account_Statement_Line1__Transaction_Date_; "Transaction Date")
                {
                }
                column(Bank_Account_Statement_Line1_Description; Description)
                {
                }
                column(Bank_Account_Statement_Line1__Statement_Amount_; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line1__Value_Date_; "Value Date")
                {
                }
                column(Bank_Account_Statement_Line1__Check_No__; "Check No.")
                {
                }
                column(dblVal5; dblVal5)
                {
                }
                column(AmountCaption_Control1000000096; AmountCaption_Control1000000096Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000098; Cheque_No_Caption_Control1000000098Lbl)
                {
                }
                column(DescriptionCaption_Control1000000099; DescriptionCaption_Control1000000099Lbl)
                {
                }
                column(Credit_DifferenceCaption; Credit_DifferenceCaptionLbl)
                {
                }
                column(Posting_DateCaption_Control1000000102; Posting_DateCaption_Control1000000102Lbl)
                {
                }
                column(Value_DateCaption_Control1000000078; Value_DateCaption_Control1000000078Lbl)
                {
                }
                column(Bank_Account_Statement_Line1_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement_Line1_Statement_No_; "Statement No.")
                {
                }
                column(Bank_Account_Statement_Line1_Statement_Line_No_; "Statement Line No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement Line1".Reset;
                    "Bank Account Statement Line1".SetFilter("Bank Account Statement Line1"."Value Date", '>=%1&<=%2', DateFrom, DateTo);
                    "Bank Account Statement Line1".SetFilter("Bank Account Statement Line1"."Bank Account No.", "Bank Account"."No.");
                    "Bank Account Statement Line1".SetFilter("Bank Account Statement Line1"."Statement Amount", '<0');

                    "Bank Account Statement Line1".SetFilter("Bank Account Statement Line1".Type,
                    '=%1', "Bank Account Statement Line1".Type::Difference);
                end;
            }
            dataitem("Bank Account Statement Line2"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Transaction Date") ORDER(Ascending);
                column(Bank_Account_Statement_Line2__Transaction_Date_; "Transaction Date")
                {
                }
                column(Bank_Account_Statement_Line2_Description; Description)
                {
                }
                column(Bank_Account_Statement_Line2__Document_No__; "Document No.")
                {
                }
                column(Bank_Account_Statement_Line2__Check_No__; "Check No.")
                {
                }
                column(Bank_Account_Statement_Line2__Statement_Amount_; "Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line2__Value_Date_; "Value Date")
                {
                }
                column(dblVal6; dblVal6)
                {
                }
                column(AmountCaption_Control1000000104; AmountCaption_Control1000000104Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000106; Cheque_No_Caption_Control1000000106Lbl)
                {
                }
                column(DescriptionCaption_Control1000000107; DescriptionCaption_Control1000000107Lbl)
                {
                }
                column(Debit_DifferenceCaption; Debit_DifferenceCaptionLbl)
                {
                }
                column(Posting_DateCaption_Control1000000110; Posting_DateCaption_Control1000000110Lbl)
                {
                }
                column(Value_DateCaption_Control1000000077; Value_DateCaption_Control1000000077Lbl)
                {
                }
                column(Bank_Account_Statement_Line2_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement_Line2_Statement_No_; "Statement No.")
                {
                }
                column(Bank_Account_Statement_Line2_Statement_Line_No_; "Statement Line No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement Line2".Reset;
                    "Bank Account Statement Line2".SetFilter("Bank Account Statement Line2"."Value Date", '>=%1&<=%2', DateFrom, DateTo);
                    "Bank Account Statement Line2".SetFilter("Bank Account Statement Line2"."Bank Account No.", "Bank Account"."No.");
                    "Bank Account Statement Line2".SetFilter("Bank Account Statement Line2"."Statement Amount", '>=0');
                    "Bank Account Statement Line2".SetFilter("Bank Account Statement Line2".Type,
                                                             '=%1', "Bank Account Statement Line2".Type::Difference);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //     MESSAGE('uttam');
                Total_amt_cr := 0;
                Total_amt_dr := 0;
                Total_bal_amt := 0;
                BAL_AMT_PRT := 0;
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
        DateFrom: Date;
        DateTo: Date;
        chk_open: Boolean;
        Total_amt_cr: Decimal;
        Total_amt_dr: Decimal;
        Total_bal_amt: Decimal;
        CBAL_DC: Text[4];
        BAL_LAST_STATEMENT: Decimal;
        BAL_AMT_PRT: Decimal;
        text1: Label 'From Date is not proper';
        text2: Label 'To Date is not proper';
        "bank reconciliation line rec": Record "Bank Account Statement Line";
        "Bank Account Statement": Record "Bank Account Statement";
        "min account statement date": Date;
        "BAL As Per Ledger": Decimal;
        CBAL_DC1: Text[4];
        CBAL_DC2: Text[4];
        bankaccstatementline: Record "Bank Account Statement Line";
        B_repass: Boolean;
        ADD_Crdt_diff: Decimal;
        ADD_Debit_diff: Decimal;
        BNKaccLedEnt: Record "Bank Account Ledger Entry";
        pd1: Date;
        pd2: Date;
        sh1: Text[50];
        sh2: Text[50];
        disp_diff: Boolean;
        disp_cleared: Boolean;
        Reccompanyinfo: Record "Company Information";
        dblVal1: Decimal;
        dblVal2: Decimal;
        dblVal3: Decimal;
        dblVal4: Decimal;
        dblVal5: Decimal;
        dblVal6: Decimal;
        st: Code[20];
        EndBal: Decimal;
        Stdate: Date;
        BAL_LAST_STATEMENT1: Decimal;
        EmptyStringCaptionLbl: Label '.';
        EmptyStringCaption_Control1000000042Lbl: Label '.';
        EmptyStringCaption_Control1000000054Lbl: Label '.';
        EmptyStringCaption_Control1000000055Lbl: Label '.';
        BANK_RECONCILIATION_STATEMENTCaptionLbl: Label 'BANK RECONCILIATION STATEMENT';
        EmptyStringCaption_Control1000000001Lbl: Label '.';
        EmptyStringCaption_Control1000000009Lbl: Label '.';
        EmptyStringCaption_Control1000000013Lbl: Label '.';
        EmptyStringCaption_Control1000000015Lbl: Label '.';
        EmptyStringCaption_Control1000000017Lbl: Label '.';
        EmptyStringCaption_Control1000000019Lbl: Label '.';
        EmptyStringCaption_Control1000000022Lbl: Label '.';
        EmptyStringCaption_Control1000000025Lbl: Label '.';
        Less_Cheque_Deposited_But_Not_Cleared__CaptionLbl: Label 'Less Cheque Deposited But Not Cleared :';
        Add_Cheque_Issued_But_Not_Cleared__CaptionLbl: Label 'Add Cheque Issued But Not Cleared :';
        Closing_Balance_as_per_Bank___CaptionLbl: Label 'Closing Balance as per Bank : ';
        Closing_Balance_As_per_Book__CaptionLbl: Label 'Closing Balance As per Book :';
        Cr_CaptionLbl: Label 'Cr.';
        Dr_CaptionLbl: Label 'Dr.';
        Less_Amount_Debit_to_Bank__CaptionLbl: Label 'Less Amount Debit to Bank :';
        Add_Amount_Credit_to_Bank__CaptionLbl: Label 'Add Amount Credit to Bank :';
        Cr_Caption_Control1000000061Lbl: Label 'Cr.';
        Dr_Caption_Control1000000062Lbl: Label 'Dr.';
        Cheque_Deposited_But_Not_ClearedCaptionLbl: Label 'Cheque Deposited But Not Cleared';
        Posting_DateCaptionLbl: Label 'Posting Date';
        DescriptionCaptionLbl: Label 'Description';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        AmountCaptionLbl: Label 'Amount';
        Posting_DateCaption_Control1000000048Lbl: Label 'Posting Date';
        Cheque_No_Caption_Control1000000049Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000050Lbl: Label 'Description';
        AmountCaption_Control1000000051Lbl: Label 'Amount';
        Cheque_Issued_But_Not_ClearedCaptionLbl: Label 'Cheque Issued But Not Cleared';
        AmountCaption_Control1000000080Lbl: Label 'Amount';
        Cheque_No_Caption_Control1000000082Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000083Lbl: Label 'Description';
        Posting_DateCaption_Control1000000086Lbl: Label 'Posting Date';
        Value_DateCaptionLbl: Label 'Value Date';
        Cheque_Issued_And_ClearedCaptionLbl: Label 'Cheque Issued And Cleared';
        AmountCaption_Control1000000088Lbl: Label 'Amount';
        Cheque_No_Caption_Control1000000090Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000091Lbl: Label 'Description';
        Posting_DateCaption_Control1000000094Lbl: Label 'Posting Date';
        Value_DateCaption_Control1000000111Lbl: Label 'Value Date';
        Cheque_Deposit_And_ClearedCaptionLbl: Label 'Cheque Deposit And Cleared';
        AmountCaption_Control1000000096Lbl: Label 'Amount';
        Cheque_No_Caption_Control1000000098Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000099Lbl: Label 'Description';
        Credit_DifferenceCaptionLbl: Label 'Credit Difference';
        Posting_DateCaption_Control1000000102Lbl: Label 'Posting Date';
        Value_DateCaption_Control1000000078Lbl: Label 'Value Date';
        AmountCaption_Control1000000104Lbl: Label 'Amount';
        Cheque_No_Caption_Control1000000106Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000107Lbl: Label 'Description';
        Debit_DifferenceCaptionLbl: Label 'Debit Difference';
        Posting_DateCaption_Control1000000110Lbl: Label 'Posting Date';
        Value_DateCaption_Control1000000077Lbl: Label 'Value Date';
}

