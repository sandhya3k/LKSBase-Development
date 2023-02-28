report 50066 "Daily Collection"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Daily Collection"';
    DefaultLayout = RDLC;
    RDLCLayout = './res/DailyCollection.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date") ORDER(Ascending) WHERE("Document No." = FILTER('BR*' | 'BC*'), Reversed = FILTER(false));
            //TBD //RequestFilterFields = "Bank Account No.", "Posting Date", "Location Code", "Document Date";
            RequestFilterFields = "Bank Account No.", "Posting Date", "Document Date";
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
            column("Min"; Min)
            {
            }
            column("Max"; Max)
            {
            }
            column(Bank_Account_Ledger_Entry__Bank_Account_Ledger_Entry___Document_No__; "Bank Account Ledger Entry"."Document No.")
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
            column(Client_Name; Client_Name)
            {
            }
            //TBD column(Bank_Account_Ledger_Entry__Location_Code_; "Location Code")
            column(Bank_Account_Ledger_Entry__Location_Code_; '')
            {
            }
            column(Bank_Account_Ledger_Entry__Document_Date_; "Document Date")
            {
            }
            column(Bank_Account_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Curr; Curr)
            {
            }
            column(Bank_Account_Ledger_Entry_Amount; Amount)
            {
            }
            column(Amount__LCY___; ("Amount (LCY)"))
            {
            }
            column(Voucher_Type; Voucher_Type)
            {
            }
            column(CurRate; CurRate)
            {
            }
            column(ABS_TDS_; Abs(TDS))
            {
            }
            column(Gross; Gross)
            {
            }
            column(DBankCharges; DBankCharges)
            {
            }
            column(TDSRE; TDSRE)
            {
            }
            column(ABS__Bank_Account_Ledger_Entry___Amount__LCY___; Abs("Bank Account Ledger Entry"."Amount (LCY)"))
            {
            }
            column(ABS_TDS__Control1000000045; Abs(TDS))
            {
            }
            column(Gross_Control1000000047; Gross)
            {
            }
            column(DBankCharges_Control1000000051; DBankCharges)
            {
            }
            column(TDSRE_Control1000000055; TDSRE)
            {
            }
            column(ABS__Bank_Account_Ledger_Entry___Amount__LCY____Control1000000018; Abs("Bank Account Ledger Entry"."Amount (LCY)"))
            {
            }
            column(ABS_TDS__Control1000000046; Abs(TDS))
            {
            }
            column(ABS_Gross_; Abs(Gross))
            {
            }
            column(ABS_DBankCharges_; Abs(DBankCharges))
            {
            }
            column(TDSRE_Control1000000056; TDSRE)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(For_The_Period_OfCaption; For_The_Period_OfCaptionLbl)
            {
            }
            column(Daily_Collection_reportCaption; Daily_Collection_reportCaptionLbl)
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
            column(Bank_Account_Ledger_Entry__Location_Code_Caption; 'Location Code')
            {
            }
            column(Creation_DateCaption; Creation_DateCaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Amount__Check_Curr__Caption; Amount__Check_Curr__CaptionLbl)
            {
            }
            column(Net_Amount__INR_Caption; Net_Amount__INR_CaptionLbl)
            {
            }
            column(Curr__RateCaption; Curr__RateCaptionLbl)
            {
            }
            column(Curr__CodeCaption; Curr__CodeCaptionLbl)
            {
            }
            column(Document_TypeCaption; Document_TypeCaptionLbl)
            {
            }
            column(TDS_AMOUNT_INR_Caption; TDS_AMOUNT_INR_CaptionLbl)
            {
            }
            column(Gross_Amount__INR_Caption; Gross_Amount__INR_CaptionLbl)
            {
            }
            column(Bank_Charges__INR_Caption; Bank_Charges__INR_CaptionLbl)
            {
            }
            column(TDS_RECaption; TDS_RECaptionLbl)
            {
            }
            column(Bank_Account_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Voucher_Type := '';
                Bank_Name := '';
                Client_Name := '';

                Bank.Reset;
                Bank.SetFilter(Bank."No.", "Bank Account Ledger Entry"."Bank Account No.");
                if Bank.Find('-') then
                    Bank_Name := Bank.Name;

                "G/L_Entry".Reset;
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetFilter("G/L_Entry"."Source Code", 'BANKRCPTV');
                if "G/L_Entry".Find('-') then
                    Voucher_Type := "G/L_Entry"."Source Code";


                Client_Name := Description;
                Cust_Ledg_Entry.Reset;
                Cust_Ledg_Entry.SetFilter(Cust_Ledg_Entry."Document No.", "Document No.");
                if Cust_Ledg_Entry.FindFirst then begin
                    Cust.Reset;
                    Cust.SetFilter(Cust."No.", Cust_Ledg_Entry."Customer No.");
                    if Cust.FindFirst then begin
                        Client_Name := Cust.Name
                    end else
                        Client_Name := "Bank Account Ledger Entry".Description;
                end;

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
                /*
                Voucher_Type :='';
                Bank_Acc_Leg_Entry.RESET;
                Bank_Acc_Leg_Entry.SETFILTER(Bank_Acc_Leg_Entry."Document No.","Document No.");
                IF Bank_Acc_Leg_Entry.FINDFIRST THEN
                   IF Bank_Acc_Leg_Entry.Reversed = TRUE THEN
                      Voucher_Type := 'REVERSED'
                   ELSE
                      Voucher_Type := 'RECEIPT';
                Bank_Acc_Leg_Entry.RESET;
                Bank_Acc_Leg_Entry.SETFILTER(Bank_Acc_Leg_Entry."Document No.","Document No.");
                IF Bank_Acc_Leg_Entry.FINDFIRST THEN
                   IF Bank_Acc_Leg_Entry."Journal Batch Name"= 'BOUNCE' THEN
                      Voucher_Type := 'BOUNCED';
                */

                Curr := '';
                Bank_Acc_Leg_Entry.SetFilter(Bank_Acc_Leg_Entry."Document No.", "Document No.");
                if Bank_Acc_Leg_Entry.FindFirst then
                    if Bank_Acc_Leg_Entry."Currency Code" = '' then
                        Curr := 'INR'
                    else
                        Curr := Bank_Acc_Leg_Entry."Currency Code";

                CurRate := 0;
                CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                CurrExchangerate.SetRange(CurrExchangerate."Starting Date", "Posting Date");
                if CurrExchangerate.Find('+') then begin
                    CurRate := CurrExchangerate."Relational Exch. Rate Amount";
                end;

                TDS := 0;
                "G/L_Entry".Reset;
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetRange("G/L_Entry"."Posting Date", "Bank Account Ledger Entry"."Posting Date");
                "G/L_Entry".SetRange("G/L_Entry".Reversed, false);
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetFilter("G/L_Entry"."G/L Account No.", '%1|%2', '21-03-180200', '21-03-180201');
                if "G/L_Entry".FindLast then
                    TDS := "G/L_Entry"."Debit Amount";

                TDSRE := 0;
                "G/L_Entry".Reset;
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetRange("G/L_Entry"."Posting Date", "Bank Account Ledger Entry"."Posting Date");
                "G/L_Entry".SetRange("G/L_Entry".Reversed, false);
                "G/L_Entry".SetFilter("G/L_Entry"."Cheque No.", "Bank Account Ledger Entry"."Cheque No.");
                "G/L_Entry".SetFilter("G/L_Entry"."G/L Account No.", '%1|%2', '21-03-180200', '21-03-180201');
                if "G/L_Entry".FindLast then
                    TDSRE := -"G/L_Entry"."Credit Amount";


                DBankCharges := 0;
                "G/L_Entry".Reset;
                "G/L_Entry".SetRange("G/L_Entry"."Posting Date", "Bank Account Ledger Entry"."Posting Date");
                "G/L_Entry".SetRange("G/L_Entry".Reversed, false);
                "G/L_Entry".SetFilter("G/L_Entry"."Document No.", "Bank Account Ledger Entry"."Document No.");
                "G/L_Entry".SetRange("G/L_Entry"."G/L Account No.", '41-08-789100');
                if "G/L_Entry".FindLast then
                    DBankCharges := "G/L_Entry"."Debit Amount";

                DBankCharges := 0;
                "G/L_Entry".Reset;
                "G/L_Entry".SetRange("G/L_Entry"."Posting Date", "Bank Account Ledger Entry"."Posting Date");
                "G/L_Entry".SetRange("G/L_Entry".Reversed, false);
                "G/L_Entry".SetFilter("G/L_Entry"."Cheque No.", "Bank Account Ledger Entry"."Cheque No.");
                "G/L_Entry".SetRange("G/L_Entry"."G/L Account No.", '41-08-789100');
                if "G/L_Entry".FindLast then
                    DBankCharges := "G/L_Entry"."Debit Amount";


                Gross := "Bank Account Ledger Entry"."Amount (LCY)" + TDS + DBankCharges + TDSRE;

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Bank Account Ledger Entry"."Amount (LCY)", "Bank Account Ledger Entry".Amount, TDS, DBankCharges, Gross, TDSRE);

                Min := "Bank Account Ledger Entry".GetRangeMin("Bank Account Ledger Entry"."Posting Date");
                Max := "Bank Account Ledger Entry".GetRangeMax("Bank Account Ledger Entry"."Posting Date");
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
        //IF PrintToExcel THEN
        //  CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        //IF PrintToExcel THEN
        //  MakeExcelInfo;
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
        Bank_Acc_Leg_Entry: Record "Bank Account Ledger Entry";
        "Min": Date;
        "Max": Date;
        CurRate: Decimal;
        CurrExchangerate: Record "Currency Exchange Rate";
        ExcelBuf: Record "Excel Buffer" temporary;
        Compinfo: Record "Company Information";
        TDS: Decimal;
        Gross: Decimal;
        Curr: Code[10];
        DBankCharges: Decimal;
        TDSRE: Decimal;
        ToCaptionLbl: Label 'To';
        For_The_Period_OfCaptionLbl: Label 'For The Period Of';
        Daily_Collection_reportCaptionLbl: Label 'Daily Collection report';
        Document_No_CaptionLbl: Label 'Document No.';
        Client_NameCaptionLbl: Label 'Client Name';
        Bank_DepositedCaptionLbl: Label 'Bank Deposited';
        Cheque_NoCaptionLbl: Label 'Cheque No';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Creation_DateCaptionLbl: Label 'Creation Date';
        Amount__Check_Curr__CaptionLbl: Label 'Amount (Check Curr.)';
        Net_Amount__INR_CaptionLbl: Label 'Net Amount (INR)';
        Curr__RateCaptionLbl: Label 'Curr. Rate';
        Curr__CodeCaptionLbl: Label 'Curr. Code';
        Document_TypeCaptionLbl: Label 'Document Type';
        TDS_AMOUNT_INR_CaptionLbl: Label 'TDS AMOUNT(INR)';
        Gross_Amount__INR_CaptionLbl: Label 'Gross Amount (INR)';
        Bank_Charges__INR_CaptionLbl: Label 'Bank Charges (INR)';
        TDS_RECaptionLbl: Label 'TDS RE';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(Compinfo.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Report',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('Daily Collection',FALSE,'',FALSE,FALSE,FALSE,'');
        //ExcelBuf.NewRow;
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
        ExcelBuf.CreateSheet('Daily collection','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure BALH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document Type',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document No',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Location Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Creation Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Posting Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Bank Deposited',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Curr.Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Net Amount(Cheque Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Net Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('TDS Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('TDS Amount(Refund)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Bank Charges(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure BALB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Client_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Voucher_Type,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Document No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Location Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Document Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Cheque No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Cheque Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry.Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Amount (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDS,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDSRE,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(DBankCharges,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure BALGF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry.Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Bank Account Ledger Entry"."Amount (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDS,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDSRE,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(DBankCharges,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure BALF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry.Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bank_Acc_Leg_Entry."Amount (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

