report 50019 "Accounts Voucher Report"
{
    // <changelog>
    //     <change id="IN0090" dev="AUGMENTUM" date="2008-05-26" area="Finance"
    //      baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20353">
    //      Report transformation.
    //     </change>
    // </changelog>
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/AccountsVoucherReport.rdl';

    Caption = 'General Journal - Test';

    dataset
    {
        dataitem("Gen. Journal Batch"; "Gen. Journal Batch")
        {
            DataItemTableView = SORTING("Journal Template Name", Name);
            column(Gen__Journal_Batch_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Batch_Name; Name)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
                column(COMPANYNAME; CompanyName)
                {
                }
                column(CurrReport_PAGENO; CurrReport.PageNo)
                {
                }
                column(Gen__Journal_Batch___Journal_Template_Name_; "Gen. Journal Batch"."Journal Template Name")
                {
                }
                column(Gen__Journal_Batch__Name; "Gen. Journal Batch".Name)
                {
                }
                column(GenJnlLineFilter; GenJnlLineFilter)
                {
                }
                column(Gen__Journal_Line__TABLECAPTION__________GenJnlLineFilter; "Gen. Journal Line".TableCaption + ': ' + GenJnlLineFilter)
                {
                }
                column(General_Journal___TestCaption; General_Journal___TestCap)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCap)
                {
                }
                column(Gen__Journal_Batch___Journal_Template_Name_Caption; "Gen. Journal Batch".FieldCaption("Journal Template Name"))
                {
                }
                column(Gen__Journal_Batch__NameCaption; Gen__Journal_Batch__NameCap)
                {
                }
                column(Gen__Journal_Line__Posting_Date_Caption; Gen__Journal_Line__Posting_Date_Cap)
                {
                }
                column(Gen__Journal_Line__Document_Type_Caption; Gen__Journal_Line__Document_Type_Cap)
                {
                }
                column(Gen__Journal_Line__Document_No__Caption; "Gen. Journal Line".FieldCaption("Document No."))
                {
                }
                column(Gen__Journal_Line__Account_Type_Caption; Gen__Journal_Line__Account_Type_Cap)
                {
                }
                column(Gen__Journal_Line__Account_No__Caption; "Gen. Journal Line".FieldCaption("Account No."))
                {
                }
                column(AccNameCaption; AccNameCap)
                {
                }
                // column(Gen__Journal_Line_DescriptionCaption; "Gen. Journal Line".FieldCaption(Description))
                // {
                // }
                column(Gen__Journal_Line_DescriptionCaption; "Gen. Journal Line".FieldCaption("Description 3 "))
                {
                }
                column(Gen__Journal_Line__Gen__Posting_Type_Caption; Gen__Journal_Line__Gen__Posting_Type_Cap)
                {
                }
                column(Gen__Journal_Line__Gen__Bus__Posting_Group_Caption; Gen__Journal_Line__Gen__Bus__Posting_Group_Cap)
                {
                }
                column(Gen__Journal_Line__Gen__Prod__Posting_Group_Caption; Gen__Journal_Line__Gen__Prod__Posting_Group_Cap)
                {
                }
                column(Gen__Journal_Line_AmountCaption; "Gen. Journal Line".FieldCaption(Amount))
                {
                }
                column(Gen__Journal_Line__Bal__Account_No__Caption; "Gen. Journal Line".FieldCaption("Bal. Account No."))
                {
                }
                column(Gen_Journal_Line_Income_Acc; "Gen. Journal Line".FieldCaption("Income Account"))
                {
                }
                column(Gen__Journal_Line__Balance__LCY__Caption; "Gen. Journal Line".FieldCaption("Balance (LCY)"))
                {
                }
                dataitem("Gen. Journal Line"; "Gen. Journal Line")
                {
                    DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"), "Journal Batch Name" = FIELD(Name);
                    DataItemLinkReference = "Gen. Journal Batch";
                    DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.");
                    RequestFilterFields = "Posting Date";
                    column(Gen__Journal_Line__Posting_Date_; Format("Posting Date"))
                    {
                    }
                    column(Gen__Journal_Line__Document_Type_; "Document Type")
                    {
                    }
                    column(Gen__Journal_Line__Document_No__; "Document No.")
                    {
                    }
                    column(Gen__Journal_Line__Account_Type_; "Account Type")
                    {
                    }
                    column(AccountNo_GenJnlLine; "Account No.")
                    {
                    }
                    column(AccName; AccName)
                    {
                    }
                    column(BalAccName; BalAccName1)
                    {
                    }
                    column(Gen__Journal_Line_Description; "Description 3 ")
                    {
                    }
                    // column(Description_3;"Description 3")
                    // {
                    // }
                    column(Gen__Journal_Line__Gen__Posting_Type_; "Gen. Posting Type")
                    {
                    }
                    column(Gen__Journal_Line__Gen__Bus__Posting_Group_; "Gen. Bus. Posting Group")
                    {
                    }
                    column(Gen__Journal_Line__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                    {
                    }
                    column(Gen__Journal_Line_Amount; Amount)
                    {
                    }
                    column(Gen__Journal_Line__Currency_Code_; "Currency Code")
                    {
                    }
                    column(Gen__Journal_Line__Bal__Account_No__; "Bal. Account No.")
                    {
                    }
                    column(Gen__Journal_Line__Balance__LCY__; "Balance (LCY)")
                    {
                    }
                    column(AmountLCY; AmountLCY)
                    {
                    }
                    column(BalanceLCY; BalanceLCY)
                    {
                    }
                    //TBD //column(Gen__Journal_Line__Amount__LCY__; "Amount (LCY)" - TDSAmount - "Work Tax Amount" + TCSAmount + TCSAmountApplied + BankChargeAmt)
                    column(Gen__Journal_Line__Amount__LCY__; "Amount (LCY)" - TDSAmount + TCSAmount + TCSAmountApplied + BankChargeAmt)
                    {
                    }
                    column(TDSAmount; -TDSAmount)
                    {
                    }
                    column(ABS__Work_Tax_Amount___; 0)
                    {
                    }
                    column(TCSAmount; TCSAmount)
                    {
                    }
                    column(TCSAmountApplied; TCSAmountApplied)
                    {
                    }
                    column(BankChargeAmt; BankChargeAmt)
                    {
                    }
                    column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
                    {
                    }
                    column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                    {
                    }
                    column(Gen__Journal_Line_Line_No_; "Line No.")
                    {
                    }
                    column(Gen__Journal_Line__Amount__LCY__Caption; Gen__Journal_Line__Amount__LCY__Cap)
                    {
                    }
                    column(Gen__Journal_Line_Income_Acc_No; "Income Account")
                    {
                    }
                    column(TDS_Amount_Including_eCessCaption; TDS_Amount_Including_eCessCap)
                    {
                    }
                    column(Work_Tax_AmountCaption; Work_Tax_AmountCap)
                    {
                    }
                    column(TCS_AmountCaption; TCS_AmountCap)
                    {
                    }
                    column(TCS_Amount__Applied_Caption; TCS_Amount__Applied_Cap)
                    {
                    }
                    column(Bank_ChargesCaption; Bank_ChargesCap)
                    {
                    }
                    column(Line_Narration; Narration)
                    {
                    }
                    dataitem(DimensionLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop_Number; Number)
                        {
                        }
                        column(DimensionsCaption; DimensionsCap)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry.FindSet then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := CopyStr(DimText, 1, MaxStrLen(OldDimText));
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText, DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowDim then
                                CurrReport.Break;
                            DimSetEntry.SetRange("Dimension Set ID", "Gen. Journal Line"."Dimension Set ID")
                        end;
                    }
                    dataitem(ErrorLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(ErrorText_Number_; ErrorText[Number])
                        {
                        }
                        column(ErrorText_Number_Caption; ErrorText_Number_Cap)
                        {
                        }

                        trigger OnPostDataItem()
                        begin
                            ErrorCounter := 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, ErrorCounter);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    var
                        PaymentTerms: Record "Payment Terms";
                        DimMgt: Codeunit DimensionManagement;
                        TableID: array[10] of Integer;
                        No: array[10] of Code[20];
                        Job: Record Job;
                    begin

                        GenJounalRec.Reset;
                        GenJounalRec.SetRange("Document No.", "Gen. Journal Line"."Document No.");
                        if GenJounalRec.FindSet then
                            repeat
                                if GenJounalRec."Account No." <> "Gen. Journal Line"."Account No." then begin
                                    GlAccountRec.Reset;
                                    GlAccountRec.SetRange("No.", GenJounalRec."Account No.");
                                    if GlAccountRec.FindFirst then
                                        BalAccName1 := GlAccountRec.Name;
                                end
                            until GenJounalRec.Next = 0;

                        if "Currency Code" = '' then
                            "Amount (LCY)" := Amount;

                        UpdateLineBalance;

                        AccName := '';
                        BalAccName := '';

                        if not EmptyLine then begin
                            MakeRecurringTexts("Gen. Journal Line");

                            AmountError := false;

                            if ("Account No." = '') and ("Bal. Account No." = '') then
                                AddError(StrSubstNo(Text001, FieldCaption("Account No."), FieldCaption("Bal. Account No.")))
                            else
                                if ("Account Type" <> "Account Type"::"Fixed Asset") and
                                   ("Bal. Account Type" <> "Bal. Account Type"::"Fixed Asset")
                                then
                                    TestFixedAssetFields("Gen. Journal Line");
                            CheckICDocument;
                            if "Account No." <> '' then
                                case "Account Type" of
                                    "Account Type"::"G/L Account":
                                        begin
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then begin
                                                if "Gen. Posting Type" = 0 then
                                                    AddError(StrSubstNo(Text002, FieldCaption("Gen. Posting Type")));
                                            end;
                                            if ("Gen. Posting Type" <> "Gen. Posting Type"::" ") and
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            then begin
                                                if "VAT Amount" + "VAT Base Amount" <> Amount then
                                                    AddError(
                                                      StrSubstNo(
                                                        Text003, FieldCaption("VAT Amount"), FieldCaption("VAT Base Amount"),
                                                        FieldCaption(Amount)));
                                                if "Currency Code" <> '' then
                                                    if "VAT Amount (LCY)" + "VAT Base Amount (LCY)" <> "Amount (LCY)" then
                                                        AddError(
                                                          StrSubstNo(
                                                            Text003, FieldCaption("VAT Amount (LCY)"),
                                                            FieldCaption("VAT Base Amount (LCY)"), FieldCaption("Amount (LCY)")));
                                            end;
                                            TestJobFields("Gen. Journal Line");
                                        end;
                                    "Account Type"::Customer, "Account Type"::Vendor:
                                        begin
                                            if "Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text004,
                                                    FieldCaption("Gen. Posting Type"), FieldCaption("Account Type"), "Account Type"));
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    Text005,
                                                    FieldCaption("Gen. Bus. Posting Group"), FieldCaption("Gen. Prod. Posting Group"),
                                                    FieldCaption("VAT Bus. Posting Group"), FieldCaption("VAT Prod. Posting Group"),
                                                    FieldCaption("Account Type"), "Account Type"));

                                            if "Document Type" <> 0 then begin
                                                if "Account Type" = "Account Type"::Customer then
                                                    case "Document Type" of
                                                        "Document Type"::"Credit Memo":
                                                            WarningIfPositiveAmt("Gen. Journal Line");
                                                        "Document Type"::Payment:
                                                            if ("Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo") and
                                                               ("Applies-to Doc. No." <> '')
                                                            then
                                                                WarningIfNegativeAmt("Gen. Journal Line")
                                                            else
                                                                WarningIfPositiveAmt("Gen. Journal Line");
                                                        "Document Type"::Refund:
                                                            WarningIfNegativeAmt("Gen. Journal Line");
                                                        else
                                                            WarningIfNegativeAmt("Gen. Journal Line");
                                                    end
                                                else
                                                    case "Document Type" of
                                                        "Document Type"::"Credit Memo":
                                                            WarningIfNegativeAmt("Gen. Journal Line");
                                                        "Document Type"::Payment:
                                                            if ("Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo") and
                                                               ("Applies-to Doc. No." <> '')
                                                            then
                                                                WarningIfPositiveAmt("Gen. Journal Line")
                                                            else
                                                                WarningIfNegativeAmt("Gen. Journal Line");
                                                        "Document Type"::Refund:
                                                            WarningIfPositiveAmt("Gen. Journal Line");
                                                        else
                                                            WarningIfPositiveAmt("Gen. Journal Line");
                                                    end
                                            end;

                                            if Amount * "Sales/Purch. (LCY)" < 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text008,
                                                    FieldCaption("Sales/Purch. (LCY)"), FieldCaption(Amount)));
                                            if "Job No." <> '' then
                                                AddError(StrSubstNo(Text009, FieldCaption("Job No.")));
                                        end;
                                    "Account Type"::"Bank Account":
                                        begin
                                            if "Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text004,
                                                    FieldCaption("Gen. Posting Type"), FieldCaption("Account Type"), "Account Type"));
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    Text005,
                                                    FieldCaption("Gen. Bus. Posting Group"), FieldCaption("Gen. Prod. Posting Group"),
                                                    FieldCaption("VAT Bus. Posting Group"), FieldCaption("VAT Prod. Posting Group"),
                                                    FieldCaption("Account Type"), "Account Type"));

                                            if "Job No." <> '' then
                                                AddError(StrSubstNo(Text009, FieldCaption("Job No.")));
                                            if (Amount < 0) and ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") then
                                                if not "Check Printed" then
                                                    AddError(StrSubstNo(Text010, FieldCaption("Check Printed")));
                                        end;
                                    "Account Type"::"Fixed Asset":
                                        TestFixedAsset("Gen. Journal Line");
                                end;

                            if "Bal. Account No." <> '' then
                                case "Bal. Account Type" of
                                    "Bal. Account Type"::"G/L Account":
                                        begin
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then begin
                                                if "Bal. Gen. Posting Type" = 0 then
                                                    AddError(StrSubstNo(Text002, FieldCaption("Bal. Gen. Posting Type")));
                                            end;
                                            if ("Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" ") and
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            then begin
                                                if "Bal. VAT Amount" + "Bal. VAT Base Amount" <> -Amount then
                                                    AddError(
                                                      StrSubstNo(
                                                        Text011, FieldCaption("Bal. VAT Amount"), FieldCaption("Bal. VAT Base Amount"),
                                                        FieldCaption(Amount)));
                                                if "Currency Code" <> '' then
                                                    if "Bal. VAT Amount (LCY)" + "Bal. VAT Base Amount (LCY)" <> -"Amount (LCY)" then
                                                        AddError(
                                                          StrSubstNo(
                                                            Text011, FieldCaption("Bal. VAT Amount (LCY)"),
                                                            FieldCaption("Bal. VAT Base Amount (LCY)"), FieldCaption("Amount (LCY)")));
                                            end;
                                        end;
                                    "Bal. Account Type"::Customer, "Bal. Account Type"::Vendor:
                                        begin
                                            if "Bal. Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text004,
                                                    FieldCaption("Bal. Gen. Posting Type"), FieldCaption("Bal. Account Type"), "Bal. Account Type"));
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    Text005,
                                                    FieldCaption("Bal. Gen. Bus. Posting Group"), FieldCaption("Bal. Gen. Prod. Posting Group"),
                                                    FieldCaption("Bal. VAT Bus. Posting Group"), FieldCaption("Bal. VAT Prod. Posting Group"),
                                                    FieldCaption("Bal. Account Type"), "Bal. Account Type"));

                                            if "Document Type" <> 0 then begin
                                                if ("Bal. Account Type" = "Bal. Account Type"::Customer) =
                                                   ("Document Type" in ["Document Type"::Payment, "Document Type"::"Credit Memo"])
                                                then
                                                    WarningIfNegativeAmt("Gen. Journal Line")
                                                else
                                                    WarningIfPositiveAmt("Gen. Journal Line")
                                            end;
                                            if Amount * "Sales/Purch. (LCY)" > 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text012,
                                                    FieldCaption("Sales/Purch. (LCY)"), FieldCaption(Amount)));
                                            if "Job No." <> '' then
                                                AddError(StrSubstNo(Text009, FieldCaption("Job No.")));
                                        end;
                                    "Bal. Account Type"::"Bank Account":
                                        begin
                                            if "Bal. Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    Text004,
                                                    FieldCaption("Bal. Gen. Posting Type"), FieldCaption("Bal. Account Type"), "Bal. Account Type"));
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    Text005,
                                                    FieldCaption("Bal. Gen. Bus. Posting Group"), FieldCaption("Bal. Gen. Prod. Posting Group"),
                                                    FieldCaption("Bal. VAT Bus. Posting Group"), FieldCaption("Bal. VAT Prod. Posting Group"),
                                                    FieldCaption("Bal. Account Type"), "Bal. Account Type"));

                                            if "Job No." <> '' then
                                                AddError(StrSubstNo(Text009, FieldCaption("Job No.")));
                                            if (Amount > 0) and ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") then
                                                if not "Check Printed" then
                                                    AddError(StrSubstNo(Text010, FieldCaption("Check Printed")));
                                        end;
                                    "Bal. Account Type"::"Fixed Asset":
                                        TestFixedAsset("Gen. Journal Line");
                                end;

                            if ("Account No." <> '') and
                               not "System-Created Entry" and
                               ("Gen. Posting Type" = "Gen. Posting Type"::" ") and
                               (Amount = 0) and
                               not GenJnlTemplate.Recurring and
                               not "Allow Zero-Amount Posting" and
                               ("Account Type" <> "Account Type"::"Fixed Asset")
                            then
                                WarningIfZeroAmt("Gen. Journal Line");

                            CheckRecurringLine("Gen. Journal Line");
                            CheckAllocations("Gen. Journal Line");

                            if "Posting Date" = 0D then
                                AddError(StrSubstNo(Text002, FieldCaption("Posting Date")))
                            else begin
                                if "Posting Date" <> NormalDate("Posting Date") then
                                    if ("Account Type" <> "Account Type"::"G/L Account") or
                                       ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account")
                                    then
                                        AddError(
                                          StrSubstNo(
                                            Text013, FieldCaption("Posting Date")));

                                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                    if UserId <> '' then
                                        if UserSetup.Get(UserId) then begin
                                            AllowPostingFrom := UserSetup."Allow Posting From";
                                            AllowPostingTo := UserSetup."Allow Posting To";
                                        end;
                                    if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                        AllowPostingFrom := GLSetup."Allow Posting From";
                                        AllowPostingTo := GLSetup."Allow Posting To";
                                    end;
                                    if AllowPostingTo = 0D then
                                        AllowPostingTo := 99991231D;
                                end;
                                if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then
                                    AddError(
                                      StrSubstNo(
                                        Text014, Format("Posting Date")));

                                if "Gen. Journal Batch"."No. Series" <> '' then begin
                                    if NoSeries."Date Order" and ("Posting Date" < LastEntrdDate) then
                                        AddError(Text015);
                                    LastEntrdDate := "Posting Date";
                                end;
                            end;

                            if "Document Date" <> 0D then
                                if ("Document Date" <> NormalDate("Document Date")) and
                                   (("Account Type" <> "Account Type"::"G/L Account") or
                                    ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account"))
                                then
                                    AddError(
                                      StrSubstNo(
                                        Text013, FieldCaption("Document Date")));

                            if "Document No." = '' then
                                AddError(StrSubstNo(Text002, FieldCaption("Document No.")))
                            else
                                if "Gen. Journal Batch"."No. Series" <> '' then begin
                                    if (LastEntrdDocNo <> '') and
                                       ("Document No." <> LastEntrdDocNo) and
                                       ("Document No." <> IncStr(LastEntrdDocNo))
                                    then
                                        AddError(Text016);
                                    LastEntrdDocNo := "Document No.";
                                end;

                            // IN0061.begin
                            //TBD
                            /*
                            if ("Job No." <> '') and (not "System-Created Entry") then begin
                                Job.Get("Job No.");
                                if Job."Job Type" = Job."Job Type"::"Capital WIP" then begin
                                    if not ("Job Line Type" in ["Job Line Type"::" ", "Job Line Type"::Schedule]) then begin
                                        AddError(StrSubstNo
                                          (Text16525, FieldCaption("Job Line Type"), "Job Line Type", "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                    if "CWIP G/L Type" = "CWIP G/L Type"::" " then begin
                                        AddError(StrSubstNo
                                          (Text16525, FieldCaption("CWIP G/L Type"), "CWIP G/L Type", "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                    if "Account Type" <> "Account Type"::"G/L Account" then begin
                                        AddError(StrSubstNo
                                          (Text16525, FieldCaption("Account Type"), "Account Type", "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                    if PLA then begin
                                        AddError(StrSubstNo(Text16524, "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                end else begin
                                    if "CWIP G/L Type" <> "CWIP G/L Type"::" " then begin
                                        AddError(StrSubstNo
                                          (Text16525, FieldCaption("CWIP G/L Type"), "CWIP G/L Type", "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                end;
                            end else
                                if (not "System-Created Entry") then begin
                                    if "CWIP G/L Type" <> "CWIP G/L Type"::" " then begin
                                        AddError(StrSubstNo
                                          (Text16525, FieldCaption("CWIP G/L Type"), "CWIP G/L Type", "Journal Template Name", "Journal Batch Name", "Line No."));
                                        exit;
                                    end;
                                end;
                            */
                            // IN0061.end

                            if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset"]) and
                               ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset"])
                            then
                                AddError(
                                  StrSubstNo(
                                    Text017,
                                    FieldCaption("Account Type"), FieldCaption("Bal. Account Type")));

                            if Amount * "Amount (LCY)" < 0 then
                                AddError(
                                  StrSubstNo(
                                    Text008, FieldCaption("Amount (LCY)"), FieldCaption(Amount)));

                            if ("Account Type" = "Account Type"::"G/L Account") and
                               ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")
                            then
                                if "Applies-to Doc. No." <> '' then
                                    AddError(StrSubstNo(Text009, FieldCaption("Applies-to Doc. No.")));

                            if (("Account Type" = "Account Type"::"G/L Account") and
                                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) or
                               ("Document Type" <> "Document Type"::Invoice)
                            then
                                if PaymentTerms.Get("Payment Terms Code") then begin
                                    if ("Document Type" = "Document Type"::"Credit Memo") and
                                       (not PaymentTerms."Calc. Pmt. Disc. on Cr. Memos")
                                    then begin
                                        if "Pmt. Discount Date" <> 0D then
                                            AddError(StrSubstNo(Text009, FieldCaption("Pmt. Discount Date")));
                                        if "Payment Discount %" <> 0 then
                                            AddError(StrSubstNo(Text018, FieldCaption("Payment Discount %")));
                                    end;
                                end else begin
                                    if "Pmt. Discount Date" <> 0D then
                                        AddError(StrSubstNo(Text009, FieldCaption("Pmt. Discount Date")));
                                    if "Payment Discount %" <> 0 then
                                        AddError(StrSubstNo(Text018, FieldCaption("Payment Discount %")));
                                end;

                            if (("Account Type" = "Account Type"::"G/L Account") and
                                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) or
                               ("Applies-to Doc. No." <> '')
                            then
                                if "Applies-to ID" <> '' then
                                    AddError(StrSubstNo(Text009, FieldCaption("Applies-to ID")));

                            if ("Account Type" <> "Account Type"::"Bank Account") and
                               ("Bal. Account Type" <> "Bal. Account Type"::"Bank Account")
                            then
                                if GenJnlLine2."Bank Payment Type" > 0 then
                                    AddError(StrSubstNo(Text009, FieldCaption("Bank Payment Type")));

                            if ("Account No." <> '') and ("Bal. Account No." <> '') then begin
                                PurchPostingType := false;
                                SalesPostingType := false;
                            end;
                            if "Account No." <> '' then
                                case "Account Type" of
                                    "Account Type"::"G/L Account":
                                        CheckGLAcc("Gen. Journal Line", AccName);
                                    "Account Type"::Customer:
                                        CheckCust("Gen. Journal Line", AccName);
                                    "Account Type"::Vendor:
                                        CheckVend("Gen. Journal Line", AccName);
                                    "Account Type"::"Bank Account":
                                        CheckBankAcc("Gen. Journal Line", AccName);
                                    "Account Type"::"Fixed Asset":
                                        CheckFixedAsset("Gen. Journal Line", AccName);
                                    "Account Type"::"IC Partner":
                                        CheckICPartner("Gen. Journal Line", AccName);
                                end;
                            if "Bal. Account No." <> '' then begin
                                ExchAccGLJnlLine.Run("Gen. Journal Line");
                                case "Account Type" of
                                    "Account Type"::"G/L Account":
                                        CheckGLAcc("Gen. Journal Line", BalAccName);
                                    "Account Type"::Customer:
                                        CheckCust("Gen. Journal Line", BalAccName);
                                    "Account Type"::Vendor:
                                        CheckVend("Gen. Journal Line", BalAccName);
                                    "Account Type"::"Bank Account":
                                        CheckBankAcc("Gen. Journal Line", BalAccName);
                                    "Account Type"::"Fixed Asset":
                                        CheckFixedAsset("Gen. Journal Line", BalAccName);
                                    "Account Type"::"IC Partner":
                                        CheckICPartner("Gen. Journal Line", AccName);
                                end;
                                ExchAccGLJnlLine.Run("Gen. Journal Line");
                            end;

                            if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                                AddError(DimMgt.GetDimCombErr);

                            TableID[1] := DimMgt.TypeToTableID1("Account Type");
                            No[1] := "Account No.";
                            TableID[2] := DimMgt.TypeToTableID1("Bal. Account Type");
                            No[2] := "Bal. Account No.";
                            TableID[3] := DATABASE::Job;
                            No[3] := "Job No.";
                            TableID[4] := DATABASE::"Salesperson/Purchaser";
                            No[4] := "Salespers./Purch. Code";
                            TableID[5] := DATABASE::Campaign;
                            No[5] := "Campaign No.";
                            if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                                AddError(DimMgt.GetDimValuePostingErr);
                        end;

                        //TBD
                        /*
                        if "TDS Nature of Deduction" <> '' then
                            TDSAmount += "Total TDS/TCS Incl. SHE CESS";

                        if "TCS Nature of Collection" <> '' then
                            TCSAmount += "Total TDS/TCS Incl. SHE CESS";
                        */

                        TCSEntry.Reset;
                        TCSEntry.SetRange("Document Type", "Applies-to Doc. Type");
                        TCSEntry.SetRange("Document No.", "Applies-to Doc. No.");
                        if TCSEntry.FindFirst then
                            repeat
                                TCSAmountApplied += TCSEntry."TCS Amount" + TCSEntry."Surcharge Amount" + TCSEntry."eCESS Amount" + TCSEntry."SHE Cess Amount";
                            until (TCSEntry.Next = 0);

                        //  ExciseCenvatClaim.GET("Journal Template Name","Journal Batch Name","Line No.");  //Original Code
                        //TBD
                        /*
                        if ExciseCenvatClaim.Get("Journal Template Name", "Journal Batch Name", "Line No.") then begin  //Bugfix
                            ServiceTaxBuffer.Reset;
                            //TBD //ServiceTaxBuffer.SetCurrentKey("Document No.", "Same Group Set Off");
                            ServiceTaxBuffer.SetRange("Document No.", "Document No.");                            
                            ServiceTaxBuffer.SetFilter("Service Tax Group Code", '<>%1', '');
                            ServiceTaxBuffer.CalcSums("Credit Availed", "Credit Availed (eCess)", "Credit Availed (SHECess)");
                            
                            if (ExciseCenvatClaim."ST BED Amount" + ExciseCenvatClaim."ST AED(GSI) Amount" + ExciseCenvatClaim."ST AED(TTA) Amount" +
                              ExciseCenvatClaim."ST SED Amount" + ExciseCenvatClaim."ST SAED Amount" + ExciseCenvatClaim."ST NCCD Amount" +
                              ExciseCenvatClaim."ST eCESS Amount" + ExciseCenvatClaim."ST ADET Amount" + ExciseCenvatClaim."ST ADE Amount" +
                              ExciseCenvatClaim."ST SHECess Amount") <> (ServiceTaxBuffer."Credit Availed" +
                              ServiceTaxBuffer."Credit Availed (eCess)" + ServiceTaxBuffer."Credit Availed (SHECess)")
                            then
                                AddError(Text16522);
                        end;  //Bugfix
                        */
                        CheckBalance;

                        ShowVoucherValidations("Gen. Journal Line");
                        CheckDirectServiceTax("Gen. Journal Line");

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", "Journal Template Name");
                        GenJournalLine.SetRange("Journal Batch Name", "Journal Batch Name");
                        GenJournalLine.SetRange("Document No.", "Document No.");
                        GenJournalLine.SetFilter("Account Type", '%1|%2', "Account Type"::"Bank Account",
                          "Account Type"::"G/L Account");
                        //TBD //GenJournalLine.SetFilter("Bal. TDS/TCS Including SHECESS", '=%1', 0);
                        GenJournalLine.SetFilter(Amount, '<0');
                        if GenJournalLine.FindFirst then
                            if (GenJournalLine.Count > 1) and CheckTDSAmount("Gen. Journal Line") then
                                AddError(StrSubstNo(Text16526, GenJournalLine."Document No."));

                        //TBD
                        /*
                        if ("Party Type" = "Party Type"::Party) and ("Document Type" <> "Document Type"::Payment) and
                          ("TDS Nature of Deduction" <> '') then
                            AddError(Text16523);
                        */

                        AmountLCY += "Amount (LCY)";
                        BalanceLCY += "Balance (LCY)";

                        //TBD
                        /*
                        JnlBankCharges.Reset;
                        JnlBankCharges.SetRange("Journal Template Name", "Journal Template Name");
                        JnlBankCharges.SetRange("Journal Batch Name", "Journal Batch Name");
                        JnlBankCharges.SetRange("Line No.", "Line No.");
                        JnlBankCharges.CalcSums("Amount (LCY)");
                        BankChargeAmt := BankChargeAmt + JnlBankCharges."Amount (LCY)";
                        */

                        //TEAM::1426
                        Narration := '';
                        GenLineNarration.Reset;
                        GenLineNarration.SetRange(GenLineNarration."Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                        GenLineNarration.SetRange(GenLineNarration."Journal Batch Name", "Gen. Journal Line"."Journal Batch Name");
                        GenLineNarration.SetRange(GenLineNarration."Gen. Journal Line No.", "Gen. Journal Line"."Line No.");
                        GenLineNarration.SetRange(GenLineNarration."Document No.", "Gen. Journal Line"."Document No.");
                        if GenLineNarration.Find('-') then begin
                            repeat
                                Narration := Narration + ' ' + GenLineNarration.Narration;
                            until
                            GenLineNarration.Next = 0;
                        end
                        else
                            Narration := '';
                        GenLineNarration.Reset;
                        GenLineNarration.SetRange(GenLineNarration."Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                        GenLineNarration.SetRange(GenLineNarration."Journal Batch Name", "Gen. Journal Line"."Journal Batch Name");
                        GenLineNarration.SetRange(GenLineNarration."Document No.", "Gen. Journal Line"."Document No.");
                        GenLineNarration.SetRange(GenLineNarration."Gen. Journal Line No.", 0);
                        if GenLineNarration.Find('-') then begin
                            repeat
                                Narration := Narration + ' ' + GenLineNarration.Narration;
                            until
                            GenLineNarration.Next = 0;
                        end;

                        GlAccountRec.Reset;
                        GlAccountRec.SetRange("No.", "Gen. Journal Line"."Bal. Account No.");
                        if GlAccountRec.FindFirst then
                            BalAccName1 := GlAccountRec.Name;
                    end;

                    trigger OnPreDataItem()
                    begin

                        CopyFilter("Journal Template Name", "Gen. Journal Batch"."Journal Template Name");
                        CopyFilter("Journal Batch Name", "Gen. Journal Batch".Name);
                        GenJnlLineFilter := GetFilters;

                        GenJnlTemplate.Get("Gen. Journal Batch"."Journal Template Name");
                        if GenJnlTemplate.Recurring then begin
                            if GetFilter("Posting Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    Text000,
                                    FieldCaption("Posting Date")));
                            SetRange("Posting Date", 0D, WorkDate);
                            if GetFilter("Expiration Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    Text000,
                                    FieldCaption("Expiration Date")));
                            SetFilter("Expiration Date", '%1 | %2..', 0D, WorkDate);
                        end;

                        if "Gen. Journal Batch"."No. Series" <> '' then begin
                            NoSeries.Get("Gen. Journal Batch"."No. Series");
                            LastEntrdDocNo := '';
                            LastEntrdDate := 0D;
                        end;

                        CurrentCustomerVendors := 0;
                        VATEntryCreated := false;

                        GenJnlLine2.Reset;
                        GenJnlLine2.CopyFilters("Gen. Journal Line");

                        GLAccNetChange.DeleteAll;
                        //TBD //CurrReport.CreateTotals("Amount (LCY)", "Balance (LCY)", "Work Tax Amount", "Total TDS/TCS Incl. SHE CESS");
                        TDSAmount := 0;
                        TCSAmount := 0;
                        BankChargeAmt := 0;


                    end;
                }
                dataitem(ReconcileLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(GLAccNetChange__No__; GLAccNetChange."No.")
                    {
                    }
                    column(GLAccNetChange_Name; GLAccNetChange.Name)
                    {
                    }
                    column(GLAccNetChange__Net_Change_in_Jnl__; GLAccNetChange."Net Change in Jnl.")
                    {
                    }
                    column(GLAccNetChange__Balance_after_Posting_; GLAccNetChange."Balance after Posting")
                    {
                    }
                    column(ReconciliationCaption; ReconciliationCap)
                    {
                    }
                    column(GLAccNetChange__No__Caption; GLAccNetChange__No__Cap)
                    {
                    }
                    column(GLAccNetChange_NameCaption; GLAccNetChange_NameCap)
                    {
                    }
                    column(GLAccNetChange__Net_Change_in_Jnl__Caption; GLAccNetChange__Net_Change_in_Jnl__Cap)
                    {
                    }
                    column(GLAccNetChange__Balance_after_Posting_Caption; GLAccNetChange__Balance_after_Posting_Cap)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if Number = 1 then
                            GLAccNetChange.Find('-')
                        else
                            GLAccNetChange.Next;
                    end;

                    trigger OnPostDataItem()
                    begin
                        GLAccNetChange.DeleteAll;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, GLAccNetChange.Count);
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.PageNo := 1;
            end;

            trigger OnPreDataItem()
            begin
                GLSetup.Get;
                SalesSetup.Get;
                PurchSetup.Get;
                AmountLCY := 0;
                BalanceLCY := 0;
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
                    field(ShowDim; ShowDim)
                    {
                        Caption = 'Show Dimensions';
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
        "Gen. Journal Line".CopyFilter("Journal Template Name", "Gen. Journal Batch"."Journal Template Name");
        "Gen. Journal Line".CopyFilter("Journal Batch Name", "Gen. Journal Batch".Name);
        GenJnlLineFilter := "Gen. Journal Line".GetFilters;
    end;

    var
        Text000: Label '%1 cannot be filtered when you post recurring journals.';
        Text001: Label '%1 or %2 must be specified.';
        Text002: Label '%1 must be specified.';
        Text003: Label '%1 + %2 must be %3.';
        Text004: Label '%1 must be " " when %2 is %3.';
        Text005: Label '%1, %2, %3 or %4 must not be completed when %5 is %6.';
        Text006: Label '%1 must be negative.';
        Text007: Label '%1 must be positive.';
        Text008: Label '%1 must have the same sign as %2.';
        Text009: Label '%1 cannot be specified.';
        Text010: Label '%1 must be Yes.';
        Text011: Label '%1 + %2 must be -%3.';
        Text012: Label '%1 must have a different sign than %2.';
        Text013: Label '%1 must only be a closing date for G/L entries.';
        Text014: Label '%1 is not within your allowed range of posting dates.';
        Text015: Label 'The lines are not listed according to Posting Date because they were not entered in that order.';
        Text016: Label 'There is a gap in the number series.';
        Text017: Label '%1 or %2 must be G/L Account or Bank Account.';
        Text018: Label '%1 must be 0.';
        Text019: Label '%1 cannot be specified when using recurring journals.';
        Text020: Label '%1 must not be %2 when %3 = %4.';
        Text021: Label 'Allocations can only be used with recurring journals.';
        Text022: Label 'Please specify %1 in the %2 allocation lines.';
        Text023: Label '<Month Text>';
        Text024: Label '%1 %2 posted on %3, must be separated by an empty line';
        Text025: Label '%1 %2 is out of balance by %3.';
        Text026: Label 'The reversing entries for %1 %2 are out of balance by %3.';
        Text027: Label 'As of %1, the lines are out of balance by %2.';
        Text028: Label 'As of %1, the reversing entries are out of balance by %2.';
        Text029: Label 'The total of the lines is out of balance by %1.';
        Text030: Label 'The total of the reversing entries is out of balance by %1.';
        Text031: Label '%1 %2 does not exist.';
        Text032: Label '%1 must be %2 for %3 %4.';
        Text036: Label '%1 %2 %3 does not exist.';
        Text037: Label '%1 must be %2.';
        Text038: Label 'The currency %1 cannot be found. Please check the currency table.';
        Text039: Label 'Sales %1 %2 already exists.';
        Text040: Label 'Purchase %1 %2 already exists.';
        Text041: Label '%1 must be entered.';
        Text042: Label '%1 must not be filled when %2 is different in %3 and %4.';
        Text043: Label '%1 %2 must not have %3 = %4.';
        Text044: Label '%1 must not be specified in fixed asset journal lines.';
        Text045: Label '%1 must be specified in fixed asset journal lines.';
        Text046: Label '%1 must be different than %2.';
        Text047: Label '%1 and %2 must not both be %3.';
        Text048: Label '%1  must not be specified when %2 = %3.';
        Text049: Label '%1 must not be specified when %2 = %3.';
        Text050: Label 'must not be specified together with %1 = %2.';
        Text051: Label '%1 must be identical to %2.';
        Text052: Label '%1 cannot be a closing date.';
        Text053: Label '%1 is not within your range of allowed posting dates.';
        Text054: Label 'Insurance integration is not activated for %1 %2.';
        Text055: Label 'must not be specified when %1 is specified.';
        Text056: Label 'When G/L integration is not activated, %1 must not be posted in the general journal.';
        Text057: Label 'When G/L integration is not activated, %1 must not be specified in the general journal.';
        Text058: Label '%1 must not be specified.';
        Text059: Label 'The combination of Customer and Gen. Posting Type Purchase is not allowed.';
        Text060: Label 'The combination of Vendor and Gen. Posting Type Sales is not allowed.';
        Text061: Label 'The Balance and Reversing Balance recurring methods can be used only with Allocations.';
        Text062: Label '%1 must not be 0.';
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        AccountingPeriod: Record "Accounting Period";
        GLAcc: Record "G/L Account";
        Currency: Record Currency;
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAccPostingGr: Record "Bank Account Posting Group";
        BankAcc: Record "Bank Account";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlLine2: Record "Gen. Journal Line";
        TempGenJnlLine: Record "Gen. Journal Line" temporary;
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        OldCustLedgEntry: Record "Cust. Ledger Entry";
        OldVendLedgEntry: Record "Vendor Ledger Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        NoSeries: Record "No. Series";
        FA: Record "Fixed Asset";
        ICPartner: Record "IC Partner";
        DeprBook: Record "Depreciation Book";
        FADeprBook: Record "FA Depreciation Book";
        FASetup: Record "FA Setup";
        GLAccNetChange: Record "G/L Account Net Change" temporary;
        DimSetEntry: Record "Dimension Set Entry";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine3: Record "Gen. Journal Line";
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
        GenJnlLineFilter: Text[250];
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        AllowFAPostingFrom: Date;
        AllowFAPostingTo: Date;
        LastDate: Date;
        LastDocType: Option Document,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder;
        LastDocNo: Code[20];
        LastEntrdDocNo: Code[20];
        LastEntrdDate: Date;
        BalanceLCY: Decimal;
        AmountLCY: Decimal;
        DocBalance: Decimal;
        DocBalanceReverse: Decimal;
        DateBalance: Decimal;
        DateBalanceReverse: Decimal;
        TotalBalance: Decimal;
        TotalBalanceReverse: Decimal;
        AccName: Text[50];
        LastLineNo: Integer;
        GLDocNo: Code[20];
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        AmountError: Boolean;
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        TempErrorText: Text[250];
        BalAccName: Text[50];
        CurrentCustomerVendors: Integer;
        VATEntryCreated: Boolean;
        CustPosting: Boolean;
        VendPosting: Boolean;
        SalesPostingType: Boolean;
        PurchPostingType: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowDim: Boolean;
        Continue: Boolean;
        Text063: Label 'Document,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        Text064: Label '%1 %2 is already used in line %3 (%4 %5).';
        Text065: Label '%1 must not be blocked with type %2 when %3 is %4';
        CurrentICPartner: Code[20];
        Text066: Label 'You cannot enter G/L Account or Bank Account in both %1 and %2.';
        Text067: Label '%1 %2 is linked to %3 %4.';
        Text069: Label '%1 must not be specified when %2 is %3.';
        Text070: Label '%1 must not be specified when the document is not an intercompany transaction.';
        Text071: Label '%1 %2 does not exist.';
        Text072: Label '%1 must not be %2 for %3 %4.';
        Text073: Label '%1 %2 already exists.';
        TDSAmount: Decimal;
        TCSAmount: Decimal;
        TCSEntry: Record "TCS Entry";
        TCSAmountApplied: Decimal;
        Text16500: Label 'Account No. %1 is not defined as cash account for the Voucher Sub Type %2 and Document No.%3.';
        Text16501: Label 'Account No. %1 is not defined as bank account for the Voucher Sub Type %2 and Document No.%3.';
        Text16502: Label 'Account Type or Bal. Account Type can only be G/L Account or Bank Account for Sub Voucher Type %1 and Document No.%2.';
        Text16503: Label 'Cash Account No. %1 should not be used for Sub Voucher Type %2 and Document No.%3.';
        Text16504: Label 'Bal. Account Type should not be Bank Account for Document No.%1.';
        Text16505: Label 'Cash Account No. %1 cannot be credited for the Voucher Type %2 and Document No.%3.';
        Text16506: Label 'Account Type should not be Bank Account for Document No.%1.';
        Text16507: Label 'Cash Account No. %1 cannot be debited for the Voucher Type %2 and Document No.%3.';
        Text16508: Label 'Account Type must be G/L Account in Gen. Journal Line Journal Template Name=%1,Journal Batch Name=%2,Line No.=%3.';
        Text16509: Label 'Bal. Account Type must be G/L Account in Gen. Journal Line Journal Template Name=%1,Journal Batch Name=%2,Line No.=%3.';
        Text16510: Label 'Account Type must be Bank Account in Gen. Journal Line Journal Template Name=%1,Journal Batch Name=%2,Line No.=%3.';
        Text16511: Label 'Bal. Account Type must be Bank Account in Gen. Journal Line Journal Template Name=%1,Journal Batch Name=%2,Line No.=%3.';
        Text16512: Label 'Service Tax Type = Charge not allowed for Template=%1, Batch=%2 and Line No.=%3.';
        Text16513: Label 'Both Account No. and Bal. Account No. are not services account for Journal Template Name = %1,\Journal batch Name = %2,  Line No. = %3.';
        Text16514: Label 'Both Account No. and Bal. Account No. cannot be services account for Journal Template Name = %1,\Journal batch Name = %2,  Line No. = %3.';
        Text16515: Label 'Amount must be positive for Journal Template Name = %1,\Journal batch Name = %2,  Line No. = %3.';
        Text16516: Label 'Amount must be negative for Journal Template Name = %1,\Journal batch Name = %2,  Line No. = %3.';
        Text16517: Label 'Account Type & Bal. Account Type combination should be G/L Account - G/L Account or \G/L Account - Bank Account for Journal Template Name = %1,Journal batch Name = %2,  Line No. = %3.';
        Text16518: Label 'TDS/TCS/Service Tax Party Type should be Vendor for Journal Template Name = %1,\Journal Batch Name = %2,  Line No. = %3.';
        Text16519: Label 'TDS/TCS/Service Tax Party should not be blank for Journal Template Name = %1,\Journal Batch Name = %2,  Line No. = %3.';
        Text16520: Label 'TDS/TCS/Service Tax Party = %1 for Journal Template Name = %2,Journal Batch Name = %3,  Line No. = %4.';
        Text16521: Label 'TDS/TCS/Service Tax Party Type should be Customer for Journal Template Name = %1,\Journal Batch Name = %2,  Line No. = %3.';
        Text16522: Label 'Service Tax Credit Availed does not match with the component wise total.';
        Text16523: Label 'Document type should be Payment with party type Party in case of TDS. ';
        Text16524: Label 'PLA must be FALSE in Gen. Journal Line Journal Template Name=%1,Journal Batch Name=%2,Line No.=%3.';
        Text16525: Label '%1 must not be %2 in Gen. Journal Line Journal Template Name=%3,Journal Batch Name=%4,Line No.=%5.';
        GenJournalLine: Record "Gen. Journal Line";
        Text16526: Label 'You must specify only one credit entry for Document No = %1.';
        BankChargeAmt: Decimal;
        General_Journal___TestCap: Label 'General Journal - Test';
        CurrReport_PAGENOCap: Label 'Page';
        Gen__Journal_Batch__NameCap: Label 'Journal Batch';
        Gen__Journal_Line__Posting_Date_Cap: Label 'Posting Date';
        Gen__Journal_Line__Document_Type_Cap: Label 'Document Type';
        Gen__Journal_Line__Account_Type_Cap: Label 'Account Type';
        AccNameCap: Label 'Name';
        Gen__Journal_Line__Gen__Posting_Type_Cap: Label 'Gen. Posting Type';
        Gen__Journal_Line__Gen__Bus__Posting_Group_Cap: Label 'Gen. Bus. Posting Group';
        Gen__Journal_Line__Gen__Prod__Posting_Group_Cap: Label 'Gen. Prod. Posting Group';
        Gen__Journal_Line__Amount__LCY__Cap: Label 'Total (LCY)';
        TDS_Amount_Including_eCessCap: Label 'TDS Amount Including eCess';
        Work_Tax_AmountCap: Label 'Work Tax Amount';
        TCS_AmountCap: Label 'TCS Amount';
        TCS_Amount__Applied_Cap: Label 'TCS Amount (Applied)';
        Bank_ChargesCap: Label 'Bank Charges';
        DimensionsCap: Label 'Dimensions';
        ErrorText_Number_Cap: Label 'Warning!';
        ReconciliationCap: Label 'Reconciliation';
        GLAccNetChange__No__Cap: Label 'No.';
        GLAccNetChange_NameCap: Label 'Name';
        GLAccNetChange__Net_Change_in_Jnl__Cap: Label 'Net Change in Jnl.';
        GLAccNetChange__Balance_after_Posting_Cap: Label 'Balance after Posting';
        Narration: Text[1024];
        GenLineNarration: Record "Gen. Journal Narration";
        BalAccName1: Text[50];
        GlAccountRec: Record "G/L Account";
        GenJounalRec: Record "Gen. Journal Line";

    local procedure CheckRecurringLine(GenJnlLine2: Record "Gen. Journal Line")
    begin
        with GenJnlLine2 do
            if GenJnlTemplate.Recurring then begin
                if "Recurring Method" = 0 then
                    AddError(StrSubstNo(Text002, FieldCaption("Recurring Method")));
                if Format("Recurring Frequency") = '' then
                    AddError(StrSubstNo(Text002, FieldCaption("Recurring Frequency")));
                if "Bal. Account No." <> '' then
                    AddError(
                      StrSubstNo(
                        Text019,
                        FieldCaption("Bal. Account No.")));
                case "Recurring Method" of
                    "Recurring Method"::"V  Variable", "Recurring Method"::"RV Reversing Variable",
                  "Recurring Method"::"F  Fixed", "Recurring Method"::"RF Reversing Fixed":
                        WarningIfZeroAmt("Gen. Journal Line");
                    "Recurring Method"::"B  Balance", "Recurring Method"::"RB Reversing Balance":
                        WarningIfNonZeroAmt("Gen. Journal Line");
                end;
                if "Recurring Method" > "Recurring Method"::"V  Variable" then begin
                    if "Account Type" = "Account Type"::"Fixed Asset" then
                        AddError(
                          StrSubstNo(
                            Text020,
                            FieldCaption("Recurring Method"), "Recurring Method",
                            FieldCaption("Account Type"), "Account Type"));
                    if "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" then
                        AddError(
                          StrSubstNo(
                            Text020,
                            FieldCaption("Recurring Method"), "Recurring Method",
                            FieldCaption("Bal. Account Type"), "Bal. Account Type"));
                end;
            end else begin
                if "Recurring Method" <> 0 then
                    AddError(StrSubstNo(Text009, FieldCaption("Recurring Method")));
                if Format("Recurring Frequency") <> '' then
                    AddError(StrSubstNo(Text009, FieldCaption("Recurring Frequency")));
            end;
    end;

    local procedure CheckAllocations(GenJnlLine2: Record "Gen. Journal Line")
    begin
        with GenJnlLine2 do begin
            if "Recurring Method" in
               ["Recurring Method"::"B  Balance",
                "Recurring Method"::"RB Reversing Balance"]
            then begin
                GenJnlAlloc.Reset;
                GenJnlAlloc.SetRange("Journal Template Name", "Journal Template Name");
                GenJnlAlloc.SetRange("Journal Batch Name", "Journal Batch Name");
                GenJnlAlloc.SetRange("Journal Line No.", "Line No.");
                if not GenJnlAlloc.FindFirst then
                    AddError(Text061);
            end;

            GenJnlAlloc.Reset;
            GenJnlAlloc.SetRange("Journal Template Name", "Journal Template Name");
            GenJnlAlloc.SetRange("Journal Batch Name", "Journal Batch Name");
            GenJnlAlloc.SetRange("Journal Line No.", "Line No.");
            GenJnlAlloc.SetFilter(Amount, '<>0');
            if GenJnlAlloc.FindFirst then
                if not GenJnlTemplate.Recurring then
                    AddError(Text021)
                else begin
                    GenJnlAlloc.SetRange("Account No.", '');
                    if GenJnlAlloc.FindFirst then
                        AddError(
                          StrSubstNo(
                            Text022,
                            GenJnlAlloc.FieldCaption("Account No."), GenJnlAlloc.Count));
                end;
        end;
    end;

    local procedure MakeRecurringTexts(var GenJnlLine2: Record "Gen. Journal Line")
    begin
        with GenJnlLine2 do begin
            GLDocNo := "Document No.";
            if ("Posting Date" <> 0D) and ("Account No." <> '') and ("Recurring Method" <> 0) then begin
                Day := Date2DMY("Posting Date", 1);
                Week := Date2DWY("Posting Date", 2);
                Month := Date2DMY("Posting Date", 2);
                MonthText := Format("Posting Date", 0, Text023);
                AccountingPeriod.SetRange("Starting Date", 0D, "Posting Date");
                if not AccountingPeriod.FindLast then
                    AccountingPeriod.Name := '';
                "Document No." :=
                  DelChr(
                    PadStr(
                      StrSubstNo("Document No.", Day, Week, Month, MonthText, AccountingPeriod.Name),
                      MaxStrLen("Document No.")),
                    '>');
                // Description :=
                //   DelChr(
                //     PadStr(
                //       StrSubstNo(Description, Day, Week, Month, MonthText, AccountingPeriod.Name),
                //       MaxStrLen(Description)),
                //     '>');
                "Description 3 " :=
                  DelChr(
                    PadStr(
                      StrSubstNo("Description 3 ", Day, Week, Month, MonthText, AccountingPeriod.Name),
                      MaxStrLen("Description 3 ")),
                    '>');
            end;
        end;
    end;

    local procedure CheckBalance()
    var
        GenJnlLine: Record "Gen. Journal Line";
        NextGenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine := "Gen. Journal Line";
        LastLineNo := "Gen. Journal Line"."Line No.";
        NextGenJnlLine := "Gen. Journal Line";
        if NextGenJnlLine.Next = 0 then;
        MakeRecurringTexts(NextGenJnlLine);
        with GenJnlLine do
            if not EmptyLine then begin
                DocBalance := DocBalance + "Balance (LCY)";
                DateBalance := DateBalance + "Balance (LCY)";
                TotalBalance := TotalBalance + "Balance (LCY)";
                if "Recurring Method" >= "Recurring Method"::"RF Reversing Fixed" then begin
                    DocBalanceReverse := DocBalanceReverse + "Balance (LCY)";
                    DateBalanceReverse := DateBalanceReverse + "Balance (LCY)";
                    TotalBalanceReverse := TotalBalanceReverse + "Balance (LCY)";
                end;
                LastDocType := "Document Type";
                LastDocNo := "Document No.";
                LastDate := "Posting Date";
                if TotalBalance = 0 then begin
                    CurrentCustomerVendors := 0;
                    VATEntryCreated := false;
                end;
                if GenJnlTemplate."Force Doc. Balance" then begin
                    VATEntryCreated :=
                      VATEntryCreated or
                      (("Account Type" = "Account Type"::"G/L Account") and ("Account No." <> '') and
                       ("Gen. Posting Type" in ["Gen. Posting Type"::Purchase, "Gen. Posting Type"::Sale])) or
                      (("Bal. Account Type" = "Bal. Account Type"::"G/L Account") and ("Bal. Account No." <> '') and
                       ("Bal. Gen. Posting Type" in ["Bal. Gen. Posting Type"::Purchase, "Bal. Gen. Posting Type"::Sale]));
                    if (("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor]) and
                        ("Account No." <> '')) or
                       (("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor]) and
                        ("Bal. Account No." <> ''))
                    then
                        CurrentCustomerVendors := CurrentCustomerVendors + 1;
                    if (CurrentCustomerVendors > 1) and VATEntryCreated then
                        AddError(
                          StrSubstNo(
                            Text024,
                            "Document Type", "Document No.", "Posting Date"));
                end;
            end;

        with NextGenJnlLine do begin
            if (LastDate <> 0D) and (LastDocNo <> '') and
               (("Posting Date" <> LastDate) or
                ("Document Type" <> LastDocType) or
                ("Document No." <> LastDocNo) or
                ("Line No." = LastLineNo))
            then begin
                if GenJnlTemplate."Force Doc. Balance" then begin
                    case true of
                        DocBalance <> 0:
                            AddError(
                              StrSubstNo(
                                Text025,
                                SelectStr(LastDocType + 1, Text063), LastDocNo, DocBalance));
                        DocBalanceReverse <> 0:
                            AddError(
                              StrSubstNo(
                                Text026,
                                SelectStr(LastDocType + 1, Text063), LastDocNo, DocBalanceReverse));
                    end;
                    DocBalance := 0;
                    DocBalanceReverse := 0;
                end;
                if ("Posting Date" <> LastDate) or
                   ("Document Type" <> LastDocType) or ("Document No." <> LastDocNo)
                then begin
                    CurrentCustomerVendors := 0;
                    VATEntryCreated := false;
                    CustPosting := false;
                    VendPosting := false;
                    SalesPostingType := false;
                    PurchPostingType := false;
                end;
            end;

            if (LastDate <> 0D) and (("Posting Date" <> LastDate) or ("Line No." = LastLineNo)) then begin
                case true of
                    DateBalance <> 0:
                        AddError(
                          StrSubstNo(
                            Text027,
                            LastDate, DateBalance));
                    DateBalanceReverse <> 0:
                        AddError(
                          StrSubstNo(
                            Text028,
                            LastDate, DateBalanceReverse));
                end;
                DocBalance := 0;
                DocBalanceReverse := 0;
                DateBalance := 0;
                DateBalanceReverse := 0;
            end;

            if "Line No." = LastLineNo then begin
                case true of
                    TotalBalance <> 0:
                        AddError(
                          StrSubstNo(
                            Text029,
                            TotalBalance));
                    TotalBalanceReverse <> 0:
                        AddError(
                          StrSubstNo(
                            Text030,
                            TotalBalanceReverse));
                end;
                DocBalance := 0;
                DocBalanceReverse := 0;
                DateBalance := 0;
                DateBalanceReverse := 0;
                TotalBalance := 0;
                TotalBalanceReverse := 0;
                LastDate := 0D;
                LastDocType := 0;
                LastDocNo := '';
            end;
        end;
    end;

    local procedure AddError(Text: Text[250])
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    local procedure ReconcileGLAccNo(GLAccNo: Code[20]; ReconcileAmount: Decimal)
    begin
        if not GLAccNetChange.Get(GLAccNo) then begin
            GLAcc.Get(GLAccNo);
            GLAcc.CalcFields("Balance at Date");
            GLAccNetChange.Init;
            GLAccNetChange."No." := GLAcc."No.";
            GLAccNetChange.Name := GLAcc.Name;
            GLAccNetChange."Balance after Posting" := GLAcc."Balance at Date";
            GLAccNetChange.Insert;
        end;
        GLAccNetChange."Net Change in Jnl." := GLAccNetChange."Net Change in Jnl." + ReconcileAmount;
        GLAccNetChange."Balance after Posting" := GLAccNetChange."Balance after Posting" + ReconcileAmount;
        GLAccNetChange.Modify;
    end;

    local procedure CheckGLAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not GLAcc.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    GLAcc.TableCaption, "Account No."))
            else begin
                AccName := GLAcc.Name;

                if GLAcc.Blocked then
                    AddError(
                      StrSubstNo(
                        Text032,
                        GLAcc.FieldCaption(Blocked), false, GLAcc.TableCaption, "Account No."));
                if GLAcc."Account Type" <> GLAcc."Account Type"::Posting then begin
                    GLAcc."Account Type" := GLAcc."Account Type"::Posting;
                    AddError(
                      StrSubstNo(
                        Text032,
                        GLAcc.FieldCaption("Account Type"), GLAcc."Account Type", GLAcc.TableCaption, "Account No."));
                end;
                if not "System-Created Entry" then
                    if "Posting Date" = NormalDate("Posting Date") then
                        if not GLAcc."Direct Posting" then
                            AddError(
                              StrSubstNo(
                                Text032,
                                GLAcc.FieldCaption("Direct Posting"), true, GLAcc.TableCaption, "Account No."));

                if "Gen. Posting Type" > 0 then begin
                    case "Gen. Posting Type" of
                        "Gen. Posting Type"::Sale:
                            SalesPostingType := true;
                        "Gen. Posting Type"::Purchase:
                            PurchPostingType := true;
                    end;
                    TestPostingType;

                    if not VATPostingSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then
                        AddError(
                          StrSubstNo(
                            Text036,
                            VATPostingSetup.TableCaption, "VAT Bus. Posting Group", "VAT Prod. Posting Group"))
                    else
                        if "VAT Calculation Type" <> VATPostingSetup."VAT Calculation Type" then
                            AddError(
                              StrSubstNo(
                                Text037,
                                FieldCaption("VAT Calculation Type"), VATPostingSetup."VAT Calculation Type"))
                end;

                if GLAcc."Reconciliation Account" then
                    //TBD //ReconcileGLAccNo("Account No.", Round(("Amount (LCY)" + Abs("Total TDS/TCS Incl. SHE CESS") + Abs("Work Tax Amount")) /
                    ReconcileGLAccNo("Account No.", Round(("Amount (LCY)") / //3k-UPG
                      (1 + "VAT %" / 100)));
            end;
    end;

    local procedure CheckCust(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not Cust.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    Cust.TableCaption, "Account No."))
            else begin
                AccName := Cust.Name;
                if ((Cust.Blocked = Cust.Blocked::All) or
                    ((Cust.Blocked in [Cust.Blocked::Invoice, Cust.Blocked::Ship]) and
                     ("Document Type" in ["Document Type"::Invoice, "Document Type"::" "]))
                    )
                then
                    AddError(
                      StrSubstNo(
                        Text065,
                        "Account Type", Cust.Blocked, FieldCaption("Document Type"), "Document Type"));
                if "Currency Code" <> '' then
                    if not Currency.Get("Currency Code") then
                        AddError(
                          StrSubstNo(
                            Text038,
                            "Currency Code"));
                if (Cust."IC Partner Code" <> '') and (GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany) then
                    if ICPartner.Get(Cust."IC Partner Code") then begin
                        if ICPartner.Blocked then
                            AddError(
                              StrSubstNo(
                                '%1 %2',
                                StrSubstNo(
                                  Text067,
                                  Cust.TableCaption, "Account No.", ICPartner.TableCaption, "IC Partner Code"),
                                StrSubstNo(
                                  Text032,
                                  ICPartner.FieldCaption(Blocked), false, ICPartner.TableCaption, Cust."IC Partner Code")));
                    end else
                        AddError(
                          StrSubstNo(
                            '%1 %2',
                            StrSubstNo(
                              Text067,
                              Cust.TableCaption, "Account No.", ICPartner.TableCaption, Cust."IC Partner Code"),
                            StrSubstNo(
                              Text031,
                              ICPartner.TableCaption, Cust."IC Partner Code")));
                CustPosting := true;
                TestPostingType;

                if "Recurring Method" = 0 then
                    if "Document Type" in
                       ["Document Type"::Invoice, "Document Type"::"Credit Memo",
                        "Document Type"::"Finance Charge Memo", "Document Type"::Reminder]
                    then begin
                        OldCustLedgEntry.Reset;
                        OldCustLedgEntry.SetCurrentKey("Document No.");
                        OldCustLedgEntry.SetRange("Document Type", "Document Type");
                        OldCustLedgEntry.SetRange("Document No.", "Document No.");
                        if OldCustLedgEntry.FindFirst then
                            AddError(
                              StrSubstNo(
                                Text039, "Document Type", "Document No."));

                        if SalesSetup."Ext. Doc. No. Mandatory" or
                           ("External Document No." <> '')
                        then begin
                            if "External Document No." = '' then
                                AddError(
                                  StrSubstNo(
                                    Text041, FieldCaption("External Document No.")));

                            OldCustLedgEntry.Reset;
                            OldCustLedgEntry.SetCurrentKey("External Document No.");
                            OldCustLedgEntry.SetRange("Document Type", "Document Type");
                            OldCustLedgEntry.SetRange("Customer No.", "Account No.");
                            OldCustLedgEntry.SetRange("External Document No.", "External Document No.");
                            if OldCustLedgEntry.FindFirst then
                                AddError(
                                  StrSubstNo(
                                    Text039,
                                    "Document Type", "External Document No."));
                            CheckAgainstPrevLines("Gen. Journal Line");
                        end;
                    end;
            end;
    end;

    local procedure CheckVend(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not Vend.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    Vend.TableCaption, "Account No."))
            else begin
                AccName := Vend.Name;

                if ((Vend.Blocked = Vend.Blocked::All) or
                    ((Vend.Blocked = Vend.Blocked::Payment) and ("Document Type" = "Document Type"::Payment))
                    )
                then
                    AddError(
                      StrSubstNo(
                        Text065,
                        "Account Type", Vend.Blocked, FieldCaption("Document Type"), "Document Type"));
                if "Currency Code" <> '' then
                    if not Currency.Get("Currency Code") then
                        AddError(
                          StrSubstNo(
                            Text038,
                            "Currency Code"));

                if (Vend."IC Partner Code" <> '') and (GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany) then
                    if ICPartner.Get(Vend."IC Partner Code") then begin
                        if ICPartner.Blocked then
                            AddError(
                              StrSubstNo(
                                '%1 %2',
                                StrSubstNo(
                                  Text067,
                                  Vend.TableCaption, "Account No.", ICPartner.TableCaption, Vend."IC Partner Code"),
                                StrSubstNo(
                                  Text032,
                                  ICPartner.FieldCaption(Blocked), false, ICPartner.TableCaption, Vend."IC Partner Code")));
                    end else
                        AddError(
                          StrSubstNo(
                            '%1 %2',
                            StrSubstNo(
                              Text067,
                              Vend.TableCaption, "Account No.", ICPartner.TableCaption, "IC Partner Code"),
                            StrSubstNo(
                              Text031,
                              ICPartner.TableCaption, Vend."IC Partner Code")));
                VendPosting := true;
                TestPostingType;

                if "Recurring Method" = 0 then
                    if "Document Type" in
                       ["Document Type"::Invoice, "Document Type"::"Credit Memo",
                        "Document Type"::"Finance Charge Memo", "Document Type"::Reminder]
                    then begin
                        OldVendLedgEntry.Reset;
                        OldVendLedgEntry.SetCurrentKey("Document No.");
                        OldVendLedgEntry.SetRange("Document Type", "Document Type");
                        OldVendLedgEntry.SetRange("Document No.", "Document No.");
                        if OldVendLedgEntry.FindFirst then
                            AddError(
                              StrSubstNo(
                                Text040,
                                "Document Type", "Document No."));

                        if PurchSetup."Ext. Doc. No. Mandatory" or
                           ("External Document No." <> '')
                        then begin
                            if "External Document No." = '' then
                                AddError(
                                  StrSubstNo(
                                    Text041, FieldCaption("External Document No.")));

                            OldVendLedgEntry.Reset;
                            OldVendLedgEntry.SetCurrentKey("External Document No.");
                            OldVendLedgEntry.SetRange("Document Type", "Document Type");
                            OldVendLedgEntry.SetRange("Vendor No.", "Account No.");
                            OldVendLedgEntry.SetRange("External Document No.", "External Document No.");
                            if OldVendLedgEntry.FindFirst then
                                AddError(
                                  StrSubstNo(
                                    Text040,
                                    "Document Type", "External Document No."));
                            CheckAgainstPrevLines("Gen. Journal Line");
                        end;
                    end;
            end;
    end;

    local procedure CheckBankAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not BankAcc.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    BankAcc.TableCaption, "Account No."))
            else begin
                AccName := BankAcc.Name;

                if BankAcc.Blocked then
                    AddError(
                      StrSubstNo(
                        Text032,
                        BankAcc.FieldCaption(Blocked), false, BankAcc.TableCaption, "Account No."));
                if ("Currency Code" <> BankAcc."Currency Code") and (BankAcc."Currency Code" <> '') then
                    AddError(
                      StrSubstNo(
                        Text037,
                        FieldCaption("Currency Code"), BankAcc."Currency Code"));

                if "Currency Code" <> '' then
                    if not Currency.Get("Currency Code") then
                        AddError(
                          StrSubstNo(
                            Text038,
                            "Currency Code"));

                if "Bank Payment Type" <> 0 then
                    if ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") and (Amount < 0) then
                        if BankAcc."Currency Code" <> "Currency Code" then
                            AddError(
                              StrSubstNo(
                                Text042,
                                FieldCaption("Bank Payment Type"), FieldCaption("Currency Code"),
                                TableCaption, BankAcc.TableCaption));

                if BankAccPostingGr.Get(BankAcc."Bank Acc. Posting Group") then
                    if BankAccPostingGr."G/L Account No." <> '' then
                        ReconcileGLAccNo(
                          BankAccPostingGr."G/L Account No.",
                          //TBD //Round(("Amount (LCY)" + Abs("Total TDS/TCS Incl. SHE CESS") + Abs("Work Tax Amount")) / (1 + "VAT %" / 100)));
                          Round(("Amount (LCY)") / (1 + "VAT %" / 100))); //3k-UPG
            end;
    end;

    local procedure CheckFixedAsset(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not FA.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    FA.TableCaption, "Account No."))
            else begin
                AccName := FA.Description;
                if FA.Blocked then
                    AddError(
                      StrSubstNo(
                        Text032,
                        FA.FieldCaption(Blocked), false, FA.TableCaption, "Account No."));
                if FA.Inactive then
                    AddError(
                      StrSubstNo(
                        Text032,
                        FA.FieldCaption(Inactive), false, FA.TableCaption, "Account No."));
                if FA."Budgeted Asset" then
                    AddError(
                      StrSubstNo(
                        Text043,
                        FA.TableCaption, "Account No.", FA.FieldCaption("Budgeted Asset"), true));
                if DeprBook.Get("Depreciation Book Code") then
                    CheckFAIntegration(GenJnlLine)
                else
                    AddError(
                      StrSubstNo(
                        Text031,
                        DeprBook.TableCaption, "Depreciation Book Code"));
                if not FADeprBook.Get(FA."No.", "Depreciation Book Code") then
                    AddError(
                      StrSubstNo(
                        Text036,
                        FADeprBook.TableCaption, FA."No.", "Depreciation Book Code"));
            end;
    end;


    procedure CheckICPartner(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        with GenJnlLine do
            if not ICPartner.Get("Account No.") then
                AddError(
                  StrSubstNo(
                    Text031,
                    ICPartner.TableCaption, "Account No."))
            else begin
                AccName := ICPartner.Name;
                if ICPartner.Blocked then
                    AddError(
                      StrSubstNo(
                        Text032,
                        ICPartner.FieldCaption(Blocked), false, ICPartner.TableCaption, "Account No."));
            end;
    end;

    local procedure TestFixedAsset(var GenJnlLine: Record "Gen. Journal Line")
    begin
        with GenJnlLine do begin
            if "Job No." <> '' then
                AddError(
                  StrSubstNo(
                    Text044, FieldCaption("Job No.")));
            if "FA Posting Type" = "FA Posting Type"::" " then
                AddError(
                  StrSubstNo(
                    Text045, FieldCaption("FA Posting Type")));
            if "Depreciation Book Code" = '' then
                AddError(
                  StrSubstNo(
                    Text045, FieldCaption("Depreciation Book Code")));
            if "Depreciation Book Code" = "Duplicate in Depreciation Book" then
                AddError(
                  StrSubstNo(
                    Text046,
                    FieldCaption("Depreciation Book Code"), FieldCaption("Duplicate in Depreciation Book")));
            CheckFADocNo(GenJnlLine);
            if "Account Type" = "Bal. Account Type" then
                AddError(
                  StrSubstNo(
                    Text047,
                    FieldCaption("Account Type"), FieldCaption("Bal. Account Type"), "Account Type"));
            if "Account Type" = "Account Type"::"Fixed Asset" then
                if "FA Posting Type" in
                   ["FA Posting Type"::"Acquisition Cost", "FA Posting Type"::Disposal, "FA Posting Type"::Maintenance]
                then begin
                    if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') then
                        if "Gen. Posting Type" = "Gen. Posting Type"::" " then
                            AddError(StrSubstNo(Text002, FieldCaption("Gen. Posting Type")));
                end else begin
                    if "Gen. Posting Type" <> "Gen. Posting Type"::" " then
                        AddError(
                          StrSubstNo(
                            Text048,
                            FieldCaption("Gen. Posting Type"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                    if "Gen. Bus. Posting Group" <> '' then
                        AddError(
                          StrSubstNo(
                            Text049,
                            FieldCaption("Gen. Bus. Posting Group"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                    if "Gen. Prod. Posting Group" <> '' then
                        AddError(
                          StrSubstNo(
                            Text049,
                            FieldCaption("Gen. Prod. Posting Group"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                end;
            if "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" then
                if "FA Posting Type" in
                   ["FA Posting Type"::"Acquisition Cost", "FA Posting Type"::Disposal, "FA Posting Type"::Maintenance]
                then begin
                    if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') then
                        if "Bal. Gen. Posting Type" = "Bal. Gen. Posting Type"::" " then
                            AddError(StrSubstNo(Text002, FieldCaption("Bal. Gen. Posting Type")));
                end else begin
                    if "Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" " then
                        AddError(
                          StrSubstNo(
                            Text049,
                            FieldCaption("Bal. Gen. Posting Type"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                    if "Bal. Gen. Bus. Posting Group" <> '' then
                        AddError(
                          StrSubstNo(
                            Text049,
                            FieldCaption("Bal. Gen. Bus. Posting Group"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                    if "Bal. Gen. Prod. Posting Group" <> '' then
                        AddError(
                          StrSubstNo(
                            Text049,
                            FieldCaption("Bal. Gen. Prod. Posting Group"), FieldCaption("FA Posting Type"), "FA Posting Type"));
                end;
            TempErrorText :=
              '%1 ' +
              StrSubstNo(
                Text050,
                FieldCaption("FA Posting Type"), "FA Posting Type");
            if "FA Posting Type" <> "FA Posting Type"::"Acquisition Cost" then begin
                if "Depr. Acquisition Cost" then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Depr. Acquisition Cost")));
                if "Salvage Value" <> 0 then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Salvage Value")));
                if "FA Posting Type" <> "FA Posting Type"::Maintenance then
                    if Quantity <> 0 then
                        AddError(StrSubstNo(TempErrorText, FieldCaption(Quantity)));
                if "Insurance No." <> '' then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Insurance No.")));
            end;
            if ("FA Posting Type" = "FA Posting Type"::Maintenance) and "Depr. until FA Posting Date" then
                AddError(StrSubstNo(TempErrorText, FieldCaption("Depr. until FA Posting Date")));
            if ("FA Posting Type" <> "FA Posting Type"::Maintenance) and ("Maintenance Code" <> '') then
                AddError(StrSubstNo(TempErrorText, FieldCaption("Maintenance Code")));

            if ("FA Posting Type" <> "FA Posting Type"::Depreciation) and
               ("FA Posting Type" <> "FA Posting Type"::"Custom 1") and
               ("No. of Depreciation Days" <> 0)
            then
                AddError(StrSubstNo(TempErrorText, FieldCaption("No. of Depreciation Days")));

            if ("FA Posting Type" = "FA Posting Type"::Disposal) and "FA Reclassification Entry" then
                AddError(StrSubstNo(TempErrorText, FieldCaption("FA Reclassification Entry")));

            if ("FA Posting Type" = "FA Posting Type"::Disposal) and ("Budgeted FA No." <> '') then
                AddError(StrSubstNo(TempErrorText, FieldCaption("Budgeted FA No.")));

            if "FA Posting Date" = 0D then
                "FA Posting Date" := "Posting Date";
            if DeprBook.Get("Depreciation Book Code") then
                if DeprBook."Use Same FA+G/L Posting Dates" and ("Posting Date" <> "FA Posting Date") then
                    AddError(
                      StrSubstNo(
                        Text051,
                        FieldCaption("Posting Date"), FieldCaption("FA Posting Date")));
            if "FA Posting Date" <> 0D then begin
                if "FA Posting Date" <> NormalDate("FA Posting Date") then
                    AddError(
                      StrSubstNo(
                        Text052,
                        FieldCaption("FA Posting Date")));
                if not ("FA Posting Date" in [00020101D .. 99981231D]) then
                    AddError(
                      StrSubstNo(
                        Text053,
                        FieldCaption("FA Posting Date")));
                if (AllowFAPostingFrom = 0D) and (AllowFAPostingTo = 0D) then begin
                    if UserId <> '' then
                        if UserSetup.Get(UserId) then begin
                            AllowFAPostingFrom := UserSetup."Allow FA Posting From";
                            AllowFAPostingTo := UserSetup."Allow FA Posting To";
                        end;
                    if (AllowFAPostingFrom = 0D) and (AllowFAPostingTo = 0D) then begin
                        FASetup.Get;
                        AllowFAPostingFrom := FASetup."Allow FA Posting From";
                        AllowFAPostingTo := FASetup."Allow FA Posting To";
                    end;
                    if AllowFAPostingTo = 0D then
                        AllowFAPostingTo := 99981231D;
                end;
                if ("FA Posting Date" < AllowFAPostingFrom) or
                   ("FA Posting Date" > AllowFAPostingTo)
                then
                    AddError(
                      StrSubstNo(
                        Text053,
                        FieldCaption("FA Posting Date")));
            end;
            FASetup.Get;
            if ("FA Posting Type" = "FA Posting Type"::"Acquisition Cost") and
               ("Insurance No." <> '') and ("Depreciation Book Code" <> FASetup."Insurance Depr. Book")
            then
                AddError(
                  StrSubstNo(
                    Text054,
                    FieldCaption("Depreciation Book Code"), "Depreciation Book Code"));

            if "FA Error Entry No." > 0 then begin
                TempErrorText :=
                  '%1 ' +
                  StrSubstNo(
                    Text055,
                    FieldCaption("FA Error Entry No."));
                if "Depr. until FA Posting Date" then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Depr. until FA Posting Date")));
                if "Depr. Acquisition Cost" then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Depr. Acquisition Cost")));
                if "Duplicate in Depreciation Book" <> '' then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Duplicate in Depreciation Book")));
                if "Use Duplication List" then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Use Duplication List")));
                if "Salvage Value" <> 0 then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Salvage Value")));
                if "Insurance No." <> '' then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Insurance No.")));
                if "Budgeted FA No." <> '' then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Budgeted FA No.")));
                if "Recurring Method" > 0 then
                    AddError(StrSubstNo(TempErrorText, FieldCaption("Recurring Method")));
                if "FA Posting Type" = "FA Posting Type"::Maintenance then
                    AddError(StrSubstNo(TempErrorText, "FA Posting Type"));
            end;
        end;
    end;

    local procedure CheckFAIntegration(var GenJnlLine: Record "Gen. Journal Line")
    var
        GLIntegration: Boolean;
    begin
        with GenJnlLine do begin
            if "FA Posting Type" = "FA Posting Type"::" " then
                exit;
            case "FA Posting Type" of
                "FA Posting Type"::"Acquisition Cost":
                    GLIntegration := DeprBook."G/L Integration - Acq. Cost";
                "FA Posting Type"::Depreciation:
                    GLIntegration := DeprBook."G/L Integration - Depreciation";
                "FA Posting Type"::"Write-Down":
                    GLIntegration := DeprBook."G/L Integration - Write-Down";
                "FA Posting Type"::Appreciation:
                    GLIntegration := DeprBook."G/L Integration - Appreciation";
                "FA Posting Type"::"Custom 1":
                    GLIntegration := DeprBook."G/L Integration - Custom 1";
                "FA Posting Type"::"Custom 2":
                    GLIntegration := DeprBook."G/L Integration - Custom 2";
                "FA Posting Type"::Disposal:
                    GLIntegration := DeprBook."G/L Integration - Disposal";
                "FA Posting Type"::Maintenance:
                    GLIntegration := DeprBook."G/L Integration - Maintenance";
            end;
            if not GLIntegration then
                AddError(
                  StrSubstNo(
                    Text056,
                    "FA Posting Type"));

            if not DeprBook."G/L Integration - Depreciation" then begin
                if "Depr. until FA Posting Date" then
                    AddError(
                      StrSubstNo(
                        Text057,
                        FieldCaption("Depr. until FA Posting Date")));
                if "Depr. Acquisition Cost" then
                    AddError(
                      StrSubstNo(
                        Text057,
                        FieldCaption("Depr. Acquisition Cost")));
            end;
        end;
    end;

    local procedure TestFixedAssetFields(var GenJnlLine: Record "Gen. Journal Line")
    begin
        with GenJnlLine do begin
            if "FA Posting Type" <> "FA Posting Type"::" " then
                AddError(StrSubstNo(Text058, FieldCaption("FA Posting Type")));
            if "Depreciation Book Code" <> '' then
                AddError(StrSubstNo(Text058, FieldCaption("Depreciation Book Code")));
        end;
    end;


    procedure TestPostingType()
    begin
        case true of
            CustPosting and PurchPostingType:
                AddError(Text059);
            VendPosting and SalesPostingType:
                AddError(Text060);
        end;
    end;

    local procedure WarningIfNegativeAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        if (GenJnlLine.Amount < 0) and not AmountError then begin
            AmountError := true;
            AddError(StrSubstNo(Text007, GenJnlLine.FieldCaption(Amount)));
        end;
    end;

    local procedure WarningIfPositiveAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        /*
        IF (GenJnlLine.Amount > 0) AND NOT AmountError THEN BEGIN
          AmountError := TRUE;
          AddError(STRSUBSTNO(Text006,GenJnlLine.FIELDCAPTION(Amount)));
        END;
        */

    end;

    local procedure WarningIfZeroAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        if (GenJnlLine.Amount = 0) and not AmountError then begin
            AmountError := true;
            AddError(StrSubstNo(Text002, GenJnlLine.FieldCaption(Amount)));
        end;
    end;

    local procedure WarningIfNonZeroAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        if (GenJnlLine.Amount <> 0) and not AmountError then begin
            AmountError := true;
            AddError(StrSubstNo(Text062, GenJnlLine.FieldCaption(Amount)));
        end;
    end;

    local procedure CheckAgainstPrevLines(GenJnlLine: Record "Gen. Journal Line")
    var
        i: Integer;
        AccType: Integer;
        AccNo: Code[20];
        ErrorFound: Boolean;
    begin
        if (GenJnlLine."External Document No." = '') or
           not (GenJnlLine."Account Type" in
                [GenJnlLine."Account Type"::Customer, GenJnlLine."Account Type"::Vendor]) and
           not (GenJnlLine."Bal. Account Type" in
                [GenJnlLine."Bal. Account Type"::Customer, GenJnlLine."Bal. Account Type"::Vendor])
        then
            exit;

        if GenJnlLine."Account Type" in [GenJnlLine."Account Type"::Customer, GenJnlLine."Account Type"::Vendor] then begin
            AccType := GenJnlLine."Account Type";
            AccNo := GenJnlLine."Account No.";
        end else begin
            AccType := GenJnlLine."Bal. Account Type";
            AccNo := GenJnlLine."Bal. Account No.";
        end;

        TempGenJnlLine.Reset;
        TempGenJnlLine.SetRange("External Document No.", GenJnlLine."External Document No.");

        while (i < 2) and not ErrorFound do begin
            i := i + 1;
            if i = 1 then begin
                TempGenJnlLine.SetRange("Account Type", AccType);
                TempGenJnlLine.SetRange("Account No.", AccNo);
                TempGenJnlLine.SetRange("Bal. Account Type");
                TempGenJnlLine.SetRange("Bal. Account No.");
            end else begin
                TempGenJnlLine.SetRange("Account Type");
                TempGenJnlLine.SetRange("Account No.");
                TempGenJnlLine.SetRange("Bal. Account Type", AccType);
                TempGenJnlLine.SetRange("Bal. Account No.", AccNo);
            end;
            if TempGenJnlLine.FindFirst then begin
                ErrorFound := true;
                AddError(
                  StrSubstNo(
                    Text064, GenJnlLine.FieldCaption("External Document No."), GenJnlLine."External Document No.",
                    TempGenJnlLine."Line No.", GenJnlLine.FieldCaption("Document No."), TempGenJnlLine."Document No."));
            end;
        end;

        TempGenJnlLine.Reset;
        TempGenJnlLine := GenJnlLine;
        TempGenJnlLine.Insert;
    end;


    procedure CheckICDocument()
    var
        GenJnlLine4: Record "Gen. Journal Line";
        "IC G/L Account": Record "IC G/L Account";
    begin
        with "Gen. Journal Line" do
            if GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany then begin
                if ("Posting Date" <> LastDate) or ("Document Type" <> LastDocType) or ("Document No." <> LastDocNo) then begin
                    GenJnlLine4.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                    GenJnlLine4.SetRange("Journal Template Name", "Journal Template Name");
                    GenJnlLine4.SetRange("Journal Batch Name", "Journal Batch Name");
                    GenJnlLine4.SetRange("Posting Date", "Posting Date");
                    GenJnlLine4.SetRange("Document No.", "Document No.");
                    GenJnlLine4.SetFilter("IC Partner Code", '<>%1', '');
                    if GenJnlLine4.FindFirst then
                        CurrentICPartner := GenJnlLine4."IC Partner Code"
                    else
                        CurrentICPartner := '';
                end;
                if (CurrentICPartner <> '') and ("IC Direction" = "IC Direction"::Outgoing) then begin
                    if ("Account Type" in ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) and
                       ("Bal. Account Type" in ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"]) and
                       ("Account No." <> '') and
                       ("Bal. Account No." <> '')
                    then begin
                        AddError(
                          StrSubstNo(
                            Text066, FieldCaption("Account No."), FieldCaption("Bal. Account No.")));
                    end else begin
                        if (("Account Type" in ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) and ("Account No." <> '')) xor
                           (("Bal. Account Type" in ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"]) and
                            ("Bal. Account No." <> ''))
                        then begin
                            if "IC Partner G/L Acc. No." = '' then
                                AddError(
                                  StrSubstNo(
                                    Text002, FieldCaption("IC Partner G/L Acc. No.")))
                            else begin
                                if "IC G/L Account".Get("IC Partner G/L Acc. No.") then
                                    if "IC G/L Account".Blocked then
                                        AddError(
                                          StrSubstNo(
                                            Text032,
                                            "IC G/L Account".FieldCaption(Blocked), false, FieldCaption("IC Partner G/L Acc. No."),
                                            "IC Partner G/L Acc. No."
                                            ));
                            end;
                        end else
                            if "IC Partner G/L Acc. No." <> '' then
                                AddError(
                                  StrSubstNo(
                                    Text009, FieldCaption("IC Partner G/L Acc. No.")));
                    end;
                end else
                    if "IC Partner G/L Acc. No." <> '' then begin
                        if "IC Direction" = "IC Direction"::Incoming then
                            AddError(
                              StrSubstNo(
                                Text069, FieldCaption("IC Partner G/L Acc. No."), FieldCaption("IC Direction"), Format("IC Direction")));
                        if CurrentICPartner = '' then
                            AddError(
                              StrSubstNo(
                                Text070, FieldCaption("IC Partner G/L Acc. No.")));
                    end;
            end;
    end;


    procedure TestJobFields(var GenJnlLine: Record "Gen. Journal Line")
    var
        Job: Record Job;
        JT: Record "Job Task";
    begin
        with GenJnlLine do begin
            if ("Job No." = '') or ("Account Type" <> "Account Type"::"G/L Account") then
                exit;
            if not Job.Get("Job No.") then
                AddError(StrSubstNo(Text071, Job.TableCaption, "Job No."))
            else
                if Job.Blocked > Job.Blocked::" " then
                    AddError(
                      StrSubstNo(
                        Text072, Job.FieldCaption(Blocked), Job.Blocked, Job.TableCaption, "Job No."));

            if "Job Task No." = '' then
                AddError(StrSubstNo(Text002, FieldCaption("Job Task No.")))
            else
                if not JT.Get("Job No.", "Job Task No.") then
                    AddError(StrSubstNo(Text071, JT.TableCaption, "Job Task No."))
        end;
    end;

    local procedure CheckFADocNo(GenJnlLine: Record "Gen. Journal Line")
    var
        DeprBook: Record "Depreciation Book";
        FAJnlLine: Record "FA Journal Line";
        OldFALedgEntry: Record "FA Ledger Entry";
        OldMaintenanceLedgEntry: Record "Maintenance Ledger Entry";
        FANo: Code[20];
    begin
        with GenJnlLine do begin
            if "Account Type" = "Account Type"::"Fixed Asset" then
                FANo := "Account No.";
            if "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" then
                FANo := "Bal. Account No.";
            if (FANo = '') or
               ("FA Posting Type" = "FA Posting Type"::" ") or
               ("Depreciation Book Code" = '') or
               ("Document No." = '')
            then
                exit;
            if not DeprBook.Get("Depreciation Book Code") then
                exit;
            if DeprBook."Allow Identical Document No." then
                exit;

            FAJnlLine."FA Posting Type" := "FA Posting Type" - 1;
            if "FA Posting Type" <> "FA Posting Type"::Maintenance then begin
                OldFALedgEntry.SetCurrentKey(
                  "FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Document No.");
                OldFALedgEntry.SetRange("FA No.", FANo);
                OldFALedgEntry.SetRange("Depreciation Book Code", "Depreciation Book Code");
                OldFALedgEntry.SetRange("FA Posting Category", OldFALedgEntry."FA Posting Category"::" ");
                OldFALedgEntry.SetRange("FA Posting Type", FAJnlLine.ConvertToLedgEntry(FAJnlLine));
                OldFALedgEntry.SetRange("Document No.", "Document No.");
                if OldFALedgEntry.FindFirst then
                    AddError(
                      StrSubstNo(
                        Text073,
                        FieldCaption("Document No."), "Document No."));
            end else begin
                OldMaintenanceLedgEntry.SetCurrentKey(
                  "FA No.", "Depreciation Book Code", "Document No.");
                OldMaintenanceLedgEntry.SetRange("FA No.", FANo);
                OldMaintenanceLedgEntry.SetRange("Depreciation Book Code", "Depreciation Book Code");
                OldMaintenanceLedgEntry.SetRange("Document No.", "Document No.");
                if OldMaintenanceLedgEntry.FindFirst then
                    AddError(
                      StrSubstNo(
                        Text073,
                        FieldCaption("Document No."), "Document No."));
            end;
        end;
    end;


    procedure ShowVoucherValidations(var GenJnlline: Record "Gen. Journal Line")
    begin
        with GenJnlline do begin
            //TBD
            /*
            GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
            if ("Journal Template Name" <> '') and ("Journal Batch Name" <> '') and
               (GenJnlBatch."Sub Type" <> GenJnlBatch."Sub Type"::" ")
            then begin
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Cash Receipt Voucher" then
                    IdentifyCashAccount(GenJnlline, 0);
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Cash Payment Voucher" then
                    IdentifyCashAccount(GenJnlline, 1);
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Bank Receipt Voucher" then
                    IdentifyBankAccount(GenJnlline, 0);
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Bank Payment Voucher" then
                    IdentifyBankAccount(GenJnlline, 1);
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Contra Voucher" then
                    IdentifyContraAccount(GenJnlline);
                if GenJnlBatch."Sub Type" = GenJnlBatch."Sub Type"::"Journal Voucher" then
                    IdentifyJournalAccount(GenJnlline);
            end;
            */
        end;
    end;


    procedure IdentifyCashAccount(GenJnlLine2: Record "Gen. Journal Line"; CashVoucherType: Option "Cash Receipt Book","Cash Payment Book")
    var
    //TBD VoucherAcc: Record "Voucher Account";
    begin
        //TBD
        /*
        with GenJnlLine2 do begin
            if Amount = 0 then
                exit;
            GenJnlLine3 := GenJnlLine2;
            if CashVoucherType = CashVoucherType::"Cash Receipt Book" then begin
                if GenJnlLine3.Amount > 0 then begin
                    if GenJnlLine3."Account No." <> '' then begin
                        if GenJnlLine3."Account Type" <> GenJnlLine3."Account Type"::"G/L Account" then
                            AddError(StrSubstNo(Text16508, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Cash Receipt Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        //002
                        //        IF NOT VoucherAcc.FINDFIRST THEN
                        //          AddError(STRSUBSTNO(Text16500,GenJnlLine3."Account No.",CashVoucherType,GenJnlLine3."Document No."));
                    end;
                    //002
                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16504, GenJnlLine3."Document No."));

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16505, GenJnlLine3."Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;

                end;
                if GenJnlLine3.Amount < 0 then begin
                    if GenJnlLine3."Bal. Account No." <> '' then begin
                        if GenJnlLine3."Bal. Account Type" <> GenJnlLine3."Bal. Account Type"::"G/L Account" then
                            AddError(StrSubstNo(Text16509, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));

                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Cash Receipt Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if not VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16500, GenJnlLine3."Bal. Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16506, GenJnlLine3."Document No."));

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16505, GenJnlLine3."Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;
                end;
            end;
            if CashVoucherType = CashVoucherType::"Cash Payment Book" then begin
                if GenJnlLine3.Amount < 0 then begin
                    if GenJnlLine3."Account No." <> '' then begin
                        if GenJnlLine3."Account Type" <> GenJnlLine3."Account Type"::"G/L Account" then
                            AddError(StrSubstNo(Text16508, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if not VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16500, GenJnlLine3."Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16504, GenJnlLine3."Document No."));

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16507, GenJnlLine3."Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;
                end;
                if GenJnlLine3.Amount > 0 then begin
                    if GenJnlLine3."Bal. Account No." <> '' then begin
                        if GenJnlLine3."Bal. Account Type" <> GenJnlLine3."Bal. Account Type"::"G/L Account" then
                            AddError(StrSubstNo(Text16509, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));

                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if not VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16500, GenJnlLine3."Bal. Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16506, GenJnlLine3."Document No."));

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16507, GenJnlLine3."Account No.", CashVoucherType, GenJnlLine3."Document No."));
                    end;
                end;
            end;
        end;
        */
    end;


    procedure IdentifyBankAccount(GenJnlLine2: Record "Gen. Journal Line"; BankVoucherType: Option "Bank Receipt Book","Bank Payment Book")
    var
    //TBD VoucherAcc: Record "Voucher Account";
    begin
        //TBD
        /*
        with GenJnlLine2 do begin
            if Amount = 0 then
                exit;
            GenJnlLine3 := GenJnlLine2;
            if BankVoucherType = BankVoucherType::"Bank Receipt Book" then begin
                if GenJnlLine3.Amount > 0 then begin
                    if GenJnlLine3."Account No." <> '' then begin
                        if GenJnlLine3."Account Type" <> GenJnlLine3."Account Type"::"Bank Account" then
                            //002
                            //          AddError(STRSUBSTNO(Text16510,GenJnlLine3."Journal Template Name",GenJnlLine3."Journal Batch Name",
                            //            GenJnlLine3."Line No."));

                            VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Bank Receipt Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"Bank Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        //002
                        //        IF NOT VoucherAcc.FINDFIRST THEN
                        //          AddError(STRSUBSTNO(Text16501,GenJnlLine3."Account No.",BankVoucherType,GenJnlLine3."Document No."));
                        //002
                    end;

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16505, GenJnlLine3."Bal. Account No.", BankVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16504, GenJnlLine3."Document No."));

                end;
                if GenJnlLine3.Amount < 0 then begin
                    if GenJnlLine3."Bal. Account No." <> '' then begin
                        if GenJnlLine3."Bal. Account Type" <> GenJnlLine3."Bal. Account Type"::"Bank Account" then
                            AddError(StrSubstNo(Text16511, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));

                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Bank Receipt Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"Bank Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        //002
                        //      IF NOT VoucherAcc.FINDFIRST THEN
                        //        AddError(STRSUBSTNO(Text16501,GenJnlLine3."Bal. Account No.",BankVoucherType,GenJnlLine3."Document No."));
                        //002
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16505, GenJnlLine3."Bal. Account No.", BankVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16506, GenJnlLine3."Document No."));

                end;
            end;
            if BankVoucherType = BankVoucherType::"Bank Payment Book" then begin
                if GenJnlLine3.Amount < 0 then begin
                    if GenJnlLine3."Account No." <> '' then begin
                        if GenJnlLine3."Account Type" <> GenJnlLine3."Account Type"::"Bank Account" then
                            //002
                            //         AddError(STRSUBSTNO(Text16510,GenJnlLine3."Journal Template Name",GenJnlLine3."Journal Batch Name",
                            //            GenJnlLine3."Line No."));
                            VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Bank Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"Bank Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        //002
                        //        IF NOT VoucherAcc.FINDFIRST THEN
                        //          AddError(STRSUBSTNO(Text16501,GenJnlLine3."Account No.",BankVoucherType,GenJnlLine3."Document No."));
                        //002
                    end;

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16507, GenJnlLine3."Bal. Account No.", BankVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16504, GenJnlLine3."Document No."));

                end;
                if GenJnlLine3.Amount > 0 then begin
                    if GenJnlLine3."Bal. Account No." <> '' then begin
                        if GenJnlLine3."Bal. Account Type" <> GenJnlLine3."Bal. Account Type"::"Bank Account" then
                            AddError(StrSubstNo(Text16511, GenJnlLine3."Journal Template Name", GenJnlLine3."Journal Batch Name",
                              GenJnlLine3."Line No."));

                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetRange("Sub Type", VoucherAcc."Sub Type"::"Bank Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"Bank Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        //002
                        //        IF NOT VoucherAcc.FINDFIRST THEN
                        //          AddError(STRSUBSTNO(Text16501,GenJnlLine3."Bal. Account No.",BankVoucherType,GenJnlLine3."Document No."));
                        //002
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16507, GenJnlLine3."Bal. Account No.", BankVoucherType, GenJnlLine3."Document No."));
                    end;

                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then
                        AddError(StrSubstNo(Text16506, GenJnlLine3."Document No."));
                end;
            end;
        end;
        */
    end;


    procedure IdentifyContraAccount(GenJnlLine2: Record "Gen. Journal Line")

    begin
        with GenJnlLine2 do begin
            if Amount = 0 then
                exit;
            GenJnlLine3 := GenJnlLine2;
            if GenJnlLine3."Bal. Account No." <> '' then begin
                //TBD
                /*
                if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then begin
                    VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Bank Payment Voucher",
                      VoucherAcc."Sub Type"::"Bank Receipt Voucher");
                    VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"Bank Account");
                    VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                    //002
                    //      IF NOT VoucherAcc.FINDFIRST THEN
                    //        AddError(STRSUBSTNO(Text16501,GenJnlLine3."Bal. Account No.",'Contra',GenJnlLine3."Document No."));
                    //002
                end
                else
                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                                                VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        if not VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16500, GenJnlLine3."Bal. Account No.", 'Contra', GenJnlLine3."Document No."));
                    end else
                        AddError(StrSubstNo(Text16502, 'Contra', GenJnlLine3."Document No."));
            */
            end;
            //TBD
            /*
            if GenJnlLine3."Account No." <> '' then begin
                if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then begin
                    VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Bank Payment Voucher",
                      VoucherAcc."Sub Type"::"Bank Receipt Voucher");
                    VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"Bank Account");
                    VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                    //002
                    //    IF NOT VoucherAcc.FINDFIRST THEN
                    //       AddError(STRSUBSTNO(Text16501,GenJnlLine3."Account No.",'Contra',GenJnlLine3."Document No."));
                    //002
                end
                else
                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                                                VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        if not VoucherAcc.FindFirst then
                            AddError(StrSubstNo(Text16500, GenJnlLine3."Account No.", 'Contra', GenJnlLine3."Document No."));
                    end else
                        AddError(StrSubstNo(Text16502, 'Contra', GenJnlLine3."Document No."));
            end;
            */

        end;

    end;


    procedure IdentifyJournalAccount(GenJnlLine2: Record "Gen. Journal Line")
    begin
        //TBD
        /*
        with GenJnlLine2 do begin
            if Amount = 0 then
                exit;
            GenJnlLine3 := GenJnlLine2;
            if GenJnlLine3."Bal. Account No." <> '' then begin
                if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"Bank Account" then
                    AddError(StrSubstNo(Text16504, GenJnlLine3."Document No."))
                else
                    if GenJnlLine3."Bal. Account Type" = GenJnlLine3."Bal. Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Bal. Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Bal. Account No.");
                        //002-->Base code Block Start
                        //            IF VoucherAcc.FINDFIRST THEN
                        //        AddError(STRSUBSTNO(Text16503,GenJnlLine3."Bal. Account No.",'Journal',GenJnlLine3."Document No."));
                        //002-->Base code Block Start
                    end;
            end;

            if GenJnlLine3."Account No." <> '' then begin
                if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"Bank Account" then
                    AddError(StrSubstNo(Text16506, GenJnlLine3."Document No."))
                else
                    if GenJnlLine3."Account Type" = GenJnlLine3."Account Type"::"G/L Account" then begin
                        VoucherAcc.SetRange("Location code", GenJnlLine3."Location Code");
                        VoucherAcc.SetFilter("Sub Type", '%1|%2', VoucherAcc."Sub Type"::"Cash Receipt Voucher",
                          VoucherAcc."Sub Type"::"Cash Payment Voucher");
                        VoucherAcc.SetRange("Account Type", GenJnlLine3."Account Type"::"G/L Account");
                        VoucherAcc.SetRange("Account No.", GenJnlLine3."Account No.");
                        //002-->Base code Block Start
                        //      IF VoucherAcc.FINDFIRST THEN
                        //        AddError(STRSUBSTNO(Text16503,GenJnlLine3."Account No.",'Journal',GenJnlLine3."Document No."));
                        //002-->Base code Block Start
                    end;
            end;
        end;
        */
    end;


    procedure CheckDirectServiceTax(var GenJnlLine2: Record "Gen. Journal Line")
    var
        ServiceAccountType: Boolean;
        ServiceBalAccountType: Boolean;
        GLAcc2: Record "G/L Account";
        Vendor2: Record Vendor;
        Cust2: Record Customer;
    begin
        with GenJnlLine2 do begin
            //TBD
            /*
            if ("Service Tax Amount" <> 0) and ("Document Type" in ["Document Type"::Payment, "Document Type"::Refund])
               and (not "Serv. Tax on Advance Payment") then begin
                if "Service Tax Type" = "Service Tax Type"::Charge then
                    AddError(StrSubstNo(Text16512, "Journal Template Name", "Journal Batch Name", "Line No."));
                if "Service Tax Type" = "Service Tax Type"::Purchase then begin
                    if "Party Type" <> "Party Type"::Vendor then
                        AddError(StrSubstNo(Text16518, "Journal Template Name", "Journal Batch Name", "Line No."));
                    if "Party Code" = '' then
                        AddError(StrSubstNo(Text16519, "Journal Template Name", "Journal Batch Name", "Line No."));
                    if not Vendor2.Get("Party Code") then
                        AddError(StrSubstNo(Text16520, "Party Code", "Journal Template Name", "Journal Batch Name", "Line No."));
                end;
                if "Service Tax Type" = "Service Tax Type"::Sale then begin
                    if "Party Type" <> "Party Type"::Customer then
                        AddError(StrSubstNo(Text16521, "Journal Template Name", "Journal Batch Name", "Line No."));
                    if "Party Code" = '' then
                        AddError(StrSubstNo(Text16519, "Journal Template Name", "Journal Batch Name", "Line No."));
                    if not Cust2.Get("Party Code") then
                        AddError(StrSubstNo(Text16520, "Party Code", "Journal Template Name", "Journal Batch Name", "Line No."));
                end;

                if not ((("Account Type" = "Account Type"::"G/L Account") and ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) or
                   ((("Account Type" = "Account Type"::"G/L Account") or ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) and
                   (("Account Type" = "Account Type"::"Bank Account") or ("Bal. Account Type" = "Bal. Account Type"::"Bank Account")))) then
                    AddError(StrSubstNo(Text16517, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));

                if ("Account Type" = "Account Type"::"G/L Account") and ("Account No." <> '') then begin
                    GLAcc2.Get("Account No.");
                    if GLAcc2."Service Tax Group Code" <> '' then
                        ServiceAccountType := true;
                end;

                if ("Bal. Account Type" = "Bal. Account Type"::"G/L Account") and ("Bal. Account No." <> '') then begin
                    GLAcc2.Get("Bal. Account No.");
                    if GLAcc2."Service Tax Group Code" <> '' then
                        ServiceBalAccountType := true;
                end;

                if (ServiceAccountType = false) and (ServiceBalAccountType = false) then
                    AddError(StrSubstNo(Text16513, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));
                if ServiceAccountType and ServiceBalAccountType then
                    AddError(StrSubstNo(Text16514, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));

                if (("Service Tax Type" = "Service Tax Type"::Sale) and ("Document Type" = "Document Type"::Payment)) or
                  (("Service Tax Type" = "Service Tax Type"::Purchase) and ("Document Type" = "Document Type"::Refund))
                then begin
                    if ServiceAccountType and (Amount > 0) then
                        AddError(StrSubstNo(Text16516, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));
                    if ServiceBalAccountType and (Amount < 0) then
                        AddError(StrSubstNo(Text16515, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));
                end else
                    if (("Service Tax Type" = "Service Tax Type"::Sale) and ("Document Type" = "Document Type"::Refund)) or
                (("Service Tax Type" = "Service Tax Type"::Purchase) and ("Document Type" = "Document Type"::Payment)) then begin
                        if ServiceAccountType and (Amount < 0) then
                            AddError(StrSubstNo(Text16515, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));
                        if ServiceBalAccountType and (Amount > 0) then
                            AddError(StrSubstNo(Text16516, "Journal Template Name", "Journal Batch Name", GenJnlLine2."Line No."));
                    end;
            end;
            */
        end;
    end;


    procedure CheckTDSAmount(var GenJnlLine: Record "Gen. Journal Line"): Boolean
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
        GenJournalLine.SetRange("Document No.", GenJnlLine."Document No.");
        //TBD //GenJournalLine.SetFilter("Bal. TDS/TCS Including SHECESS", '<>%1', 0);
        GenJournalLine.SetFilter(Amount, '>0');
        exit(GenJournalLine.FindFirst);
    end;


    procedure InitializeRequest(NewShowDim: Boolean)
    begin
        ShowDim := NewShowDim;
    end;
}

