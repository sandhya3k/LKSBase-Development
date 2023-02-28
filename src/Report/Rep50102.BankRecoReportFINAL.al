report 50102 "Bank Reco Report FINAL"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankRecoReportFINAL.rdlc';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            DataItemTableView = SORTING("No.");
            column(Reccompanyinfo__Phone_No__; Reccompanyinfo."Phone No.")
            {
            }
            column(Reccompanyinfo_City; Reccompanyinfo.City)
            {
            }
            column(Reccompanyinfo__Address_2_; Reccompanyinfo."Address 2")
            {
            }
            column(Reccompanyinfo_Address; Reccompanyinfo.Address)
            {
            }
            column(Reccompanyinfo_Name; Reccompanyinfo.Name)
            {
            }
            column(Statement_No_________STno; 'Statement No.:-' + ' ' + STno)
            {
            }
            column(STRSUBSTNO__Bank____1___Name_; StrSubstNo('Bank : %1', Name))
            {
            }
            column(STRSUBSTNO__Code____1____No___; StrSubstNo('Code : %1', "No."))
            {
            }
            column(statementdt; statementdt)
            {
            }
            column(tot1_tot2__lastSTbal; tot1 + tot2 + lastSTbal)
            {
            }
            column(ABS_TOTamt1_; Abs(TOTamt1))
            {
            }
            column(ABS_TOTamt2_; Abs(TOTamt2))
            {
            }
            column(CLOSbal; CLOSbal)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1000000010; EmptyStringCaption_Control1000000010Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000014; EmptyStringCaption_Control1000000014Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000022; EmptyStringCaption_Control1000000022Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000028; EmptyStringCaption_Control1000000028Lbl)
            {
            }
            column(BANK_RECONCILIATION_STATEMENTCaption; BANK_RECONCILIATION_STATEMENTCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1000000053; EmptyStringCaption_Control1000000053Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000055; EmptyStringCaption_Control1000000055Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000057; EmptyStringCaption_Control1000000057Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000059; EmptyStringCaption_Control1000000059Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000060; EmptyStringCaption_Control1000000060Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000062; EmptyStringCaption_Control1000000062Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000064; EmptyStringCaption_Control1000000064Lbl)
            {
            }
            column(Statement_Date__Caption; Statement_Date__CaptionLbl)
            {
            }
            column(Closing_Balance_as_per_Bank___Caption; Closing_Balance_as_per_Bank___CaptionLbl)
            {
            }
            column(Add_Cheque_Issued_But_Not_Cleared__Caption; Add_Cheque_Issued_But_Not_Cleared__CaptionLbl)
            {
            }
            column(Less_Cheque_Deposited_But_Not_Cleared__Caption; Less_Cheque_Deposited_But_Not_Cleared__CaptionLbl)
            {
            }
            column(Closing_Balance_As_per_Book__Caption; Closing_Balance_As_per_Book__CaptionLbl)
            {
            }
            column(Bank_Account_No_; "No.")
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Entry No.") WHERE(Amount = FILTER(> 0), Reversed = FILTER(false));
                column(Bank_Account_Ledger_Entry_Amount; Amount)
                {
                }
                column(Bank_Account_Ledger_Entry__Cheque_No__; "Cheque No.")
                {
                }
                column(Bank_Account_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Bank_Account_Ledger_Entry_Description; Description)
                {
                }
                column(Bank_Account_Ledger_Entry_Amount_Control1000000066; Amount)
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
                column(Bank_Account_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Account_Ledger_Entry_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //  BkAcST.RESET ;
                    // BkAcST.SETRANGE(BkAcST."Bank Account No.",bankno);
                    // BkAcST.SETRANGE(BkAcST."Statement Date",statementdt);
                    //   IF BkAcST.FIND('-') THEN
                    //   BEGIN
                    /*   BkAcstLN.RESET ;
                         BkAcstLN.SETRANGE(BkAcstLN."Bank Account No.",bankno);
                         BkAcstLN.SETRANGE(BkAcstLN."Statement No.",STno);
                            IF BkAcstLN.FIND('-')  THEN
                               CurrReport.SKIP ;
                         END ; */


                    GLE.Reset;
                    GLE.SetRange(GLE."Document No.", "Bank Account Ledger Entry"."Document No.");
                    if GLE.Find('-') then
                        des1 := GLE.Description;

                    TOTamt1 := TOTamt1 + "Bank Account Ledger Entry".Amount;

                end;

                trigger OnPreDataItem()
                begin
                    if bankno <> '' then
                        "Bank Account Ledger Entry".SetFilter("Bank Account Ledger Entry"."Bank Account No.", '%1', bankno);
                    // "Bank Account Ledger Entry".SETRANGE("Bank Account Ledger Entry"."Posting Date",stdate,statementdt); blocked by 5713
                    "Bank Account Ledger Entry".SetFilter("Bank Account Ledger Entry"."Posting Date", '%1..%2', stdate, statementdt);   // 5713
                                                                                                                                        //"Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Posting Date",'<%1',statementdt);

                    /*  des1 := '' ;
                      BkAcST.RESET ;
                      BkAcST.SETRANGE(BkAcST."Bank Account No.",bankno);
                      BkAcST.SETRANGE(BkAcST."Statement Date",statementdt);
                        IF BkAcST.FIND('-') THEN
                           BEGIN
                           BkAcstLN.RESET ;
                           BkAcstLN.SETRANGE(BkAcstLN."Bank Account No.",bankno);
                           BkAcstLN.SETRANGE(BkAcstLN."Statement No.",BkAcST."Statement No.");
                              IF BkAcstLN.FIND('-')  THEN
                                 CurrReport.SKIP ;
                           END ;   */
                    "Bank Account Ledger Entry".SetFilter("Bank Account Ledger Entry"."Statement No.", '<>%1', STno);

                end;
            }
            dataitem("Bank Account Ledger Entry11"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Entry No.") WHERE(Amount = FILTER(< 0), Reversed = FILTER(false));
                column(Bank_Account_Ledger_Entry11__Posting_Date_; "Posting Date")
                {
                }
                column(ABS_Amount_; Abs(Amount))
                {
                }
                column(Bank_Account_Ledger_Entry11__Cheque_No__; "Cheque No.")
                {
                }
                column(Bank_Account_Ledger_Entry11_Description; Description)
                {
                }
                column(ABS_Amount__Control1000000068; Abs(Amount))
                {
                }
                column(AmountCaption_Control1000000043; AmountCaption_Control1000000043Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000044; Cheque_No_Caption_Control1000000044Lbl)
                {
                }
                column(DescriptionCaption_Control1000000045; DescriptionCaption_Control1000000045Lbl)
                {
                }
                column(Posting_DateCaption_Control1000000046; Posting_DateCaption_Control1000000046Lbl)
                {
                }
                column(Cheque_Issued_But_Not_ClearedCaption; Cheque_Issued_But_Not_ClearedCaptionLbl)
                {
                }
                column(Bank_Account_Ledger_Entry11_Entry_No_; "Entry No.")
                {
                }
                column(Bank_Account_Ledger_Entry11_Bank_Account_No_; "Bank Account No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /* BkAcST.RESET ;
                     BkAcST.SETRANGE(BkAcST."Bank Account No.",bankno);
                     BkAcST.SETRANGE(BkAcST."Statement Date",statementdt);
                       IF BkAcST.FIND('-') THEN
                          BEGIN
                          BkAcstLN.RESET ;
                          BkAcstLN.SETRANGE(BkAcstLN."Bank Account No.",bankno);
                          BkAcstLN.SETRANGE(BkAcstLN."Statement No.",BkAcST."Statement No.");
                             IF BkAcstLN.FIND('-')  THEN
                                CurrReport.SKIP ;
                          END ;
                          */


                    GLE.Reset;
                    GLE.SetRange(GLE."Document No.", "Bank Account Ledger Entry11"."Document No.");
                    if GLE.Find('-') then
                        des2 := GLE.Description;

                    TOTamt2 := TOTamt2 + "Bank Account Ledger Entry11".Amount;

                end;

                trigger OnPreDataItem()
                begin
                    if bankno <> '' then
                        "Bank Account Ledger Entry11".SetFilter("Bank Account Ledger Entry11"."Bank Account No.", '%1', bankno);

                    //"Bank Account Ledger Entry11".SETRANGE("Bank Account Ledger Entry11"."Bank Account No.",bankno);
                    //"Bank Account Ledger Entry11".SETRANGE("Bank Account Ledger Entry11"."Posting Date",stdate,endate);
                    //"Bank Account Ledger Entry11".SETRANGE("Bank Account Ledger Entry11"."Posting Date",stdate,statementdt); // blocked by 5713
                    "Bank Account Ledger Entry11".SetFilter("Bank Account Ledger Entry11"."Posting Date", '%1..%2', stdate, statementdt); //5713

                    des2 := '';
                    /*
                     BkAcST.RESET ;
                     BkAcST.SETRANGE(BkAcST."Bank Account No.",bankno);
                     BkAcST.SETRANGE(BkAcST."Statement Date",statementdt);
                       IF BkAcST.FIND('-') THEN
                          BEGIN
                          BkAcstLN.RESET ;
                          BkAcstLN.SETRANGE(BkAcstLN."Bank Account No.",bankno);
                          BkAcstLN.SETRANGE(BkAcstLN."Statement No.",BkAcST."Statement No.");
                             IF BkAcstLN.FIND('-')  THEN
                                CurrReport.SKIP ;
                          END ;*/
                    "Bank Account Ledger Entry11".SetFilter("Bank Account Ledger Entry11"."Statement No.", '<>%1', STno);

                end;
            }
            dataitem("Bank Account Statement1"; "Bank Account Statement")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Statement No.");
                PrintOnlyIfDetail = true;
                column(tot1; tot1)
                {
                }
                column(Posting_DateCaption_Control1000000001; Posting_DateCaption_Control1000000001Lbl)
                {
                }
                column(DescriptionCaption_Control1000000002; DescriptionCaption_Control1000000002Lbl)
                {
                }
                column(Statement_No_Caption; Statement_No_CaptionLbl)
                {
                }
                column(Cheque_No_Caption_Control1000000003; Cheque_No_Caption_Control1000000003Lbl)
                {
                }
                column(Value_DateCaption; Value_DateCaptionLbl)
                {
                }
                column(AmountCaption_Control1000000006; AmountCaption_Control1000000006Lbl)
                {
                }
                column(Cheque_Deposit_And_ClearedCaption; Cheque_Deposit_And_ClearedCaptionLbl)
                {
                }
                column(Bank_Account_Statement1_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement1_Statement_No_; "Statement No.")
                {
                }
                dataitem("Bank Account Statement Line"; "Bank Account Statement Line")
                {
                    DataItemLink = "Statement No." = FIELD("Statement No."), "Bank Account No." = FIELD("Bank Account No.");
                    DataItemTableView = SORTING("Bank Account No.", "Statement No.", "Statement Line No.") WHERE("Statement Amount" = FILTER(> 0));
                    column(Bank_Account_Statement_Line__Bank_Account_Statement_Line___Transaction_Date_; "Bank Account Statement Line"."Transaction Date")
                    {
                    }
                    column(Bank_Account_Statement_Line__Statement_No__; "Statement No.")
                    {
                    }
                    column(Bank_Account_Statement_Line__Check_No__; "Check No.")
                    {
                    }
                    column(Bank_Account_Statement_Line__Bank_Account_Statement_Line___Value_Date_; "Bank Account Statement Line"."Value Date")
                    {
                    }
                    column(Bank_Account_Statement_Line__Statement_Amount_; "Statement Amount")
                    {
                    }
                    column(Bank_Account_Statement_Line_Description; Description)
                    {
                    }
                    column(Bank_Account_Statement_Line_Bank_Account_No_; "Bank Account No.")
                    {
                    }
                    column(Bank_Account_Statement_Line_Statement_Line_No_; "Statement Line No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        BKLedEn.Reset;
                        BKLedEn.SetRange(BKLedEn."Document No.", "Bank Account Statement Line"."Document No.");
                        BKLedEn.SetRange(BKLedEn.Reversed, true);
                        if BKLedEn.Find('-') then
                            CurrReport.Skip;


                        recodt := 0D;
                        bankstat.Reset;
                        bankstat.SetRange(bankstat."Bank Account No.", "Bank Account Statement Line"."Bank Account No.");
                        bankstat.SetRange(bankstat."Statement No.", "Bank Account Statement Line"."Statement No.");
                        if bankstat.Find('-') then begin
                            recodt := bankstat."Statement Date";
                        end;

                        tot1 := tot1 + "Bank Account Statement Line"."Statement Amount";
                    end;
                }

                trigger OnAfterGetRecord()
                begin


                    /* GLE.RESET ;
                     GLE.SETRANGE(GLE."Document No.","Bank Account Ledger Entry1"."Document No.");
                       IF GLE.FIND('-') THEN
                          des3 := GLE.Description ; */

                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement1".SetRange("Bank Account Statement1"."Bank Account No.", bankno);
                    "Bank Account Statement1".SetRange("Bank Account Statement1"."Statement Date", statementdt);
                    tot1 := 0;
                    des3 := '';
                end;
            }
            dataitem("Bank Account Statement2"; "Bank Account Statement")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Statement No.");
                PrintOnlyIfDetail = true;
                column(ABS_tot2_; Abs(tot2))
                {
                }
                column(Posting_DateCaption_Control1000000036; Posting_DateCaption_Control1000000036Lbl)
                {
                }
                column(Cheque_Issued_And_ClearedCaption; Cheque_Issued_And_ClearedCaptionLbl)
                {
                }
                column(DescriptionCaption_Control1000000035; DescriptionCaption_Control1000000035Lbl)
                {
                }
                column(Statement_No_Caption_Control1000000034; Statement_No_Caption_Control1000000034Lbl)
                {
                }
                column(Cheque_No_Caption_Control1000000033; Cheque_No_Caption_Control1000000033Lbl)
                {
                }
                column(Value_DateCaption_Control1000000032; Value_DateCaption_Control1000000032Lbl)
                {
                }
                column(AmountCaption_Control1000000031; AmountCaption_Control1000000031Lbl)
                {
                }
                column(Bank_Account_Statement2_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Bank_Account_Statement2_Statement_No_; "Statement No.")
                {
                }
                dataitem("Bank Account Statement Line1"; "Bank Account Statement Line")
                {
                    DataItemLink = "Statement No." = FIELD("Statement No."), "Bank Account No." = FIELD("Bank Account No.");
                    DataItemTableView = SORTING("Bank Account No.", "Statement No.", "Statement Line No.") WHERE("Statement Amount" = FILTER(< 0));
                    column(Bank_Account_Statement_Line1__Bank_Account_Statement_Line1___Transaction_Date_; "Bank Account Statement Line1"."Transaction Date")
                    {
                    }
                    column(Bank_Account_Statement_Line1__Bank_Account_Statement_Line1___Value_Date_; "Bank Account Statement Line1"."Value Date")
                    {
                    }
                    column(ABS__Statement_Amount__; Abs("Statement Amount"))
                    {
                    }
                    column(Bank_Account_Statement_Line1__Check_No__; "Check No.")
                    {
                    }
                    column(Bank_Account_Statement_Line1__Statement_No__; "Statement No.")
                    {
                    }
                    column(Bank_Account_Statement_Line1_Description; Description)
                    {
                    }
                    column(Bank_Account_Statement_Line1_Bank_Account_No_; "Bank Account No.")
                    {
                    }
                    column(Bank_Account_Statement_Line1_Statement_Line_No_; "Statement Line No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        BKLedEn.Reset;
                        BKLedEn.SetRange(BKLedEn."Document No.", "Bank Account Statement Line1"."Document No.");
                        BKLedEn.SetRange(BKLedEn.Reversed, true);
                        if BKLedEn.Find('-') then
                            CurrReport.Skip;

                        recodt := 0D;
                        bankstat.Reset;
                        bankstat.SetRange(bankstat."Bank Account No.", "Bank Account Statement Line"."Bank Account No.");
                        bankstat.SetRange(bankstat."Statement No.", "Bank Account Statement Line"."Statement No.");
                        if bankstat.Find('-') then begin
                            recodt := bankstat."Statement Date";
                        end;

                        tot2 := tot2 + "Bank Account Statement Line1"."Statement Amount";
                    end;
                }

                trigger OnAfterGetRecord()
                begin

                    /* GLE.RESET ;
                     GLE.SETRANGE(GLE."Document No.","Bank Account Ledger Entry2"."Document No.");
                       IF GLE.FIND('-') THEN
                          des4 := GLE.Description ;*/

                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Statement2".SetRange("Bank Account Statement2"."Bank Account No.", bankno);
                    "Bank Account Statement2".SetRange("Bank Account Statement2"."Statement Date", statementdt);

                    tot2 := 0;
                    des4 := '';
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //  message(format("Bank Account"."No."));
                /* BLE.RESET ;
                 BLE.SETRANGE(BLE."Bank Account No.",bankno);
                 BLE.SETRANGE(BLE."Posting Date",0D,statementdt) ;
                   IF BLE.FIND('-') THEN
                      REPEAT
                      TOTBAL += BLE."Debit Amount"-BLE."Credit Amount" ;
                      UNTIL BLE.NEXT= 0 ;
                 */

                bankstat.Reset;
                bankstat.SetRange(bankstat."Bank Account No.", bankno);
                bankstat.SetRange(bankstat."Statement No.", STno);
                if bankstat.Find('-') then
                    lastSTbal := bankstat."Balance Last Statement";

            end;

            trigger OnPreDataItem()
            begin

                "Bank Account".SetRange("Bank Account"."No.", bankno);
                TOTBAL := 0;
                TOTamt1 := 0;
                TOTamt2 := 0;
                CLOSbal := 0;
                lastSTbal := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Bank Account No."; bankno)
                {
                    TableRelation = "Bank Account"."No.";
                    ApplicationArea = All;
                }
                field("Start Date"; stdate)
                {
                    ApplicationArea = All;
                }
                field("Statement Date"; statementdt)
                {
                    ApplicationArea = All;
                }
                field("Statement No."; STno)
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
        stdate: Date;
        endate: Date;
        bankstat: Record "Bank Account Statement";
        recodt: Date;
        bankno: Code[10];
        BkAcstLN: Record "Bank Account Statement Line";
        Reccompanyinfo: Record "Company Information";
        tot1: Decimal;
        tot2: Decimal;
        des1: Text[100];
        des2: Text[100];
        des3: Text[100];
        des4: Text[100];
        GLE: Record "G/L Entry";
        statementdt: Date;
        BkAcST: Record "Bank Account Statement";
        STno: Code[20];
        BKLedEn: Record "Bank Account Ledger Entry";
        TOTamt1: Decimal;
        TOTamt2: Decimal;
        BLE: Record "Bank Account Ledger Entry";
        TOTBAL: Decimal;
        CLOSbal: Decimal;
        lastSTbal: Decimal;
        var1: Decimal;
        var2: Decimal;
        EmptyStringCaptionLbl: Label '.';
        EmptyStringCaption_Control1000000010Lbl: Label '.';
        EmptyStringCaption_Control1000000014Lbl: Label '.';
        EmptyStringCaption_Control1000000022Lbl: Label '.';
        EmptyStringCaption_Control1000000028Lbl: Label '.';
        BANK_RECONCILIATION_STATEMENTCaptionLbl: Label 'BANK RECONCILIATION STATEMENT';
        EmptyStringCaption_Control1000000053Lbl: Label '.';
        EmptyStringCaption_Control1000000055Lbl: Label '.';
        EmptyStringCaption_Control1000000057Lbl: Label '.';
        EmptyStringCaption_Control1000000059Lbl: Label '.';
        EmptyStringCaption_Control1000000060Lbl: Label '.';
        EmptyStringCaption_Control1000000062Lbl: Label '.';
        EmptyStringCaption_Control1000000064Lbl: Label '.';
        Statement_Date__CaptionLbl: Label 'Statement Date:-';
        Closing_Balance_as_per_Bank___CaptionLbl: Label 'Closing Balance as per Bank : ';
        Add_Cheque_Issued_But_Not_Cleared__CaptionLbl: Label 'Add Cheque Issued But Not Cleared :';
        Less_Cheque_Deposited_But_Not_Cleared__CaptionLbl: Label 'Less Cheque Deposited But Not Cleared :';
        Closing_Balance_As_per_Book__CaptionLbl: Label 'Closing Balance As per Book :';
        Cheque_Deposited_But_Not_ClearedCaptionLbl: Label 'Cheque Deposited But Not Cleared';
        Posting_DateCaptionLbl: Label 'Posting Date';
        DescriptionCaptionLbl: Label 'Description';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        AmountCaptionLbl: Label 'Amount';
        AmountCaption_Control1000000043Lbl: Label 'Amount';
        Cheque_No_Caption_Control1000000044Lbl: Label 'Cheque No.';
        DescriptionCaption_Control1000000045Lbl: Label 'Description';
        Posting_DateCaption_Control1000000046Lbl: Label 'Posting Date';
        Cheque_Issued_But_Not_ClearedCaptionLbl: Label 'Cheque Issued But Not Cleared';
        Posting_DateCaption_Control1000000001Lbl: Label 'Posting Date';
        DescriptionCaption_Control1000000002Lbl: Label 'Description';
        Statement_No_CaptionLbl: Label 'Statement No.';
        Cheque_No_Caption_Control1000000003Lbl: Label 'Cheque No.';
        Value_DateCaptionLbl: Label 'Value Date';
        AmountCaption_Control1000000006Lbl: Label 'Amount';
        Cheque_Deposit_And_ClearedCaptionLbl: Label 'Cheque Deposit And Cleared';
        Posting_DateCaption_Control1000000036Lbl: Label 'Posting Date';
        Cheque_Issued_And_ClearedCaptionLbl: Label 'Cheque Issued And Cleared';
        DescriptionCaption_Control1000000035Lbl: Label 'Description';
        Statement_No_Caption_Control1000000034Lbl: Label 'Statement No.';
        Cheque_No_Caption_Control1000000033Lbl: Label 'Cheque No.';
        Value_DateCaption_Control1000000032Lbl: Label 'Value Date';
        AmountCaption_Control1000000031Lbl: Label 'Amount';
}

