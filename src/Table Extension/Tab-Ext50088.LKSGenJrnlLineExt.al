tableextension 50088 "LKSGenJrnlLineExt" extends "Gen. Journal Line"
{
    fields
    {


        //Unsupported feature: Property Modification (Data type) on "Description(Field 8)".


        //Unsupported feature: Property Insertion (Enabled) on ""Salespers./Purch. Code"(Field 26)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job No."(Field 42)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Amount"(Field 44)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Posting"(Field 45)".


        //Unsupported feature: Property Insertion (Enabled) on ""Reason Code"(Field 52)".


        //Unsupported feature: Property Insertion (Enabled) on ""Recurring Method"(Field 53)".


        //Unsupported feature: Property Insertion (Enabled) on ""Expiration Date"(Field 54)".


        //Unsupported feature: Property Insertion (Enabled) on ""Recurring Frequency"(Field 55)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Calculation Type"(Field 60)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT Calculation Type"(Field 67)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT %"(Field 68)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT Amount"(Field 69)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Base Discount %"(Field 103)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Amount (LCY)"(Field 104)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Base Amount (LCY)"(Field 105)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT Amount (LCY)"(Field 106)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT Base Amount (LCY)"(Field 107)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Difference"(Field 111)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bal. VAT Difference"(Field 112)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Registration No."(Field 119)".


        //Unsupported feature: Property Insertion (Enabled) on ""Credit Card No."(Field 827)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Task No."(Field 1001)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Unit Price (LCY)"(Field 1002)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Total Price (LCY)"(Field 1003)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Quantity"(Field 1004)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Unit Cost (LCY)"(Field 1005)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Discount %"(Field 1006)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Disc. Amount (LCY)"(Field 1007)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Unit Of Measure Code"(Field 1008)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Type"(Field 1009)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Unit Price"(Field 1010)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Total Price"(Field 1011)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Unit Cost"(Field 1012)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Total Cost"(Field 1013)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Discount Amount"(Field 1014)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Amount"(Field 1015)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Total Cost (LCY)"(Field 1016)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Line Amount (LCY)"(Field 1017)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Currency Factor"(Field 1018)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Currency Code"(Field 1019)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Planning Line No."(Field 1020)".


        //Unsupported feature: Property Insertion (Enabled) on ""Job Remaining Qty."(Field 1030)".


        //Unsupported feature: Property Insertion (Enabled) on ""Campaign No."(Field 5050)".


        //Unsupported feature: Property Insertion (Enabled) on ""Insurance No."(Field 5610)".


        //Unsupported feature: Property Insertion (Enabled) on ""Budgeted FA No."(Field 5611)".


        //Unsupported feature: Property Insertion (Enabled) on ""Duplicate in Depreciation Book"(Field 5612)".


        //Unsupported feature: Property Modification (Data type) on ""Location Code"(Field 13747)".


        //Unsupported feature: Property Insertion (Enabled) on ""Product Type"(Field 16365)".


        //Unsupported feature: Property Insertion (Enabled) on ""Deferred Claim FA Excise"(Field 16370)".


        //Unsupported feature: Property Modification (Data type) on ""Cheque No."(Field 16372)".


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");

        //Upgrade(+)

        DimValue.Reset;
        DimValue.SetRange("Dimension Code",'CASE');
        DimValue.SetRange(DimValue.Code,"Shortcut Dimension 2 Code");
        if DimValue.FindFirst then begin
           OWNER2 :=DimValue."Case-Owner2";
        end;
        //Upgrade(-)
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnLookup".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IsGSTCalculated;
        OpenedOnLookup := true;
        xRec.Amount := Amount;
        xRec."Currency Code" := "Currency Code";
        xRec."Posting Date" := "Posting Date";
        xRec."GST Base Amount" := "GST Base Amount";
        #7..42
          Validate("GST Base Amount","GST Base Amount" * "Currency Factor");
          Validate("Total GST Amount","Total GST Amount" * "Currency Factor");
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        //8112
        if "Bal. Account Type" in
              ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor]
          then begin
            AccNo := "Bal. Account No.";
            AccType := "Bal. Account Type";
            Clear(CustLedgEntry);
            Clear(VendLedgEntry);
          end else begin
            AccNo := "Account No.";
            AccType := "Account Type";
            Clear(CustLedgEntry);
            Clear(VendLedgEntry);
          end;
        //8112
        #4..45
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnValidate".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Applies-to Doc. Type" = "Applies-to Doc. Type"::"Finance Charge Memo" then begin
          TestField("GST on Advance Payment",false);
          TestField("TCS Nature of Collection",'');
        #4..30
            CheckBilltoLocation;
          end;
        end;
        if ("Applies-to Doc. No." = '') and (xRec."Applies-to Doc. No." <> '') then begin
          PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");

        #37..137
        if VendLedgEntry2.FindFirst and not ("Document Type" in ["Document Type"::Invoice,"Document Type"::"Credit Memo"]) then
          "Input Service Distribution" := VendLedgEntry2."Input Service Distribution";

        GetCreditCard;
        if ("Document Type"="Document Type"::Refund) then begin
          if ("Account Type" = "Account Type"::Vendor) and VendLedgEntry2."GST on Advance Payment" then begin
        #144..151
                Error(NotOpenedLookUpErr);
          end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..33

        #34..140
        //TEAM::1426
        CustLedgerEntry2.Reset;
        CustLedgerEntry2.SetRange("Document Type","Applies-to Doc. Type");
        CustLedgerEntry2.SetRange("Document No.","Applies-to Doc. No.");
        if CustLedgerEntry2.FindFirst then
        // AND  ("Document Type" IN ["Document Type"::Invoice,"Document Type"::"Credit Memo"]) THEN
          OWNER2 := CustLedgerEntry2.OWNER2;
          CustLedgerEntry2.Reset;
          CustLedgerEntry2.SetRange("Document No.","Applies-to Doc. No.");
          if CustLedgerEntry2.FindFirst then
            Validate("Dimension Set ID",CustLedgerEntry2."Dimension Set ID");

        //TEAM::1426
        #141..154
        */
        //end;


        //Unsupported feature: Code Insertion on ""Cheque No."(Field 16372)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        //TEAM::1426
        CheckNo := StrLen("Cheque No.");
        if "Check Type" = true then
            if CheckNo <>7 then
              Error('Check No. Should be 7 Charactor');
        //To Check Duplicate Check No.
        //0002-->>Start
        if ("Account Type" = "Account Type"::Customer)  and
           ("Journal Template Name"='PI RECEIPT') then begin
           CustLedgEntry.Reset;
           CustLedgEntry.SetRange(CustLedgEntry."Customer No.","Account No.");
           if CustLedgEntry.FindLast then begin
              repeat
                if (CustLedgEntry."Cheque No." = "Cheque No.") and (CustLedgEntry.Reversed = false) and
                  (CustLedgEntry.Open= true)
                   then
                    Error(Text50000,"Document No.","Line No.","Account No.","Cheque No.");
               until CustLedgEntry.Next= 0;
            end;
        end;

        if ("Bal. Account Type" = "Bal. Account Type"::Customer ) and
           ("Journal Template Name"='PI RECEIPT') then begin
            CustLedgEntry.Reset;
            CustLedgEntry.SetRange(CustLedgEntry."Customer No.","Bal. Account No.");
            if CustLedgEntry.FindLast then begin
               repeat
                 if ((CustLedgEntry."Cheque No." = "Cheque No.") and(CustLedgEntry.Reversed = false))
                     and (CustLedgEntry.Open= true) then
                    Error(Text50000,"Document No.","Line No.","Bal. Account No.","Cheque No.");
               until CustLedgEntry.Next= 0;
             end;
        end;
        //0002-->End

        {
        //0002-->>Start
        IF "Account Type" = "Account Type"::"Bank Account" THEN BEGIN
          CheckLedgerEntry.RESET;
          CheckLedgerEntry.SETRANGE(CheckLedgerEntry."Bank Account No.","Account No.");
          IF CheckLedgerEntry.FINDFIRST THEN BEGIN
            REPEAT
              IF (CheckLedgerEntry."Cheque No." = "Cheque No.") AND (CheckLedgerEntry.Reversed = FALSE)
              OR (CustLedgEntry."Journal Batch Name" = 'BOUNCE') OR (CustLedgEntry.Positive = TRUE) THEN
                ERROR(Text50000,"Document No.","Line No.","Account No.","Cheque No.");
            UNTIL CheckLedgerEntry.NEXT = 0;
          END;
        END;

        IF "Bal. Account Type" = "Bal. Account Type"::"Bank Account" THEN BEGIN
          CheckLedgerEntry.RESET;
          CheckLedgerEntry.SETRANGE(CheckLedgerEntry."Bank Account No.","Bal. Account No.");
          IF CheckLedgerEntry.FINDFIRST THEN BEGIN
            REPEAT
              IF (CheckLedgerEntry."Cheque No." = "Cheque No.") AND (CheckLedgerEntry.Reversed = FALSE) THEN
                ERROR(Text50000,"Document No.","Line No.","Bal. Account No.","Cheque No.");
            UNTIL CheckLedgerEntry.NEXT = 0;
          END;
        END;
        //0002-->End
        }

        //8112
        */
        //end;
        field(50000; "Income Account"; Code[50])
        {
            Description = '//2021';

            trigger OnLookup()
            begin
                //NEW CODE FOR POSTING IN IMCOME ACCOUNTS
                //T4370.Begin
                //NewGl.SETRANGE(NewGl."No.",'12-32-1000','31-99-9999');
                NewGl.SetRange("Income Account", true);
                //T4370.End
                //NewGl.SETFILTER(NewGl."No.",'31-99-1000','31-99-9999');
                if PAGE.RunModal(50004, NewGl) = ACTION::LookupOK then
                    Validate("Income Account", NewGl."No.");
            end;

            trigger OnValidate()
            begin
                //2655
                GlRec.Get("Income Account");
                if GlRec."Income Account" = false then
                    Error('You can not select this account');


                //NEW CODE FOR POSTING IN IMCOME ACCOUNTS
                CustPostingGroup.SetRange(CustPostingGroup."Receivables Account", "Income Account");
                if CustPostingGroup.Find('-') then
                    Validate("Posting Group", CustPostingGroup.Code)
            end;
        }
        field(50001; "Mode of Payment"; Text[30])
        {
        }
        field(50002; "Reference No."; Text[30])
        {
        }
        field(50003; "Payble At"; Text[50])
        {
        }
        field(50004; "Issuing Bank Name"; Text[50])
        {
            TableRelation = "Bank Name";
        }
        field(50005; "Payment Made By"; Text[100])
        {
            Description = '//50-->60->100';
        }
        field(50006; "Advance Invoice"; Boolean)
        {
        }
        field(50007; "Adv. Invoice No"; Code[20])
        {
        }
        field(50008; "Information No."; Code[20])
        {
        }
        field(50009; "Case Id"; Text[20])
        {
            Description = '200->20';
        }
        field(50010; "Invoice No."; Text[20])
        {
            Description = '250->20';
        }
        field(50011; Remarks; Text[50])
        {
        }
        field(50012; "Check Type"; Boolean)
        {
            InitValue = true;
        }
        field(50013; "External Doc. Date"; Date)
        {
        }
        field(50014; "Invoice Type"; Option)
        {
            OptionCaption = ',TAXABLE,NON-TAXABLE,MIXED';
            OptionMembers = ,TAXABLE,"NON-TAXABLE",MIXED;
        }
        field(50015; "Collection No."; Code[20])
        {
        }
        field(50016; "Move To Correction"; Boolean)
        {
        }
        field(50017; "Temp Customer No."; Code[20])
        {
        }
        field(50018; "Temp TDS Amount"; Decimal)
        {
        }
        field(50019; "Expence No."; Code[20])
        {
        }
        field(50020; OWNER2; Text[100])
        {
            TableRelation = "Dimension Set Entry"."Dimension Value Code" WHERE("Dimension Code" = CONST('OWNER2'));
        }
        field(50021; "Group Head"; Text[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('GROUPHEAD'));
        }
        field(50022; "Cheque No. 2"; Code[30])
        {
            Caption = 'Cheque No.';
        }
        // //<<#122
        field(50023; "Description 3 "; text[100])
        {
            Caption = 'Description';
        }
        // //#122>>
        //<<#122
        // field(50024; "Description 3"; text[100])
        // {
        //     Caption = 'Description';
        // }
        //#122>>
        // >>#92
        modify("Shortcut Dimension 2 Code")
        {
            trigger OnAfterValidate()
            begin
                //Upgrade(+)

                DimValue.RESET;
                DimValue.SETRANGE("Dimension Code", 'CASE');
                DimValue.SETRANGE(DimValue.Code, "Shortcut Dimension 2 Code");
                IF DimValue.FINDFIRST THEN BEGIN
                    OWNER2 := DimValue."Case-Owner2";
                END;
                //Upgrade(-)
            end;
        }
        modify("Applies-to Doc. No.")
        {
            trigger OnAfterValidate()
            begin
                // TEAM::1426
                // CustLedgerEntry2.RESET;
                // CustLedgerEntry2.SETRANGE("Document Type", "Applies-to Doc. Type");
                // CustLedgerEntry2.SETRANGE("Document No.", "Applies-to Doc. No.");
                // IF CustLedgerEntry2.FINDFIRST THEN
                //     // AND  ("Document Type" IN ["Document Type"::Invoice,"Document Type"::"Credit Memo"]) THEN
                //     OWNER2 := CustLedgerEntry2.OWNER2;
                // CustLedgerEntry2.RESET;
                // CustLedgerEntry2.SETRANGE("Document No.", "Applies-to Doc. No.");
                // IF CustLedgerEntry2.FINDFIRST THEN begin
                //     VALIDATE("Dimension Set ID", CustLedgerEntry2."Dimension Set ID");


                //Validate(Amount, CustLedgerEntry2."Amount to Apply");
            end;
            // end;
        }
        // <<#92

    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlAlloc.LockTable;
    LockTable;
    GenJnlTemplate.Get("Journal Template Name");
    GenJnlBatch.Get("Journal Template Name","Journal Batch Name");
    "Posting No. Series" := GenJnlBatch."Posting No. Series";
    "Check Printed" := false;
    GSTManagement.GetJournalInvoiceTypeNoSeries(Rec,TransactionType1::Sales);
    GSTManagement.GetJournalInvoiceTypeNoSeries(Rec,TransactionType1::Purchase);
    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    "Old Document No." := "Document No.";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6

    "Document Date" :=WorkDate;//8112

    GSTManagement.GetJournalInvoiceTypeNoSeries(Rec,TransactionType1::Sales);
    GSTManagement.GetJournalInvoiceTypeNoSeries(Rec,TransactionType1::Purchase);

    #9..11
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: TempDim) (VariableCollection) on "ShowDimensions(PROCEDURE 26)".



    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 26)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    } //Standard
    {GenJournalRec.RESET;
    GenJournalRec.SETRANGE("Journal Template Name","Journal Template Name");
    GenJournalRec.SETRANGE("Journal Batch Name","Journal Batch Name");
    GenJournalRec.SETRANGE("Line No.","Line No.");
    IF GenJournalRec.FINDFIRST THEN
      BEGIN
        GenJournalRec.GET("Journal Template Name","Journal Batch Name","Line No.");
        GenJournalRec."Dimension Set ID" :=
        DimMgt.EditDimensionSet2(
        GenJournalRec."Dimension Set ID",STRSUBSTNO('%1 %2 %3',GenJournalRec."Journal Template Name",GenJournalRec."Journal Batch Name",GenJournalRec."Line No."),
        GenJournalRec."Shortcut Dimension 1 Code",GenJournalRec."Shortcut Dimension 2 Code");
        GenJournalRec.MODIFY;
        }
        //END
    TempDim :=
    #2..4
    GenJournalRec.Get("Journal Template Name","Journal Batch Name","Line No.");
    GenJournalRec."Dimension Set ID" := TempDim;
    GenJournalRec.Modify;
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocCust(PROCEDURE 35)".

    //procedure LookUpAppliesToDocCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Clear(CustLedgEntry);
    CustLedgEntry.SetCurrentKey("Customer No.",Open,Positive,"Due Date");
    if AccNo <> '' then
      CustLedgEntry.SetRange("Customer No.",AccNo);
    CustLedgEntry.SetRange(Open,true);
    if "Applies-to Doc. No." <> '' then begin
      CustLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
      CustLedgEntry.SetRange("Document No.","Applies-to Doc. No.");
      if CustLedgEntry.IsEmpty then begin
        CustLedgEntry.SetRange("Document Type");
        CustLedgEntry.SetRange("Document No.");
    #12..70
      end;
    end;

    GetCreditCard;

    Validate("Applies-to Doc. No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8

    #9..73

    #74..76
    //0001-->Start
            Validate("Shortcut Dimension 1 Code",CustLedgEntry."Global Dimension 1 Code");
            Validate("Shortcut Dimension 2 Code",CustLedgEntry."Global Dimension 2 Code");
    //0001-->End
    */
    //end;

    //Unsupported feature: Property Modification (Length) on "UpdateDescription(PROCEDURE 43).Name(Parameter 1000)".


    var
        GJL: Record "Gen. Journal Line";


    //Unsupported feature: Property Modification (Id) on "Text16509(Variable 1500056)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text16509 : 1500056;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16509 : 1000000009;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text16509(Variable 1500056)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text16509 : ENU=PoT rules are not applicable for Input Service Distributor, Please ensure PoT value is False.;ENN=PoT rules are not applicable for Input Service Distributor, Please ensure PoT value is False.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16509 : ENU=%1 rules are not applicable for Input Service Distributor, Please ensure %1 value is False.;ENN=%1 rules are not applicable for Input Service Distributor, Please ensure %1 value is False.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text16508(Variable 1500063)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text16508 : 1500063;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16508 : 1000000010;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text16508(Variable 1500063)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text16508 : ENU=You are not allowed to select this Nature of Remittance.;ENN=You are not allowed to select this Nature of Remittance.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16508 : ENU=%1 rules are not applicable for %2 Vendor, Please ensure %1 value is False.;ENN=%1 rules are not applicable for %2 Vendor, Please ensure %1 value is False.;
    //Variable type has not been exported.

    var
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        ReplaceInfo: Boolean;

    var
        GenJnlNarration: Record "Gen. Journal Narration";
        OK: Boolean;

    var
        ApplyCustEntries: Page "Apply Customer Entries";
        ApplyVendEntries: Page "Apply Vendor Entries";

    var
        Text50000: Label 'Duplicate Cheque No. is not allowed for the Document No. %1, Document Line No. %2, Bank No. %3, Cheque No. %4.';
        Text50001: Label 'Account No. can not be different from Other lines.';
        "--2021--": Integer;
        CustPostingGroup: Record "Customer Posting Group";
        NewGl: Record "G/L Account";
        CheckNo: Integer;
        "-Team---": Integer;
        CheckLedgerEntry: Record "Bank Account Ledger Entry";
        GenJnlLine1: Record "Gen. Journal Line";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        DimValue: Record "Dimension Value";
        GlRec: Record "G/L Account";
        GenJournalRec: Record "Gen. Journal Line";
}

