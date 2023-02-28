report 50071 "Collection Detailed Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Collection Detailed Report';
    DefaultLayout = RDLC;
    RDLCLayout = './res/CollectionDetailedReport.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            //3K DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("G/L Account No." = FILTER('31-01-040001' | '31-01-040002' | '21-04-196100' | '21-04-196101'), Reversed = FILTER(false), "Source Code" = FILTER(<> 'UNAPPSALES' | <> 'REVERSED'), Amount = FILTER(< 0), "Document No." = FILTER('BR@*' | 'JVPI@*'));
            DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("G/L Account No." = FILTER('31-01-040001' | '31-01-040002' | '21-04-196100' | '21-04-196101'), Reversed = FILTER(false), "Source Code" = FILTER(<> 'UNAPPSALES' | <> 'REVERSED'), Amount = FILTER(< 0), "Document No." = FILTER('BR*' | 'JVPI*'));
            RequestFilterFields = "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date";
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Client_Name; Client_Name)
            {
            }
            column(G_L_Entry__Document_No__; "Document No.")
            {
            }
            column(G_L_Entry__Document_Date_; "Document Date")
            {
            }
            column(G_L_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(IncomeHead; IncomeHead)
            {
            }
            column(BranchCode; BranchCode)
            {
            }
            //TBD column(G_L_Entry__Location_Code_; "Location Code")
            column(G_L_Entry__Location_Code_; '')
            {
            }
            column(Caseid; Caseid)
            {
            }
            column(Docno; Docno)
            {
            }
            column(Memo_Date; Memo_Date)
            {
            }
            column(Applied_Date; Applied_Date)
            {
            }
            column(CHECK_No__; "CHECK_No.")
            {
            }
            column(G_L_Entry__Cheque_Date_; "Cheque Date")
            {
            }
            column(Curr; Curr)
            {
            }
            column(Curr_Rate; Curr_Rate)
            {
            }
            column(Gross_Amt_FC; Gross_Amt_FC)
            {
            }
            column(G_L_Entry__G_L_Entry__Amount; "G/L Entry".Amount)
            {
            }
            column(G_L_Entry__G_L_Entry__Amount_Control1000000038; "G/L Entry".Amount)
            {
            }
            column(Gross_Amt_FC_Control1000000041; Gross_Amt_FC)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(G_L_Entry__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(G_L_Entry__Document_Date_Caption; FieldCaption("Document Date"))
            {
            }
            column(G_L_Entry__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Income_HeadCaption; Income_HeadCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(G_L_Entry__Location_Code_Caption; 'Location code')
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Memo_NoCaption; Memo_NoCaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Applied_DateCaption; Applied_DateCaptionLbl)
            {
            }
            column(Check_No_Caption; Check_No_CaptionLbl)
            {
            }
            column(G_L_Entry__Cheque_Date_Caption; FieldCaption("Cheque Date"))
            {
            }
            column(Curr_Caption; Curr_CaptionLbl)
            {
            }
            column(Curr__RateCaption; Curr__RateCaptionLbl)
            {
            }
            column(Gross_AmountCaption; Gross_AmountCaptionLbl)
            {
            }
            column(Gross_Local_currency_i_e_INR_Caption; Gross_Local_currency_i_e_INR_CaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            column(G_L_Entry_G_L_Account_No_; "G/L Account No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                EntNo := 0;
                Docno := '';
                Gross_Amt_FC := 0;
                Caseid := '';
                Applied_Date := 0D;

                Client_Name := '';
                GL_Entry.Reset;
                GL_Entry.SetFilter(GL_Entry."G/L Account No.", "G/L Account No.");
                GL_Entry.SetRange(GL_Entry."Entry No.", "Entry No.");
                if GL_Entry.Find('-') then
                    Client_Name := GL_Entry.Description;

                BranchCode := '';
                Dim.Reset;
                Dim.SetFilter(Dim.Code, 'BRANCH');
                Dim.SetRange(Dim.Code, Cust_Ledger_Entry."Global Dimension 1 Code");
                if Dim.FindFirst then
                    BranchCode := Dim.Name
                else
                    Dim.SetFilter(Dim.Code, 'BRANCH');
                Dim.SetRange(Dim.Code, "G/L Entry"."Global Dimension 1 Code");
                if Dim.FindFirst then
                    BranchCode := Dim.Name;

                Curr_Rate := 0;
                Bank_Ledger_Entry2.Reset;
                Bank_Ledger_Entry2.SetRange(Bank_Ledger_Entry2."Document No.", "Document No.");
                if Bank_Ledger_Entry2.Find('-') then
                    Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Currency Code", Bank_Ledger_Entry2."Currency Code");
                Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Starting Date", Bank_Ledger_Entry."Posting Date");
                if Curr_Exch_Rate.Find('+') then
                    Curr_Rate := Curr_Exch_Rate."Relational Exch. Rate Amount";

                IncomeHead := '';
                GL_Account.Reset;
                GL_Account.SetFilter(GL_Account."No.", "G/L Account No.");
                if GL_Account.Find('-') then
                    IncomeHead := GL_Account.Name;

                "CHECK_No." := '';
                CHECK_Date := 0D;
                /*
                Bank_Ledger_Entry.RESET;
                Bank_Ledger_Entry.SETRANGE(Bank_Ledger_Entry."Document No.","Document No.");
                IF Bank_Ledger_Entry.FINDFIRST THEN
                   "CHECK_No.":= Bank_Ledger_Entry."Cheque No.";
                    CHECK_Date :=Bank_Ledger_Entry."Cheque Date";
                */
                "CHECK_No." := "G/L Entry"."Cheque No.";
                CHECK_Date := "G/L Entry"."Cheque Date";

                //EntNo:=0;
                CustLedEntry.Reset;
                CustLedEntry.SetRange(CustLedEntry."Document No.", "G/L Entry"."Document No.");
                if CustLedEntry.Find('-') then
                    EntNo := CustLedEntry."Closed by Entry No."
                else
                    EntNo := CustLedEntry."Entry No.";

                CustLedEntry.Reset;
                CustLedEntry.SetRange(CustLedEntry."Closed by Entry No.", "Entry No.");
                if CustLedEntry.Find('-') then
                    Curr := CustLedEntry."Currency Code"
                else
                    Curr := 'INR';

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("G/L Entry".Amount, Gross_Amt_FC, Gross_Amt_INR);

                "G/L Entry".SetFilter("G/L Entry"."Document No.", '<>%1', 'BC*');
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
        /*
        IF PrintToExcel THEN
          CreateExcelbook;
        */

    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        /*
        IF PrintToExcel THEN
          MakeExcelInfo;
         */

    end;

    var
        Client_Name: Text[100];
        Bank: Record "Bank Account";
        Memo_Date: Date;
        Applied_Date: Date;
        Curr: Code[10];
        Curr_Rate: Decimal;
        Gross_Amt_FC: Decimal;
        Gross_Amt_INR: Decimal;
        Narration: Text[250];
        Status: Boolean;
        Bank_Ledger_Entry: Record "Bank Account Ledger Entry";
        "CHECK_No.": Code[40];
        CHECK_Date: Date;
        Bank_Ledger_Entry1: Record "Bank Account Ledger Entry";
        Cust_Ledger_Entry: Record "Cust. Ledger Entry";
        Compinfo: Record "Company Information";
        IncomeHead: Text[100];
        GL_Account: Record "G/L Account";
        Cust: Record Customer;
        Applied_Inv: Code[30];
        Caseid: Code[20];
        BranchCode: Code[20];
        Dim: Record "Dimension Value";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        DtCustLedEntry: Record "Detailed Cust. Ledg. Entry";
        CustLedEntry: Record "Cust. Ledger Entry";
        EntNo: Integer;
        Docno: Code[30];
        CustLedEntry2: Record "Cust. Ledger Entry";
        Bank_Ledger_Entry2: Record "Bank Account Ledger Entry";
        Curr_Exch_Rate: Record "Currency Exchange Rate";
        GL_Entry: Record "G/L Entry";
        CustLedEntry3: Record "Cust. Ledger Entry";
        CompanyInfo: Record "Company Information";
        CustLedEntry4: Record "Cust. Ledger Entry";
        Client_NameCaptionLbl: Label 'Client Name';
        Income_HeadCaptionLbl: Label 'Income Head';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Memo_NoCaptionLbl: Label 'Memo No';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Applied_DateCaptionLbl: Label 'Applied Date';
        Check_No_CaptionLbl: Label 'Check No.';
        Curr_CaptionLbl: Label 'Curr.';
        Curr__RateCaptionLbl: Label 'Curr. Rate';
        Gross_AmountCaptionLbl: Label 'Gross Amount';
        Gross_Local_currency_i_e_INR_CaptionLbl: Label 'Gross(Local currency i.e INR)';


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
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Report',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
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
        ExcelBuf.CreateSheet('Customer Detalied Aging','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure GLH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document Date.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Posting Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Invome Head',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Case ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Location Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Applied Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Currency Rate',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount(Local Currency i.e. INR',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure GLB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Client_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Document No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Document Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(IncomeHead,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Caseid,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BranchCode,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry"."Location Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Docno,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Memo_Date,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Applied_Date,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("CHECK_No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(CHECK_Date,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr_Rate,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross_Amt_FC,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure GLF()
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
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross_Amt_FC,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("G/L Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

