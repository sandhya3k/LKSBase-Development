report 50021 "HDFC Bank LEAF"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/HDFCBankLEAF.rdlc';
    Caption = 'Check';
    Permissions = TableData "Bank Account" = m;

    dataset
    {
        dataitem(VoidGenJnlLine; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Posting Date";

            trigger OnAfterGetRecord()
            begin
                CheckManagement.VoidCheck(VoidGenJnlLine);
            end;

            trigger OnPreDataItem()
            begin
                if CurrReport.Preview then
                    Error(Text000);

                if UseCheckNo = '' then
                    Error(Text001);

                if TestPrint then
                    CurrReport.Break;

                if not ReprintChecks then
                    CurrReport.Break;

                if (GetFilter("Line No.") <> '') or (GetFilter("Document No.") <> '') then
                    Error(
                      Text002, FieldCaption("Line No."), FieldCaption("Document No."));
                SetRange("Bank Payment Type", "Bank Payment Type"::"Computer Check");
                SetRange("Check Printed", true);
            end;
        }
        dataitem(GenJnlLine; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
            column(GenJnlLine_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(GenJnlLine_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(GenJnlLine_Line_No_; "Line No.")
            {
            }
            dataitem(CheckPages; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PrintSettledLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);

                    trigger OnAfterGetRecord()
                    begin
                        if not TestPrint then begin
                            if FoundLast then begin
                                if RemainingAmount <> 0 then begin
                                    DocType := Text015;
                                    DocNo := '';
                                    ExtDocNo := '';
                                    LineAmount := RemainingAmount;
                                    LineAmount2 := RemainingAmount;
                                    LineDiscount := 0;
                                    RemainingAmount := 0;
                                end else
                                    CurrReport.Break;
                            end else begin
                                case ApplyMethod of
                                    ApplyMethod::OneLineOneEntry:
                                        begin
                                            case BalancingType of
                                                BalancingType::Customer:
                                                    begin
                                                        CustLedgEntry.Reset;
                                                        CustLedgEntry.SetCurrentKey("Document No.", "Document Type", "Customer No.");
                                                        CustLedgEntry.SetRange("Document Type", GenJnlLine."Applies-to Doc. Type");
                                                        CustLedgEntry.SetRange("Document No.", GenJnlLine."Applies-to Doc. No.");
                                                        CustLedgEntry.SetRange("Customer No.", BalancingNo);
                                                        CustLedgEntry.Find('-');
                                                        CustUpdateAmounts(CustLedgEntry, RemainingAmount);
                                                    end;
                                                BalancingType::Vendor:
                                                    begin
                                                        VendLedgEntry.Reset;
                                                        VendLedgEntry.SetCurrentKey("Document No.", "Document Type", "Vendor No.");
                                                        VendLedgEntry.SetRange("Document Type", GenJnlLine."Applies-to Doc. Type");
                                                        VendLedgEntry.SetRange("Document No.", GenJnlLine."Applies-to Doc. No.");
                                                        VendLedgEntry.SetRange("Vendor No.", BalancingNo);
                                                        VendLedgEntry.Find('-');
                                                        VendUpdateAmounts(VendLedgEntry, RemainingAmount);
                                                    end;
                                            end;
                                            RemainingAmount := RemainingAmount - LineAmount2;
                                            FoundLast := true;
                                        end;
                                    ApplyMethod::OneLineID:
                                        begin
                                            case BalancingType of
                                                BalancingType::Customer:
                                                    begin
                                                        CustUpdateAmounts(CustLedgEntry, RemainingAmount);
                                                        FoundLast := (CustLedgEntry.Next = 0) or (RemainingAmount <= 0);
                                                        if FoundLast and not FoundNegative then begin
                                                            CustLedgEntry.SetRange(Positive, false);
                                                            FoundLast := not CustLedgEntry.Find('-');
                                                            FoundNegative := true;
                                                        end;
                                                    end;
                                                BalancingType::Vendor:
                                                    begin
                                                        VendUpdateAmounts(VendLedgEntry, RemainingAmount);
                                                        FoundLast := (VendLedgEntry.Next = 0) or (RemainingAmount <= 0);
                                                        if FoundLast and not FoundNegative then begin
                                                            VendLedgEntry.SetRange(Positive, false);
                                                            FoundLast := not VendLedgEntry.Find('-');
                                                            FoundNegative := true;
                                                        end;
                                                    end;
                                            end;
                                            RemainingAmount := RemainingAmount - LineAmount2;
                                        end;
                                    ApplyMethod::MoreLinesOneEntry:
                                        begin
                                            CurrentLineAmount := GenJnlLine2.Amount;
                                            LineAmount2 := CurrentLineAmount;

                                            if GenJnlLine2."Applies-to ID" <> '' then
                                                Error(
                                                  Text016 +
                                                  Text017);
                                            GenJnlLine2.TestField("Check Printed", false);
                                            GenJnlLine2.TestField("Bank Payment Type", GenJnlLine2."Bank Payment Type"::"Computer Check");

                                            if GenJnlLine2."Applies-to Doc. No." = '' then begin
                                                DocType := Text015;
                                                DocNo := '';
                                                ExtDocNo := '';
                                                LineAmount := CurrentLineAmount;
                                                LineDiscount := 0;
                                            end else begin
                                                case BalancingType of
                                                    BalancingType::"G/L Account":
                                                        begin
                                                            DocType := Format(GenJnlLine2."Document Type");
                                                            DocNo := GenJnlLine2."Document No.";
                                                            ExtDocNo := GenJnlLine2."External Document No.";
                                                            LineAmount := CurrentLineAmount;
                                                            LineDiscount := 0;
                                                        end;
                                                    BalancingType::Customer:
                                                        begin
                                                            CustLedgEntry.Reset;
                                                            CustLedgEntry.SetCurrentKey("Document No.", "Document Type", "Customer No.");
                                                            CustLedgEntry.SetRange("Document Type", GenJnlLine2."Applies-to Doc. Type");
                                                            CustLedgEntry.SetRange("Document No.", GenJnlLine2."Applies-to Doc. No.");
                                                            CustLedgEntry.SetRange("Customer No.", BalancingNo);
                                                            CustLedgEntry.Find('-');
                                                            CustUpdateAmounts(CustLedgEntry, CurrentLineAmount);
                                                            LineAmount := CurrentLineAmount;
                                                        end;
                                                    BalancingType::Vendor:
                                                        begin
                                                            VendLedgEntry.Reset;
                                                            VendLedgEntry.SetCurrentKey("Document No.", "Document Type", "Vendor No.");
                                                            VendLedgEntry.SetRange("Document Type", GenJnlLine2."Applies-to Doc. Type");
                                                            VendLedgEntry.SetRange("Document No.", GenJnlLine2."Applies-to Doc. No.");
                                                            VendLedgEntry.SetRange("Vendor No.", BalancingNo);
                                                            VendLedgEntry.Find('-');
                                                            VendUpdateAmounts(VendLedgEntry, CurrentLineAmount);
                                                            LineAmount := CurrentLineAmount;
                                                        end;
                                                    BalancingType::"Bank Account":
                                                        begin
                                                            DocType := Format(GenJnlLine2."Document Type");
                                                            DocNo := GenJnlLine2."Document No.";
                                                            ExtDocNo := GenJnlLine2."External Document No.";
                                                            LineAmount := CurrentLineAmount;
                                                            LineDiscount := 0;
                                                        end;
                                                end;
                                            end;
                                            FoundLast := GenJnlLine2.Next = 0;
                                        end;
                                end;
                            end;

                            TotalLineAmount := TotalLineAmount + LineAmount2;
                            TotalLineDiscount := TotalLineDiscount + LineDiscount;
                        end else begin
                            if FoundLast then
                                CurrReport.Break;
                            FoundLast := true;
                            DocType := Text018;
                            DocNo := Text010;
                            ExtDocNo := Text010;
                            LineAmount := 0;
                            LineDiscount := 0;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if not TestPrint then
                            if FirstPage then begin
                                FoundLast := true;
                                case ApplyMethod of
                                    ApplyMethod::OneLineOneEntry:
                                        FoundLast := false;
                                    ApplyMethod::OneLineID:
                                        case BalancingType of
                                            BalancingType::Customer:
                                                begin
                                                    CustLedgEntry.Reset;
                                                    CustLedgEntry.SetCurrentKey("Customer No.", Open, Positive);
                                                    CustLedgEntry.SetRange("Customer No.", BalancingNo);
                                                    CustLedgEntry.SetRange(Open, true);
                                                    CustLedgEntry.SetRange(Positive, true);
                                                    CustLedgEntry.SetRange("Applies-to ID", GenJnlLine."Applies-to ID");
                                                    FoundLast := not CustLedgEntry.Find('-');
                                                    if FoundLast then begin
                                                        CustLedgEntry.SetRange(Positive, false);
                                                        FoundLast := not CustLedgEntry.Find('-');
                                                        FoundNegative := true;
                                                    end else
                                                        FoundNegative := false;
                                                end;
                                            BalancingType::Vendor:
                                                begin
                                                    VendLedgEntry.Reset;
                                                    VendLedgEntry.SetCurrentKey("Vendor No.", Open, Positive);
                                                    VendLedgEntry.SetRange("Vendor No.", BalancingNo);
                                                    VendLedgEntry.SetRange(Open, true);
                                                    VendLedgEntry.SetRange(Positive, true);
                                                    VendLedgEntry.SetRange("Applies-to ID", GenJnlLine."Applies-to ID");
                                                    FoundLast := not VendLedgEntry.Find('-');
                                                    if FoundLast then begin
                                                        VendLedgEntry.SetRange(Positive, false);
                                                        FoundLast := not VendLedgEntry.Find('-');
                                                        FoundNegative := true;
                                                    end else
                                                        FoundNegative := false;
                                                end;
                                        end;
                                    ApplyMethod::MoreLinesOneEntry:
                                        FoundLast := false;
                                end;
                            end
                            else
                                FoundLast := false;
                    end;
                }
                dataitem(PrintCheck; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(CheckAmountText; CheckAmountText)
                    {
                    }
                    column(CheckDateText; CheckDateText)
                    {
                    }
                    column(DescriptionLine_1_; DescriptionLine[1])
                    {
                    }
                    column(CheckToAddr_1_; CheckToAddr[1])
                    {
                    }
                    column(A_C_PayeeCaption; A_C_PayeeCaptionLbl)
                    {
                    }
                    column(PrintCheck_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        Decimals: Decimal;
                    begin
                        if not TestPrint then begin
                            with GenJnlLine do begin
                                CheckLedgEntry.Init;
                                CheckLedgEntry."Bank Account No." := BankAcc2."No.";
                                CheckLedgEntry."Posting Date" := "Posting Date";
                                CheckLedgEntry."Document Type" := "Document Type";
                                CheckLedgEntry."Document No." := UseCheckNo;
                                //  CheckLedgEntry."Document No." := GenJnlLine."Document No.";
                                CheckLedgEntry.Description := Description;
                                // CheckLedgEntry."Description 3 " := "Description 3 ";
                                CheckLedgEntry."Bank Payment Type" := "Bank Payment Type";
                                CheckLedgEntry."Bal. Account Type" := BalancingType;
                                CheckLedgEntry."Bal. Account No." := BalancingNo;
                                if FoundLast then begin
                                    if TotalLineAmount < 0 then
                                        Error(
                                          Text020,
                                          UseCheckNo, TotalLineAmount);
                                    CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Printed;
                                    CheckLedgEntry.Amount := TotalLineAmount - TDSAmount - WorkTaxAmount;
                                end else begin
                                    CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Voided;
                                    CheckLedgEntry.Amount := 0;
                                end;
                                CheckLedgEntry."Check Date" := "Posting Date";
                                CheckLedgEntry."Check No." := UseCheckNo;
                                CheckManagement.InsertCheck(CheckLedgEntry, RecordId);

                                if FoundLast then begin //TEST::1426
                                    if BankAcc2."Currency Code" <> '' then
                                        Currency.Get(BankAcc2."Currency Code")
                                    else
                                        Currency.InitRoundingPrecision;
                                    Decimals := CheckLedgEntry.Amount - Round(CheckLedgEntry.Amount, 1, '<');
                                    if StrLen(Format(Decimals)) < StrLen(Format(Currency."Amount Rounding Precision")) then
                                        if Decimals = 0 then
                                            CheckAmountText := Format(CheckLedgEntry.Amount, 0, 0) +
                                              CopyStr(Format(0.01), 2, 1) +
                                              PadStr('', StrLen(Format(Currency."Amount Rounding Precision")) - 2, '0')
                                        else
                                            CheckAmountText := Format(CheckLedgEntry.Amount, 0, 0) +
                                              PadStr('', StrLen(Format(Currency."Amount Rounding Precision")) - StrLen(Format(Decimals)), '0')
                                    else
                                        CheckAmountText := Format(CheckLedgEntry.Amount, 0, 0);
                                    FormatNoText(DescriptionLine, CheckLedgEntry.Amount, BankAcc2."Currency Code");
                                    VoidText := '';
                                end else begin
                                    Clear(CheckAmountText);
                                    Clear(DescriptionLine);
                                    DescriptionLine[1] := Text021;
                                    DescriptionLine[2] := DescriptionLine[1];
                                    VoidText := Text022;
                                end;
                            end;


                        end else begin
                            with GenJnlLine do begin
                                CheckLedgEntry.Init;
                                CheckLedgEntry."Bank Account No." := BankAcc2."No.";
                                CheckLedgEntry."Posting Date" := "Posting Date";
                                CheckLedgEntry."Document No." := GenJnlLine."Document No.";
                                CheckLedgEntry.Description := Text023;
                                //CheckLedgEntry."Description 3 " := Text023;
                                CheckLedgEntry."Bank Payment Type" := "Bank Payment Type"::"Computer Check";
                                CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::"Test Print";
                                CheckLedgEntry."Check Date" := "Posting Date";
                                CheckLedgEntry."Check No." := UseCheckNo;
                                CheckManagement.InsertCheck(CheckLedgEntry, RecordId);

                                CheckAmountText := Text024;
                                DescriptionLine[1] := Text025;
                                DescriptionLine[2] := DescriptionLine[1];
                                VoidText := Text022;
                            end;
                        end;

                        ChecksPrinted := ChecksPrinted + 1;
                        FirstPage := false;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if FoundLast then
                        CurrReport.Break;

                    UseCheckNo := IncStr(UseCheckNo);
                    if not TestPrint then
                        CheckNoText := UseCheckNo
                    else
                        CheckNoText := Text011;
                end;

                trigger OnPostDataItem()
                begin
                    if not TestPrint then begin
                        if UseCheckNo <> GenJnlLine."Document No." then begin
                            GenJnlLine3.Reset;
                            GenJnlLine3.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                            GenJnlLine3.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
                            GenJnlLine3.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
                            GenJnlLine3.SetRange("Posting Date", GenJnlLine."Posting Date");
                            GenJnlLine3.SetRange("Document No.", UseCheckNo);
                            if GenJnlLine3.Find('-') then
                                GenJnlLine3.FieldError("Document No.", StrSubstNo(Text013, UseCheckNo));
                        end;

                        if ApplyMethod <> ApplyMethod::MoreLinesOneEntry then begin
                            GenJnlLine3 := GenJnlLine;
                            //  GenJnlLine3.TESTFIELD("Posting No. Series",'');
                            //  GenJnlLine3."Document No." := UseCheckNo;
                            GenJnlLine3."Cheque No. 2" := UseCheckNo;          //2655
                            GenJnlLine3."Check Printed" := true;
                            GenJnlLine3.Modify;
                        end else begin
                            if GenJnlLine2.Find('-') then begin
                                HighestLineNo := GenJnlLine2."Line No.";
                                repeat
                                    if GenJnlLine2."Line No." > HighestLineNo then
                                        HighestLineNo := GenJnlLine2."Line No.";
                                    GenJnlLine3 := GenJnlLine2;
                                    //      GenJnlLine3.TESTFIELD("Posting No. Series",'');
                                    GenJnlLine3."Bal. Account No." := '';
                                    GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::" ";
                                    //      GenJnlLine3."Document No." := UseCheckNo;
                                    //GenJnlLine3."Cheque No." := UseCheckNo;          //2655
                                    GenJnlLine3."Cheque No. 2" := UseCheckNo; //#94
                                    GenJnlLine3."Check Printed" := true;
                                    GenJnlLine3.Validate(Amount);
                                    GenJnlLine3.Modify;
                                until GenJnlLine2.Next = 0;
                            end;

                            GenJnlLine3.Reset;
                            GenJnlLine3 := GenJnlLine;
                            GenJnlLine3.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
                            GenJnlLine3.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
                            GenJnlLine3."Line No." := HighestLineNo;
                            if GenJnlLine3.Next = 0 then
                                GenJnlLine3."Line No." := HighestLineNo + 10000
                            else begin
                                while GenJnlLine3."Line No." = HighestLineNo + 1 do begin
                                    HighestLineNo := GenJnlLine3."Line No.";
                                    if GenJnlLine3.Next = 0 then
                                        GenJnlLine3."Line No." := HighestLineNo + 20000;
                                end;
                                GenJnlLine3."Line No." := (GenJnlLine3."Line No." + HighestLineNo) div 2;
                            end;
                            GenJnlLine3.Init;
                            GenJnlLine3.Validate("Posting Date", GenJnlLine."Posting Date");
                            GenJnlLine3."Document Type" := GenJnlLine."Document Type";
                            GenJnlLine3."Document No." := GenJnlLine."Document No.";
                            GenJnlLine3."Account Type" := GenJnlLine3."Account Type"::"Bank Account";
                            GenJnlLine3.Validate("Account No.", BankAcc2."No.");
                            if BalancingType <> BalancingType::"G/L Account" then
                                GenJnlLine3.Description := StrSubstNo(Text014, SelectStr(BalancingType + 1, Text062), BalancingNo);
                            //GenJnlLine3."Description 3 " := StrSubstNo(Text014, SelectStr(BalancingType + 1, Text062), BalancingNo);

                            GenJnlLine3.Validate(Amount, -TotalLineAmount);
                            GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::"Computer Check";
                            GenJnlLine3."Check Printed" := true;
                            GenJnlLine3."Source Code" := GenJnlLine."Source Code";
                            GenJnlLine3."Reason Code" := GenJnlLine."Reason Code";
                            GenJnlLine3."Allow Zero-Amount Posting" := true;
                            GenJnlLine3."Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
                            GenJnlLine3."Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
                            GenJnlLine3.Insert;
                            //TBD
                            /*
                            JournalLineDimension.SetRange("Table ID", DATABASE::"Gen. Journal Line");
                            JournalLineDimension.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
                            JournalLineDimension.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
                            JournalLineDimension.SetRange("Journal Line No.", GenJnlLine."Line No.");
                            */
                            /*
                              DimensionManagement.MoveJnlLineDimToJnlLineDim(JournalLineDimension,
                                DATABASE::"Gen. Journal Line",
                                GenJnlLine3."Journal Template Name",
                                GenJnlLine3."Journal Batch Name",
                                GenJnlLine3."Line No.");
                              */
                        end;
                    end;

                    BankAcc2."Last Check No." := UseCheckNo;
                    BankAcc2.Modify;

                    Commit;
                    Clear(CheckManagement);

                end;

                trigger OnPreDataItem()
                begin
                    FirstPage := true;
                    FoundLast := false;
                    TotalLineAmount := 0;
                    TotalLineDiscount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if OneCheckPrVendor and (GenJnlLine."Currency Code" <> '') and
                   (GenJnlLine."Currency Code" <> Currency.Code)
                then begin
                    Currency.Get(GenJnlLine."Currency Code");
                    Currency.TestField("Conv. LCY Rndg. Debit Acc.");
                    Currency.TestField("Conv. LCY Rndg. Credit Acc.");
                end;

                if not TestPrint then begin
                    if Amount = 0 then
                        CurrReport.Skip;

                    TestField("Bal. Account Type", "Bal. Account Type"::"Bank Account");
                    if "Bal. Account No." <> BankAcc2."No." then
                        CurrReport.Skip;

                    if ("Account No." <> '') and ("Bal. Account No." <> '') then begin
                        BalancingType := "Account Type";
                        BalancingNo := "Account No.";
                        RemainingAmount := Amount;
                        //TBD
                        /*
                        TDSAmount := Abs("Total TDS/TCS Incl. SHE CESS");
                        WorkTaxAmount := Abs("Work Tax Amount");
                        */
                        if OneCheckPrVendor then begin
                            ApplyMethod := ApplyMethod::MoreLinesOneEntry;
                            GenJnlLine2.Reset;
                            GenJnlLine2.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                            GenJnlLine2.SetRange("Journal Template Name", "Journal Template Name");
                            GenJnlLine2.SetRange("Journal Batch Name", "Journal Batch Name");
                            GenJnlLine2.SetRange("Posting Date", "Posting Date");
                            GenJnlLine2.SetRange("Document No.", "Document No.");
                            GenJnlLine2.SetRange("Account Type", "Account Type");
                            GenJnlLine2.SetRange("Account No.", "Account No.");
                            GenJnlLine2.SetRange("Bal. Account Type", "Bal. Account Type");
                            GenJnlLine2.SetRange("Bal. Account No.", "Bal. Account No.");
                            GenJnlLine2.SetRange("Bank Payment Type", "Bank Payment Type");
                            GenJnlLine2.Find('-');
                            RemainingAmount := 0;
                        end else
                            if "Applies-to Doc. No." <> '' then
                                ApplyMethod := ApplyMethod::OneLineOneEntry
                            else
                                if "Applies-to ID" <> '' then
                                    ApplyMethod := ApplyMethod::OneLineID
                                else
                                    ApplyMethod := ApplyMethod::Payment;
                    end else
                        if "Account No." = '' then
                            FieldError("Account No.", Text004)
                        else
                            FieldError("Bal. Account No.", Text004);

                    Clear(CheckToAddr);
                    ContactText := '';
                    Clear(SalesPurchPerson);

                    case BalancingType of
                        //TEAM::1426
                        BalancingType::"G/L Account":
                            begin
                                CheckToAddr[1] := GenJnlLine.Description;
                                //CheckToAddr[1] := GenJnlLine."Description 3 ";
                            end;
                    //TBD
                    /*
                    BalancingType::"Bank Account":
                        begin
                            CheckToAddr[1] := GenJnlLine.Description;
                        end;
                    BalancingType::Vendor:
                        begin
                            CheckToAddr[1] := GenJnlLine.Description;
                        end;
                    BalancingType::Customer:
                        begin
                            CheckToAddr[1] := GenJnlLine.Description;
                        end;
                        //TEAM::1426

                    BalancingType::Customer:
                        begin
                            Cust.Get(BalancingNo);
                            if Cust.Blocked = Cust.Blocked::All then
                                Error(Text064, Cust.FieldCaption(Blocked), Cust.Blocked, Cust.TableCaption, Cust."No.");
                            Cust.Contact := '';
                            FormatAddr.Customer(CheckToAddr, Cust);
                            if BankAcc2."Currency Code" <> "Currency Code" then
                                Error(Text005);
                            if Cust."Salesperson Code" <> '' then begin
                                ContactText := Text006;
                                SalesPurchPerson.Get(Cust."Salesperson Code");
                            end;
                        end;
                    BalancingType::Vendor:
                        begin
                            Vend.Get(BalancingNo);
                            if Vend.Blocked in [Vend.Blocked::All, Vend.Blocked::Payment] then
                                Error(Text064, Vend.FieldCaption(Blocked), Vend.Blocked, Vend.TableCaption, Vend."No.");
                            Vend.Contact := '';
                            FormatAddr.Vendor(CheckToAddr, Vend);
                            if BankAcc2."Currency Code" <> "Currency Code" then
                                Error(Text005);
                            if Vend."Purchaser Code" <> '' then begin
                                ContactText := Text007;
                                SalesPurchPerson.Get(Vend."Purchaser Code");
                            end;
                        end;
                    BalancingType::"Bank Account":
                        begin
                            BankAcc.Get(BalancingNo);
                            BankAcc.TestField(Blocked, false);
                            BankAcc.Contact := '';
                            FormatAddr.BankAcc(CheckToAddr, BankAcc);
                            if BankAcc2."Currency Code" <> BankAcc."Currency Code" then
                                Error(Text008);
                            if BankAcc."Our Contact Code" <> '' then begin
                                ContactText := Text009;
                                SalesPurchPerson.Get(BankAcc."Our Contact Code");
                            end;
                        end;
                    */
                    end;

                    CheckDateText := Format("Posting Date", 0, 4);
                end else begin
                    if ChecksPrinted > 0 then
                        CurrReport.Break;
                    BalancingType := BalancingType::Vendor;
                    BalancingNo := Text010;
                    Clear(CheckToAddr);
                    for i := 1 to 5 do
                        CheckToAddr[i] := Text003;
                    ContactText := '';
                    Clear(SalesPurchPerson);
                    CheckNoText := Text011;
                    CheckDateText := Text012;
                end;

                if ChecksPrinted > 0 then
                    CurrReport.Break;
                BalancingType := BalancingType::Vendor;
                BalancingNo := Text010;
                Clear(CheckToAddr);
                for i := 1 to 5 do
                    CheckToAddr[i] := Text003;
                ContactText := '';
                Clear(SalesPurchPerson);
                CheckNoText := Text011;
                CheckDateText := Text012;
            end;

            trigger OnPreDataItem()
            begin
                GenJnlLine.Copy(VoidGenJnlLine);
                CompanyInfo.Get;
                if not TestPrint then begin
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                    BankAcc2.Get(BankAcc2."No.");
                    BankAcc2.TestField(Blocked, false);
                    Copy(VoidGenJnlLine);
                    SetRange("Bank Payment Type", "Bank Payment Type"::"Computer Check");
                    SetRange("Check Printed", false);
                end else begin
                    Clear(CompanyAddr);
                    for i := 1 to 5 do
                        CompanyAddr[i] := Text003;
                end;
                ChecksPrinted := 0;

                SetRange("Account Type", GenJnlLine."Account Type"::"Fixed Asset");
                if Find('-') then
                    GenJnlLine.FieldError("Account Type");
                SetRange("Account Type");
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

    trigger OnPreReport()
    begin
        InitTextVariable;
    end;

    var
        Text000: Label 'Preview is not allowed.';
        Text001: Label 'Last Check No. must be filled in.';
        Text002: Label 'Filters on %1 and %2 are not allowed.';
        Text003: Label 'XXXXXXXXXXXXXXXX';
        Text004: Label 'must be entered.';
        Text005: Label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: Label 'Salesperson';
        Text007: Label 'Purchaser';
        Text008: Label 'Both Bank Accounts must have the same currency.';
        Text009: Label 'Our Contact';
        Text010: Label 'XXXXXXXXXX';
        Text011: Label 'XXXX';
        Text012: Label 'XX.XXXXXXXXXX.XXXX';
        Text013: Label '%1 already exists.';
        Text014: Label 'Check for %1 %2';
        Text015: Label 'Payment';
        Text016: Label 'In the Check report, One Check per Vendor and Document No.\';
        Text017: Label 'must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: Label 'XXX';
        Text019: Label 'Total';
        Text020: Label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: Label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: Label 'NON-NEGOTIABLE';
        Text023: Label 'Test print';
        Text024: Label 'XXXX.XX';
        Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: Label 'Zero';
        Text027: Label 'Hundred';
        Text028: Label 'And';
        Text029: Label '%1 results in a written number that is too long.';
        Text030: Label ' is already applied to %1 %2 for customer %3.';
        Text031: Label ' is already applied to %1 %2 for vendor %3.';
        Text032: Label 'One';
        Text033: Label 'Two';
        Text034: Label 'Three';
        Text035: Label 'Four';
        Text036: Label 'Five';
        Text037: Label 'Six';
        Text038: Label 'Seven';
        Text039: Label 'Eight';
        Text040: Label 'Nine';
        Text041: Label 'Ten';
        Text042: Label 'Eleven';
        Text043: Label 'Twelve';
        Text044: Label 'Thirteen';
        Text045: Label 'Fourteen';
        Text046: Label 'Fifteen';
        Text047: Label 'Sixteen';
        Text048: Label 'Seventeen';
        Text049: Label 'Eighteen';
        Text050: Label 'Nineteen';
        Text051: Label 'Twenty';
        Text052: Label 'Thirty';
        Text053: Label 'Forty';
        Text054: Label 'Fifty';
        Text055: Label 'Sixty';
        Text056: Label 'Seventy';
        Text057: Label 'Eighty';
        Text058: Label 'Ninety';
        Text059: Label 'Thousand';
        Text060: Label 'Million';
        Text061: Label 'Billion';
        Text1280000: Label 'Lakh';
        Text1280001: Label 'Crore';
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        GenJnlLine2: Record "Gen. Journal Line";
        GenJnlLine3: Record "Gen. Journal Line";
        Cust: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        Vend: Record Vendor;
        VendLedgEntry: Record "Vendor Ledger Entry";
        BankAcc: Record "Bank Account";
        BankAcc2: Record "Bank Account";
        CheckLedgEntry: Record "Check Ledger Entry";
        Currency: Record Currency;
        FormatAddr: Codeunit "Format Address";
        CheckManagement: Codeunit CheckManagement;
        DimensionManagement: Codeunit DimensionManagement;
        CompanyAddr: array[8] of Text[50];
        CheckToAddr: array[8] of Text[50];
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        BalancingType: Option "G/L Account",Customer,Vendor,"Bank Account";
        BalancingNo: Code[20];
        ContactText: Text[30];
        CheckNoText: Text[30];
        CheckDateText: Text[30];
        CheckAmountText: Text[30];
        DescriptionLine: array[2] of Text[132];
        DocType: Text[30];
        DocNo: Text[30];
        ExtDocNo: Text[30];
        VoidText: Text[30];
        LineAmount: Decimal;
        LineDiscount: Decimal;
        TotalLineAmount: Decimal;
        TotalLineDiscount: Decimal;
        RemainingAmount: Decimal;
        CurrentLineAmount: Decimal;
        UseCheckNo: Code[20];
        FoundLast: Boolean;
        ReprintChecks: Boolean;
        TestPrint: Boolean;
        FirstPage: Boolean;
        OneCheckPrVendor: Boolean;
        FoundNegative: Boolean;
        ApplyMethod: Option Payment,OneLineOneEntry,OneLineID,MoreLinesOneEntry;
        ChecksPrinted: Integer;
        HighestLineNo: Integer;
        PreprintedStub: Boolean;
        TotalText: Text[10];
        DocDate: Date;
        i: Integer;
        Text062: Label 'G/L Account,Customer,Vendor,Bank Account';
        CurrencyCode2: Code[10];
        NetAmount: Text[30];
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        LineAmount2: Decimal;
        Text063: Label 'Net Amount %1';
        GLSetup: Record "General Ledger Setup";
        Text064: Label '%1 must not be %2 for %3 %4.';
        TDSAmount: Decimal;
        WorkTaxAmount: Decimal;
        dim: Record "Dimension Value";
        A_C_PayeeCaptionLbl: Label 'A/C Payee';


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        Currency: Record Currency;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                if No > 99999 then begin
                    Ones := No div (Power(100, Exponent - 1) * 10);
                    Hundreds := 0;
                end else begin
                    Ones := No div Power(1000, Exponent - 1);
                    Hundreds := Ones div 100;
                end;
                Tens := (Ones mod 100) div 10;
                Ones := Ones mod 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                if No > 99999 then
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(100, Exponent - 1) * 10
                else
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        if CurrencyCode <> '' then begin
            Currency.Get(CurrencyCode);
            //TBD //AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Currency."Currency Numeric Description");
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' '); //3k-UPG
        end else
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees');

        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);

        TensDec := ((No * 100) mod 100) div 10;
        OnesDec := (No * 100) mod 10;
        if TensDec >= 2 then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
            if OnesDec > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
        end else
            if (TensDec * 10 + OnesDec) > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text026);
        if (CurrencyCode <> '') then
            //TBD //AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Currency."Currency Decimal Description" + ' ONLY')
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + ' ONLY')//3k-UPG
        else
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'Paisa Only');
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(Text029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    local procedure CustUpdateAmounts(var CustLedgEntry2: Record "Cust. Ledger Entry"; RemainingAmount2: Decimal)
    begin
        if (ApplyMethod = ApplyMethod::OneLineOneEntry) or
           (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
        then begin
            GenJnlLine3.Reset;
            GenJnlLine3.SetCurrentKey(
              "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
            GenJnlLine3.SetRange("Account Type", GenJnlLine3."Account Type"::Customer);
            GenJnlLine3.SetRange("Account No.", CustLedgEntry2."Customer No.");
            GenJnlLine3.SetRange("Applies-to Doc. Type", CustLedgEntry2."Document Type");
            GenJnlLine3.SetRange("Applies-to Doc. No.", CustLedgEntry2."Document No.");
            if ApplyMethod = ApplyMethod::OneLineOneEntry then
                GenJnlLine3.SetFilter("Line No.", '<>%1', GenJnlLine."Line No.")
            else
                GenJnlLine3.SetFilter("Line No.", '<>%1', GenJnlLine2."Line No.");
            if CustLedgEntry2."Document Type" <> CustLedgEntry2."Document Type"::" " then
                if GenJnlLine3.Find('-') then
                    GenJnlLine3.FieldError(
                      "Applies-to Doc. No.",
                      StrSubstNo(
                        Text030,
                        CustLedgEntry2."Document Type", CustLedgEntry2."Document No.",
                        CustLedgEntry2."Customer No."));
        end;

        DocType := Format(CustLedgEntry2."Document Type");
        DocNo := CustLedgEntry2."Document No.";
        ExtDocNo := CustLedgEntry2."External Document No.";
        DocDate := CustLedgEntry2."Posting Date";
        CurrencyCode2 := CustLedgEntry2."Currency Code";

        CustLedgEntry2.CalcFields("Remaining Amount");

        LineAmount := -(CustLedgEntry2."Remaining Amount" - CustLedgEntry2."Remaining Pmt. Disc. Possible" -
          CustLedgEntry2."Accepted Payment Tolerance");
        LineAmount2 :=
          Round(
            ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
            Currency."Amount Rounding Precision");

        if ((CustLedgEntry2."Document Type" = CustLedgEntry2."Document Type"::Invoice) and
           (GenJnlLine."Posting Date" <= CustLedgEntry2."Pmt. Discount Date") and
           (LineAmount2 <= RemainingAmount2)) or CustLedgEntry2."Accepted Pmt. Disc. Tolerance"
        then begin
            LineDiscount := -CustLedgEntry2."Remaining Pmt. Disc. Possible";
            if CustLedgEntry2."Accepted Payment Tolerance" <> 0 then
                LineDiscount := LineDiscount - CustLedgEntry2."Accepted Payment Tolerance";
        end else begin
            if RemainingAmount2 >=
               Round(
                -(ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                  CustLedgEntry2."Remaining Amount")), Currency."Amount Rounding Precision")
            then
                LineAmount2 :=
                  Round(
                    -(ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                      CustLedgEntry2."Remaining Amount")), Currency."Amount Rounding Precision")
            else begin
                LineAmount2 := RemainingAmount2;
                LineAmount :=
                  Round(
                    ExchangeAmt(CustLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                    LineAmount2), Currency."Amount Rounding Precision");
            end;
            LineDiscount := 0;
        end;
    end;

    local procedure VendUpdateAmounts(var VendLedgEntry2: Record "Vendor Ledger Entry"; RemainingAmount2: Decimal)
    begin
        if (ApplyMethod = ApplyMethod::OneLineOneEntry) or
           (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
        then begin
            GenJnlLine3.Reset;
            GenJnlLine3.SetCurrentKey(
              "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
            GenJnlLine3.SetRange("Account Type", GenJnlLine3."Account Type"::Vendor);
            GenJnlLine3.SetRange("Account No.", VendLedgEntry2."Vendor No.");
            GenJnlLine3.SetRange("Applies-to Doc. Type", VendLedgEntry2."Document Type");
            GenJnlLine3.SetRange("Applies-to Doc. No.", VendLedgEntry2."Document No.");
            if ApplyMethod = ApplyMethod::OneLineOneEntry then
                GenJnlLine3.SetFilter("Line No.", '<>%1', GenJnlLine."Line No.")
            else
                GenJnlLine3.SetFilter("Line No.", '<>%1', GenJnlLine2."Line No.");
            if VendLedgEntry2."Document Type" <> VendLedgEntry2."Document Type"::" " then
                if GenJnlLine3.Find('-') then
                    GenJnlLine3.FieldError(
                      "Applies-to Doc. No.",
                      StrSubstNo(
                        Text031,
                        VendLedgEntry2."Document Type", VendLedgEntry2."Document No.",
                        VendLedgEntry2."Vendor No."));
        end;

        DocType := Format(VendLedgEntry2."Document Type");
        DocNo := VendLedgEntry2."Document No.";
        ExtDocNo := VendLedgEntry2."External Document No.";
        DocDate := VendLedgEntry2."Posting Date";
        CurrencyCode2 := VendLedgEntry2."Currency Code";
        VendLedgEntry2.CalcFields("Remaining Amount");

        LineAmount := -(VendLedgEntry2."Remaining Amount" - VendLedgEntry2."Remaining Pmt. Disc. Possible" -
          VendLedgEntry2."Accepted Payment Tolerance");

        LineAmount2 :=
          Round(
            ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
            Currency."Amount Rounding Precision");

        if (((VendLedgEntry2."Document Type" = VendLedgEntry2."Document Type"::Invoice) or
           (VendLedgEntry2."Document Type" = VendLedgEntry2."Document Type"::"Credit Memo")) and
           (GenJnlLine."Posting Date" <= VendLedgEntry2."Pmt. Discount Date") and
           (LineAmount2 <= RemainingAmount2)) or VendLedgEntry2."Accepted Pmt. Disc. Tolerance"
        then begin
            LineDiscount := -VendLedgEntry2."Remaining Pmt. Disc. Possible";
            if VendLedgEntry2."Accepted Payment Tolerance" <> 0 then
                LineDiscount := LineDiscount - VendLedgEntry2."Accepted Payment Tolerance";
        end else begin
            if RemainingAmount2 >=
                Round(
                 -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                   VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision")
             then begin
                LineAmount2 :=
                  Round(
                    -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                      VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision");
                LineAmount :=
                  Round(
                    ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                    LineAmount2), Currency."Amount Rounding Precision");
            end else begin
                LineAmount2 := RemainingAmount2;
                LineAmount :=
                  Round(
                    ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                    LineAmount2), Currency."Amount Rounding Precision");
            end;
            LineDiscount := 0;
        end;
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text1280000;
        ExponentText[4] := Text1280001;
    end;


    procedure InitializeRequest(BankAcc: Code[20]; LastCheckNo: Code[20]; NewOneCheckPrVend: Boolean; NewReprintChecks: Boolean; NewTestPrint: Boolean; NewPreprintedStub: Boolean)
    begin
        if BankAcc <> '' then
            if BankAcc2.Get(BankAcc) then begin
                UseCheckNo := LastCheckNo;
                OneCheckPrVendor := NewOneCheckPrVend;
                ReprintChecks := NewReprintChecks;
                TestPrint := NewTestPrint;
                PreprintedStub := NewPreprintedStub;
            end;
    end;


    procedure ExchangeAmt(PostingDate: Date; CurrencyCode: Code[10]; CurrencyCode2: Code[10]; Amount: Decimal) Amount2: Decimal
    begin
        if (CurrencyCode <> '') and (CurrencyCode2 = '') then
            Amount2 :=
              CurrencyExchangeRate.ExchangeAmtLCYToFCY(
                PostingDate, CurrencyCode, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode))
        else
            if (CurrencyCode = '') and (CurrencyCode2 <> '') then
                Amount2 :=
                  CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                    PostingDate, CurrencyCode2, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode2))
            else
                if (CurrencyCode <> '') and (CurrencyCode2 <> '') and (CurrencyCode <> CurrencyCode2) then
                    Amount2 := CurrencyExchangeRate.ExchangeAmtFCYToFCY(PostingDate, CurrencyCode2, CurrencyCode, Amount)
                else
                    Amount2 := Amount;
    end;
}

