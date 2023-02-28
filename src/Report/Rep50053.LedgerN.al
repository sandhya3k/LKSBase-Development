report 50053 "Ledger-N"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/LedgerN.rdlc';
    Caption = 'Ledger';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Account Type" = FILTER(Posting));
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(Name_________Ledger_; Name + '  ' + 'Ledger')
            {
            }
            column(GETFILTERS; GetFilters)
            {
            }
            column(LocationFilter; LocationFilter)
            {
            }
            column(BranchName______SubBranch; BranchName + '  ' + SubBranch)
            {
            }
            column(Name_________Ledger__Control1500003; Name + '  ' + 'Ledger')
            {
            }
            column(CompInfo_Name_Control1500019; CompInfo.Name)
            {
            }
            column(GETFILTERS_Control1500065; GetFilters)
            {
            }
            column(LocationFilter_Control1500066; LocationFilter)
            {
            }
            column(BranchName______SubBranch_Control1000000032; BranchName + '  ' + SubBranch)
            {
            }
            column(Opening_Balance_As_On_______FORMAT_GETRANGEMIN__Date_Filter___; 'Opening Balance As On' + ' ' + Format(GetRangeMin("Date Filter")))
            {
            }
            column(OpeningDRBal; OpeningDRBal)
            {
            }
            column(OpeningCRBal; OpeningCRBal)
            {
            }
            column(ABS_OpeningDRBal_OpeningCRBal_; Abs(OpeningDRBal - OpeningCRBal))
            {
            }
            column(DrCrTextBalance; DrCrTextBalance)
            {
            }
            column(G_L_Account_Name; Name)
            {
            }
            column(OpeningCRBal__G_L_Entry___Credit_Amount_; OpeningCRBal + "G/L Entry"."Credit Amount")
            {
            }
            column(OpeningDRBal__G_L_Entry___Debit_Amount_; OpeningDRBal + "G/L Entry"."Debit Amount")
            {
            }
            column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits_; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
            {
            }
            column(DrCrTextBalance_Control1500063; DrCrTextBalance)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Voucher_No_Caption; Voucher_No_CaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(NarrationCaption; NarrationCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(Sub_BranchCaption; Sub_BranchCaptionLbl)
            {
            }
            column(Dept_NameCaption; Dept_NameCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Posting_DateCaption_Control1500067; Posting_DateCaption_Control1500067Lbl)
            {
            }
            column(Voucher_No_Caption_Control1500068; Voucher_No_Caption_Control1500068Lbl)
            {
            }
            column(Debit_AmountCaption_Control1500069; Debit_AmountCaption_Control1500069Lbl)
            {
            }
            column(Credit_AmountCaption_Control1500070; Credit_AmountCaption_Control1500070Lbl)
            {
            }
            column(NarrationCaption_Control1500084; NarrationCaption_Control1500084Lbl)
            {
            }
            column(BalanceCaption_Control1500095; BalanceCaption_Control1500095Lbl)
            {
            }
            column(Dept_NameCaption_Control1000000006; Dept_NameCaption_Control1000000006Lbl)
            {
            }
            column(Sub_BranchCaption_Control1000000007; Sub_BranchCaption_Control1000000007Lbl)
            {
            }
            column(LocationCaption_Control1000000030; LocationCaption_Control1000000030Lbl)
            {
            }
            column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            {
            }
            column(G_L_Account_No_; "No.")
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
                DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending);
                column(G_L_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(docNo; docNo)
                {
                }
                column(G_L_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(G_L_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500029; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                {
                }
                column(DrCrTextBalance_Control1500030; DrCrTextBalance)
                {
                }
                column(DeptDim; DeptDim)
                {
                }
                column(SubDim; SubDim)
                {
                }
                column(ControlAccountName; ControlAccountName)
                {
                }
                column(PostNarr; PostNarr)
                {
                }
                column(G_L_Entry__Journal_Batch_Name_; "Journal Batch Name")
                {
                }
                column(G_L_Entry__Posting_Date__Control1500037; "Posting Date")
                {
                }
                column(docNo_Control1500038; docNo)
                {
                }
                column(G_L_Entry__Debit_Amount__Control1500040; "Debit Amount")
                {
                }
                column(G_L_Entry__Credit_Amount__Control1500041; "Credit Amount")
                {
                }
                column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500034; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                {
                }
                column(DrCrTextBalance_Control1500035; DrCrTextBalance)
                {
                }
                column(SubDim_Control1000000010; SubDim)
                {
                }
                column(DeptDim_Control1000000013; DeptDim)
                {
                }
                column(PostNarr_Control1000000029; PostNarr)
                {
                }
                column(G_L_Entry__Journal_Batch_Name__Control1000000024; "Journal Batch Name")
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
                column(G_L_Entry_Transaction_No_; "Transaction No.")
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(GLEntry__Posting_Date_; GLEntry."Posting Date")
                    {
                    }
                    column(docNo_Control1500058; docNo)
                    {
                    }
                    column(G_L_Entry___Debit_Amount_; "G/L Entry"."Debit Amount")
                    {
                    }
                    column(G_L_Entry___Credit_Amount_; "G/L Entry"."Credit Amount")
                    {
                    }
                    column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500043; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                    {
                    }
                    column(DrCrTextBalance_Control1500044; DrCrTextBalance)
                    {
                    }
                    column(SubDim_Control1000000011; SubDim)
                    {
                    }
                    column(DeptDim_Control1000000014; DeptDim)
                    {
                    }
                    column(ControlAccountName_Control1000000023; ControlAccountName)
                    {
                    }
                    column(PostNarr_Control1000000025; PostNarr)
                    {
                    }
                    column(G_L_Entry___Journal_Batch_Name_; "G/L Entry"."Journal Batch Name")
                    {
                    }
                    column(GLEntry__Posting_Date__Control1500000; GLEntry."Posting Date")
                    {
                    }
                    column(docNo_Control1500008; docNo)
                    {
                    }
                    column(G_L_Entry___Debit_Amount__Control1500010; "G/L Entry"."Debit Amount")
                    {
                    }
                    column(G_L_Entry___Credit_Amount__Control1500012; "G/L Entry"."Credit Amount")
                    {
                    }
                    column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500048; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                    {
                    }
                    column(DrCrTextBalance_Control1500049; DrCrTextBalance)
                    {
                    }
                    column(SubDim_Control1000000012; SubDim)
                    {
                    }
                    column(DeptDim_Control1000000015; DeptDim)
                    {
                    }
                    column(PostNarr_Control1000000027; PostNarr)
                    {
                    }
                    column(G_L_Entry___Journal_Batch_Name__Control1000000031; "G/L Entry"."Journal Batch Name")
                    {
                    }
                    column(PostNarr_Control1000000028; PostNarr)
                    {
                    }
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        DrCrText := '';
                        if Number > 1 then begin
                            FirstRecord := false;
                            GLEntry.Next;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, GLEntry.Count);
                        FirstRecord := true;

                        if GLEntry.Count = 1 then
                            CurrReport.Break;
                    end;
                }
                dataitem("Posted Narration"; "Posted Narration")
                {
                    DataItemLink = "Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.") ORDER(Ascending);
                    column(Posted_Narration_Narration; Narration)
                    {
                    }
                    column(Posted_Narration_Entry_No_; "Entry No.")
                    {
                    }
                    column(Posted_Narration_Transaction_No_; "Transaction No.")
                    {
                    }
                    column(Posted_Narration_Line_No_; "Line No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not PrintLineNarration then
                            CurrReport.Break;
                    end;
                }
                dataitem(PostedNarration1; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.") WHERE("Entry No." = FILTER(0));
                    column(PostedNarration1_Narration; Narration)
                    {
                    }
                    column(PostedNarration1_Entry_No_; "Entry No.")
                    {
                    }
                    column(PostedNarration1_Transaction_No_; "Transaction No.")
                    {
                    }
                    column(PostedNarration1_Line_No_; "Line No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not PrintVchNarration then
                            CurrReport.Break;

                        GLEntry2.Reset;
                        GLEntry2.SetCurrentKey("Posting Date", "Source Code", "Transaction No.");
                        GLEntry2.SetRange("Posting Date", "G/L Entry"."Posting Date");
                        GLEntry2.SetRange("Source Code", "G/L Entry"."Source Code");
                        GLEntry2.SetRange("Transaction No.", "G/L Entry"."Transaction No.");
                        GLEntry2.FindLast;
                        if not (GLEntry2."Entry No." = "G/L Entry"."Entry No.") then
                            CurrReport.Break;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    PostNarr := '';
                    SubDim := '';
                    DeptDim := '';
                    GLEntry.SetRange("Transaction No.", "Transaction No.");
                    GLEntry.SetFilter("Entry No.", '<>%1', "Entry No.");
                    if GLEntry.FindFirst then;

                    DrCrText := '';

                    ControlAccount := false;
                    OneEntryRecord := true;
                    if GLEntry.Count > 1 then
                        OneEntryRecord := false;

                    GLAcc.Get("G/L Account No.");
                    ControlAccount := FindControlAccount("Source Type", "Entry No.", "Source No.", "G/L Account No.");
                    //TBD
                    /*
                    if ControlAccount then
                        ControlAccountName := Daybook.FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");
                    */

                    if Amount > 0 then
                        TransDebits := TransDebits + Amount;
                    if Amount < 0 then
                        TransCredits := TransCredits - Amount;

                    SourceDesc := '';
                    if "Source Code" <> '' then begin
                        SourceCode.Get("Source Code");
                        SourceDesc := SourceCode.Description;
                    end;

                    //TBD
                    /*
                    LedEntryDim.Reset;
                    LedEntryDim.SetRange(LedEntryDim."Entry No.", "G/L Entry"."Entry No.");
                    LedEntryDim.SetRange(LedEntryDim."Dimension Code", 'SUB-BRANCH');
                    if LedEntryDim.Find('-') then begin
                        DimValue.SetRange(DimValue."Dimension Code", 'SUB-BRANCH');
                        DimValue.SetRange(DimValue.Code, LedEntryDim."Dimension Value Code");
                        if DimValue.Find('-') then
                            SubDim := DimValue.Name;
                    end;


                    LedEntryDim.Reset;
                    DimValue.Reset;
                    LedEntryDim.SetRange(LedEntryDim."Entry No.", "G/L Entry"."Entry No.");
                    LedEntryDim.SetRange(LedEntryDim."Dimension Code", 'DEPT');
                    if LedEntryDim.Find('-') then begin
                        DimValue.SetRange(DimValue."Dimension Code", 'DEPT');
                        DimValue.SetRange(DimValue.Code, LedEntryDim."Dimension Value Code");
                        if DimValue.Find('-') then
                            DeptDim := DimValue.Name;
                    end;
                    */

                    PostNar.SetRange(PostNar."Entry No.", "G/L Entry"."Entry No.");
                    if PostNar.Find('-') then
                        repeat
                            PostNarr := PostNarr + PostNar.Narration;
                        until PostNar.Next = 0;

                    /*
                   IF PrintToExcel THEN
                     MakeExcelDataBody;
                     */

                end;

                trigger OnPreDataItem()
                begin
                    //TBD
                    /*
                    if LocationCode <> '' then
                        SetFilter("Location Code", LocationCode);
                    */
                    GLEntry.Reset;
                    GLEntry.SetCurrentKey("Transaction No.");
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(TransDebits, TransCredits, "G/L Entry"."Debit Amount", "G/L Entry"."Credit Amount");
                if LocationCode <> '' then
                    LocationFilter := 'Location Code: ' + LocationCode;
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
        CompInfo: Record "Company Information";
        GLAcc: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        GLEntry2: Record "G/L Entry";
        SourceCode: Record "Source Code";
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        TransDebits: Decimal;
        TransCredits: Decimal;
        OneEntryRecord: Boolean;
        FirstRecord: Boolean;
        PrintDetail: Boolean;
        PrintLineNarration: Boolean;
        PrintVchNarration: Boolean;
        DetailAmt: Decimal;
        AccountName: Text[100];
        ControlAccountName: Text[100];
        ControlAccount: Boolean;
        SourceDesc: Text[50];
        DrCrText: Text[2];
        DrCrTextBalance: Text[2];
        LocationCode: Code[20];
        LocationFilter: Text[100];
        Text16500: Label 'As per Details';
        AccountChanged: Boolean;
        docNo: Code[30];
        DimValue: Record "Dimension Value";
        SubDim: Text[50];
        VendDim: Text[50];
        DeptDim: Text[50];
        PostNar: Record "Posted Narration";
        PostNarr: Text[300];
        Text000: Label 'Period: %1';
        Text001: Label 'Trial Balance';
        Text002: Label 'Data';
        Text003: Label 'Narration';
        Text004: Label 'Batch';
        Text005: Label 'Sub Branch';
        Text006: Label 'Dept';
        Text007: Label 'Cheque No.';
        Text008: Label 'Debit ';
        Text009: Label 'Credit';
        Text010: Label 'Balance';
        Text011: Label 'Period Filter';
        Text012: Label 'Cheque Date';
        Text013: Label 'Opening Balance';
        opDate: Text[30];
        dim: Record "Dimension Value";
        BranchName: Text[30];
        SubBranch: Text[100];
        linNar: Record "Posted Narration";
        Posting_DateCaptionLbl: Label 'Posting Date';
        Voucher_No_CaptionLbl: Label 'Voucher No.';
        Debit_AmountCaptionLbl: Label 'Debit Amount';
        Credit_AmountCaptionLbl: Label 'Credit Amount';
        NarrationCaptionLbl: Label 'Narration';
        BalanceCaptionLbl: Label 'Balance';
        Sub_BranchCaptionLbl: Label 'Sub-Branch';
        Dept_NameCaptionLbl: Label 'Dept Name';
        LocationCaptionLbl: Label 'Location';
        Posting_DateCaption_Control1500067Lbl: Label 'Posting Date';
        Voucher_No_Caption_Control1500068Lbl: Label 'Voucher No.';
        Debit_AmountCaption_Control1500069Lbl: Label 'Debit Amount';
        Credit_AmountCaption_Control1500070Lbl: Label 'Credit Amount';
        NarrationCaption_Control1500084Lbl: Label 'Narration';
        BalanceCaption_Control1500095Lbl: Label 'Balance';
        Dept_NameCaption_Control1000000006Lbl: Label 'Dept Name';
        Sub_BranchCaption_Control1000000007Lbl: Label 'Sub-Branch';
        LocationCaption_Control1000000030Lbl: Label 'Location';
        Closing_BalanceCaptionLbl: Label 'Closing Balance';


    procedure FindControlAccount("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]): Boolean
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
        BankLedgEntry: Record "Bank Account Ledger Entry";
        FALedgEntry: Record "FA Ledger Entry";
        SubLedgerFound: Boolean;
    begin
        if "Source Type" = "Source Type"::Vendor then begin
            if VendLedgEntry.Get("Entry No.") then
                SubLedgerFound := true;
        end;
        if "Source Type" = "Source Type"::Customer then begin
            if CustLedgEntry.Get("Entry No.") then
                SubLedgerFound := true;
        end;
        if "Source Type" = "Source Type"::"Bank Account" then
            if BankLedgEntry.Get("Entry No.") then begin
                SubLedgerFound := true;
            end;
        if "Source Type" = "Source Type"::"Fixed Asset" then begin
            FALedgEntry.Reset;
            FALedgEntry.SetCurrentKey("G/L Entry No.");
            FALedgEntry.SetRange("G/L Entry No.", "Entry No.");
            if FALedgEntry.FindFirst then
                SubLedgerFound := true;
        end;
        exit(SubLedgerFound);
    end;


    procedure FindGLAccName("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]; DocNo1: Code[30]): Text[50]
    var
        AccName: Text[50];
        VendLedgEntry: Record "Vendor Ledger Entry";
        Vend: Record Vendor;
        CustLedgEntry: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        BankLedgEntry: Record "Bank Account Ledger Entry";
        Bank: Record "Bank Account";
        FALedgEntry: Record "FA Ledger Entry";
        FA: Record "Fixed Asset";
        GLAccount: Record "G/L Account";
    begin
        /*
        IF "Source Type" = "Source Type"::Vendor THEN
          IF VendLedgEntry.GET("Entry No.") THEN BEGIN
            Vend.GET("Source No.");
            AccName := Vend.Name;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE IF "Source Type" = "Source Type"::Customer THEN
          IF CustLedgEntry.GET("Entry No.") THEN BEGIN
            Cust.GET("Source No.");
            AccName := Cust.Name;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE
        IF "Source Type" = "Source Type"::"Bank Account" THEN
          IF BankLedgEntry.GET("Entry No.") THEN BEGIN
            Bank.GET("Source No.");
            AccName := Bank.Name;
          END;
          ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE IF "Source Type" = "Source Type"::"Fixed Asset" THEN BEGIN
          FALedgEntry.RESET;
          FALedgEntry.SETCURRENTKEY("G/L Entry No.");
          FALedgEntry.SETRANGE("G/L Entry No.","Entry No.");
          IF FALedgEntry.FINDFIRST THEN BEGIN
            FA.GET("Source No.");
            AccName := FA.Description;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END;
        END ELSE BEGIN
          GLAccount.GET("G/L Account No.");
          AccName := GLAccount.Name;
        END;
        
        IF "Source Type" = "Source Type"::" " THEN BEGIN
          GLAccount.GET("G/L Account No.");
          AccName := GLAccount.Name;
        END;
           */


        if "Source Type" = "Source Type"::"Bank Account" then begin
            //MESSAGE(FORMAT(DocNo1));
            BankLedgEntry.Reset;
            BankLedgEntry.SetRange(BankLedgEntry."Document No.", DocNo1);
            if BankLedgEntry.Find('-') then
                Bank.SetRange(Bank."No.", BankLedgEntry."Bank Account No.");
            if Bank.Find('-') then
                AccName := Bank.Name
        end;
        exit(AccName);

    end;


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
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT('G/L Account'),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn("G/L Account".GETFILTER("No."),FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text011),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn("G/L Account".GETFILTER("Date Filter"),FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelHeader;
        MakeExcelDataHeader;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("G/L Entry".FIELDCAPTION("Posting Date"),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("G/L Entry".FIELDCAPTION("Document No."),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text003),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text004),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text005),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text006),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text007),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text012),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text008),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text009),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          FORMAT(Text010),FALSE,'',TRUE,FALSE,TRUE,'');
         */

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        /*
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(
         "G/L Entry"."Posting Date",FALSE,'',FALSE,
          FALSE,FALSE,'');
          ExcelBuf.AddColumn(
            docNo,FALSE,'',FALSE,
            FALSE,FALSE,'@');
            //"G/L Entry"."Document No."
          ExcelBuf.AddColumn(
            PostNarr,FALSE,'',FALSE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            "G/L Entry"."Journal Batch Name",FALSE,'',FALSE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            SubDim,FALSE,'',FALSE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            DeptDim,FALSE,'',FALSE,
            FALSE,FALSE,'@');
            {
          ExcelBuf.AddColumn(
            "G/L Entry"."Cheque No.",FALSE,'',FALSE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            "G/L Entry"."Cheque Date",FALSE,'',FALSE,
            FALSE,FALSE,'@');
             }
        IF "G/L Entry"."Debit Amount"<>0 THEN
        
          ExcelBuf.AddColumn(
            "G/L Entry"."Debit Amount",FALSE,'',FALSE,
            FALSE,FALSE,'@')
            ELSE
          ExcelBuf.AddColumn(
            '',FALSE,'',FALSE,
            FALSE,FALSE,'@');
        
        IF "G/L Entry"."Credit Amount"<>0 THEN
          ExcelBuf.AddColumn(
            "G/L Entry"."Credit Amount",FALSE,'',FALSE,
            FALSE,FALSE,'@')
            ELSE
          ExcelBuf.AddColumn(
            '',FALSE,'',FALSE,
            FALSE,FALSE,'@');
        
           IF ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits)<>0 THEN
        
          ExcelBuf.AddColumn(
            ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits),FALSE,'',FALSE,
            FALSE,FALSE,'@')
            ELSE
          ExcelBuf.AddColumn(
            '',FALSE,'',FALSE,
            FALSE,FALSE,'@');
        
        
          ExcelBuf.AddColumn(
            DrCrTextBalance,FALSE,'',FALSE,
            FALSE,FALSE,'@');
        */

    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure Makeopening()
    begin
        /*
         ExcelBuf.NewRow;
        
          ExcelBuf.AddColumn(
            opDate,FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            "G/L Account".Name,FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
           OpeningDRBal,FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
           OpeningCRBal,FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
        
        
        
          ExcelBuf.AddColumn(
            ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits),FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            DrCrTextBalance,FALSE,'',FALSE,
            FALSE,FALSE,'@');
         */

    end;


    procedure Closeopening()
    begin
        //ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits)
        /*
        
         ExcelBuf.NewRow;
        
          ExcelBuf.AddColumn(
            'Closing Balance ',FALSE,'',TRUE,
         FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            '',FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
           OpeningDRBal+"G/L Entry"."Debit Amount",FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            OpeningCRBal+"G/L Entry"."Credit Amount",FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
        
        
          ExcelBuf.AddColumn(
            ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits),FALSE,'',TRUE,
            FALSE,FALSE,'@');
        
          ExcelBuf.AddColumn(
            DrCrTextBalance,FALSE,'',FALSE,
            FALSE,FALSE,'@');
         */

    end;


    procedure MakeExcelHeader()
    begin
        /*
        ExcelBuf.AddColumn('Company Name',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(CompInfo.Name,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('User ID',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(USERID,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Date',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(TODAY,FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(FORMAT('G/L Account'),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn("G/L Account".GETFILTER("No."),FALSE,'',FALSE,FALSE,TRUE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(
          FORMAT(Text011),FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(
          "G/L Account".GETFILTER("Date Filter"),FALSE,'',FALSE,FALSE,TRUE,'');
         */

    end;
}

