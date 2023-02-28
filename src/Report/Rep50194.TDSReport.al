report 50194 "TDS Report"
{
    // <changelog>
    //     <change releaseversion="IN6.00"/>
    //     <change id="IN0090" dev="AUGMENTUM" date="2008-06-17" area="Sales"
    //     baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20446">
    //     Report Transformation - local Report Layout.</change>
    // </changelog>
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'TDS Report';
    DefaultLayout = RDLC;
    RDLCLayout = './res/TDSReport.rdl';


    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Account Type" = FILTER(Posting), "No." = FILTER(<> '99-99-999999'));
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompInfoName; CompInfo.Name)
            {
            }
            column(LedgerName; Name + '  ' + 'Ledger')
            {
            }
            column(GetFilters; GetFilters)
            {
            }
            column(LocationFilter; LocationFilter)
            {
            }
            column(OpeningBalDesc; 'Opening Balance As On' + ' ' + Format(GetRangeMin("Date Filter")))
            {
            }
            column(OpeningDRBal; OpeningDRBal)
            {
            }
            column(OpeningCRBal; OpeningCRBal)
            {
            }
            column(DRCRBal; Abs(OpeningDRBal - OpeningCRBal))
            {
            }
            column(DrCrTextBalance; DrCrTextBalance)
            {
            }
            column(OpeningCRBalGLEntryCreditAmt; OpeningCRBal + "G/L Entry"."Credit Amount")
            {
            }
            column(OpeningDRBalGLEntryDebitAmt; OpeningDRBal + "G/L Entry"."Debit Amount")
            {
            }
            column(SumOpeningDRCRBalTransDRCR; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
            {
            }
            column(DrCrTextBalance2; DrCrTextBalance2)
            {
            }
            column(TotalDebitAmount; TotalDebitAmount)
            {
            }
            column(TotalCreditAmount; TotalCreditAmount)
            {
            }
            column(TransDebits; TransDebits)
            {
            }
            column(TransCredits; TransCredits)
            {
            }
            column(No_GLAccount; "No.")
            {
            }
            column(DateFilter_GLAccount; "Date Filter")
            {
            }
            column(GlobalDim1Filter_GLAccount; "Global Dimension 1 Filter")
            {
            }
            column(GlobalDim2Filter_GLAccount; "Global Dimension 2 Filter")
            {
            }
            column(PageNoCaption; PageCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(DocumentNoCaption; DocumentNoCaptionLbl)
            {
            }
            column(Debit_AmountCaption; DebitAmountCaptionLbl)
            {
            }
            column(CreditAmountCaption; CreditAmountCaptionLbl)
            {
            }
            column(AccountNameCaption; AccountNameCaptionLbl)
            {
            }
            column(VoucherTypeCaption; VoucherTypeCaptionLbl)
            {
            }
            column(LocationCodeCaption; LocationCodeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("G/L Account No." = FILTER(<> '99-99-999999'));
                RequestFilterFields = "Source Code", Reversed;
                column(TDSrate; TDSrate)
                {
                }
                column(GSTPaid; GSTPaid)
                {
                }
                column(Net_Amount; NetAmount)
                {
                }
                column(Deb_Amount; DBAmt)
                {
                }
                column(Deb_Amount3; DBAmt3)
                {
                }
                column(Cheque_No; "G/L Entry"."Cheque No.")
                {
                }
                column(Chq_Date; Format("G/L Entry"."Cheque Date"))
                {
                }
                column(Description_GLEntry; "G/L Entry".Description)
                {
                }
                column(Dimension_Value; DimValue)
                {
                }
                column(Branch_Value; "G/L Entry"."Global Dimension 1 Code")
                {
                }
                column(Vend_Name; VendName)
                {
                }
                column(Vend_PAN; VendPAN)
                {
                }
                column(ControlAccountName; ControlAccountName)
                {
                }
                column(PostingDate_GLEntry; Format("Posting Date"))
                {
                }
                column(DocumentNo_GLEntry; "Document No.")
                {
                }
                column(AccountName; AccountName)
                {
                }
                column(DebitAmount_GLEntry; "Debit Amount")
                {
                }
                column(CreditAmoutnt_GLEntry; "Credit Amount")
                {
                }
                column(SourceDesc; SourceDesc)
                {
                }

                column(SumOpeningDRCRBalTransDRCR2; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                {
                }
                column(DrCrTextBalance3; DrCrTextBalance)
                {
                }
                column(OneEntryRecord; OneEntryRecord)
                {
                }
                column(EntryNo_GLEntry; "Entry No.")
                {
                }
                column(DebAmtTotal; DebAmtTotal)
                {
                }
                column(TotCredAmt; TotCredAmt)
                {
                }
                column(totNetAmt; totNetAmt)
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(ControlAccountName1; ControlAccountName)
                    {
                    }
                    column(PostingDate_GLEntry2; Format(GLEntry."Posting Date"))
                    {
                    }
                    column(GLEntryDocumentNo; GLEntry."Document No.")
                    {
                    }
                    column(AccountName2; AccountName)
                    {
                    }
                    column(GLEntryDebitAmount; "G/L Entry"."Debit Amount")
                    {
                    }
                    column(GLEntryCreditAmount; "G/L Entry"."Credit Amount")
                    {
                    }
                    column(DetailAmt; Abs(DetailAmt))
                    {
                    }
                    column(SourceDesc2; SourceDesc)
                    {
                    }
                    column(DrCrText; DrCrText)
                    {
                    }
                    column(SumOpeningDRCRBalTransDRCR3; Abs(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                    {
                    }
                    column(DrCrTextBalance4; DrCrTextBalance)
                    {
                    }
                    column(FirstRecord; FirstRecord)
                    {
                    }
                    column(Amount_GLEntry2; Abs(GLEntry.Amount))
                    {
                    }
                    column(PrintDetail; PrintDetail)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        DrCrText := '';
                        if Number > 1 then begin
                            FirstRecord := false;
                            GLEntry.Next;
                        end;
                        if FirstRecord and (ControlAccountName <> '') then begin
                            DetailAmt := 0;
                            if PrintDetail then
                                DetailAmt := GLEntry.Amount;
                            if DetailAmt > 0 then
                                DrCrText := 'Dr';
                            if DetailAmt < 0 then
                                DrCrText := 'Cr';

                            if not PrintDetail then
                                AccountName := Text16500
                            else
                                ;//TBD//AccountName := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.")
                            ;

                            DrCrTextBalance := '';
                            if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits > 0 then
                                DrCrTextBalance := 'Dr';
                            if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits < 0 then
                                DrCrTextBalance := 'Cr';
                        end else
                            if FirstRecord and (ControlAccountName = '') then begin
                                DetailAmt := 0;
                                if PrintDetail then
                                    DetailAmt := GLEntry.Amount;

                                if DetailAmt > 0 then
                                    DrCrText := 'Dr';
                                if DetailAmt < 0 then
                                    DrCrText := 'Cr';

                                if not PrintDetail then
                                    AccountName := Text16500
                                else
                                    ; //TBD //AccountName := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.")
                                ;

                                DrCrTextBalance := '';
                                if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits > 0 then
                                    DrCrTextBalance := 'Dr';
                                if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits < 0 then
                                    DrCrTextBalance := 'Cr';
                            end;

                        if PrintDetail and (not FirstRecord) then begin
                            if GLEntry.Amount > 0 then
                                DrCrText := 'Dr';
                            if GLEntry.Amount < 0 then
                                DrCrText := 'Cr';
                            //TBD
                            //AccountName := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");
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
                    column(Narration_PostedNarration; Narration)
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
                    column(Narration_PostedNarration1; Narration)
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
                var
                    GLEntryNew: Record "G/L Entry";
                begin
                    GLEntry.SetRange("Transaction No.", "Transaction No.");
                    GLEntry.SetFilter("Entry No.", '<>%1', "Entry No.");
                    GLEntry.SetFilter(Description, '<>%1&<>%2', 'GST PAID', 'SERVICE TAX PAID');
                    if GLEntry.FindFirst then;

                    Clear(GSTPaid);
                    GLEntryNew.Reset;
                    GLEntryNew.SetRange("Transaction No.", "Transaction No.");
                    GLEntryNew.SetFilter(Description, 'GST PAID');
                    GLEntryNew.CalcSums(Amount);
                    GSTPaid := Abs(GLEntryNew.Amount);

                    if GSTPaid = 0 then begin
                        GLEntryNew.Reset;
                        GLEntryNew.SetRange("Transaction No.", "Transaction No.");
                        GLEntryNew.SetRange("G/L Account No.", '21-03-184510');
                        GLEntryNew.CalcSums(Amount);
                        GSTPaid := Abs(GLEntryNew.Amount);
                    end;

                    if GSTPaid = 0 then begin
                        GLEntryNew.Reset;
                        GLEntryNew.SetRange("Transaction No.", "Transaction No.");
                        GLEntryNew.SetFilter(Description, 'SERVICE TAX PAID');
                        GLEntryNew.CalcSums(Amount);
                        GSTPaid := Abs(GLEntryNew.Amount);
                    end;

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

                    AccountName := '';
                    if OneEntryRecord and (ControlAccountName <> '') then begin
                        //TBD
                        //AccountName := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");
                        DrCrTextBalance := '';
                        if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits > 0 then
                            DrCrTextBalance := 'Dr';
                        if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits < 0 then
                            DrCrTextBalance := 'Cr';
                    end else
                        if OneEntryRecord and (ControlAccountName = '') then begin
                            //TBD
                            //AccountName := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");
                            DrCrTextBalance := '';
                            if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits > 0 then
                                DrCrTextBalance := 'Dr';
                            if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits < 0 then
                                DrCrTextBalance := 'Cr';
                        end;

                    if GLAccountNo <> "G/L Account"."No." then
                        GLAccountNo := "G/L Account"."No.";

                    if GLAccountNo = "G/L Account"."No." then begin
                        DrCrTextBalance2 := '';
                        if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits > 0 then
                            DrCrTextBalance2 := 'Dr';
                        if OpeningDRBal - OpeningCRBal + TransDebits - TransCredits < 0 then
                            DrCrTextBalance2 := 'Cr';
                    end;

                    //IN0090.BEGIN
                    TotalDebitAmount += "G/L Entry"."Debit Amount";
                    TotalCreditAmount += "G/L Entry"."Credit Amount";
                    //IN0090.END

                    //Team::7814
                    Clear(DimValue);
                    DimensionSetEntry.Reset;
                    DimensionSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                    if DimensionSetEntry.FindFirst then
                        repeat
                            DimensionSetEntry.CalcFields("Dimension Value Name");
                            DimValue := DimensionSetEntry."Dimension Code" + ' : ' + DimensionSetEntry."Dimension Value Name" + ', ' + DimValue;
                        until DimensionSetEntry.Next = 0;

                    Clear(EntityName);
                    DimSetEntry.Reset;
                    DimSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                    DimSetEntry.SetRange("Dimension Code", 'ENTITY');
                    if DimSetEntry.FindSet then
                        EntityName := DimSetEntry."Dimension Value Name";


                    Clear(VendorCode);
                    Clear(VendName);
                    Clear(VendPAN);
                    DimSetEntry1.Reset;
                    DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
                    DimSetEntry1.SetRange("Dimension Code", 'VENDOR');
                    if DimSetEntry1.FindSet then begin
                        VendorCode := DimSetEntry1."Dimension Value Code";
                        if RecVendor.Get(VendorCode) then begin
                            VendName := RecVendor.Name;
                            VendPAN := RecVendor."P.A.N. No.";
                        end;
                    end;

                    Clear(DBAmt);
                    RecGLEntry.Reset;
                    RecGLEntry.SetRange("Document No.", "Document No.");
                    RecGLEntry.SetRange("Document Type", "Document Type");
                    RecGLEntry.SetFilter("G/L Account No.", '%1..%2|%3..%4&<>%7|%5..%6', '11-00-000000', '11-99-999999', '21-00-000000', '21-99-999999', '41-00-000000', '41-99-999999', '21-03-184510');
                    RecGLEntry.SetFilter(Description, '<>%1&<>%2', 'GST PAID', 'SERVICE TAX PAID');
                    if RecGLEntry.FindSet then begin
                        RecGLEntry.CalcSums(RecGLEntry."Debit Amount");
                        DBAmt := RecGLEntry."Debit Amount";
                    end;
                    /*
                   Clear(DBAmt1);
                   RecGLEntry1.reset;
                   RecGLEntry1.setrange("Document No.","Document No.");
                   RecGLEntry1.setrange("Document Type","Document Type");
                   RecGLEntry1.setfilter("G/L Account No.",'%1..%2','21-00-000000','21-99-999999');
                   if RecGLEntry1.findset then begin
                     RecGLEntry1.CALCSUMS(RecGLEntry1."Debit Amount");
                     DBAmt1:=RecGLEntry1."Debit Amount";
                   end;

                   Clear(DBAmt2);
                   RecGLEntry2.reset;
                   RecGLEntry2.setrange("Document No.","Document No.");
                   RecGLEntry2.setrange("Document Type","Document Type");
                   RecGLEntry2.setfilter("G/L Account No.",'%1..%2','41-00-000000','41-99-999999');
                   if RecGLEntry2.findset then begin
                     RecGLEntry2.CALCSUMS(RecGLEntry2."Debit Amount");
                     DBAmt2:=RecGLEntry2."Debit Amount";
                   end;
                    */
                    Clear(DBAmt3);
                    RecGLEntry3.Reset;
                    RecGLEntry3.SetRange("Document No.", "Document No.");
                    RecGLEntry3.SetRange("Document Type", "Document Type");
                    RecGLEntry3.SetFilter("G/L Account No.", '=%1', '41-08-789551');
                    RecGLEntry3.SetFilter(Description, '<>%1&<>%2', 'GST PAID', 'SERVICE TAX PAID');
                    if RecGLEntry3.FindSet then begin
                        RecGLEntry3.CalcSums(RecGLEntry3."Debit Amount");
                        DBAmt3 := RecGLEntry3."Debit Amount";
                    end;

                    DebAmtTotal := DebAmtTotal + (DBAmt - DBAmt3);
                    Clear(NetAmount);
                    BankAccLedEntry.Reset;
                    BankAccLedEntry.SetRange("Document No.", "Document No.");
                    BankAccLedEntry.SetRange("Posting Date", "Posting Date");
                    if BankAccLedEntry.FindSet then
                        NetAmount := Abs(BankAccLedEntry.Amount);

                    Clear(BranchName);
                    DimVal.Reset;
                    DimVal.SetRange(DimVal.Code, "G/L Entry"."Global Dimension 1 Code");
                    if DimVal.Find('-') then
                        BranchName := DimVal.Name;

                    //Team::7814
                    TotCredAmt += "Credit Amount";
                    totNetAmt += NetAmount;
                    Clear(TDSrate);
                    if (DBAmt - DBAmt3) <> 0 then
                        TDSrate := Round(("Credit Amount" / (DBAmt - DBAmt3)) * 100, 1);
                    ;

                end;

                trigger OnPostDataItem()
                begin
                    AccountChanged := true;
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
                    //IN0090.BEGIN
                    TotalDebitAmount := 0;
                    TotalCreditAmount := 0;

                    Clear(DebAmtTotal);
                    Clear(TotCredAmt);
                    Clear(totNetAmt);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if AccountNo <> "No." then begin
                    AccountNo := "No.";
                    OpeningDRBal := 0;
                    OpeningCRBal := 0;

                    GLEntry2.Reset;
                    GLEntry2.SetCurrentKey("G/L Account No.", "Business Unit Code", "Global Dimension 1 Code",
                    "Global Dimension 2 Code", "Close Income Statement Dim. ID");
                    GLEntry2.SetRange("G/L Account No.", "No.");
                    GLEntry2.SetFilter("Posting Date", '%1..%2', 0D, ClosingDate(GetRangeMin("Date Filter") - 1));
                    if "Global Dimension 1 Filter" <> '' then
                        GLEntry2.SetFilter("Global Dimension 1 Code", "Global Dimension 1 Filter");
                    if "Global Dimension 2 Filter" <> '' then
                        GLEntry2.SetFilter("Global Dimension 2 Code", "Global Dimension 2 Filter");
                    //TBD
                    /*
                    if LocationCode <> '' then
                        GLEntry2.SetFilter("Location Code", LocationCode);
                    */
                    GLEntry2.CalcSums(Amount);
                    if GLEntry2.Amount > 0 then
                        OpeningDRBal := GLEntry2.Amount;
                    if GLEntry2.Amount < 0 then
                        OpeningCRBal := -GLEntry2.Amount;

                    DrCrTextBalance := '';
                    if OpeningDRBal - OpeningCRBal > 0 then
                        DrCrTextBalance := 'Dr';
                    if OpeningDRBal - OpeningCRBal < 0 then
                        DrCrTextBalance := 'Cr';
                end;
            end;

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
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintDetail; PrintDetail)
                    {
                        Caption = 'Print Detail';
                        ApplicationArea = All;
                    }
                    field(PrintLineNarration; PrintLineNarration)
                    {
                        Caption = 'Print Line Narration';
                        ApplicationArea = All;
                    }
                    field(PrintVchNarration; PrintVchNarration)
                    {
                        Caption = 'Print Voucher Narration';
                        ApplicationArea = All;
                    }
                    field(LocationCode; LocationCode)
                    {
                        Caption = 'Location Code';
                        TableRelation = Location;
                        ApplicationArea = All;
                    }
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

    trigger OnPreReport()
    begin
        CompInfo.Get;
    end;

    var
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
        AccountNo: Code[20];
        DrCrTextBalance2: Text[2];
        GLAccountNo: Code[20];
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;
        PageCaptionLbl: Label 'Page';
        PostingDateCaptionLbl: Label 'Deposit Date';
        DocumentNoCaptionLbl: Label 'Document No.';
        DebitAmountCaptionLbl: Label 'Debit Amount';
        CreditAmountCaptionLbl: Label 'Credit Amount';
        AccountNameCaptionLbl: Label 'Account Name';
        VoucherTypeCaptionLbl: Label 'Voucher Type';
        LocationCodeCaptionLbl: Label 'Location Code';
        BalanceCaptionLbl: Label 'Balance';
        Closing_BalanceCaptionLbl: Label 'Closing Balance';
        "//Team::7814": Integer;
        DimensionSetEntry: Record "Dimension Set Entry";
        RecDimension: Record Dimension;
        DimValue: Text;
        DimSetEntry: Record "Dimension Set Entry";
        EntityName: Text;
        DimSetEntry1: Record "Dimension Set Entry";
        VendorCode: Code[20];
        RecVendor: Record Vendor;
        VendPAN: Code[20];
        VendName: Text;
        ChequeNo: Code[10];
        ChqDate: Date;
        RecGLEntry: Record "G/L Entry";
        DBAmt: Decimal;
        DBAmt1: Decimal;
        DBAmt2: Decimal;
        DBAmt3: Decimal;
        RecGLEntry1: Record "G/L Entry";
        RecGLEntry2: Record "G/L Entry";
        RecGLEntry3: Record "G/L Entry";
        BankAccLedEntry: Record "Bank Account Ledger Entry";
        NetAmount: Decimal;
        DimVal: Record "Dimension Value";
        BranchName: Text;
        DebAmtTotal: Decimal;
        TotCredAmt: Decimal;
        totNetAmt: Decimal;
        GSTPaid: Decimal;
        TDSrate: Decimal;


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
}

