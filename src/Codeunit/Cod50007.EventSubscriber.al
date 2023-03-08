codeunit 50007 "Event Subscriber"
{
    // >> Codeunit "Gen. Jnl.-Post Line"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode(VAR GenJnlLine: Record "Gen. Journal Line"; CheckLine: Boolean; VAR IsPosted: Boolean; VAR GLReg: Record "G/L Register")
    var
        SingleInstance: Codeunit "Single Instance";
    begin
        if SingleInstance.GetShipTo() > '' then
            SetShipToContact(SingleInstance.GetShipTo());
        SingleInstance.SetShipTo('');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInitCustLedgEntry', '', false, false)]
    local procedure OnBeforeInitCustLedgEntry(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        StaticUnit.SetBool(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', false, false)]
    local procedure OnBeforeCustLedgEntryInsert(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
        DimSetEntry: Record "Dimension Set Entry";
        Dim_Value: Record "Dimension Value";
        CLE: Record "Cust. Ledger Entry";
    begin
        if StaticUnit.GetBool() then begin
            //6700
            IF DimSetEntry.GET(GenJournalLine."Dimension Set ID", 'OWNER2') THEN BEGIN
                CustLedgerEntry.OWNER2 := DimSetEntry."Dimension Value Code";
                IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN BEGIN
                    CustLedgerEntry."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                    CustLedgerEntry."Group Heade" := Dim_Value."Group-Head";
                END;
                IF GenJournalLine."Applies-to Doc. No." <> '' THEN BEGIN
                    CLE.RESET;
                    CLE.SETRANGE("Document No.", GenJournalLine."Applies-to Doc. No.");
                    IF CLE.FINDFIRST THEN
                        CustLedgerEntry."Group Heade" := CLE."Group Heade";
                END;
            END;
            CLEAR(DimSetEntry);
            IF DimSetEntry.GET(GenJournalLine."Dimension Set ID", 'OWNER1') THEN
                CustLedgerEntry.OWNER1 := DimSetEntry."Dimension Value Code";
            //6700
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', false, false)]
    local procedure OnAfterInitGLEntry(VAR GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        //GLEntry."Cheque No." := GenJournalLine."Cheque No.";//TEAM::1426
        GLEntry."Cheque No." := GenJournalLine."Cheque No. 2"; // #94
        GLEntry."Description 3" := GenJournalLine."Description 3 ";//#122
        GLEntry."Cheque Date" := GenJournalLine."Cheque Date";//TEAM::1426
        GLEntry."Applies-to Doc. No." := GenJournalLine."Applies-to Doc. No.";//TEAM::1426
        GLEntry."Issuing Bank Name" := GenJournalLine."Issuing Bank Name"; //TEAM::1426
        GLEntry."Payment Made By" := GenJournalLine."Payment Made By";//TEAM::1426
                                                                      //GLEntry."Collection No." := GenJnlLine."Collection No.";//TEAM::1426
        GLEntry.VALIDATE("Collection No.", GenJournalLine."Collection No.");//2021 Auto Validate Collection No.
        GLEntry."External Doc. Date" := GenJournalLine."External Doc. Date"; //6700
        GLEntry."Group Head" := GenJournalLine."Group Head";//TEAM::1426
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', false, false)]
    local procedure OnAfterInitCustLedgEntry(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        //TEAM::1426
        CustLedgerEntry."RTBNo." := GenJournalLine."Information No.";
        CustLedgerEntry."Nature of Invoice" := GenJournalLine."Invoice Type";
        //CustLedgerEntry."Cheque No." := GenJournalLine."Cheque No.";
        CustLedgerEntry."Cheque No." := GenJournalLine."Cheque No. 2";// #94
        CustLedgerEntry."Description 3" := GenJournalLine."Description 3 ";//#122
        CustLedgerEntry."Cheque Date" := GenJournalLine."Cheque Date";
        CustLedgerEntry."Payment Made By" := GenJournalLine."Payment Made By";
        CustLedgerEntry.OWNER2 := GenJournalLine.OWNER2;//
        CustLedgerEntry."Ship-to Contact" := ContactTextGlobal;
        //TEAM:;1426
    end;

    // >>#122
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitVendLedgEntry', '', false, false)]
    local procedure OnAfterInitVendLedgEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line"; var GLRegister: Record "G/L Register")
    begin
        VendorLedgerEntry."Description 3" := GenJournalLine."Description 3 ";
    end;
    // <<#122

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterFindAmtForAppln', '', false, false)]
    local procedure OnAfterFindAmtForAppln(VAR NewCVLedgEntryBuf: Record "CV Ledger Entry Buffer"; VAR OldCVLedgEntryBuf: Record "CV Ledger Entry Buffer"; VAR OldCVLedgEntryBuf2: Record "CV Ledger Entry Buffer"; VAR AppliedAmount: Decimal; VAR AppliedAmountLCY: Decimal; VAR OldAppliedAmount: Decimal)
    begin
        //LCMS Integration
        CreateNewEntryForApplication(OldCVLedgEntryBuf2, NewCVLedgEntryBuf, AppliedAmount, AppliedAmountLCY);  // 9442
                                                                                                               //LCMS Integration End-
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryModify', '', false, false)]
    local procedure OnBeforeCustLedgEntryModify(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin
        //LCMS Integration
        CreateNewEntryForUnapply(CustLedgerEntry, DetailedCustLedgEntry);
        //LCMS Integration END-
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnCustPostApplyCustLedgEntryOnBeforePostDtldCustLedgEntries', '', false, false)]
    local procedure OnCustPostApplyCustLedgEntryOnBeforePostDtldCustLedgEntries(var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        CLE: Record "Cust. Ledger Entry";
        DimSetEntry: Record "Dimension Set Entry";
        Dim_Value: Record "Dimension Value";
        SingleInstance: Codeunit "Single Instance";
    begin
        //6700
        CustEntryNoGlobal := SingleInstance.GetApplyEntryNo();
        IF CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Payment THEN BEGIN
            IF CLE.GET(CustEntryNoGlobal) THEN;
            IF DimSetEntry.GET(CLE."Dimension Set ID", 'OWNER2') THEN BEGIN
                CustLedgerEntry.OWNER2 := DimSetEntry."Dimension Value Code";
                IF CustLedgerEntry."Sub Group Owner 2" = '' THEN
                    IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN
                        CustLedgerEntry."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                CustLedgerEntry."Group Heade" := CLE."Group Heade";
            END;
            CLEAR(DimSetEntry);
            IF CustLedgerEntry.GET(CLE."Dimension Set ID", 'OWNER1') THEN
                CustLedgerEntry.OWNER1 := DimSetEntry."Dimension Value Code";
        END ELSE BEGIN
            IF CLE.GET(CustEntryNoGlobal) THEN;
            IF DimSetEntry.GET(CustLedgerEntry."Dimension Set ID", 'OWNER2') THEN BEGIN
                CLE.OWNER2 := DimSetEntry."Dimension Value Code";
                IF CLE."Sub Group Owner 2" = '' THEN
                    IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN
                        CLE."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                CLE."Group Heade" := CustLedgerEntry."Group Heade";
                CLE.MODIFY;
            END;
            CLEAR(DimSetEntry);
            IF DimSetEntry.GET(CustLedgerEntry."Dimension Set ID", 'OWNER1') THEN BEGIN
                CLE.OWNER1 := DimSetEntry."Dimension Value Code";
                CLE.MODIFY
            END;
        END;
        //6700
    end;

    procedure SetShipToContact(ContactText: Text[100])
    begin
        ContactTextGlobal := ContactText;
    end;

    procedure CreateNewEntryForApplication(CustLedgerEntryRecc: Record "CV Ledger Entry Buffer"; NewCustLedgerEntryRecc: Record "CV Ledger Entry Buffer"; AppAmount: Decimal; AppamountLCY: Decimal)
    var
        LastNoEntry: Integer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ApprovalFortheLCMS: Record "Approval For the LCMS";
        EntryNo: Integer;
        DimensionValue: Record "Dimension Value";
        GenJournalBatch: Record "Gen. Journal Batch";
    begin
        CLEAR(SalesInvoiceHeader);
        CLEAR(PostDateTime);
        PostDateTime := CREATEDATETIME(CustLedgerEntryRecc."Posting Date", TIME);
        IF CustLedgerEntryRecc."Document Type" = CustLedgerEntryRecc."Document Type"::Payment THEN BEGIN
            IF NewCustLedgerEntryRecc."Document Type" = NewCustLedgerEntryRecc."Document Type"::Invoice THEN BEGIN
                SalesInvoiceHeader.GET(NewCustLedgerEntryRecc."Document No.");
                // IF SalesInvoiceHeader."LCMS Data" THEN BEGIN

                ApprovalFortheLCMS.RESET;
                ApprovalFortheLCMS.SETRANGE("Invoice No", SalesInvoiceHeader."No.");
                ApprovalFortheLCMS.SETRANGE("Applies-to Doc. No.", CustLedgerEntryRecc."Document No.");
                ApprovalFortheLCMS.SETRANGE(Status, ApprovalFortheLCMS.Status::Open);
                IF ApprovalFortheLCMS.FINDFIRST THEN BEGIN
                    ApprovalFortheLCMS.Status := ApprovalFortheLCMS.Status::Applied;
                    ApprovalFortheLCMS."Unapplied By" := USERID;
                    ApprovalFortheLCMS."Unapplied Date-Time" := CURRENTDATETIME;
                    ApprovalFortheLCMS.MODIFY;
                END ELSE BEGIN
                    ApprovalFortheLCMS.RESET;
                    IF ApprovalFortheLCMS.FINDLAST THEN
                        EntryNo := ApprovalFortheLCMS."Entry No" + 1
                    ELSE
                        EntryNo := 1;
                    CLEAR(ApprovalFortheLCMS);


                    ApprovalFortheLCMS.INIT;
                    ApprovalFortheLCMS."Entry No" := EntryNo;
                    ApprovalFortheLCMS."Invoice No" := SalesInvoiceHeader."No.";
                    ApprovalFortheLCMS."Rtb No" := SalesInvoiceHeader."Pre-Assigned No.";
                    ApprovalFortheLCMS."Payment Amount" := ABS(CustLedgerEntryRecc.Amount);
                    ApprovalFortheLCMS."Payment Amount LCY" := ABS(CustLedgerEntryRecc."Amount (LCY)");
                    ApprovalFortheLCMS."Applies-to Doc. Type" := ApprovalFortheLCMS."Applies-to Doc. Type"::Payment;
                    ApprovalFortheLCMS."Applies-to Doc. No." := CustLedgerEntryRecc."Document No.";
                    ApprovalFortheLCMS."Payment Date time" := PostDateTime;
                    ApprovalFortheLCMS."Applies Remaining Amount" := ABS(AppAmount);
                    ApprovalFortheLCMS."Applies Remaining Amount LCY" := ABS(AppamountLCY);
                    ApprovalFortheLCMS."Payment Location" := CustLedgerEntryRecc."Global Dimension 1 Code";

                    GenJournalBatch.RESET;
                    GenJournalBatch.SETRANGE("Journal Template Name", 'JOURNAL VO');
                    GenJournalBatch.SETRANGE(Name, 'JVWRITEOFF');
                    GenJournalBatch.SETRANGE("Posting No. Series", CustLedgerEntryRecc."No. Series");
                    IF GenJournalBatch.FINDFIRST THEN
                        ApprovalFortheLCMS.Writeoff := TRUE;
                    ApprovalFortheLCMS.INSERT(TRUE);

                END;
            END;
        END;


        IF CustLedgerEntryRecc."Document Type" = CustLedgerEntryRecc."Document Type"::Invoice THEN BEGIN
            CLEAR(PostDateTime);
            PostDateTime := CREATEDATETIME(NewCustLedgerEntryRecc."Posting Date", TIME);
            IF NewCustLedgerEntryRecc."Document Type" = NewCustLedgerEntryRecc."Document Type"::Payment THEN BEGIN
                SalesInvoiceHeader.GET(CustLedgerEntryRecc."Document No.");
                //IF SalesInvoiceHeader."LCMS Data" THEN BEGIN
                ApprovalFortheLCMS.RESET;
                ApprovalFortheLCMS.SETRANGE("Invoice No", SalesInvoiceHeader."No.");
                ApprovalFortheLCMS.SETRANGE("Applies-to Doc. No.", NewCustLedgerEntryRecc."Document No.");
                ApprovalFortheLCMS.SETRANGE(Status, ApprovalFortheLCMS.Status::Open);
                IF ApprovalFortheLCMS.FINDFIRST THEN BEGIN
                    ApprovalFortheLCMS.Status := ApprovalFortheLCMS.Status::Applied;
                    ApprovalFortheLCMS."Unapplied By" := USERID;
                    ApprovalFortheLCMS."Unapplied Date-Time" := CURRENTDATETIME;
                    ApprovalFortheLCMS.MODIFY;
                END ELSE BEGIN
                    ApprovalFortheLCMS.RESET;
                    IF ApprovalFortheLCMS.FINDLAST THEN
                        EntryNo := ApprovalFortheLCMS."Entry No" + 1
                    ELSE
                        EntryNo := 1;
                    CLEAR(ApprovalFortheLCMS);

                    ApprovalFortheLCMS.INIT;
                    ApprovalFortheLCMS."Entry No" := EntryNo;
                    ApprovalFortheLCMS."Invoice No" := SalesInvoiceHeader."No.";
                    ApprovalFortheLCMS."Rtb No" := SalesInvoiceHeader."Pre-Assigned No.";
                    ApprovalFortheLCMS."Payment Amount" := ABS(NewCustLedgerEntryRecc.Amount);
                    ApprovalFortheLCMS."Payment Amount LCY" := ABS(NewCustLedgerEntryRecc."Amount (LCY)");
                    ApprovalFortheLCMS."Applies-to Doc. Type" := ApprovalFortheLCMS."Applies-to Doc. Type"::Payment;
                    ApprovalFortheLCMS."Applies-to Doc. No." := NewCustLedgerEntryRecc."Document No.";
                    ApprovalFortheLCMS."Payment Date time" := PostDateTime;
                    ApprovalFortheLCMS."Applies Remaining Amount" := ABS(AppAmount);
                    ApprovalFortheLCMS."Applies Remaining Amount LCY" := ABS(AppamountLCY);
                    ApprovalFortheLCMS."Payment Location" := NewCustLedgerEntryRecc."Global Dimension 1 Code";
                    GenJournalBatch.RESET;
                    GenJournalBatch.SETRANGE("Journal Template Name", 'JOURNAL VO');
                    GenJournalBatch.SETRANGE(Name, 'JVWRITEOFF');
                    GenJournalBatch.SETRANGE("Posting No. Series", NewCustLedgerEntryRecc."No. Series");
                    IF GenJournalBatch.FINDFIRST THEN
                        ApprovalFortheLCMS.Writeoff := TRUE;
                    ApprovalFortheLCMS.INSERT(TRUE);


                END;
            END;
        END;
    end;

    procedure CreateNewEntryForUnapply(UnApplyCustLedgerEntryRecc: Record "Cust. Ledger Entry"; DetailedCustLedg: Record "Detailed Cust. Ledg. Entry")
    var
        UNLastNoEntry: Integer;
        CustLedgerEntrycheckUnapply: Record "Cust. Ledger Entry";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        CL: Record "Cust. Ledger Entry";
        ApprovalFortheLCMS: Record "Approval For the LCMS";
        EntryNo: Integer;
        DimensionValue: Record "Dimension Value";
    begin
        CLEAR(SalesInvoiceHeader);
        IF DetailedCustLedg."Applied Cust. Ledger Entry No." <> DetailedCustLedg."Cust. Ledger Entry No." THEN BEGIN
            CustLedgerEntrycheckUnapply.GET(DetailedCustLedg."Applied Cust. Ledger Entry No.");
            IF CustLedgerEntrycheckUnapply."Document Type" = CustLedgerEntrycheckUnapply."Document Type"::Invoice THEN BEGIN
                IF SalesInvoiceHeader.GET(CustLedgerEntrycheckUnapply."Document No.") THEN;
                CL.GET(DetailedCustLedg."Cust. Ledger Entry No.");
            END ELSE BEGIN
                CustLedgerEntrycheckUnapply.GET(DetailedCustLedg."Cust. Ledger Entry No.");
                CL.GET(DetailedCustLedg."Applied Cust. Ledger Entry No.");
                IF SalesInvoiceHeader.GET(CustLedgerEntrycheckUnapply."Document No.") THEN;
            END;
            CLEAR(PostDateTime);
            CL.CALCFIELDS(Amount, "Amount (LCY)");
            //IF SalesInvoiceHeader."LCMS Data" THEN BEGIN
            PostDateTime := CREATEDATETIME(CL."Posting Date", TIME);
            ApprovalFortheLCMS.RESET;
            ApprovalFortheLCMS.SETRANGE("Invoice No", SalesInvoiceHeader."No.");
            ApprovalFortheLCMS.SETRANGE("Applies-to Doc. No.", CL."Document No.");
            ApprovalFortheLCMS.SETRANGE(Status, ApprovalFortheLCMS.Status::Open);
            IF ApprovalFortheLCMS.FINDFIRST THEN BEGIN
                ApprovalFortheLCMS."Unapplied By" := USERID;
                ApprovalFortheLCMS."Unapplied Date-Time" := CURRENTDATETIME;
                ApprovalFortheLCMS.Status := ApprovalFortheLCMS.Status::UnApplied;
                ApprovalFortheLCMS.MODIFY;
            END ELSE BEGIN
                ApprovalFortheLCMS.RESET;
                IF ApprovalFortheLCMS.FINDLAST THEN
                    EntryNo := ApprovalFortheLCMS."Entry No" + 1
                ELSE
                    EntryNo := 1;

                CLEAR(ApprovalFortheLCMS);

                ApprovalFortheLCMS.INIT;
                ApprovalFortheLCMS."Entry No" := EntryNo;
                ApprovalFortheLCMS."Invoice No" := SalesInvoiceHeader."No.";
                ApprovalFortheLCMS."Rtb No" := SalesInvoiceHeader."Pre-Assigned No.";
                ApprovalFortheLCMS."Payment Amount" := ABS(CL.Amount);
                ApprovalFortheLCMS."Payment Amount LCY" := ABS(CL."Amount (LCY)");
                ApprovalFortheLCMS."Applies-to Doc. Type" := ApprovalFortheLCMS."Applies-to Doc. Type"::" ";
                ApprovalFortheLCMS."Applies-to Doc. No." := CL."Document No.";
                ApprovalFortheLCMS."Payment Date time" := PostDateTime;
                ApprovalFortheLCMS."Applies Remaining Amount" := ABS(DetailedCustLedg.Amount);
                ApprovalFortheLCMS."Applies Remaining Amount LCY" := ABS(DetailedCustLedg."Amount (LCY)");
                ApprovalFortheLCMS.Unapply := TRUE;
                ApprovalFortheLCMS."Payment Location" := CL."Global Dimension 1 Code";
                ApprovalFortheLCMS.INSERT(TRUE);
            END;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitBankAccLedgEntry', '', false, false)]
    local procedure OnAfterInitBankAccLedgEntry(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
        BankAcc: Record "Bank Account";
        GLSetup: Record "General Ledger Setup";
    begin
        BankAccountLedgerEntry."Bank Acc. Posting Group" := BankAcc."Bank Acc. Posting Group";
        BankAccountLedgerEntry."Currency Code" := BankAcc."Currency Code";
        BankAccountLedgerEntry."Location Code" := GenJournalLine."Location Code";
        GLSetup.Get();
        if GLSetup."Activate Cheque No." then begin
            BankAccountLedgerEntry."Cheque No. 2" := GenJournalLine."Cheque No. 2";
            BankAccountLedgerEntry."Cheque Date" := GenJournalLine."Cheque Date";
        end else begin
            BankAccountLedgerEntry."Cheque No. 2" := GenJournalLine."Document No.";
            BankAccountLedgerEntry."Cheque Date" := GenJournalLine."Posting Date";
        end;
        BankAccountLedgerEntry."Description 3" := GenJournalLine."Description 3 ";//#122
        /*if GLSetup."Activate Cheque No." then begin
            BankAccountLedgerEntry."Cheque No. 2" := GenJournalLine."Cheque No. 2";
            BankAccountLedgerEntry."Cheque Date" := GenJournalLine."Cheque Date";
        end;
        if (not GLSetup."Activate Cheque No.") and (GenJournalLine."Bank Payment Type" IN [GenJournalLine."Bank Payment Type"::"Manual Check",
                                                                                           GenJournalLine."Bank Payment Type"::" ",
                                                                                           GenJournalLine."Bank Payment Type"::"Computer Check"])
        then begin
            BankAccountLedgerEntry."Cheque No. 2" := GenJournalLine."Document No.";
            BankAccountLedgerEntry."Cheque Date" := GenJournalLine."Posting Date";
        end;
        */
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCheckLedgEntry', '', false, false)]
    local procedure OnAfterInitCheckLedgEntry(var CheckLedgerEntry: Record "Check Ledger Entry"; BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    var
        GLSetup: Record "General Ledger Setup";
    begin
        CheckLedgerEntry."Bank Payment Type" := CheckLedgerEntry."Bank Payment Type"::"Manual Check";
        CheckLedgerEntry."Check Date" := BankAccountLedgerEntry."Posting Date";
        GLSetup.Get();
        if not GLSetup."Activate Cheque No." then
            CheckLedgerEntry."Cheque No. 2" := BankAccountLedgerEntry."Document No."
        else begin
            CheckLedgerEntry."Cheque No. 2" := BankAccountLedgerEntry."Cheque No. 2";
            CheckLedgerEntry."Check Date" := BankAccountLedgerEntry."Cheque Date";
        end;
        CheckLedgerEntry."Description 3 " := BankAccountLedgerEntry."Description 3"; //#122

    end;

    var
        StaticUnit: Codeunit "Static Unit";
        ContactTextGlobal: Text[100];
        CustEntryNoGlobal: Integer;
        PostDateTime: DateTime;
    // << Codeunit "Gen. Jnl.-Post Line"
    // >> Table "Cust. Ledger Entry"

    // [EventSubscriber(ObjectType::Table, database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromCVLedgEntryBuffer', '', false, false)]
    // local procedure OnAfterCopyCustLedgerEntryFromCVLedgEntryBuffer(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; CVLedgerEntryBuffer: Record "CV Ledger Entry Buffer")
    // var
    //     CLE: Record "Cust. Ledger Entry";
    //     DimSetEntry: Record "Dimension Set Entry";
    //     Dim_Value: Record "Dimension Value";
    //     SingleInstance: Codeunit "Single Instance";
    // begin
    //     //6700
    //     CustEntryNoGlobal := SingleInstance.GetApplyEntryNo();
    //     IF CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Payment THEN BEGIN
    //         IF CLE.GET(CustEntryNoGlobal) THEN;
    //         IF DimSetEntry.GET(CLE."Dimension Set ID", 'OWNER2') THEN BEGIN
    //             CustLedgerEntry.OWNER2 := DimSetEntry."Dimension Value Code";
    //             IF CustLedgerEntry."Sub Group Owner 2" = '' THEN
    //                 IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN
    //                     CustLedgerEntry."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
    //             CustLedgerEntry."Group Heade" := CLE."Group Heade";
    //         END;
    //         CLEAR(DimSetEntry);
    //         IF CustLedgerEntry.GET(CLE."Dimension Set ID", 'OWNER1') THEN
    //             CustLedgerEntry.OWNER1 := DimSetEntry."Dimension Value Code";
    //     END ELSE BEGIN
    //         IF CLE.GET(CustEntryNoGlobal) THEN;
    //         IF DimSetEntry.GET(CustLedgerEntry."Dimension Set ID", 'OWNER2') THEN BEGIN
    //             CLE.OWNER2 := DimSetEntry."Dimension Value Code";
    //             IF CLE."Sub Group Owner 2" = '' THEN
    //                 IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN
    //                     CLE."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
    //             CLE."Group Heade" := CustLedgerEntry."Group Heade";
    //             CLE.MODIFY;
    //         END;
    //         CLEAR(DimSetEntry);
    //         IF DimSetEntry.GET(CustLedgerEntry."Dimension Set ID", 'OWNER1') THEN BEGIN
    //             CLE.OWNER1 := DimSetEntry."Dimension Value Code";
    //             CLE.MODIFY
    //         END;
    //     END;
    //     //6700
    // end;
    // << Table "Cust. Ledger Entry"
    // >> Codeunit "Sales-Post"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(VAR SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; VAR HideProgressWindow: Boolean)
    var
        ShiptoAddress: Record "Ship-to Address";
        i: Integer;
        CharToCheck: Text;
        Cont: Record Contact;
        DimSEntry: Record "Dimension Set Entry";
        StaticUnit: Codeunit "Single Instance";
    begin
        StaticUnit.SetPreview(PreviewMode);
        //E-Invoicing
        IF SalesHeader."Shortcut Dimension 1 Code" = '1' THEN BEGIN
            IF ShiptoAddress.GET(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code") THEN BEGIN
                ShiptoAddress.TESTFIELD("Country/Region Code");
                ShiptoAddress.TESTFIELD("Transaction Type");
                IF SalesHeader."Currency Code" = '' THEN BEGIN
                    ShiptoAddress.TESTFIELD(State);
                    ShiptoAddress.TESTFIELD(City);
                END;
            END;
        END;
        //E-Invoicing
        // 7739
        IF UPPERCASE(SalesHeader."Ship-to Country/Region Code") = 'INDIA' THEN BEGIN
            IF STRLEN(SalesHeader."Ship-to Post Code") <> 6 THEN
                ERROR('Ship-to Post Code must be of length 6 only.');
            i := 1;
            WHILE i <= 6 DO BEGIN
                CharToCheck := COPYSTR(SalesHeader."Ship-to Post Code", i, 1);
                IF NOT (CharToCheck IN ['0' .. '9']) THEN
                    ERROR('Ship-to Post Code should be in numeric only');
                i += 1;
            END;
        END;
        // 7739
        IF Cont.GET(SalesHeader."Bill-to Contact No.") THEN BEGIN       //TEAM::1426/02
            SalesHeader."Ship-to Contact" := Cont.Initials + ' ' + Cont."F Name" + ' ' + Cont."M Name" + ' ' + Cont."L Name";
            SalesHeader.MODIFY;
        END;
        //6700
        IF COMPANYNAME <> 'INSTITUTE OF BUSINESS LAWS' THEN BEGIN
            DimSEntry.RESET;
            DimSEntry.SETRANGE("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimSEntry.SETRANGE("Dimension Code", 'OWNER2');
            IF NOT DimSEntry.FINDFIRST THEN
                ERROR('You can not post the invoice without Owner 2 selected in the dimension!!!');

            DimSEntry.RESET;
            DimSEntry.SETRANGE("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimSEntry.SETRANGE("Dimension Code", 'OWNER1');
            IF NOT DimSEntry.FINDFIRST THEN
                ERROR('You can not post the invoice without Owner 1 selected in the dimension!!!');
        END;
        //6700
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInvoicePostingBufferAssignAmounts', '', false, false)]
    local procedure OnAfterInvoicePostingBufferAssignAmounts(SalesLine: Record "Sales Line"; VAR TotalAmount: Decimal; VAR TotalAmountLCY: Decimal)
    var
        SalesHeader: Record "Sales Header";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        StaticUnit: Codeunit "Single Instance";
    begin
        //InvoiceNo := SalesInvHeader."No.";

        //Team Integration Work-
        IF SalesLine."Shortcut Dimension 1 Code" <> '1' THEN BEGIN
            CLEAR(RTBNo);
            CLEAR(RTBState);
            CLEAR(InvoiceNo);
            CLEAR(InvGenDate);
            CLEAR(InvDoc);
            CLEAR(Crtb_No);
            CLEAR(CrtbStatus);
            CLEAR(CreditNoteDoc);
            CLEAR(CreditNoteDate);
            SalesHeader.get(SalesLine."Document Type", SalesLine."Document No.");
            IF SalesHeader."Document Type" IN [SalesHeader."Document Type"::Invoice] THEN BEGIN
                SalesInvHeader.Get(SalesHeader."Posting No.");
                RTBNo := SalesHeader."No.";
                RTBState := 'BL';
                InvoiceNo := SalesInvHeader."No.";
                InvGenDate := CREATEDATETIME(SalesInvHeader."Posting Date", TIME);
                StaticUnit.SetRTBValues(RTBNo, RTBState, InvoiceNo, InvGenDate);
            END;

            IF SalesHeader."Document Type" IN [SalesHeader."Document Type"::"Credit Memo"] THEN BEGIN
                //SalesCrMemoHeader.Get(SalesHeader."Posting No.");
                SalesCrMemoHeader.SetRange("Pre-Assigned No.", SalesHeader."No.");
                SalesCrMemoHeader.FindLast();
                Crtb_No := SalesHeader."No.";
                CrtbStatus := 'CC';
                CreditNoteDoc := SalesCrMemoHeader."No.";
                CreditNoteDate := CREATEDATETIME(SalesCrMemoHeader."Posting Date", TIME);
                RejreasonCrtb := '';
                StaticUnit.SetRTBValues(Crtb_No, CrtbStatus, CreditNoteDoc, CreditNoteDate);
            END;
        END;
        //Team Integration Work end-
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(VAR SalesHeader: Record "Sales Header"; VAR GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean)
    var
        PreviewMode: Boolean;
        SingleInstance: Codeunit "Single Instance";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        RespQueue: Record "LCMS Response Queue";
    begin
        //Team Integration Work-
        PreviewMode := SingleInstance.GetPreview();
        IF NOT PreviewMode THEN BEGIN
            IF (SalesHeader."Shortcut Dimension 1 Code" <> '1') and (SalesInvHdrNo > '') THEN BEGIN
                SingleInstance.GetRTBValues(RTBNo, RTBState, InvoiceNo, InvGenDate);
                if SalesInvHeader.Get(SalesInvHdrNo) then
                    IF RTBNo <> '' THEN BEGIN
                        //InvDoc := SalesInvHeader.PostedInvoiceLink(InvoiceNo);
                        RespQueue.CreateQueue(RTBNo);
                        SalesInvHeader.PostedInvoiceLink(InvoiceNo, RespQueue);
                        //LKS := LKS.LKSFunctions();
                        IF SalesInvHeader."Currency Factor" <> 0 THEN
                            ExchangRate := 1 / SalesInvHeader."Currency Factor"
                        ELSE
                            ExchangRate := 1;
                        RespQueue.RTBPayload(RTBNo, RTBState, SalesInvHeader."No.", FORMAT(InvGenDate, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), FORMAT(ExchangRate), '', '');
                        RespQueue.Insert(true);
                        Message('Success');
                        //MESSAGE(FORMAT(LKS.RTBUpdate(RTBNo,RTBState,SalesInvHeader."No.",FORMAT(InvGenDate,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
                        //,FORMAT(ExchangRate),InvDoc,'')));
                    END;
            END;
        END;
        //Team Integration Work-
        IF NOT PreviewMode THEN BEGIN
            IF (SalesHeader."Shortcut Dimension 1 Code" <> '1') and (SalesCrMemoHdrNo > '') THEN BEGIN
                SingleInstance.GetRTBValues(Crtb_No, CrtbStatus, CreditNoteDoc, CreditNoteDate);
                if SalesCrMemoHeader.Get(SalesCrMemoHdrNo) then
                    IF Crtb_No <> '' THEN BEGIN
                        //InvDoc := SalesCrMemoHeader.PostedCRLink(CreditNoteDoc);
                        RespQueue.CreateQueue(Crtb_No);
                        //, CrtbStatus, FORMAT(CreditNoteDate, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), '', '');
                        SalesCrMemoHeader.PostedCRLink(CreditNoteDoc, RespQueue);
                        //LKS := LKS.LKSFunctions();
                        IF SalesInvHeader."Currency Factor" <> 0 THEN
                            ExchangRate := 1 / SalesInvHeader."Currency Factor"
                        ELSE
                            ExchangRate := 1;
                        RespQueue.CRTBPayload(CrtbStatus, CreditNoteDoc, FORMAT(CreditNoteDate, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), '');
                        RespQueue.Insert(true);
                        Message('Success');
                        //MESSAGE(FORMAT(LKS.CRTBUpdate(Crtb_No,CrtbStatus,CreditNoteDoc,FORMAT(CreditNoteDate,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'),InvDoc,'')));
                    END;
            END;
        END;
        //Team Integration Work End-
        SingleInstance.SetPreview(false);
    end;

    // PROCEDURE GetShippingAdvice(): Boolean;
    // VAR
    //     SalesLine: Record 37;
    // BEGIN
    //     SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
    //     SalesLine.SETRANGE("Document No.", SalesHeader."No.");
    //     SalesLine.SETRANGE("Drop Shipment", FALSE);
    //     IF SalesLine.FINDSET THEN
    //         REPEAT
    //             IF SalesLine.IsShipment THEN BEGIN
    //                 IF SalesLine."Document Type" IN
    //                    [SalesLine."Document Type"::"Credit Memo",
    //                     SalesLine."Document Type"::"Return Order"]
    //                 THEN BEGIN
    //                     IF SalesLine."Quantity (Base)" <>
    //                        SalesLine."Return Qty. to Receive (Base)" + SalesLine."Return Qty. Received (Base)"
    //                     THEN
    //                         EXIT(FALSE)
    //                 END ELSE
    //                     IF SalesLine."Quantity (Base)" <>
    //                        SalesLine."Qty. to Ship (Base)" + SalesLine."Qty. Shipped (Base)"
    //                     THEN
    //                         EXIT(FALSE);
    //             END;
    //         UNTIL SalesLine.NEXT = 0;
    //     EXIT(TRUE);
    // END;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostCustomerEntry', '', false, false)]
    local procedure OnBeforePostCustomerEntry(VAR GenJnlLine: Record "Gen. Journal Line"; VAR SalesHeader: Record "Sales Header"; VAR TotalSalesLine: Record "Sales Line"; VAR TotalSalesLineLCY: Record "Sales Line"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    var
        SingleInstance: Codeunit "Single Instance";
    begin
        GenJnlLine."Information No." := SalesHeader."No.";//TEAM::1426
        GenJnlLine."Invoice Type" := SalesHeader."Invoice Type";//TEAM::1426
        SingleInstance.SetShipTo(SalesHeader."Ship-to Contact");
        //GenJnlPostLine.SetShipToContact(SalesHeader2."Ship-to Contact");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptHeaderInsert', '', false, false)]
    local procedure OnAfterSalesShptHeaderInsert(VAR SalesShipmentHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; SuppressCommit: Boolean)

    begin
        //E-Invoicing
        CLEAR(PostedSalesExt);
        PostedSalesExt.INIT;
        PostedSalesExt."No." := SalesShipmentHeader."No.";
        PostedSalesExt."Posting Date" := SalesShipmentHeader."Posting Date";
        PostedSalesExt."Posted Document Type" := PostedSalesExt."Posted Document Type"::Shipment;
        PostedSalesExt.INSERT;
        //E-Invoicing
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterReturnRcptHeaderInsert', '', false, false)]
    local procedure OnAfterReturnRcptHeaderInsert(VAR ReturnReceiptHeader: Record "Return Receipt Header"; SalesHeader: Record "Sales Header"; SuppressCommit: Boolean)
    begin
        //E-Invoicing
        CLEAR(PostedSalesExt);
        PostedSalesExt.INIT;
        PostedSalesExt."No." := ReturnReceiptHeader."No.";
        PostedSalesExt."Posting Date" := ReturnReceiptHeader."Posting Date";
        PostedSalesExt."Posted Document Type" := PostedSalesExt."Posted Document Type"::"Return Receipt";
        PostedSalesExt.INSERT;
        //E-Invoicing
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvHeaderInsert', '', false, false)]
    local procedure OnBeforeSalesInvHeaderInsert(VAR SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    var
        DimSetEntry: Record "Dimension Set Entry";
        Dim_Value: Record "Dimension Value";
    begin
        //6700
        IF DimSetEntry.GET(SalesHeader."Dimension Set ID", 'OWNER2') THEN BEGIN
            IF SalesInvHeader."Owner 2" = '' THEN
                SalesInvHeader."Owner 2" := DimSetEntry."Dimension Value Code";
            IF SalesInvHeader."Sub Group Code" = '' THEN
                IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN BEGIN
                    SalesInvHeader."Sub Group Code" := Dim_Value."Sub Group Owner 2";
                    SalesInvHeader."Group Code" := Dim_Value."Group-Head";
                END;
        END;
        IF DimSetEntry.GET(SalesHeader."Dimension Set ID", 'OWNER1`') THEN
            IF SalesInvHeader."Owner 1" = '' THEN
                SalesInvHeader."Owner 1" := DimSetEntry."Dimension Value Code";
        //6700
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', false, false)]
    local procedure OnAfterSalesInvHeaderInsert(VAR SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    begin
        //E-Invoicing
        CLEAR(PostedSalesExt);
        PostedSalesExt.INIT;
        PostedSalesExt."No." := SalesInvHeader."No.";
        PostedSalesExt."Posting Date" := SalesInvHeader."Posting Date";
        PostedSalesExt."Posted Document Type" := PostedSalesExt."Posted Document Type"::Invoice;
        PostedSalesExt.INSERT;
        //E-Invoicing
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesCrMemoHeaderInsert', '', false, false)]
    local procedure OnBeforeSalesCrMemoHeaderInsert(VAR SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    var
        DimSetEntry: Record "Dimension Set Entry";
        Dim_Value: Record "Dimension Value";
    begin
        //6700
        IF DimSetEntry.GET(SalesCrMemoHeader."Dimension Set ID", 'OWNER2') THEN BEGIN
            IF SalesCrMemoHeader."Owner 2" = '' THEN
                SalesCrMemoHeader."Owner 2" := DimSetEntry."Dimension Value Code";
            IF SalesCrMemoHeader."Sub Group Code" = '' THEN
                IF Dim_Value.GET('OWNER2', DimSetEntry."Dimension Value Code") THEN BEGIN
                    SalesCrMemoHeader."Sub Group Code" := Dim_Value."Sub Group Owner 2";
                    SalesCrMemoHeader."Group Code" := Dim_Value."Group-Head";
                END;
        END;
        IF DimSetEntry.GET(SalesCrMemoHeader."Dimension Set ID", 'OWNER1') THEN
            IF SalesCrMemoHeader."Owner 1" = '' THEN
                SalesCrMemoHeader."Owner 1" := DimSetEntry."Dimension Value Code";
        //6700
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesCrMemoHeaderInsert', '', false, false)]
    local procedure OnAfterSalesCrMemoHeaderInsert(VAR SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)

    begin
        //E-Invoicing
        CLEAR(PostedSalesExt);
        PostedSalesExt.INIT;
        PostedSalesExt."No." := SalesCrMemoHeader."No.";
        PostedSalesExt."Posting Date" := SalesCrMemoHeader."Posting Date";
        PostedSalesExt."Posted Document Type" := PostedSalesExt."Posted Document Type"::"Credit-Memo";
        PostedSalesExt.INSERT;
        //E-Invoicing
    end;

    //>>PANDU
    // >>Table::Customer
    [EventSubscriber(ObjectType::Table, database::"Customer", 'OnAfterOnInsert', '', false, false)]
    local procedure OnAfterOnInsert(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        //8112
        //2021 Automatic Flow of Posting Group
        Customer."Gen. Bus. Posting Group" := 'General';
        Customer."Customer Posting Group" := 'General';
        Customer."VAT Bus. Posting Group" := 'General';
        //2021 Automatic Flow of Posting Group
        //1426 Auto Bill to No. Update
        //  "No." := "Bill-to Customer No.";

        //TEAM::1426
        //   recDimensionValue.RESET;
        //   recDimensionValue.SETRANGE("Dimension Code",'ENTITY');
        //   recDimensionValue.SETRANGE(Code, "No.");
        //   IF NOT recDimensionValue.FIND('-') THEN BEGIN
        //      recDimensionValue.INIT;
        //      recDimensionValue.VALIDATE(Code, "No.");
        //      recDimensionValue.VALIDATE(recDimensionValue.Name,Name);
        //      recDimensionValue.VALIDATE(recDimensionValue."Dimension Value Type",recDimensionValue."Dimension Value Type"::Standard);
        //      recDimensionValue.INSERT(TRUE);
        //   END;
        //TEAM::1426
        //8112
    end;

    [EventSubscriber(ObjectType::Table, database::"Customer", 'OnAfterSetLastModifiedDateTime', '', false, false)]
    local procedure OnAfterSetLastModifiedDateTime(var Customer: Record Customer)
    var
        recDimensionValue: Record "Dimension Value";
    begin
        //ONModify
        recDimensionValue.RESET;
        recDimensionValue.SETRANGE("Dimension Code", 'ENTITY');
        recDimensionValue.SETRANGE(Code, Customer."No.");
        IF recDimensionValue.FIND('-') THEN BEGIN
            recDimensionValue.Name := Customer.Name;
            recDimensionValue.MODIFY;
        END;
        //8112        
    end;
    // <<Table::Customer

    // >>Table::Item
    [EventSubscriber(ObjectType::Table, database::"Item", 'OnBeforeOnDelete', '', false, false)]
    local procedure OnBeforeOnDelete(var Item: Record Item; var IsHandled: Boolean)
    var
        BOMComp: Record "BOM Component";
        ItemJnlLine: Record "Item Journal Line";
        StdCostWksh: Record "Standard Cost Worksheet";
        RequisitionLine: Record "Requisition Line";
        PurchOrderLine: Record "Purchase Line";
        SalesOrderLine: Record "Sales Line";
        ProdOrderComp: Record "Prod. Order Component";
        TransLine: Record "Transfer Line";
        ServInvLine: Record "Service Line";
        ProdBOMHeader: Record "Production BOM Header";
        ProdBOMLine: Record "Production BOM Line";
        ServiceContractLine: Record "Service Contract Line";
        AssemblyHeader: Record "Assembly Header";
        Text000: Label 'You cannot delete %1 %2 because there is at least one outstanding Purchase %3 that includes this item.';
        Text001: Label 'You cannot delete %1 %2 because there is at least one outstanding Sales %3 that includes this item.';
        Text002: Label 'You cannot delete %1 %2 because there are one or more outstanding production orders that include this item.';
        Text004: Label 'You cannot delete %1 %2 because there are one or more certified Production BOM that include this item.';
        Text014: Label 'You cannot delete %1 %2 because there are one or more production order component lines that include this item with a remaining quantity that is not 0.';
        Text016: Label 'You cannot delete %1 %2 because there are one or more outstanding transfer orders that include this item.';
        Text017: Label 'You cannot delete %1 %2 because there is at least one outstanding Service %3 that includes this item.';
        Text023: Label 'You cannot delete %1 %2 because there is at least one %3 that includes this item.';
    begin
        //8112
        BOMComp.RESET;
        BOMComp.SETCURRENTKEY(Type, "No.");
        BOMComp.SETRANGE(Type, BOMComp.Type::Item);
        BOMComp.SETRANGE("No.", Item."No.");

        IF NOT BOMComp.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, Item."No.", BOMComp.TABLECAPTION);

        ItemJnlLine.SETRANGE("Item No.", item."No.");
        IF NOT ItemJnlLine.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, item."No.", ItemJnlLine.TABLECAPTION);

        StdCostWksh.RESET;
        StdCostWksh.SETRANGE(Type, StdCostWksh.Type::Item);
        StdCostWksh.SETRANGE("No.", item."No.");
        IF NOT StdCostWksh.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, Item."No.", StdCostWksh.TABLECAPTION);

        RequisitionLine.SETCURRENTKEY(Type, "No.");
        RequisitionLine.SETRANGE(Type, RequisitionLine.Type::Item);
        RequisitionLine.SETRANGE("No.", Item."No.");
        IF NOT RequisitionLine.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, Item."No.", RequisitionLine.TABLECAPTION);

        PurchOrderLine.SETCURRENTKEY(Type, "No.");
        PurchOrderLine.SETRANGE(Type, PurchOrderLine.Type::Item);
        PurchOrderLine.SETRANGE("No.", Item."No.");
        IF NOT PurchOrderLine.ISEMPTY THEN
            ERROR(Text000, Item.TABLECAPTION, Item."No.", PurchOrderLine."Document Type");

        SalesOrderLine.SETCURRENTKEY(Type, "No.");
        SalesOrderLine.SETRANGE(Type, SalesOrderLine.Type::Item);
        SalesOrderLine.SETRANGE("No.", Item."No.");
        IF NOT SalesOrderLine.ISEMPTY THEN
            ERROR(Text001, Item.TABLECAPTION, Item."No.", SalesOrderLine."Document Type");

        IF ProdOrderExist(item) THEN
            ERROR(Text002, Item.TABLECAPTION, Item."No.");

        ProdOrderComp.SETCURRENTKEY(Status, "Item No.");
        ProdOrderComp.SETFILTER(Status, '..%1', ProdOrderComp.Status::Released);
        ProdOrderComp.SETRANGE("Item No.", Item."No.");
        IF NOT ProdOrderComp.ISEMPTY THEN
            ERROR(Text014, Item.TABLECAPTION, Item."No.");

        TransLine.SETCURRENTKEY("Item No.");
        TransLine.SETRANGE("Item No.", Item."No.");
        IF NOT TransLine.ISEMPTY THEN
            ERROR(Text016, Item.TABLECAPTION, Item."No.");

        ServInvLine.RESET;
        ServInvLine.SETCURRENTKEY(Type, "No.");
        ServInvLine.SETRANGE(Type, ServInvLine.Type::Item);
        ServInvLine.SETRANGE("No.", Item."No.");
        IF NOT ServInvLine.ISEMPTY THEN
            ERROR(Text017, Item.TABLECAPTION, Item."No.", ServInvLine."Document Type");

        ProdBOMLine.RESET;
        ProdBOMLine.SETCURRENTKEY(Type, "No.");
        ProdBOMLine.SETRANGE(Type, ProdBOMLine.Type::Item);
        ProdBOMLine.SETRANGE("No.", Item."No.");
        IF ProdBOMLine.FIND('-') THEN
            REPEAT
                IF ProdBOMHeader.GET(ProdBOMLine."Production BOM No.") AND
                   (ProdBOMHeader.Status = ProdBOMHeader.Status::Certified)
                THEN
                    ERROR(Text004, Item.TABLECAPTION, Item."No.");
            UNTIL ProdBOMLine.NEXT = 0;

        ServiceContractLine.RESET;
        ServiceContractLine.SETRANGE("Item No.", Item."No.");
        IF NOT ServiceContractLine.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, Item."No.", ServiceContractLine.TABLECAPTION);

        AssemblyHeader.SETCURRENTKEY("Document Type", "Item No.");
        AssemblyHeader.SETRANGE("Item No.", Item."No.");
        IF NOT AssemblyHeader.ISEMPTY THEN
            ERROR(Text023, Item.TABLECAPTION, Item."No.", AssemblyHeader.TABLECAPTION);

        //8112
    end;

    local procedure ProdOrderExist(Item: Record "Item"): Boolean
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        ProdOrderLine.SetCurrentKey(Status, "Item No.");
        ProdOrderLine.SetFilter(Status, '..%1', ProdOrderLine.Status::Released);
        ProdOrderLine.SetRange("Item No.", Item."No.");
        if not ProdOrderLine.IsEmpty() then
            exit(true);

        exit(false);
    end;
    // <<Table::Item

    // >>Table 349 Dimension Value
    [EventSubscriber(ObjectType::Table, database::"Dimension Value", 'OnBeforeUpdateCostAccFromDim', '', false, false)]
    local procedure OnBeforeUpdateCostAccFromDim(var DimensionValue: Record "Dimension Value"; var xDimensionValue: Record "Dimension Value"; CallingTrigger: Option OnInsert,OnModify,,OnRename; var IsHandled: Boolean)
    var
        GLSetup: Record "General Ledger Setup";
    begin
        //ONINSERT
        if CallingTrigger = CallingTrigger::OnInsert then begin
            DimensionValue."Global Dimension No." := GetGlobalDimensionNoL(DimensionValue);
            //8112
            GLSetup.GET;
            DimensionValue."Global Dimension No." := 0;
            IF GLSetup."Global Dimension 1 Code" = DimensionValue."Dimension Code" THEN
                DimensionValue."Global Dimension No." := 1;
            IF GLSetup."Global Dimension 2 Code" = DimensionValue."Dimension Code" THEN
                DimensionValue."Global Dimension No." := 2;
            //8112
        end
        else
            if CallingTrigger = CallingTrigger::OnModify then begin
                DimensionValue."Global Dimension No." := GetGlobalDimensionNoL(DimensionValue);
                //8112
                IF DimensionValue."Dimension Code" <> xDimensionValue."Dimension Code" THEN BEGIN
                    GLSetup.GET;
                    DimensionValue."Global Dimension No." := 0;
                    IF GLSetup."Global Dimension 1 Code" = DimensionValue."Dimension Code" THEN
                        DimensionValue."Global Dimension No." := 1;
                    IF GLSetup."Global Dimension 2 Code" = DimensionValue."Dimension Code" THEN
                        DimensionValue."Global Dimension No." := 2;
                END;
                //8112
            end;
    end;

    local procedure GetGlobalDimensionNoL(DimensionValue: Record "Dimension Value"): Integer
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        GeneralLedgerSetup.Get();
        case DimensionValue."Dimension Code" of
            GeneralLedgerSetup."Global Dimension 1 Code":
                exit(1);
            GeneralLedgerSetup."Global Dimension 2 Code":
                exit(2);
            GeneralLedgerSetup."Shortcut Dimension 3 Code":
                exit(3);
            GeneralLedgerSetup."Shortcut Dimension 4 Code":
                exit(4);
            GeneralLedgerSetup."Shortcut Dimension 5 Code":
                exit(5);
            GeneralLedgerSetup."Shortcut Dimension 6 Code":
                exit(6);
            //GeneralLedgerSetup."Shortcut Dimension 7 Code":
            //    exit(7);
            //GeneralLedgerSetup."Shortcut Dimension 8 Code":
            //    exit(8);            
            GeneralLedgerSetup."Shortcut Dimension 9 Code":
                EXIT(9);
            GeneralLedgerSetup."Shortcut Dimension 10 Code":
                EXIT(10);
            GeneralLedgerSetup."Shortcut Dimension 11 Code":
                EXIT(11);
            GeneralLedgerSetup."Shortcut Dimension 12 Code":
                EXIT(12);
            GeneralLedgerSetup."Shortcut Dimension 13 Code":
                EXIT(13);
            GeneralLedgerSetup."Shortcut Dimension 14 Code":
                EXIT(14);
            GeneralLedgerSetup."Shortcut Dimension 15 Code":
                EXIT(15);
            else
                exit(0);
        end;
    end;
    // <<Table 349 Dimension Value

    // >>Table 37 Sales Line
    //OnValidate- "No."
    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnValidateNoOnBeforeUpdateDates', '', false, false)]
    local procedure OnValidateNoOnBeforeUpdateDates(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; CallingFieldNo: Integer; var IsHandled: Boolean; var TempSalesLine: Record "Sales Line" temporary)
    begin
        //8112

        //TBD
        /*
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Quote THEN BEGIN
            IF (SalesHeader."Sell-to Customer No." = '') AND
                (SalesHeader."Sell-to Customer Template Code" = '')
            THEN
                ERROR(
                  Text031,
                  SalesHeader.FIELDCAPTION("Sell-to Customer No."),
                  SalesHeader.FIELDCAPTION("Sell-to Customer Template Code"));
            IF (SalesHeader."Bill-to Customer No." = '') AND
                (SalesHeader."Bill-to Customer Template Code" = '')
            THEN
                ERROR(
                  Text031,
                  SalesHeader.FIELDCAPTION("Bill-to Customer No."),
                  SalesHeader.FIELDCAPTION("Bill-to Customer Template Code"));
        END ELSE
            SalesHeader.TESTFIELD("Sell-to Customer No.");
        */

        SalesLine."Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
        SalesLine."Currency Code" := SalesHeader."Currency Code";
        SalesLine."Location Code" := SalesHeader."Location Code";
        //IF SalesLine."Location Code" = '' THEN BEGIN
        //    GetCompanyInformation;
        //    SalesLine."Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
        //END ELSE BEGIN
        //    SalesLine.GetLocation("Location Code");
        //    SalesLine."Service Tax Registration No." := Location."Service Tax Registration No."
        //END;        
        SalesLine."Customer Price Group" := SalesHeader."Customer Price Group";
        SalesLine."Customer Disc. Group" := SalesHeader."Customer Disc. Group";
        SalesLine."Allow Line Disc." := SalesHeader."Allow Line Disc.";
        SalesLine."Transaction Type" := SalesHeader."Transaction Type";
        SalesLine."Transport Method" := SalesHeader."Transport Method";
        SalesLine."Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
        SalesLine."Gen. Bus. Posting Group" := SalesHeader."Gen. Bus. Posting Group";
        SalesLine."VAT Bus. Posting Group" := SalesHeader."VAT Bus. Posting Group";
        SalesLine."Exit Point" := SalesHeader."Exit Point";
        SalesLine.Area := SalesHeader.Area;
        SalesLine."Transaction Specification" := SalesHeader."Transaction Specification";
        SalesLine."Tax Area Code" := SalesHeader."Tax Area Code";
        SalesLine."Tax Liable" := SalesHeader."Tax Liable";
        IF NOT SalesLine."System-Created Entry" AND (SalesLine."Document Type" = SalesLine."Document Type"::Order) AND (SalesLine.Type <> SalesLine.Type::" ") THEN
            SalesLine."Prepayment %" := SalesHeader."Prepayment %";
        SalesLine."Prepayment Tax Area Code" := SalesHeader."Tax Area Code";
        SalesLine."Prepayment Tax Liable" := SalesHeader."Tax Liable";
        SalesLine."Responsibility Center" := SalesHeader."Responsibility Center";
        SalesLine."Assessee Code" := SalesHeader."Assessee Code";
        //SalesLine."Form Code" := SalesHeader."Form Code";
        //SalesLine."Form No." := SalesHeader."Form No.";
        //SalesLine."Excise Bus. Posting Group" := SalesHeader."Excise Bus. Posting Group";
        //SalesLine."Free Supply" := SalesHeader."Free Supply";

        SalesLine."Shipping Agent Code" := SalesHeader."Shipping Agent Code";
        SalesLine."Shipping Agent Service Code" := SalesHeader."Shipping Agent Service Code";
        SalesLine."Outbound Whse. Handling Time" := SalesHeader."Outbound Whse. Handling Time";
        SalesLine."Shipping Time" := SalesHeader."Shipping Time";
        //8112
    end;

    // <<Table 37 Sales Line

    // >>Table 36 Sales Header
    //OnInsert
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnAfterOnInsert', '', false, false)]
    local procedure OnAfterOnInsertSH(var SalesHeader: Record "Sales Header")
    begin
        IF SalesHeader.GETFILTER("Sell-to Customer No.") <> '' THEN
            IF SalesHeader.GETRANGEMIN(SalesHeader."Sell-to Customer No.") = SalesHeader.GETRANGEMAX(SalesHeader."Sell-to Customer No.") THEN
                SalesHeader.VALIDATE(SalesHeader."Sell-to Customer No.", SalesHeader.GETRANGEMIN(SalesHeader."Sell-to Customer No."));

        IF SalesHeader.GETFILTER("Sell-to Contact No.") <> '' THEN
            IF SalesHeader.GETRANGEMIN(SalesHeader."Sell-to Contact No.") = SalesHeader.GETRANGEMAX(SalesHeader."Sell-to Contact No.") THEN
                SalesHeader.VALIDATE(SalesHeader."Sell-to Contact No.", SalesHeader.GETRANGEMIN(SalesHeader."Sell-to Contact No."));
    end;

    //SellToCustomerNo
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnValidateSellToCustomerNoAfterInit', '', false, false)]
    local procedure OnValidateSellToCustomerNoAfterInit(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        SalesHeader."No. Series" := xSalesHeader."No. Series";
        //8112
        SalesHeader.InitRecord;
        IF xSalesHeader."Shipping No." <> '' THEN BEGIN
            SalesHeader."Shipping No. Series" := xSalesHeader."Shipping No. Series";
            SalesHeader."Shipping No." := xSalesHeader."Shipping No.";
        END;
        IF xSalesHeader."Posting No." <> '' THEN BEGIN
            SalesHeader."Posting No. Series" := xSalesHeader."Posting No. Series";
            SalesHeader."Posting No." := xSalesHeader."Posting No.";
        END;
        IF xSalesHeader."Return Receipt No." <> '' THEN BEGIN
            SalesHeader."Return Receipt No. Series" := xSalesHeader."Return Receipt No. Series";
            SalesHeader."Return Receipt No." := xSalesHeader."Return Receipt No.";
        END;
        IF xSalesHeader."Prepayment No." <> '' THEN BEGIN
            SalesHeader."Prepayment No. Series" := xSalesHeader."Prepayment No. Series";
            SalesHeader."Prepayment No." := xSalesHeader."Prepayment No.";
        END;
        IF xSalesHeader."Prepmt. Cr. Memo No." <> '' THEN BEGIN
            SalesHeader."Prepmt. Cr. Memo No. Series" := xSalesHeader."Prepmt. Cr. Memo No. Series";
            SalesHeader."Prepmt. Cr. Memo No." := xSalesHeader."Prepmt. Cr. Memo No.";
        END;
        //8112
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnValidateSellToCustomerNoOnBeforeGetCust', '', false, false)]
    local procedure OnValidateSellToCustomerNoOnBeforeGetCust(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header")
    var
        Cust: Record "Customer";
    begin
        //Cust.reset;
        Cust.GET(SalesHeader."Sell-to Customer No.");
        SalesHeader.GetCust(SalesHeader."Sell-to Customer No.");
        //8112
        Cust.CheckBlockedCustOnDocs(Cust, SalesHeader."Document Type", FALSE, FALSE);
        Cust.TESTFIELD("Gen. Bus. Posting Group");
        //SalesHeader."Sell-to Customer Template Code" := '';
        SalesHeader."Sell-to Customer Name" := Cust.Name;
        //"Sell-to Customer Name" := Cust."Client Name";//TEAM::1426
        SalesHeader."Sell-to Customer Name 2" := Cust."Name 2";
        SalesHeader."Sell-to Address" := Cust.Address;
        SalesHeader."Sell-to Address 2" := Cust."Address 2";
        SalesHeader."Sell-to City" := Cust.City;
        SalesHeader."Sell-to Post Code" := Cust."Post Code";
        SalesHeader."Sell-to County" := Cust.County;
        SalesHeader."Sell-to Country/Region Code" := Cust."Country/Region Code";
        //SalesHeader."Nature of Services" := Cust."Nature of Services";
        //IF NOT SkipSellToContact THEN
        SalesHeader."Sell-to Contact" := Cust.Contact;
        SalesHeader."Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        SalesHeader."VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
        // "Tax Area Code" := Cust."Tax Area Code";
        SalesHeader."Tax Liable" := Cust."Tax Liable";
        SalesHeader."VAT Registration No." := Cust."VAT Registration No.";
        SalesHeader."VAT Country/Region Code" := Cust."Country/Region Code";
        SalesHeader."Shipping Advice" := Cust."Shipping Advice";
        SalesHeader.State := Cust."State Code";
        //SalesHeader.Structure := Cust.Structure;
        //SalesHeader."Excise Bus. Posting Group" := Cust."Excise Bus. Posting Group";
        //8112
    end;

    //BillToCustomerNo
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnAfterCheckBillToCust', '', false, false)]
    local procedure OnAfterCheckBillToCust(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; Customer: Record Customer)
    var
        Cust: Record "Customer";
        GLSetup: Record "General Ledger Setup";
        PaymentTerms: Record "Payment Terms";
    begin
        //8112
        Cust.get(SalesHeader."Bill-to Customer No.");
        //SalesHeader."Bill-to Customer Template Code" := '';
        SalesHeader."Bill-to Name" := Cust.Name;
        SalesHeader."Bill-to Name 2" := Cust."Name 2";
        SalesHeader."Bill-to Address" := Cust.Address;
        SalesHeader."Bill-to Address 2" := Cust."Address 2";
        SalesHeader."Bill-to City" := Cust.City;
        SalesHeader."Bill-to Post Code" := Cust."Post Code";
        SalesHeader."Bill-to County" := Cust.County;
        SalesHeader."Bill-to Country/Region Code" := Cust."Country/Region Code";
        //IF NOT SkipBillToContact THEN
        SalesHeader."Bill-to Contact" := Cust.Contact;
        SalesHeader."Payment Terms Code" := Cust."Payment Terms Code";
        SalesHeader."Prepmt. Payment Terms Code" := Cust."Payment Terms Code";

        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo" THEN BEGIN
            SalesHeader."Payment Method Code" := '';
            IF PaymentTerms.GET(SalesHeader."Payment Terms Code") THEN
                IF PaymentTerms."Calc. Pmt. Disc. on Cr. Memos" THEN
                    SalesHeader."Payment Method Code" := Cust."Payment Method Code"
        END ELSE
            SalesHeader."Payment Method Code" := Cust."Payment Method Code";

        SalesHeader."Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        GLSetup.GET;
        IF GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No." THEN BEGIN
            SalesHeader."VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
            SalesHeader."VAT Country/Region Code" := Cust."Country/Region Code";
            SalesHeader."VAT Registration No." := Cust."VAT Registration No.";
        END;
        SalesHeader."Customer Posting Group" := Cust."Customer Posting Group";
        SalesHeader."Currency Code" := Cust."Currency Code";
        SalesHeader."Customer Price Group" := Cust."Customer Price Group";
        SalesHeader."Prices Including VAT" := Cust."Prices Including VAT";
        SalesHeader."Allow Line Disc." := Cust."Allow Line Disc.";
        SalesHeader."Invoice Disc. Code" := Cust."Invoice Disc. Code";
        SalesHeader."Customer Disc. Group" := Cust."Customer Disc. Group";
        SalesHeader."Language Code" := Cust."Language Code";
        SalesHeader."Salesperson Code" := Cust."Salesperson Code";
        SalesHeader."Combine Shipments" := Cust."Combine Shipments";
        SalesHeader.Reserve := Cust.Reserve;
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN
            SalesHeader."Prepayment %" := Cust."Prepayment %";
        //8112
    end;
    //Field 12: ShipToCode
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnSetShipToCustomerAddressFieldsFromShipToAddrOnAfterCalcShouldCopyLocationCode', '', false, false)]
    local procedure OnSetShipToCustomerAddressFieldsFromShipToAddrOnAfterCalcShouldCopyLocationCode(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; ShipToAddress: Record "Ship-to Address"; var ShouldCopyLocationCode: Boolean)
    var
        ShipToAddr: Record "Ship-to Address";
    begin
        //TCPL::6904 160817 START
        ShipToAddr.GET(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code");
        SalesHeader."Ship-to Address" := ShipToAddr."Client Address 1";
        SalesHeader."Ship-to Address 2" := ShipToAddr."Client Address 2";
        SalesHeader."Ship-to City" := ShipToAddr."City Town";
        SalesHeader."Ship-to Post Code" := ShipToAddr."Post Office";
        SalesHeader.ShipToStateName := ShipToAddr."State Name";
        SalesHeader.VALIDATE("Ship-to Country/Region Code", ShipToAddr."Country/Region Code");
        //TCPL::6904 160817 END
    end;
    //Field 12: ShipToCode
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnCopyShipToCustomerAddressFieldsFromCustOnBeforeValidateShippingAgentFields', '', false, false)]
    local procedure OnCopyShipToCustomerAddressFieldsFromCustOnBeforeValidateShippingAgentFields(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; var IsHandled: Boolean)
    var
        ShipToAddr: Record "Ship-to Address";
    begin
        IF (SalesHeader."Sell-to Customer No." <> '') THEN BEGIN
            ShipToAddr.GET(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code");
            //TCPL::6904 160817 START
            SalesHeader."Ship-to Address" := ShipToAddr."Client Address 1";
            SalesHeader."Ship-to Address 2" := ShipToAddr."Client Address 2";
            SalesHeader."Ship-to City" := ShipToAddr."City Town";
            SalesHeader."Ship-to Post Code" := ShipToAddr."Post Office";
            SalesHeader.ShipToStateName := ShipToAddr."State Name";
            //TCPL::6904 160817 END
        end;
    end;
    //Field 12: ShipToCode
    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnBeforeGetShippingTime', '', false, false)]
    local procedure OnBeforeGetShippingTime(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var CalledByFieldNo: Integer; var IsHandled: Boolean; CurrentFieldNo: Integer)
    var
        ShipToAddr: Record "Ship-to Address";
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo" THEN BEGIN
            //TCPL::6904 160817 START
            IF ShipToAddr.GET(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code") THEN;
            SalesHeader."Ship-to Name" := ShipToAddr.Name;
            SalesHeader."Ship-to Name 2" := ShipToAddr."Name 2";
            SalesHeader."Ship-to Name" := ShipToAddr.Name;
            SalesHeader."Ship-to Address" := ShipToAddr."Client Address 1";
            SalesHeader."Ship-to Address 2" := ShipToAddr."Client Address 2";
            SalesHeader."Ship-to City" := ShipToAddr."City Town";
            SalesHeader."Ship-to Post Code" := ShipToAddr."Post Office";
            SalesHeader."GST Ship-to State Code" := ShipToAddr.State;     //Team::7814
            SalesHeader.ShipToStateName := ShipToAddr."State Name";
            SalesHeader.country := ShipToAddr.Country;
            //TCPL::6904 160817 END
            SalesHeader."Ship-to County" := ShipToAddr.County;
        END;
    end;

    // <<Table 36 Sales Header

    var
        RTBNo: Code[20];
        RTBState: Text[20];
        InvoiceNo: Code[20];
        InvGenDate: DateTime;
        InvDoc: Text[100];
        Rejreason: Text[250];
        InvConvRate: Text[20];
        CrtbStatus: Text[20];
        CreditNoteDoc: Code[20];
        CreditNoteDate: DateTime;
        RejreasonCrtb: Text[250];
        Crtb_No: Code[20];
        ExchangRate: Decimal;
        PostedSalesExt: Record 50018;
        ShiptoAddress: Record 222;
    // << Codeunit "Sales-Post"
    // >> Codeunit "Cust. Entry-Edit"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust. Entry-Edit", 'OnBeforeCustLedgEntryModify', '', false, false)]
    local procedure OnBeforeCustLedgEntryModify1(VAR CustLedgEntry: Record "Cust. Ledger Entry"; FromCustLedgEntry: Record "Cust. Ledger Entry")

    begin
        if CustLedgEntry.Open then
            CustLedgEntry.Updated := TRUE;//T4370 //6904
    end;
    // << Codeunit "Cust. Entry-Edit"
    // >> Codeunit "CustEntry-Apply Posted Entries"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CustEntry-Apply Posted Entries", 'OnBeforePostApplyCustLedgEntry', '', false, false)]
    local procedure OnBeforePostApplyCustLedgEntry(VAR GenJournalLine: Record "Gen. Journal Line"; CustLedgerEntry: Record "Cust. Ledger Entry")

    begin
        //GenJnlPostLine.SetCustApplicationEntryNo(EntryNoGlobal); //6700
    end;

    procedure SetApplyEntryNo(EntryNo: Integer)
    var
        SingleInstance: Codeunit "Single Instance";
    begin
        EntryNoGlobal := EntryNo;
        SingleInstance.SetApplyEntryNo(EntryNoGlobal);
    end;

    var
        EntryNoGlobal: Integer;
    // << Codeunit "CustEntry-Apply Posted Entries"
    // >> Codeunit "Gen. Jnl.-Post"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode1(VAR GenJournalLine: Record "Gen. Journal Line"; VAR HideDialog: Boolean)
    var
        CPG: Record "Customer Posting Group";
        Text50000: Label 'Please Define Customer Posting Setups for Account No. %1.';
    begin
        //8112
        //T4370.Begin
        IF GenJournalLine.FINDFIRST THEN BEGIN
            REPEAT
                IF GenJournalLine."Income Account" <> '' THEN BEGIN
                    CPG.RESET;
                    CPG.SETRANGE(CPG."Receivables Account", GenJournalLine."Income Account");
                    IF NOT CPG.FINDFIRST THEN
                        ERROR(Text50000, GenJournalLine."Income Account");
                END;
            UNTIL GenJournalLine.NEXT = 0;
        END;
        //T4370.End
        //8112
    end;
    // << Codeunit "Gen. Jnl.-Post"
    // >> Codeunit DimensionManagement
    procedure ValidateShortcutDimValuesAdd(DimensionCode: Code[20]; VAR ShortcutDimCode: Code[20]; VAR DimSetID: Integer)
    var
        DimVal: Record "Dimension Value";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimMgmt: Codeunit DimensionManagement;
    begin
        DimVal."Dimension Code" := DimensionCode;
        IF ShortcutDimCode <> '' THEN BEGIN
            DimVal.GET(DimVal."Dimension Code", ShortcutDimCode);
            IF NOT DimMgmt.CheckDim(DimVal."Dimension Code") THEN
                ERROR(DimMgmt.GetDimErr);
            IF NOT DimMgmt.CheckDimValue(DimVal."Dimension Code", ShortcutDimCode) THEN
                ERROR(DimMgmt.GetDimErr);
        END;
        DimMgmt.GetDimensionSet(TempDimSetEntry, DimSetID);
        IF TempDimSetEntry.GET(TempDimSetEntry."Dimension Set ID", DimVal."Dimension Code") THEN
            IF TempDimSetEntry."Dimension Value Code" <> ShortcutDimCode THEN
                TempDimSetEntry.DELETE;
        IF ShortcutDimCode <> '' THEN BEGIN
            TempDimSetEntry."Dimension Code" := DimVal."Dimension Code";
            TempDimSetEntry."Dimension Value Code" := DimVal.Code;
            TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
            IF TempDimSetEntry.INSERT THEN;
        END;
        DimSetID := DimMgmt.GetDimensionSetID(TempDimSetEntry);
    end;

    var
        ErrorMessageMgt: Codeunit "Error Message Management";
        LastErrorMessage: Record "Error Message";
    // << Codeunit DimensionManagement
    // >> Codeuni "Approvals Mgmt."
    procedure DeleteApprovalEntry(TableId: Integer; DocumentType: Option; DocumentNo: Code[20])
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SETRANGE("Table ID", TableId);
        ApprovalEntry.SETRANGE("Document Type", DocumentType);
        ApprovalEntry.SETRANGE("Document No.", DocumentNo);
        DeleteApprovalCommentLine(TableId, DocumentType, DocumentNo);
        IF ApprovalEntry.FINDFIRST THEN
            ApprovalEntry.DELETEALL;
    end;

    procedure DeleteApprovalCommentLine(TableId: Integer; DocumentType: Option; DocumentNo: Code[20])
    var
        ApprovalCommentLine: Record "Approval Comment Line";
    begin
        ApprovalCommentLine.SETRANGE("Table ID", TableId);
        ApprovalCommentLine.SETRANGE("Document Type", DocumentType);
        ApprovalCommentLine.SETRANGE("Document No.", DocumentNo);
        IF ApprovalCommentLine.FINDFIRST THEN
            ApprovalCommentLine.DELETEALL;
    end;
    // << Codeuni "Approvals Mgmt."
    // >> "Copy Document Mgt."
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnBeforeInsertToSalesLine', '', false, false)]
    local procedure OnBeforeInsertToSalesLine(VAR ToSalesLine: Record "Sales Line"; FromSalesLine: Record "Sales Line"; FromDocType: Option; RecalcLines: Boolean; VAR ToSalesHeader: Record "Sales Header"; DocLineNo: Integer; VAR NextLineNo: Integer)
    begin
        //LCMS Integration
        ToSalesLine."Description 2" := FromSalesLine."Description 2";
        ToSalesLine.Description := FromSalesLine.Description;
        ToSalesLine."Item Description" := FromSalesLine."Item Description";
        ToSalesLine."Other Detail 1" := FromSalesLine."Other Detail 1";
        ToSalesLine."Other Detail 2" := FromSalesLine."Other Detail 2";
        ToSalesLine."Supporting Bill No." := FromSalesLine."Supporting Bill No.";
        ToSalesLine."Supporting Bill Dt." := FromSalesLine."Supporting Bill Dt.";
        ToSalesLine."Date of Expense" := FromSalesLine."Date of Expense";
        //LCMS Integration
    end;
    // << "Copy Document Mgt."

    // >> "Gen. Journal Line"
    [EventSubscriber(ObjectType::Table, 81, 'OnLookUpAppliesToDocCustOnAfterSetFilters', '', false, false)]
    local procedure OnLookUpAppliesToDocCustOnAfterSetFilters(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; Var GenJournalLine: Record "Gen. Journal Line"; AccNo: Code[20])
    begin
        //0001-->Start
        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", CustLedgerEntry."Global Dimension 1 Code");
        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", CustLedgerEntry."Global Dimension 2 Code");
        // GenJournalLine.validate("Dimension Set ID", CustLedgerEntry."Dimension Set ID")
        //0001-->End
    end;

    // << "Gen. Journal Line"

    [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnFindFirstCustLedgEntryWithAppliesToDocNoOnAfterSetFilters', '', false, false)]

    local procedure OnFindFirstCustLedgEntryWithAppliesToIDOnAfterSetFilters(var GenJournalLine: Record "Gen. Journal Line"; AccNo: Code[20]; var CustLedgEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Document No.", GenJournalLine."Applies-to Doc. No.");
        if CustLedgEntry.FindFirst() then
            // GenJournalLine.validate("Dimension Set ID", CustLedgEntry."Dimension Set ID");
            GenJournalLine.validate(Amount, CustLedgEntry."Amount to Apply");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnLookUpAppliesToDocCustOnAfterUpdateDocumentTypeAndAppliesTo', '', false, false)]

    procedure OnLookUpAppliesToDocCustOnAfterUpdateDocumentTypeAndAppliesTo(CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.Reset();
        CustLedgerEntry.SetRange("Document No.", GenJournalLine."Applies-to Doc. No.");
        if CustLedgerEntry.FindFirst() then
            GenJournalLine.validate("Dimension Set ID", CustLedgerEntry."Dimension Set ID");
    end;







}