page 50112 "Bank Receipt Voucher-New"
//PAN UPG Modified the id from 60000 to 50112
{
    // <changelog>
    //   <add id="IN0062" dev="Ravinder" date="2007-11-29" area="STRND" releaseversion="IN6.00" feature="25225"
    //   >The controls Service Tax Rounding Type and Service Tax Rounding Precision Added.</add>
    //   <add id="35812" dev="suneethg" date="2009-03-19" area="SERTAX" releaseversion="IN6.00.01" feature="NAVCORS35812"
    //   >New control incl. service tax base has been added.</add>
    //   <change id="IN0001" dev="SUNEETHG" date="2010-09-13" area="VOUCHER" feature="VSTF231127"
    //   baseversion="IN6.00.01" releaseversion="IN7.00">Change the length of variable AccName BalAccName</change>
    // <add id="IN0002" dev="ALL-E" date="2011-08-23" area="SERVICETAX" feature="VSTF273271"
    // releaseversion="IN7.00">Service Tax  Change in POINT OF TAX for determination of Service Tax and Tax rate</add>
    // </changelog>

    AutoSplitKey = true;
    Caption = 'Bank Receipt Voucher';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Gen. Journal Line";

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                Caption = 'Batch Name';
                Lookup = true;
                ApplicationArea = All;
                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord;
                    GenJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Move To Correction"; Rec."Move To Correction")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Date';
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Collection No."; Rec."Collection No.")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        if CompanyName = 'Lakshmi Kumaran & Sridharan' then
                            CoHead := 0;
                        if CompanyName = 'V.Lakshmikumaran' then
                            CoHead := 1;
                        if CompanyName = 'V.Sridharan' then
                            CoHead := 2;
                        CollectionDetail.Reset;
                        CollectionDetail.SetRange(CollectionDetail.Posted, false);
                        CollectionDetail.SetRange(CollectionDetail.Submitted, true);
                        CollectionDetail.SetRange(CollectionDetail."Company Head", CoHead);
                        CollectionDetail.SetRange(CollectionDetail.Location, rec."Location Code");
                        if PAGE.RunModal(50070, CollectionDetail) = ACTION::LookupOK then
                            Rec.Validate("Collection No.", CollectionDetail."Receipt No.");
                        Rec.Validate("Account Type", 1);
                        Rec.Validate("Account No.", CollectionDetail."Client ID");
                        Rec.Validate("Credit Amount", CollectionDetail."Cheque Amount");
                        Rec.Validate("Cheque No.", CollectionDetail."Cheque No.");
                        Rec.Validate("Cheque Date", CollectionDetail."Cheque Date");
                        Rec.Validate("Document Date", CollectionDetail."Creation Date");
                        Rec."Issuing Bank Name" := CollectionDetail."Client Bank Name";
                        Rec."Bal. Account Type" := 3;
                        Rec."Bal. Account No." := CollectionDetail."Deposit Bank";
                        Rec.Validate("Collection No.");
                    end;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("TDS Certificate Receivable"; Rec."TDS Certificate Receivable")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Party Type"; Rec."Party Type")
                {
                    ApplicationArea = All;
                }
                field("Party Code"; Rec."Party Code")
                {
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("T.C.A.N. No."; Rec."T.C.A.N. No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("TCS Nature of Collection"; Rec."TCS Nature of Collection")
                {
                    ApplicationArea = All;
                }

                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date");
                        if ChangeExchangeRate.RunModal = ACTION::OK then
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);

                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = All;
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = All;
                }
                field("Income Account"; Rec."Income Account")
                {
                    ApplicationArea = All;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. VAT Amount"; Rec."Bal. VAT Amount")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. VAT Difference"; Rec."Bal. VAT Difference")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = All;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Bal. Gen. Posting Type"; Rec."Bal. Gen. Posting Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. Gen. Bus. Posting Group"; Rec."Bal. Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. Gen. Prod. Posting Group"; Rec."Bal. Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. VAT Bus. Posting Group"; Rec."Bal. VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bal. VAT Prod. Posting Group"; Rec."Bal. VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            group(Control24)
            {
                ShowCaption = false;
                fixed(Control1903561801)
                {
                    ShowCaption = false;
                    group("Account Name")
                    {
                        Caption = 'Account Name';
                        field(AccName; AccName)
                        {
                            ApplicationArea = All;
                            Caption = 'Account Name';
                            Editable = false;
                        }
                    }
                    group("Bal. Account Name")
                    {
                        Caption = 'Bal. Account Name';
                        field(BalAccName; BalAccName)
                        {
                            ApplicationArea = All;
                            Caption = 'Bal. Account Name';
                            Editable = false;
                        }
                    }
                    group(Control1902008401)
                    {
                        Caption = 'Cheque No.';
                        field("Cheque No.2"; Rec."Cheque No.")
                        {
                            ApplicationArea = All;
                            Caption = 'Bal. Account Name';
                            Editable = false;
                        }
                    }
                    group(Control1902067001)
                    {
                        Caption = 'Debit Amount';
                        field("Debit Amount2"; Rec."Debit Amount")
                        {
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                    group("Total Debit Amount")
                    {
                        Caption = 'Total Debit Amount';
                        field(TotalDebitAmount; TotalDebitAmount)
                        {
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                    group(Control1907962401)
                    {
                        Caption = 'Balance';
                        field(Balance; Balance + rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = All;
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = BalanceVisible;
                        }
                        field("Credit Amount2"; Rec."Credit Amount")
                        {
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        Caption = 'Total Balance';
                        field(TotalBalance; TotalBalance + rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = All;
                            AutoFormatType = 1;
                            Caption = 'Total Balance';
                            Editable = false;
                            Visible = TotalBalanceVisible;
                        }
                        field(TotalCreditAmount; TotalCreditAmount)
                        {
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            //TBD
            /*
            group("&Narration")
            {
                Caption = '&Narration';
                Image = Description;
                action("Line Narration")
                {ApplicationArea =All;
                    Caption = 'Line Narration';
                    Image = LineDescription;
                    RunObject = Page "Gen. Journal Narration";
                    RunPageLink = "Journal Template Name" = FIELD("Journal Template Name"),
                                  "Journal Batch Name" = FIELD("Journal Batch Name"),
                                  "Gen. Journal Line No." = FIELD("Line No."),
                                  "Document No." = FIELD("Document No.");
                    ShortCutKey = 'Shift+Ctrl+N';
                }
                action("Voucher Narration")
                {ApplicationArea =All;
                    Caption = 'Voucher Narration';
                    Image = VoucherDescription;
                    RunObject = Page "Gen. Journal Voucher Narration";
                    RunPageLink = "Journal Template Name" = FIELD("Journal Template Name"),
                                  "Journal Batch Name" = FIELD("Journal Batch Name"),
                                  "Document No." = FIELD("Document No."),
                                  "Gen. Journal Line No." = FILTER(0);
                    ShortCutKey = 'Shift+Ctrl+V';
                }
            }
            */
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        rec.ShowDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
            }
            group("A&ccount")
            {
                Caption = 'A&ccount';
                Image = ChartOfAccounts;
                action(Card)
                {
                    ApplicationArea = All;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Codeunit "Gen. Jnl.-Show Card";
                    ShortCutKey = 'Shift+F7';
                }
                action("Ledger E&ntries")
                {
                    ApplicationArea = All;
                    Caption = 'Ledger E&ntries';
                    RunObject = Codeunit "Gen. Jnl.-Show Entries";
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Apply Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Apply Entries';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Codeunit "Gen. Jnl.-Apply";
                    ShortCutKey = 'Shift+F11';
                }
                action("Insert Conv. LCY Rndg. Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Insert Conv. LCY Rndg. Lines';
                    Image = InsertCurrency;
                    RunObject = Codeunit "Adjust Gen. Journal Balance";
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Reconcile)
                {
                    ApplicationArea = All;
                    Caption = 'Reconcile';
                    Image = Reconcile;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction()
                    begin
                        GLReconcile.SetGenJnlLine(Rec);
                        GLReconcile.Run;
                    end;
                }
                action("Test Report")
                {
                    ApplicationArea = All;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintGenJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    ApplicationArea = All;
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin

                        // Team-2655
                        NewGnlLine.SetRange(NewGnlLine."Journal Template Name", rec."Journal Template Name");
                        NewGnlLine.SetRange(NewGnlLine."Journal Batch Name", rec."Journal Batch Name");
                        if NewGnlLine.FindFirst then begin
                            repeat
                                if (NewGnlLine."Account Type" = NewGnlLine."Account Type"::Customer) then begin
                                    CustRec.SetRange(CustRec."No.", NewGnlLine."Account No.");
                                    if CustRec.FindFirst then
                                        if (CustRec."Customer Posting Group" = 'GENERAL') and
                                           (NewGnlLine."Income Account" = '') then
                                            Error('Please Select Income Account');
                                end
                                else
                                    //TEAM::1426
                                    NewGnlLine.SetRange(NewGnlLine."Journal Template Name", rec."Journal Template Name");
                                NewGnlLine.SetRange(NewGnlLine."Journal Batch Name", rec."Journal Batch Name");
                                if (NewGnlLine."Bal. Account Type" = NewGnlLine."Bal. Account Type"::Customer) then begin
                                    CustRec.SetRange(CustRec."No.", NewGnlLine."Bal. Account No.");
                                    if CustRec.FindFirst then
                                        if (CustRec."Customer Posting Group" = 'GENERAL') and (NewGnlLine."Income Account" = '') then
                                            Error('Please Select Income Account');
                                end;
                            until NewGnlLine.Next = 0;
                        end;

                        if (rec."Currency Code" <> '') and (rec."Applies-to Doc. No." <> '') then
                            Error('Please Remove Applie Doc. No.');

                        //TEAM::1426
                        if (rec."Account Type" = rec."Account Type"::"Bank Account") or
                            (rec."Bal. Account Type" = rec."Bal. Account Type"::"Bank Account") or
                             (rec."Account Type" = rec."Account Type"::Customer) or
                              (rec."Bal. Account Type" = rec."Bal. Account Type"::Customer) then begin
                            if (rec."Cheque No." = '') or (rec."Cheque Date" = 0D) then
                                Error('Please Fill Cheque No./Cheque Date');
                        end;
                        /*
                        //TEAM::1426
                        IF (NewGnlLine."Bal. Account Type"=NewGnlLine."Bal. Account Type"::Customer) THEN BEGIN
                            CustRec.SETRANGE(CustRec."No.",NewGnlLine."Bal. Account No.");
                            IF CustRec.FINDFIRST THEN
                               IF (CustRec."Customer Posting Group"='GENERAL') AND (NewGnlLine."Income Account"='') THEN
                                  ERROR('Please Select Income Account');
                        END;
                              UNTIL NewGnlLine.NEXT=0;
                        END;
                        */
                        if (rec."Document Type" = 0) then
                            Error('Please Select Document Type.');

                        //2021
                        GenJnlNarr.SetRange(GenJnlNarr."Journal Template Name", rec."Journal Template Name");
                        GenJnlNarr.SetRange(GenJnlNarr."Journal Batch Name", rec."Journal Batch Name");
                        GenJnlNarr.SetRange(GenJnlNarr."Document No.", rec."Document No.");
                        if not GenJnlNarr.FindFirst then
                            repeat
                                Error('Please Insert Voucher Narration');
                            until GenJnlNarr.Next = 0;
                        //2021


                        CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", Rec);
                        //TEAM:;1426
                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Collection No.", CollectionDetail."Receipt No.");
                        if GLEntry.FindFirst then
                            CollectionDetail.Posted := true;
                        CollectionDetail."Posted No." := GLEntry."Document No.";
                        CollectionDetail.Modify(true);
                        //TEAM::1426
                        CurrentJnlBatchName := rec.GetRangeMax(rec."Journal Batch Name");
                        CurrPage.Update(false);

                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = All;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := rec.GetRangeMax(rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        rec.ShowShortcutDimCode(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        TotalBalanceVisible := true;
        BalanceVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateBalance;
        UpdateDebitCreditAmount;
        rec.SetUpNewLine(xRec, Balance, BelowxRec);
        Clear(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        BalAccName := '';
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        //TBD //GenJnlManagement.TemplateSelectionForVouchers(PAGE::"Bank Receipt Voucher", false, 3, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        GLReconcile: Page Reconciliation;
        GenJnlManagement: Codeunit GenJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[10];
        AccName: Text[50];
        BalAccName: Text[50];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;
        OpenedFromBatch: Boolean;
        [InDataSet]
        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;
        CoHead: Option;
        CollectionDetail: Record "Collection Detail";
        CollectionDetail1: Record "Collection Detail";
        GLEntry: Record "G/L Entry";
        "-Team---": Integer;
        GenJnlLine1: Record "Gen. Journal Line";
        NewGnlLine: Record "Gen. Journal Line";
        CustRec: Record Customer;
        GenJnlNarr: Record "Gen. Journal Narration";

    local procedure UpdateBalance()
    begin
        GenJnlManagement.CalcBalance(
          Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    local procedure UpdateDebitCreditAmount()
    begin
        //TBD //GenJnlManagement.CalcTotDebitTotCreditAmount(Rec, TotalDebitAmount, TotalCreditAmount, false);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        UpdateBalance;
        UpdateDebitCreditAmount;
    end;
}

