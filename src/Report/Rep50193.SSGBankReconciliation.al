report 50193 "SSG Bank Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/SSGBankReconciliation.rdlc';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(Bank_Account__Bank_Account___No__; "Bank Account"."No.")
            {
            }
            column(Compinfo_Name; Compinfo.Name)
            {
            }
            column(Bank_Reconciliation_Statement_; 'Bank Reconciliation Statement')
            {
            }
            column(Bank_Account__Bank_Account__Name; "Bank Account".Name)
            {
            }
            column(Bank_Account__Bank_Account___Bank_Account_No__; "Bank Account"."Bank Account No.")
            {
            }
            column(dtRecoDate; dtRecoDate)
            {
            }
            column(decAmount____Bank_Account_Ledger_Entry__Amount____Bank_Account_Statement_Line___Statement_Amount_; decAmount - "Bank Account Ledger Entry".Amount + "Bank Account Statement Line"."Statement Amount")
            {
            }
            column(Bank_Account_Ledger_Entry__Amount; "Bank Account Ledger Entry".Amount)
            {
            }
            column(decAmount; decAmount)
            {
            }
            column(Bank_Account_Statement_Line___Statement_Amount_; "Bank Account Statement Line"."Statement Amount")
            {
            }
            column(Bank_Account_Code_Caption; Bank_Account_Code_CaptionLbl)
            {
            }
            column(Bank_Account_Name_Caption; Bank_Account_Name_CaptionLbl)
            {
            }
            column(Bank_Account_No__Caption; Bank_Account_No__CaptionLbl)
            {
            }
            column(Bank_Reconciliation_on_Caption; Bank_Reconciliation_on_CaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry__Cheque_No__Caption; "Bank Account Ledger Entry".FieldCaption("Cheque No."))
            {
            }
            column(Bank_Account_Ledger_Entry__Cheque_Date_Caption; "Bank Account Ledger Entry".FieldCaption("Cheque Date"))
            {
            }
            column(Cheque_IssuedCaption; Cheque_IssuedCaptionLbl)
            {
            }
            column(Uncleared_TransactionsCaption; Uncleared_TransactionsCaptionLbl)
            {
            }
            column(Cheque_DepositedCaption; Cheque_DepositedCaptionLbl)
            {
            }
            column(Balance_as_per_bankCaption; Balance_as_per_bankCaptionLbl)
            {
            }
            column(Less__Uncleared_EntriesCaption; Less__Uncleared_EntriesCaptionLbl)
            {
            }
            column(Balance_as_per_BooksCaption; Balance_as_per_BooksCaptionLbl)
            {
            }
            column(Summary_of_the_ReconciliationCaption; Summary_of_the_ReconciliationCaptionLbl)
            {
            }
            column(Add__Difference_AmountCaption; Add__Difference_AmountCaptionLbl)
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending) WHERE(Reversed = FILTER(false));
                column(Bank_Account_Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Bank_Account_Ledger_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(Bank_Account_Ledger_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(Bank_Account_Ledger_Entry__Cheque_No__; "Cheque No.")
                {
                }
                column(Bank_Account_Ledger_Entry__Cheque_Date_; "Cheque Date")
                {
                }
                column(DocDesc; DocDesc)
                {
                }
                column(Bank_Account_Ledger_Entry__Debit_Amount__Control1000000001; "Debit Amount")
                {
                }
                column(Bank_Account_Ledger_Entry__Credit_Amount__Control1000000004; "Credit Amount")
                {
                }
                column(TotalCaption; TotalCaptionLbl)
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
                    if "Bank Account Ledger Entry".Open = false then begin
                        BankAccStmtLine.Reset;
                        BankAccStmtLine.SetRange(BankAccStmtLine."Bank Account No.", "Bank Account"."No.");
                        BankAccStmtLine.SetRange("Statement No.", "Bank Account Ledger Entry"."Statement No.");
                        BankAccStmtLine.SetRange("Statement Line No.", "Bank Account Ledger Entry"."Statement Line No.");
                        if BankAccStmtLine.Find('-') then begin
                            if BankAccStmtLine."Value Date" <= dtRecoDate then
                                CurrReport.Skip;
                        end else begin
                            if "Bank Account Ledger Entry"."Statement Status" = "Bank Account Ledger Entry"."Statement Status"::Closed then
                                CurrReport.Skip;
                        end;
                    end;

                    CustLedEntry.Reset;
                    CustLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                    if CustLedEntry.Find('-') then begin
                        Cust.Get(CustLedEntry."Customer No.");
                        DocDesc := Cust.Name;
                    end else begin
                        VendLedEntry.Reset;
                        VendLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                        if VendLedEntry.Find('-') then begin
                            Vend.Get(VendLedEntry."Vendor No.");
                            DocDesc := Vend.Name;
                        end else begin
                            FALedEntry.Reset;
                            FALedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                            if FALedEntry.Find('-') then begin
                                FA.Get(FALedEntry."FA No.");
                                DocDesc := FA.Description;
                            end else begin
                                BankLedEntry.Reset;
                                BankLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                                BankLedEntry.SetFilter("Entry No.", '<>%1', "Bank Account Ledger Entry"."Entry No.");
                                if BankLedEntry.Find('-') then begin
                                    BankMaster.Get(BankLedEntry."Bank Account No.");
                                    DocDesc := BankMaster.Name;
                                end else begin
                                    GLEntry.Reset;
                                    GLEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                                    GLEntry.SetFilter("Entry No.", '<>%1', "Bank Account Ledger Entry"."Entry No.");
                                    if GLEntry.Find('-') then begin
                                        recGLAccount.Get(GLEntry."G/L Account No.");
                                        DocDesc := recGLAccount.Name;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Entry".SetFilter("Posting Date", '<=%1', dtRecoDate);
                end;
            }
            dataitem("Bank Account Statement Line"; "Bank Account Statement Line")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Value Date") ORDER(Ascending) WHERE(Type = FILTER(Difference));
                column(Bank_Account_Statement_Line__Bank_Account_Statement_Line__Description; "Bank Account Statement Line".Description)
                {
                }
                column(Bank_Account_Statement_Line__Bank_Account_Statement_Line___Statement_Amount_; "Bank Account Statement Line"."Statement Amount")
                {
                }
                column(Bank_Account_Statement_Line__Bank_Account_Statement_Line___Value_Date_; "Bank Account Statement Line"."Value Date")
                {
                }
                column(Total_Difference_Amount_; 'Total Difference Amount')
                {
                }
                column(Bank_Account_Statement_Line__Bank_Account_Statement_Line___Statement_Amount__Control1000000027; "Bank Account Statement Line"."Statement Amount")
                {
                }
                column(DescriptionCaption_Control1000000012; DescriptionCaption_Control1000000012Lbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Details_of_Difference_TransactionsCaption; Details_of_Difference_TransactionsCaptionLbl)
                {
                }
                column(Value_DateCaption; Value_DateCaptionLbl)
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
                    "Bank Account Statement Line".SetFilter("Value Date", '<=%1', dtRecoDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if dtRecoDate = 0D then
                    Error('Please enter the Reconciliation Date.');

                decAmount := 0;
                /*
                BankAccStmtLine.RESET;
                BankAccStmtLine.SETCURRENTKEY("Bank Account No.", "Value Date");
                BankAccStmtLine.SETRANGE("Bank Account No.", "Bank Account"."No.");
                BankAccStmtLine.SETFILTER("Value Date", '..%1', dtRecoDate);
                IF BankAccStmtLine.FIND('-') THEN BEGIN
                   BankAccStmtLine.CALCSUMS("Statement Amount");
                   decAmount := BankAccStmtLine."Statement Amount";
                END;
                */
                recBankLedgerEntry.Reset;
                recBankLedgerEntry.SetCurrentKey("Bank Account No.", "Posting Date");
                recBankLedgerEntry.SetRange("Bank Account No.", "Bank Account"."No.");
                recBankLedgerEntry.SetFilter("Posting Date", '<=%1', dtRecoDate);
                if recBankLedgerEntry.Find('-') then begin
                    recBankLedgerEntry.CalcSums("Amount (LCY)");
                    decAmount := recBankLedgerEntry."Amount (LCY)";
                end;

            end;

            trigger OnPreDataItem()
            begin
                Compinfo.Get;
                Compinfo.CalcFields(Compinfo.Picture)
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

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        dtRecoDate: Date;
        Amt: Decimal;
        BankAccStmtLine: Record "Bank Account Statement Line";
        BankStmtEntryNo: Integer;
        sno: Integer;
        decAmount: Decimal;
        Excelbuf1: Record "Excel Buffer";
        Compinfo: Record "Company Information";
        PrintToExcel: Boolean;
        CustLedEntry: Record "Cust. Ledger Entry";
        VendLedEntry: Record "Vendor Ledger Entry";
        FALedEntry: Record "FA Ledger Entry";
        BankLedEntry: Record "Bank Account Ledger Entry";
        DocDesc: Text[80];
        BankMaster: Record "Bank Account";
        GLEntry: Record "G/L Entry";
        Vend: Record Vendor;
        Cust: Record Customer;
        FA: Record "Fixed Asset";
        recGLAccount: Record "G/L Account";
        blnPrintDetails: Boolean;
        recBankLedgerEntry: Record "Bank Account Ledger Entry";
        Bank_Account_Code_CaptionLbl: Label 'Bank Account Code:';
        Bank_Account_Name_CaptionLbl: Label 'Bank Account Name:';
        Bank_Account_No__CaptionLbl: Label 'Bank Account No.:';
        Bank_Reconciliation_on_CaptionLbl: Label 'Bank Reconciliation on:';
        Document_No_CaptionLbl: Label 'Document No.';
        DescriptionCaptionLbl: Label 'Description';
        Cheque_IssuedCaptionLbl: Label 'Cheque Issued';
        Uncleared_TransactionsCaptionLbl: Label 'Uncleared Transactions';
        Cheque_DepositedCaptionLbl: Label 'Cheque Deposited';
        Balance_as_per_bankCaptionLbl: Label 'Balance as per bank';
        Less__Uncleared_EntriesCaptionLbl: Label 'Less: Uncleared Entries';
        Balance_as_per_BooksCaptionLbl: Label 'Balance as per Books';
        Summary_of_the_ReconciliationCaptionLbl: Label 'Summary of the Reconciliation';
        Add__Difference_AmountCaptionLbl: Label 'Add: Difference Amount';
        TotalCaptionLbl: Label 'Total';
        DescriptionCaption_Control1000000012Lbl: Label 'Description';
        AmountCaptionLbl: Label 'Amount';
        Details_of_Difference_TransactionsCaptionLbl: Label 'Details of Difference Transactions';
        Value_DateCaptionLbl: Label 'Value Date';


    procedure MakeExcelInfo()
    begin
        /*
        Excelbuf1.SetUseInfoSheed;
        Excelbuf1.AddInfoColumn(COMPANYNAME,FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
        Excelbuf1.AddInfoColumn('Bank Reconcilation Report',FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
        Excelbuf1.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
        Excelbuf1.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
        Excelbuf1.ClearNewRow;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
    end;


    procedure CreateExcelbook()
    begin
        /*
        Excelbuf1.CreateBook;
        Excelbuf1.CreateSheet('Bank Reconcilation Report','',COMPANYNAME,USERID);
        Excelbuf1.GiveUserControl;
        ERROR('');
        */

    end;


    procedure MakeExcelDataBody1()
    begin
        /*
        Excelbuf1.NewRow;
          Excelbuf1.AddColumn('DOCUMENT NO.',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('BANK ACCOUNT NO.',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('DESCRIPTION',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('DEBIT AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('CREDIT AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('CHEQUE NO.',FALSE,'',TRUE,FALSE,FALSE,'');
          Excelbuf1.AddColumn('CHEQUE DATE',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataBody2()
    begin
        /*
        Excelbuf1.NewRow;
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Document No.",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Bank Account No.",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn(DocDesc,FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Cheque No.",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Cheque Date",FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataBody3()
    begin
        /*
        Excelbuf1.NewRow;
           Excelbuf1.AddColumn('Total',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Debit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry"."Credit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
           Excelbuf1.AddColumn('Balance as per Books',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn('Uncleared Entries',FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn('Balance as per Bank',FALSE,'',FALSE,FALSE,FALSE,'');
        Excelbuf1.NewRow;
           Excelbuf1.AddColumn(decAmount + "Bank Account Ledger Entry".Amount,FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn("Bank Account Ledger Entry".Amount,FALSE,'',FALSE,FALSE,FALSE,'');
           Excelbuf1.AddColumn(decAmount,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;
}

