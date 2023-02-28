report 50028 "GL Colection"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'GL Colection';
    DefaultLayout = RDLC;
    RDLCLayout = './res/GLColection.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("G/L Account No." = FILTER('21-04-196000' .. '21-04-197000' | '31-01-040000' .. '31-01-045000'), Reversed = FILTER(false), "Source Code" = FILTER(<> 'BANKPYMTV'), "Document No." = FILTER(<> '@BR*'), Amount = FILTER(> 0));
            RequestFilterFields = "Posting Date";
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
            column(Client_Name; Client_Name)
            {
            }
            column(G_L_Entry__G_L_Entry___Document_No__; "G/L Entry"."Document No.")
            {
            }
            column(Acc_Name; Acc_Name)
            {
            }
            column(G_L_Entry__G_L_Entry___Cheque_No__; "G/L Entry"."Cheque No.")
            {
            }
            column(G_L_Entry__G_L_Entry___Cheque_Date_; "G/L Entry"."Cheque Date")
            {
            }
            //TBD column(G_L_Entry__G_L_Entry___Location_Code_; "G/L Entry"."Location Code")
            column(G_L_Entry__G_L_Entry___Location_Code_; '')
            {
            }
            column(G_L_Entry__Document_Date_; "Document Date")
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date_; "G/L Entry"."Posting Date")
            {
            }
            column(Curr; Curr)
            {
            }
            column(G_L_Entry__G_L_Entry__Amount; "G/L Entry".Amount)
            {
            }
            column(G_L_Entry__G_L_Entry___Document_Type_; "G/L Entry"."Document Type")
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
            column(G_L_Entry__G_L_Entry__Amount_Control1000000058; "G/L Entry".Amount)
            {
            }
            column(ABS_TDS__Control1000000059; Abs(TDS))
            {
            }
            column(ABS_Gross_; Abs(Gross))
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
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Account_NameCaption; Account_NameCaptionLbl)
            {
            }
            column(Cheque_NoCaption; Cheque_NoCaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Creation_DateCaption; Creation_DateCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
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
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Client_Name := '';
                Cust_Ledg_Entry.Reset;
                Cust_Ledg_Entry.SetFilter(Cust_Ledg_Entry."Document No.", "Document No.");
                if Cust_Ledg_Entry.Find('-') then begin
                    Cust.SetFilter(Cust."No.", Cust_Ledg_Entry."Customer No.");
                    if Cust.FindSet then begin
                        Client_Name := Cust.Name
                    end else
                        Client_Name := '';
                end;

                GL_Acc.Reset;
                GL_Acc.SetFilter(GL_Acc."No.", "G/L Entry"."G/L Account No.");
                if GL_Acc.Find('-') then
                    Acc_Name := GL_Acc.Name;

                TDS := 0;
                GLEntry.Reset;
                GLEntry.SetFilter(GLEntry."Document No.", "Document No.");
                GLEntry.SetRange(GLEntry."G/L Account No.", '21-03-180200');
                if GLEntry.FindLast then
                    TDS := GLEntry."Debit Amount";

                Gross := "G/L Entry".Amount + TDS;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("G/L Entry".Amount, TDS, Gross);
                Min := "G/L Entry".GetRangeMin("G/L Entry"."Posting Date");
                Max := "G/L Entry".GetRangeMax("G/L Entry"."Posting Date");
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Client_Name: Text[60];
        Cust: Record Customer;
        Cust_Ledg_Entry: Record "Cust. Ledger Entry";
        Voucher_Type: Text[50];
        Bank: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        "Min": Date;
        "Max": Date;
        CurRate: Decimal;
        CurrExchangerate: Record "Currency Exchange Rate";
        ExcelBuf: Record "Excel Buffer" temporary;
        Compinfo: Record "Company Information";
        PrintToExcel: Boolean;
        TDS: Decimal;
        Gross: Decimal;
        Curr: Code[10];
        Acc_Name: Code[100];
        GL_Acc: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        ToCaptionLbl: Label 'To';
        For_The_Period_OfCaptionLbl: Label 'For The Period Of';
        Daily_Collection_reportCaptionLbl: Label 'Daily Collection report';
        Client_NameCaptionLbl: Label 'Client Name';
        Document_No_CaptionLbl: Label 'Document No.';
        Account_NameCaptionLbl: Label 'Account Name';
        Cheque_NoCaptionLbl: Label 'Cheque No';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        LocationCaptionLbl: Label 'Location';
        Creation_DateCaptionLbl: Label 'Creation Date';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Net_Amount__INR_CaptionLbl: Label 'Net Amount (INR)';
        Curr__RateCaptionLbl: Label 'Curr. Rate';
        Curr__CodeCaptionLbl: Label 'Curr. Code';
        Document_TypeCaptionLbl: Label 'Document Type';
        TDS_AMOUNT_INR_CaptionLbl: Label 'TDS AMOUNT(INR)';
        Gross_Amount__INR_CaptionLbl: Label 'Gross Amount (INR)';


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
        ExcelBuf.AddColumn('Account Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Curr.Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Net Amount(Cheque Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Net Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('TDS Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure BALB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Client_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Document Type",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Document No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Location Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Document Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Acc_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Cheque No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Cheque Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDS,FALSE,'',TRUE,FALSE,FALSE,'');
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
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDS,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure BALF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total Amount',FALSE,'',TRUE,FALSE,FALSE,'');
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
        ExcelBuf.AddColumn("G/L Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(TDS,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

