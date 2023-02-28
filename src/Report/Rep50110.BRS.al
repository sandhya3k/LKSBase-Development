report 50110 BRS
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BRS.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Bank Account No.", "Posting Date");
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(BankName; BankName)
            {
            }
            column(BANK_RECONCILIATION_STATEMENT_; 'BANK RECONCILIATION STATEMENT')
            {
            }
            column(EndBal; EndBal)
            {
            }
            column(Stdate; Stdate)
            {
            }
            column(TODAY; Today)
            {
            }
            column(amt2; amt2)
            {
            }
            column(Bank_Account_Ledger_Entry__Cheque_No__; "Cheque No.")
            {
            }
            column(amt1; amt1)
            {
            }
            column(Bank_Account_Ledger_Entry__Cheque_Date_; "Cheque Date")
            {
            }
            column(Bank_Account_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(amt2_Control1000000007; amt2)
            {
            }
            column(amt1_Control1000000008; amt1)
            {
            }
            column(EndBal_amt2_amt1; EndBal - amt2 + amt1)
            {
            }
            column(CHEQUE_ISSUED_NOT_PRESENTED_IN_BANKCaption; CHEQUE_ISSUED_NOT_PRESENTED_IN_BANKCaptionLbl)
            {
            }
            column(BALANCE_AS_PER_BANK_STATEMENTCaption; BALANCE_AS_PER_BANK_STATEMENTCaptionLbl)
            {
            }
            column(CHEQUE_NO_Caption; CHEQUE_NO_CaptionLbl)
            {
            }
            column(CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANKCaption; CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANKCaptionLbl)
            {
            }
            column(CHEQUE_DATECaption; CHEQUE_DATECaptionLbl)
            {
            }
            column(Statement_DateCaption; Statement_DateCaptionLbl)
            {
            }
            column(CHEQUE_ISSUED_NOT_PRESENTED_IN_BANK_Total_amount_Caption; CHEQUE_ISSUED_NOT_PRESENTED_IN_BANK_Total_amount_CaptionLbl)
            {
            }
            column(CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANK_Total_Amount_Caption; CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANK_Total_Amount_CaptionLbl)
            {
            }
            column(BALANCE_AS_PER_BANK_BOOKCaption; BALANCE_AS_PER_BANK_BOOKCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if ("Bank Account Ledger Entry"."Statement No." = '') and ("Bank Account Ledger Entry"."Statement Status" =
                   "Bank Account Ledger Entry"."Statement Status"::Open) then begin
                    amt1 := "Bank Account Ledger Entry"."Debit Amount";
                    amt2 := "Bank Account Ledger Entry"."Credit Amount";
                end else

                    if ("Bank Account Ledger Entry"."Statement No." > st) and ("Bank Account Ledger Entry"."Statement Status" =
                        "Bank Account Ledger Entry"."Statement Status"::Closed) then begin
                        amt1 := "Bank Account Ledger Entry"."Debit Amount";
                        amt2 := "Bank Account Ledger Entry"."Credit Amount";
                    end;
                //ELSE
                //CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                "Bank Account Ledger Entry".SetRange("Bank Account Ledger Entry"."Posting Date", 0D, dat);
                "Bank Account Ledger Entry".SetRange("Bank Account Ledger Entry"."Bank Account No.", bank);

                CurrReport.CreateTotals(amt1);
                CurrReport.CreateTotals(amt2);
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
        CompInfo.Get;

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        amt1: Decimal;
        amt2: Decimal;
        CompInfo: Record "Company Information";
        BankAccount: Record "Bank Account";
        BankName: Text[30];
        BankSta: Record "Bank Account Statement";
        EndBal: Decimal;
        ch: Text[30];
        lab: Text[60];
        test: Boolean;
        st: Code[20];
        dat: Date;
        bank: Code[10];
        BankName2: Text[50];
        Stdate: Date;
        CHEQUE_ISSUED_NOT_PRESENTED_IN_BANKCaptionLbl: Label 'CHEQUE ISSUED NOT PRESENTED IN BANK';
        BALANCE_AS_PER_BANK_STATEMENTCaptionLbl: Label 'BALANCE AS PER BANK STATEMENT';
        CHEQUE_NO_CaptionLbl: Label 'CHEQUE NO.';
        CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANKCaptionLbl: Label 'CHEQUE DEPOSITED NOT CLEARED IN BANK';
        CHEQUE_DATECaptionLbl: Label 'CHEQUE DATE';
        Statement_DateCaptionLbl: Label 'Statement Date';
        CHEQUE_ISSUED_NOT_PRESENTED_IN_BANK_Total_amount_CaptionLbl: Label 'CHEQUE ISSUED NOT PRESENTED IN BANK(Total amount)';
        CHEQUE_DEPOSITED_NOT_CLEARED_IN_BANK_Total_Amount_CaptionLbl: Label 'CHEQUE DEPOSITED NOT CLEARED IN BANK(Total Amount)';
        BALANCE_AS_PER_BANK_BOOKCaptionLbl: Label 'BALANCE AS PER BANK BOOK';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(CompInfo.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
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
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('BRS Report','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure BLEH1()
    begin
        /*
        ExcelBuf.AddColumn('Company Name',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CompInfo.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Bank Name',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(BankName,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Report Type',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('BANK RECONCILIATION STATEMENT',FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('BALANCE AS PER BANK STATEMENT',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(EndBal,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('CHEQUE NO.',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('CHEQUE DATE',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('CHEQUE ISSUED NOT PRESENTED IN BANK',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('CHEQUE DEPOSITED NOT CLEARED IN BANK',FALSE,'',TRUE,FALSE,TRUE,'');
         */

    end;


    procedure BLEB2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Bank Account Ledger Entry"."Cheque No.",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("Bank Account Ledger Entry"."Cheque Date",FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(amt2,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(amt1,FALSE,'',FALSE,FALSE,TRUE,'');
        */

    end;


    procedure BLEF3()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('CHEQUE ISSUED NOT PRESENTED IN BANK(Total amount)',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(amt2,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('CHEQUE DEPOSITED NOT CLEARED IN BANK(Total Amount)',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(amt1,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('BALANCE AS PER BANK BOOK',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(EndBal-(amt2+amt1),FALSE,'',FALSE,FALSE,TRUE,'');
        */

    end;
}

