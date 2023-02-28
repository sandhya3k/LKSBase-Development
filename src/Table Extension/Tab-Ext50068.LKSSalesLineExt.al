tableextension 50068 "LKSSalesLineExt" extends "Sales Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Unit of Measure"(Field 13)".


        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckItemAvailable(FieldNo("No."));
        #4..37

        "System-Created Entry" := TempSalesLine."System-Created Entry";
        GetSalesHeader;
        InitHeaderDefaults(SalesHeader);
        CalcFields("Substitution Available");

        "Promised Delivery Date" := SalesHeader."Promised Delivery Date";
        "Requested Delivery Date" := SalesHeader."Requested Delivery Date";
        "Invoice Type" := SalesHeader."Invoice Type";
        "Shipment Date" :=
          CalendarMgmt.CalcDateBOC(
            '',
        #50..95
              Item.TestField("Gen. Prod. Posting Group");
              if Item.Type = Item.Type::Inventory then begin
                Item.TestField("Inventory Posting Group");
                "Posting Group" := Item."Inventory Posting Group";
              end;
              Description := Item.Description;
        #102..182

        UpdatePrepmtSetupFields;
        if Type <> Type::" " then begin
          Validate("Unit of Measure Code");
          if Quantity <> 0 then begin
            InitOutstanding;
        #189..213
          if Type = Type::"Charge (Item)" then
            DeleteChargeChargeAssgnt("Document Type","Document No.","Line No.");
        end;
        UpdateItemCrossRef;
        GetStandardDeduction(SalesHeader);
        "Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure" ;
        "Invoice Type" := SalesHeader."Invoice Type";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..40
        //8112
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Quote then begin
          if (SalesHeader."Sell-to Customer No." = '') and
              (SalesHeader."Sell-to Customer Template Code" = '')
          then
            Error(
              Text031,
              SalesHeader.FieldCaption("Sell-to Customer No."),
              SalesHeader.FieldCaption("Sell-to Customer Template Code"));
          if (SalesHeader."Bill-to Customer No." = '') and
              (SalesHeader."Bill-to Customer Template Code" = '')
          then
            Error(
              Text031,
              SalesHeader.FieldCaption("Bill-to Customer No."),
              SalesHeader.FieldCaption("Bill-to Customer Template Code"));
          end else
          SalesHeader.TestField("Sell-to Customer No.");

          "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
          "Currency Code" := SalesHeader."Currency Code";
          "Location Code" := SalesHeader."Location Code";
          if "Location Code" = '' then begin
          GetCompanyInformation;
          "Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
          end else begin
          GetLocation("Location Code");
          "Service Tax Registration No." := Location."Service Tax Registration No."
          end;
          "Customer Price Group" := SalesHeader."Customer Price Group";
          "Customer Disc. Group" := SalesHeader."Customer Disc. Group";
          "Allow Line Disc." := SalesHeader."Allow Line Disc.";
          "Transaction Type" := SalesHeader."Transaction Type";
          "Transport Method" := SalesHeader."Transport Method";
          "Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
          "Gen. Bus. Posting Group" := SalesHeader."Gen. Bus. Posting Group";
          "VAT Bus. Posting Group" := SalesHeader."VAT Bus. Posting Group";
          "Exit Point" := SalesHeader."Exit Point";
          Area := SalesHeader.Area;
          "Transaction Specification" := SalesHeader."Transaction Specification";
          "Tax Area Code" := SalesHeader."Tax Area Code";
          "Tax Liable" := SalesHeader."Tax Liable";
          if not "System-Created Entry" and ("Document Type" = "Document Type"::Order) and (Type <> Type::" ") then
          "Prepayment %" := SalesHeader."Prepayment %";
          "Prepayment Tax Area Code" := SalesHeader."Tax Area Code";
          "Prepayment Tax Liable" := SalesHeader."Tax Liable";
          "Responsibility Center" := SalesHeader."Responsibility Center";
          "Assessee Code" := SalesHeader."Assessee Code";
          "Form Code" := SalesHeader."Form Code";
          "Form No." := SalesHeader."Form No.";
          "Excise Bus. Posting Group" := SalesHeader."Excise Bus. Posting Group";
          "Free Supply" := SalesHeader."Free Supply";

          "Shipping Agent Code" := SalesHeader."Shipping Agent Code";
          "Shipping Agent Service Code" := SalesHeader."Shipping Agent Service Code";
          "Outbound Whse. Handling Time" := SalesHeader."Outbound Whse. Handling Time";
          "Shipping Time" := SalesHeader."Shipping Time";
        //8112
        #41..45
        //"Invoice Type" := SalesHeader."Invoice Type";
        #47..98
                Item.TestField("Gen. Prod. Posting Group");//8112
        #99..185
          //8112
          if Type <> Type::"Fixed Asset" then
          Validate("VAT Prod. Posting Group");
          //8112
        #186..216
        //UpdateItemCrossRef;Commented for compilation purpose
        //8112
        GetItemCrossRef(FieldNo("No."));
        SalesHeader.Get("Document Type","Document No.");
        InitICPartner;
        //8112
        GetStandardDeduction(SalesHeader);
        "Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure" ;
        //"Invoice Type" := SalesHeader."Invoice Type";
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckHeaderLocation;
        #4..61

        TaxAreaUpdate;
        "Service Tax Registration No." := ServiceTaxMgt.GetServiceTaxRegNoForLocation("Location Code");
        SalesHeader2.Reset;
        SalesHeader2.SetRange("No.","Document No.");
        SalesHeader2.SetRange("Document Type","Document Type");
        #68..79

        if "Document Type" = "Document Type"::"Return Order" then
          ValidateReturnReasonCode(FieldNo("Location Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..64
        //8112
        if "Location Code" = '' then begin
          GetCompanyInformation;
          "Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
        end else begin
          GetLocation("Location Code");
          "Service Tax Registration No." := Location."Service Tax Registration No."
        end;
        //8112
        #65..82
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;

        #4..81
          "VAT Base Amount" := 0;
        end;
        if (xRec.Quantity <> Quantity) and (Quantity = 0) and (("Amount To Customer" <> 0) or IsServiceTaxExist(Rec)) then begin
          "Service Tax Amount" := 0;
          "Service Tax eCess Amount" := 0;
          "Service Tax SHE Cess Amount" := 0;
          "Amount To Customer" := 0;
        #89..91
          "KK Cess%" := 0;
          "KK Cess Amount" := 0;
        end;

        UpdatePrePaymentAmounts;

        TaxAreaUpdate;
        #99..114

        CalcFields("Reserved Qty. (Base)");
        Validate("Reserved Qty. (Base)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..84
        //8112
          // (("Amount To Customer" <> 0) OR ("Service Tax Amount" <> 0))
        //THEN BEGIN
           //8112
           "Service Tax Amount" := 0;
        #86..94
        if ("Document Type" = "Document Type"::Invoice) and ("Prepayment %" <> 0) then //8112
        #96..117
        */
        //end;


        //Unsupported feature: Code Modification on ""Drop Shipment"(Field 73).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Document Type","Document Type"::Order);
        TestField(Type,Type::Item);
        TestField("Quantity Shipped",0);
        #4..20
              UpdateDates;
              "Bin Code" := '';
            end;
          end else
            SetReserveWithoutPurchasingCode;

        #27..33
            UpdateWithWarehouseShip
          end else
            InitQtyToShip;
          WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
          if not FullReservedQtyIsForAsmToOrder then
            ReserveSalesLine.VerifyChange(Rec,xRec);
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..23
            //8112
            end else begin
              GetItem;
              if Item.Reserve = Item.Reserve::Optional then begin
                GetSalesHeader;
                Reserve := SalesHeader.Reserve;
            //8112
        #24..36
          WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec)
          end;
          if not FullReservedQtyIsForAsmToOrder then
            ReserveSalesLine.VerifyChange(Rec,xRec)
          end;
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Prod. Posting Group"(Field 90).OnValidate".

        //trigger  Posting Group"(Field 90)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        if "Prepmt. Amt. Inv." <> 0 then
          Error(CannotChangeVATGroupWithPrepmInvErr);
        VATPostingSetup.Get("VAT Bus. Posting Group","VAT Prod. Posting Group");
        "VAT Difference" := 0;
        "VAT %" := VATPostingSetup."VAT %";
        "VAT Calculation Type" := VATPostingSetup."VAT Calculation Type";
        #8..23
              "Unit Price" * (100 + "VAT %") / (100 + xRec."VAT %"),
              Currency."Unit-Amount Rounding Precision"));
        UpdateAmounts;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        if VATPostingSetup.Get("VAT Bus. Posting Group","VAT Prod. Posting Group") then;

        #5..26
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Prepayment %"(Field 109).OnValidate".

        //trigger (Variable: GenPostingSetup)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Prepayment %"(Field 109).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        UpdatePrepmtSetupFields;

        if Type <> Type::" " then
          UpdateAmounts;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3

        //8112

        if ("Prepayment %" <> 0) and (Type <> Type::" ") then begin
          TestField("Document Type","Document Type"::Order);
          TestField("No.");
          if CurrFieldNo = FieldNo("Prepayment %") then
            if "System-Created Entry" then
              FieldError("Prepmt. Line Amount",StrSubstNo(Text045,0));
          if "System-Created Entry" then
            "Prepayment %" := 0;
          GenPostingSetup.Get("Gen. Bus. Posting Group","Gen. Prod. Posting Group");
          if GenPostingSetup."Sales Prepayments Account" <> '' then begin
            GLAcc.Get(GenPostingSetup."Sales Prepayments Account");
            VATPostingSetup.Get("VAT Bus. Posting Group",GLAcc."VAT Prod. Posting Group");
          end else
            Clear(VATPostingSetup);
          "Prepayment VAT %" := VATPostingSetup."VAT %";
          "Prepmt. VAT Calc. Type" := VATPostingSetup."VAT Calculation Type";
          "Prepayment VAT Identifier" := VATPostingSetup."VAT Identifier";
          case "Prepmt. VAT Calc. Type" of
            "VAT Calculation Type"::"Reverse Charge VAT",
            "VAT Calculation Type"::"Sales Tax":
              "Prepayment VAT %" := 0;
            "VAT Calculation Type"::"Full VAT":
              FieldError("Prepmt. VAT Calc. Type",StrSubstNo(Text041,"Prepmt. VAT Calc. Type"));
          end;
          "Prepayment Tax Group Code" := GLAcc."Tax Group Code";
        end;

        TestStatusOpen;

        if Type <> Type::" " then
          UpdateAmounts;
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Prepmt. Line Amount"(Field 110).OnValidate".

        //trigger  Line Amount"(Field 110)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        PrePaymentLineAmountEntered := true;
        TestField("Line Amount");
        #4..6
          FieldError("Prepmt. Line Amount",StrSubstNo(Text045,"Line Amount"));
        if "System-Created Entry" then
          FieldError("Prepmt. Line Amount",StrSubstNo(Text045,0));
        Validate("Prepayment %",Round("Prepmt. Line Amount" * 100 / "Line Amount",0.00001));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..9
        //8112
        if Quantity <> 0 then
          Validate("Prepayment %",Round("Prepmt. Line Amount" /
              ("Line Amount" * (Quantity - "Quantity Invoiced") / Quantity) * 100,0.00001));
          //8112
        Validate("Prepayment %",Round("Prepmt. Line Amount" * 100 / "Line Amount",0.00001));
        */
        //end;


        //Unsupported feature: Code Modification on ""Variant Code"(Field 5402).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        if "Variant Code" <> '' then
          TestField(Type,Type::Item);
        #4..28
          WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
        end;

        UpdateItemCrossRef;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..31
        //UpdateItemCrossRef;commented for compilation//8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Cross-Reference No."(Field 5705).OnValidate".

        //trigger "(Field 5705)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetSalesHeader;
        "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
        ReturnedCrossRef.Init;
        #4..21

        UpdateUnitPrice(FieldNo("Cross-Reference No."));
        UpdateICPartner;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..24
        //8112
        if SalesHeader."Send IC Document" and (SalesHeader."IC Direction" = SalesHeader."IC Direction"::Outgoing) then begin
          "IC Partner Ref. Type" := "IC Partner Ref. Type"::"Cross Reference";
          "IC Partner Reference" := "Cross-Reference No.";
        end;
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Purchasing Code"(Field 5711).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TestField(Type,Type::Item);
        CheckAssocPurchOrder(FieldCaption(Type));
        #4..20
              UpdateDates;
              "Bin Code" := '';
            end;
          end else
            SetReserveWithoutPurchasingCode;
        end else begin
          "Drop Shipment" := false;
          "Special Order" := false;
          SetReserveWithoutPurchasingCode;
        #30..44
            GetSalesHeader;
            "Shipping Time" := SalesHeader."Shipping Time";
          end;
          UpdateDates;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..23
            //8112
            end else begin
              GetItem;
              if Item.Reserve = Item.Reserve::Optional then begin
                GetSalesHeader;
                Reserve := SalesHeader.Reserve;
            //8112
          end else
            SetReserveWithoutPurchasingCode;
        //END ELSE BEGIN
        #27..47
          UpdateDates
          end;
          end;
        */
        //end;
        field(50000; "Item Description"; Text[250])
        {
        }
        field(50001; "Other Detail 1"; Text[250])
        {
        }
        field(50002; "Other Detail 2"; Text[250])
        {
        }
        field(50003; "Supporting Bill No."; Text[50])
        {
        }
        field(50004; "Supporting Bill Dt."; Date)
        {
        }
        field(50005; "Date of Expense"; Date)
        {
        }
        field(50006; "Service Tax Applicable"; Boolean)
        {
        }
        field(50007; "Merge Lines"; Boolean)
        {
        }
        field(50008; "Merge Description"; Text[250])
        {
        }
        field(50009; "Merge Description 2"; Text[250])
        {
        }
    }


    //Unsupported feature: Code Modification on "InitOutstandingAmount(PROCEDURE 17)".

    //procedure InitOutstandingAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Quantity = 0 then begin
      "Outstanding Amount" := 0;
      "Outstanding Amount (LCY)" := 0;
      "Shipped Not Invoiced" := 0;
      "Shipped Not Invoiced (LCY)" := 0;
      "Return Rcd. Not Invd." := 0;
      "Return Rcd. Not Invd. (LCY)" := 0;
    end else begin
      GetSalesHeader;
      AmountInclVAT := "Amount Including VAT";
      Validate(
        "Outstanding Amount",
        Round(
          AmountInclVAT * "Outstanding Quantity" / Quantity,
          Currency."Amount Rounding Precision"));
      if "Document Type" in ["Document Type"::"Return Order","Document Type"::"Credit Memo"] then
        Validate(
          "Return Rcd. Not Invd.",
          Round(
            AmountInclVAT * "Return Qty. Rcd. Not Invd." / Quantity,
            Currency."Amount Rounding Precision"))
      else
        Validate(
          "Shipped Not Invoiced",
          Round(
            AmountInclVAT * "Qty. Shipped Not Invoiced" / Quantity,
            Currency."Amount Rounding Precision"));
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
      //8112
      AmountInclVAT := "Amount Including VAT"
      end;
        if SalesHeader."Prices Including VAT" then
          AmountInclVAT := "Line Amount" - "Inv. Discount Amount"
        else
          if "VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax" then
            AmountInclVAT :=
              "Line Amount" - "Inv. Discount Amount" +
              Round(
                SalesTaxCalculate.CalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                  "Line Amount" - "Inv. Discount Amount","Quantity (Base)",SalesHeader."Currency Factor"),
                Currency."Amount Rounding Precision")
          else
            AmountInclVAT :=
              Round(
                ("Line Amount" - "Inv. Discount Amount") *
                (1 + "VAT %" / 100 * (1 - SalesHeader."VAT Base Discount %" / 100)),
                Currency."Amount Rounding Precision");
      //8112
      {
      VALIDATE(
        "Outstanding Amount",
        ROUND(
          AmountInclVAT * "Outstanding Quantity" / Quantity,
          Currency."Amount Rounding Precision"));

      IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
        VALIDATE(
          "Return Rcd. Not Invd.",
          ROUND(
            AmountInclVAT * "Return Qty. Rcd. Not Invd." / Quantity,
            Currency."Amount Rounding Precision"))
      ELSE
        VALIDATE(
          "Shipped Not Invoiced",
          ROUND(
            AmountInclVAT * "Qty. Shipped Not Invoiced" / Quantity,
            Currency."Amount Rounding Precision"));
    }
    */
    //end;


    //Unsupported feature: Code Modification on "GetSalesHeader(PROCEDURE 1)".

    //procedure GetSalesHeader();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Document No.");
    if ("Document Type" <> SalesHeader."Document Type") or ("Document No." <> SalesHeader."No.") then begin
      SalesHeader.Get("Document Type","Document No.");
      if SalesHeader."Currency Code" = '' then
    #5..8
        Currency.TestField("Amount Rounding Precision");
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //TESTFIELD("Document No."); tcpl::6904 BLOCKED
    #2..11
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesHeader;
    SalesLine2.SetRange("Document Type","Document Type");
    SalesLine2.SetRange("Document No.","Document No.");
    #4..18
      Amount := 0;
      "VAT Base Amount" := 0;
      "Amount Including VAT" := 0;
    end else begin
      TotalLineAmount := 0;
      TotalInvDiscAmount := 0;
    #25..122
            end;
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
      //8112
      if (SalesHeader.Status = SalesHeader.Status::Released) and ("Line No." <> 0) then
      if Modify then
        if SalesLine2.FindLast then begin
          SalesLine2.UpdateAmounts;
          SalesLine2.Modify;
        end;
      //8112
    #22..125
    */
    //end;


    //Unsupported feature: Code Modification on "ShowItemChargeAssgnt(PROCEDURE 5801)".

    //procedure ShowItemChargeAssgnt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Get("Document Type","Document No.","Line No.");
    TestField(Type,Type::"Charge (Item)");
    TestField("No.");
    #4..29
      ItemChargeAssgntSales."Document No." := "Document No.";
      ItemChargeAssgntSales."Document Line No." := "Line No.";
      ItemChargeAssgntSales."Item Charge No." := "No.";
      ItemChargeAssgntSales."Unit Cost" :=
        Round(ItemChargeAssgntLineAmt / Quantity,
          Currency."Unit-Amount Rounding Precision");
    #36..49
    ItemChargeAssgnts.Initialize(Rec,ItemChargeAssgntLineAmt);
    ItemChargeAssgnts.RunModal;
    CalcFields("Qty. to Assign");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..32
      //8112
      GetSalesHeader;
      if ("Inv. Discount Amount" = 0) and
          ("Line Discount Amount" = 0) and
          (not SalesHeader."Prices Including VAT")
      then
        ItemChargeAssgntSales."Unit Cost" := "Unit Price"
      else
        if SalesHeader."Prices Including VAT" then
      //8112
    #33..52
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "GetCPGInvRoundAcc(PROCEDURE 71)".


    //Unsupported feature: Parameter Insertion (Parameter: CalledByFieldNo) (ParameterCollection) on "UpdateItemCrossRef(PROCEDURE 48)".



    //Unsupported feature: Code Modification on "UpdateItemCrossRef(PROCEDURE 48)".

    //procedure UpdateItemCrossRef();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DistIntegration.EnterSalesItemCrossRef(Rec);
    UpdateICPartner;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //IF CalledByFieldNo <> 0 THEN//8112
    DistIntegration.EnterSalesItemCrossRef(Rec);
    UpdateICPartner;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: QtyBase) (VariableCollection) on "CheckApplFromItemLedgEntry(PROCEDURE 157)".



    //Unsupported feature: Code Modification on "CheckApplFromItemLedgEntry(PROCEDURE 157)".

    //procedure CheckApplFromItemLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Appl.-from Item Entry" = 0 then
      exit;

    #4..19
    ItemLedgEntry.TestField("Variant Code","Variant Code");
    if ItemLedgEntry.TrackingExists then
      Error(Text040,ItemTrackingLines.Caption,FieldCaption("Appl.-from Item Entry"));

    if Abs("Quantity (Base)") > -ItemLedgEntry.Quantity then
      Error(
        Text046,
    #27..43
          -QtyReturned,ItemLedgEntry.FieldCaption("Document No."),
          ItemLedgEntry."Document No.",-QtyNotReturned);
      end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..22
    //8112
    case true of
      CurrFieldNo = FieldNo(Quantity):
        QtyBase := "Quantity (Base)";
      "Document Type" in ["Document Type"::"Return Order","Document Type"::"Credit Memo"]:
        QtyBase := "Return Qty. to Receive (Base)"
      else
        QtyBase := "Qty. to Ship (Base)";
    end;
    //8112
    #24..46
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "SetDefaultQuantity(PROCEDURE 62)".



    //Unsupported feature: Code Modification on "UpdateICPartner(PROCEDURE 78)".

    //procedure UpdateICPartner();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SalesHeader."Send IC Document" and
       (SalesHeader."IC Direction" = SalesHeader."IC Direction"::Outgoing) and
       (SalesHeader."Bill-to IC Partner Code" <> '')
    #4..21
            case ICPartner."Outbound Sales Item No. Type" of
              ICPartner."Outbound Sales Item No. Type"::"Common Item No.":
                Validate("IC Partner Ref. Type","IC Partner Ref. Type"::"Common Item No.");
              ICPartner."Outbound Sales Item No. Type"::"Internal No.",
              ICPartner."Outbound Sales Item No. Type"::"Cross Reference":
                begin
                  if ICPartner."Outbound Sales Item No. Type" = ICPartner."Outbound Sales Item No. Type"::"Internal No." then
    #29..52
            "IC Partner Reference" := Resource."IC Partner Purch. G/L Acc. No.";
          end;
      end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
              ICPartner."Outbound Sales Item No. Type"::"Internal No.":
                //8112
                 begin
                  "IC Partner Ref. Type" := "IC Partner Ref. Type"::Item;
                  "IC Partner Reference" := "No.";
                end;
                //8112
    #26..55
    */
    //end;


    //Unsupported feature: Code Modification on "CalculateStructures(PROCEDURE 1280007)".

    //procedure CalculateStructures();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckHeaderAndLineLocation(SalesHeader);
    with SalesHeader do begin
      CheckStructureOnLineWise(SalesHeader);
      Currency.Initialize("Currency Code");
      CheckShipToCode;
      if "Currency Code" <> '' then begin
        TestField("Currency Factor");
        Currency.TestField("Amount Rounding Precision");
      end;

    #11..302
          SalesHeader."Document Type",SalesHeader."No.",CFactor,Currency."Amount Rounding Precision");
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
        Currency.Get("Currency Code");//8112
    #8..305
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateGSTAmounts(PROCEDURE 1500040)".

    //procedure UpdateGSTAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Line No." = 0 then
      exit;

    #4..119

    "GST Base Amount" := GSTBaseAmount;
    "GST Jurisdiction Type" := GSTJurisdiction;
    "Invoice Type" := SalesHeader."Invoice Type";
    GSTManagement.DeleteGSTCalculationBuffer(TransactionType::Sales,"Document Type","Document No.","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..122

    //"Invoice Type" := SalesHeader."Invoice Type";
    GSTManagement.DeleteGSTCalculationBuffer(TransactionType::Sales,"Document Type","Document No.","Line No.");
    */
    //end;

    procedure GetItemCrossRef(CalledByFieldNo: Integer)
    begin
        if CalledByFieldNo <> 0 then
            ;//DistIntegration.EnterSalesItemCrossRef(Rec); //TBD
    end;

    local procedure InitICPartner()
    var
        ICPartner: Record "IC Partner";
        ItemCrossReference: Record "Item Cross Reference";
        SalesHeader: Record "Sales Header";
        Resource: Record "Resource";
    begin
        SalesHeader.Get("Document No.", "Document Type"); //3K
        if SalesHeader."Bill-to IC Partner Code" <> '' then
            case Type of
                Type::" ", Type::"Charge (Item)":
                    begin
                        "IC Partner Ref. Type" := Type;
                        "IC Partner Reference" := "No.";
                    end;
                Type::"G/L Account":
                    begin
                        "IC Partner Ref. Type" := Type;
                        "IC Partner Reference" := GLAcc."Default IC Partner G/L Acc. No";
                    end;
                Type::Item:
                    begin
                        if SalesHeader."Sell-to IC Partner Code" <> '' then
                            ICPartner.Get(SalesHeader."Sell-to IC Partner Code")
                        else
                            ICPartner.Get(SalesHeader."Bill-to IC Partner Code");
                        case ICPartner."Outbound Sales Item No. Type" of
                            ICPartner."Outbound Sales Item No. Type"::"Common Item No.":
                                Validate("IC Partner Ref. Type", "IC Partner Ref. Type"::"Common Item No.");
                            ICPartner."Outbound Sales Item No. Type"::"Internal No.":
                                begin
                                    "IC Partner Ref. Type" := "IC Partner Ref. Type"::Item;
                                    "IC Partner Reference" := "No.";
                                end;
                            ICPartner."Outbound Sales Item No. Type"::"Cross Reference":
                                begin
                                    Validate("IC Partner Ref. Type", "IC Partner Ref. Type"::"Cross Reference");
                                    ItemCrossReference.SetRange("Cross-Reference Type",
                                      ItemCrossReference."Cross-Reference Type"::Customer);
                                    ItemCrossReference.SetRange("Cross-Reference Type No.",
                                      "Sell-to Customer No.");
                                    ItemCrossReference.SetRange("Item No.", "No.");
                                    if ItemCrossReference.FindFirst then
                                        "IC Partner Reference" := ItemCrossReference."Cross-Reference No.";
                                end;
                        end;
                    end;
                Type::"Fixed Asset":
                    begin
                        "IC Partner Ref. Type" := "IC Partner Ref. Type"::" ";
                        "IC Partner Reference" := '';
                    end;
                Type::Resource:
                    begin
                        Resource.Get("No.");
                        "IC Partner Ref. Type" := "IC Partner Ref. Type"::"G/L Account";
                        "IC Partner Reference" := Resource."IC Partner Purch. G/L Acc. No.";
                    end;
            end;
    end;

    var
        GenPostingSetup: Record "General Posting Setup";
        GLAcc: Record "G/L Account";

    var
        Text041: Label 'You must cancel the existing approval for this document to be able to change the %1 field.';
}

