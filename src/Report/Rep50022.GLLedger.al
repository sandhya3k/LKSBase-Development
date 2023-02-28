report 50022 "G/L Ledger"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/GLLedger.rdlc';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = WHERE("Account Type" = CONST(Posting));
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(Filters______txtFilters; 'Filters: ' + txtFilters)
            {
            }
            column(G_L_Account__G_L_Account__Name; "G/L Account".Name)
            {
            }
            column(G_L_Account__G_L_Account___No__; "G/L Account"."No.")
            {
            }
            column(txtOpnHeading; txtOpnHeading)
            {
            }
            column(decDrOpn; decDrOpn)
            {
            }
            column(decCrOpn; decCrOpn)
            {
            }
            column(decOpening; decOpening)
            {
            }
            column(Document_TypeCaption; Document_TypeCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(External_Document_No_Caption; External_Document_No_CaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(Running_BalanceCaption; Running_BalanceCaptionLbl)
            {
            }
            column(S__NO_Caption; S__NO_CaptionLbl)
            {
            }
            column(G_L_Account_Date_Filter; "Date Filter")
            {
            }
            column(G_L_Account_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(G_L_Account_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("Source Code" = FILTER(<> 'PURCHAPPL' & <> 'SALESAPPL'), "G/L Account No." = FILTER(<> '99-99-999999'));
                column(Sno; Sno)
                {
                }
                column(G_L_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(G_L_Entry__Document_Type_; "Document Type")
                {
                }
                column(G_L_Entry__Document_No__; "Document No.")
                {
                }
                column(G_L_Entry__External_Document_No__; "External Document No.")
                {
                }
                column(G_L_Entry__G_L_Entry___Debit_Amount_; "G/L Entry"."Debit Amount")
                {
                }
                column(G_L_Entry__G_L_Entry___Credit_Amount_; "G/L Entry"."Credit Amount")
                {
                }
                column(Desc2; Desc2)
                {
                }
                column(Amt; Amt)
                {
                }
                column(Narration; Narration)
                {
                }
                column(G_L_Entry__G_L_Entry___Debit_Amount__Control1000000028; "G/L Entry"."Debit Amount")
                {
                }
                column(G_L_Entry__G_L_Entry___Credit_Amount__Control1000000029; "G/L Entry"."Credit Amount")
                {
                }
                column(Amt_Control1000000030; Amt)
                {
                }
                column(G_L_Entry_Entry_No_; "Entry No.")
                {
                }
                column(G_L_Entry_G_L_Account_No_; "G/L Account No.")
                {
                }
                column(G_L_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(G_L_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                dataitem("Posted Narration"; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.") ORDER(Ascending);
                }

                trigger OnAfterGetRecord()
                begin
                    Desc2 := "G/L Entry".Description;

                    Narration := '';
                    PostedNarration.Reset;
                    PostedNarration.SetRange(PostedNarration."Transaction No.", "Transaction No.");
                    PostedNarration.SetRange(PostedNarration."Entry No.", "Entry No.");
                    if PostedNarration.Find('-') then
                        repeat
                            Narration := Narration + PostedNarration.Narration
                        until
                        PostedNarration.Next = 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                decOpening := 0;
                decDrOpn := 0;
                decCrOpn := 0;
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
                if dtMinDate <> 0D then
                    CalculateOpening;
                if decOpening < 0 then
                    decCrOpn := -decOpening
                else
                    decDrOpn := decOpening;

                if dtMinDate <> 0D then
                    txtOpnHeading := 'Opening Balance as on ' + Format(dtMinDate - 1)
                else
                    txtOpnHeading := 'Opening Balance';
            end;

            trigger OnPreDataItem()
            begin

                txtFilters := "G/L Account".GetFilters;
                txtTemp := "G/L Account".GetFilter("Date Filter");
                if txtTemp <> '' then begin
                    if CopyStr(txtTemp, 1, 2) <> '..' then
                        dtMinDate := "G/L Account".GetRangeMin("Date Filter");
                end;
                cdGlobal1 := "G/L Account".GetFilter("Global Dimension 1 Filter");
                cdGlobal2 := "G/L Account".GetFilter("Global Dimension 2 Filter");
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
        /*
        IF PrintToExcel THEN
         MakeExcelInfo;
        */

    end;

    var
        CompInfo: Record "Company Information";
        txtFilters: Text[250];
        dtMinDate: Date;
        txtTemp: Text[50];
        txtOpnHeading: Text[50];
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer";
        decOpening: Decimal;
        decDrOpn: Decimal;
        decCrOpn: Decimal;
        Desc2: Text[100];
        Amt: Decimal;
        Sno: Integer;
        cdGlobal1: Code[20];
        cdGlobal2: Code[20];
        SourceCode: Record "Source Code";
        PrintNarration: Boolean;
        Narration: Text[1024];
        PostedNarration: Record "Posted Narration";
        Document_TypeCaptionLbl: Label 'Document Type';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Document_No_CaptionLbl: Label 'Document No.';
        DescriptionCaptionLbl: Label 'Description';
        External_Document_No_CaptionLbl: Label 'External Document No.';
        Debit_AmountCaptionLbl: Label 'Debit Amount';
        Credit_AmountCaptionLbl: Label 'Credit Amount';
        Running_BalanceCaptionLbl: Label 'Running Balance';
        S__NO_CaptionLbl: Label 'S. NO.';


    procedure CalculateOpening()
    var
        recDetailedLedgerEntry: Record "G/L Entry";
    begin
        recDetailedLedgerEntry.Reset;
        recDetailedLedgerEntry.SetCurrentKey("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code",
                                     "Posting Date"); //TBD //, "Location Code");
        recDetailedLedgerEntry.SetRange("G/L Account No.", "G/L Account"."No.");
        recDetailedLedgerEntry.SetFilter("Posting Date", '..%1', dtMinDate - 1);
        if cdGlobal1 <> '' then
            recDetailedLedgerEntry.SetRange("Global Dimension 1 Code", cdGlobal1);
        if cdGlobal2 <> '' then
            recDetailedLedgerEntry.SetRange("Global Dimension 2 Code", cdGlobal2);
        if recDetailedLedgerEntry.Find('-') then begin
            recDetailedLedgerEntry.CalcSums(Amount);
            decOpening := recDetailedLedgerEntry.Amount;
        end else
            decOpening := 0;
    end;


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('COMPANY NAME',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(COMPANYNAME,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('USER ID',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('DATE',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.ClearNewRow;
        */

    end;


    procedure MakeExcelDataHeader()
    begin
    end;


    procedure MakeExcelDataBody()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('ACCOUNT LEDGER REPORT','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure CreateExcelbook()
    begin
    end;


    procedure MakeExcelDataBody1()
    begin
        /*
        ExcelBuf.NewRow;
          ExcelBuf.AddColumn('SRNO.',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('POSTING DATE',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('DOCUMENT TYPE',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('DOCUMENT NO.',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('DESCRIPTION',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('EXTERNAL DOCUMENT NO.',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('DEBIT AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('CREDIT AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('RUNNING BALANCE',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure MakeExcelDataBody2()
    begin
        /*
        ExcelBuf.NewRow;
           ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Account"."No.",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Account".Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
           ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(txtOpnHeading,FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(decDrOpn,FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(decCrOpn,FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(decOpening,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataBody3()
    begin

        /*
        ExcelBuf.NewRow;
           ExcelBuf.AddColumn(Sno,FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."Posting Date",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."Document Type",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."Document No.",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(Desc2,FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."External Document No.",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."Debit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn("G/L Entry"."Credit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
           ExcelBuf.AddColumn(Amt,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataBody4()
    begin
        /*
        ExcelBuf.NewRow;
           ExcelBuf.AddColumn(Narration,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataFooter1()
    begin
        /*
       ExcelBuf.NewRow;
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn("G/L Entry"."Debit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn("G/L Entry"."Credit Amount",FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
          ExcelBuf.AddColumn(Amt,FALSE,'',FALSE,FALSE,FALSE,'');
       */

    end;
}

