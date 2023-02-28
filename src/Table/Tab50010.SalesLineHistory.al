table 50010 "Sales Line History"
{
    // <changelog>
    // <add id="IN0062" dev="Ravinder" date="2007-11-29" area="STRND" releaseversion="IN6.00" feature="25225"
    // >Calculatestructure function updated</add>
    // <add id="PS36451" dev="Vineet" date="2008-08-07" area="VAT" releaseversion="IN6.00" feature="36451"
    // >function UpdateTaxAmount updated,Function InsertSalesTaxLineBuffer,
    // Function CalculateStructuresPIT updated,Function InsertSalesLineBuffer updated,OnDelete trigger updated
    // New field Item Charge Entry added</add>
    // <change id="PS33562" dev="suneethg" date="2008-12-29" area="SERVICETAX" releaseversion="IN6.00.01" feature="33562"
    // >Initialized Service Tax Amounts if quantity is Zero on quantity Onvalidate
    // </change>
    // <change id="PS34940" dev="suneethg" date="2009-02-12" area="TAX" releaseversion="IN6.00.01" feature="34940"
    // >code commented with PS34940 has been added in updatetaxamounts function.
    // </change>
    // <change id="PS35496" dev="suneethg" date="2009-03-06" area="PITMRP" releaseversion="IN6.00.01" feature="35496"
    // >code commented with PS35496 has been added in BCD and CIF Amount field onvalidate.
    // </change>
    // <change id="PS35959" dev="suneethg" date="2009-04-06" area="VAT" releaseversion="IN6.00.01" feature="NAVCORS35959"
    // >In Structures VAT option has been deleted.
    // </change>
    // <change id="PS37358" dev="suneethg" date="2009-04-16" area="CIF" releaseversion="IN6.00.01" feature="NAVCORS37358"
    // >Code commented in CIF amount and BCD amount onvalidate trigger.
    // </change>
    // <change id="PS38000" dev="suneethg" date="2009-05-16" area="Excise" releaseversion="IN6.00.01" feature="NAVCORS38000"
    // >Code commented with PS38000 has been added on all excise components assessable value calculations.
    // </change>
    // <change id="PS35955" dev="suneethg" date="2009-05-16" area="CIF" releaseversion="IN6.00.01" feature="NAVCORS35955"
    // >Code commented with PS35955 has been added in CalculateStructures function.
    // </change>
    // <change id="PS40211" dev="Preeti" date="2009-06-11" area="Charges" releaseversion="IN6.00.01" feature="PS40211"
    // >Modified DivideAmount function to calculate charge amount correctly if LineDiscount% is 100.
    // </change>
    // <change id="PS46277" dev="suneethg" date="2009-11-30" area="TCS" feature="NAVCORS46277"
    //  releaseversion="IN7.00">Code has been changed in CalculateTCS function,
    //  to correct TCS base amount when create three lines in Sales Order.</change>
    // <change id="IN0001" dev="SUNEETHG" date="2010-09-07" area="RG23D" baseversion="IN6.00.01" releaseversion="IN7.00"
    //  feature="VSTF203755">
    //  Functions CheckAvailableQty and GetBaseAmt updated.</change>
    //  <change id="VSTF208180" dev="v-sankya" feature="VSTF208180"
    //  date="2010-08-04" area="STRUCTURE"  baseversion="IN6.00.01"
    //  releaseversion="IN7.00">
    //  The values in the Amount field in Structure Order Details are incorrect.</change>
    //  <change id="VSTF208159" dev="v-anrout" feature="VSTF208159"
    //    date="2010-08-12" area="RG23D"  baseversion="IN6.00.01"
    //    releaseversion="IN7.00">
    //    Design change in RG 23 D
    //  </change>
    //  <change id="VSTF203964" dev="v-anrout" date="2010-06-14" area="EXCISE" baseversion="IN6.00.01"
    //   releaseversion="IN7.00" feature="VSTF203964">Function calculatestructure updated</change>
    //  <change id="PS58830" dev="hhjort" date="2010-09-27" area="EXCISE" baseversion="IN6.00.01"
    //   releaseversion="IN7.00" feature="PS58830">Function CalculateStructures</change>
    //  <change id="IN0002" dev="all-e" date="2010-10-21" area="STRUCTURE" feature="VSTF203900"
    //   baseversion="IN6.00.01" releaseversion="IN7.00">Structure calculates wrong values for FCY orders
    //   showing wrong value in Amount LCY field</change>
    //  <change id="IN0003" dev="suneethg" date="2010-10-26" area="TCS" feature="VSTF113582"
    //   baseversion="IN6.00.01" releaseversion="IN7.00">Application of invoice with creditmemo using applies to ID.</change>
    //  <change id="VSTF240612" dev="v-anrout" feature="VSTF240612"
    //   date="2011-01-13" area="EXCISE" baseversion="IN6.00.01.03"
    //   releaseversion="IN7.00">
    //   Excise base Amount changes when Structure is changed in Sales Order
    //  </change>
    //  <change id="VSTF252133" dev="v-anrout" date="2011-01-31" area="SALESTAX" feature="VSTF252133"
    //  baseversion="IN6.00.01" releaseversion="IN7.00">
    //  The Tax pct. is incorrect in Sales Order Line and posted Sales Invoice line
    //  </change>
    //  <change id="VSTF254820" dev="v-anrout" feature="VSTF254820"
    //   date="2011-04-04" area="TCS" baseversion="IN6.00.01"
    //   releaseversion="IN7.00">
    //   TCS not calculated for Charge(Item)
    //  </change>
    //  <change id="VSTF259053" dev="v-sanagp" feature="VSTF259053"
    //   date="2011-04-04" area="TCS" baseversion="IN6.00.01"
    //   releaseversion="IN7.00">
    //   TCS Amount is incorrect when Theshold Overlook is unchecked
    //  </change>
    //  <change id="VSTF256531" dev="v-asgupt" feature="VSTF256531"
    //     date="2011-03-09" area="STRUCTURE"  baseversion="IN6.00.01"
    //     releaseversion="IN7.00">
    //     Amount (LCY) in structure Order Line Details is incorrect
    //   </change>
    //   <change id="VSTF257709" dev="v-asgupt" feature="VSTF257709"
    //   date="2011-05-05" area="STRUCTURE" baseversion="IN7.00"
    //   releaseversion="IN7.00">
    //   Amount (LCY) in structure Order Line Details is incorrect
    //   </change>
    //   <add id="IN0004" dev="ALL-E" date="2011-08-23" area="SERVICETAX" feature="VSTF273271"
    //   releaseversion="IN7.00">Service Tax  Change in POINT OF TAX for determination of Service Tax and Tax rate</add>
    // </changelog>

    Caption = 'Sales Line';
    PasteIsValid = false;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = FIELD("Document Type"));
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                TestStatusOpen;
                GetSalesHeader;

                TestField("Qty. Shipped Not Invoiced", 0);
                TestField("Quantity Shipped", 0);
                TestField("Shipment No.", '');

                TestField("Return Qty. Rcd. Not Invd.", 0);
                TestField("Return Qty. Received", 0);
                TestField("Return Receipt No.", '');

                TestField("Prepmt. Amt. Inv.", 0);

                CheckAssocPurchOrder(FieldCaption(Type));

                if Type <> xRec.Type then
                    case xRec.Type of
                        Type::Item:
                            begin
                                //        ATOLink.DeleteAsmFromSalesLine(Rec);
                                if Quantity <> 0 then begin
                                    SalesHeader.TestField(Status, SalesHeader.Status::Open);
                                    CalcFields("Reserved Qty. (Base)");
                                    TestField("Reserved Qty. (Base)", 0);
                                    //  ReserveSalesLine.VerifyChange(Rec,xRec);
                                    //  WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                                end;
                            end;
                        Type::"Fixed Asset":
                            if Quantity <> 0 then
                                SalesHeader.TestField(Status, SalesHeader.Status::Open);
                        Type::"Charge (Item)":
                            DeleteChargeChargeAssgnt("Document Type", "Document No.", "Line No.");
                    end;

                //AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);
                //TempSalesLine := Rec;
                Init;
                Type := TempSalesLine.Type;
                "System-Created Entry" := TempSalesLine."System-Created Entry";

                if Type = Type::Item then
                    "Allow Item Charge Assignment" := true
                else
                    "Allow Item Charge Assignment" := false;
                if Type = Type::Item then begin
                    if SalesHeader.InventoryPickConflict("Document Type", "Document No.", SalesHeader."Shipping Advice") then
                        Error(Text056, SalesHeader."Shipping Advice");
                    //TBD
                    /*
                    if SalesHeader.WhseShpmntConflict("Document Type", "Document No.", SalesHeader."Shipping Advice") then
                        Error(Text052, SalesHeader."Shipping Advice");
                    */
                end;
            end;
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            var
                PrepaymentMgt: Codeunit "Prepayment Mgt.";
            begin
                /*
                TestJobPlanningLine;
                TestStatusOpen;
                CheckItemAvailable(FIELDNO("No."));
                
                IF (xRec."No." <> "No.") AND (Quantity <> 0) THEN BEGIN
                  TESTFIELD("Qty. to Asm. to Order (Base)",0);
                  CALCFIELDS("Reserved Qty. (Base)");
                  TESTFIELD("Reserved Qty. (Base)",0);
                {
                  IF Type = Type::Item THEN
                //    WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                END;
                 }
                TESTFIELD("Qty. Shipped Not Invoiced",0);
                TESTFIELD("Quantity Shipped",0);
                TESTFIELD("Shipment No.",'');
                
                TESTFIELD("Prepmt. Amt. Inv.",0);
                
                TESTFIELD("Return Qty. Rcd. Not Invd.",0);
                TESTFIELD("Return Qty. Received",0);
                TESTFIELD("Return Receipt No.",'');
                
                IF "No." = '' THEN
                  //ATOLink.DeleteAsmFromSalesLine(Rec);
                CheckAssocPurchOrder(FIELDCAPTION("No."));
                //AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);
                
                //TempSalesLine := Rec;
                INIT;
                Type := TempSalesLine.Type;
                "No." := TempSalesLine."No.";
                IF "No." = '' THEN
                  EXIT;
                IF Type <> Type::" " THEN
                  Quantity := TempSalesLine.Quantity;
                
                "System-Created Entry" := TempSalesLine."System-Created Entry";
                GetSalesHeader;
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
                
                "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
                "Currency Code" := SalesHeader."Currency Code";
                "Location Code" := SalesHeader."Location Code";
                IF "Location Code" = '' THEN BEGIN
                  GetCompanyInformation;
                  "Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
                END ELSE BEGIN
                  GetLocation("Location Code");
                  "Service Tax Registration No." := Location."Service Tax Registration No."
                END;
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
                IF NOT "System-Created Entry" AND ("Document Type" = "Document Type"::Order) AND (Type <> Type::" ") THEN
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
                CALCFIELDS("Substitution Available");
                
                "Promised Delivery Date" := SalesHeader."Promised Delivery Date";
                "Requested Delivery Date" := SalesHeader."Requested Delivery Date";
                "Shipment Date" :=
                  CalendarMgmt.CalcDateBOC(
                    '',
                    SalesHeader."Shipment Date",
                    CalChange."Source Type"::Location,
                    "Location Code",
                    '',
                    CalChange."Source Type"::"Shipping Agent",
                    "Shipping Agent Code",
                    "Shipping Agent Service Code",
                    FALSE);
                UpdateDates;
                
                CASE Type OF
                  Type::" ":
                    BEGIN
                      StdTxt.GET("No.");
                      Description := StdTxt.Description;
                      "Allow Item Charge Assignment" := FALSE;
                    END;
                  Type::"G/L Account":
                    BEGIN
                      GLAcc.GET("No.");
                      GLAcc.CheckGLAcc;
                      IF NOT "System-Created Entry" THEN
                        GLAcc.TESTFIELD("Direct Posting",TRUE);
                      Description := GLAcc.Name;
                      "Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                      "VAT Prod. Posting Group" := GLAcc."VAT Prod. Posting Group";
                      "Tax Group Code" := GLAcc."Tax Group Code";
                      "Allow Invoice Disc." := FALSE;
                      "Allow Item Charge Assignment" := FALSE;
                      "Service Tax Group" := GLAcc."Service Tax Group Code";
                      IF SalesHeader."Location Code" <> '' THEN BEGIN
                        GetLocation(SalesHeader."Location Code");
                        "Service Tax Registration No." := Location."Service Tax Registration No.";
                      END ELSE BEGIN
                        GetCompanyInformation;
                        "Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
                      END;
                
                      "Excise Prod. Posting Group" := GLAcc."Excise Prod. Posting Group";
                      "Capital Item" := GLAcc."Capital Item";
                    END;
                  Type::Item:
                    BEGIN
                      GetItem;
                      Item.TESTFIELD(Blocked,FALSE);
                      Item.TESTFIELD("Inventory Posting Group");
                      Item.TESTFIELD("Gen. Prod. Posting Group");
                
                      "Posting Group" := Item."Inventory Posting Group";
                      Description := Item.Description;
                      "Description 2" := Item."Description 2";
                      GetUnitCost;
                      "Allow Invoice Disc." := Item."Allow Invoice Disc.";
                      "Units per Parcel" := Item."Units per Parcel";
                      "Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                      "VAT Prod. Posting Group" := Item."VAT Prod. Posting Group";
                      "Tax Group Code" := Item."Tax Group Code";
                      "Item Category Code" := Item."Item Category Code";
                      "Product Group Code" := Item."Product Group Code";
                      Nonstock := Item."Created From Nonstock Item";
                      "Profit %" := Item."Profit %";
                      "Allow Item Charge Assignment" := TRUE;
                //      PrepaymentMgt.SetSalesPrepaymentPct(Rec,SalesHeader."Posting Date");
                      "Excise Prod. Posting Group" := Item."Excise Prod. Posting Group";
                      "Excise Accounting Type" := Item."Excise Accounting Type";
                      "Capital Item" := Item."Capital Item";
                      "Assessable Value" := Item."Assessable Value";
                      IF "Free Supply" THEN
                        "Line Discount %" := 100;
                
                      IF SalesHeader."Language Code" <> '' THEN
                        GetItemTranslation;
                
                      IF Item.Reserve = Item.Reserve::Optional THEN
                        Reserve := SalesHeader.Reserve
                      ELSE
                        Reserve := Item.Reserve;
                
                      "Unit of Measure Code" := Item."Sales Unit of Measure";
                    END;
                  Type::Resource:
                    BEGIN
                      Res.GET("No.");
                      Res.TESTFIELD(Blocked,FALSE);
                      Res.TESTFIELD("Gen. Prod. Posting Group");
                      Description := Res.Name;
                      "Description 2" := Res."Name 2";
                      "Unit of Measure Code" := Res."Base Unit of Measure";
                      "Unit Cost (LCY)" := Res."Unit Cost";
                      "Gen. Prod. Posting Group" := Res."Gen. Prod. Posting Group";
                      "VAT Prod. Posting Group" := Res."VAT Prod. Posting Group";
                      "Tax Group Code" := Res."Tax Group Code";
                      "Allow Item Charge Assignment" := FALSE;
                      FindResUnitCost;
                    END;
                  Type::"Fixed Asset":
                    BEGIN
                      FA.GET("No.");
                      FA.TESTFIELD(Inactive,FALSE);
                      FA.TESTFIELD(Blocked,FALSE);
                      GetFAPostingGroup;
                      Description := FA.Description;
                      "Description 2" := FA."Description 2";
                      "Allow Invoice Disc." := FALSE;
                      "Allow Item Charge Assignment" := FALSE;
                      "Tax Group Code" := FA."Tax Group Code";
                      "Excise Prod. Posting Group" := FA."Excise Prod. Posting Group";
                      "Excise Accounting Type" := FA."Excise Accounting Type";
                      "VAT Prod. Posting Group" := FA."VAT Product Posting Group";
                    END;
                  Type::"Charge (Item)":
                    BEGIN
                      ItemCharge.GET("No.");
                      Description := ItemCharge.Description;
                      "Gen. Prod. Posting Group" := ItemCharge."Gen. Prod. Posting Group";
                      "VAT Prod. Posting Group" := ItemCharge."VAT Prod. Posting Group";
                      "Tax Group Code" := ItemCharge."Tax Group Code";
                      "Allow Invoice Disc." := FALSE;
                      "Allow Item Charge Assignment" := FALSE;
                      "Excise Prod. Posting Group" := ItemCharge."Excise Prod. Posting Group";
                      "Capital Item" := ItemCharge."Capital Item";
                      "Item Charge Entry" := TRUE;  // PS36451
                    END;
                END;
                
                VALIDATE("Prepayment %");
                
                IF Type <> Type::" " THEN BEGIN
                  IF Type <> Type::"Fixed Asset" THEN
                    VALIDATE("VAT Prod. Posting Group");
                  VALIDATE("Unit of Measure Code");
                  IF Quantity <> 0 THEN BEGIN
                    InitOutstanding;
                    IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
                      InitQtyToReceive
                    ELSE
                      InitQtyToShip;
                    InitQtyToAsm;
                    UpdateWithWarehouseShip;
                  END;
                  UpdateUnitPrice(FIELDNO("No."));
                END;
                
                CreateDim(
                  DimMgt.TypeToTableID3(Type),"No.",
                  DATABASE::Job,"Job No.",
                  DATABASE::"Responsibility Center","Responsibility Center");
                IF "No." <> xRec."No." THEN BEGIN
                  IF Type = Type::Item THEN
                    IF (Quantity <> 0) AND ItemExists(xRec."No.") THEN BEGIN
                //      ReserveSalesLine.VerifyChange(Rec,xRec);
                //      WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                    END;
                
                  GetDefaultBin;
                  AutoAsmToOrder;
                  DeleteItemChargeAssgnt("Document Type","Document No.","Line No.");
                  IF Type = Type::"Charge (Item)" THEN
                    DeleteChargeChargeAssgnt("Document Type","Document No.","Line No.");
                END;
                GetItemCrossRef(FIELDNO("No."));
                
                SalesHeader.GET("Document Type","Document No.");
                InitICPartner;
                
                GetStandardDeduction(SalesHeader);
                // PS38000.Begin
                "Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure" ;
                // PS38000.End
                   */

            end;
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));

            trigger OnValidate()
            var
                SalesHeader2: Record "Sales Header";
                ReturnRcptline: Record "Return Receipt Line";
            begin
                TestJobPlanningLine;
                TestStatusOpen;
                CheckAssocPurchOrder(FieldCaption("Location Code"));

                if xRec."Location Code" <> "Location Code" then begin
                    if not FullQtyIsForAsmToOrder then begin
                        CalcFields("Reserved Qty. (Base)");
                        TestField("Reserved Qty. (Base)", "Qty. to Asm. to Order (Base)");
                    end;
                    TestField("Qty. Shipped Not Invoiced", 0);
                    TestField("Shipment No.", '');
                    TestField("Return Qty. Rcd. Not Invd.", 0);
                    TestField("Return Receipt No.", '');
                end;

                GetSalesHeader;
                //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
                // "Shipment Date" :=
                //   CalendarMgmt.CalcDateBOC(
                //     '',
                //     SalesHeader."Shipment Date",
                //     CalChange."Source Type"::Location,
                //     "Location Code",
                //     '',
                //     CalChange."Source Type"::"Shipping Agent",
                //     "Shipping Agent Code",
                //     "Shipping Agent Service Code",
                //     false);
                //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
                CheckItemAvailable(FieldNo("Location Code"));

                if not "Drop Shipment" then begin
                    if "Location Code" = '' then begin
                        if InvtSetup.Get then
                            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                    end else
                        if Location.Get("Location Code") then
                            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                end else
                    Evaluate("Outbound Whse. Handling Time", '<0D>');
                /*
                IF "Location Code" <> xRec."Location Code" THEN BEGIN
                  InitItemAppl(TRUE);
                  GetDefaultBin;
                  InitQtyToAsm;
                  AutoAsmToOrder;
                  IF Quantity <> 0 THEN BEGIN
                    IF NOT "Drop Shipment" THEN
                      UpdateWithWarehouseShip;
                    IF NOT FullReservedQtyIsForAsmToOrder THEN
                //      ReserveSalesLine.VerifyChange(Rec,xRec);
                //    WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                  END;
                END;
                 */
                UpdateDates;

                if (Type = Type::Item) and ("No." <> '') then
                    GetUnitCost;

                //TaxAreaUpdate;//LKS-Raj Commented
                //LKS-Raj Commented (Table Missing)
                // if "Location Code" = '' then begin
                //     GetCompanyInformation;
                //     "Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";
                // end else begin
                //     GetLocation("Location Code");
                //     "Service Tax Registration No." := Location."Service Tax Registration No."
                // end;
                // SalesHeader2.Reset;
                // SalesHeader2.SetRange("No.", "Document No.");
                // SalesHeader2.SetRange("Document Type", "Document Type");
                // SalesHeader2.SetRange("Re-Dispatch", true);
                // if SalesHeader2.FindFirst then begin
                //     ReturnRcptline.Reset;
                //     ReturnRcptline.SetRange("Document No.", SalesHeader2."Return Re-Dispatch Rcpt. No.");
                //     ReturnRcptline.SetRange("Line No.", "Return Rcpt Line No.");
                //     if ReturnRcptline.FindFirst then
                //         if "No." = ReturnRcptline."No." then
                //             if "Location Code" <> ReturnRcptline."Location Code" then
                //                 Error(Text16501);
                // end;

                // CheckWMS;
                //LKS-Raj Commented (Table Missing)
            end;
        }
        field(8; "Posting Group"; Code[10])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = IF (Type = CONST(Item)) "Inventory Posting Group"
            ELSE
            IF (Type = CONST("Fixed Asset")) "FA Posting Group";
        }
        field(10; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';

            trigger OnValidate()
            var
                CheckDateConflict: Codeunit "Reservation-Check Date Confl.";
            begin
                TestStatusOpen;
                if CurrFieldNo <> 0 then
                    //  AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);

                    if "Shipment Date" <> 0D then begin
                        if CurrFieldNo in [
                                           FieldNo("Planned Shipment Date"),
                                           FieldNo("Planned Delivery Date"),
                                           FieldNo("Shipment Date"),
                                           FieldNo("Shipping Time"),
                                           FieldNo("Outbound Whse. Handling Time"),
                                           FieldNo("Requested Delivery Date")]
                        then
                            CheckItemAvailable(FieldNo("Shipment Date"));

                        if ("Shipment Date" < WorkDate) and (Type <> Type::" ") then
                            if not (HideValidationDialog or HasBeenShown) and GuiAllowed then begin
                                Message(
                                  Text014,
                                  FieldCaption("Shipment Date"), "Shipment Date", WorkDate);
                                HasBeenShown := true;
                            end;
                    end;

                AutoAsmToOrder;
                if (xRec."Shipment Date" <> "Shipment Date") and
                   (Quantity <> 0) and
                   (Reserve <> Reserve::Never) and
                   not StatusCheckSuspended
                then
                    //  CheckDateConflict.SalesLineCheck(Rec,CurrFieldNo <> 0);

                    if not PlannedShipmentDateCalculated then
                        "Planned Shipment Date" := CalcPlannedShptDate(FieldNo("Shipment Date"));
                if not PlannedDeliveryDateCalculated then
                    "Planned Delivery Date" := CalcPlannedDeliveryDate(FieldNo("Shipment Date"));
            end;
        }
        field(11; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(12; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(13; "Unit of Measure"; Text[20])
        {
            Caption = 'Unit of Measure';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
                SalesHeader2: Record "Sales Header";
                ReturnRcptLine: Record "Return Receipt Line";
            begin
                TestJobPlanningLine;
                TestStatusOpen;

                CheckAssocPurchOrder(FieldCaption(Quantity));

                if "Shipment No." <> '' then
                    CheckShipmentRelation
                else
                    if "Return Receipt No." <> '' then
                        CheckRetRcptRelation;

                "Quantity (Base)" := CalcBaseQty(Quantity);

                if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
                    if (Quantity * "Return Qty. Received" < 0) or
                       ((Abs(Quantity) < Abs("Return Qty. Received")) and ("Return Receipt No." = ''))
                    then
                        FieldError(Quantity, StrSubstNo(Text003, FieldCaption("Return Qty. Received")));
                    if ("Quantity (Base)" * "Return Qty. Received (Base)" < 0) or
                       ((Abs("Quantity (Base)") < Abs("Return Qty. Received (Base)")) and ("Return Receipt No." = ''))
                    then
                        FieldError("Quantity (Base)", StrSubstNo(Text003, FieldCaption("Return Qty. Received (Base)")));
                end else begin
                    if (Quantity * "Quantity Shipped" < 0) or
                       ((Abs(Quantity) < Abs("Quantity Shipped")) and ("Shipment No." = ''))
                    then
                        FieldError(Quantity, StrSubstNo(Text003, FieldCaption("Quantity Shipped")));
                    if ("Quantity (Base)" * "Qty. Shipped (Base)" < 0) or
                       ((Abs("Quantity (Base)") < Abs("Qty. Shipped (Base)")) and ("Shipment No." = ''))
                    then
                        FieldError("Quantity (Base)", StrSubstNo(Text003, FieldCaption("Qty. Shipped (Base)")));
                end;

                if (Type = Type::"Charge (Item)") and (CurrFieldNo <> 0) then begin
                    if (Quantity = 0) and ("Qty. to Assign" <> 0) then
                        FieldError("Qty. to Assign", StrSubstNo(Text009, FieldCaption(Quantity), Quantity));
                    if (Quantity * "Qty. Assigned" < 0) or (Abs(Quantity) < Abs("Qty. Assigned")) then
                        FieldError(Quantity, StrSubstNo(Text003, FieldCaption("Qty. Assigned")));
                end;

                //AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);
                if (xRec.Quantity <> Quantity) or (xRec."Quantity (Base)" <> "Quantity (Base)") then begin
                    InitOutstanding;
                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
                        InitQtyToReceive
                    else
                        InitQtyToShip;
                    InitQtyToAsm;
                end;

                CheckItemAvailable(FieldNo(Quantity));

                if (Quantity * xRec.Quantity < 0) or (Quantity = 0) then
                    InitItemAppl(false);

                if Type = Type::Item then begin
                    UpdateUnitPrice(FieldNo(Quantity));
                    if (xRec.Quantity <> Quantity) or (xRec."Quantity (Base)" <> "Quantity (Base)") then begin
                        //    ReserveSalesLine.VerifyQuantity(Rec,xRec);
                        if not "Drop Shipment" then
                            UpdateWithWarehouseShip;
                        //    WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                        if ("Quantity (Base)" * xRec."Quantity (Base)" <= 0) and ("No." <> '') then begin
                            GetItem;
                            if (Item."Costing Method" = Item."Costing Method"::Standard) and not IsShipment then
                                GetUnitCost;
                        end;
                    end;
                    Validate("Qty. to Assemble to Order");
                    if (Quantity = "Quantity Invoiced") and (CurrFieldNo <> 0) then
                        CheckItemChargeAssgnt;
                    CheckApplFromItemLedgEntry(ItemLedgEntry);
                end else
                    Validate("Line Discount %");

                if (xRec.Quantity <> Quantity) and (Quantity = 0) and
                   ((Amount <> 0) or ("Amount Including VAT" <> 0) or ("VAT Base Amount" <> 0))
                then begin
                    Amount := 0;
                    "Amount Including VAT" := 0;
                    "VAT Base Amount" := 0;
                end;
                // PSID_33562.Begin
                if (xRec.Quantity <> Quantity) and (Quantity = 0) and
                   (("Amount To Customer" <> 0) or ("Service Tax Amount" <> 0))
                then begin
                    "Service Tax Amount" := 0;
                    "Service Tax eCess Amount" := 0;
                    "Service Tax SHE Cess Amount" := 0;
                    "Amount To Customer" := 0;
                    "Service Tax Base" := 0;
                end;
                // PSID_33562.End

                if ("Document Type" = "Document Type"::Invoice) and ("Prepayment %" <> 0) then
                    UpdatePrePaymentAmounts;

                //LKS-Raj Commented (Table Missing)
                // TaxAreaUpdate;
                // ChkQtyUpdatioAfterDDPLA;

                // SalesHeader2.Reset;
                // SalesHeader2.SetRange("No.", "Document No.");
                // SalesHeader2.SetRange("Document Type", "Document Type");
                // SalesHeader2.SetRange("Re-Dispatch", true);
                // if SalesHeader2.FindFirst then begin
                //     ReturnRcptLine.Reset;
                //     ReturnRcptLine.SetRange("Document No.", SalesHeader2."Return Re-Dispatch Rcpt. No.");
                //     ReturnRcptLine.SetRange("Line No.", "Return Rcpt Line No.");
                //     if ReturnRcptLine.FindFirst then
                //         if Quantity > ReturnRcptLine."Qty. to be Re-Dispatched" then
                //             Error(Text16502);
                // end;
                //LKS-Raj Commented (Table Missing)

                CheckWMS;
            end;
        }
        field(16; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(17; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if "Qty. to Invoice" = MaxQtyToInvoice then
                    InitQtyToInvoice
                else
                    "Qty. to Invoice (Base)" := CalcBaseQty("Qty. to Invoice");
                if ("Qty. to Invoice" * Quantity < 0) or
                   (Abs("Qty. to Invoice") > Abs(MaxQtyToInvoice))
                then
                    Error(
                      Text005,
                      MaxQtyToInvoice);
                if ("Qty. to Invoice (Base)" * "Quantity (Base)" < 0) or
                   (Abs("Qty. to Invoice (Base)") > Abs(MaxQtyToInvoiceBase))
                then
                    Error(
                      Text006,
                      MaxQtyToInvoiceBase);
                "VAT Difference" := 0;
                CalcInvDiscToInvoice;
                CalcPrepaymentToDeduct;
            end;
        }
        field(18; "Qty. to Ship"; Decimal)
        {
            Caption = 'Qty. to Ship';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
                if (CurrFieldNo <> 0) and
                   (Type = Type::Item) and
                   ("Qty. to Ship" <> 0) and
                   (not "Drop Shipment")
                then
                    CheckWarehouse;

                if "Qty. to Ship" = "Outstanding Quantity" then
                    InitQtyToShip
                else begin
                    "Qty. to Ship (Base)" := CalcBaseQty("Qty. to Ship");
                    CheckServItemCreation;
                    InitQtyToInvoice;
                end;
                if ("Qty. to Ship" * Quantity < 0) or
                   (Abs("Qty. to Ship") > Abs("Outstanding Quantity")) or
                   (Quantity * "Outstanding Quantity" < 0)
                then
                    Error(
                      Text007,
                      "Outstanding Quantity");
                if ("Qty. to Ship (Base)" * "Quantity (Base)" < 0) or
                   (Abs("Qty. to Ship (Base)") > Abs("Outstanding Qty. (Base)")) or
                   ("Quantity (Base)" * "Outstanding Qty. (Base)" < 0)
                then
                    Error(
                      Text008,
                      "Outstanding Qty. (Base)");

                if (CurrFieldNo <> 0) and (Type = Type::Item) and ("Qty. to Ship" < 0) then
                    CheckApplFromItemLedgEntry(ItemLedgEntry);

                //ATOLink.UpdateQtyToAsmFromSalesLine(Rec);
            end;
        }
        field(22; "Unit Price"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            CaptionClass = GetCaptionClass(FieldNo("Unit Price"));
            Caption = 'Unit Price';

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                if not "Price Inclusive of Tax" then
                    TestStatusOpen;
                Validate("Line Discount %");
                ChkQtyUpdatioAfterDDPLA;
            end;
        }
        field(23; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';

            trigger OnValidate()
            begin
                if "Unit Cost (LCY)" <> xRec."Unit Cost (LCY)" then
                    CheckAssocPurchOrder(FieldCaption("Unit Cost (LCY)"));

                if (CurrFieldNo = FieldNo("Unit Cost (LCY)")) and
                   (Type = Type::Item) and ("No." <> '') and ("Quantity (Base)" <> 0)
                then begin
                    TestJobPlanningLine;
                    GetItem;
                    if (Item."Costing Method" = Item."Costing Method"::Standard) and not IsShipment then begin
                        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
                            Error(
                              Text037,
                              FieldCaption("Unit Cost (LCY)"), Item.FieldCaption("Costing Method"),
                              Item."Costing Method", FieldCaption(Quantity));
                        Error(
                          Text038,
                          FieldCaption("Unit Cost (LCY)"), Item.FieldCaption("Costing Method"),
                          Item."Costing Method", FieldCaption(Quantity));
                    end;
                end;

                GetSalesHeader;
                if SalesHeader."Currency Code" <> '' then begin
                    Currency.TestField("Unit-Amount Rounding Precision");
                    "Unit Cost" :=
                      Round(
                        CurrExchRate.ExchangeAmtLCYToFCY(
                          GetDate, SalesHeader."Currency Code",
                          "Unit Cost (LCY)", SalesHeader."Currency Factor"),
                        Currency."Unit-Amount Rounding Precision")
                end else
                    "Unit Cost" := "Unit Cost (LCY)";
            end;
        }
        field(25; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                if not "Price Inclusive of Tax" then
                    TestStatusOpen;
                if "Free Supply" then
                    "Line Discount %" := 100;
                if not "Price Inclusive of Tax" then
                    "Line Discount Amount" :=
                      Round(Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") * "Line Discount %" / 100,
                        Currency."Amount Rounding Precision")
                else
                    "Line Discount Amount" := Round(Round(Quantity * "Unit Price Incl. of Tax", Currency."Amount Rounding Precision") *
                        "Line Discount %" / 100, Currency."Amount Rounding Precision");
                "Inv. Discount Amount" := 0;
                "Inv. Disc. Amount to Invoice" := 0;
                UpdateAmounts;
            end;
        }
        field(28; "Line Discount Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                TestStatusOpen;
                TestField(Quantity);
                if xRec."Line Discount Amount" <> "Line Discount Amount" then
                    if not "Price Inclusive of Tax" then
                        if Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") <> 0 then
                            "Line Discount %" :=
                              Round(
                                "Line Discount Amount" / Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") * 100,
                                0.00001)
                        else
                            "Line Discount %" := 0
                    else
                        if Round(Quantity * "Unit Price Incl. of Tax", Currency."Amount Rounding Precision") <> 0 then
                            "Line Discount %" :=
                              Round(
                                "Line Discount Amount" / Round(Quantity * "Unit Price Incl. of Tax", Currency."Amount Rounding Precision") * 100,
                                0.00001)
                        else
                            "Line Discount %" := 0;
                "Inv. Discount Amount" := 0;
                "Inv. Disc. Amount to Invoice" := 0;
                UpdateAmounts;
            end;
        }
        field(29; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;

            trigger OnValidate()
            begin
                Amount := Round(Amount, Currency."Amount Rounding Precision");
                case "VAT Calculation Type" of
                    "VAT Calculation Type"::"Normal VAT",
                    "VAT Calculation Type"::"Reverse Charge VAT":
                        begin
                            "VAT Base Amount" :=
                              Round(Amount * (1 - SalesHeader."VAT Base Discount %" / 100), Currency."Amount Rounding Precision");
                            "Amount Including VAT" :=
                              Round(Amount + "VAT Base Amount" * "VAT %" / 100, Currency."Amount Rounding Precision");
                        end;
                    "VAT Calculation Type"::"Full VAT":
                        if Amount <> 0 then
                            FieldError(Amount,
                              StrSubstNo(
                                Text009, FieldCaption("VAT Calculation Type"),
                                "VAT Calculation Type"));
                    "VAT Calculation Type"::"Sales Tax":
                        begin
                            SalesHeader.TestField("VAT Base Discount %", 0);
                            "VAT Base Amount" := Round(Amount, Currency."Amount Rounding Precision");
                            "Amount Including VAT" :=
                              Amount +
                              SalesTaxCalculate.CalculateTax(
                                "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
                                "VAT Base Amount", "Quantity (Base)", SalesHeader."Currency Factor");
                            if "VAT Base Amount" <> 0 then
                                "VAT %" :=
                                  Round(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount", 0.00001)
                            else
                                "VAT %" := 0;
                            "Amount Including VAT" := Round("Amount Including VAT", Currency."Amount Rounding Precision");
                        end;
                end;

                InitOutstandingAmount;
            end;
        }
        field(30; "Amount Including VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            Editable = false;

            trigger OnValidate()
            begin
                "Amount Including VAT" := Round("Amount Including VAT", Currency."Amount Rounding Precision");
                case "VAT Calculation Type" of
                    "VAT Calculation Type"::"Normal VAT",
                    "VAT Calculation Type"::"Reverse Charge VAT":
                        begin
                            Amount :=
                              Round(
                                "Amount Including VAT" /
                                (1 + (1 - SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100),
                                Currency."Amount Rounding Precision");
                            "VAT Base Amount" :=
                              Round(Amount * (1 - SalesHeader."VAT Base Discount %" / 100), Currency."Amount Rounding Precision");
                        end;
                    "VAT Calculation Type"::"Full VAT":
                        begin
                            Amount := 0;
                            "VAT Base Amount" := 0;
                        end;
                    "VAT Calculation Type"::"Sales Tax":
                        begin
                            SalesHeader.TestField("VAT Base Discount %", 0);
                            Amount :=
                              SalesTaxCalculate.ReverseCalculateTax(
                                "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
                                "Amount Including VAT", "Quantity (Base)", SalesHeader."Currency Factor");
                            if Amount <> 0 then
                                "VAT %" :=
                                  Round(100 * ("Amount Including VAT" - Amount) / Amount, 0.00001)
                            else
                                "VAT %" := 0;
                            Amount := Round(Amount, Currency."Amount Rounding Precision");
                            "VAT Base Amount" := Amount;
                        end;
                end;

                InitOutstandingAmount;
            end;
        }
        field(32; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            InitValue = true;

            trigger OnValidate()
            begin
                TestStatusOpen;
                if ("Allow Invoice Disc." <> xRec."Allow Invoice Disc.") and
                   (not "Allow Invoice Disc.")
                then begin
                    "Inv. Discount Amount" := 0;
                    "Inv. Disc. Amount to Invoice" := 0;
                    UpdateAmounts;
                end;
            end;
        }
        field(34; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
        }
        field(35; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
        }
        field(36; "Units per Parcel"; Decimal)
        {
            Caption = 'Units per Parcel';
            DecimalPlaces = 0 : 5;
        }
        field(37; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            Caption = 'Appl.-to Item Entry';

            trigger OnLookup()
            begin
                SelectItemEntry(FieldNo("Appl.-to Item Entry"));
            end;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
                ItemTrackingLines: Page "Item Tracking Lines";
            begin
                if "Appl.-to Item Entry" <> 0 then begin
                    //  AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);

                    TestField(Type, Type::Item);
                    TestField(Quantity);
                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
                        if Quantity > 0 then
                            FieldError(Quantity, Text030);
                    end else begin
                        if Quantity < 0 then
                            FieldError(Quantity, Text029);
                    end;
                    ItemLedgEntry.Get("Appl.-to Item Entry");
                    ItemLedgEntry.TestField(Positive, true);
                    if (ItemLedgEntry."Lot No." <> '') or (ItemLedgEntry."Serial No." <> '') then
                        Error(Text040, ItemTrackingLines.Caption, FieldCaption("Appl.-to Item Entry"));
                    if Abs("Qty. to Ship (Base)") > ItemLedgEntry.Quantity then
                        Error(ShippingMoreUnitsThanReceivedErr, ItemLedgEntry.Quantity, ItemLedgEntry."Document No.");

                    Validate("Unit Cost (LCY)", CalcUnitCost(ItemLedgEntry));

                    "Location Code" := ItemLedgEntry."Location Code";
                    if not ItemLedgEntry.Open then
                        Message(Text042, "Appl.-to Item Entry");
                end;
            end;
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(42; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            Editable = false;
            TableRelation = "Customer Price Group";

            trigger OnValidate()
            begin
                if Type = Type::Item then
                    UpdateUnitPrice(FieldNo("Customer Price Group"));
            end;
        }
        field(45; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            Editable = false;
            TableRelation = Job;
        }
        field(52; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";

            trigger OnValidate()
            begin
                if Type = Type::Resource then begin
                    TestStatusOpen;
                    if WorkType.Get("Work Type Code") then
                        Validate("Unit of Measure Code", WorkType."Unit of Measure Code");
                    UpdateUnitPrice(FieldNo("Work Type Code"));
                    Validate("Unit Price");
                    FindResUnitCost;
                end;
            end;
        }
        field(57; "Outstanding Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Outstanding Amount';
            Editable = false;

            trigger OnValidate()
            var
                Currency2: Record Currency;
            begin
                GetSalesHeader;
                Currency2.InitRoundingPrecision;
                if SalesHeader."Currency Code" <> '' then
                    "Outstanding Amount (LCY)" :=
                      Round(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          GetDate, "Currency Code",
                          "Outstanding Amount", SalesHeader."Currency Factor"),
                        Currency2."Amount Rounding Precision")
                else
                    "Outstanding Amount (LCY)" :=
                      Round("Outstanding Amount", Currency2."Amount Rounding Precision");
            end;
        }
        field(58; "Qty. Shipped Not Invoiced"; Decimal)
        {
            Caption = 'Qty. Shipped Not Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(59; "Shipped Not Invoiced"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Shipped Not Invoiced';
            Editable = false;

            trigger OnValidate()
            var
                Currency2: Record Currency;
            begin
                GetSalesHeader;
                Currency2.InitRoundingPrecision;
                if SalesHeader."Currency Code" <> '' then
                    "Shipped Not Invoiced (LCY)" :=
                      Round(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          GetDate, "Currency Code",
                          "Shipped Not Invoiced", SalesHeader."Currency Factor"),
                        Currency2."Amount Rounding Precision")
                else
                    "Shipped Not Invoiced (LCY)" :=
                      Round("Shipped Not Invoiced", Currency2."Amount Rounding Precision");
            end;
        }
        field(60; "Quantity Shipped"; Decimal)
        {
            Caption = 'Quantity Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(61; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(63; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
            Editable = false;
        }
        field(64; "Shipment Line No."; Integer)
        {
            Caption = 'Shipment Line No.';
            Editable = false;
        }
        field(67; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(68; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(69; "Inv. Discount Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Inv. Discount Amount';
            Editable = false;

            trigger OnValidate()
            begin
                CalcInvDiscToInvoice;
                UpdateAmounts;
            end;
        }
        field(71; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            Editable = false;
            TableRelation = IF ("Drop Shipment" = CONST(true)) "Purchase Header"."No." WHERE("Document Type" = CONST(Order));

            trigger OnValidate()
            begin
                if (xRec."Purchase Order No." <> "Purchase Order No.") and (Quantity <> 0) then begin
                    //  ReserveSalesLine.VerifyChange(Rec,xRec);
                    //  WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                end;
            end;
        }
        field(72; "Purch. Order Line No."; Integer)
        {
            Caption = 'Purch. Order Line No.';
            Editable = false;
            TableRelation = IF ("Drop Shipment" = CONST(true)) "Purchase Line"."Line No." WHERE("Document Type" = CONST(Order),
                                                                                               "Document No." = FIELD("Purchase Order No."));

            trigger OnValidate()
            begin
                if (xRec."Purch. Order Line No." <> "Purch. Order Line No.") and (Quantity <> 0) then begin
                    //  ReserveSalesLine.VerifyChange(Rec,xRec);
                    //  WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                end;
            end;
        }
        field(73; "Drop Shipment"; Boolean)
        {
            Caption = 'Drop Shipment';
            Editable = true;

            trigger OnValidate()
            begin
                TestField("Document Type", "Document Type"::Order);
                TestField(Type, Type::Item);
                TestField("Quantity Shipped", 0);
                TestField("Job No.", '');
                TestField("Qty. to Asm. to Order (Base)", 0);

                if "Drop Shipment" then
                    TestField("Special Order", false);

                CheckAssocPurchOrder(FieldCaption("Drop Shipment"));

                if "Drop Shipment" then begin
                    Reserve := Reserve::Never;
                    Validate(Quantity, Quantity);
                    if "Drop Shipment" then begin
                        Evaluate("Outbound Whse. Handling Time", '<0D>');
                        Evaluate("Shipping Time", '<0D>');
                        UpdateDates;
                        "Bin Code" := '';
                    end;
                end else begin
                    GetItem;
                    if Item.Reserve = Item.Reserve::Optional then begin
                        GetSalesHeader;
                        Reserve := SalesHeader.Reserve;
                    end else
                        Reserve := Item.Reserve;
                end;

                if "Drop Shipment" then
                    "Bin Code" := '';

                CheckItemAvailable(FieldNo("Drop Shipment"));
                /*
                //AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);
                IF (xRec."Drop Shipment" <> "Drop Shipment") AND (Quantity <> 0) THEN BEGIN
                  IF NOT "Drop Shipment" THEN BEGIN
                    InitQtyToAsm;
                    AutoAsmToOrder;
                    UpdateWithWarehouseShip
                  END ELSE
                    InitQtyToShip;
                //  WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                  IF NOT FullReservedQtyIsForAsmToOrder THEN
                //    ReserveSalesLine.VerifyChange(Rec,xRec);
                END;
                */

            end;
        }
        field(74; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(75; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                TestStatusOpen;
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group");
            end;
        }
        field(77; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(78; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(79; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(80; "Attached to Line No."; Integer)
        {
            Caption = 'Attached to Line No.';
            Editable = false;
            TableRelation = "Sales Line"."Line No." WHERE("Document Type" = FIELD("Document Type"),
                                                           "Document No." = FIELD("Document No."));
        }
        field(81; "Exit Point"; Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(82; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(83; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(85; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(86; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(87; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";

            trigger OnValidate()
            begin
                TestStatusOpen;
                UpdateAmounts;
                //ValidateTaxGroupCode;//LKS-Raj Commented
            end;
        }
        field(89; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                Validate("VAT Prod. Posting Group");
            end;
        }
        field(90; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                TestStatusOpen;
                VATPostingSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                "VAT Difference" := 0;
                "VAT %" := VATPostingSetup."VAT %";
                "VAT Calculation Type" := VATPostingSetup."VAT Calculation Type";
                "VAT Identifier" := VATPostingSetup."VAT Identifier";
                case "VAT Calculation Type" of
                    "VAT Calculation Type"::"Reverse Charge VAT",
                  "VAT Calculation Type"::"Sales Tax":
                        "VAT %" := 0;
                    "VAT Calculation Type"::"Full VAT":
                        begin
                            TestField(Type, Type::"G/L Account");
                            VATPostingSetup.TestField("Sales VAT Account");
                            TestField("No.", VATPostingSetup."Sales VAT Account");
                        end;
                end;
                if SalesHeader."Prices Including VAT" and (Type in [Type::Item, Type::Resource]) then
                    "Unit Price" :=
                      Round(
                        "Unit Price" * (100 + "VAT %") / (100 + xRec."VAT %"),
                        Currency."Unit-Amount Rounding Precision");
                UpdateAmounts;
            end;
        }
        field(91; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(92; "Outstanding Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Outstanding Amount (LCY)';
            Editable = false;
        }
        field(93; "Shipped Not Invoiced (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Shipped Not Invoiced (LCY)';
            Editable = false;
        }
        field(95; "Reserved Quantity"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry".Quantity WHERE("Source ID" = FIELD("Document No."),
                                                                   "Source Ref. No." = FIELD("Line No."),
                                                                   "Source Type" = CONST(37),
                                                                   "Source Subtype" = FIELD("Document Type"),
                                                                   "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(96; Reserve; Option)
        {
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;

            trigger OnValidate()
            begin
                if Reserve <> Reserve::Never then begin
                    TestField(Type, Type::Item);
                    TestField("No.");
                end;
                CalcFields("Reserved Qty. (Base)");
                if (Reserve = Reserve::Never) and ("Reserved Qty. (Base)" > 0) then
                    TestField("Reserved Qty. (Base)", 0);

                if xRec.Reserve = Reserve::Always then begin
                    GetItem;
                    if Item.Reserve = Item.Reserve::Always then
                        TestField(Reserve, Reserve::Always);
                end;
            end;
        }
        field(97; "Blanket Order No."; Code[20])
        {
            Caption = 'Blanket Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST("Blanket Order"));
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            begin
                TestField("Quantity Shipped", 0);
                BlanketOrderLookup;
            end;

            trigger OnValidate()
            begin
                TestField("Quantity Shipped", 0);
                if "Blanket Order No." = '' then
                    "Blanket Order Line No." := 0
                else
                    Validate("Blanket Order Line No.");
            end;
        }
        field(98; "Blanket Order Line No."; Integer)
        {
            Caption = 'Blanket Order Line No.';
            TableRelation = "Sales Line"."Line No." WHERE("Document Type" = CONST("Blanket Order"),
                                                           "Document No." = FIELD("Blanket Order No."));
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            begin
                BlanketOrderLookup;
            end;

            trigger OnValidate()
            begin
                TestField("Quantity Shipped", 0);
                if "Blanket Order Line No." <> 0 then begin
                    SalesLine2.Get("Document Type"::"Blanket Order", "Blanket Order No.", "Blanket Order Line No.");
                    SalesLine2.TestField(Type, Type);
                    SalesLine2.TestField("No.", "No.");
                    SalesLine2.TestField("Bill-to Customer No.", "Bill-to Customer No.");
                    SalesLine2.TestField("Sell-to Customer No.", "Sell-to Customer No.");
                end;
            end;
        }
        field(99; "VAT Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
            Editable = false;
        }
        field(100; "Unit Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            Editable = false;
        }
        field(101; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(103; "Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionClass = GetCaptionClass(FieldNo("Line Amount"));
            Caption = 'Line Amount';

            trigger OnValidate()
            begin
                TestField(Type);
                TestField(Quantity);
                TestField("Unit Price");
                GetSalesHeader;
                "Line Amount" := Round("Line Amount", Currency."Amount Rounding Precision");
                Validate(
                  "Line Discount Amount", Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") - "Line Amount");
            end;
        }
        field(104; "VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            Editable = false;
        }
        field(105; "Inv. Disc. Amount to Invoice"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Inv. Disc. Amount to Invoice';
            Editable = false;
        }
        field(106; "VAT Identifier"; Code[10])
        {
            Caption = 'VAT Identifier';
            Editable = false;
        }
        field(107; "IC Partner Ref. Type"; Option)
        {
            Caption = 'IC Partner Ref. Type';
            OptionCaption = ' ,G/L Account,Item,,,Charge (Item),Cross Reference,Common Item No.';
            OptionMembers = " ","G/L Account",Item,,,"Charge (Item)","Cross Reference","Common Item No.";

            trigger OnValidate()
            begin
                if "IC Partner Code" <> '' then
                    "IC Partner Ref. Type" := "IC Partner Ref. Type"::"G/L Account";
                if "IC Partner Ref. Type" <> xRec."IC Partner Ref. Type" then
                    "IC Partner Reference" := '';
                if "IC Partner Ref. Type" = "IC Partner Ref. Type"::"Common Item No." then begin
                    if Item."No." <> "No." then
                        Item.Get("No.");
                    "IC Partner Reference" := Item."Common Item No.";
                end;
            end;
        }
        field(108; "IC Partner Reference"; Code[20])
        {
            Caption = 'IC Partner Reference';

            trigger OnLookup()
            var
                ICGLAccount: Record "IC G/L Account";
                ItemCrossReference: Record "Item Cross Reference";
            begin
                if "No." <> '' then
                    case "IC Partner Ref. Type" of
                        "IC Partner Ref. Type"::"G/L Account":
                            begin
                                if ICGLAccount.Get("IC Partner Reference") then;
                                if PAGE.RunModal(PAGE::"IC G/L Account List", ICGLAccount) = ACTION::LookupOK then
                                    Validate("IC Partner Reference", ICGLAccount."No.");
                            end;
                        "IC Partner Ref. Type"::Item:
                            begin
                                if Item.Get("IC Partner Reference") then;
                                if PAGE.RunModal(PAGE::"Item List", Item) = ACTION::LookupOK then
                                    Validate("IC Partner Reference", Item."No.");
                            end;
                        "IC Partner Ref. Type"::"Cross Reference":
                            begin
                                ItemCrossReference.Reset;
                                ItemCrossReference.SetCurrentKey("Cross-Reference Type", "Cross-Reference Type No.");
                                ItemCrossReference.SetFilter(
                                  "Cross-Reference Type", '%1|%2',
                                  ItemCrossReference."Cross-Reference Type"::Customer,
                                  ItemCrossReference."Cross-Reference Type"::" ");
                                ItemCrossReference.SetFilter("Cross-Reference Type No.", '%1|%2', "Sell-to Customer No.", '');
                                //TBD
                                /*
                                if PAGE.RunModal(PAGE::"Cross Reference List", ItemCrossReference) = ACTION::LookupOK then
                                    Validate("IC Partner Reference", ItemCrossReference."Cross-Reference No.");
                                */
                            end;
                    end;
            end;
        }
        field(109; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            var
                GenPostingSetup: Record "General Posting Setup";
                GLAcc: Record "G/L Account";
            begin
                if ("Prepayment %" <> 0) and (Type <> Type::" ") then begin
                    TestField("Document Type", "Document Type"::Order);
                    TestField("No.");
                    if CurrFieldNo = FieldNo("Prepayment %") then
                        if "System-Created Entry" then
                            FieldError("Prepmt. Line Amount", StrSubstNo(Text045, 0));
                    if "System-Created Entry" then
                        "Prepayment %" := 0;
                    GenPostingSetup.Get("Gen. Bus. Posting Group", "Gen. Prod. Posting Group");
                    if GenPostingSetup."Sales Prepayments Account" <> '' then begin
                        GLAcc.Get(GenPostingSetup."Sales Prepayments Account");
                        VATPostingSetup.Get("VAT Bus. Posting Group", GLAcc."VAT Prod. Posting Group");
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
                            FieldError("Prepmt. VAT Calc. Type", StrSubstNo(Text041, "Prepmt. VAT Calc. Type"));
                    end;
                    "Prepayment Tax Group Code" := GLAcc."Tax Group Code";
                end;

                TestStatusOpen;

                if Type <> Type::" " then
                    UpdateAmounts;
            end;
        }
        field(110; "Prepmt. Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionClass = GetCaptionClass(FieldNo("Prepmt. Line Amount"));
            Caption = 'Prepmt. Line Amount';
            MinValue = 0;

            trigger OnValidate()
            begin
                TestStatusOpen;
                PrePaymentLineAmountEntered := true;
                TestField("Line Amount");
                if "Prepmt. Line Amount" < "Prepmt. Amt. Inv." then
                    FieldError("Prepmt. Line Amount", StrSubstNo(Text044, "Prepmt. Amt. Inv."));
                if "Prepmt. Line Amount" > "Line Amount" then
                    FieldError("Prepmt. Line Amount", StrSubstNo(Text045, "Line Amount"));
                if "System-Created Entry" then
                    FieldError("Prepmt. Line Amount", StrSubstNo(Text045, 0));
                if Quantity <> 0 then
                    Validate("Prepayment %", Round("Prepmt. Line Amount" /
                        ("Line Amount" * (Quantity - "Quantity Invoiced") / Quantity) * 100, 0.00001))
                else
                    Validate("Prepayment %", Round("Prepmt. Line Amount" * 100 / "Line Amount", 0.00001));
            end;
        }
        field(111; "Prepmt. Amt. Inv."; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionClass = GetCaptionClass(FieldNo("Prepmt. Amt. Inv."));
            Caption = 'Prepmt. Amt. Inv.';
            Editable = false;
        }
        field(112; "Prepmt. Amt. Incl. VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepmt. Amt. Incl. VAT';
            Editable = false;
        }
        field(113; "Prepayment Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepayment Amount';
            Editable = false;
        }
        field(114; "Prepmt. VAT Base Amt."; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepmt. VAT Base Amt.';
            Editable = false;
        }
        field(115; "Prepayment VAT %"; Decimal)
        {
            Caption = 'Prepayment VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(116; "Prepmt. VAT Calc. Type"; Option)
        {
            Caption = 'Prepmt. VAT Calc. Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(117; "Prepayment VAT Identifier"; Code[10])
        {
            Caption = 'Prepayment VAT Identifier';
            Editable = false;
        }
        field(118; "Prepayment Tax Area Code"; Code[20])
        {
            Caption = 'Prepayment Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(119; "Prepayment Tax Liable"; Boolean)
        {
            Caption = 'Prepayment Tax Liable';

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(120; "Prepayment Tax Group Code"; Code[10])
        {
            Caption = 'Prepayment Tax Group Code';
            TableRelation = "Tax Group";

            trigger OnValidate()
            begin
                TestStatusOpen;
                UpdateAmounts;
            end;
        }
        field(121; "Prepmt Amt to Deduct"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionClass = GetCaptionClass(FieldNo("Prepmt Amt to Deduct"));
            Caption = 'Prepmt Amt to Deduct';
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Prepmt Amt to Deduct" > "Prepmt. Amt. Inv." - "Prepmt Amt Deducted" then
                    FieldError(
                      "Prepmt Amt to Deduct",
                      StrSubstNo(Text045, "Prepmt. Amt. Inv." - "Prepmt Amt Deducted"));

                if "Prepmt Amt to Deduct" > "Qty. to Invoice" * "Unit Price" then
                    FieldError(
                      "Prepmt Amt to Deduct",
                      StrSubstNo(Text045, "Qty. to Invoice" * "Unit Price"));

                if ("Prepmt. Amt. Inv." - "Prepmt Amt to Deduct" - "Prepmt Amt Deducted") >
                   (Quantity - "Qty. to Invoice" - "Quantity Invoiced") * "Unit Price"
                then
                    FieldError(
                      "Prepmt Amt to Deduct",
                      StrSubstNo(Text044,
                        "Prepmt. Amt. Inv." - "Prepmt Amt Deducted" - (Quantity - "Qty. to Invoice" - "Quantity Invoiced") * "Unit Price"));
            end;
        }
        field(122; "Prepmt Amt Deducted"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionClass = GetCaptionClass(FieldNo("Prepmt Amt Deducted"));
            Caption = 'Prepmt Amt Deducted';
            Editable = false;
        }
        field(123; "Prepayment Line"; Boolean)
        {
            Caption = 'Prepayment Line';
            Editable = false;
        }
        field(124; "Prepmt. Amount Inv. Incl. VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepmt. Amount Inv. Incl. VAT';
            Editable = false;
        }
        field(129; "Prepmt. Amount Inv. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Amount Inv. (LCY)';
            Editable = false;
        }
        field(130; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";

            trigger OnValidate()
            begin
                if "IC Partner Code" <> '' then begin
                    TestField(Type, Type::"G/L Account");
                    GetSalesHeader;
                    SalesHeader.TestField("Sell-to IC Partner Code", '');
                    SalesHeader.TestField("Bill-to IC Partner Code", '');
                    Validate("IC Partner Ref. Type", "IC Partner Ref. Type"::"G/L Account");
                end;
            end;
        }
        field(132; "Prepmt. VAT Amount Inv. (LCY)"; Decimal)
        {
            Caption = 'Prepmt. VAT Amount Inv. (LCY)';
            Editable = false;
        }
        field(135; "Prepayment VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepayment VAT Difference';
            Editable = false;
        }
        field(136; "Prepmt VAT Diff. to Deduct"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepmt VAT Diff. to Deduct';
            Editable = false;
        }
        field(137; "Prepmt VAT Diff. Deducted"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Prepmt VAT Diff. Deducted';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(900; "Qty. to Assemble to Order"; Decimal)
        {
            Caption = 'Qty. to Assemble to Order';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                SalesLineReserve: Codeunit "Sales Line-Reserve";
            begin
                //WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);

                "Qty. to Asm. to Order (Base)" := CalcBaseQty("Qty. to Assemble to Order");

                if "Qty. to Asm. to Order (Base)" <> 0 then begin
                    TestField("Drop Shipment", false);
                    TestField("Special Order", false);
                    if "Qty. to Asm. to Order (Base)" < 0 then
                        FieldError("Qty. to Assemble to Order", StrSubstNo(Text009, FieldCaption("Quantity (Base)"), "Quantity (Base)"));
                    TestField("Appl.-to Item Entry", 0);
                    /*
                      CASE "Document Type" OF
                        "Document Type"::"Blanket Order",
                        "Document Type"::Quote:
                          IF ("Quantity (Base)" = 0) OR ("Qty. to Asm. to Order (Base)" <= 0) OR SalesLineReserve.ReservEntryExist(Rec) THEN
                            TESTFIELD("Qty. to Asm. to Order (Base)",0)
                          ELSE
                            IF "Quantity (Base)" <> "Qty. to Asm. to Order (Base)" THEN
                              FIELDERROR("Qty. to Assemble to Order",STRSUBSTNO(Text031,0,"Quantity (Base)"));
                        "Document Type"::Order:
                          ;
                        ELSE
                          TESTFIELD("Qty. to Asm. to Order (Base)",0);
                      END;
                     */
                end;

                CheckItemAvailable(FieldNo("Qty. to Assemble to Order"));
                GetDefaultBin;
                AutoAsmToOrder;

            end;
        }
        field(901; "Qty. to Asm. to Order (Base)"; Decimal)
        {
            Caption = 'Qty. to Asm. to Order (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Qty. to Assemble to Order", "Qty. to Asm. to Order (Base)");
            end;
        }
        field(902; "ATO Whse. Outstanding Qty."; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding" WHERE("Source Type" = CONST(37),
                                                                                  "Source Subtype" = FIELD("Document Type"),
                                                                                  "Source No." = FIELD("Document No."),
                                                                                  "Source Line No." = FIELD("Line No."),
                                                                                  "Assemble to Order" = FILTER(true)));
            Caption = 'ATO Whse. Outstanding Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(903; "ATO Whse. Outstd. Qty. (Base)"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE("Source Type" = CONST(37),
                                                                                         "Source Subtype" = FIELD("Document Type"),
                                                                                         "Source No." = FIELD("Document No."),
                                                                                         "Source Line No." = FIELD("Line No."),
                                                                                         "Assemble to Order" = FILTER(true)));
            Caption = 'ATO Whse. Outstd. Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            Editable = false;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(1002; "Job Contract Entry No."; Integer)
        {
            Caption = 'Job Contract Entry No.';
            Editable = false;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.SetCurrentKey("Job Contract Entry No.");
                JobPlanningLine.SetRange("Job Contract Entry No.", "Job Contract Entry No.");
                JobPlanningLine.FindFirst;
                CreateDim(
                  DimMgt.TypeToTableID3(Type), "No.",
                  DATABASE::Job, JobPlanningLine."Job No.",
                  DATABASE::"Responsibility Center", "Responsibility Center");
            end;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                if "Variant Code" <> '' then
                    TestField(Type, Type::Item);
                TestStatusOpen;
                CheckAssocPurchOrder(FieldCaption("Variant Code"));

                if xRec."Variant Code" <> "Variant Code" then begin
                    TestField("Qty. Shipped Not Invoiced", 0);
                    TestField("Shipment No.", '');

                    TestField("Return Qty. Rcd. Not Invd.", 0);
                    TestField("Return Receipt No.", '');
                    InitItemAppl(false);
                end;

                CheckItemAvailable(FieldNo("Variant Code"));

                if Type = Type::Item then begin
                    GetUnitCost;
                    UpdateUnitPrice(FieldNo("Variant Code"));
                end;

                GetDefaultBin;
                InitQtyToAsm;
                AutoAsmToOrder;
                /*
                IF (xRec."Variant Code" <> "Variant Code") AND (Quantity <> 0) THEN BEGIN
                  IF NOT FullReservedQtyIsForAsmToOrder THEN
                    ReserveSalesLine.VerifyChange(Rec,xRec);
                  WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                END;
                 */
                GetItemCrossRef(FieldNo("Variant Code"));

            end;
        }
        field(5403; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Document Type" = FILTER(Order | Invoice),
                                Quantity = FILTER(>= 0),
                                "Qty. to Asm. to Order (Base)" = CONST(0)) "Bin Content"."Bin Code" WHERE("Location Code" = FIELD("Location Code"),
                                                                                                         "Item No." = FIELD("No."),
                                                                                                         "Variant Code" = FIELD("Variant Code"))
            ELSE
            IF ("Document Type" = FILTER("Return Order" | "Credit Memo"),
                                                                                                                  Quantity = FILTER(< 0)) "Bin Content"."Bin Code" WHERE("Location Code" = FIELD("Location Code"),
                                                                                                                                                                       "Item No." = FIELD("No."),
                                                                                                                                                                       "Variant Code" = FIELD("Variant Code"))
            ELSE
            Bin.Code WHERE("Location Code" = FIELD("Location Code"));

            trigger OnLookup()
            var
                WMSManagement: Codeunit "WMS Management";
                BinCode: Code[20];
            begin
                if not IsInbound and ("Quantity (Base)" <> 0) then
                    BinCode := WMSManagement.BinContentLookUp("Location Code", "No.", "Variant Code", '', "Bin Code")
                else
                    BinCode := WMSManagement.BinLookUp("Location Code", "No.", "Variant Code", '');

                if BinCode <> '' then
                    Validate("Bin Code", BinCode);
            end;

            trigger OnValidate()
            var
                WMSManagement: Codeunit "WMS Management";
            begin
                if "Bin Code" <> '' then begin
                    if not IsInbound and ("Quantity (Base)" <> 0) and ("Qty. to Asm. to Order (Base)" = 0) then
                        WMSManagement.FindBinContent("Location Code", "Bin Code", "No.", "Variant Code", '')
                    else
                        WMSManagement.FindBin("Location Code", "Bin Code", '');
                end;

                if "Drop Shipment" then
                    CheckAssocPurchOrder(FieldCaption("Bin Code"));

                TestField(Type, Type::Item);
                TestField("Location Code");

                if (Type = Type::Item) and ("Bin Code" <> '') then begin
                    TestField("Drop Shipment", false);
                    GetLocation("Location Code");
                    Location.TestField("Bin Mandatory");
                    CheckWarehouse;
                end;
                //ATOLink.UpdateAsmBinCodeFromSalesLine(Rec);
            end;
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5405; Planned; Boolean)
        {
            Caption = 'Planned';
            Editable = false;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            IF (Type = CONST(Resource)) "Resource Unit of Measure".Code WHERE("Resource No." = FIELD("No."))
            ELSE
            "Unit of Measure";

            trigger OnValidate()
            var
                UnitOfMeasureTranslation: Record "Unit of Measure Translation";
                ResUnitofMeasure: Record "Resource Unit of Measure";
            begin
                TestJobPlanningLine;
                TestStatusOpen;
                TestField("Quantity Shipped", 0);
                TestField("Qty. Shipped (Base)", 0);
                if "Unit of Measure Code" <> xRec."Unit of Measure Code" then begin
                    TestField("Shipment No.", '');
                    TestField("Return Receipt No.", '');
                end;

                CheckAssocPurchOrder(FieldCaption("Unit of Measure Code"));

                if "Unit of Measure Code" = '' then
                    "Unit of Measure" := ''
                else begin
                    if not UnitOfMeasure.Get("Unit of Measure Code") then
                        UnitOfMeasure.Init;
                    "Unit of Measure" := UnitOfMeasure.Description;
                    GetSalesHeader;
                    if SalesHeader."Language Code" <> '' then begin
                        UnitOfMeasureTranslation.SetRange(Code, "Unit of Measure Code");
                        UnitOfMeasureTranslation.SetRange("Language Code", SalesHeader."Language Code");
                        if UnitOfMeasureTranslation.FindFirst then
                            "Unit of Measure" := UnitOfMeasureTranslation.Description;
                    end;
                end;
                GetItemCrossRef(FieldNo("Unit of Measure Code"));
                case Type of
                    Type::Item:
                        begin
                            GetItem;

                            GetUnitCost;
                            UpdateUnitPrice(FieldNo("Unit of Measure Code"));
                            "Gross Weight" := Item."Gross Weight" * "Qty. per Unit of Measure";
                            "Net Weight" := Item."Net Weight" * "Qty. per Unit of Measure";
                            "Unit Volume" := Item."Unit Volume" * "Qty. per Unit of Measure";
                            "Units per Parcel" := Round(Item."Units per Parcel" / "Qty. per Unit of Measure", 0.00001);
                            if (xRec."Unit of Measure Code" <> "Unit of Measure Code") and (Quantity <> 0) then
                                //        WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
                                if "Qty. per Unit of Measure" > xRec."Qty. per Unit of Measure" then
                                    InitItemAppl(false);
                        end;
                    Type::Resource:
                        begin
                            if "Unit of Measure Code" = '' then begin
                                GetResource;
                                "Unit of Measure Code" := Resource."Base Unit of Measure";
                            end;
                            ResUnitofMeasure.Get("No.", "Unit of Measure Code");
                            "Qty. per Unit of Measure" := ResUnitofMeasure."Qty. per Unit of Measure";
                            UpdateUnitPrice(FieldNo("Unit of Measure Code"));
                            FindResUnitCost;
                        end;
                    Type::"G/L Account", Type::"Fixed Asset", Type::"Charge (Item)", Type::" ":
                        "Qty. per Unit of Measure" := 1;
                end;
                Validate(Quantity);
                if Type = Type::Item then
                    CheckItemAvailable(FieldNo("Unit of Measure Code"));
                // PS38000.Begin
                //"Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure";//LKS-Raj Commented (Field Missing)
                // PS38000.End
            end;
        }
        field(5415; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestJobPlanningLine;
                TestField("Qty. per Unit of Measure", 1);
                Validate(Quantity, "Quantity (Base)");
                UpdateUnitPrice(FieldNo("Quantity (Base)"));
            end;
        }
        field(5416; "Outstanding Qty. (Base)"; Decimal)
        {
            Caption = 'Outstanding Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5417; "Qty. to Invoice (Base)"; Decimal)
        {
            Caption = 'Qty. to Invoice (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Qty. to Invoice", "Qty. to Invoice (Base)");
            end;
        }
        field(5418; "Qty. to Ship (Base)"; Decimal)
        {
            Caption = 'Qty. to Ship (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Qty. to Ship", "Qty. to Ship (Base)");
            end;
        }
        field(5458; "Qty. Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'Qty. Shipped Not Invd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5460; "Qty. Shipped (Base)"; Decimal)
        {
            Caption = 'Qty. Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5461; "Qty. Invoiced (Base)"; Decimal)
        {
            Caption = 'Qty. Invoiced (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5495; "Reserved Qty. (Base)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Quantity (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                            "Source Ref. No." = FIELD("Line No."),
                                                                            "Source Type" = CONST(37),
                                                                            "Source Subtype" = FIELD("Document Type"),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure");
                CalcFields("Reserved Quantity");
                Planned := "Reserved Quantity" = "Outstanding Quantity";
            end;
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                GetFAPostingGroup;
            end;
        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {
            Caption = 'Depr. until FA Posting Date';
        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {
            Caption = 'Duplicate in Depreciation Book';
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                "Use Duplication List" := false;
            end;
        }
        field(5613; "Use Duplication List"; Boolean)
        {
            Caption = 'Use Duplication List';

            trigger OnValidate()
            begin
                "Duplicate in Depreciation Book" := '';
            end;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            Editable = false;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                CreateDim(
                  DATABASE::"Responsibility Center", "Responsibility Center",
                  DimMgt.TypeToTableID3(Type), "No.",
                  DATABASE::Job, "Job No.");
            end;
        }
        field(5701; "Out-of-Stock Substitution"; Boolean)
        {
            Caption = 'Out-of-Stock Substitution';
            Editable = false;
        }
        field(5702; "Substitution Available"; Boolean)
        {
            CalcFormula = Exist("Item Substitution" WHERE(Type = CONST(Item),
                                                           "No." = FIELD("No."),
                                                           "Substitute Type" = CONST(Item)));
            Caption = 'Substitution Available';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5703; "Originally Ordered No."; Code[20])
        {
            Caption = 'Originally Ordered No.';
            TableRelation = IF (Type = CONST(Item)) Item;
        }
        field(5704; "Originally Ordered Var. Code"; Code[10])
        {
            Caption = 'Originally Ordered Var. Code';
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("Originally Ordered No."));
        }
        field(5705; "Cross-Reference No."; Code[20])
        {
            Caption = 'Cross-Reference No.';

            trigger OnLookup()
            begin
                CrossReferenceNoLookUp;
            end;

            trigger OnValidate()
            var
                ReturnedCrossRef: Record "Item Cross Reference";
            begin
                GetSalesHeader;
                "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
                ReturnedCrossRef.Init;
                if "Cross-Reference No." <> '' then begin
                    //  DistIntegration.ICRLookupSalesItem(Rec,ReturnedCrossRef);
                    if "No." <> ReturnedCrossRef."Item No." then
                        Validate("No.", ReturnedCrossRef."Item No.");
                    if ReturnedCrossRef."Variant Code" <> '' then
                        Validate("Variant Code", ReturnedCrossRef."Variant Code");

                    if ReturnedCrossRef."Unit of Measure" <> '' then
                        Validate("Unit of Measure Code", ReturnedCrossRef."Unit of Measure");
                end;

                "Unit of Measure (Cross Ref.)" := ReturnedCrossRef."Unit of Measure";
                "Cross-Reference Type" := ReturnedCrossRef."Cross-Reference Type";
                "Cross-Reference Type No." := ReturnedCrossRef."Cross-Reference Type No.";
                "Cross-Reference No." := ReturnedCrossRef."Cross-Reference No.";

                if ReturnedCrossRef.Description <> '' then
                    Description := ReturnedCrossRef.Description;

                UpdateUnitPrice(FieldNo("Cross-Reference No."));

                if SalesHeader."Send IC Document" and (SalesHeader."IC Direction" = SalesHeader."IC Direction"::Outgoing) then begin
                    "IC Partner Ref. Type" := "IC Partner Ref. Type"::"Cross Reference";
                    "IC Partner Reference" := "Cross-Reference No.";
                end;
            end;
        }
        field(5706; "Unit of Measure (Cross Ref.)"; Code[10])
        {
            Caption = 'Unit of Measure (Cross Ref.)';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(5707; "Cross-Reference Type"; Option)
        {
            Caption = 'Cross-Reference Type';
            OptionCaption = ' ,Customer,Vendor,Bar Code';
            OptionMembers = " ",Customer,Vendor,"Bar Code";
        }
        field(5708; "Cross-Reference Type No."; Code[30])
        {
            Caption = 'Cross-Reference Type No.';
        }
        field(5709; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(5710; Nonstock; Boolean)
        {
            Caption = 'Nonstock';
            Editable = false;
        }
        field(5711; "Purchasing Code"; Code[10])
        {
            Caption = 'Purchasing Code';
            TableRelation = Purchasing;

            trigger OnValidate()
            begin
                TestStatusOpen;
                TestField(Type, Type::Item);
                CheckAssocPurchOrder(FieldCaption(Type));

                if PurchasingCode.Get("Purchasing Code") then begin
                    "Drop Shipment" := PurchasingCode."Drop Shipment";
                    "Special Order" := PurchasingCode."Special Order";
                    if "Drop Shipment" or "Special Order" then begin
                        TestField("Qty. to Asm. to Order (Base)", 0);
                        Reserve := Reserve::Never;
                        Validate(Quantity, Quantity);
                        if "Drop Shipment" then begin
                            Evaluate("Outbound Whse. Handling Time", '<0D>');
                            Evaluate("Shipping Time", '<0D>');
                            UpdateDates;
                            "Bin Code" := '';
                        end;
                    end;
                end else begin
                    "Drop Shipment" := false;
                    "Special Order" := false;

                    GetItem;
                    if Item.Reserve = Item.Reserve::Optional then begin
                        GetSalesHeader;
                        Reserve := SalesHeader.Reserve;
                    end else
                        Reserve := Item.Reserve;
                end;

                if ("Purchasing Code" <> xRec."Purchasing Code") and
                   (not "Drop Shipment") and
                   ("Drop Shipment" <> xRec."Drop Shipment")
                then begin
                    if "Location Code" = '' then begin
                        if InvtSetup.Get then
                            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                    end else
                        if Location.Get("Location Code") then
                            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                    if ShippingAgentServices.Get("Shipping Agent Code", "Shipping Agent Service Code") then
                        "Shipping Time" := ShippingAgentServices."Shipping Time"
                    else begin
                        GetSalesHeader;
                        "Shipping Time" := SalesHeader."Shipping Time";
                    end;
                    UpdateDates;
                end;
            end;
        }
        field(5712; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            TableRelation = "Product Group".Code WHERE("Item Category Code" = FIELD("Item Category Code"));
        }
        field(5713; "Special Order"; Boolean)
        {
            Caption = 'Special Order';
            Editable = false;
        }
        field(5714; "Special Order Purchase No."; Code[20])
        {
            Caption = 'Special Order Purchase No.';
            TableRelation = IF ("Special Order" = CONST(true)) "Purchase Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(5715; "Special Order Purch. Line No."; Integer)
        {
            Caption = 'Special Order Purch. Line No.';
            TableRelation = IF ("Special Order" = CONST(true)) "Purchase Line"."Line No." WHERE("Document Type" = CONST(Order),
                                                                                               "Document No." = FIELD("Special Order Purchase No."));
        }
        field(5749; "Whse. Outstanding Qty."; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding" WHERE("Source Type" = CONST(37),
                                                                                  "Source Subtype" = FIELD("Document Type"),
                                                                                  "Source No." = FIELD("Document No."),
                                                                                  "Source Line No." = FIELD("Line No.")));
            Caption = 'Whse. Outstanding Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5750; "Whse. Outstanding Qty. (Base)"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE("Source Type" = CONST(37),
                                                                                         "Source Subtype" = FIELD("Document Type"),
                                                                                         "Source No." = FIELD("Document No."),
                                                                                         "Source Line No." = FIELD("Line No.")));
            Caption = 'Whse. Outstanding Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752; "Completely Shipped"; Boolean)
        {
            Caption = 'Completely Shipped';
            Editable = false;
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if ("Requested Delivery Date" <> xRec."Requested Delivery Date") and
                   ("Promised Delivery Date" <> 0D)
                then
                    Error(
                      Text028,
                      FieldCaption("Requested Delivery Date"),
                      FieldCaption("Promised Delivery Date"));

                if "Requested Delivery Date" <> 0D then
                    Validate("Planned Delivery Date", "Requested Delivery Date")
                else begin
                    GetSalesHeader;
                    Validate("Shipment Date", SalesHeader."Shipment Date");
                end;
            end;
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Promised Delivery Date" <> 0D then
                    Validate("Planned Delivery Date", "Promised Delivery Date")
                else
                    Validate("Requested Delivery Date");
            end;
        }
        field(5792; "Shipping Time"; DateFormula)
        {
            Caption = 'Shipping Time';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Drop Shipment" then
                    DateFormularZero("Shipping Time", FieldNo("Shipping Time"), FieldCaption("Shipping Time"));
                UpdateDates;
            end;
        }
        field(5793; "Outbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Drop Shipment" then
                    DateFormularZero("Outbound Whse. Handling Time",
                      FieldNo("Outbound Whse. Handling Time"), FieldCaption("Outbound Whse. Handling Time"));
                UpdateDates;
            end;
        }
        field(5794; "Planned Delivery Date"; Date)
        {
            Caption = 'Planned Delivery Date';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Planned Delivery Date" <> 0D then begin
                    PlannedDeliveryDateCalculated := true;

                    if Format("Shipping Time") <> '' then
                        Validate("Planned Shipment Date", CalcPlannedDeliveryDate(FieldNo("Planned Delivery Date")))
                    else
                        Validate("Planned Shipment Date", CalcPlannedShptDate(FieldNo("Planned Delivery Date")));

                    if "Planned Shipment Date" > "Planned Delivery Date" then
                        "Planned Delivery Date" := "Planned Shipment Date";
                end;
            end;
        }
        field(5795; "Planned Shipment Date"; Date)
        {
            Caption = 'Planned Shipment Date';

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Planned Shipment Date" <> 0D then begin
                    PlannedShipmentDateCalculated := true;
                    //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
                    // if Format("Outbound Whse. Handling Time") <> '' then
                    //     Validate(
                    //       "Shipment Date",
                    //       CalendarMgmt.CalcDateBOC2(
                    //         Format("Outbound Whse. Handling Time"),
                    //         "Planned Shipment Date",
                    //         CalChange."Source Type"::"Shipping Agent",
                    //         "Shipping Agent Code",
                    //         "Shipping Agent Service Code",
                    //         CalChange."Source Type"::Location,
                    //         "Location Code",
                    //         '',
                    //         false))
                    // else
                    //     Validate(
                    //       "Shipment Date",
                    //       CalendarMgmt.CalcDateBOC(
                    //         Format(Format('')),
                    //         "Planned Shipment Date",
                    //         CalChange."Source Type"::"Shipping Agent",
                    //         "Shipping Agent Code",
                    //         "Shipping Agent Service Code",
                    //         CalChange."Source Type"::Location,
                    //         "Location Code",
                    //         '',
                    //         false));
                    //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
                end;
            end;
        }
        field(5796; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Shipping Agent Code" <> xRec."Shipping Agent Code" then
                    Validate("Shipping Agent Service Code", '');
            end;
        }
        field(5797; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Shipping Agent Service Code" <> xRec."Shipping Agent Service Code" then
                    Evaluate("Shipping Time", '<>');

                if "Drop Shipment" then begin
                    Evaluate("Shipping Time", '<0D>');
                    UpdateDates;
                end else begin
                    if ShippingAgentServices.Get("Shipping Agent Code", "Shipping Agent Service Code") then
                        "Shipping Time" := ShippingAgentServices."Shipping Time"
                    else begin
                        GetSalesHeader;
                        "Shipping Time" := SalesHeader."Shipping Time";
                    end;
                end;

                if ShippingAgentServices."Shipping Time" <> xRec."Shipping Time" then
                    Validate("Shipping Time", "Shipping Time");
            end;
        }
        field(5800; "Allow Item Charge Assignment"; Boolean)
        {
            Caption = 'Allow Item Charge Assignment';
            InitValue = true;

            trigger OnValidate()
            begin
                CheckItemChargeAssgnt;
            end;
        }
        field(5801; "Qty. to Assign"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. to Assign" WHERE("Document Type" = FIELD("Document Type"),
                                                                                       "Document No." = FIELD("Document No."),
                                                                                       "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. to Assign';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5802; "Qty. Assigned"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. Assigned" WHERE("Document Type" = FIELD("Document Type"),
                                                                                      "Document No." = FIELD("Document No."),
                                                                                      "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. Assigned';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5803; "Return Qty. to Receive"; Decimal)
        {
            Caption = 'Return Qty. to Receive';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
                if (CurrFieldNo <> 0) and
                   (Type = Type::Item) and
                   ("Return Qty. to Receive" <> 0) and
                   (not "Drop Shipment")
                then
                    CheckWarehouse;

                if "Return Qty. to Receive" = Quantity - "Return Qty. Received" then
                    InitQtyToReceive
                else begin
                    "Return Qty. to Receive (Base)" := CalcBaseQty("Return Qty. to Receive");
                    InitQtyToInvoice;
                end;
                if ("Return Qty. to Receive" * Quantity < 0) or
                   (Abs("Return Qty. to Receive") > Abs("Outstanding Quantity")) or
                   (Quantity * "Outstanding Quantity" < 0)
                then
                    Error(
                      Text020,
                      "Outstanding Quantity");
                if ("Return Qty. to Receive (Base)" * "Quantity (Base)" < 0) or
                   (Abs("Return Qty. to Receive (Base)") > Abs("Outstanding Qty. (Base)")) or
                   ("Quantity (Base)" * "Outstanding Qty. (Base)" < 0)
                then
                    Error(
                      Text021,
                      "Outstanding Qty. (Base)");

                if (CurrFieldNo <> 0) and (Type = Type::Item) and ("Return Qty. to Receive" > 0) then
                    CheckApplFromItemLedgEntry(ItemLedgEntry);
            end;
        }
        field(5804; "Return Qty. to Receive (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Receive (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Return Qty. to Receive", "Return Qty. to Receive (Base)");
            end;
        }
        field(5805; "Return Qty. Rcd. Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Rcd. Not Invd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5806; "Ret. Qty. Rcd. Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5807; "Return Rcd. Not Invd."; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd.';
            Editable = false;

            trigger OnValidate()
            var
                Currency2: Record Currency;
            begin
                GetSalesHeader;
                Currency2.InitRoundingPrecision;
                if SalesHeader."Currency Code" <> '' then
                    "Return Rcd. Not Invd. (LCY)" :=
                      Round(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          GetDate, "Currency Code",
                          "Return Rcd. Not Invd.", SalesHeader."Currency Factor"),
                        Currency2."Amount Rounding Precision")
                else
                    "Return Rcd. Not Invd. (LCY)" :=
                      Round("Return Rcd. Not Invd.", Currency2."Amount Rounding Precision");
            end;
        }
        field(5808; "Return Rcd. Not Invd. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd. (LCY)';
            Editable = false;
        }
        field(5809; "Return Qty. Received"; Decimal)
        {
            Caption = 'Return Qty. Received';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5810; "Return Qty. Received (Base)"; Decimal)
        {
            Caption = 'Return Qty. Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5811; "Appl.-from Item Entry"; Integer)
        {
            Caption = 'Appl.-from Item Entry';
            MinValue = 0;

            trigger OnLookup()
            begin
                SelectItemEntry(FieldNo("Appl.-from Item Entry"));
            end;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
                if "Appl.-from Item Entry" <> 0 then begin
                    CheckApplFromItemLedgEntry(ItemLedgEntry);
                    Validate("Unit Cost (LCY)", CalcUnitCost(ItemLedgEntry));
                end;
            end;
        }
        field(5909; "BOM Item No."; Code[20])
        {
            Caption = 'BOM Item No.';
            TableRelation = Item;
        }
        field(6600; "Return Receipt No."; Code[20])
        {
            Caption = 'Return Receipt No.';
            Editable = false;
        }
        field(6601; "Return Receipt Line No."; Integer)
        {
            Caption = 'Return Receipt Line No.';
            Editable = false;
        }
        field(6608; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";

            trigger OnValidate()
            begin
                if "Return Reason Code" = '' then
                    UpdateUnitPrice(FieldNo("Return Reason Code"));

                if ReturnReason.Get("Return Reason Code") then begin
                    if ReturnReason."Default Location Code" <> '' then
                        Validate("Location Code", ReturnReason."Default Location Code");
                    if ReturnReason."Inventory Value Zero" then begin
                        Validate("Unit Cost (LCY)", 0);
                        Validate("Unit Price", 0);
                    end else
                        if "Unit Price" = 0 then
                            UpdateUnitPrice(FieldNo("Return Reason Code"));
                end;
            end;
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
            InitValue = true;
        }
        field(7002; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";

            trigger OnValidate()
            begin
                if Type = Type::Item then
                    UpdateUnitPrice(FieldNo("Customer Disc. Group"))
            end;
        }
        field(13701; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DecimalPlaces = 0 : 4;
            Editable = false;
        }
        field(13702; "Excise Bus. Posting Group"; Code[10])
        {
            Caption = 'Excise Bus. Posting Group';
            //TableRelation = "Excise Bus. Posting Group";//LKS-Raj Commented (Table Missing)
        }
        field(13703; "Excise Prod. Posting Group"; Code[10])
        {
            Caption = 'Excise Prod. Posting Group';
            //TableRelation = "Excise Prod. Posting Group";//LKS-Raj Commented (Table Missing)
        }
        field(13708; "Excise Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Excise Amount';
            Editable = false;
        }
        field(13711; "Amount Including Excise"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Including Excise';
        }
        field(13712; "Excise Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Excise Base Amount';
        }
        field(13715; "Excise Accounting Type"; Option)
        {
            Caption = 'Excise Accounting Type';
            OptionCaption = 'With CENVAT,Without CENVAT';
            OptionMembers = "With CENVAT","Without CENVAT";
        }
        field(13719; "Excise Base Quantity"; Decimal)
        {
            Caption = 'Excise Base Quantity';
        }
        field(13721; "Tax %"; Decimal)
        {
            Caption = 'Tax %';
            DecimalPlaces = 0 : 2;
            Editable = false;

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(13722; "Amount Including Tax"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Including Tax';
            Editable = false;

            trigger OnValidate()
            begin
                TestField(Type);
                TestField(Quantity);
                TestField("Unit Price");

                GetSalesHeader;
                // "Amount Including Tax" := ROUND("Amount Including Tax",Currency."Amount Rounding Precision");
                if "Amount Added to Tax Base" <> 0 then begin
                    "Tax Liable" := SalesHeader."Tax Liable";
                    "Tax Base Amount" := "Amount Added to Tax Base";
                end else begin
                    "Tax Liable" := false;
                    "Tax Base Amount" := Round("Line Amount" - "Inv. Discount Amount",
                        Currency."Amount Rounding Precision");
                    Amount := Round("Line Amount" - "Inv. Discount Amount", Currency."Amount Rounding Precision");
                    if "TCS Nature of Collection" = '' then
                        "Amount To Customer" := Round("Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Charges To Customer" -
                            "Bal. TDS/TCS Including SHECESS" + "Service Tax Amount" + "Service Tax eCess Amount" +
                            "Service Tax SHE Cess Amount", Currency."Amount Rounding Precision")
                    else
                        "Amount To Customer" :=
                          Round("Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Charges To Customer" -
                            "Bal. TDS/TCS Including SHECESS" + "Service Tax Amount" + "Service Tax eCess Amount" +
                            "Service Tax SHE Cess Amount", Currency."Amount Rounding Precision");
                end;

                // VSTF252133.begin
                // IF "Tax Base Amount" <> 0 THEN
                // "Tax %" := ROUND(100 * ("Amount Including Tax" - "Tax Base Amount") / "Tax Base Amount",Currency."Amount Rounding Precision")
                // ELSE
                // "Tax %" := 0;
                if "Tax Base Amount" = 0 then
                    "Tax %" := 0;
                // VSTF252133.end
                InitOutstandingAmount;
            end;
        }
        field(13724; "Amount Added to Excise Base"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Added to Excise Base';
        }
        field(13725; "Amount Added to Tax Base"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Added to Tax Base';
        }
        field(13727; "Tax Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Tax Base Amount';
            Editable = false;
        }
        field(13734; "Surcharge %"; Decimal)
        {
            Caption = 'Surcharge %';
            Editable = false;
        }
        field(13735; "Surcharge Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Surcharge Amount';
            Editable = false;
        }
        field(13736; "Concessional Code"; Code[10])
        {
            Caption = 'Concessional Code';
            //TableRelation = "Concessional Codes";//LKS-Raj Commented (Table Missing)
        }
        field(13742; "Assessee Code"; Code[10])
        {
            Caption = 'Assessee Code';
            Editable = false;
            TableRelation = "Assessee Code";
        }
        field(13743; "TDS/TCS %"; Decimal)
        {
            Caption = 'TDS/TCS %';
            Editable = false;
        }
        field(13746; "Bal. TDS/TCS Including SHECESS"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. TDS/TCS Including SHECESS';
            Editable = false;
        }
        field(13749; "Claim Deferred Excise"; Boolean)
        {
            Caption = 'Claim Deferred Excise';
        }
        field(13750; "Capital Item"; Boolean)
        {
            Caption = 'Capital Item';
            Editable = false;
        }
        field(13755; "BED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'BED Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."BED Amount" <> "BED Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13758; "AED(GSI) Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'AED(GSI) Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."AED(GSI) Amount" <> "AED(GSI) Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13759; "SED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'SED Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."SED Amount" <> "SED Amount" then begin // PS35496
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13769; "SAED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'SAED Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."SAED Amount" <> "SAED Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13770; "CESS Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'CESS Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."CESS Amount" <> "CESS Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13771; "NCCD Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'NCCD Amount';
            Editable = true;

            trigger OnValidate()
            begin
                if xRec."NCCD Amount" <> "NCCD Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13772; "eCess Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'eCess Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."eCess Amount" <> "eCess Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(13796; "Form Code"; Code[10])
        {
            Caption = 'Form Code';

            //LKS-Raj Commented (Table Missing)
            // trigger OnLookup()
            // var
            //     StateForm: Record "State Forms";
            // begin
            //     StateForm.SetRange(State, State);
            //     StateForm.SetRange("Transit Document", false);
            //     if StateForm.FindFirst then
            //         if PAGE.RunModal(PAGE::"State Forms", StateForm) = ACTION::LookupOK then
            //             "Form Code" := StateForm."Form Code";
            //     Validate("Form Code");
            // end;
            //LKS-Raj Commented (Table Missing)

            trigger OnValidate()
            begin
                UpdateAmounts;
            end;
        }
        field(13797; "Form No."; Code[10])
        {
            Caption = 'Form No.';
        }
        field(13798; State; Code[10])
        {
            Caption = 'State';
            TableRelation = State;
        }
        field(13799; "TDS/TCS Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'TDS/TCS Amount';
            Editable = false;
        }
        field(16340; "Amount To Customer"; Decimal)
        {
            Caption = 'Amount To Customer';
            Editable = false;

            trigger OnValidate()
            begin
                TestField(Type);
                TestField(Quantity);
                TestField("Unit Price");
                "Amount To Customer" := Round("Amount To Customer", Currency."Amount Rounding Precision");
                Amount := Round("Line Amount" - "Inv. Discount Amount", Currency."Amount Rounding Precision");
                InitOutstandingAmount;
            end;
        }
        field(16342; "Charges To Customer"; Decimal)
        {
            Caption = 'Charges To Customer';
            Editable = false;
        }
        field(16343; "TDS/TCS Base Amount"; Decimal)
        {
            Caption = 'TDS/TCS Base Amount';
            Editable = false;
        }
        field(16363; "Surcharge Base Amount"; Decimal)
        {
            Caption = 'Surcharge Base Amount';
            Editable = false;
        }
        field(16367; "Temp TDS/TCS Base"; Decimal)
        {
            Caption = 'Temp TDS/TCS Base';
        }
        field(16377; "Service Tax Group"; Code[20])
        {
            Caption = 'Service Tax Group';
            //TableRelation = "Service Tax Groups".Code;//LKS-Raj Commented (Table Missing)

            trigger OnValidate()
            begin
                //GetCompanyInformation;//LKS-Raj Commented (Table Missing)
                //"Service Tax Registration No." := CompanyInfo."Service Tax Registration No.";//LKS-Raj Commented (Table Missing)
                UpdateTaxAmounts;
            end;
        }
        field(16379; "Service Tax Base"; Decimal)
        {
            Caption = 'Service Tax Base';
        }
        field(16380; "Service Tax Amount"; Decimal)
        {
            Caption = 'Service Tax Amount';
        }
        field(16381; "Service Tax Registration No."; Code[20])
        {
            Caption = 'Service Tax Registration No.';
            //TableRelation = "Service Tax Registration Nos.".Code;//LKS-Raj Commented (Table Missing)

            trigger OnValidate()
            begin
                TestField("Service Tax Group");
            end;
        }
        field(16383; "eCESS % on TDS/TCS"; Decimal)
        {
            Caption = 'eCESS % on TDS/TCS';
            Editable = false;
        }
        field(16384; "eCESS on TDS/TCS Amount"; Decimal)
        {
            Caption = 'eCESS on TDS/TCS Amount';
            Editable = false;
        }
        field(16385; "Total TDS/TCS Incl. SHE CESS"; Decimal)
        {
            Caption = 'Total TDS/TCS Incl. SHE CESS';
            Editable = false;
        }
        field(16386; "Per Contract"; Boolean)
        {
            Caption = 'Per Contract';
        }
        field(16391; "Service Tax eCess Amount"; Decimal)
        {
            Caption = 'Service Tax eCess Amount';
        }
        field(16452; "ADET Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'ADET Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."ADET Amount" <> "ADET Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16455; "AED(TTA) Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'AED(TTA) Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."AED(TTA) Amount" <> "AED(TTA) Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16456; "Free Supply"; Boolean)
        {
            Caption = 'Free Supply';
        }
        field(16459; "ADE Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'ADE Amount';
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."ADE Amount" <> "ADE Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16490; "Assessable Value"; Decimal)
        {
            Caption = 'Assessable Value';
        }
        field(16491; "VAT Type"; Option)
        {
            Caption = 'VAT Type';
            OptionCaption = ' ,Item,Capital Goods';
            OptionMembers = " ",Item,"Capital Goods";
        }
        field(16494; "SHE Cess Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'SHE Cess Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."ADET Amount" <> "SHE Cess Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16496; "Service Tax SHE Cess Amount"; Decimal)
        {
            Caption = 'Service Tax SHE Cess Amount';
        }
        field(16500; "Direct Debit To PLA / RG"; Boolean)
        {
            Caption = 'Direct Debit To PLA / RG';

            trigger OnValidate()
            begin
                CheckECCNo;
                if xRec."Direct Debit To PLA / RG" and (not "Direct Debit To PLA / RG") and
                   ("Document Type" in ["Document Type"::Order, "Document Type"::Invoice])
                then begin
                    GenJnlLine.Reset;
                    GenJnlLine.SetFilter("Journal Template Name", '%1', '');
                    GenJnlLine.SetFilter("Journal Batch Name", '%1', '');
                    GenJnlLine.SetRange("Document No.", "Document No.");
                    GenJnlLine.DeleteAll(true);
                end;
            end;
        }
        field(16502; "TCS Nature of Collection"; Code[10])
        {
            Caption = 'TCS Nature of Collection';
            TableRelation = "TCS Nature Of Collection";

            trigger OnLookup()
            var
                NatureOfCollection: Record "TCS Nature Of Collection";
                TempNatureOfCollection: Record "TCS Nature Of Collection" temporary;
            begin
                //LKS-Raj Commented (Table Missing)
                // NOCLine.Reset;
                // NOCLine.SetRange(Type, NODLines.Type::Customer);
                // NOCLine.SetRange("No.", "Sell-to Customer No.");
                // if NOCLine.Find('-') then
                //     repeat
                //         NatureOfCollection.Get(NOCLine."NOD/NOC");
                //         TempNatureOfCollection := NatureOfCollection;
                //         TempNatureOfCollection.Insert;
                //     until NOCLine.Next = 0;
                //LKS-Raj Commented (Table Missing)
                //LKS-Raj Commented (Page Missing)
                //if PAGE.RunModal(PAGE::"TCS Nature of Collections", TempNatureOfCollection) = ACTION::LookupOK then
                //"TCS Nature of Collection" := TempNatureOfCollection.Code;
                //LKS-Raj Commented (Page Missing)
                Validate("TCS Nature of Collection");
            end;

            trigger OnValidate()
            begin
                //LKS-Raj Commented (Field Missing)
                // if TCSNOC.Get("TCS Nature of Collection") then
                //     "TCS Type" := TCSNOC."TCS Type"
                // else
                //     "TCS Type" := "TCS Type"::" ";
                //LKS-Raj Commented (Field Missing)
                //InitTCS(Rec);
            end;
        }
        field(16503; "TCS Type"; Option)
        {
            Caption = 'TCS Type';
            OptionCaption = ' ,A,B,C,D,E,F,G,H,I';
            OptionMembers = " ",A,B,C,D,E,F,G,H,I;
        }
        field(16504; "Standard Deduction %"; Decimal)
        {
            Caption = 'Standard Deduction %';
            Editable = false;
        }
        field(16505; "Standard Deduction Amount"; Decimal)
        {
            Caption = 'Standard Deduction Amount';
            Editable = false;
        }
        field(16519; Supplementary; Boolean)
        {
            Caption = 'Supplementary';

            trigger OnValidate()
            begin
                if not Supplementary then
                    "Source Document No." := '';
            end;
        }
        field(16520; "Source Document Type"; Option)
        {
            Caption = 'Source Document Type';
            OptionCaption = 'Posted Invoice,Posted Credit Memo';
            OptionMembers = "Posted Invoice","Posted Credit Memo";

            trigger OnValidate()
            begin
                if "Source Document Type" <> xRec."Source Document Type" then
                    "Source Document No." := '';
            end;
        }
        field(16521; "Source Document No."; Code[20])
        {
            Caption = 'Source Document No.';
            TableRelation = IF ("Source Document Type" = FILTER("Posted Invoice")) "Sales Invoice Header"."No."
            ELSE
            IF ("Source Document Type" = FILTER("Posted Credit Memo")) "Sales Cr.Memo Header"."No.";

            trigger OnValidate()
            begin
                TestField(Supplementary);
            end;
        }
        field(16524; "ADC VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'ADC VAT Amount';
            Editable = true;
            MinValue = 0;

            trigger OnValidate()
            begin
                if xRec."ADC VAT Amount" <> "ADC VAT Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16525; "CIF Amount"; Decimal)
        {
            Caption = 'CIF Amount';

            trigger OnValidate()
            begin
                // PS37358.begin
                // IF xRec."CIF Amount" <> "CIF Amount" THEN BEGIN
                // TESTFIELD(MRP,FALSE);
                // TESTFIELD("Price Inclusive of Tax",FALSE);
                // UpdateStruOrdLineDetails;
                // UpdateGenJnlLine;
                // END;
                // PS37358.end
            end;
        }
        field(16526; "BCD Amount"; Decimal)
        {
            Caption = 'BCD Amount';

            trigger OnValidate()
            begin
                // PS37358.begin
                // IF xRec."BCD Amount" <> "BCD Amount" THEN BEGIN
                // TESTFIELD(MRP,FALSE);
                // TESTFIELD("Price Inclusive of Tax",FALSE);
                // UpdateStruOrdLineDetails;
                // UpdateGenJnlLine;
                // END;
                // PS37358.end
            end;
        }
        field(16527; CVD; Boolean)
        {
            Caption = 'CVD';
        }
        field(16528; "Process Carried Out"; Code[10])
        {
            Caption = 'Process Carried Out';
            //TableRelation = "Process Carried Out".Code;//LKS-Raj Commented (Table Missing)
        }
        field(16529; "Identification Mark"; Text[30])
        {
            Caption = 'Identification Mark';
        }
        field(16530; "Re-Dispatch"; Boolean)
        {
            Caption = 'Re-Dispatch';
            Editable = false;
        }
        field(16531; "Return Rcpt Line No."; Integer)
        {
            Caption = 'Return Rcpt Line No.';
            Editable = false;
        }
        field(16532; "Qty. to be Re-Dispatched"; Decimal)
        {
            Caption = 'Qty. to be Re-Dispatched';
        }
        field(16533; "Return Re-Dispatch Rcpt. No."; Code[20])
        {
            Caption = 'Return Re-Dispatch Rcpt. No.';
        }
        field(16534; "SHE Cess % on TDS/TCS"; Decimal)
        {
            Caption = 'SHE Cess % on TDS/TCS';
            Editable = false;
        }
        field(16535; "SHE Cess on TDS/TCS Amount"; Decimal)
        {
            Caption = 'SHE Cess on TDS/TCS Amount';
            Editable = false;
        }
        field(16537; "MRP Price"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'MRP Price';
            MinValue = 0;

            trigger OnValidate()
            begin
                TestStatusOpen;
            end;
        }
        field(16538; MRP; Boolean)
        {
            Caption = 'MRP';
            Editable = false;

            trigger OnValidate()
            begin
                TestStatusOpen;
            end;
        }
        field(16539; "Abatement %"; Decimal)
        {
            Caption = 'Abatement %';
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestStatusOpen;
            end;
        }
        field(16540; "PIT Structure"; Code[10])
        {
            Caption = 'PIT Structure';
            //TableRelation = "Structure Header";//LKS-Raj Commented (Table Missing)

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Line No." <> 0 then begin
                    GetSalesHeader;
                    //  InsertStrOrdDetail(SalesHeader,Rec);
                end;
            end;
        }
        field(16541; "Price Inclusive of Tax"; Boolean)
        {
            Caption = 'Price Inclusive of Tax';
            //LKS-Raj Commented (Table Missing)
            // trigger OnValidate()
            // var
            //     StrOrderDetails: Record "Structure Order Details";
            //     StrOrderLines: Record "Structure Order Line Details";
            //     SaleLineDetailBuffer: Record "Sale Line Detail Buffer";
            // begin
            //     TestStatusOpen;
            //     GetSalesHeader;
            //     TestField(Type, Type::Item);
            //     if "Price Inclusive of Tax" then begin
            //         Validate("Line Discount %");
            //         SalesHeader.TestField("Free Supply", false);
            //     end;
            //     if not "Price Inclusive of Tax" then begin
            //         "PIT Structure" := '';
            //         StrOrderDetails.Reset;
            //         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
            //         StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
            //         StrOrderDetails.SetRange("Document Type", "Document Type");
            //         StrOrderDetails.SetRange("Document No.", "Document No.");
            //         StrOrderDetails.SetRange("Document Line No.", "Line No.");
            //         StrOrderDetails.SetRange("Price Inclusive of Tax", true);
            //         StrOrderDetails.DeleteAll;

            //         StrOrderLines.Reset;
            //         StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
            //         StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
            //         StrOrderLines.SetRange("Document Type", "Document Type");
            //         StrOrderLines.SetRange("Document No.", "Document No.");
            //         StrOrderLines.SetRange("Line No.", "Line No.");
            //         StrOrderLines.SetRange("Price Inclusive of Tax", true);
            //         StrOrderLines.DeleteAll;

            //         SaleLineDetailBuffer.Reset;
            //         SaleLineDetailBuffer.SetRange(Type, StrOrderLines.Type::Sale);
            //         SaleLineDetailBuffer.SetRange("Document Type", "Document Type");
            //         SaleLineDetailBuffer.SetRange("Document No.", "Document No.");
            //         SaleLineDetailBuffer.SetRange("Line No.", "Line No.");
            //         SaleLineDetailBuffer.DeleteAll;

            //         InitExciseAmount;
            //         "Amount Added to Excise Base" := 0;
            //         "Excise Base Amount" := 0;
            //         "Amount Added to Tax Base" := 0;
            //         "Tax Base Amount" := 0;
            //         "Charges To Customer" := 0;
            //         "Unit Price" := 0;
            //         "Line Amount" := 0;
            //         "Unit Price Incl. of Tax" := 0;
            //         "Outstanding Amount" := 0;
            //         "Outstanding Amount (LCY)" := 0;
            //         "Amount To Customer UPIT" := 0;
            //         Validate("Line Discount %");
            //         Validate(Quantity);
            //         UpdateTaxAmounts;
            //     end;
            // end;
            //LKS-Raj Commented (Table Missing)
        }
        field(16542; "Unit Price Incl. of Tax"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Unit Price Incl. of Tax';
            MinValue = 0;

            trigger OnValidate()
            begin
                TestStatusOpen;
                if "Price Inclusive of Tax" then
                    Validate("Line Discount %");
            end;
        }
        field(16543; "Excise Base Variable"; Decimal)
        {
            Caption = 'Excise Base Variable';
            Editable = false;
        }
        field(16544; "Tax Base Variable"; Decimal)
        {
            Caption = 'Tax Base Variable';
            Editable = false;
        }
        field(16545; "Amount To Customer UPIT"; Decimal)
        {
            Caption = 'Amount To Customer UPIT';
            Editable = false;
        }
        field(16546; "UPIT Rounding Inserted"; Boolean)
        {
            Caption = 'UPIT Rounding Inserted';
        }
        field(16547; "Total UPIT Amount"; Decimal)
        {
            Caption = 'Total UPIT Amount';
        }
        field(16548; "Inv Discount Fixed"; Decimal)
        {
            Caption = 'Inv Discount Fixed';
        }
        field(16549; "Inv Discount Variable"; Decimal)
        {
            Caption = 'Inv Discount Variable';
        }
        field(16550; "Custom eCess Amount"; Decimal)
        {
            Caption = 'Custom eCess Amount';

            trigger OnValidate()
            begin
                if xRec."Custom eCess Amount" <> "Custom eCess Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16551; "Custom SHECess Amount"; Decimal)
        {
            Caption = 'Custom SHECess Amount';

            trigger OnValidate()
            begin
                if xRec."Custom SHECess Amount" <> "Custom SHECess Amount" then begin
                    TestField(MRP, false);
                    TestField("Price Inclusive of Tax", false);
                    //UpdateStruOrdLineDetails;//LKS-Raj Commented
                    //UpdateGenJnlLine;//LKS-Raj Commented
                end;
            end;
        }
        field(16552; "Excise Effective Rate"; Decimal)
        {
            Caption = 'Excise Effective Rate';
        }
        field(16553; "Item Charge Entry"; Boolean)
        {
            Caption = 'Item Charge Entry';
        }
        field(16554; "Tot. Serv Tax Amount (Intm)"; Decimal)
        {
            Caption = 'Tot. Serv Tax Amount (Intm)';
        }
        field(16555; "S. Tax Base Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax Base Amount (Intm)';
        }
        field(16556; "S. Tax Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax Amount (Intm)';
            Editable = false;
        }
        field(16557; "S. Tax eCess Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax eCess Amount (Intm)';
            Editable = false;
        }
        field(16558; "S. Tax SHE Cess Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax SHE Cess Amount (Intm)';
            Editable = false;
        }
        field(16559; "Amt. Incl. Service Tax (Intm)"; Decimal)
        {
            Caption = 'Amt. Incl. Service Tax (Intm)';
            Editable = false;
        }
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
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount Including VAT", "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)", "Amount To Customer";
        }
        key(Key2; "Document No.", "Line No.", "Document Type")
        {
        }
        key(Key3; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date")
        {
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key4; "Document Type", "Bill-to Customer No.", "Currency Code")
        {
            SumIndexFields = "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)", "Return Rcd. Not Invd. (LCY)";
        }
        key(Key5; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Location Code", "Shipment Date")
        {
            Enabled = false;
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key6; "Document Type", "Bill-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Currency Code")
        {
            Enabled = false;
            SumIndexFields = "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)";
        }
        key(Key7; "Document Type", "Blanket Order No.", "Blanket Order Line No.")
        {
        }
        key(Key8; "Document Type", "Document No.", "Location Code")
        {
        }
        key(Key9; "Document Type", "Shipment No.", "Shipment Line No.")
        {
        }
        key(Key10; Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Shipment Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Document Type", "Sell-to Customer No.", "Shipment No.")
        {
            SumIndexFields = "Outstanding Amount (LCY)";
        }
        key(Key12; "Job Contract Entry No.")
        {
        }
        key(Key13; "Document Type", "Document No.", "Qty. Shipped Not Invoiced")
        {
        }
        key(Key14; "Document Type", "Document No.", "Direct Debit To PLA / RG", "Excise Prod. Posting Group", Type, "No.")
        {
            SumIndexFields = "BED Amount", "AED(GSI) Amount", "SED Amount", "SAED Amount", "CESS Amount", "NCCD Amount", "eCess Amount", "ADET Amount", "AED(TTA) Amount", "ADE Amount", "ADC VAT Amount", "SHE Cess Amount";
        }
        key(Key15; "Document Type", "Document No.", Type, "No.")
        {
            SumIndexFields = "Qty. to Invoice";
        }
        key(Key16; "Document Type", "Document No.", Type, "Price Inclusive of Tax")
        {
            SumIndexFields = "Amount To Customer UPIT", "Amount To Customer";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        CapableToPromise: Codeunit "Capable to Promise";
        JobCreateInvoice: Codeunit "Job Create-Invoice";
        SalesCommentLine: Record "Sales Comment Line";
    //SalesLineDetailBuffer: Record "Sale Line Detail Buffer";//LKS-Raj Commented (Table Missing)
    //DetailTaxEntryBuffer: Record "Detailed Tax Entry Buffer";//LKS-Raj Commented (Table Missing)
    begin
        TestStatusOpen;
        if not StatusCheckSuspended and (SalesHeader.Status = SalesHeader.Status::Released) and
           (Type in [Type::"G/L Account", Type::"Charge (Item)", Type::Resource])
        then
            Validate(Quantity, 0);

        if (Quantity <> 0) and ItemExists("No.") then begin
            // ReserveSalesLine.DeleteLine(Rec);
            CalcFields("Reserved Qty. (Base)");
            TestField("Reserved Qty. (Base)", 0);
            if "Shipment No." = '' then
                TestField("Qty. Shipped Not Invoiced", 0);
            if "Return Receipt No." = '' then
                TestField("Return Qty. Rcd. Not Invd.", 0);
            //  WhseValidateSourceLine.SalesLineDelete(Rec);
        end;

        if ("Document Type" = "Document Type"::Order) and (Quantity <> "Quantity Invoiced") then
            TestField("Prepmt. Amt. Inv.", 0);

        CheckAssocPurchOrder('');
        //NonstockItemMgt.DelNonStockSales(Rec);

        if "Document Type" = "Document Type"::"Blanket Order" then begin
            SalesLine2.Reset;
            SalesLine2.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
            SalesLine2.SetRange("Blanket Order No.", "Document No.");
            SalesLine2.SetRange("Blanket Order Line No.", "Line No.");
            if SalesLine2.FindFirst then
                SalesLine2.TestField("Blanket Order Line No.", 0);
        end;

        if Type = Type::Item then begin
            //  ATOLink.DeleteAsmFromSalesLine(Rec);
            DeleteItemChargeAssgnt("Document Type", "Document No.", "Line No.");
        end;

        if Type = Type::"Charge (Item)" then
            DeleteChargeChargeAssgnt("Document Type", "Document No.", "Line No.");

        CapableToPromise.RemoveReqLines("Document No.", "Line No.", 0, false);

        if "Line No." <> 0 then begin
            SalesLine2.Reset;
            SalesLine2.SetRange("Document Type", "Document Type");
            SalesLine2.SetRange("Document No.", "Document No.");
            SalesLine2.SetRange("Attached to Line No.", "Line No.");
            SalesLine2.SetFilter("Line No.", '<>%1', "Line No.");
            SalesLine2.DeleteAll(true);
        end;

        GetSalesHeader;
        //LKS-Raj Commented (Table Missing)
        // SalesLineDetailBuffer.Reset;
        // SalesLineDetailBuffer.SetRange("Document Type", "Document Type");
        // SalesLineDetailBuffer.SetRange("Document No.", "Document No.");
        // SalesLineDetailBuffer.SetRange("Document Line No.", "Line No.");
        // SalesLineDetailBuffer.DeleteAll;

        // StrOrderDetails.Reset;
        // StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
        // StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
        // StrOrderDetails.SetRange("Document Type", "Document Type");
        // StrOrderDetails.SetRange("Document No.", "Document No.");
        // StrOrderDetails.SetRange("Document Line No.", "Line No.");
        // StrOrderDetails.SetRange("Price Inclusive of Tax", true);
        // StrOrderDetails.DeleteAll;

        // StrOrderLine.SetRange(Type, StrOrderLine.Type::Sale);
        // StrOrderLine.SetRange("Document Type", "Document Type");
        // StrOrderLine.SetRange("Document No.", "Document No.");
        // StrOrderLine.SetRange("Line No.", "Line No.");
        // StrOrderLine.DeleteAll;
        //LKS-Raj Commented (Table Missing)

        if "Job Contract Entry No." <> 0 then
            //  JobCreateInvoice.DeleteSalesLine(Rec);

            SalesCommentLine.SetRange("Document Type", "Document Type");
        SalesCommentLine.SetRange("No.", "Document No.");
        SalesCommentLine.SetRange("Document Line No.", "Line No.");
        if not SalesCommentLine.IsEmpty then
            SalesCommentLine.DeleteAll;

        if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice] then begin
            GenJnlLine.Reset;
            GenJnlLine.SetFilter("Journal Template Name", '%1', '');
            GenJnlLine.SetFilter("Journal Batch Name", '%1', '');
            GenJnlLine.SetRange("Document No.", "Document No.");
            GenJnlLine.DeleteAll(true);
        end;

        // PS36451.begin
        // LKS-Raj Commented (Table Missing)
        // DetailTaxEntryBuffer.Reset;
        // DetailTaxEntryBuffer.SetRange("Document Type", "Document Type");
        // DetailTaxEntryBuffer.SetRange("Document No.", "Document No.");
        // DetailTaxEntryBuffer.SetRange("Line No.", "Line No.");
        // //DetailTaxEntryBuffer.SETRANGE("Transcation Type",DetailTaxEntryBuffer."Transcation Type"::Sale);
        // DetailTaxEntryBuffer.DeleteAll;
        // LKS-Raj Commented (Table Missing)
        // PS36451.end
    end;

    trigger OnInsert()
    begin
        TestStatusOpen;
        GetSalesHeader;
        //LKS-Raj Commented (Table Missing)
        // if SalesHeader."Free Supply" then
        //     TestField("Price Inclusive of Tax", false);
        // if "Price Inclusive of Tax" then begin
        //     SalesHeader.TestField("VAT Exempted", false);
        //     SalesHeader.TestField("Export or Deemed Export", false);
        // end;
        //LKS-Raj Commented (Table Missing)
        if Quantity <> 0 then
            //  ReserveSalesLine.VerifyQuantity(Rec,xRec);
            LockTable;
        SalesHeader."No." := '';
        if Type = Type::Item then
            if SalesHeader.InventoryPickConflict("Document Type", "Document No.", SalesHeader."Shipping Advice") then
                Error(Text056, SalesHeader."Shipping Advice");
    end;

    trigger OnModify()
    begin
        GetSalesHeader;
        //LKS-Raj Commented (Table Missing)
        // if SalesHeader."Free Supply" then
        //     TestField("Price Inclusive of Tax", false);
        // if "Price Inclusive of Tax" then begin
        //     SalesHeader.TestField("VAT Exempted", false);
        //     SalesHeader.TestField("Export or Deemed Export", false);
        // end;
        //LKS-Raj Commented (Table Missing)
        if ("Document Type" = "Document Type"::"Blanket Order") and
           ((Type <> xRec.Type) or ("No." <> xRec."No."))
        then begin
            SalesLine2.Reset;
            SalesLine2.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
            SalesLine2.SetRange("Blanket Order No.", "Document No.");
            SalesLine2.SetRange("Blanket Order Line No.", "Line No.");
            if SalesLine2.FindSet then
                repeat
                    SalesLine2.TestField(Type, Type);
                    SalesLine2.TestField("No.", "No.");
                until SalesLine2.Next = 0;
        end;

        if ((Quantity <> 0) or (xRec.Quantity <> 0)) and ItemExists(xRec."No.") and not FullReservedQtyIsForAsmToOrder then;
        //  ReserveSalesLine.VerifyChange(Rec,xRec);
    end;

    trigger OnRename()
    begin
        Error(Text001, TableCaption);
    end;

    var
        Text000: Label 'You cannot delete the order line because it is associated with purchase order %1 line %2.';
        Text001: Label 'You cannot rename a %1.';
        Text002: Label 'You cannot change %1 because the order line is associated with purchase order %2 line %3.';
        Text003: Label 'must not be less than %1';
        Text005: Label 'You cannot invoice more than %1 units.';
        Text006: Label 'You cannot invoice more than %1 base units.';
        Text007: Label 'You cannot ship more than %1 units.';
        Text008: Label 'You cannot ship more than %1 base units.';
        Text009: Label ' must be 0 when %1 is %2';
        Text011: Label 'Automatic reservation is not possible.\Do you want to reserve items manually?';
        Text014: Label '%1 %2 is before work date %3';
        Text016: Label '%1 is required for %2 = %3.';
        Text017: Label '\The entered information may be disregarded by warehouse operations.';
        Text020: Label 'You cannot return more than %1 units.';
        Text021: Label 'You cannot return more than %1 base units.';
        Text026: Label 'You cannot change %1 if the item charge has already been posted.';
        CurrExchRate: Record "Currency Exchange Rate";
        SalesHeader: Record "Sales Header";
        SalesLine2: Record "Sales Line";
        TempSalesLine: Record "Sales Line";
        GLAcc: Record "G/L Account";
        Item: Record Item;
        Resource: Record Resource;
        Currency: Record Currency;
        ItemTranslation: Record "Item Translation";
        Res: Record Resource;
        ResCost: Record "Resource Cost";
        WorkType: Record "Work Type";
        VATPostingSetup: Record "VAT Posting Setup";
        StdTxt: Record "Standard Text";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        ReservEntry: Record "Reservation Entry";
        UnitOfMeasure: Record "Unit of Measure";
        FA: Record "Fixed Asset";
        ShippingAgentServices: Record "Shipping Agent Services";
        NonstockItem: Record "Nonstock Item";
        PurchasingCode: Record Purchasing;
        SKU: Record "Stockkeeping Unit";
        ItemCharge: Record "Item Charge";
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        InvtSetup: Record "Inventory Setup";
        Location: Record Location;
        ReturnReason: Record "Return Reason";
        ATOLink: Record "Assemble-to-Order Link";
        Reservation: Page Reservation;
        //PriceCalcMgt: Codeunit "Sales Price Calc. Mgt.";//LKS-Raj Commented (Codeunit Missing)
        ResFindUnitCost: Codeunit "Resource-Find Cost";
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
        ReservMgt: Codeunit "Reservation Management";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        UOMMgt: Codeunit "Unit of Measure Management";
        AddOnIntegrMgt: Codeunit AddOnIntegrManagement;
        DimMgt: Codeunit DimensionManagement;
        ItemSubstitutionMgt: Codeunit "Item Subst.";
        //DistIntegration: Codeunit "Dist. Integration";//LKS-Raj Commented (Codeunit Missing)
        //NonstockItemMgt: Codeunit "Nonstock Item Management";//LKS-Raj Commented (Codeunit Missing)
        WhseValidateSourceLine: Codeunit "Whse. Validate Source Line";
        //TransferExtendedText: Codeunit "Transfer Extended Text";//LKS-Raj Commented (Codeunit Missing)
        JobPostLine: Codeunit "Job Post-Line";
        FullAutoReservation: Boolean;
        StatusCheckSuspended: Boolean;
        HasBeenShown: Boolean;
        PlannedShipmentDateCalculated: Boolean;
        PlannedDeliveryDateCalculated: Boolean;
        Text028: Label 'You cannot change the %1 when the %2 has been filled in.';
        ItemCategory: Record "Item Category";
        Text029: Label 'must be positive';
        Text030: Label 'must be negative';
        Text031: Label 'You must either specify %1 or %2.';
        //CalendarMgmt: Codeunit "Calendar Management";//LKS-Raj Commented (Codeunit Missing)
        CalChange: Record "Customized Calendar Change";
        Text034: Label 'The value of %1 field must be a whole number for the item included in the service item group if the %2 field in the Service Item Groups window contains a check mark.';
        Text035: Label 'Warehouse ';
        Text036: Label 'Inventory ';
        HideValidationDialog: Boolean;
        Text037: Label 'You cannot change %1 when %2 is %3 and %4 is positive.';
        Text038: Label 'You cannot change %1 when %2 is %3 and %4 is negative.';
        Text039: Label '%1 units for %2 %3 have already been returned. Therefore, only %4 units can be returned.';
        Text040: Label 'You must use form %1 to enter %2, if item tracking is used.';
        Text041: Label 'You must cancel the existing approval for this document to be able to change the %1 field.';
        Text042: Label 'When posting the Applied to Ledger Entry %1 will be opened first';
        ShippingMoreUnitsThanReceivedErr: Label 'You cannot ship more than the %1 units that you have received for document no. %2.';
        Text044: Label 'cannot be less than %1';
        Text045: Label 'cannot be more than %1';
        Text046: Label 'You cannot return more than the %1 units that you have shipped for %2 %3.';
        Text047: Label 'must be positive when %1 is not 0.';
        TrackingBlocked: Boolean;
        Text048: Label 'You cannot use item tracking on a %1 created from a %2.';
        Text049: Label 'cannot be %1.';
        Text051: Label 'You cannot use %1 in a %2.';
        PrePaymentLineAmountEntered: Boolean;
        Text052: Label 'You cannot add an item line because an open warehouse shipment exists for the sales header and Shipping Advice is %1.\\You must add items as new lines to the existing warehouse shipment or change Shipping Advice to Partial.';
        Text053: Label 'You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?';
        Text054: Label 'Cancelled.';
        Text055: Label '%1 must not be greater than the sum of %2 and %3.', Comment = 'Quantity Invoiced must not be greater than the sum of Qty. Assigned and Qty. to Assign.';
        Text056: Label 'You cannot add an item line because an open inventory pick exists for the Sales Header and because Shipping Advice is %1.\\You must first post or delete the inventory pick or change Shipping Advice to Partial.';
        Text057: Label 'must have the same sign as the shipment';
        Text058: Label 'The quantity that you are trying to invoice is greater than the quantity in shipment %1.';
        Text059: Label 'must have the same sign as the return receipt';
        Text060: Label 'The quantity that you are trying to invoice is greater than the quantity in return receipt %1.';
        //NODLines: Record "NOD/NOC Lines";//LKS-Raj Commented (Table Missing)
        //StrOrderLine: Record "Structure Order Line Details";//LKS-Raj Commented (Table Missing)
        Text13700: Label 'BED AMOUNT';
        Text13701: Label 'AED AMOUNT';
        Text13702: Label 'SED AMOUNT';
        Text13703: Label 'SAED AMOUNT';
        Text13704: Label 'CESS AMOUNT';
        Text13705: Label 'NCCD AMOUNT';
        Text13706: Label 'ECESS AMOUNT';
        Text13707: Label 'ADET AMOUNT';
        Text13708: Label 'LINE AMOUNT';
        Text13709: Label 'ADE AMOUNT';
        GenJnlLine: Record "Gen. Journal Line";
        CFactor: Decimal;
        Text16351: Label 'To change the Quantity remove the check mark from Direct Debit To PLA.';
        TCSBaseLCY: Decimal;
        //NOCLine: Record "NOD/NOC Lines";//LKS-Raj Commented (Table Missing)
        TCSNOC: Record "TCS Nature Of Collection";
        //TCSBuffer: array[2] of Record "TCS Buffer" temporary;//LKS-Raj Commented (Table Missing)
        TCSSetup: Record "TCS Setup";
        BEDAmt: Decimal;
        "AED(GSI)Amt": Decimal;
        "AED(TTA)Amt": Decimal;
        SEDAmt: Decimal;
        SAEDAmt: Decimal;
        CESSAmt: Decimal;
        NCCDAmt: Decimal;
        eCessAmt: Decimal;
        ADETAmt: Decimal;
        ADEAmt: Decimal;
        Text16500: Label 'Item %1 is short by %2 quantity in RG 23 D. Please adjust the quantity to proceed.';
        SHECessAmt: Decimal;
        Text13710: Label 'SHE CESS AMOUNT';
        CompanyInfo: Record "Company Information";
        CompanyInfoRead: Boolean;
        Text13711: Label 'ASSESSABLE VALUE';
        Text16501: Label 'ADC VAT AMOUNT';
        Text16502: Label 'BCD AMOUNT';
        Text16503: Label 'CIF AMOUNT';
        ADCVATAmt: Decimal;
        Text16504: Label 'One of the Structure detail should have Include PIT Calculation = Yes for Document Type = %1,  Document No. = %2,  Line No. = %3 for Price Inclusive of Tax = Yes.';
        //StrOrderDetails: Record "Structure Order Details";//LKS-Raj Commented (Table Missing)
        Text16507: Label 'CUST. ECESS AMOUNT';
        Text16506: Label 'CUST. SHECESS AMOUNT';
        Text16508: Label 'To view Excise Detail the Structure should include Excise.';
        AssessableValueCalc: Boolean;
        //TempRG23DRemainder: Record "RG 23 D" temporary;//LKS-Raj Commented (Table Missing)
        //TempRG23DConsumedInCurrDoc: Record "RG 23 D" temporary;//LKS-Raj Commented (Table Missing)
        InvtBuffer: array[2] of Record "Inventory Buffer" temporary;
        ExecuteDetailRg23D: Boolean;


    procedure InitOutstanding()
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
            "Outstanding Quantity" := Quantity - "Return Qty. Received";
            "Outstanding Qty. (Base)" := "Quantity (Base)" - "Return Qty. Received (Base)";
            "Return Qty. Rcd. Not Invd." := "Return Qty. Received" - "Quantity Invoiced";
            "Ret. Qty. Rcd. Not Invd.(Base)" := "Return Qty. Received (Base)" - "Qty. Invoiced (Base)";
        end else begin
            "Outstanding Quantity" := Quantity - "Quantity Shipped";
            "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Shipped (Base)";
            "Qty. Shipped Not Invoiced" := "Quantity Shipped" - "Quantity Invoiced";
            "Qty. Shipped Not Invd. (Base)" := "Qty. Shipped (Base)" - "Qty. Invoiced (Base)";
        end;
        CalcFields("Reserved Quantity");
        Planned := "Reserved Quantity" = "Outstanding Quantity";
        "Completely Shipped" := (Quantity <> 0) and ("Outstanding Quantity" = 0);
        InitOutstandingAmount;
    end;


    procedure InitOutstandingAmount()
    var
        AmountInclVAT: Decimal;
    begin
        if Quantity = 0 then begin
            "Outstanding Amount" := 0;
            "Outstanding Amount (LCY)" := 0;
            "Shipped Not Invoiced" := 0;
            "Shipped Not Invoiced (LCY)" := 0;
            "Return Rcd. Not Invd." := 0;
            "Return Rcd. Not Invd. (LCY)" := 0;
        end else begin
            GetSalesHeader;
            if SalesHeader.Status = SalesHeader.Status::Released then
                AmountInclVAT := "Amount Including VAT"
            else
                if SalesHeader."Prices Including VAT" then
                    AmountInclVAT := "Line Amount" - "Inv. Discount Amount"
                else
                    if "VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax" then
                        AmountInclVAT :=
                          "Line Amount" - "Inv. Discount Amount" +
                          Round(
                            SalesTaxCalculate.CalculateTax(
                              "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
                              "Line Amount" - "Inv. Discount Amount", "Quantity (Base)", SalesHeader."Currency Factor"),
                            Currency."Amount Rounding Precision")
                    else
                        AmountInclVAT :=
                          Round(
                            ("Line Amount" - "Inv. Discount Amount") *
                            (1 + "VAT %" / 100 * (1 - SalesHeader."VAT Base Discount %" / 100)),
                            Currency."Amount Rounding Precision");
            Validate(
              "Outstanding Amount",
              Round(
                AmountInclVAT * "Outstanding Quantity" / Quantity,
                Currency."Amount Rounding Precision"));
            if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
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
    end;


    procedure InitQtyToShip()
    begin
        "Qty. to Ship" := "Outstanding Quantity";
        "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";

        CheckServItemCreation;

        InitQtyToInvoice;
    end;


    procedure InitQtyToReceive()
    begin
        "Return Qty. to Receive" := "Outstanding Quantity";
        "Return Qty. to Receive (Base)" := "Outstanding Qty. (Base)";

        InitQtyToInvoice;
    end;


    procedure InitQtyToInvoice()
    begin
        "Qty. to Invoice" := MaxQtyToInvoice;
        "Qty. to Invoice (Base)" := MaxQtyToInvoiceBase;
        "VAT Difference" := 0;
        CalcInvDiscToInvoice;
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Invoice then
            CalcPrepaymentToDeduct;
    end;

    local procedure InitItemAppl(OnlyApplTo: Boolean)
    begin
        "Appl.-to Item Entry" := 0;
        if not OnlyApplTo then
            "Appl.-from Item Entry" := 0;
    end;


    procedure MaxQtyToInvoice(): Decimal
    begin
        if "Prepayment Line" then
            exit(1);
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            exit("Return Qty. Received" + "Return Qty. to Receive" - "Quantity Invoiced");

        exit("Quantity Shipped" + "Qty. to Ship" - "Quantity Invoiced");
    end;


    procedure MaxQtyToInvoiceBase(): Decimal
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            exit("Return Qty. Received (Base)" + "Return Qty. to Receive (Base)" - "Qty. Invoiced (Base)");

        exit("Qty. Shipped (Base)" + "Qty. to Ship (Base)" - "Qty. Invoiced (Base)");
    end;

    local procedure CalcBaseQty(Qty: Decimal): Decimal
    begin
        TestField("Qty. per Unit of Measure");
        exit(Round(Qty * "Qty. per Unit of Measure", 0.00001));
    end;

    local procedure SelectItemEntry(CurrentFieldNo: Integer)
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        SalesLine3: Record "Sales Line";
    begin
        ItemLedgEntry.SetRange("Item No.", "No.");
        if "Location Code" <> '' then
            ItemLedgEntry.SetRange("Location Code", "Location Code");
        ItemLedgEntry.SetRange("Variant Code", "Variant Code");

        if CurrentFieldNo = FieldNo("Appl.-to Item Entry") then begin
            ItemLedgEntry.SetCurrentKey("Item No.", Open);
            ItemLedgEntry.SetRange(Positive, true);
            ItemLedgEntry.SetRange(Open, true);
        end else begin
            ItemLedgEntry.SetCurrentKey("Item No.", Positive);
            ItemLedgEntry.SetRange(Positive, false);
            ItemLedgEntry.SetFilter("Shipped Qty. Not Returned", '<0');
        end;
        if PAGE.RunModal(PAGE::"Item Ledger Entries", ItemLedgEntry) = ACTION::LookupOK then begin
            // SalesLine3 := Rec;
            if CurrentFieldNo = FieldNo("Appl.-to Item Entry") then
                SalesLine3.Validate("Appl.-to Item Entry", ItemLedgEntry."Entry No.")
            else
                SalesLine3.Validate("Appl.-from Item Entry", ItemLedgEntry."Entry No.");
            CheckItemAvailable(CurrentFieldNo);
            //Rec := SalesLine3;
        end;
    end;


    procedure SetSalesHeader(NewSalesHeader: Record "Sales Header")
    begin
        SalesHeader := NewSalesHeader;

        if SalesHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else begin
            SalesHeader.TestField("Currency Factor");
            Currency.Get(SalesHeader."Currency Code");
            Currency.TestField("Amount Rounding Precision");
        end;
    end;

    local procedure GetSalesHeader()
    begin
        TestField("Document No.");
        if ("Document Type" <> SalesHeader."Document Type") or ("Document No." <> SalesHeader."No.") then begin
            SalesHeader.Get("Document Type", "Document No.");
            if SalesHeader."Currency Code" = '' then
                Currency.InitRoundingPrecision
            else begin
                SalesHeader.TestField("Currency Factor");
                Currency.Get(SalesHeader."Currency Code");
                Currency.TestField("Amount Rounding Precision");
            end;
        end;
    end;

    local procedure GetItem()
    begin
        TestField("No.");
        if "No." <> Item."No." then
            Item.Get("No.");
    end;


    procedure GetResource()
    begin
        TestField("No.");
        if "No." <> Resource."No." then
            Resource.Get("No.");
    end;

    local procedure UpdateUnitPrice(CalledByFieldNo: Integer)
    begin
        if (CalledByFieldNo <> CurrFieldNo) and (CurrFieldNo <> 0) then
            exit;

        GetSalesHeader;
        TestField("Qty. per Unit of Measure");

        case Type of
            Type::Item, Type::Resource:
                begin
                    //      PriceCalcMgt.FindSalesLineLineDisc(SalesHeader,Rec);
                    //      PriceCalcMgt.FindSalesLinePrice(SalesHeader,Rec,CalledByFieldNo);
                end;
        end;
        Validate("Unit Price");
    end;

    local procedure FindResUnitCost()
    begin
        ResCost.Init;
        ResCost.Code := "No.";
        ResCost."Work Type Code" := "Work Type Code";
        ResFindUnitCost.Run(ResCost);
        Validate("Unit Cost (LCY)", ResCost."Unit Cost" * "Qty. per Unit of Measure");
    end;


    procedure UpdateAmounts()
    var
        RemLineAmountToInvoice: Decimal;
    begin
        if CurrFieldNo <> FieldNo("Allow Invoice Disc.") then
            TestField(Type);
        GetSalesHeader;

        if "Line Amount" <> xRec."Line Amount" then
            "VAT Difference" := 0;
        if "Line Amount" <> Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") - "Line Discount Amount" then begin
            "Line Amount" := Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") - "Line Discount Amount";
            "VAT Difference" := 0;
        end;
        UpdateTaxAmounts;
        UpdateVATAmounts;
        if not "Prepayment Line" then begin
            if "Prepayment %" <> 0 then begin
                if Quantity < 0 then
                    FieldError(Quantity, StrSubstNo(Text047, FieldCaption("Prepayment %")));
                if "Unit Price" < 0 then
                    FieldError("Unit Price", StrSubstNo(Text047, FieldCaption("Prepayment %")));
            end;
            if SalesHeader."Document Type" <> SalesHeader."Document Type"::Invoice then begin
                "Prepayment VAT Difference" := 0;
                if not PrePaymentLineAmountEntered then
                    "Prepmt. Line Amount" := Round("Line Amount" * "Prepayment %" / 100, Currency."Amount Rounding Precision");
                if "Prepmt. Line Amount" < "Prepmt. Amt. Inv." then
                    FieldError("Prepmt. Line Amount", StrSubstNo(Text049, "Prepmt. Amt. Inv."));
                PrePaymentLineAmountEntered := false;
                if "Prepmt. Line Amount" <> 0 then begin
                    RemLineAmountToInvoice :=
                      Round("Line Amount" * (Quantity - "Quantity Invoiced") / Quantity, Currency."Amount Rounding Precision");
                    if RemLineAmountToInvoice < ("Prepmt. Line Amount" - "Prepmt Amt Deducted") then
                        FieldError("Prepmt. Line Amount", StrSubstNo(Text045, RemLineAmountToInvoice + "Prepmt Amt Deducted"));
                end;
            end;
        end;
        InitOutstandingAmount;
        if (CurrFieldNo <> 0) and
           not ((Type = Type::Item) and (CurrFieldNo = FieldNo("No.")) and (Quantity <> 0) and
                // a write transaction may have been started
                ("Qty. per Unit of Measure" <> xRec."Qty. per Unit of Measure")) and // ...continued condition
           ("Document Type" <= "Document Type"::Invoice) and
           (("Outstanding Amount" + "Shipped Not Invoiced") > 0)
        then
            //  CustCheckCreditLimit.SalesLineCheck(Rec);

            if Type = Type::"Charge (Item)" then
                UpdateItemChargeAssgnt;

        CalcPrepaymentToDeduct;
    end;

    local procedure UpdateVATAmounts()
    var
        SalesLine2: Record "Sales Line";
        TotalLineAmount: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalQuantityBase: Decimal;
    begin
        GetSalesHeader;
        SalesLine2.SetRange("Document Type", "Document Type");
        SalesLine2.SetRange("Document No.", "Document No.");
        SalesLine2.SetFilter("Line No.", '<>%1', "Line No.");
        if "Line Amount" = 0 then
            if xRec."Line Amount" >= 0 then
                SalesLine2.SetFilter(Amount, '>%1', 0)
            else
                SalesLine2.SetFilter(Amount, '<%1', 0)
        else
            if "Line Amount" > 0 then
                SalesLine2.SetFilter(Amount, '>%1', 0)
            else
                SalesLine2.SetFilter(Amount, '<%1', 0);
        SalesLine2.SetRange("VAT Identifier", "VAT Identifier");
        SalesLine2.SetRange("Tax Group Code", "Tax Group Code");

        if "Line Amount" = "Inv. Discount Amount" then begin
            Amount := 0;
            "VAT Base Amount" := 0;
            "Amount Including VAT" := 0;
            if (SalesHeader.Status = SalesHeader.Status::Released) and ("Line No." <> 0) then
                if Modify then
                    if SalesLine2.FindLast then begin
                        SalesLine2.UpdateAmounts;
                        SalesLine2.Modify;
                    end;
        end else begin
            TotalLineAmount := 0;
            TotalInvDiscAmount := 0;
            TotalAmount := 0;
            TotalAmountInclVAT := 0;
            TotalQuantityBase := 0;
            if ("VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax") or
               (("VAT Calculation Type" in
                 ["VAT Calculation Type"::"Normal VAT", "VAT Calculation Type"::"Reverse Charge VAT"]) and ("VAT %" <> 0))
            then begin
                if SalesLine2.FindSet then
                    repeat
                        TotalLineAmount := TotalLineAmount + SalesLine2."Line Amount";
                        TotalInvDiscAmount := TotalInvDiscAmount + SalesLine2."Inv. Discount Amount";
                        TotalAmount := TotalAmount + SalesLine2.Amount;
                        TotalAmountInclVAT := TotalAmountInclVAT + SalesLine2."Amount Including VAT";
                        TotalQuantityBase := TotalQuantityBase + SalesLine2."Quantity (Base)";
                    until SalesLine2.Next = 0;
            end;

            if SalesHeader."Prices Including VAT" then
                case "VAT Calculation Type" of
                    "VAT Calculation Type"::"Normal VAT",
                    "VAT Calculation Type"::"Reverse Charge VAT":
                        begin
                            Amount :=
                              Round(
                                (TotalLineAmount - TotalInvDiscAmount + "Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100),
                                Currency."Amount Rounding Precision") -
                              TotalAmount;
                            "VAT Base Amount" :=
                              Round(
                                Amount * (1 - SalesHeader."VAT Base Discount %" / 100),
                                Currency."Amount Rounding Precision");
                            "Amount Including VAT" :=
                              TotalLineAmount + "Line Amount" +
                              Round(
                                (TotalAmount + Amount) * (SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                                Currency."Amount Rounding Precision", Currency.VATRoundingDirection) -
                              TotalAmountInclVAT - TotalInvDiscAmount;
                        end;
                    "VAT Calculation Type"::"Full VAT":
                        begin
                            Amount := 0;
                            "VAT Base Amount" := 0;
                        end;
                    "VAT Calculation Type"::"Sales Tax":
                        begin
                            SalesHeader.TestField("VAT Base Discount %", 0);
                            Amount :=
                              SalesTaxCalculate.ReverseCalculateTax(
                                "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
                                TotalAmountInclVAT + "Amount Including VAT", TotalQuantityBase + "Quantity (Base)",
                                SalesHeader."Currency Factor") -
                              TotalAmount;
                            if Amount <> 0 then
                                "VAT %" :=
                                  Round(100 * ("Amount Including VAT" - Amount) / Amount, 0.00001)
                            else
                                "VAT %" := 0;
                            Amount := Round(Amount, Currency."Amount Rounding Precision");
                            "VAT Base Amount" := Amount;
                        end;
                end
            else
                case "VAT Calculation Type" of
                    "VAT Calculation Type"::"Normal VAT",
                    "VAT Calculation Type"::"Reverse Charge VAT":
                        begin
                            Amount := Round("Line Amount" - "Inv. Discount Amount", Currency."Amount Rounding Precision");
                            "VAT Base Amount" :=
                              Round(Amount * (1 - SalesHeader."VAT Base Discount %" / 100), Currency."Amount Rounding Precision");
                            "Amount Including VAT" :=
                              TotalAmount + Amount +
                              Round(
                                (TotalAmount + Amount) * (1 - SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                                Currency."Amount Rounding Precision", Currency.VATRoundingDirection) -
                              TotalAmountInclVAT;
                        end;
                    "VAT Calculation Type"::"Full VAT":
                        begin
                            Amount := 0;
                            "VAT Base Amount" := 0;
                            "Amount Including VAT" := "Line Amount" - "Inv. Discount Amount";
                        end;
                    "VAT Calculation Type"::"Sales Tax":
                        begin
                            Amount := Round("Line Amount" - "Inv. Discount Amount", Currency."Amount Rounding Precision");
                            "VAT Base Amount" := Amount;
                            "Amount Including VAT" :=
                              TotalAmount + Amount +
                              Round(
                                SalesTaxCalculate.CalculateTax(
                                  "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
                                  TotalAmount + Amount, TotalQuantityBase + "Quantity (Base)",
                                  SalesHeader."Currency Factor"), Currency."Amount Rounding Precision") -
                              TotalAmountInclVAT;
                            if "VAT Base Amount" <> 0 then
                                "VAT %" :=
                                  Round(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount", 0.00001)
                            else
                                "VAT %" := 0;
                        end;
                end;
        end;
    end;

    local procedure CheckItemAvailable(CalledByFieldNo: Integer)
    begin
        /*
        IF Reserve = Reserve::Always THEN
          EXIT;
        
        IF "Shipment Date" = 0D THEN BEGIN
          GetSalesHeader;
          IF SalesHeader."Shipment Date" <> 0D THEN
            VALIDATE("Shipment Date",SalesHeader."Shipment Date")
          ELSE
            VALIDATE("Shipment Date",WORKDATE);
        END;
        
        IF ((CalledByFieldNo = CurrFieldNo) OR (CalledByFieldNo = FIELDNO("Shipment Date"))) AND GUIALLOWED AND
           ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
           (Type = Type::Item) AND ("No." <> '') AND
           ("Outstanding Quantity" > 0) AND
           ("Job Contract Entry No." = 0) AND
           NOT (Nonstock OR "Special Order")
        THEN
          IF ItemCheckAvail.SalesLineCheck(Rec) THEN
            ItemCheckAvail.RaiseUpdateInterruptedError;
         */

    end;


    procedure ShowReservation()
    begin
        TestField(Type, Type::Item);
        TestField("No.");
        TestField(Reserve);
        Clear(Reservation);
        //Reservation.SetSalesLine(Rec);
        Reservation.RunModal;
    end;


    procedure ShowReservationEntries(Modal: Boolean)
    begin
        TestField(Type, Type::Item);
        TestField("No.");
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, true);
        //ReserveSalesLine.FilterReservFor(ReservEntry,Rec);
        if Modal then
            PAGE.RunModal(PAGE::"Reservation Entries", ReservEntry)
        else
            PAGE.Run(PAGE::"Reservation Entries", ReservEntry);
    end;


    procedure AutoReserve()
    var
        QtyToReserve: Decimal;
        QtyToReserveBase: Decimal;
    begin
        TestField(Type, Type::Item);
        TestField("No.");

        //ReserveSalesLine.ReservQuantity(Rec,QtyToReserve,QtyToReserveBase);
        if QtyToReserveBase <> 0 then begin
            // ReservMgt.SetSalesLine(Rec);
            TestField("Shipment Date");
            ReservMgt.AutoReserve(FullAutoReservation, '', "Shipment Date", QtyToReserve, QtyToReserveBase);
            Find;
            if not FullAutoReservation then begin
                Commit;
                if Confirm(Text011, true) then begin
                    ShowReservation;
                    Find;
                end;
            end;
        end;
    end;


    procedure AutoAsmToOrder()
    begin
        //ATOLink.UpdateAsmFromSalesLine(Rec);
    end;


    procedure GetDate(): Date
    begin
        if SalesHeader."Posting Date" <> 0D then
            exit(SalesHeader."Posting Date");
        exit(WorkDate);
    end;


    procedure CalcPlannedDeliveryDate(CurrFieldNo: Integer): Date
    begin
        if "Shipment Date" = 0D then
            exit("Planned Delivery Date");

        //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
        // case CurrFieldNo of
        //     FieldNo("Shipment Date"):
        //         exit(CalendarMgmt.CalcDateBOC(
        //             Format("Shipping Time"),
        //             "Planned Shipment Date",
        //             CalChange."Source Type"::"Shipping Agent",
        //             "Shipping Agent Code",
        //             "Shipping Agent Service Code",
        //             CalChange."Source Type"::Customer,
        //             "Sell-to Customer No.",
        //             '',
        //             true));
        //     FieldNo("Planned Delivery Date"):
        //         exit(CalendarMgmt.CalcDateBOC2(
        //             Format("Shipping Time"),
        //             "Planned Delivery Date",
        //             CalChange."Source Type"::Customer,
        //             "Sell-to Customer No.",
        //             '',
        //             CalChange."Source Type"::"Shipping Agent",
        //             "Shipping Agent Code",
        //             "Shipping Agent Service Code",
        //             true))
        // end;
        //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
    end;


    procedure CalcPlannedShptDate(CurrFieldNo: Integer): Date
    begin
        if "Shipment Date" = 0D then
            exit("Planned Shipment Date");
        //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
        // case CurrFieldNo of
        //     FieldNo("Shipment Date"):
        //         exit(CalendarMgmt.CalcDateBOC(
        //             Format("Outbound Whse. Handling Time"),
        //             "Shipment Date",
        //             CalChange."Source Type"::Location,
        //             "Location Code",
        //             '',
        //             CalChange."Source Type"::"Shipping Agent",
        //             "Shipping Agent Code",
        //             "Shipping Agent Service Code",
        //             true));
        //     FieldNo("Planned Delivery Date"):
        //         exit(CalendarMgmt.CalcDateBOC(
        //             Format(''),
        //             "Planned Delivery Date",
        //             CalChange."Source Type"::Customer,
        //             "Sell-to Customer No.",
        //             '',
        //             CalChange."Source Type"::"Shipping Agent",
        //             "Shipping Agent Code",
        //             "Shipping Agent Service Code",
        //             true));
        // end;
        //LKS-Raj Commented (CalcDateBOC Missing on Codeunit CalendarMgt)
    end;


    procedure SignedXX(Value: Decimal): Decimal
    begin
        case "Document Type" of
            "Document Type"::Quote,
          "Document Type"::Order,
          "Document Type"::Invoice,
          "Document Type"::"Blanket Order":
                exit(-Value);
            "Document Type"::"Return Order",
          "Document Type"::"Credit Memo":
                exit(Value);
        end;
    end;


    procedure BlanketOrderLookup()
    begin
        SalesLine2.Reset;
        SalesLine2.SetCurrentKey("Document Type", Type, "No.");
        SalesLine2.SetRange("Document Type", "Document Type"::"Blanket Order");
        SalesLine2.SetRange(Type, Type);
        SalesLine2.SetRange("No.", "No.");
        SalesLine2.SetRange("Bill-to Customer No.", "Bill-to Customer No.");
        SalesLine2.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
        if PAGE.RunModal(PAGE::"Sales Lines", SalesLine2) = ACTION::LookupOK then begin
            SalesLine2.TestField("Document Type", "Document Type"::"Blanket Order");
            "Blanket Order No." := SalesLine2."Document No.";
            Validate("Blanket Order Line No.", SalesLine2."Line No.");
        end;
    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', "Document Type", "Document No.", "Line No."));
        VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        //ATOLink.UpdateAsmDimFromSalesLine(Rec);
    end;


    procedure OpenItemTrackingLines()
    var
        Job: Record Job;
    begin
        TestField(Type, Type::Item);
        TestField("No.");
        TestField("Quantity (Base)");
        if "Job Contract Entry No." <> 0 then
            Error(Text048, TableCaption, Job.TableCaption);
        //ReserveSalesLine.CallItemTracking(Rec);
    end;


    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20])
    var
        SourceCodeSetup: Record "Source Code Setup";
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        SourceCodeSetup.Get;
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        GetSalesHeader;
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID, No, SourceCodeSetup.Sales,
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code",
            SalesHeader."Dimension Set ID", DATABASE::Customer);
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        //ATOLink.UpdateAsmDimFromSalesLine(Rec);
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;


    procedure ShowItemSub()
    begin
        /*
        CLEAR(SalesHeader);
        TestStatusOpen;
        //ItemSubstitutionMgt.ItemSubstGet(Rec);
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,TRUE) THEN
          TransferExtendedText.InsertSalesExtText(Rec);
         */

    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure ShowNonstock()
    // begin
    //     TestField(Type, Type::Item);
    //     TestField("No.", '');
    //     if PAGE.RunModal(PAGE::"Nonstock Item List", NonstockItem) = ACTION::LookupOK then begin
    //         NonstockItem.TestField("Item Category Code");
    //         ItemCategory.Get(NonstockItem."Item Category Code");
    //         ItemCategory.TestField("Def. Gen. Prod. Posting Group");
    //         ItemCategory.TestField("Def. Inventory Posting Group");

    //         "No." := NonstockItem."Entry No.";
    //         // NonstockItemMgt.NonStockSales(Rec);
    //         Validate("No.", "No.");
    //         Validate("Unit Price", NonstockItem."Unit Price");
    //     end;
    // end;
    //LKS-Raj Commented (Table Missing)
    local procedure GetFAPostingGroup()
    var
        LocalGLAcc: Record "G/L Account";
        FASetup: Record "FA Setup";
        FAPostingGr: Record "FA Posting Group";
        FADeprBook: Record "FA Depreciation Book";
    begin
        if (Type <> Type::"Fixed Asset") or ("No." = '') then
            exit;
        if "Depreciation Book Code" = '' then begin
            FASetup.Get;
            "Depreciation Book Code" := FASetup."Default Depr. Book";
            if not FADeprBook.Get("No.", "Depreciation Book Code") then
                "Depreciation Book Code" := '';
            if "Depreciation Book Code" = '' then
                exit;
        end;
        FADeprBook.Get("No.", "Depreciation Book Code");
        FADeprBook.TestField("FA Posting Group");
        FAPostingGr.Get(FADeprBook."FA Posting Group");
        FAPostingGr.TestField("Acq. Cost Acc. on Disposal");
        LocalGLAcc.Get(FAPostingGr."Acq. Cost Acc. on Disposal");
        LocalGLAcc.CheckGLAcc;
        LocalGLAcc.TestField("Gen. Prod. Posting Group");
        "Posting Group" := FADeprBook."FA Posting Group";
        "Gen. Prod. Posting Group" := LocalGLAcc."Gen. Prod. Posting Group";
        "Tax Group Code" := LocalGLAcc."Tax Group Code";
        Validate("VAT Prod. Posting Group", LocalGLAcc."VAT Prod. Posting Group");
    end;

    local procedure GetFieldCaption(FieldNumber: Integer): Text[100]
    var
        "Field": Record "Field";
    begin
        Field.Get(DATABASE::"Sales Line", FieldNumber);
        exit(Field."Field Caption");
    end;

    local procedure GetCaptionClass(FieldNumber: Integer): Text[80]
    var
        SalesHeader2: Record "Sales Header";
    begin
        if SalesHeader2.Get("Document Type", "Document No.") then;
        if SalesHeader2."Prices Including VAT" then
            exit('2,1,' + GetFieldCaption(FieldNumber))
        else
            exit('2,0,' + GetFieldCaption(FieldNumber));
    end;

    local procedure GetSKU(): Boolean
    begin
        if (SKU."Location Code" = "Location Code") and
           (SKU."Item No." = "No.") and
           (SKU."Variant Code" = "Variant Code")
        then
            exit(true);
        if SKU.Get("Location Code", "No.", "Variant Code") then
            exit(true);

        exit(false);
    end;


    procedure GetUnitCost()
    begin
        TestField(Type, Type::Item);
        TestField("No.");
        GetItem;
        "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item, "Unit of Measure Code");
        if GetSKU then
            Validate("Unit Cost (LCY)", SKU."Unit Cost" * "Qty. per Unit of Measure")
        else
            Validate("Unit Cost (LCY)", Item."Unit Cost" * "Qty. per Unit of Measure");
    end;

    local procedure CalcUnitCost(ItemLedgEntry: Record "Item Ledger Entry"): Decimal
    var
        ValueEntry: Record "Value Entry";
        UnitCost: Decimal;
    begin
        with ValueEntry do begin
            SetCurrentKey("Item Ledger Entry No.");
            SetRange("Item Ledger Entry No.", ItemLedgEntry."Entry No.");
            CalcSums("Cost Amount (Actual)", "Cost Amount (Expected)");
            UnitCost :=
              ("Cost Amount (Expected)" + "Cost Amount (Actual)") / ItemLedgEntry.Quantity;
        end;

        exit(Abs(UnitCost * "Qty. per Unit of Measure"));
    end;


    procedure ShowItemChargeAssgnt()
    var
        ItemChargeAssgnts: Page "Item Charge Assignment (Sales)";
        AssignItemChargeSales: Codeunit "Item Charge Assgnt. (Sales)";
    begin
        Get("Document Type", "Document No.", "Line No.");
        TestField(Type, Type::"Charge (Item)");
        TestField("No.");
        TestField(Quantity);

        ItemChargeAssgntSales.Reset;
        ItemChargeAssgntSales.SetRange("Document Type", "Document Type");
        ItemChargeAssgntSales.SetRange("Document No.", "Document No.");
        ItemChargeAssgntSales.SetRange("Document Line No.", "Line No.");
        ItemChargeAssgntSales.SetRange("Item Charge No.", "No.");
        if not ItemChargeAssgntSales.FindLast then begin
            ItemChargeAssgntSales."Document Type" := "Document Type";
            ItemChargeAssgntSales."Document No." := "Document No.";
            ItemChargeAssgntSales."Document Line No." := "Line No.";
            ItemChargeAssgntSales."Item Charge No." := "No.";
            GetSalesHeader;
            if ("Inv. Discount Amount" = 0) and
               ("Line Discount Amount" = 0) and
               (not SalesHeader."Prices Including VAT")
            then
                ItemChargeAssgntSales."Unit Cost" := "Unit Price"
            else
                if SalesHeader."Prices Including VAT" then
                    ItemChargeAssgntSales."Unit Cost" :=
                      Round(
                        ("Line Amount" - "Inv. Discount Amount") / Quantity / (1 + "VAT %" / 100),
                        Currency."Unit-Amount Rounding Precision")
                else
                    ItemChargeAssgntSales."Unit Cost" :=
                      Round(
                        ("Line Amount" - "Inv. Discount Amount") / Quantity,
                        Currency."Unit-Amount Rounding Precision");
        end;

        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            AssignItemChargeSales.CreateDocChargeAssgn(ItemChargeAssgntSales, "Return Receipt No.")
        else
            AssignItemChargeSales.CreateDocChargeAssgn(ItemChargeAssgntSales, "Shipment No.");
        Clear(AssignItemChargeSales);
        Commit;

        //ItemChargeAssgnts.Initialize(Rec,ItemChargeAssgntSales."Unit Cost");
        ItemChargeAssgnts.RunModal;
        CalcFields("Qty. to Assign");
    end;


    procedure UpdateItemChargeAssgnt()
    var
        ShareOfVAT: Decimal;
    begin
        CalcFields("Qty. Assigned", "Qty. to Assign");
        if Abs("Quantity Invoiced") > Abs(("Qty. Assigned" + "Qty. to Assign")) then
            Error(Text055, FieldCaption("Quantity Invoiced"), FieldCaption("Qty. Assigned"), FieldCaption("Qty. to Assign"));

        ItemChargeAssgntSales.Reset;
        ItemChargeAssgntSales.SetRange("Document Type", "Document Type");
        ItemChargeAssgntSales.SetRange("Document No.", "Document No.");
        ItemChargeAssgntSales.SetRange("Document Line No.", "Line No.");
        if (CurrFieldNo <> 0) and (Amount <> xRec.Amount) then begin
            ItemChargeAssgntSales.SetFilter("Qty. Assigned", '<>0');
            if not ItemChargeAssgntSales.IsEmpty then
                Error(Text026,
                  FieldCaption(Amount));
            ItemChargeAssgntSales.SetRange("Qty. Assigned");
        end;

        if ItemChargeAssgntSales.FindSet then begin
            GetSalesHeader;
            repeat
                ShareOfVAT := 1;
                if SalesHeader."Prices Including VAT" then
                    ShareOfVAT := 1 + "VAT %" / 100;
                if Quantity <> 0 then
                    if ItemChargeAssgntSales."Unit Cost" <> Round(
                         ("Line Amount" - "Inv. Discount Amount") / Quantity / ShareOfVAT,
                         Currency."Unit-Amount Rounding Precision")
                    then begin
                        ItemChargeAssgntSales."Unit Cost" := Round(
                            ("Line Amount" - "Inv. Discount Amount") / Quantity / ShareOfVAT,
                            Currency."Unit-Amount Rounding Precision");
                        ItemChargeAssgntSales.Validate("Qty. to Assign");
                        ItemChargeAssgntSales.Modify;
                    end;
            until ItemChargeAssgntSales.Next = 0;
            CalcFields("Qty. to Assign");
        end;
    end;

    local procedure DeleteItemChargeAssgnt(DocType: Option; DocNo: Code[20]; DocLineNo: Integer)
    begin
        ItemChargeAssgntSales.SetCurrentKey(
          "Applies-to Doc. Type", "Applies-to Doc. No.", "Applies-to Doc. Line No.");
        ItemChargeAssgntSales.SetRange("Applies-to Doc. Type", DocType);
        ItemChargeAssgntSales.SetRange("Applies-to Doc. No.", DocNo);
        ItemChargeAssgntSales.SetRange("Applies-to Doc. Line No.", DocLineNo);
        if not ItemChargeAssgntSales.IsEmpty then
            ItemChargeAssgntSales.DeleteAll(true);
    end;

    local procedure DeleteChargeChargeAssgnt(DocType: Option; DocNo: Code[20]; DocLineNo: Integer)
    begin
        if DocType <> "Document Type"::"Blanket Order" then
            if "Quantity Invoiced" <> 0 then begin
                CalcFields("Qty. Assigned");
                TestField("Qty. Assigned", "Quantity Invoiced");
            end;
        ItemChargeAssgntSales.Reset;
        ItemChargeAssgntSales.SetRange("Document Type", DocType);
        ItemChargeAssgntSales.SetRange("Document No.", DocNo);
        ItemChargeAssgntSales.SetRange("Document Line No.", DocLineNo);
        if not ItemChargeAssgntSales.IsEmpty then
            ItemChargeAssgntSales.DeleteAll;
    end;


    procedure CheckItemChargeAssgnt()
    var
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
    begin
        ItemChargeAssgntSales.SetCurrentKey(
          "Applies-to Doc. Type", "Applies-to Doc. No.", "Applies-to Doc. Line No.");
        ItemChargeAssgntSales.SetRange("Applies-to Doc. Type", "Document Type");
        ItemChargeAssgntSales.SetRange("Applies-to Doc. No.", "Document No.");
        ItemChargeAssgntSales.SetRange("Applies-to Doc. Line No.", "Line No.");
        ItemChargeAssgntSales.SetRange("Document Type", "Document Type");
        ItemChargeAssgntSales.SetRange("Document No.", "Document No.");
        if ItemChargeAssgntSales.FindSet then begin
            TestField("Allow Item Charge Assignment");
            repeat
                ItemChargeAssgntSales.TestField("Qty. to Assign", 0);
            until ItemChargeAssgntSales.Next = 0;
        end;
    end;

    local procedure TestStatusOpen()
    begin
        if StatusCheckSuspended then
            exit;
        GetSalesHeader;
        if Type in [Type::Item, Type::"Fixed Asset"] then
            SalesHeader.TestField(Status, SalesHeader.Status::Open);
    end;


    procedure SuspendStatusCheck(Suspend: Boolean)
    begin
        StatusCheckSuspended := Suspend;
    end;


    procedure UpdateVATOnLines(QtyType: Option General,Invoicing,Shipping; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    var
        TempVATAmountLineRemainder: Record "VAT Amount Line" temporary;
        Currency: Record Currency;
        NewAmount: Decimal;
        NewAmountIncludingVAT: Decimal;
        NewVATBaseAmount: Decimal;
        VATAmount: Decimal;
        VATDifference: Decimal;
        InvDiscAmount: Decimal;
        LineAmountToInvoice: Decimal;
    begin
        if QtyType = QtyType::Shipping then
            exit;
        if SalesHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else
            Currency.Get(SalesHeader."Currency Code");

        TempVATAmountLineRemainder.DeleteAll;

        with SalesLine do begin
            SetRange("Document Type", SalesHeader."Document Type");
            SetRange("Document No.", SalesHeader."No.");
            LockTable;
            if FindSet then
                repeat
                    if not ZeroAmountLine(QtyType) then begin
                        VATAmountLine.Get("VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0);
                        if VATAmountLine.Modified then begin
                            if not TempVATAmountLineRemainder.Get(
                                 "VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0)
                            then begin
                                TempVATAmountLineRemainder := VATAmountLine;
                                TempVATAmountLineRemainder.Init;
                                TempVATAmountLineRemainder.Insert;
                            end;

                            if QtyType = QtyType::General then
                                LineAmountToInvoice := "Line Amount"
                            else
                                LineAmountToInvoice :=
                                  Round("Line Amount" * "Qty. to Invoice" / Quantity, Currency."Amount Rounding Precision");

                            if "Allow Invoice Disc." then begin
                                if VATAmountLine."Inv. Disc. Base Amount" = 0 then
                                    InvDiscAmount := 0
                                else begin
                                    TempVATAmountLineRemainder."Invoice Discount Amount" :=
                                      TempVATAmountLineRemainder."Invoice Discount Amount" +
                                      VATAmountLine."Invoice Discount Amount" * LineAmountToInvoice /
                                      VATAmountLine."Inv. Disc. Base Amount";
                                    InvDiscAmount :=
                                      Round(
                                        TempVATAmountLineRemainder."Invoice Discount Amount", Currency."Amount Rounding Precision");
                                    TempVATAmountLineRemainder."Invoice Discount Amount" :=
                                      TempVATAmountLineRemainder."Invoice Discount Amount" - InvDiscAmount;
                                end;
                                if QtyType = QtyType::General then begin
                                    "Inv. Discount Amount" := InvDiscAmount;
                                    CalcInvDiscToInvoice;
                                end else
                                    "Inv. Disc. Amount to Invoice" := InvDiscAmount;
                            end else
                                InvDiscAmount := 0;

                            if QtyType = QtyType::General then
                                if SalesHeader."Prices Including VAT" then begin
                                    if (VATAmountLine."Line Amount" - VATAmountLine."Invoice Discount Amount" = 0) or
                                       ("Line Amount" = 0)
                                    then begin
                                        VATAmount := 0;
                                        NewAmountIncludingVAT := 0;
                                    end else begin
                                        VATAmount :=
                                          TempVATAmountLineRemainder."VAT Amount" +
                                          VATAmountLine."VAT Amount" *
                                          ("Line Amount" - "Inv. Discount Amount") /
                                          (VATAmountLine."Line Amount" - VATAmountLine."Invoice Discount Amount");
                                        NewAmountIncludingVAT :=
                                          TempVATAmountLineRemainder."Amount Including VAT" +
                                          VATAmountLine."Amount Including VAT" *
                                          ("Line Amount" - "Inv. Discount Amount") /
                                          (VATAmountLine."Line Amount" - VATAmountLine."Invoice Discount Amount");
                                    end;
                                    NewAmount :=
                                      Round(NewAmountIncludingVAT, Currency."Amount Rounding Precision") -
                                      Round(VATAmount, Currency."Amount Rounding Precision");
                                    NewVATBaseAmount :=
                                      Round(
                                        NewAmount * (1 - SalesHeader."VAT Base Discount %" / 100),
                                        Currency."Amount Rounding Precision");
                                end else begin
                                    if "VAT Calculation Type" = "VAT Calculation Type"::"Full VAT" then begin
                                        VATAmount := "Line Amount" - "Inv. Discount Amount";
                                        NewAmount := 0;
                                        NewVATBaseAmount := 0;
                                    end else begin
                                        NewAmount := "Line Amount" - "Inv. Discount Amount";
                                        NewVATBaseAmount :=
                                          Round(
                                            NewAmount * (1 - SalesHeader."VAT Base Discount %" / 100),
                                            Currency."Amount Rounding Precision");
                                        if VATAmountLine."VAT Base" = 0 then
                                            VATAmount := 0
                                        else
                                            VATAmount :=
                                              TempVATAmountLineRemainder."VAT Amount" +
                                              VATAmountLine."VAT Amount" * NewAmount / VATAmountLine."VAT Base";
                                    end;
                                    NewAmountIncludingVAT := NewAmount + Round(VATAmount, Currency."Amount Rounding Precision");
                                end
                            else begin
                                if (VATAmountLine."Line Amount" - VATAmountLine."Invoice Discount Amount") = 0 then
                                    VATDifference := 0
                                else
                                    VATDifference :=
                                      TempVATAmountLineRemainder."VAT Difference" +
                                      VATAmountLine."VAT Difference" * (LineAmountToInvoice - InvDiscAmount) /
                                      (VATAmountLine."Line Amount" - VATAmountLine."Invoice Discount Amount");
                                if LineAmountToInvoice = 0 then
                                    "VAT Difference" := 0
                                else
                                    "VAT Difference" := Round(VATDifference, Currency."Amount Rounding Precision");
                            end;
                            if QtyType = QtyType::General then begin
                                Amount := NewAmount;
                                "Amount Including VAT" := Round(NewAmountIncludingVAT, Currency."Amount Rounding Precision");
                                "VAT Base Amount" := NewVATBaseAmount;
                            end;
                            InitOutstanding;
                            if Type = Type::"Charge (Item)" then
                                UpdateItemChargeAssgnt;
                            Modify;

                            TempVATAmountLineRemainder."Amount Including VAT" :=
                              NewAmountIncludingVAT - Round(NewAmountIncludingVAT, Currency."Amount Rounding Precision");
                            TempVATAmountLineRemainder."VAT Amount" := VATAmount - NewAmountIncludingVAT + NewAmount;
                            TempVATAmountLineRemainder."VAT Difference" := VATDifference - "VAT Difference";
                            TempVATAmountLineRemainder.Modify;
                        end;
                    end;
                until Next = 0;
        end;
    end;


    procedure CalcVATAmountLines(QtyType: Option General,Invoicing,Shipping; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    var
        PrevVatAmountLine: Record "VAT Amount Line";
        Currency: Record Currency;
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
        TotalVATAmount: Decimal;
        QtyToHandle: Decimal;
        RoundingLineInserted: Boolean;
    begin
        if SalesHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else
            Currency.Get(SalesHeader."Currency Code");

        VATAmountLine.DeleteAll;
        //LKS-Raj Commented (Table Missing)
        // with SalesLine do begin
        //     SetRange("Document Type", SalesHeader."Document Type");
        //     SetRange("Document No.", SalesHeader."No.");
        //     if FindSet then
        //         repeat
        //             if not ZeroAmountLine(QtyType) then begin
        //                 if (Type = Type::"G/L Account") and not "Prepayment Line" then
        //                     RoundingLineInserted := ("No." = GetCPGInvRoundAcc(SalesHeader)) or RoundingLineInserted;
        //                 if "VAT Calculation Type" in
        //                    ["VAT Calculation Type"::"Reverse Charge VAT", "VAT Calculation Type"::"Sales Tax"]
        //                 then
        //                     "VAT %" := 0;
        //                 if not VATAmountLine.Get(
        //                      "VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0)
        //                 then begin
        //                     VATAmountLine.Init;
        //                     VATAmountLine."VAT Identifier" := "VAT Identifier";
        //                     VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
        //                     VATAmountLine."Tax Group Code" := "Tax Group Code";
        //                     VATAmountLine."VAT %" := "VAT %";
        //                     VATAmountLine.Modified := true;
        //                     VATAmountLine.Positive := "Line Amount" >= 0;
        //                     VATAmountLine.Insert;
        //                 end;
        //                 case QtyType of
        //                     QtyType::General:
        //                         begin
        //                             VATAmountLine.Quantity := VATAmountLine.Quantity + "Quantity (Base)";
        //                             VATAmountLine."Line Amount" := VATAmountLine."Line Amount" + "Line Amount";
        //                             if "Allow Invoice Disc." then
        //                                 VATAmountLine."Inv. Disc. Base Amount" :=
        //                                   VATAmountLine."Inv. Disc. Base Amount" + "Line Amount";
        //                             VATAmountLine."Invoice Discount Amount" :=
        //                               VATAmountLine."Invoice Discount Amount" + "Inv. Discount Amount";
        //                             VATAmountLine."VAT Difference" := VATAmountLine."VAT Difference" + "VAT Difference";
        //                             if "Prepayment Line" then
        //                                 VATAmountLine."Includes Prepayment" := true;
        //                             VATAmountLine.Modify;
        //                         end;
        //                     QtyType::Invoicing:
        //                         begin
        //                             case true of
        //                                 ("Document Type" in ["Document Type"::Order, "Document Type"::Invoice]) and
        //                                 (not SalesHeader.Ship) and SalesHeader.Invoice and (not "Prepayment Line"):
        //                                     begin
        //                                         if "Shipment No." = '' then begin
        //                                             QtyToHandle := GetAbsMin("Qty. to Invoice", "Qty. Shipped Not Invoiced");
        //                                             VATAmountLine.Quantity :=
        //                                               VATAmountLine.Quantity + GetAbsMin("Qty. to Invoice (Base)", "Qty. Shipped Not Invd. (Base)");
        //                                         end else begin
        //                                             QtyToHandle := "Qty. to Invoice";
        //                                             VATAmountLine.Quantity := VATAmountLine.Quantity + "Qty. to Invoice (Base)";
        //                                         end;
        //                                     end;
        //                                 ("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and
        //                                 (not SalesHeader.Receive) and SalesHeader.Invoice:
        //                                     begin
        //                                         if "Return Receipt No." = '' then begin
        //                                             QtyToHandle := GetAbsMin("Qty. to Invoice", "Return Qty. Rcd. Not Invd.");
        //                                             VATAmountLine.Quantity :=
        //                                               VATAmountLine.Quantity + GetAbsMin("Qty. to Invoice (Base)", "Ret. Qty. Rcd. Not Invd.(Base)");
        //                                         end else begin
        //                                             QtyToHandle := "Qty. to Invoice";
        //                                             VATAmountLine.Quantity := VATAmountLine.Quantity + "Qty. to Invoice (Base)";
        //                                         end;
        //                                     end;
        //                                 else begin
        //                                     QtyToHandle := "Qty. to Invoice";
        //                                     VATAmountLine.Quantity := VATAmountLine.Quantity + "Qty. to Invoice (Base)";
        //                                 end;
        //                             end;
        //                             VATAmountLine."Line Amount" :=
        //                               VATAmountLine."Line Amount" + GetLineAmountToHandle(QtyToHandle);
        //                             if "Allow Invoice Disc." then
        //                                 VATAmountLine."Inv. Disc. Base Amount" :=
        //                                   VATAmountLine."Inv. Disc. Base Amount" + GetLineAmountToHandle(QtyToHandle);
        //                             if SalesHeader."Invoice Discount Calculation" <> SalesHeader."Invoice Discount Calculation"::Amount then
        //                                 VATAmountLine."Invoice Discount Amount" :=
        //                                   VATAmountLine."Invoice Discount Amount" +
        //                                   Round("Inv. Discount Amount" * QtyToHandle / Quantity, Currency."Amount Rounding Precision")
        //                             else
        //                                 VATAmountLine."Invoice Discount Amount" :=
        //                                   VATAmountLine."Invoice Discount Amount" + "Inv. Disc. Amount to Invoice";
        //                             VATAmountLine."VAT Difference" := VATAmountLine."VAT Difference" + "VAT Difference";
        //                             if "Prepayment Line" then
        //                                 VATAmountLine."Includes Prepayment" := true;
        //                             VATAmountLine.Modify;
        //                         end;
        //                     QtyType::Shipping:
        //                         begin
        //                             if "Document Type" in
        //                                ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]
        //                             then begin
        //                                 QtyToHandle := "Return Qty. to Receive";
        //                                 VATAmountLine.Quantity := VATAmountLine.Quantity + "Return Qty. to Receive (Base)";
        //                             end else begin
        //                                 QtyToHandle := "Qty. to Ship";
        //                                 VATAmountLine.Quantity := VATAmountLine.Quantity + "Qty. to Ship (Base)";
        //                             end;
        //                             VATAmountLine."Line Amount" :=
        //                               VATAmountLine."Line Amount" + GetLineAmountToHandle(QtyToHandle);
        //                             if "Allow Invoice Disc." then
        //                                 VATAmountLine."Inv. Disc. Base Amount" :=
        //                                   VATAmountLine."Inv. Disc. Base Amount" + GetLineAmountToHandle(QtyToHandle);
        //                             VATAmountLine."Invoice Discount Amount" :=
        //                               VATAmountLine."Invoice Discount Amount" +
        //                               Round("Inv. Discount Amount" * QtyToHandle / Quantity, Currency."Amount Rounding Precision");
        //                             VATAmountLine."VAT Difference" := VATAmountLine."VAT Difference" + "VAT Difference";
        //                             if "Prepayment Line" then
        //                                 VATAmountLine."Includes Prepayment" := true;
        //                             VATAmountLine.Modify;
        //                         end;
        //                     QtyType::Shipping:
        //                         begin
        //                             if "Document Type" in
        //                                ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]
        //                             then begin
        //                                 QtyToHandle := "Return Qty. to Receive";
        //                                 VATAmountLine.Quantity := VATAmountLine.Quantity + "Return Qty. to Receive (Base)";
        //                             end else begin
        //                                 QtyToHandle := "Qty. to Ship";
        //                                 VATAmountLine.Quantity := VATAmountLine.Quantity + "Qty. to Ship (Base)";
        //                             end;
        //                         end;
        //                 end;
        //                 TotalVATAmount := TotalVATAmount + "Amount Including VAT" - Amount;
        //             end;
        //         until Next = 0;
        // end;
        //LKS-Raj Commented (Table Missing)
        with VATAmountLine do
            if FindSet then
                repeat
                    if (PrevVatAmountLine."VAT Identifier" <> "VAT Identifier") or
                       (PrevVatAmountLine."VAT Calculation Type" <> "VAT Calculation Type") or
                       (PrevVatAmountLine."Tax Group Code" <> "Tax Group Code") or
                       (PrevVatAmountLine."Use Tax" <> "Use Tax")
                    then
                        PrevVatAmountLine.Init;
                    if SalesHeader."Prices Including VAT" then begin
                        case "VAT Calculation Type" of
                            "VAT Calculation Type"::"Normal VAT",
                            "VAT Calculation Type"::"Reverse Charge VAT":
                                begin
                                    "VAT Base" :=
                                      Round(
                                        ("Line Amount" - "Invoice Discount Amount") / (1 + "VAT %" / 100),
                                        Currency."Amount Rounding Precision") - "VAT Difference";
                                    "VAT Amount" :=
                                      "VAT Difference" +
                                      Round(
                                        PrevVatAmountLine."VAT Amount" +
                                        ("Line Amount" - "Invoice Discount Amount" - "VAT Base" - "VAT Difference") *
                                        (1 - SalesHeader."VAT Base Discount %" / 100),
                                        Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                                    "Amount Including VAT" := "VAT Base" + "VAT Amount";
                                    if Positive then
                                        PrevVatAmountLine.Init
                                    else begin
                                        PrevVatAmountLine := VATAmountLine;
                                        PrevVatAmountLine."VAT Amount" :=
                                          ("Line Amount" - "Invoice Discount Amount" - "VAT Base" - "VAT Difference") *
                                          (1 - SalesHeader."VAT Base Discount %" / 100);
                                        PrevVatAmountLine."VAT Amount" :=
                                          PrevVatAmountLine."VAT Amount" -
                                          Round(PrevVatAmountLine."VAT Amount", Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                                    end;
                                end;
                            "VAT Calculation Type"::"Full VAT":
                                begin
                                    "VAT Base" := 0;
                                    "VAT Amount" := "VAT Difference" + "Line Amount" - "Invoice Discount Amount";
                                    "Amount Including VAT" := "VAT Amount";
                                end;
                            "VAT Calculation Type"::"Sales Tax":
                                begin
                                    "Amount Including VAT" := "Line Amount" - "Invoice Discount Amount";
                                    "VAT Base" :=
                                      Round(
                                        SalesTaxCalculate.ReverseCalculateTax(
                                          SalesHeader."Tax Area Code", "Tax Group Code", SalesHeader."Tax Liable",
                                          SalesHeader."Posting Date", "Amount Including VAT", Quantity, SalesHeader."Currency Factor"),
                                        Currency."Amount Rounding Precision");
                                    "VAT Amount" := "VAT Difference" + "Amount Including VAT" - "VAT Base";
                                    if "VAT Base" = 0 then
                                        "VAT %" := 0
                                    else
                                        "VAT %" := Round(100 * "VAT Amount" / "VAT Base", 0.00001);
                                end;
                        end;
                    end else
                        case "VAT Calculation Type" of
                            "VAT Calculation Type"::"Normal VAT",
                            "VAT Calculation Type"::"Reverse Charge VAT":
                                begin
                                    "VAT Base" := "Line Amount" - "Invoice Discount Amount";
                                    "VAT Amount" :=
                                      "VAT Difference" +
                                      Round(
                                        PrevVatAmountLine."VAT Amount" +
                                        "VAT Base" * "VAT %" / 100 * (1 - SalesHeader."VAT Base Discount %" / 100),
                                        Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                                    "Amount Including VAT" := "Line Amount" - "Invoice Discount Amount" + "VAT Amount";
                                    if Positive then
                                        PrevVatAmountLine.Init
                                    else
                                        if not "Includes Prepayment" then begin
                                            PrevVatAmountLine := VATAmountLine;
                                            PrevVatAmountLine."VAT Amount" :=
                                              "VAT Base" * "VAT %" / 100 * (1 - SalesHeader."VAT Base Discount %" / 100);
                                            PrevVatAmountLine."VAT Amount" :=
                                              PrevVatAmountLine."VAT Amount" -
                                              Round(PrevVatAmountLine."VAT Amount", Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                                        end;
                                end;
                            "VAT Calculation Type"::"Full VAT":
                                begin
                                    "VAT Base" := 0;
                                    "VAT Amount" := "VAT Difference" + "Line Amount" - "Invoice Discount Amount";
                                    "Amount Including VAT" := "VAT Amount";
                                end;
                            "VAT Calculation Type"::"Sales Tax":
                                begin
                                    "VAT Base" := "Line Amount" - "Invoice Discount Amount";
                                    "VAT Amount" :=
                                      SalesTaxCalculate.CalculateTax(
                                        SalesHeader."Tax Area Code", "Tax Group Code", SalesHeader."Tax Liable",
                                        SalesHeader."Posting Date", "VAT Base", Quantity, SalesHeader."Currency Factor");
                                    if "VAT Base" = 0 then
                                        "VAT %" := 0
                                    else
                                        "VAT %" := Round(100 * "VAT Amount" / "VAT Base", 0.00001);
                                    "VAT Amount" :=
                                      "VAT Difference" +
                                      Round("VAT Amount", Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                                    "Amount Including VAT" := "VAT Base" + "VAT Amount";
                                end;
                        end;

                    if RoundingLineInserted then
                        TotalVATAmount := TotalVATAmount - "VAT Amount";
                    "Calculated VAT Amount" := "VAT Amount" - "VAT Difference";
                    Modify;
                until Next = 0;

        if RoundingLineInserted and (TotalVATAmount <> 0) then
            if VATAmountLine.Get(SalesLine."VAT Identifier", SalesLine."VAT Calculation Type",
                 SalesLine."Tax Group Code", false, SalesLine."Line Amount" >= 0)
            then begin
                VATAmountLine."VAT Amount" := VATAmountLine."VAT Amount" + TotalVATAmount;
                VATAmountLine."Amount Including VAT" := VATAmountLine."Amount Including VAT" + TotalVATAmount;
                VATAmountLine."Calculated VAT Amount" := VATAmountLine."Calculated VAT Amount" + TotalVATAmount;
                VATAmountLine.Modify;
            end;
    end;


    procedure GetCPGInvRoundAcc(var SalesHeader: Record "Sales Header"): Code[20]
    var
        Cust: Record Customer;
        CustTemplate: Record "Customer Template";
        CustPostingGroup: Record "Customer Posting Group";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;
        if SalesSetup."Invoice Rounding" then
            if Cust.Get(SalesHeader."Bill-to Customer No.") then
                CustPostingGroup.Get(Cust."Customer Posting Group")
            ;//TBD
             /*
             else
                 if CustTemplate.Get(SalesHeader."Sell-to Customer Template Code") then
                     CustPostingGroup.Get(CustTemplate."Customer Posting Group");
             */

        exit(CustPostingGroup."Invoice Rounding Account");
    end;

    local procedure CalcInvDiscToInvoice()
    var
        OldInvDiscAmtToInv: Decimal;
    begin
        GetSalesHeader;
        OldInvDiscAmtToInv := "Inv. Disc. Amount to Invoice";
        if Quantity = 0 then
            Validate("Inv. Disc. Amount to Invoice", 0)
        else
            Validate(
              "Inv. Disc. Amount to Invoice",
              Round(
                "Inv. Discount Amount" * "Qty. to Invoice" / Quantity,
                Currency."Amount Rounding Precision"));

        if OldInvDiscAmtToInv <> "Inv. Disc. Amount to Invoice" then begin
            "Amount Including VAT" := "Amount Including VAT" - "VAT Difference";
            "VAT Difference" := 0;
        end;
    end;


    procedure UpdateWithWarehouseShip()
    begin
        if Type = Type::Item then
            case true of
                ("Document Type" in ["Document Type"::Quote, "Document Type"::Order]) and (Quantity >= 0):
                    if Location.RequireShipment("Location Code") then
                        Validate("Qty. to Ship", 0)
                    else
                        Validate("Qty. to Ship", "Outstanding Quantity");
                ("Document Type" in ["Document Type"::Quote, "Document Type"::Order]) and (Quantity < 0):
                    if Location.RequireReceive("Location Code") then
                        Validate("Qty. to Ship", 0)
                    else
                        Validate("Qty. to Ship", "Outstanding Quantity");
                ("Document Type" = "Document Type"::"Return Order") and (Quantity >= 0):
                    if Location.RequireReceive("Location Code") then
                        Validate("Return Qty. to Receive", 0)
                    else
                        Validate("Return Qty. to Receive", "Outstanding Quantity");
                ("Document Type" = "Document Type"::"Return Order") and (Quantity < 0):
                    if Location.RequireShipment("Location Code") then
                        Validate("Return Qty. to Receive", 0)
                    else
                        Validate("Return Qty. to Receive", "Outstanding Quantity");
            end;
        SetDefaultQuantity;
    end;

    local procedure CheckWarehouse()
    var
        Location2: Record Location;
        WhseSetup: Record "Warehouse Setup";
        ShowDialog: Option " ",Message,Error;
        DialogText: Text[50];
    begin
        GetLocation("Location Code");
        if "Location Code" = '' then begin
            WhseSetup.Get;
            Location2."Require Shipment" := WhseSetup."Require Shipment";
            Location2."Require Pick" := WhseSetup."Require Pick";
            Location2."Require Receive" := WhseSetup."Require Receive";
            Location2."Require Put-away" := WhseSetup."Require Put-away";
        end else
            Location2 := Location;

        DialogText := Text035;
        if ("Document Type" in ["Document Type"::Order, "Document Type"::"Return Order"]) and
           Location2."Directed Put-away and Pick"
        then begin
            ShowDialog := ShowDialog::Error;
            if (("Document Type" = "Document Type"::Order) and (Quantity >= 0)) or
               (("Document Type" = "Document Type"::"Return Order") and (Quantity < 0))
            then
                DialogText :=
                  DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Shipment"))
            else
                DialogText :=
                  DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Receive"));
        end else begin
            if (("Document Type" = "Document Type"::Order) and (Quantity >= 0) and
                (Location2."Require Shipment" or Location2."Require Pick")) or
               (("Document Type" = "Document Type"::"Return Order") and (Quantity < 0) and
                (Location2."Require Shipment" or Location2."Require Pick"))
            then begin
                if WhseValidateSourceLine.WhseLinesExist(
                     DATABASE::"Sales Line",
                     "Document Type",
                     "Document No.",
                     "Line No.",
                     0,
                     Quantity)
                then
                    ShowDialog := ShowDialog::Error
                else
                    if Location2."Require Shipment" then
                        ShowDialog := ShowDialog::Message;
                if Location2."Require Shipment" then
                    DialogText :=
                      DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Shipment"))
                else begin
                    DialogText := Text036;
                    DialogText :=
                      DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Pick"));
                end;
            end;

            if (("Document Type" = "Document Type"::Order) and (Quantity < 0) and
                (Location2."Require Receive" or Location2."Require Put-away")) or
               (("Document Type" = "Document Type"::"Return Order") and (Quantity >= 0) and
                (Location2."Require Receive" or Location2."Require Put-away"))
            then begin
                if WhseValidateSourceLine.WhseLinesExist(
                     DATABASE::"Sales Line",
                     "Document Type",
                     "Document No.",
                     "Line No.",
                     0,
                     Quantity)
                then
                    ShowDialog := ShowDialog::Error
                else
                    if Location2."Require Receive" then
                        ShowDialog := ShowDialog::Message;
                if Location2."Require Receive" then
                    DialogText :=
                      DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Receive"))
                else begin
                    DialogText := Text036;
                    DialogText :=
                      DialogText + Location2.GetRequirementText(Location2.FieldNo("Require Put-away"));
                end;
            end;
        end;

        case ShowDialog of
            ShowDialog::Message:
                Message(Text016 + Text017, DialogText, FieldCaption("Line No."), "Line No.");
            ShowDialog::Error:
                Error(Text016, DialogText, FieldCaption("Line No."), "Line No.");
        end;

        HandleDedicatedBin(true);
    end;


    procedure UpdateDates()
    begin
        if CurrFieldNo = 0 then begin
            PlannedShipmentDateCalculated := false;
            PlannedDeliveryDateCalculated := false;
        end;
        if "Promised Delivery Date" <> 0D then
            Validate("Promised Delivery Date")
        else
            if "Requested Delivery Date" <> 0D then
                Validate("Requested Delivery Date")
            else
                Validate("Shipment Date");
    end;


    procedure GetItemTranslation()
    begin
        GetSalesHeader;
        if ItemTranslation.Get("No.", "Variant Code", SalesHeader."Language Code") then begin
            Description := ItemTranslation.Description;
            "Description 2" := ItemTranslation."Description 2";
        end;
    end;

    local procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            Clear(Location)
        else
            if Location.Code <> LocationCode then
                Location.Get(LocationCode);
    end;


    procedure PriceExists(): Boolean
    begin
        /*
        IF "Document No." <> '' THEN BEGIN
          GetSalesHeader;
          EXIT(PriceCalcMgt.SalesLinePriceExists(SalesHeader,Rec,TRUE));
        END;
        EXIT(FALSE);
         */

    end;


    procedure LineDiscExists(): Boolean
    begin
        /*
        IF "Document No." <> '' THEN BEGIN
          GetSalesHeader;
          EXIT(PriceCalcMgt.SalesLineLineDiscExists(SalesHeader,Rec,TRUE));
        END;
        EXIT(FALSE);
         */

    end;

    //LKS-Raj Commented (Codeunit Missing)
    // 
    // procedure RowID1(): Text[250]
    // var
    //     ItemTrackingMgt: Codeunit "Item Tracking Management";
    // begin
    //     exit(ItemTrackingMgt.ComposeRowID(DATABASE::"Sales Line", "Document Type",
    //         "Document No.", '', 0, "Line No."));
    // end;


    procedure GetItemCrossRef(CalledByFieldNo: Integer)
    begin
        if CalledByFieldNo <> 0 then;
        //  DistIntegration.EnterSalesItemCrossRef(Rec);
    end;

    local procedure GetDefaultBin()
    var
        WMSManagement: Codeunit "WMS Management";
    begin
        if Type <> Type::Item then
            exit;

        "Bin Code" := '';
        if "Drop Shipment" then
            exit;

        if ("Location Code" <> '') and ("No." <> '') then begin
            GetLocation("Location Code");
            if Location."Bin Mandatory" and not Location."Directed Put-away and Pick" then begin
                if ("Qty. to Assemble to Order" > 0) or IsAsmToOrderRequired then
                    if GetATOBin(Location, "Bin Code") then
                        exit;

                WMSManagement.GetDefaultBin("No.", "Variant Code", "Location Code", "Bin Code");
                HandleDedicatedBin(false);
            end;
        end;
    end;


    procedure GetATOBin(Location: Record Location; var BinCode: Code[20]): Boolean
    var
        AsmHeader: Record "Assembly Header";
    begin
        if not Location."Require Shipment" then
            BinCode := Location."Asm.-to-Order Shpt. Bin Code";
        if BinCode <> '' then
            exit(true);

        if AsmHeader.GetFromAssemblyBin(Location, BinCode) then
            exit(true);

        exit(false);
    end;


    procedure IsInbound(): Boolean
    begin
        case "Document Type" of
            "Document Type"::Order, "Document Type"::Invoice, "Document Type"::Quote, "Document Type"::"Blanket Order":
                exit("Quantity (Base)" < 0);
            "Document Type"::"Return Order", "Document Type"::"Credit Memo":
                exit("Quantity (Base)" > 0);
        end;

        exit(false);
    end;

    local procedure HandleDedicatedBin(IssueWarning: Boolean)
    var
        WhseIntegrationMgt: Codeunit "Whse. Integration Management";
    begin
        if not IsInbound and ("Quantity (Base)" <> 0) then
            WhseIntegrationMgt.CheckIfBinDedicatedOnSrcDoc("Location Code", "Bin Code", IssueWarning);
    end;


    procedure CheckAssocPurchOrder(TheFieldCaption: Text[250])
    begin
        if TheFieldCaption = '' then begin // If sales line is being deleted
            if "Purch. Order Line No." <> 0 then
                Error(
                  Text000,
                  "Purchase Order No.",
                  "Purch. Order Line No.");
            if "Special Order Purch. Line No." <> 0 then
                Error(
                  Text000,
                  "Special Order Purchase No.",
                  "Special Order Purch. Line No.");
        end;
        if "Purch. Order Line No." <> 0 then
            Error(
              Text002,
              TheFieldCaption,
              "Purchase Order No.",
              "Purch. Order Line No.");
        if "Special Order Purch. Line No." <> 0 then
            Error(
              Text002,
              TheFieldCaption,
              "Special Order Purchase No.",
              "Special Order Purch. Line No.");
    end;


    procedure CrossReferenceNoLookUp()
    var
        ItemCrossReference: Record "Item Cross Reference";
        ICGLAcc: Record "IC G/L Account";
    begin
        case Type of
            Type::Item:
                begin
                    GetSalesHeader;
                    ItemCrossReference.Reset;
                    ItemCrossReference.SetCurrentKey("Cross-Reference Type", "Cross-Reference Type No.");
                    ItemCrossReference.SetFilter(
                      "Cross-Reference Type", '%1|%2',
                      ItemCrossReference."Cross-Reference Type"::Customer,
                      ItemCrossReference."Cross-Reference Type"::" ");
                    ItemCrossReference.SetFilter("Cross-Reference Type No.", '%1|%2', SalesHeader."Sell-to Customer No.", '');
                    //TBD
                    /*
                    if PAGE.RunModal(PAGE::"Cross Reference List", ItemCrossReference) = ACTION::LookupOK then begin
                        Validate("Cross-Reference No.", ItemCrossReference."Cross-Reference No.");
                    
                        //        PriceCalcMgt.FindSalesLineLineDisc(SalesHeader,Rec);
                        //        PriceCalcMgt.FindSalesLinePrice(SalesHeader,Rec,FIELDNO("Cross-Reference No."));
                        Validate("Unit Price");
                    end;
                    */
                end;
            Type::"G/L Account", Type::Resource:
                begin
                    GetSalesHeader;
                    SalesHeader.TestField("Sell-to IC Partner Code");
                    if PAGE.RunModal(PAGE::"IC G/L Account List") = ACTION::LookupOK then
                        "Cross-Reference No." := ICGLAcc."No.";
                end;
        end;
    end;


    procedure CheckServItemCreation()
    var
        ServItemGroup: Record "Service Item Group";
    begin
        if CurrFieldNo = 0 then
            exit;
        if Type <> Type::Item then
            exit;
        Item.Get("No.");
        if Item."Service Item Group" = '' then
            exit;
        if ServItemGroup.Get(Item."Service Item Group") then
            if ServItemGroup."Create Service Item" then
                if "Qty. to Ship (Base)" <> Round("Qty. to Ship (Base)", 1) then
                    Error(
                      Text034,
                      FieldCaption("Qty. to Ship (Base)"),
                      ServItemGroup.FieldCaption("Create Service Item"));
    end;


    procedure ItemExists(ItemNo: Code[20]): Boolean
    var
        Item2: Record Item;
    begin
        if Type = Type::Item then
            if not Item2.Get(ItemNo) then
                exit(false);
        exit(true);
    end;


    procedure IsShipment(): Boolean
    begin
        exit(SignedXX("Quantity (Base)") < 0);
    end;

    local procedure GetAbsMin(QtyToHandle: Decimal; QtyHandled: Decimal): Decimal
    begin
        if Abs(QtyHandled) < Abs(QtyToHandle) then
            exit(QtyHandled);

        exit(QtyToHandle);
    end;


    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    local procedure CheckApplFromItemLedgEntry(var ItemLedgEntry: Record "Item Ledger Entry")
    var
        ItemTrackingLines: Page "Item Tracking Lines";
        QtyBase: Decimal;
        QtyNotReturned: Decimal;
        QtyReturned: Decimal;
    begin
        if "Appl.-from Item Entry" = 0 then
            exit;

        if "Shipment No." <> '' then
            exit;

        TestField(Type, Type::Item);
        TestField(Quantity);
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
            if Quantity < 0 then
                FieldError(Quantity, Text029);
        end else begin
            if Quantity > 0 then
                FieldError(Quantity, Text030);
        end;

        ItemLedgEntry.Get("Appl.-from Item Entry");
        ItemLedgEntry.TestField(Positive, false);
        ItemLedgEntry.TestField("Item No.", "No.");
        ItemLedgEntry.TestField("Variant Code", "Variant Code");
        if (ItemLedgEntry."Lot No." <> '') or (ItemLedgEntry."Serial No." <> '') then
            Error(Text040, ItemTrackingLines.Caption, FieldCaption("Appl.-from Item Entry"));

        case true of
            CurrFieldNo = FieldNo(Quantity):
                QtyBase := "Quantity (Base)";
            "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]:
                QtyBase := "Return Qty. to Receive (Base)"
            else
                QtyBase := "Qty. to Ship (Base)";
        end;

        if Abs(QtyBase) > -ItemLedgEntry.Quantity then
            Error(
              Text046,
              -ItemLedgEntry.Quantity, ItemLedgEntry.FieldCaption("Document No."),
              ItemLedgEntry."Document No.");

        if Abs(QtyBase) > -ItemLedgEntry."Shipped Qty. Not Returned" then begin
            if "Qty. per Unit of Measure" = 0 then begin
                QtyNotReturned := ItemLedgEntry."Shipped Qty. Not Returned";
                QtyReturned := ItemLedgEntry.Quantity - ItemLedgEntry."Shipped Qty. Not Returned";
            end else begin
                QtyNotReturned :=
                  Round(ItemLedgEntry."Shipped Qty. Not Returned" / "Qty. per Unit of Measure", 0.00001);
                QtyReturned :=
                  Round(
                    (ItemLedgEntry.Quantity - ItemLedgEntry."Shipped Qty. Not Returned") /
                    "Qty. per Unit of Measure", 0.00001);
            end;
            Error(
              Text039,
              -QtyReturned, ItemLedgEntry.FieldCaption("Document No."),
              ItemLedgEntry."Document No.", -QtyNotReturned);
        end;
    end;


    procedure CalcPrepaymentToDeduct()
    begin
        if ("Qty. to Invoice" <> 0) and ("Prepmt. Amt. Inv." <> 0) then begin
            GetSalesHeader;
            if ("Prepayment %" = 100) and not IsFinalInvoice then
                "Prepmt Amt to Deduct" := GetLineAmountToHandle("Qty. to Invoice")
            else
                "Prepmt Amt to Deduct" :=
                  Round(
                    ("Prepmt. Amt. Inv." - "Prepmt Amt Deducted") *
                    "Qty. to Invoice" / (Quantity - "Quantity Invoiced"), Currency."Amount Rounding Precision")
        end else
            "Prepmt Amt to Deduct" := 0
    end;


    procedure IsFinalInvoice(): Boolean
    begin
        exit("Qty. to Invoice" = Quantity - "Quantity Invoiced");
    end;


    procedure GetLineAmountToHandle(QtyToHandle: Decimal): Decimal
    var
        LineAmount: Decimal;
        LineDiscAmount: Decimal;
    begin
        LineAmount := Round(QtyToHandle * "Unit Price", Currency."Amount Rounding Precision");
        LineDiscAmount := Round("Line Discount Amount" * QtyToHandle / Quantity, Currency."Amount Rounding Precision");
        exit(LineAmount - LineDiscAmount);
    end;


    procedure SetHasBeenShown()
    begin
        HasBeenShown := true;
    end;


    procedure TestJobPlanningLine()
    begin
        if "Job Contract Entry No." = 0 then
            exit;
        //JobPostLine.TestSalesLine(Rec);
    end;


    procedure BlockDynamicTracking(SetBlock: Boolean)
    begin
        TrackingBlocked := SetBlock;
        ReserveSalesLine.Block(SetBlock);
    end;


    procedure InitQtyToShip2()
    begin
        "Qty. to Ship" := "Outstanding Quantity";
        "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";

        //ATOLink.UpdateQtyToAsmFromSalesLine(Rec);

        CheckServItemCreation;

        "Qty. to Invoice" := MaxQtyToInvoice;
        "Qty. to Invoice (Base)" := MaxQtyToInvoiceBase;
        "VAT Difference" := 0;

        CalcInvDiscToInvoice;
        CalcPrepaymentToDeduct;
    end;

    //LKS-Raj Commented (Page Missing)
    // 
    // procedure ShowLineComments()
    // var
    //     SalesCommentLine: Record "Sales Comment Line";
    //     SalesCommentSheet: Page "Sales Comment Sheet";
    // begin
    //     TestField("Document No.");
    //     TestField("Line No.");
    //     SalesCommentLine.SetRange("Document Type", "Document Type");
    //     SalesCommentLine.SetRange("No.", "Document No.");
    //     SalesCommentLine.SetRange("Document Line No.", "Line No.");
    //     SalesCommentSheet.SetTableView(SalesCommentLine);
    //     SalesCommentSheet.RunModal;
    // end;
    //LKS-Raj Commented (Page Missing)

    procedure SetDefaultQuantity()
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;
        if SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank then begin
            if ("Document Type" = "Document Type"::Order) or ("Document Type" = "Document Type"::Quote) then begin
                "Qty. to Ship" := 0;
                "Qty. to Ship (Base)" := 0;
                "Qty. to Invoice" := 0;
                "Qty. to Invoice (Base)" := 0;
            end;
            if "Document Type" = "Document Type"::"Return Order" then begin
                "Return Qty. to Receive" := 0;
                "Return Qty. to Receive (Base)" := 0;
                "Qty. to Invoice" := 0;
                "Qty. to Invoice (Base)" := 0;
            end;
        end;
    end;


    procedure UpdatePrePaymentAmounts()
    var
        ShipmentLine: Record "Sales Shipment Line";
        SalesOrderLine: Record "Sales Line";
        SalesOrderHeader: Record "Sales Header";
    begin
        if not ShipmentLine.Get("Shipment No.", "Shipment Line No.") then begin
            "Prepmt Amt to Deduct" := 0;
            "Prepmt VAT Diff. to Deduct" := 0;
        end else begin
            if SalesOrderLine.Get(SalesOrderLine."Document Type"::Order, ShipmentLine."Order No.", ShipmentLine."Order Line No.") then begin
                if ("Prepayment %" = 100) and (Quantity <> SalesOrderLine.Quantity - SalesOrderLine."Quantity Invoiced") then
                    "Prepmt Amt to Deduct" := "Line Amount"
                else
                    "Prepmt Amt to Deduct" :=
                      Round((SalesOrderLine."Prepmt. Amt. Inv." - SalesOrderLine."Prepmt Amt Deducted") *
                        Quantity / (SalesOrderLine.Quantity - SalesOrderLine."Quantity Invoiced"), Currency."Amount Rounding Precision");
                "Prepmt VAT Diff. to Deduct" := "Prepayment VAT Difference" - "Prepmt VAT Diff. Deducted";
                SalesOrderHeader.Get(SalesOrderHeader."Document Type"::Order, SalesOrderLine."Document No.");
            end else begin
                "Prepmt Amt to Deduct" := 0;
                "Prepmt VAT Diff. to Deduct" := 0;
            end;
        end;

        GetSalesHeader;
        SalesHeader.TestField("Prices Including VAT", SalesOrderHeader."Prices Including VAT");
        if SalesHeader."Prices Including VAT" then begin
            "Prepmt. Amt. Incl. VAT" := "Prepmt Amt to Deduct";
            "Prepayment Amount" :=
              Round(
                "Prepmt Amt to Deduct" / (1 + ("Prepayment VAT %" / 100)),
                Currency."Amount Rounding Precision");
        end else begin
            "Prepmt. Amt. Incl. VAT" :=
              Round(
                "Prepmt Amt to Deduct" * (1 + ("Prepayment VAT %" / 100)),
                Currency."Amount Rounding Precision");
            "Prepayment Amount" := "Prepmt Amt to Deduct";
        end;
        "Prepmt. Line Amount" := "Prepmt Amt to Deduct";
        "Prepmt. Amt. Inv." := "Prepmt. Line Amount";
        "Prepmt. VAT Base Amt." := "Prepayment Amount";
        "Prepmt. Amount Inv. Incl. VAT" := "Prepmt. Amt. Incl. VAT";
        "Prepmt Amt Deducted" := 0;
    end;


    procedure ZeroAmountLine(QtyType: Option General,Invoicing,Shipping): Boolean
    begin
        if Type = Type::" " then
            exit(true);
        if Quantity = 0 then
            exit(true);
        if "Unit Price" = 0 then
            exit(true);
        if QtyType = QtyType::Invoicing then
            if "Qty. to Invoice" = 0 then
                exit(true);
        exit(false);
    end;


    procedure FilterLinesWithItemToPlan(var Item: Record Item; DocumentType: Option)
    begin
        Reset;
        SetCurrentKey("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date");
        SetRange("Document Type", DocumentType);
        SetRange(Type, Type::Item);
        SetRange("No.", Item."No.");
        SetFilter("Variant Code", Item.GetFilter("Variant Filter"));
        SetFilter("Location Code", Item.GetFilter("Location Filter"));
        SetFilter("Drop Shipment", Item.GetFilter("Drop Shipment Filter"));
        SetFilter("Shortcut Dimension 1 Code", Item.GetFilter("Global Dimension 1 Filter"));
        SetFilter("Shortcut Dimension 2 Code", Item.GetFilter("Global Dimension 2 Filter"));
        SetFilter("Shipment Date", Item.GetFilter("Date Filter"));
        SetFilter("Outstanding Qty. (Base)", '<>0');
    end;


    procedure FindLinesWithItemToPlan(var Item: Record Item; DocumentType: Option): Boolean
    begin
        FilterLinesWithItemToPlan(Item, DocumentType);
        exit(Find('-'));
    end;


    procedure LinesWithItemToPlanExist(var Item: Record Item; DocumentType: Option): Boolean
    begin
        FilterLinesWithItemToPlan(Item, DocumentType);
        exit(not IsEmpty);
    end;

    local procedure DateFormularZero(var DateFormularValue: DateFormula; CalledByFieldNo: Integer; CalledByFieldCaption: Text[250])
    var
        DateFormularZero: DateFormula;
    begin
        Evaluate(DateFormularZero, '<0D>');
        if (DateFormularValue <> DateFormularZero) and (CalledByFieldNo = CurrFieldNo) then
            Error(Text051, CalledByFieldCaption, FieldCaption("Drop Shipment"));
        Evaluate(DateFormularValue, '<0D>');
    end;

    local procedure InitQtyToAsm()
    begin
        if not IsAsmToOrderAllowed then begin
            "Qty. to Assemble to Order" := 0;
            "Qty. to Asm. to Order (Base)" := 0;
            exit;
        end;

        if ((xRec."Qty. to Asm. to Order (Base)" = 0) and IsAsmToOrderRequired and ("Qty. Shipped (Base)" = 0)) or
           ((xRec."Qty. to Asm. to Order (Base)" <> 0) and
            (xRec."Qty. to Asm. to Order (Base)" = xRec."Quantity (Base)")) or
           ("Qty. to Asm. to Order (Base)" > "Quantity (Base)")
        then begin
            "Qty. to Assemble to Order" := Quantity;
            "Qty. to Asm. to Order (Base)" := "Quantity (Base)";
        end;
    end;


    procedure AsmToOrderExists(var AsmHeader: Record "Assembly Header"): Boolean
    var
        ATOLink: Record "Assemble-to-Order Link";
    begin
        /*
        IF NOT ATOLink.AsmExistsForSalesLine(Rec) THEN
          EXIT(FALSE);
        EXIT(AsmHeader.GET(ATOLink."Assembly Document Type",ATOLink."Assembly Document No."));
         */

    end;


    procedure FullQtyIsForAsmToOrder(): Boolean
    begin
        if "Qty. to Asm. to Order (Base)" = 0 then
            exit(false);
        exit("Quantity (Base)" = "Qty. to Asm. to Order (Base)");
    end;

    local procedure FullReservedQtyIsForAsmToOrder(): Boolean
    begin
        if "Qty. to Asm. to Order (Base)" = 0 then
            exit(false);
        CalcFields("Reserved Qty. (Base)");
        exit("Reserved Qty. (Base)" = "Qty. to Asm. to Order (Base)");
    end;


    procedure QtyBaseOnATO(): Decimal
    var
        AsmHeader: Record "Assembly Header";
    begin
        if AsmToOrderExists(AsmHeader) then
            exit(AsmHeader."Quantity (Base)");
        exit(0);
    end;


    procedure QtyAsmRemainingBaseOnATO(): Decimal
    var
        AsmHeader: Record "Assembly Header";
    begin
        if AsmToOrderExists(AsmHeader) then
            exit(AsmHeader."Remaining Quantity (Base)");
        exit(0);
    end;


    procedure QtyToAsmBaseOnATO(): Decimal
    var
        AsmHeader: Record "Assembly Header";
    begin
        if AsmToOrderExists(AsmHeader) then
            exit(AsmHeader."Quantity to Assemble (Base)");
        exit(0);
    end;


    procedure IsAsmToOrderAllowed(): Boolean
    begin
        if not ("Document Type" in ["Document Type"::Quote, "Document Type"::"Blanket Order", "Document Type"::Order]) then
            exit(false);
        if Quantity < 0 then
            exit(false);
        if Type <> Type::Item then
            exit(false);
        if "No." = '' then
            exit(false);
        if "Drop Shipment" or "Special Order" then
            exit(false);
        exit(true)
    end;


    procedure IsAsmToOrderRequired(): Boolean
    begin
        if (Type <> Type::Item) or ("No." = '') then
            exit(false);
        GetItem;
        if GetSKU then
            exit(SKU."Assembly Policy" = SKU."Assembly Policy"::"Assemble-to-Order");
        exit(Item."Assembly Policy" = Item."Assembly Policy"::"Assemble-to-Order");
    end;


    procedure CheckAsmToOrder(AsmHeader: Record "Assembly Header")
    begin
        TestField("Qty. to Assemble to Order", AsmHeader.Quantity);
        TestField("Document Type", AsmHeader."Document Type");
        TestField(Type, Type::Item);
        TestField("No.", AsmHeader."Item No.");
        TestField("Location Code", AsmHeader."Location Code");
        TestField("Unit of Measure Code", AsmHeader."Unit of Measure Code");
        TestField("Variant Code", AsmHeader."Variant Code");
        TestField("Shipment Date", AsmHeader."Due Date");
        if "Document Type" = "Document Type"::Order then begin
            AsmHeader.CalcFields("Reserved Qty. (Base)");
            AsmHeader.TestField("Reserved Qty. (Base)", AsmHeader."Remaining Quantity (Base)");
        end;
        TestField("Qty. to Asm. to Order (Base)", AsmHeader."Quantity (Base)");
        if "Outstanding Qty. (Base)" < AsmHeader."Remaining Quantity (Base)" then
            AsmHeader.FieldError("Remaining Quantity (Base)", StrSubstNo(Text045, AsmHeader."Remaining Quantity (Base)"));
    end;


    procedure ShowAsmToOrder()
    var
        ATOLink: Record "Assemble-to-Order Link";
    begin
        //ATOLink.ShowAsm(Rec);
    end;


    procedure ShowAsmToOrderLines()
    var
        ATOLink: Record "Assemble-to-Order Link";
    begin
        //ATOLink.ShowAsmToOrderLines(Rec);
    end;


    procedure FindOpenATOEntry(LotNo: Code[20]; SerialNo: Code[20]): Integer
    var
        PostedATOLink: Record "Posted Assemble-to-Order Link";
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        /*
        TESTFIELD("Document Type","Document Type"::Order);
        IF PostedATOLink.FindLinksFromSalesLine(Rec) THEN
          REPEAT
            ItemLedgEntry.SETRANGE("Document Type",ItemLedgEntry."Document Type"::"Posted Assembly");
            ItemLedgEntry.SETRANGE("Document No.",PostedATOLink."Assembly Document No.");
            ItemLedgEntry.SETRANGE("Document Line No.",0);
            ItemLedgEntry.SETRANGE("Serial No.",SerialNo);
            ItemLedgEntry.SETRANGE("Lot No.",LotNo);
            ItemLedgEntry.SETRANGE(Open,TRUE);
            IF ItemLedgEntry.FINDFIRST THEN
              EXIT(ItemLedgEntry."Entry No.");
          UNTIL PostedATOLink.NEXT = 0;
        */

    end;


    procedure RollUpAsmCost()
    begin
        //ATOLink.RollUpCost(Rec);
    end;


    procedure RollupAsmPrice()
    begin
        GetSalesHeader;
        //ATOLink.RollUpPrice(SalesHeader,Rec);
    end;

    local procedure InitICPartner()
    var
        ICPartner: Record "IC Partner";
        ItemCrossReference: Record "Item Cross Reference";
    begin
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


    procedure OutstandingInvoiceAmountFromShipment(SellToCustomerNo: Code[20]): Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetCurrentKey("Document Type", "Sell-to Customer No.", "Shipment No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
        SalesLine.SetRange("Sell-to Customer No.", SellToCustomerNo);
        SalesLine.SetFilter("Shipment No.", '<>%1', '');
        SalesLine.CalcSums("Outstanding Amount (LCY)");
        exit(SalesLine."Outstanding Amount (LCY)");
    end;

    local procedure CheckShipmentRelation()
    var
        SalesShptLine: Record "Sales Shipment Line";
    begin
        SalesShptLine.Get("Shipment No.", "Shipment Line No.");
        if (Quantity * SalesShptLine."Qty. Shipped Not Invoiced") < 0 then
            FieldError("Qty. to Invoice", Text057);
        if Abs(Quantity) > Abs(SalesShptLine."Qty. Shipped Not Invoiced") then
            Error(Text058, SalesShptLine."Document No.");
    end;

    local procedure CheckRetRcptRelation()
    var
        ReturnRcptLine: Record "Return Receipt Line";
    begin
        ReturnRcptLine.Get("Return Receipt No.", "Return Receipt Line No.");
        if (Quantity * (ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced")) < 0 then
            FieldError("Qty. to Invoice", Text059);
        if Abs(Quantity) > Abs(ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced") then
            Error(Text060, ReturnRcptLine."Document No.");
    end;

    local procedure VerifyItemLineDim()
    begin
        if ("Dimension Set ID" <> xRec."Dimension Set ID") and (Type = Type::Item) then
            if ("Qty. Shipped Not Invoiced" <> 0) or ("Return Rcd. Not Invd." <> 0) then
                if not Confirm(Text053, true, TableCaption) then
                    Error(Text054);
    end;


    procedure InitType()
    begin
        if "Document No." <> '' then begin
            SalesHeader.Get("Document Type", "Document No.");
            if (SalesHeader.Status = SalesHeader.Status::Released) and
               (xRec.Type in [xRec.Type::Item, xRec.Type::"Fixed Asset"])
            then
                Type := Type::" "
            else
                Type := xRec.Type;
        end;
    end;


    procedure UpdateTaxAmounts()
    var
        //IndianSalesTaxCalculate: Codeunit "Indian Sales Tax Calculate";//LKS-Raj Commented (Codeunit Missing)
        //ServiceTaxSetup: Record "Service Tax Setup";//LKS-Raj Commented (Table Missing)
        LineTaxAmount: Decimal;
        StandardDeductionAmount: Decimal;
        ItemChargeAssgntSales2: Record "Item Charge Assignment (Sales)";
        //DetailedTaxEntryBuffer: Record "Detailed Tax Entry Buffer";//LKS-Raj Commented (Table Missing)
        TotalTaxAmount: Decimal;
        TotalStdDeductionAmt: Decimal;
    begin
        /*
        TaxAreaUpdate;
        // PS34940.begin
        IF (Quantity = 0 ) OR ("Unit Price" = 0) THEN BEGIN
          "Amount Added to Tax Base" := 0;
          "Amount Added to Excise Base" := 0;
          "Service Tax Base" := 0;
        END;
        // PS34940.end
        
        IF "Amount Added to Excise Base" <> 0 THEN
          "Excise Base Amount" := "Amount Added to Excise Base";
        UpdateExciseAmount;
        IF "Amount Added to Tax Base" <> 0 THEN BEGIN
          "Tax Liable" := SalesHeader."Tax Liable";
          "Tax Base Amount" := "Amount Added to Tax Base";
        END ELSE BEGIN
          "Tax Liable" := FALSE;
          "Tax Base Amount" := ROUND("Line Amount" - "Inv. Discount Amount",Currency."Amount Rounding Precision");
          IF "TCS Nature of Collection" = '' THEN
            "Amount To Customer" :=
              ROUND("Line Amount" + "Excise Amount" - "Inv. Discount Amount" + "Charges To Customer" -
                "Bal. TDS/TCS Including SHECESS" + "Service Tax Amount" + "Service Tax eCess Amount" +
                "Service Tax SHE Cess Amount",Currency."Amount Rounding Precision")
          ELSE
            "Amount To Customer" := ROUND("Line Amount" + "Excise Amount" - "Inv. Discount Amount" + "Charges To Customer" +
                "Bal. TDS/TCS Including SHECESS" + "Service Tax Amount" + "Service Tax eCess Amount" +
                "Service Tax SHE Cess Amount",Currency."Amount Rounding Precision")
        END;
        
        IndianSalesTaxCalculate.SetCurrency("Currency Code" <> '');
        // PS36451.begin
        // "Amount Including Tax" := ROUND("Tax Base Amount" +
        // IndianSalesTaxCalculate.CalculateTax(
        // "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
        // "Tax Base Amount",Quantity,SalesHeader."Currency Factor","Form Code"),Currency."Amount Rounding Precision");
        LineTaxAmount := IndianSalesTaxCalculate.CalculateTax(
            "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
            "Tax Base Amount",Quantity,SalesHeader."Currency Factor","Form Code","Tax %");
        TotalTaxAmount := 0;
        TotalStdDeductionAmt := 0;
        IF LineTaxAmount <> 0 THEN
          IF Type <> Type::"Charge (Item)" THEN
            IndianSalesTaxCalculate.GetStandardDeductionAmt(Rec,StandardDeductionAmount,LineTaxAmount)
          ELSE BEGIN
            DetailedTaxEntryBuffer.RESET;
            DetailedTaxEntryBuffer.SETRANGE("Document Type","Document Type");
            DetailedTaxEntryBuffer.SETRANGE("Document No.","Document No.");
            DetailedTaxEntryBuffer.SETRANGE("Line No.","Line No.");
            DetailedTaxEntryBuffer.DELETEALL;
        
            ItemChargeAssgntSales2.RESET;
            ItemChargeAssgntSales2.SETRANGE("Document Type","Document Type");
            ItemChargeAssgntSales2.SETRANGE("Document No.","Document No.");
            ItemChargeAssgntSales2.SETRANGE("Document Line No.","Line No.");
            ItemChargeAssgntSales2.SETFILTER("Qty. to Assign",'<>0');
            IF ItemChargeAssgntSales2.FINDSET THEN BEGIN
              REPEAT
                IndianSalesTaxCalculate.GetItemChargeStdDedAmt(Rec,StandardDeductionAmount,
                  LineTaxAmount,ItemChargeAssgntSales2);
                TotalTaxAmount += LineTaxAmount;
                TotalStdDeductionAmt += StandardDeductionAmount;
              UNTIL ItemChargeAssgntSales2.NEXT = 0;
              LineTaxAmount := TotalTaxAmount;
              StandardDeductionAmount := TotalStdDeductionAmt;
            END ELSE
              IndianSalesTaxCalculate.GetStandardDeductionAmt(Rec,StandardDeductionAmount,LineTaxAmount);
          END
          ;
        "Amount Including Tax" := ROUND("Tax Base Amount" + LineTaxAmount,Currency."Amount Rounding Precision");
        // PS36451.end
        // VSTF252133.begin
        // IF "Tax Base Amount" <> 0 THEN
        // "Tax %" :=
        // ROUND(100 * ("Amount Including Tax" - "Tax Base Amount") / "Tax Base Amount",Currency."Amount Rounding Precision")
        // ELSE
        // "Tax %" := 0;
        IF "Tax Base Amount" = 0 THEN
          "Tax %" := 0;
        // VSTF252133.end
        IF "Standard Deduction %" <> 0 THEN
          "Standard Deduction Amount" := ("Tax Base Amount" * "Standard Deduction %" / 100)
        ELSE
          "Standard Deduction Amount" := 0 ;
        
        IF SalesHeader."Export or Deemed Export" OR SalesHeader."VAT Exempted" THEN BEGIN
          "Tax %" := 0;
          "Tax Amount" := 0;
        END ELSE
          // PS36451.begin
          // "Tax Amount" := ROUND(IndianSalesTaxCalculate.CalculateTax(
          //  "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
          //  "Tax Base Amount",Quantity,SalesHeader."Currency Factor","Form Code"),Currency."Amount Rounding Precision");;
          "Tax Amount" := ROUND(LineTaxAmount - StandardDeductionAmount,Currency."Amount Rounding Precision");
        // PS36451.end
        "Amount Including Tax" := "Tax Base Amount" + "Tax Amount";
        
        ServiceTaxSetup.RESET;
        ServiceTaxSetup.SETRANGE(Code,"Service Tax Group");
        IF SalesHeader."Posting Date" = 0D THEN
          ServiceTaxSetup.SETRANGE("From Date",0D,WORKDATE)
        ELSE
          ServiceTaxSetup.SETRANGE("From Date",0D,SalesHeader."Posting Date");
        IF ServiceTaxSetup.FINDLAST THEN BEGIN
          IF (NOT SalesHeader."ST Pure Agent") AND (SalesHeader."Nature of Services" = SalesHeader."Nature of Services"::" ")
          THEN BEGIN
            "Service Tax Amount" :=
              ROUND((("Service Tax Base" *
                      ServiceTaxSetup."Service Tax %" * ((100 - ServiceTaxSetup."Abatement %") / 100)) / 100));
            "Service Tax eCess Amount" := ROUND(("Service Tax Amount" * ServiceTaxSetup."eCess %") / 100);
            "Service Tax SHE Cess Amount" := ROUND(("Service Tax Amount" * ServiceTaxSetup."SHE Cess %") / 100);
          END ELSE BEGIN
            "Service Tax Amount" := 0;
            "Service Tax eCess Amount" := 0;
            "Service Tax SHE Cess Amount" := 0;
          END;
        END ELSE BEGIN
          "Service Tax Amount" := 0;
          "Service Tax eCess Amount" := 0;
          "Service Tax SHE Cess Amount" := 0;
        END;
        */
    end;

    //LKS-Raj Commented (Table Missing)
    // local procedure TaxAreaUpdate()
    // var
    //     SalesSetup: Record "Sales & Receivables Setup";
    //     TaxLocation: Record "Tax Area Locations";
    //     BilltoCust: Record Customer;
    //     ShiptoAddr: Record "Ship-to Address";
    //     TaxGroup: Record "Tax Group";
    // begin
    //     SalesSetup.Get;
    //     GetSalesHeader;
    //     if TaxGroup.Get("Tax Group Code") then;
    //     TaxLocation.SetRange("Dispatch / Receiving Location", "Location Code");
    //     if SalesSetup."Tax Dependency Type" = SalesSetup."Tax Dependency Type"::"Bill To Customer" then
    //         if SalesHeader."Bill-to Customer No." <> '' then begin
    //             BilltoCust.Get(SalesHeader."Bill-to Customer No.");
    //             State := BilltoCust."State Code";
    //             TaxLocation.SetRange("Customer / Vendor Location", BilltoCust."State Code");
    //             TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //             if TaxGroup."VAT Applicable" then
    //                 TaxLocation.SetRange("VAT Applicable", true);
    //             if TaxLocation.FindFirst then
    //                 "Tax Area Code" := TaxLocation."Tax Area Code";
    //         end;
    //     if SalesSetup."Tax Dependency Type" = SalesSetup."Tax Dependency Type"::"Ship To Customer" then begin
    //         if SalesHeader."Ship-to Code" <> '' then begin
    //             ShiptoAddr.Get(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code");
    //             TaxLocation.SetRange("Customer / Vendor Location", ShiptoAddr.State);
    //             TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //             if TaxGroup."VAT Applicable" then
    //                 TaxLocation.SetRange("VAT Applicable", true);
    //             if TaxLocation.FindFirst then
    //                 "Tax Area Code" := TaxLocation."Tax Area Code";
    //         end else
    //             if SalesHeader."Sell-to Customer No." <> '' then begin
    //                 BilltoCust.Get(SalesHeader."Sell-to Customer No.");
    //                 State := BilltoCust."State Code";
    //                 TaxLocation.SetRange("Customer / Vendor Location", BilltoCust."State Code");
    //                 TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //                 if TaxGroup."VAT Applicable" then
    //                     TaxLocation.SetRange("VAT Applicable", true);
    //                 if TaxLocation.FindFirst then
    //                     "Tax Area Code" := TaxLocation."Tax Area Code";
    //             end;
    //     end;
    // end;

    // 
    // procedure CalculateStructures(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     //StrOrderDetails: Record "Structure Order Details";//LKS-Raj Commented (Table Missing)
    //     //StrOrderLineDetails: Record "Structure Order Line Details";//LKS-Raj Commented (Table Missing)
    //     //StrOrderLines: Record "Structure Order Line Details";//LKS-Raj Commented (Table Missing)
    //     TotalAmount: Decimal;
    //     TotalLines: Decimal;
    //     BaseAmount: Decimal;
    //     OriginalCurrencyFactor: Decimal;
    // begin
    //     with SalesHeader do begin
    //         if "Currency Code" = '' then
    //             Currency.InitRoundingPrecision
    //         else begin
    //             TestField("Currency Factor");
    //             Currency.Get("Currency Code");
    //             Currency.TestField("Amount Rounding Precision");
    //         end;

    //         // VSTF208180.begin
    //         if "Currency Factor" <> 0 then
    //             CFactor := "Currency Factor"
    //         else
    //             CFactor := 1;
    //         OriginalCurrencyFactor := CFactor;
    //         // VSTF208180.end
    //         // VSTF208159.begin
    //         TempRG23DRemainder.DeleteAll;
    //         TempRG23DConsumedInCurrDoc.DeleteAll;
    //         // VSTF208159.end
    //         // VSTF203964.begin
    //         ExecuteDetailRg23D := ((not Ship) and (not Invoice)) or Invoice;
    //         // VSTF203964.end
    //         StrOrderLines.LockTable;
    //         StrOrderLineDetails.LockTable;
    //         StrOrderLines.Reset;
    //         StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
    //         StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
    //         StrOrderLines.SetRange("Document Type", "Document Type");
    //         StrOrderLines.SetRange("Document No.", "No.");
    //         StrOrderLines.SetRange("Price Inclusive of Tax", false);
    //         if not Trading then
    //             StrOrderLines.SetRange("Manually Changed", false);
    //         if StrOrderLines.FindFirst then
    //             StrOrderLines.DeleteAll(true);

    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetFilter(Type, '%1|%2|%3', SalesLine.Type::Item, SalesLine.Type::"Fixed Asset", SalesLine.Type::Resource);
    //         SalesLine.SetRange("Price Inclusive of Tax", false);
    //         if SalesLine.Find('-') then
    //             repeat
    //                 TotalAmount := TotalAmount + (SalesLine.Quantity * SalesLine."Unit Price");
    //             until SalesLine.Next = 0;

    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetRange("Price Inclusive of Tax", false);
    //         if SalesLine.Find('-') then begin
    //             TotalLines := SalesLine.Count;
    //             repeat
    //                 // PS58830.begin
    //                 if (SalesLine.Quantity <> 0) and (SalesLine."Unit Price" <> 0) then begin
    //                     // PS58830.end
    //                     with SalesLine do begin
    //                         "Amount Added to Excise Base" := 0;
    //                         "Amount Added to Tax Base" := 0;
    //                         "VAT Base Amount" := 0;
    //                         AssessableValueCalc := CheckAssessableValue(SalesHeader); // PS38000
    //                         CVD := false;
    //                         StrOrderDetails.Reset;
    //                         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                         StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                         StrOrderDetails.SetRange("Document Type", "Document Type");
    //                         StrOrderDetails.SetRange("Document No.", "Document No.");
    //                         StrOrderDetails.SetRange("Document Line No.", 0);
    //                         if StrOrderDetails.Find('-') then
    //                             repeat
    //                                 // VSTF208180.begin
    //                                 if not StrOrderDetails.LCY then
    //                                     CFactor := 1;
    //                                 // VSTF208180.end
    //                                 StrOrderLineDetails.Reset;
    //                                 StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                                 StrOrderLineDetails.SetRange("Calculation Order", StrOrderDetails."Calculation Order");
    //                                 StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                                 StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                                 StrOrderLineDetails.SetRange("Structure Code", Structure);
    //                                 StrOrderLineDetails.SetRange("Item No.", "No.");
    //                                 StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                                 if not StrOrderLineDetails.FindFirst then begin
    //                                     StrOrderLineDetails.Init;
    //                                     StrOrderLineDetails.Type := StrOrderDetails.Type;
    //                                     StrOrderLineDetails."Document Type" := StrOrderDetails."Document Type";
    //                                     StrOrderLineDetails."Document No." := StrOrderDetails."Document No.";
    //                                     StrOrderLineDetails."Structure Code" := StrOrderDetails."Structure Code";
    //                                     StrOrderLineDetails."Item No." := "No.";
    //                                     StrOrderLineDetails."Line No." := "Line No.";
    //                                     StrOrderLineDetails."Calculation Order" := StrOrderDetails."Calculation Order";
    //                                     StrOrderLineDetails."Tax/Charge Type" := StrOrderDetails."Tax/Charge Type";
    //                                     StrOrderLineDetails."Tax/Charge Group" := StrOrderDetails."Tax/Charge Group";
    //                                     StrOrderLineDetails."Tax/Charge Code" := StrOrderDetails."Tax/Charge Code";
    //                                     StrOrderLineDetails."Calculation Type" := StrOrderDetails."Calculation Type";
    //                                     StrOrderLineDetails."Calculation Value" := StrOrderDetails."Calculation Value";
    //                                     StrOrderLineDetails."Quantity Per" := StrOrderDetails."Quantity Per";
    //                                     StrOrderLineDetails."Loading on Inventory" := StrOrderDetails."Loading on Inventory";
    //                                     StrOrderLineDetails."% Loading on Inventory" := StrOrderDetails."% Loading on Inventory";
    //                                     StrOrderLineDetails."Header/Line" := StrOrderDetails."Header/Line";
    //                                     StrOrderLineDetails."Include Base" := StrOrderDetails."Include Base";
    //                                     StrOrderLineDetails."Include Line Discount" := StrOrderDetails."Include Line Discount";
    //                                     StrOrderLineDetails."Include Invoice Discount" := StrOrderDetails."Include Invoice Discount";
    //                                     StrOrderLineDetails."Payable to Third Party" := StrOrderDetails."Payable to Third Party";
    //                                     StrOrderLineDetails.LCY := StrOrderDetails.LCY;
    //                                     StrOrderLineDetails."Available for VAT input" := StrOrderDetails."Available for VAT Input";
    //                                     StrOrderLineDetails.CVD := StrOrderDetails.CVD;
    //                                     if StrOrderDetails."Payable to Third Party" then
    //                                         StrOrderDetails.TestField("Third Party Code");
    //                                     StrOrderLineDetails."Third Party Code" := StrOrderDetails."Third Party Code";
    //                                     if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                         (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                     then
    //                                         StrOrderDetails.TestField("Account No.");
    //                                     StrOrderLineDetails."Account No." := StrOrderDetails."Account No.";
    //                                     StrOrderLineDetails."Base Formula" := StrOrderDetails."Base Formula";
    //                                     if StrOrderLineDetails."Base Formula" <> '' then
    //                                         BaseAmount := EvaluateExpressioninStructures(true, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails)
    //                                     else
    //                                         BaseAmount := 0;

    //                                     if StrOrderDetails."Include Base" then
    //                                         BaseAmount := BaseAmount + Quantity * "Unit Price";
    //                                     if StrOrderDetails."Include Line Discount" then
    //                                         BaseAmount := BaseAmount - "Line Discount Amount";
    //                                     if StrOrderDetails."Include Invoice Discount" then
    //                                         BaseAmount := BaseAmount - "Inv. Discount Amount";

    //                                     // VSTF208180.begin
    //                                     // IF SalesHeader."Currency Factor" <> 0 THEN
    //                                     // CFactor := SalesHeader."Currency Factor"
    //                                     // ELSE
    //                                     // CFactor := 1;
    //                                     //
    //                                     // IF NOT StrOrderDetails.LCY THEN
    //                                     // CFactor := 1;
    //                                     // VSTF208180.end

    //                                     if (Type <> Type::"Charge (Item)") and (Type <> Type::"G/L Account") then
    //                                         if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                             (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                         then begin
    //                                             if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" then begin
    //                                                 // VSTF208180.begin
    //                                                 if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges then
    //                                                     StrOrderDetails.TestField("Charge Basis");
    //                                                 // VSTF208180.end
    //                                                 if StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Amount then begin
    //                                                     StrOrderLineDetails."Base Amount" := Quantity * "Unit Price";
    //                                                     StrOrderLineDetails.Amount :=
    //                                                       (StrOrderDetails."Calculation Value" * CFactor) * (Quantity * "Unit Price") / TotalAmount;
    //                                                 end;
    //                                                 if StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Equally then begin
    //                                                     StrOrderLineDetails."Base Amount" := 0;
    //                                                     StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor) / TotalLines;
    //                                                 end;
    //                                             end;
    //                                             if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage then begin
    //                                                 StrOrderLineDetails."Base Amount" := BaseAmount;
    //                                                 // VSTF208180.begin
    //                                                 StrOrderLineDetails.Amount := StrOrderDetails."Calculation Value" * BaseAmount / 100;
    //                                                 // VSTF208180.end
    //                                             end;
    //                                             if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" then begin
    //                                                 StrOrderLineDetails."Base Amount" := 0;
    //                                                 StrOrderLineDetails.Amount :=
    //                                                   (StrOrderDetails."Calculation Value" * CFactor) * Quantity / StrOrderDetails."Quantity Per";
    //                                             end;
    //                                         end;
    //                                     if Type in [Type::"Charge (Item)", Type::"G/L Account"] then
    //                                         if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise then
    //                                             if Trading then begin
    //                                                 // VSTF203964.begin
    //                                                 if ExecuteDetailRg23D then begin
    //                                                     // VSTF203964.end
    //                                                     // VSTF208159.begin
    //                                                     // CVD := GetBaseAmount(BaseAmount,SalesLine,SalesHeader."Applies-to Doc. No.");
    //                                                     CVD := GetBaseAmount(BaseAmount, SalesLine);
    //                                                     // VSTF208159.end
    //                                                     "Amount Added to Excise Base" := BaseAmount;
    //                                                     UpdateTaxAmounts;
    //                                                     StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                     StrOrderLineDetails.Amount := "Excise Amount";
    //                                                     // VSTF203964.begin
    //                                                 end;
    //                                                 // VSTF203964.end
    //                                             end else begin
    //                                                 "Amount Added to Excise Base" := BaseAmount;
    //                                                 CVD := StrOrderDetails.CVD;
    //                                                 if CVD and ("CIF Amount" + "BCD Amount" <> 0) then
    //                                                     // PS35955.begin
    //                                                     // "Amount Added to Excise Base" := "CIF Amount" +  "BCD Amount";
    //                                                     "Amount Added to Excise Base" := ("CIF Amount" + "BCD Amount") * Quantity;
    //                                                 // VSTF240612.begin
    //                                                 // PS35955.end
    //                                                 // PS38000.Begin
    //                                                 // IF AssessableValueCalc AND (NOT CVD) THEN
    //                                                 // "Excise Base Amount" := "Assessable Value" * Quantity;
    //                                                 if AssessableValueCalc and (not CVD) then begin
    //                                                     "Amount Added to Excise Base" := "Assessable Value" * Quantity;
    //                                                     "Excise Base Amount" := "Assessable Value" * Quantity;
    //                                                 end;
    //                                                 // PS38000.End
    //                                                 // VSTF240612.end
    //                                                 UpdateTaxAmounts;
    //                                                 StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                 StrOrderLineDetails.Amount := "Excise Amount";
    //                                             end;

    //                                     if Type in [Type::Item, Type::"Fixed Asset"] then
    //                                         if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise then
    //                                             if Trading then begin
    //                                                 // VSTF203964.begin
    //                                                 if ExecuteDetailRg23D then begin
    //                                                     // VSTF203964.end
    //                                                     // VSTF208159.begin
    //                                                     // CVD := GetBaseAmount(BaseAmount,SalesLine,SalesHeader."Applies-to Doc. No.");
    //                                                     CVD := GetBaseAmount(BaseAmount, SalesLine);
    //                                                     // VSTF208159.end
    //                                                     if not MRP then
    //                                                         "Amount Added to Excise Base" := BaseAmount
    //                                                     else
    //                                                         TestField(MRP, false);
    //                                                     UpdateTaxAmounts;
    //                                                     StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                     StrOrderLineDetails.Amount := "Excise Amount";
    //                                                     // VSTF203964.begin
    //                                                 end;
    //                                                 // VSTF203964.end
    //                                             end else begin
    //                                                 if not MRP then
    //                                                     "Amount Added to Excise Base" := BaseAmount
    //                                                 else begin
    //                                                     if StrOrderDetails.CVD then
    //                                                         TestField(MRP, false);
    //                                                     "Amount Added to Excise Base" := "MRP Price" * "Quantity (Base)" * (1 - "Abatement %" / 100);
    //                                                 end;
    //                                                 CVD := StrOrderDetails.CVD;
    //                                                 if CVD and ("CIF Amount" + "BCD Amount" <> 0) then
    //                                                     // PS35955.begin
    //                                                     // "Amount Added to Excise Base" := "CIF Amount" +  "BCD Amount";
    //                                                     "Amount Added to Excise Base" := ("CIF Amount" + "BCD Amount") * Quantity;
    //                                                 // VSTF240612.begin
    //                                                 // PS35955.end
    //                                                 // UpdateTaxAmounts;
    //                                                 // PS38000.Begin
    //                                                 // IF AssessableValueCalc AND (NOT CVD) AND (NOT MRP) THEN
    //                                                 // "Excise Base Amount" := "Assessable Value" * Quantity;
    //                                                 if AssessableValueCalc and (not CVD) and (not MRP) then begin
    //                                                     "Amount Added to Excise Base" := "Assessable Value" * Quantity;
    //                                                     "Excise Base Amount" := "Assessable Value" * Quantity;
    //                                                 end;
    //                                                 UpdateTaxAmounts;
    //                                                 // PS38000.End
    //                                                 // VSTF240612.end
    //                                                 StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                 StrOrderLineDetails.Amount := "Excise Amount";
    //                                             end;
    //                                     if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" then begin
    //                                         "Amount Added to Tax Base" := Round(BaseAmount, Currency."Amount Rounding Precision");
    //                                         UpdateTaxAmounts;
    //                                         StrOrderLineDetails."Base Amount" := "Tax Base Amount";
    //                                         StrOrderLineDetails.Amount := "Amount Including Tax" - "Tax Base Amount";
    //                                     end;
    //                                     if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Service Tax" then begin
    //                                         // IN0062.begin
    //                                         if "Transaction No. Serv. Tax" <> 0 then
    //                                             "Service Tax Base" := Round(BaseAmount)
    //                                         else
    //                                             "Service Tax Base" := Round(BaseAmount, Currency."Amount Rounding Precision");
    //                                         // IN0062.end
    //                                         UpdateTaxAmounts;
    //                                         StrOrderLineDetails."Base Amount" := "Service Tax Base";
    //                                         StrOrderLineDetails.Amount := Round("Service Tax Amount" + "Service Tax eCess Amount" +
    //                                             "Service Tax SHE Cess Amount");
    //                                     end;

    //                                     if "Free Supply" then begin
    //                                         if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                             (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                         then
    //                                             StrOrderDetails.TestField("Third Party Code")
    //                                     end;
    //                                     if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" then
    //                                         TestField("Free Supply", false);

    //                                     // VSTF208180.begin
    //                                     // IF "Currency Factor" <> 0 THEN
    //                                     // CFactor := "Currency Factor"
    //                                     // ELSE
    //                                     // CFactor := 1;
    //                                     CFactor := OriginalCurrencyFactor;
    //                                     // VSTF208180.end

    //                                     if "Currency Code" <> '' then
    //                                         Currency.Get("Currency Code");

    //                                     StrOrderLineDetails."Amount (LCY)" := StrOrderLineDetails.Amount / CFactor;
    //                                     StrOrderLineDetails.Insert;
    //                                     // VSTF208180.begin
    //                                 end else
    //                                     if StrOrderLineDetails."Manually Changed" then begin
    //                                         if ((Type <> Type::"Charge (Item)") and
    //                                             (Type <> Type::"G/L Account"))
    //                                         then
    //                                             if (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                                (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes")
    //                                             then begin
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" then begin
    //                                                     if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges then
    //                                                         StrOrderDetails.TestField("Charge Basis");
    //                                                     if StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Amount then
    //                                                         StrOrderLineDetails.Amount := StrOrderLineDetails."Calculation Value" * CFactor;
    //                                                     if StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Equally then begin
    //                                                         StrOrderLineDetails."Base Amount" := 0;
    //                                                         StrOrderLineDetails.Amount := StrOrderLineDetails."Calculation Value" * CFactor;
    //                                                     end;
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage then begin
    //                                                     StrOrderLineDetails."Base Amount" := BaseAmount;
    //                                                     StrOrderLineDetails.Amount := StrOrderDetails."Calculation Value" * BaseAmount / 100;
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" then begin
    //                                                     StrOrderLineDetails."Base Amount" := 0;
    //                                                     StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor) * Quantity /
    //                                                       StrOrderDetails."Quantity Per";
    //                                                 end;
    //                                                 CFactor := OriginalCurrencyFactor;
    //                                                 StrOrderLineDetails."Amount (LCY)" := StrOrderLineDetails.Amount / CFactor;
    //                                                 StrOrderLineDetails.Modify;
    //                                             end;
    //                                     end;
    //                             // VSTF208180.end
    //                             until StrOrderDetails.Next = 0;
    //                     end;
    //                     // PS58830.begin
    //                 end else begin
    //                     SalesLine."Amount Added to Tax Base" := 0;
    //                     SalesLine."Tax Base Amount" := 0;
    //                     SalesLine."Tax Amount" := 0;
    //                 end;
    //                 // PS58830.end
    //                 SalesLine.Modify;
    //             until SalesLine.Next = 0;
    //         end;
    //     end;
    // end;

    // local procedure UpdateExciseAmount()
    // var
    //     ExciseProdPostingGrp: Record "Excise Prod. Posting Group";
    //     ItemUOM: Record "Item Unit of Measure";
    //     ExcisePostingSetup: Record "Excise Posting Setup";
    // begin
    //     /*
    //     GetSalesHeader;
    //     IF "Amount Added to Excise Base" <> 0 THEN BEGIN
    //       "Excise Base Amount" := "Amount Added to Excise Base";
    //       IF ExciseProdPostingGrp.GET("Excise Prod. Posting Group") THEN BEGIN
    //         IF ExciseProdPostingGrp."Unit of Measure Code" <> '' THEN BEGIN
    //           IF Type = Type::Item THEN BEGIN
    //             IF ItemUOM.GET("No.",ExciseProdPostingGrp."Unit of Measure Code") THEN BEGIN
    //               "Excise Base Quantity" := ROUND("Quantity (Base)" / ItemUOM."Qty. per Unit of Measure");
    //             END ELSE
    //               "Excise Base Quantity" := 0;
    //           END ELSE
    //             IF Type = Type::"Fixed Asset" THEN
    //               "Excise Base Quantity" := Quantity;
    //         END ELSE
    //           "Excise Base Quantity" := "Quantity (Base)";
    //       END;

    //       ExcisePostingSetup.SETRANGE("Excise Bus. Posting Group","Excise Bus. Posting Group");
    //       ExcisePostingSetup.SETRANGE("Excise Prod. Posting Group","Excise Prod. Posting Group");
    //       IF SalesHeader."Posting Date" <> 0D THEN
    //         ExcisePostingSetup.SETRANGE("From Date",0D,SalesHeader."Posting Date")
    //       ELSE
    //         ExcisePostingSetup.SETRANGE("From Date",0D,WORKDATE);
    //       IF ExcisePostingSetup.FINDLAST THEN BEGIN
    //         CASE ExcisePostingSetup."BED Calculation Type" OF
    //           ExcisePostingSetup."BED Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "BED Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."BED Calculation Formula" <> '' THEN
    //                   "BED Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."BED Calculation Formula",Rec) *
    //                     ExcisePostingSetup."BED %" / 100
    //                 ELSE
    //                   "BED Amount" := ExcisePostingSetup."BED %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."BED Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "BED Amount" := ExcisePostingSetup."BED Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."BED Calculation Type"::"% of Accessable Value":
    //             "BED Amount" := ExcisePostingSetup."BED %" * "Assessable Value" * Quantity / 100; // PS38000
    //           ExcisePostingSetup."BED Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "BED Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "BED Amount" := (ExcisePostingSetup."BED %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."BED Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."BED Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "BED Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "BED Amount" := (ExcisePostingSetup."BED %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "BED Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."SED Calculation Type" OF
    //           ExcisePostingSetup."SED Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SED Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."SED Calculation Formula" <> '' THEN
    //                   "SED Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."SED Calculation Formula",Rec) *
    //                     ExcisePostingSetup."SED %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."SED Calculation Formula" = '' THEN
    //                     "SED Amount" := ExcisePostingSetup."SED %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."SED Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "SED Amount" := ExcisePostingSetup."SED Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."SED Calculation Type"::"% of Accessable Value":
    //             "SED Amount" := ExcisePostingSetup."SED %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."SED Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SED Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "SED Amount" := (ExcisePostingSetup."SED %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."SED Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."SED Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SED Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "SED Amount" := (ExcisePostingSetup."SED %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "SED Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."AED(GSI) Calculation Type" OF
    //           ExcisePostingSetup."AED(GSI) Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(GSI) Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" <> '' THEN
    //                   "AED(GSI) Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                     ExcisePostingSetup."AED(GSI) %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" = '' THEN
    //                     "AED(GSI) Amount" := ExcisePostingSetup."AED(GSI) %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."AED(GSI) Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "AED(GSI) Amount" := ExcisePostingSetup."AED(GSI) Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."AED(GSI) Calculation Type"::"% of Accessable Value":
    //             "AED(GSI) Amount" := ExcisePostingSetup."AED(GSI) %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."AED(GSI) Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(GSI) Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "AED(GSI) Amount" := (ExcisePostingSetup."AED(GSI) %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."AED(GSI) Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."AED(GSI) Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(GSI) Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "AED(GSI) Amount" :=
    //                     (ExcisePostingSetup."AED(GSI) %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "AED(GSI) Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."NCCD Calculation Type" OF
    //           ExcisePostingSetup."NCCD Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "NCCD Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."NCCD Calculation Formula" <> '' THEN
    //                   "NCCD Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."NCCD Calculation Formula",Rec) *
    //                     ExcisePostingSetup."NCCD %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."NCCD Calculation Formula" = '' THEN
    //                     "NCCD Amount" := ExcisePostingSetup."NCCD %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."NCCD Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "NCCD Amount" := ExcisePostingSetup."NCCD Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."NCCD Calculation Type"::"% of Accessable Value":
    //             "NCCD Amount" := ExcisePostingSetup."NCCD %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."NCCD Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "NCCD Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "NCCD Amount" := (ExcisePostingSetup."NCCD %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."NCCD Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."NCCD Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "NCCD Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "NCCD Amount" := (ExcisePostingSetup."NCCD %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "NCCD Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."AED(TTA) Calculation Type" OF
    //           ExcisePostingSetup."AED(TTA) Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(TTA) Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" <> '' THEN
    //                   "AED(TTA) Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                     ExcisePostingSetup."AED(TTA) %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" = '' THEN
    //                     "AED(TTA) Amount" := ExcisePostingSetup."AED(TTA) %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."AED(TTA) Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "AED(TTA) Amount" := ExcisePostingSetup."AED(TTA) Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."AED(TTA) Calculation Type"::"% of Accessable Value":
    //             "AED(TTA) Amount" := ExcisePostingSetup."AED(TTA) %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."AED(TTA) Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(TTA) Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "AED(TTA) Amount" := (ExcisePostingSetup."AED(TTA) %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."AED(TTA) Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."AED(TTA) Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "AED(TTA) Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "AED(TTA) Amount" :=
    //                     (ExcisePostingSetup."AED(TTA) %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "AED(TTA) Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."SAED Calculation Type" OF
    //           ExcisePostingSetup."SAED Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SAED Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."SAED Calculation Formula" <> '' THEN
    //                   "SAED Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."SAED Calculation Formula",Rec)
    //                     * ExcisePostingSetup."SAED %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."SED Calculation Formula" = '' THEN
    //                     "SAED Amount" := ExcisePostingSetup."SAED %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."SAED Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "SAED Amount" := ExcisePostingSetup."SAED Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."SAED Calculation Type"::"% of Accessable Value":
    //             "SAED Amount" := ExcisePostingSetup."SAED %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."SAED Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SAED Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "SAED Amount" := (ExcisePostingSetup."SAED %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."SAED Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."SAED Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SAED Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "SAED Amount" := (ExcisePostingSetup."SAED %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "SAED Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."ADE Calculation Type" OF
    //           ExcisePostingSetup."ADE Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADE Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."ADE Calculation Formula" <> '' THEN
    //                   "ADE Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."ADE Calculation Formula",Rec) *
    //                     ExcisePostingSetup."ADE %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."ADE Calculation Formula" = '' THEN
    //                     "ADE Amount" := ExcisePostingSetup."ADE %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."ADE Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "ADE Amount" := ExcisePostingSetup."ADE Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."ADE Calculation Type"::"% of Accessable Value":
    //             "ADE Amount" := ExcisePostingSetup."ADE %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."ADE Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADE Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "ADE Amount" := (ExcisePostingSetup."ADE %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."ADE Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."ADE Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADE Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "ADE Amount" := (ExcisePostingSetup."ADE %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "ADE Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."ADET Calculation Type" OF
    //           ExcisePostingSetup."ADET Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADET Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."ADET Calculation Formula" <> '' THEN
    //                   "ADET Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."ADET Calculation Formula",Rec) *
    //                     ExcisePostingSetup."ADET %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."ADET Calculation Formula" = '' THEN
    //                     "ADET Amount" := ExcisePostingSetup."ADET %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."ADET Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "ADET Amount" := ExcisePostingSetup."ADET Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."ADET Calculation Type"::"% of Accessable Value":
    //             "ADET Amount" := ExcisePostingSetup."ADET %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."ADET Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADET Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "ADET Amount" := (ExcisePostingSetup."ADET %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."ADET Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."ADET Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "ADET Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "ADET Amount" := (ExcisePostingSetup."ADET %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "ADET Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."CESS Calculation Type" OF
    //           ExcisePostingSetup."CESS Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "CESS Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."CESS Calculation Formula" <> '' THEN
    //                   "CESS Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."CESS Calculation Formula",Rec) *
    //                     ExcisePostingSetup."CESS %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."CESS Calculation Formula" = '' THEN
    //                     "CESS Amount" := ExcisePostingSetup."CESS %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."CESS Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "CESS Amount" := ExcisePostingSetup."CESS Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."CESS Calculation Type"::"% of Accessable Value":
    //             "CESS Amount" := ExcisePostingSetup."CESS %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."CESS Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "CESS Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "CESS Amount" := (ExcisePostingSetup."CESS %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."CESS Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."CESS Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "CESS Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "CESS Amount" := (ExcisePostingSetup."CESS %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "CESS Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."eCess Calculation Type" OF
    //           ExcisePostingSetup."eCess Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "eCess Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."eCess Calculation Formula" <> '' THEN
    //                   "eCess Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."eCess Calculation Formula",Rec) *
    //                     ExcisePostingSetup."eCess %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."eCess Calculation Formula" = '' THEN
    //                     "eCess Amount" := ExcisePostingSetup."eCess %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."eCess Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "eCess Amount" := ExcisePostingSetup."eCess Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."eCess Calculation Type"::"% of Accessable Value":
    //             "eCess Amount" := ExcisePostingSetup."eCess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."eCess Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "eCess Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "eCess Amount" := (ExcisePostingSetup."eCess %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."eCess Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."eCess Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "eCess Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "eCess Amount" :=
    //                     (ExcisePostingSetup."eCess %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "eCess Amount" := 0;
    //             END;
    //         END;
    //         CASE ExcisePostingSetup."SHE Cess Calculation Type" OF
    //           ExcisePostingSetup."SHE Cess Calculation Type"::"Excise %":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SHE Cess Amount" := 0
    //               ELSE
    //                 IF ExcisePostingSetup."SHE Cess Calculation Formula" <> '' THEN
    //                   "SHE Cess Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."SHE Cess Calculation Formula",Rec) *
    //                     ExcisePostingSetup."SHE Cess %" / 100
    //                 ELSE
    //                   IF ExcisePostingSetup."SHE Cess Calculation Formula" = '' THEN
    //                     "SHE Cess Amount" := ExcisePostingSetup."SHE Cess %" * "Excise Base Amount" / 100;
    //             END;
    //           ExcisePostingSetup."SHE Cess Calculation Type"::"Amount/Unit":
    //             BEGIN
    //               TESTFIELD("Excise Base Quantity");
    //               "SHE Cess Amount" := ExcisePostingSetup."SHE Cess Amount Per Unit" * "Excise Base Quantity";
    //             END;
    //           ExcisePostingSetup."SHE Cess Calculation Type"::"% of Accessable Value":
    //             "SHE Cess Amount" := ExcisePostingSetup."SHE Cess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //           ExcisePostingSetup."SHE Cess Calculation Type"::"Excise %+Amount/Unit":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SHE Cess Amount" := 0
    //               ELSE BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "SHE Cess Amount" := (ExcisePostingSetup."SHE Cess %" * "Excise Base Amount" / 100) +
    //                   (ExcisePostingSetup."SHE Cess Amount Per Unit" * "Excise Base Quantity");
    //               END;
    //             END;
    //           ExcisePostingSetup."SHE Cess Calculation Type"::"% of MRP":
    //             BEGIN
    //               IF Quantity = 0 THEN
    //                 "SHE Cess Amount" := 0
    //               ELSE
    //                 IF MRP THEN
    //                   "SHE Cess Amount" :=
    //                     (ExcisePostingSetup."SHE Cess %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                 ELSE
    //                   "SHE Cess Amount" := 0;
    //             END;
    //         END;
    //         IF CVD THEN BEGIN
    //           CASE ExcisePostingSetup."Custom eCess Calculation Type" OF
    //             ExcisePostingSetup."Custom eCess Calculation Type"::"Excise %":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "Custom eCess Amount" := 0
    //                 ELSE
    //                   IF ExcisePostingSetup."Custom eCess Calc. Formula" <> '' THEN
    //                     "Custom eCess Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."Custom eCess Calc. Formula",Rec) *
    //                       ExcisePostingSetup."Custom eCess %" / 100
    //                   ELSE
    //                     IF ExcisePostingSetup."Custom eCess Calc. Formula" = '' THEN
    //                       "Custom eCess Amount" := ExcisePostingSetup."Custom eCess %" * "Excise Base Amount" / 100;
    //               END;
    //             ExcisePostingSetup."Custom eCess Calculation Type"::"Amount/Unit":
    //               BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "Custom eCess Amount" := ExcisePostingSetup."Custom eCess Amount Per Unit" * "Excise Base Quantity";
    //               END;
    //             ExcisePostingSetup."Custom eCess Calculation Type"::"% of Accessable Value":
    //               "Custom eCess Amount" := ExcisePostingSetup."Custom eCess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //             ExcisePostingSetup."Custom eCess Calculation Type"::"Excise %+Amount/Unit":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "Custom eCess Amount" := 0
    //                 ELSE BEGIN
    //                   TESTFIELD("Excise Base Quantity");
    //                   "Custom eCess Amount" := (ExcisePostingSetup."Custom eCess %" * "Excise Base Amount" / 100) +
    //                     (ExcisePostingSetup."Custom eCess Amount Per Unit" * "Excise Base Quantity");
    //                 END;
    //               END;
    //           END;

    //           CASE ExcisePostingSetup."Custom SHECess Calc. Type" OF
    //             ExcisePostingSetup."Custom SHECess Calc. Type"::"Excise %":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "Custom SHECess Amount" := 0
    //                 ELSE
    //                   IF ExcisePostingSetup."Custom SHECess Calc. Formula" <> '' THEN
    //                     "Custom SHECess Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."Custom SHECess Calc. Formula",Rec) *
    //                       ExcisePostingSetup."Custom SHECess %" / 100
    //                   ELSE
    //                     IF ExcisePostingSetup."Custom SHECess Calc. Formula" = '' THEN
    //                       "Custom SHECess Amount" := ExcisePostingSetup."Custom SHECess %" * "Excise Base Amount" / 100;
    //               END;
    //             ExcisePostingSetup."Custom SHECess Calc. Type"::"Amount/Unit":
    //               BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "Custom SHECess Amount" := ExcisePostingSetup."Custom SHECess Amount Per Unit" * "Excise Base Quantity";
    //               END;
    //             ExcisePostingSetup."Custom SHECess Calc. Type"::"% of Accessable Value":
    //               "Custom SHECess Amount" := ExcisePostingSetup."Custom SHECess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //             ExcisePostingSetup."Custom SHECess Calc. Type"::"Excise %+Amount/Unit":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "Custom SHECess Amount" := 0
    //                 ELSE BEGIN
    //                   TESTFIELD("Excise Base Quantity");
    //                   "Custom SHECess Amount" := (ExcisePostingSetup."Custom SHECess %" * "Excise Base Amount" / 100) +
    //                     (ExcisePostingSetup."Custom SHECess Amount Per Unit" * "Excise Base Quantity");
    //                 END;
    //               END;
    //           END;

    //           CASE ExcisePostingSetup."ADC VAT Calculation Type" OF
    //             ExcisePostingSetup."ADC VAT Calculation Type"::"Excise %":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "ADC VAT Amount" := 0
    //                 ELSE
    //                   IF ExcisePostingSetup."ADC VAT Calculation Formula" <> '' THEN
    //                     "ADC VAT Amount" := EvaluateExpression(TRUE,ExcisePostingSetup."ADC VAT Calculation Formula",Rec) *
    //                       ExcisePostingSetup."ADC VAT %" / 100
    //                   ELSE
    //                     IF ExcisePostingSetup."ADC VAT Calculation Formula" = '' THEN
    //                       "ADC VAT Amount" := ExcisePostingSetup."ADC VAT %" * "Excise Base Amount" / 100;
    //               END;
    //             ExcisePostingSetup."ADC VAT Calculation Type"::"Amount/Unit":
    //               BEGIN
    //                 TESTFIELD("Excise Base Quantity");
    //                 "ADC VAT Amount" := ExcisePostingSetup."ADC VAT Amount Per Unit" * "Excise Base Quantity";
    //               END;
    //             ExcisePostingSetup."ADC VAT Calculation Type"::"% of Accessable Value":
    //               "ADC VAT Amount" := ExcisePostingSetup."ADC VAT %" * "Assessable Value" * Quantity / 100;  // PS38000
    //             ExcisePostingSetup."ADC VAT Calculation Type"::"Excise %+Amount/Unit":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "ADC VAT Amount" := 0
    //                 ELSE BEGIN
    //                   TESTFIELD("Excise Base Quantity");
    //                   "ADC VAT Amount" := (ExcisePostingSetup."ADC VAT %" * "Excise Base Amount" / 100) +
    //                     (ExcisePostingSetup."ADC VAT Amount Per Unit" * "Excise Base Quantity");
    //                 END;
    //               END;
    //             ExcisePostingSetup."ADC VAT Calculation Type"::"% of MRP":
    //               BEGIN
    //                 IF Quantity = 0 THEN
    //                   "ADC VAT Amount" := 0
    //                 ELSE
    //                   IF MRP THEN
    //                     "ADC VAT Amount" :=
    //                       (ExcisePostingSetup."ADC VAT %" * "MRP Price" * (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                   ELSE
    //                     "ADC VAT Amount" := 0;
    //               END;
    //           END;
    //         END ELSE
    //           "ADC VAT Amount" := 0;
    //       END ELSE
    //         InitExciseAmount;
    //     END ELSE
    //       InitExciseAmount;

    //     // Calculate Excise Effective %
    //     "Excise Amount" := "BED Amount" + "AED(GSI) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" + "NCCD Amount" +
    //       "eCess Amount" + "ADET Amount" + "AED(TTA) Amount" + "ADE Amount" + "SHE Cess Amount";

    //     ExcisePostingSetup.RESET;
    //     ExcisePostingSetup.SETRANGE("Excise Bus. Posting Group","Excise Bus. Posting Group");
    //     ExcisePostingSetup.SETRANGE("Excise Prod. Posting Group","Excise Prod. Posting Group");
    //     IF ExcisePostingSetup.FINDLAST THEN
    //       WITH ExcisePostingSetup DO BEGIN
    //         IF ("BED %" <> 0) AND ("BED Calculation Type" = "BED Calculation Type"::"% of Accessable Value") THEN BEGIN
    //           // PS38000.begin
    //           IF ("Assessable Value" <> 0) AND (Quantity <> 0) THEN
    //             "Excise Effective Rate" := "Excise Amount" / ("Assessable Value" * Quantity) * 100;
    //           // PS38000.end
    //         END
    //         ELSE
    //           IF ("BED %" <> 0) AND (("BED Calculation Type" = "BED Calculation Type"::"% of MRP") OR
    //                                  ("BED Calculation Type" = "BED Calculation Type"::"Excise %"))
    //           THEN BEGIN
    //             IF "Excise Base Amount" <> 0 THEN
    //               "Excise Effective Rate" := "Excise Amount" / "Excise Base Amount" * 100;
    //           END;
    //         IF ("BED %" <> 0) AND ("BED Calculation Type" = "BED Calculation Type"::"Excise %") AND (NOT CVD) AND
    //            ("BED Calculation Formula" = Text13708)
    //         THEN
    //           "Excise Effective Rate" := 0;
    //       END;

    //     IF "Price Inclusive of Tax" AND ("Currency Code" = '') THEN BEGIN
    //       "BED Amount" := RoundExciseAmt("BED Amount");
    //       "AED(GSI) Amount" := RoundExciseAmt("AED(GSI) Amount");
    //       "AED(TTA) Amount" := RoundExciseAmt("AED(TTA) Amount");
    //       "SED Amount" := RoundExciseAmt("SED Amount");
    //       "SAED Amount" := RoundExciseAmt("SAED Amount");
    //       "CESS Amount" := RoundExciseAmt("CESS Amount");
    //       "NCCD Amount" := RoundExciseAmt("NCCD Amount");
    //       "eCess Amount" := RoundExciseAmt("eCess Amount");
    //       "SHE Cess Amount" := RoundExciseAmt("SHE Cess Amount");
    //       "ADET Amount" := RoundExciseAmt("ADET Amount");
    //       "ADE Amount" := RoundExciseAmt("ADE Amount");
    //       "ADC VAT Amount" := RoundExciseAmt("ADC VAT Amount");
    //     END ELSE
    //       IF "Price Inclusive of Tax" AND ("Currency Code" <> '') THEN BEGIN
    //         "BED Amount" := ROUND("BED Amount");
    //         "AED(GSI) Amount" := ROUND("AED(GSI) Amount");
    //         "AED(TTA) Amount" := ROUND("AED(TTA) Amount");
    //         "SED Amount" := ROUND("SED Amount");
    //         "SAED Amount" := ROUND("SAED Amount");
    //         "CESS Amount" := ROUND("CESS Amount");
    //         "NCCD Amount" := ROUND("NCCD Amount");
    //         "eCess Amount" := ROUND("eCess Amount");
    //         "SHE Cess Amount" := ROUND("SHE Cess Amount");
    //         "ADET Amount" := ROUND("ADET Amount");
    //         "ADE Amount" := ROUND("ADE Amount");
    //         "ADC VAT Amount" := ROUND("ADC VAT Amount");
    //       END;

    //     "Excise Amount" := "BED Amount" + "AED(GSI) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" + "NCCD Amount" +
    //       "eCess Amount" + "ADET Amount" + "AED(TTA) Amount" + "ADE Amount" + "ADC VAT Amount" + "SHE Cess Amount";
    //     "Amount Including Excise" := "Excise Base Amount" + "Excise Amount";

    //     IF SalesHeader.Trading THEN BEGIN
    //       "BED Amount" := BEDAmt;
    //       "AED(GSI) Amount" := "AED(GSI)Amt";
    //       "AED(TTA) Amount" := "AED(TTA)Amt";
    //       "SED Amount" := SEDAmt;
    //       "SAED Amount" := SAEDAmt;
    //       "CESS Amount" := CESSAmt;
    //       "NCCD Amount" := NCCDAmt;
    //       "eCess Amount" := eCessAmt;
    //       "SHE Cess Amount" := SHECessAmt;
    //       "ADET Amount" := ADETAmt;
    //       "ADE Amount" := ADEAmt;
    //       "ADC VAT Amount" := ADCVATAmt;

    //       "Excise Amount" := "BED Amount" + "AED(GSI) Amount" + "SED Amount" + "SAED Amount" + "NCCD Amount" +
    //         "eCess Amount" + "ADET Amount" + "AED(TTA) Amount" + "ADE Amount" + "ADC VAT Amount" + "SHE Cess Amount";
    //       IF NOT ExcisePostingSetup."Setoff available" THEN
    //         "Excise Amount" := "BED Amount" + "AED(GSI) Amount" + "SED Amount" + "SAED Amount" + "NCCD Amount" +
    //           "ADET Amount" + "AED(TTA) Amount" + "ADE Amount" + "ADC VAT Amount";
    //       "Amount Including Excise" := "Excise Base Amount" + "Excise Amount";
    //     END;
    //     UpdateSalesLineBuffer;
    //      */

    // end;
    //LKS-Raj Commented (Table Missing)
    local procedure InitExciseAmount()
    begin
        //LKS-Raj Commented
        // if CheckManualChangedLines then
        //     exit;

        "Excise Amount" := 0;
        "BED Amount" := 0;
        "AED(GSI) Amount" := 0;
        "AED(TTA) Amount" := 0;
        "SED Amount" := 0;
        "SAED Amount" := 0;
        "CESS Amount" := 0;
        "NCCD Amount" := 0;
        "eCess Amount" := 0;
        "ADET Amount" := 0;
        "ADE Amount" := 0;
        "SHE Cess Amount" := 0;
        "Custom eCess Amount" := 0;
        "Custom SHECess Amount" := 0;
        "ADC VAT Amount" := 0;
    end;

    local procedure EvaluateExpression(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"): Decimal
    var
        SalesLine1: Record "Sales Line";
        Result: Decimal;
        CallLevel: Integer;
        Parantheses: Integer;
        IsExpression: Boolean;
        Operators: Text[8];
        OperatorNo: Integer;
        IsFilter: Boolean;
        i: Integer;
        RightResult: Decimal;
        LeftResult: Decimal;
        RightOperand: Text[250];
        LeftOperand: Text[250];
        Operator: Char;
        DivisionError: Boolean;
    begin
        //LKS-Raj Commented (Table Missing)
        // Result := 0;
        // CallLevel := CallLevel + 1;
        // while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
        //     Expression := CopyStr(Expression, 2);

        // if Expression <> '' then
        //     while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
        //         Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
        // if StrLen(Expression) > 0 then begin
        //     Parantheses := 0;
        //     IsExpression := false;
        //     Operators := '+-*/^';
        //     OperatorNo := 1;
        //     repeat
        //         i := StrLen(Expression);
        //         repeat
        //             if Expression[i] = '(' then
        //                 Parantheses := Parantheses + 1
        //             else
        //                 if Expression[i] = ')' then
        //                     Parantheses := Parantheses - 1;
        //             if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
        //                 IsExpression := true
        //             else
        //                 i := i - 1;
        //         until IsExpression or (i <= 0);
        //         if not IsExpression then
        //             OperatorNo := OperatorNo + 1;
        //     until (OperatorNo > StrLen(Operators)) or IsExpression;
        //     if IsExpression then begin
        //         if i > 1 then begin
        //             LeftOperand := CopyStr(Expression, 1, i - 1);
        //         end else
        //             LeftOperand := '';
        //         if i < StrLen(Expression) then begin
        //             RightOperand := CopyStr(Expression, i + 1);
        //         end else
        //             RightOperand := '';
        //         Operator := Expression[i];
        //         LeftResult := EvaluateExpression(IsTestExpression, LeftOperand, SalesLine);
        //         RightResult := EvaluateExpression(IsTestExpression, RightOperand, SalesLine);
        //         case Operator of
        //             '^':
        //                 Result := Power(LeftResult, RightResult);
        //             '*':
        //                 Result := LeftResult * RightResult;
        //             '/':
        //                 if RightResult = 0 then begin
        //                     Result := 0;
        //                     DivisionError := true;
        //                 end else
        //                     Result := LeftResult / RightResult;
        //             '+':
        //                 Result := LeftResult + RightResult;
        //             '-':
        //                 Result := LeftResult - RightResult;
        //         end;
        //     end else
        //         if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
        //             Result :=
        //               EvaluateExpression(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine1)
        //         else begin
        //             IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
        //                          StrPos(Expression, '<') + StrPos(Expression, '>') +
        //                          StrPos(Expression, '=') > 0);
        //             if not IsFilter then begin
        //                 if Expression = Text13700 then
        //                     Result := Result + SalesLine."BED Amount"
        //                 else
        //                     if Expression = Text13701 then
        //                         Result := Result + SalesLine."AED(GSI) Amount" + SalesLine."AED(TTA) Amount"
        //                     else
        //                         if Expression = Text13702 then
        //                             Result := Result + SalesLine."SED Amount"
        //                         else
        //                             if Expression = Text13703 then
        //                                 Result := Result + SalesLine."SAED Amount"
        //                             else
        //                                 if Expression = Text13704 then
        //                                     Result := Result + SalesLine."CESS Amount"
        //                                 else
        //                                     if Expression = Text13705 then
        //                                         Result := Result + SalesLine."NCCD Amount"
        //                                     else
        //                                         if Expression = Text13706 then
        //                                             Result := Result + SalesLine."eCess Amount"
        //                                         else
        //                                             if Expression = Text13707 then
        //                                                 Result := Result + SalesLine."ADET Amount"
        //                                             else
        //                                                 if Expression = Text13708 then
        //                                                     Result := Result + SalesLine."Line Amount"
        //                                                 else
        //                                                     if Expression = Text13709 then
        //                                                         Result := Result + SalesLine."ADE Amount"
        //                                                     else
        //                                                         if Expression = Text13710 then
        //                                                             Result := Result + SalesLine."SHE Cess Amount"
        //                                                         else
        //                                                             if Expression = Text16501 then
        //                                                                 Result := Result + SalesLine."ADC VAT Amount"
        //                                                             else
        //                                                                 if Expression = Text16502 then
        //                                                                     Result := Result + SalesLine."BCD Amount" * SalesLine.Quantity
        //                                                                 else
        //                                                                     if Expression = Text16503 then
        //                                                                         Result := Result + SalesLine."CIF Amount" * SalesLine.Quantity
        //                                                                     else
        //                                                                         if Expression = Text16507 then
        //                                                                             Result := Result + SalesLine."Custom eCess Amount"
        //                                                                         else
        //                                                                             if Expression = Text16506 then
        //                                                                                 Result := Result + SalesLine."Custom SHECess Amount"
        //                                                                             else
        //                                                                                 if Expression = Text13711 then
        //                                                                                     Result := Result + SalesLine."Assessable Value" * SalesLine.Quantity;
        //             end;
        //         end;
        // end;
        // CallLevel := CallLevel - 1;
        // exit(Result);
        //LKS-Raj Commented (Table Missing)
    end;

    //LKS-Raj Commented (Table Missing)
    // local procedure EvaluateExpressioninStructures(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"; var StructureOrderDetails: Record "Structure Order Details"): Decimal
    // var
    //     StrOrderLineDetails2: Record "Structure Order Line Details";
    //     StructureOrderDetails1: Record "Structure Order Details";
    //     Result: Decimal;
    //     CallLevel: Integer;
    //     Parantheses: Integer;
    //     IsExpression: Boolean;
    //     Operators: Text[8];
    //     OperatorNo: Integer;
    //     IsFilter: Boolean;
    //     i: Integer;
    //     RightResult: Decimal;
    //     LeftResult: Decimal;
    //     RightOperand: Text[250];
    //     LeftOperand: Text[250];
    //     Operator: Char;
    //     DivisionError: Boolean;
    //     Exp: Integer;
    // begin
    //     Result := 0;
    //     CallLevel := CallLevel + 1;
    //     while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
    //         Expression := CopyStr(Expression, 2);
    //     if Expression <> '' then
    //         while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
    //             Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
    //     if StrLen(Expression) > 0 then begin
    //         Parantheses := 0;
    //         IsExpression := false;
    //         Operators := '+-*/^';
    //         OperatorNo := 1;
    //         repeat
    //             i := StrLen(Expression);
    //             repeat
    //                 if Expression[i] = '(' then
    //                     Parantheses := Parantheses + 1
    //                 else
    //                     if Expression[i] = ')' then
    //                         Parantheses := Parantheses - 1;
    //                 if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
    //                     IsExpression := true
    //                 else
    //                     i := i - 1;
    //             until IsExpression or (i <= 0);
    //             if not IsExpression then
    //                 OperatorNo := OperatorNo + 1;
    //         until (OperatorNo > StrLen(Operators)) or IsExpression;
    //         if IsExpression then begin
    //             if i > 1 then begin
    //                 LeftOperand := CopyStr(Expression, 1, i - 1);
    //             end else
    //                 LeftOperand := '';
    //             if i < StrLen(Expression) then begin
    //                 RightOperand := CopyStr(Expression, i + 1);
    //             end else
    //                 RightOperand := '';
    //             Operator := Expression[i];
    //             LeftResult := EvaluateExpressioninStructures(IsTestExpression, LeftOperand, SalesLine, StructureOrderDetails);
    //             RightResult := EvaluateExpressioninStructures(IsTestExpression, RightOperand, SalesLine, StructureOrderDetails);
    //             case Operator of
    //                 '^':
    //                     Result := Power(LeftResult, RightResult);
    //                 '*':
    //                     Result := LeftResult * RightResult;
    //                 '/':
    //                     if RightResult = 0 then begin
    //                         Result := 0;
    //                         DivisionError := true;
    //                     end else
    //                         Result := LeftResult / RightResult;
    //                 '+':
    //                     Result := LeftResult + RightResult;
    //                 '-':
    //                     Result := LeftResult - RightResult;
    //             end;
    //         end else
    //             if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
    //                 Result :=
    //                   EvaluateExpressioninStructures(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine,
    //                     StructureOrderDetails)
    //             else begin
    //                 IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
    //                              StrPos(Expression, '<') + StrPos(Expression, '>') +
    //                              StrPos(Expression, '=') > 0);
    //                 if (StrLen(Expression) > 10) and (not IsFilter) then
    //                     Evaluate(Result, Expression)
    //                 else
    //                     if IsTestExpression then begin
    //                         Evaluate(Exp, Expression);
    //                         StructureOrderDetails1.SetRange(Type, StructureOrderDetails1.Type::Sale);
    //                         StructureOrderDetails1.SetRange("Document Type", StructureOrderDetails."Document Type");
    //                         StructureOrderDetails1.SetRange("Document No.", StructureOrderDetails."Document No.");
    //                         StructureOrderDetails1.SetRange("Structure Code", StructureOrderDetails."Structure Code");
    //                         StructureOrderDetails1.SetRange("Calculation Order", Exp);
    //                         if StructureOrderDetails1.FindFirst then begin
    //                             StrOrderLineDetails2.Reset;
    //                             StrOrderLineDetails2.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderLineDetails2.SetRange("Document Type", StructureOrderDetails1."Document Type");
    //                             StrOrderLineDetails2.SetRange("Document No.", StructureOrderDetails1."Document No.");
    //                             StrOrderLineDetails2.SetRange("Item No.", SalesLine."No.");
    //                             StrOrderLineDetails2.SetRange("Line No.", SalesLine."Line No.");
    //                             StrOrderLineDetails2.SetRange("Structure Code", StructureOrderDetails1."Structure Code");
    //                             StrOrderLineDetails2.SetRange("Tax/Charge Code", StructureOrderDetails1."Tax/Charge Code");
    //                             Evaluate(Exp, Expression);
    //                             StrOrderLineDetails2.SetRange("Calculation Order", Exp);
    //                             if StrOrderLineDetails2.FindFirst then
    //                                 Result := Result + StrOrderLineDetails2.Amount;
    //                         end else
    //                             Evaluate(Result, Expression);
    //                     end;
    //             end;
    //     end;
    //     CallLevel := CallLevel - 1;
    //     exit(Result);
    // end;

    // 
    // procedure AdjustStructureAmounts(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     StrOrderDetails: Record "Structure Order Details";
    //     StrOrderLineDetails: Record "Structure Order Line Details";
    //     StrOrderLines: Record "Structure Order Line Details";
    //     CFactor: Decimal;
    //     StructureAmount: Decimal;
    //     DiffAmount: Decimal;
    //     Adjusted: Boolean;
    // begin
    //     with SalesHeader do begin
    //         StrOrderDetails.Reset;
    //         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //         StrOrderDetails.SetRange("Document Type", "Document Type");
    //         StrOrderDetails.SetRange("Document No.", "No.");
    //         StrOrderDetails.SetRange("Structure Code", Structure);
    //         StrOrderDetails.SetFilter("Tax/Charge Type", '%1|%2', StrOrderDetails."Tax/Charge Type"::Charges,
    //           StrOrderDetails."Tax/Charge Type"::"Other Taxes");
    //         StrOrderDetails.SetRange("Calculation Type", StrOrderDetails."Calculation Type"::"Fixed Value");
    //         StrOrderDetails.SetRange("Price Inclusive of Tax", false);
    //         if StrOrderDetails.Find('-') then
    //             repeat
    //                 Clear(StructureAmount);
    //                 StrOrderLines.Reset;
    //                 StrOrderLines.SetCurrentKey(
    //                   "Document Type", "Document No.", "Calculation Order", Type, "Structure Code", "Tax/Charge Type", "Tax/Charge Group",
    //                   "Tax/Charge Code", "Calculation Type");

    //                 StrOrderLines.SetRange("Document Type", "Document Type");
    //                 StrOrderLines.SetRange("Document No.", "No.");
    //                 StrOrderLines.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                 StrOrderLines.SetRange("Structure Code", Structure);
    //                 StrOrderLines.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                 StrOrderLines.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                 StrOrderLines.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                 StrOrderLines.SetRange("Calculation Type", StrOrderDetails."Calculation Type");
    //                 StrOrderLines.SetRange("Price Inclusive of Tax", false);
    //                 if StrOrderLines.Find('-') then
    //                     repeat
    //                         // IN0002.begin
    //                         // StructureAmount := StructureAmount + ROUND(StrOrderLines.Amount);
    //                         StructureAmount := StructureAmount + StrOrderLines.Amount;
    //                     // IN0002.end
    //                     until StrOrderLines.Next = 0;

    //                 if "Currency Factor" <> 0 then
    //                     CFactor := "Currency Factor"
    //                 else
    //                     CFactor := 1;

    //                 if not StrOrderDetails.LCY then
    //                     CFactor := 1;

    //                 Adjusted := false;
    //                 if StrOrderDetails."Calculation Value" <> StructureAmount then begin
    //                     // VSTF257709.begin
    //                     // VSTF256531.begin
    //                     DiffAmount := (StrOrderDetails."Calculation Value" * CFactor) - StructureAmount;
    //                     // DiffAmount := ROUND(StrOrderDetails."Calculation Value" * CFactor) - StructureAmount;
    //                     // VSTF256531.end
    //                     // VSTF257709.end
    //                     StrOrderLines.Reset;
    //                     StrOrderLines.SetCurrentKey(
    //                       "Document Type", "Document No.", "Calculation Order", Type, "Structure Code", "Tax/Charge Type", "Tax/Charge Group",
    //                       "Tax/Charge Code", "Calculation Type");

    //                     StrOrderLines.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                     StrOrderLines.SetRange("Document Type", "Document Type");
    //                     StrOrderLines.SetRange("Document No.", "No.");
    //                     StrOrderLines.SetRange("Structure Code", Structure);
    //                     StrOrderLines.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                     StrOrderLines.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                     StrOrderLines.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                     StrOrderLines.SetRange("Calculation Type", StrOrderDetails."Calculation Type");
    //                     StrOrderLines.SetRange("Price Inclusive of Tax", false);
    //                     if StrOrderLines.Find('-') then
    //                         // IF GLAcc.GET(StrOrderLines."Item No.") THEN
    //                         // EXIT;
    //                         // StrOrderLines.Amount := StrOrderLines.Amount + DiffAmount;
    //                         // StrOrderLines."Amount (LCY)" := StrOrderLines."Amount (LCY)" + DiffAmount/CFactor;
    //                         // StrOrderLines.MODIFY;
    //                         repeat
    //                             if SalesLine.Get(StrOrderLines."Document Type", StrOrderLines."Document No.", StrOrderLines."Line No.") then begin
    //                                 if SalesLine.Type <> SalesLine.Type::"G/L Account" then begin
    //                                     if (StrOrderDetails."Calculation Value" <> 0) and (not StrOrderLines."Manually Changed") then begin
    //                                         // IN0002.begin
    //                                         // StrOrderLines.Amount := StrOrderLines.Amount + DiffAmount;
    //                                         // StrOrderLines."Amount (LCY)" := StrOrderLines."Amount (LCY)" + DiffAmount/CFactor;
    //                                         StrOrderLines.Amount := Round(StrOrderLines.Amount + DiffAmount);
    //                                         StrOrderLines."Amount (LCY)" := Round(StrOrderLines."Amount (LCY)" + DiffAmount / CFactor);
    //                                         // IN0002.end
    //                                         StrOrderLines.Modify;
    //                                         Adjusted := true;
    //                                     end;
    //                                 end;
    //                             end;
    //                         until (StrOrderLines.Next = 0) or Adjusted;
    //                 end;
    //             until StrOrderDetails.Next = 0;
    //     end;
    // end;

    // 
    // procedure UpdateSalesLines(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     StrOrderDetails: Record "Structure Order Details";
    //     StrOrderLineDetails: Record "Structure Order Line Details";
    //     Currency: Record Currency;
    //     ChargesToCustomer: Decimal;
    // begin
    //     with SalesHeader do begin
    //         if "Currency Code" = '' then
    //             Currency.InitRoundingPrecision
    //         else
    //             Currency.Get("Currency Code");

    //         SalesLine.LockTable;
    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetFilter(Type, '%1|%2|%3|%4|%5', SalesLine.Type::Item, SalesLine.Type::"G/L Account", SalesLine.Type::"Fixed Asset",
    //           SalesLine.Type::Resource, SalesLine.Type::"Charge (Item)");
    //         SalesLine.SetRange("Price Inclusive of Tax", false);
    //         if SalesLine.Find('-') then
    //             repeat
    //                 // PS40211.begin
    //                 // IF SalesLine."Line Amount" <> 0 THEN
    //                 if SalesLine.Quantity <> 0 then
    //                     // PS40211.end
    //                     with SalesLine do begin
    //                         ChargesToCustomer := 0;
    //                         StrOrderDetails.Reset;
    //                         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                         StrOrderDetails.SetRange("Document Type", "Document Type");
    //                         StrOrderDetails.SetRange("Document No.", "Document No.");
    //                         StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                         StrOrderDetails.SetRange("Price Inclusive of Tax", "Price Inclusive of Tax");
    //                         StrOrderDetails.SetRange("Document Line No.", 0);
    //                         if StrOrderDetails.Find('-') then
    //                             repeat
    //                                 StrOrderLineDetails.Reset;
    //                                 StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                                 StrOrderLineDetails.SetRange("Calculation Order", StrOrderDetails."Calculation Order");
    //                                 StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                                 StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                                 StrOrderLineDetails.SetRange("Structure Code", Structure);
    //                                 StrOrderLineDetails.SetRange("Item No.", "No.");
    //                                 StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                                 StrOrderLineDetails.SetRange("Price Inclusive of Tax", "Price Inclusive of Tax");
    //                                 if StrOrderLineDetails.Find('-') then
    //                                     repeat
    //                                         if not StrOrderDetails."Payable to Third Party" then
    //                                             if not (StrOrderDetails."Tax/Charge Type" in [StrOrderDetails."Tax/Charge Type"::"Sales Tax",
    //                                                                                           StrOrderDetails."Tax/Charge Type"::Excise,
    //                                                                                           StrOrderDetails."Tax/Charge Type"::"Service Tax"])
    //                                             then
    //                                                 ChargesToCustomer :=
    //                                                   ChargesToCustomer + Round(StrOrderLineDetails.Amount, Currency."Amount Rounding Precision");
    //                                     until StrOrderLineDetails.Next = 0;
    //                             until StrOrderDetails.Next = 0;
    //                         "Charges To Customer" := ChargesToCustomer;
    //                         if "TCS Nature of Collection" = '' then
    //                             "Amount To Customer" := "Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Tax Amount" +
    //                               "Charges To Customer" - "Bal. TDS/TCS Including SHECESS" +
    //                               "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount"
    //                         else
    //                             "Amount To Customer" := "Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Tax Amount" +
    //                               "Charges To Customer" + "Bal. TDS/TCS Including SHECESS" +
    //                               "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount";
    //                         Modify;
    //                     end;
    //             until SalesLine.Next = 0;
    //     end;
    // end;


    procedure CheckECCNo()
    begin
        GetSalesHeader;
        if SalesHeader."Location Code" <> '' then begin
            GetLocation(SalesHeader."Location Code");
            //Location.TestField("E.C.C. No.");//LKS-Raj Commented (Field Missing)
        end;
    end;


    procedure ChkQtyUpdatioAfterDDPLA()
    begin
        if (xRec.Quantity <> Quantity) and (xRec.Quantity <> 0) and "Direct Debit To PLA / RG" and
           ("Document Type" in ["Document Type"::Order, "Document Type"::Invoice])
        then begin
            GenJnlLine.Reset;
            GenJnlLine.SetFilter("Journal Template Name", '%1', '');
            GenJnlLine.SetFilter("Journal Batch Name", '%1', '');
            GenJnlLine.SetRange("Document No.", "Document No.");
            if GenJnlLine.FindFirst then
                Error(Text16351);
        end;
    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure UpdateStruOrdLineDetails()
    // var
    //     StructureDetail: Record "Structure Details";
    //     StrOrderLineDetails: Record "Structure Order Line Details";
    // begin
    //     GetSalesHeader;
    //     SalesHeader.TestField(Structure);
    //     StructureDetail.SetRange(Code, SalesHeader.Structure);
    //     StructureDetail.SetRange(Type, StructureDetail.Type::Excise);
    //     if StructureDetail.FindFirst then begin
    //         StrOrderLineDetails.Get(StrOrderLineDetails.Type::Sale, StructureDetail."Calculation Order",
    //           "Document Type", "Document No.", "No.", "Line No.", StructureDetail.Type, '', 'EXCISE');
    //         StrOrderLineDetails."Manually Changed" := true;
    //         StrOrderLineDetails.Amount := "BED Amount" + "AED(GSI) Amount" + "SED Amount" + "SAED Amount" +
    //           "CESS Amount" + "NCCD Amount" + "eCess Amount" + "ADET Amount" + "AED(TTA) Amount" + "ADE Amount" + "ADC VAT Amount" +
    //           "SHE Cess Amount";
    //         if SalesHeader."Currency Factor" <> 0 then
    //             CFactor := SalesHeader."Currency Factor"
    //         else
    //             CFactor := 1;
    //         if SalesHeader."Currency Code" <> '' then
    //             Currency.Get(SalesHeader."Currency Code");
    //         StrOrderLineDetails."Amount (LCY)" := Round(StrOrderLineDetails.Amount / CFactor, Currency."Amount Rounding Precision");
    //         StrOrderLineDetails.Amount := Round(StrOrderLineDetails.Amount, Currency."Amount Rounding Precision");
    //         StrOrderLineDetails.Modify(true);
    //     end;
    // end;

    // 
    // procedure UpdateGenJnlLine()
    // var
    //     ExciseCenvatClaim: Record "Excise Cenvat Claim";
    // begin
    //     ExciseCenvatClaim.Reset;
    //     ExciseCenvatClaim.SetRange("Journal Template Name", '');
    //     ExciseCenvatClaim.SetRange("Journal Batch Name", '');
    //     ExciseCenvatClaim.SetRange("Document No.", "Document No.");
    //     if ExciseCenvatClaim.FindFirst then begin
    //         ExciseCenvatClaim."BED Amount" := 0;
    //         ExciseCenvatClaim."AED(GSI) Amount" := 0;
    //         ExciseCenvatClaim."SED Amount" := 0;
    //         ExciseCenvatClaim."SAED Amount" := 0;
    //         ExciseCenvatClaim."CESS Amount" := 0;
    //         ExciseCenvatClaim."NCCD Amount" := 0;
    //         ExciseCenvatClaim."eCess Amount" := 0;
    //         ExciseCenvatClaim."ADET Amount" := 0;
    //         ExciseCenvatClaim."ADE Amount" := 0;
    //         ExciseCenvatClaim."AED(TTA) Amount" := 0;
    //         ExciseCenvatClaim."SHE Cess Amount" := 0;
    //         ExciseCenvatClaim."ADC VAT Amount" := 0;
    //         ExciseCenvatClaim.Modify;
    //     end;
    // end;

    // 
    // procedure CalculateTCS(SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     SalesLine2: Record "Sales Line";
    //     StructOrderLine: Record "Structure Order Line Details";
    //     TCSEntry: Record "TCS Entry";
    //     TCSSetup: Record "TCS Setup";
    //     NOCLine: Record "NOD/NOC Lines";
    //     CustLedgEntry: Record "Cust. Ledger Entry";
    //     DateFilterCalc: Codeunit "DateFilter-Calc";
    //     TCSAmount: Decimal;
    //     SurchargeAmount: Decimal;
    //     SurchargeBaseAmount: Decimal;
    //     AccPeriodFilter: Text[30];
    //     FiscalYear: Boolean;
    //     OrderAmount: Decimal;
    //     OrderTCSAmount: Decimal;
    //     ContractAmount: Decimal;
    //     ContractTCSAmount: Decimal;
    //     PrevInvoiceAmount: Decimal;
    //     InvoiceAmount: Decimal;
    //     PaymentAmount: Decimal;
    //     PrevTCSAmount: Decimal;
    //     PrevSurchargeAmount: Decimal;
    //     PrevContractAmount: Decimal;
    //     CalcTCS: Boolean;
    //     InsertBuffer: Boolean;
    // begin
    //     if SalesHeader."Assessee Code" = '' then
    //         exit;
    //     // PS46277.begin
    //     // TCSBuffer[1].DELETEALL;
    //     // PS46277.end
    //     "Per Contract" := false;

    //     with SalesLine do begin
    //         SetRange("Document Type", SalesHeader."Document Type");
    //         SetRange("Document No.", SalesHeader."No.");
    //         // VSTF254820.begin
    //         // SETFILTER(Type,'%1|%2',Type::"G/L Account",Type::Item);
    //         SetFilter(Type, '%1|%2|%3', Type::"G/L Account", Type::Item, Type::"Charge (Item)");
    //         // VSTF254820.end
    //         if Find('-') then
    //             repeat
    //                 if ("TCS Nature of Collection" <> '') and (AccPeriodFilter = '') then
    //                     DateFilterCalc.CreateTCSAccountingDateFilter(AccPeriodFilter, FiscalYear, SalesHeader."Posting Date", 0);
    //                 InitTCS(SalesLine);
    //                 // PS46277.begin
    //                 TCSBuffer[1].DeleteAll;
    //                 // PS46277.end
    //                 // VSTF259053.begin
    //                 TCSAmount := 0;
    //                 SurchargeAmount := 0;
    //                 OrderAmount := 0;
    //                 OrderTCSAmount := 0;
    //                 // VSTF259053.end
    //                 NOCLine.Reset;
    //                 NOCLine.SetRange(Type, NOCLine.Type::Customer);
    //                 NOCLine.SetRange("No.", "Sell-to Customer No.");
    //                 NOCLine.SetRange("NOD/NOC", "TCS Nature of Collection");
    //                 if NOCLine.FindFirst then begin
    //                     "Concessional Code" := NOCLine."Concessional Code";
    //                     TCSSetup.Reset;
    //                     TCSSetup.SetRange("TCS Nature of Collection", "TCS Nature of Collection");
    //                     TCSSetup.SetRange("Assessee Code", "Assessee Code");
    //                     TCSSetup.SetRange("TCS Type", "TCS Type");
    //                     TCSSetup.SetRange("Effective Date", 0D, SalesHeader."Posting Date");
    //                     TCSSetup.SetRange("Concessional Code", NOCLine."Concessional Code");

    //                     if TCSSetup.FindLast then begin
    //                         StructOrderLine.Reset;
    //                         StructOrderLine.SetCurrentKey(Type, "Document Type", "Document No.", "Item No.", "Line No.");
    //                         StructOrderLine.SetRange(Type, StructOrderLine.Type::Sale);
    //                         StructOrderLine.SetRange("Document Type", "Document Type");
    //                         StructOrderLine.SetRange("Document No.", "Document No.");
    //                         StructOrderLine.SetRange("Item No.", "No.");
    //                         StructOrderLine.SetRange("Line No.", "Line No.");
    //                         StructOrderLine.CalcSums("Amount (LCY)");
    //                         TCSBaseLCY := "Line Amount" - "Inv. Discount Amount" + StructOrderLine."Amount (LCY)";

    //                         if "Currency Code" <> '' then
    //                             TCSBaseLCY := Round(
    //                                 CurrExchRate.ExchangeAmtFCYToLCY(
    //                                   SalesHeader."Posting Date", "Currency Code",
    //                                   Abs(TCSBaseLCY), SalesHeader."Currency Factor"));

    //                         TCSEntry.Reset;
    //                         TCSEntry.SetCurrentKey("Party Type", "Party Code", "Posting Date", "TCS Type", "Assessee Code", "Document Type");
    //                         TCSEntry.SetRange("Party Type", TCSEntry."Party Type"::Customer);
    //                         TCSEntry.SetRange("Party Code", "Sell-to Customer No.");
    //                         TCSEntry.SetFilter("Posting Date", AccPeriodFilter);
    //                         TCSEntry.SetRange("TCS Type", "TCS Type");
    //                         TCSEntry.SetRange("Assessee Code", "Assessee Code");
    //                         TCSEntry.SetRange("Document Type", TCSEntry."Document Type"::Invoice);
    //                         TCSEntry.CalcSums("Invoice Amount", "Service Tax Including eCess");
    //                         InvoiceAmount := Abs(TCSEntry."Invoice Amount") + Abs(TCSEntry."Service Tax Including eCess");

    //                         TCSEntry.SetRange("Document Type", TCSEntry."Document Type"::Payment);
    //                         TCSEntry.CalcSums("Invoice Amount", "Service Tax Including eCess");
    //                         PaymentAmount := Abs(TCSEntry."Invoice Amount") + Abs(TCSEntry."Service Tax Including eCess");

    //                         if InvoiceAmount > PaymentAmount then
    //                             PrevInvoiceAmount := InvoiceAmount
    //                         else
    //                             PrevInvoiceAmount := PaymentAmount;

    //                         TCSEntry.SetRange("Document Type");
    //                         TCSEntry.CalcSums("TCS Amount", "Surcharge Amount");
    //                         PrevTCSAmount := Abs(TCSEntry."TCS Amount");
    //                         PrevSurchargeAmount := Abs(TCSEntry."Surcharge Amount");

    //                         TCSEntry.Reset;
    //                         TCSEntry.SetCurrentKey("Party Type", "Party Code", "Posting Date", "TCS Type", "Assessee Code", Applied, "Per Contract"
    //                           );
    //                         TCSEntry.SetRange("Party Type", TCSEntry."Party Type"::Customer);
    //                         TCSEntry.SetRange("Party Code", "Sell-to Customer No.");
    //                         TCSEntry.SetFilter("Posting Date", AccPeriodFilter);
    //                         TCSEntry.SetRange("TCS Type", "TCS Type");
    //                         TCSEntry.SetRange("Assessee Code", "Assessee Code");
    //                         TCSEntry.SetRange(Applied, false);
    //                         TCSEntry.SetRange("Per Contract", true);
    //                         TCSEntry.CalcSums("Invoice Amount", "Service Tax Including eCess");
    //                         PrevContractAmount := Abs(TCSEntry."Invoice Amount") + Abs(TCSEntry."Service Tax Including eCess");

    //                         SalesLine2.Reset;
    //                         SalesLine2.SetRange("Document Type", "Document Type");
    //                         SalesLine2.SetRange("Document No.", "Document No.");
    //                         SalesLine2.SetRange("TCS Type", "TCS Type");
    //                         SalesLine2.SetRange("TCS Nature of Collection", "TCS Nature of Collection");
    //                         SalesLine2.SetRange("Assessee Code", "Assessee Code");
    //                         SalesLine2.SetFilter("Line No.", '<%1', "Line No.");
    //                         if SalesLine2.Find('-') then
    //                             repeat
    //                                 OrderAmount += SalesLine2."Line Amount" - SalesLine2."Inv. Discount Amount" +
    //                                   SalesLine2."Service Tax Amount" + SalesLine2."Service Tax eCess Amount" +
    //                                   SalesLine2."Service Tax SHE Cess Amount";
    //                                 OrderTCSAmount := OrderTCSAmount + SalesLine2."Total TDS/TCS Incl. SHE CESS";
    //                                 if "Per Contract" then begin
    //                                     ContractAmount := ContractAmount + SalesLine2."TDS/TCS Base Amount";
    //                                     ContractTCSAmount := ContractTCSAmount + SalesLine2."Total TDS/TCS Incl. SHE CESS";
    //                                 end;
    //                             until SalesLine2.Next = 0;

    //                         if "Currency Code" <> '' then
    //                             OrderAmount := Round(
    //                                 CurrExchRate.ExchangeAmtFCYToLCY(
    //                                   SalesHeader."Posting Date", "Currency Code",
    //                                   OrderAmount, SalesHeader."Currency Factor"));

    //                         InsertBuffer := false;
    //                         CalcTCS := false;

    //                         "Surcharge Base Amount" := TCSBaseLCY;
    //                         "TDS/TCS %" := TCSSetup."TCS %";
    //                         "Surcharge %" := TCSSetup."Surcharge %";
    //                         "eCESS % on TDS/TCS" := TCSSetup."eCESS %";
    //                         "SHE Cess % on TDS/TCS" := TCSSetup."SHE Cess %";

    //                         if (SalesHeader."Applies-to Doc. No." = '') and (SalesHeader."Applies-to ID" = '') then begin
    //                             if NOCLine."Threshold Overlook" then begin
    //                                 "TDS/TCS Base Amount" := TCSBaseLCY;
    //                                 if (PrevInvoiceAmount + OrderAmount) > TCSSetup."Surcharge Threshold Amount" then
    //                                     PrevSurchargeAmount := 0
    //                                 else
    //                                     if (not NOCLine."Surcharge Overlook") and
    //                                        ((PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."Surcharge Threshold Amount")
    //                                     then begin
    //                                         "Surcharge Base Amount" := "Surcharge Base Amount" + PrevInvoiceAmount + OrderAmount;
    //                                         InsertBuffer := true;
    //                                     end else
    //                                         if not NOCLine."Surcharge Overlook" then
    //                                             "Surcharge %" := 0;
    //                             end else
    //                                 if (PrevInvoiceAmount + OrderAmount) > TCSSetup."TCS Threshold Amount" then begin
    //                                     // PS46277.begin
    //                                     // "TDS/TCS Base Amount" := TCSBaseLCY + OrderAmount - ContractAmount;
    //                                     "TDS/TCS Base Amount" := TCSBaseLCY - ContractAmount;
    //                                     // PS46277.end
    //                                     if (PrevInvoiceAmount + OrderAmount) > TCSSetup."Surcharge Threshold Amount" then begin
    //                                         PrevSurchargeAmount := 0;
    //                                     end else
    //                                         if (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."Surcharge Threshold Amount" then begin
    //                                             "Surcharge Base Amount" := "Surcharge Base Amount" + PrevInvoiceAmount + OrderAmount;
    //                                             InsertBuffer := true;
    //                                         end else
    //                                             if not NOCLine."Surcharge Overlook" then
    //                                                 "Surcharge %" := 0;
    //                                 end else
    //                                     if ((PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."TCS Threshold Amount") and
    //                                        (TCSSetup."Contract Amount" <> 0)
    //                                     then begin
    //                                         "TDS/TCS Base Amount" := (PrevInvoiceAmount + TCSBaseLCY) - PrevContractAmount + OrderAmount - ContractAmount;

    //                                         if NOCLine."Surcharge Overlook" then
    //                                             "Surcharge Base Amount" += (PrevInvoiceAmount - PrevContractAmount + OrderAmount - ContractAmount)
    //                                         else
    //                                             if (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."Surcharge Threshold Amount" then
    //                                                 "Surcharge Base Amount" += PrevInvoiceAmount - PrevContractAmount + OrderAmount
    //                                             else
    //                                                 if not ((PrevInvoiceAmount + OrderAmount) > TCSSetup."Surcharge Threshold Amount") then
    //                                                     "Surcharge %" := 0;

    //                                         InsertBuffer := true;
    //                                         CalcTCS := true;
    //                                     end else
    //                                         if ((TCSBaseLCY + OrderAmount) > TCSSetup."Contract Amount") and
    //                                            (TCSSetup."Contract Amount" <> 0)
    //                                         then begin
    //                                             "Per Contract" := true;
    //                                             "TDS/TCS Base Amount" := TCSBaseLCY + OrderAmount - ContractAmount;

    //                                             if NOCLine."Surcharge Overlook" then
    //                                                 "Surcharge Base Amount" := Abs("Surcharge Base Amount" + OrderAmount - ContractAmount)
    //                                             else
    //                                                 if not (TCSBaseLCY > TCSSetup."Surcharge Threshold Amount") then
    //                                                     "Surcharge %" := 0;
    //                                         end else
    //                                             if (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."TCS Threshold Amount" then begin
    //                                                 "TDS/TCS Base Amount" := PrevInvoiceAmount + TCSBaseLCY + OrderAmount;

    //                                                 if NOCLine."Surcharge Overlook" then
    //                                                     "Surcharge Base Amount" := Abs(PrevInvoiceAmount + OrderAmount + "Surcharge Base Amount")
    //                                                 else
    //                                                     if (PrevInvoiceAmount + OrderAmount) > TCSSetup."Surcharge Threshold Amount" then begin
    //                                                         PrevSurchargeAmount := 0;
    //                                                     end else
    //                                                         if (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."Surcharge Threshold Amount" then
    //                                                             "Surcharge Base Amount" := PrevInvoiceAmount + OrderAmount + "Surcharge Base Amount"
    //                                                         else
    //                                                             "Surcharge %" := 0;

    //                                                 InsertBuffer := true;
    //                                                 CalcTCS := true;
    //                                             end else begin
    //                                                 "TDS/TCS Base Amount" := TCSBaseLCY;
    //                                                 "TDS/TCS %" := 0;
    //                                                 "eCESS % on TDS/TCS" := 0;
    //                                                 "SHE Cess % on TDS/TCS" := 0;
    //                                                 "Surcharge %" := 0;
    //                                                 "Surcharge Amount" := 0;
    //                                                 "TDS/TCS Amount" := 0;
    //                                             end;
    //                         end else begin
    //                             if "Document Type" in ["Document Type"::"Credit Memo", "Document Type"::"Return Order"] then begin
    //                                 TCSEntry.Reset;
    //                                 TCSEntry.SetCurrentKey("Document No.", "Posting Date");
    //                                 // IN0003.begin
    //                                 // TCSEntry.SETRANGE("Document No.", SalesHeader."Applies-to Doc. No.");
    //                                 if SalesHeader."Applies-to Doc. No." <> '' then
    //                                     TCSEntry.SetRange("Document No.", SalesHeader."Applies-to Doc. No.")
    //                                 else begin
    //                                     CustLedgEntry.Reset;
    //                                     CustLedgEntry.SetRange("Applies-to ID", SalesHeader."Applies-to ID");
    //                                     CustLedgEntry.SetRange("TCS Nature of Collection", "TCS Nature of Collection");
    //                                     CustLedgEntry.SetRange("TCS Type", "TCS Type");
    //                                     if CustLedgEntry.FindFirst then
    //                                         TCSEntry.SetRange("Document No.", CustLedgEntry."Document No.")
    //                                 end;
    //                                 // IN0003.end
    //                                 if TCSEntry.Find('+') then
    //                                     if not TCSEntry."TCS Paid" then begin
    //                                         "TDS/TCS Base Amount" := TCSBaseLCY;
    //                                         "TDS/TCS %" := TCSEntry."TCS %";
    //                                         "eCESS % on TDS/TCS" := TCSEntry."eCESS %";
    //                                         "SHE Cess % on TDS/TCS" := TCSEntry."SHE Cess %";
    //                                         "Surcharge %" := TCSEntry."Surcharge %";
    //                                         "Surcharge Amount" := TCSEntry."Surcharge Amount";
    //                                         "TDS/TCS Amount" := TCSEntry."TCS Amount";
    //                                     end else begin
    //                                         "TDS/TCS Base Amount" := TCSBaseLCY;
    //                                         "TDS/TCS %" := 0;
    //                                         "eCESS % on TDS/TCS" := 0;
    //                                         "SHE Cess % on TDS/TCS" := 0;
    //                                         "Surcharge %" := 0;
    //                                         "Surcharge Amount" := 0;
    //                                         "TDS/TCS Amount" := 0;
    //                                     end;
    //                             end else begin
    //                                 CustLedgEntry.Reset;
    //                                 CustLedgEntry.SetRange("Document No.", SalesHeader."Applies-to Doc. No.");
    //                                 CustLedgEntry.SetRange("TCS Nature of Collection", "TCS Nature of Collection");
    //                                 CustLedgEntry.SetRange("TCS Type", "TCS Type");
    //                                 if CustLedgEntry.FindFirst then
    //                                     CustLedgEntry.CalcFields("Remaining Amt. (LCY)");
    //                                 if TCSBaseLCY >= Abs(CustLedgEntry."Remaining Amt. (LCY)") then begin
    //                                     if TCSSetup."Contract Amount" <> 0 then begin
    //                                         if PrevTCSAmount = 0 then
    //                                             "TDS/TCS Base Amount" := PrevInvoiceAmount + TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)")
    //                                         else
    //                                             if PrevContractAmount <> 0 then
    //                                                 "TDS/TCS Base Amount" := TCSBaseLCY -
    //                                                   Abs(CustLedgEntry."Remaining Amt. (LCY)") +
    //                                                   (PrevInvoiceAmount - PrevContractAmount)
    //                                             else
    //                                                 "TDS/TCS Base Amount" := TCSBaseLCY -
    //                                                   Abs(CustLedgEntry."Remaining Amt. (LCY)");

    //                                         if PrevSurchargeAmount = 0 then
    //                                             "Surcharge Base Amount" := PrevInvoiceAmount + TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)")
    //                                         else
    //                                             if PrevContractAmount <> 0 then
    //                                                 "Surcharge Base Amount" := TCSBaseLCY -
    //                                                   Abs(CustLedgEntry."Remaining Amt. (LCY)") +
    //                                                   (PrevInvoiceAmount - PrevContractAmount)
    //                                             else
    //                                                 "Surcharge Base Amount" := TCSBaseLCY -
    //                                                   Abs(CustLedgEntry."Remaining Amt. (LCY)");
    //                                     end else begin
    //                                         if PrevTCSAmount = 0 then
    //                                             "TDS/TCS Base Amount" := PrevInvoiceAmount + TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)")
    //                                         else
    //                                             "TDS/TCS Base Amount" := TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)");
    //                                         if PrevSurchargeAmount = 0 then
    //                                             "Surcharge Base Amount" := PrevInvoiceAmount + TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)")
    //                                         else
    //                                             "Surcharge Base Amount" := TCSBaseLCY -
    //                                               Abs(CustLedgEntry."Remaining Amt. (LCY)");
    //                                     end;
    //                                     "Temp TDS/TCS Base" := TCSBaseLCY - Abs(CustLedgEntry."Remaining Amt. (LCY)");
    //                                 end;
    //                             end;
    //                         end;

    //                         if InsertBuffer then begin
    //                             // Rec := SalesLine;
    //                             InsertGenTCSBuffer(false);
    //                             TCSEntry.Reset;
    //                             TCSEntry.SetCurrentKey("Party Type", "Party Code", "Posting Date", "TCS Type", "Assessee Code", Applied);
    //                             TCSEntry.SetRange("Party Type", TCSEntry."Party Type"::Customer);
    //                             TCSEntry.SetRange("Party Code", "Sell-to Customer No.");
    //                             TCSEntry.SetFilter("Posting Date", AccPeriodFilter);
    //                             TCSEntry.SetRange("TCS Type", "TCS Type");
    //                             TCSEntry.SetRange("Assessee Code", "Assessee Code");
    //                             TCSEntry.SetRange(Applied, false);
    //                             if TCSEntry.Find('-') then
    //                                 repeat
    //                                     InsertTCSBuffer(TCSEntry, SalesHeader."Posting Date", "Surcharge %" <> 0, false);
    //                                 until TCSEntry.Next = 0;
    //                         end;

    //                         if TCSBaseLCY <> 0 then begin
    //                             if TCSBuffer[1].Find('+') then begin
    //                                 repeat
    //                                     TCSAmount :=
    //                                       TCSAmount + (TCSBuffer[1]."TCS Base Amount" - TCSBuffer[1]."Contract TCS Ded. Base Amount") *
    //                                       TCSBuffer[1]."TCS %" / 100;
    //                                     SurchargeBaseAmount := SurchargeBaseAmount + (TCSBuffer[1]."TCS %" *
    //                                                                                   (TCSBuffer[1]."Surcharge Base Amount" -
    //                                                                                    TCSBuffer[1]."Contract TCS Ded. Base Amount") / 100);
    //                                     SurchargeAmount := SurchargeAmount + (TCSBuffer[1]."TCS %" *
    //                                                                           (TCSBuffer[1]."Surcharge Base Amount" -
    //                                                                            TCSBuffer[1]."Contract TCS Ded. Base Amount") / 100) *
    //                                       (TCSBuffer[1]."Surcharge %" / 100);
    //                                 until TCSBuffer[1].Next(-1) = 0;

    //                                 if TCSBaseLCY < 0 then begin
    //                                     "TDS/TCS Amount" := -RoundTCSAmount(TCSAmount);
    //                                     "Surcharge Amount" := -RoundTCSAmount(SurchargeAmount);
    //                                 end else begin
    //                                     "TDS/TCS Amount" := RoundTCSAmount(TCSAmount);
    //                                     "Surcharge Amount" := RoundTCSAmount(SurchargeAmount);
    //                                 end;

    //                                 if "TDS/TCS Base Amount" <> 0 then
    //                                     "TDS/TCS %" := Abs(Round(TCSAmount * 100 / "TDS/TCS Base Amount"));
    //                                 if SurchargeBaseAmount <> 0 then
    //                                     "Surcharge %" := Abs(Round(SurchargeAmount * 100 / SurchargeBaseAmount));
    //                             end else begin
    //                                 "TDS/TCS Amount" := RoundTCSAmount("TDS/TCS %" * "TDS/TCS Base Amount" / 100);
    //                                 "Surcharge Amount" := RoundTCSAmount(("TDS/TCS %" * "Surcharge Base Amount" / 100) * ("Surcharge %" / 100));
    //                             end;

    //                             "eCESS on TDS/TCS Amount" := RoundTCSAmount(("TDS/TCS Amount" + "Surcharge Amount") * "eCESS % on TDS/TCS" / 100);
    //                             "SHE Cess on TDS/TCS Amount" :=
    //                               RoundTCSAmount(("TDS/TCS Amount" + "Surcharge Amount") * "SHE Cess % on TDS/TCS" / 100
    //                                 );
    //                             "Total TDS/TCS Incl. SHE CESS" := "TDS/TCS Amount" + "Surcharge Amount" + "eCESS on TDS/TCS Amount" +
    //                               "SHE Cess on TDS/TCS Amount";
    //                             if "Currency Code" <> '' then begin
    //                                 "TDS/TCS Amount" :=
    //                                   Round(
    //                                     CurrExchRate.ExchangeAmtLCYToFCY(
    //                                       SalesHeader."Posting Date", "Currency Code",
    //                                       "TDS/TCS Amount", SalesHeader."Currency Factor"),
    //                                     Currency."Amount Rounding Precision");
    //                                 "Surcharge Amount" :=
    //                                   Round(
    //                                     CurrExchRate.ExchangeAmtLCYToFCY(
    //                                       SalesHeader."Posting Date", "Currency Code",
    //                                       "Surcharge Amount", SalesHeader."Currency Factor"),
    //                                     Currency."Amount Rounding Precision");
    //                                 "eCESS on TDS/TCS Amount" :=
    //                                   Round(
    //                                     CurrExchRate.ExchangeAmtLCYToFCY(
    //                                       SalesHeader."Posting Date", "Currency Code",
    //                                       "eCESS on TDS/TCS Amount", SalesHeader."Currency Factor"),
    //                                     Currency."Amount Rounding Precision");
    //                                 "SHE Cess on TDS/TCS Amount" :=
    //                                   Round(
    //                                     CurrExchRate.ExchangeAmtLCYToFCY(
    //                                       SalesHeader."Posting Date", "Currency Code",
    //                                       "SHE Cess on TDS/TCS Amount", SalesHeader."Currency Factor"),
    //                                     Currency."Amount Rounding Precision");
    //                                 "Total TDS/TCS Incl. SHE CESS" :=
    //                                   Round(
    //                                     CurrExchRate.ExchangeAmtLCYToFCY(
    //                                       SalesHeader."Posting Date", "Currency Code",
    //                                       "Total TDS/TCS Incl. SHE CESS", SalesHeader."Currency Factor"),
    //                                     Currency."Amount Rounding Precision");
    //                                 "Bal. TDS/TCS Including SHECESS" := "Total TDS/TCS Incl. SHE CESS";
    //                             end;
    //                         end;
    //                     end;
    //                 end;
    //                 Modify;
    //             until Next = 0;
    //     end;
    // end;
    //LKS-Raj Commented (Table Missing)

    //LKS-Raj Commented (Table Missing)
    // local procedure RoundTCSAmount(TCSAmount: Decimal): Decimal
    // var
    //     GLSetup: Record "General Ledger Setup";
    //     TCSRoundingDirection: Text[1];
    //     TCSRoundingPrecision: Decimal;
    // begin
    //     GLSetup.Get;
    //     case GLSetup."TCS Rounding Type" of
    //         GLSetup."TCS Rounding Type"::Nearest:
    //             TCSRoundingDirection := '=';
    //         GLSetup."TCS Rounding Type"::Up:
    //             TCSRoundingDirection := '>';
    //         GLSetup."TCS Rounding Type"::Down:
    //             TCSRoundingDirection := '<';
    //     end;

    //     if GLSetup."TCS Rounding Precision" <> 0 then
    //         TCSRoundingPrecision := GLSetup."TCS Rounding Precision"
    //     else
    //         TCSRoundingPrecision := 1;

    //     exit(Round(TCSAmount, TCSRoundingPrecision, TCSRoundingDirection));
    // end;

    // local procedure InsertTCSBuffer(TCSEntry: Record "TCS Entry"; PostingDate: Date; CalculateSurcharge: Boolean; CalcTCS: Boolean)
    // begin
    //     with TCSEntry do begin
    //         TCSBuffer[1]."TCS Nature of Collection" := "TCS Nature of Collection";
    //         TCSBuffer[1]."Assessee Code" := "Assessee Code";
    //         TCSBuffer[1]."Party Code" := "Party Code";
    //         TCSBuffer[1]."Party Type" := "Party Type";
    //         if CalcTCS then begin
    //             TCSBuffer[1]."TCS Base Amount" := "Invoice Amount" + "Service Tax Including eCess";
    //             if "Per Contract" then
    //                 TCSBuffer[1]."Contract TCS Ded. Base Amount" := "Invoice Amount" + "Service Tax Including eCess";
    //         end else
    //             TCSBuffer[1]."TCS Base Amount" := 0;
    //         if CalculateSurcharge then begin
    //             TCSBuffer[1]."Surcharge Base Amount" := "Invoice Amount" + "Service Tax Including eCess";
    //             if "Per Contract" then
    //                 TCSBuffer[1]."Contract TCS Ded. Base Amount" := "Invoice Amount" + "Service Tax Including eCess";
    //         end else
    //             TCSBuffer[1]."Surcharge Base Amount" := 0;

    //         TCSSetup.Reset;
    //         TCSSetup.SetRange("TCS Nature of Collection", "TCS Nature of Collection");
    //         TCSSetup.SetRange("Assessee Code", "Assessee Code");
    //         TCSSetup.SetRange("Effective Date", 0D, PostingDate);

    //         NOCLine.Reset;
    //         NOCLine.SetRange(Type, "Party Type");
    //         NOCLine.SetRange("No.", "Party Code");
    //         NOCLine.SetRange("NOD/NOC", "TCS Nature of Collection");
    //         if NOCLine.Find('-') then
    //             TCSSetup.SetRange("Concessional Code", NOCLine."Concessional Code");
    //         if TCSSetup.FindLast then begin
    //             TCSBuffer[1]."TCS %" := TCSSetup."TCS %";
    //             TCSBuffer[1]."Surcharge %" := TCSSetup."Surcharge %";
    //         end;
    //         UpdateTCSBuffer;
    //     end;
    // end;

    // local procedure UpdateTCSBuffer()
    // begin
    //     TCSBuffer[2] := TCSBuffer[1];
    //     if TCSBuffer[2].Find then begin
    //         TCSBuffer[2]."TCS Base Amount" += TCSBuffer[1]."TCS Base Amount";
    //         TCSBuffer[2]."Surcharge Base Amount" += TCSBuffer[1]."Surcharge Base Amount";
    //         TCSBuffer[2]."Contract TCS Ded. Base Amount" += TCSBuffer[1]."Contract TCS Ded. Base Amount";
    //         TCSBuffer[2].Modify;
    //     end else
    //         TCSBuffer[1].Insert;
    // end;

    // local procedure InsertGenTCSBuffer(Applied: Boolean)
    // begin
    //     Clear(TCSBuffer[1]);
    //     TCSBuffer[1]."TCS Nature of Collection" := "TCS Nature of Collection";
    //     TCSBuffer[1]."Assessee Code" := "Assessee Code";
    //     TCSBuffer[1]."Party Code" := "Sell-to Customer No.";
    //     TCSBuffer[1]."Party Type" := TCSBuffer[1]."Party Type"::Customer;
    //     if Applied then begin
    //         TCSBuffer[1]."TCS Base Amount" := Abs("Temp TDS/TCS Base");
    //         TCSBuffer[1]."Surcharge Base Amount" := Abs("Temp TDS/TCS Base");
    //     end else begin
    //         // VSTF259053.begin
    //         // TCSBuffer[1]."TCS Base Amount" := TCSBaseLCY;
    //         TCSBuffer[1]."TCS Base Amount" := "TDS/TCS Base Amount";
    //         // TCSBuffer[1]."Surcharge Base Amount" :=  TCSBaseLCY;
    //         TCSBuffer[1]."Surcharge Base Amount" := "TDS/TCS Base Amount";
    //         // VSTF259053.end
    //     end;
    //     TCSBuffer[1]."TCS %" := "TDS/TCS %";
    //     TCSBuffer[1]."Surcharge %" := "Surcharge %";
    //     UpdateTCSBuffer;
    // end;

    // local procedure InitTCS(var SalesLine: Record "Sales Line")
    // begin
    //     with SalesLine do begin
    //         // PS46277.begin
    //         "TDS/TCS Base Amount" := 0;
    //         // PS46277.end
    //         "TDS/TCS %" := 0;
    //         "Surcharge %" := 0;
    //         "eCESS % on TDS/TCS" := 0;
    //         "SHE Cess % on TDS/TCS" := 0;
    //         "TDS/TCS Amount" := 0;
    //         "Surcharge Amount" := 0;
    //         "eCESS on TDS/TCS Amount" := 0;
    //         "SHE Cess on TDS/TCS Amount" := 0;
    //         "Total TDS/TCS Incl. SHE CESS" := 0;
    //         /*"Tot TDS/TCS Incl. SHECESS(LCY)" := 0;
    //         "TDS/TCS Amount (LCY)" := 0;
    //         "Surcharge Amount (LCY)" := 0;
    //         "TDS/TCS Incl. Surcharge (LCY)" := 0;
    //         "eCESS on TDS/TCS Amount (LCY)" := 0;
    //         "SHE Cess on TDS/TCS Amt (LCY)" := 0; */
    //         "Bal. TDS/TCS Including SHECESS" := 0;
    //     end;

    // end;


    // 
    // procedure CheckManualChangedLines(): Boolean
    // var
    //     StrOrderLines: Record "Structure Order Line Details";
    // begin
    //     StrOrderLines.Reset;
    //     StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
    //     StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
    //     StrOrderLines.SetRange("Document Type", "Document Type");
    //     StrOrderLines.SetRange("Document No.", "Document No.");
    //     StrOrderLines.SetRange("Line No.", "Line No.");
    //     StrOrderLines.SetRange("Item No.", "No.");
    //     StrOrderLines.SetRange("Manually Changed", true);
    //     exit(StrOrderLines.FindFirst);
    // end;
    //LKS-Raj Commented (Table Missing)


    procedure GetBaseAmount(var Amt: Decimal; SalesLine: Record "Sales Line") CVDEntry: Boolean
    var
        //DetailRG23D: Record "Detail RG 23 D";//LKS-Raj Commented (Table Missing)
        //RG23D: Record "RG 23 D";//LKS-Raj Commented (Table Missing)
        //TempRG23D: Record "RG 23 D" temporary;//LKS-Raj Commented (Table Missing)
        QuantityInCurrLine: Decimal;
        QtyInCurrLineAlreadyAdjusted: Decimal;
        RefQuantity: Decimal;
        AllQtyInCurrLineAdjusted: Boolean;
        RG23DEntryNo: Integer;
        CurrencyFactor: Decimal;
    begin
        // VSTF208159.begin
        // IF GetBaseAmtForReturnOrder(SalesLine,Amt,DocNo,CVDEntry) THEN
        // EXIT;
        // WITH SalesLine DO BEGIN
        // GetSalesHeader;
        // IF (SalesHeader."Currency Code" <> '') AND (SalesHeader."Currency Factor" <> 0) THEN
        // CurrencyFactor := SalesHeader."Currency Factor"
        // ELSE
        // CurrencyFactor := 1;
        //
        // BEDAmt := 0;
        // "AED(GSI)Amt" := 0;
        // "AED(TTA)Amt" := 0;
        // SEDAmt := 0;
        // SAEDAmt := 0;
        // CESSAmt := 0;
        // NCCDAmt := 0;
        // eCessAmt := 0;
        // SHECessAmt := 0;
        // ADETAmt := 0;
        // ADEAmt := 0;
        // Amt := 0;
        // ADCVATAmt := 0;
        //
        // CheckAvailableQty(DocNo);
        // RG23D.RESET;
        // RG23D.SETCURRENTKEY("Item No.","Posting Date","Transaction Type",Type,"Location Code");
        // RG23D.SETRANGE("Item No.","No.");
        // RG23D.SETRANGE("Transaction Type",RG23D."Transaction Type"::Purchase);
        // RG23D.SETRANGE("Location Code","Location Code");
        // RG23D.SETRANGE(Closed,FALSE);
        // IF RG23D.FINDSET THEN
        // REPEAT
        //  Location.CheckTradingLocation("Location Code");
        //  RG23D.CALCFIELDS("Remaining Quantity");
        //  Qty += RG23D."Remaining Quantity";
        //  IF NOT CVDEntry THEN
        //    CVDEntry := RG23D.CVD;
        //  IF Qty <= "Qty. to Invoice" THEN BEGIN
        //    Amt += RG23D."Excise Base Amt Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    BEDAmt += RG23D."BED Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    "AED(GSI)Amt" += RG23D."AED(GSI) Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    "AED(TTA)Amt" += RG23D."AED(TTA) Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    SEDAmt += RG23D."SED Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    SAEDAmt += RG23D."SAED Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    CESSAmt += RG23D."CESS Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    NCCDAmt += RG23D."NCCD Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    eCessAmt += RG23D."eCess Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    SHECessAmt += RG23D."SHE Cess Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    ADETAmt += RG23D."ADET Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    ADEAmt += RG23D."ADE Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    ADCVATAmt += RG23D."ADC VAT Amount Per Unit" * RG23D."Remaining Quantity" * CurrencyFactor;
        //    InitDetailRG23D(-RG23D."Remaining Quantity",RG23D."Entry No.");
        //  END;
        //  IF Qty > "Qty. to Invoice" THEN BEGIN
        //    Qty -= RG23D."Remaining Quantity";
        //    Amt += RG23D."Excise Base Amt Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    BEDAmt += RG23D."BED Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    "AED(GSI)Amt" += RG23D."AED(GSI) Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    "AED(TTA)Amt" += RG23D."AED(TTA) Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    SEDAmt += RG23D."SED Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    SAEDAmt += RG23D."SAED Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    CESSAmt += RG23D."CESS Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    NCCDAmt += RG23D."NCCD Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    eCessAmt += RG23D."eCess Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    SHECessAmt += RG23D."SHE Cess Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    ADETAmt += RG23D."ADET Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    ADEAmt += RG23D."ADE Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    ADCVATAmt += RG23D."ADC VAT Amount Per Unit" * ("Qty. to Invoice" - Qty) * CurrencyFactor;
        //    InitDetailRG23D(-("Qty. to Invoice" - Qty),RG23D."Entry No.");
        //    EXIT;
        //  END;
        // UNTIL RG23D.NEXT = 0;
        // END;
        //LKS-Raj Commented (Table Missing)
        // with SalesLine do begin
        //     GetSalesHeader;
        //     if (SalesHeader."Currency Code" <> '') and (SalesHeader."Currency Factor" <> 0) then
        //         CurrencyFactor := SalesHeader."Currency Factor"
        //     else
        //         CurrencyFactor := 1;
        //     TestField(Type, Type::Item);

        //     BEDAmt := 0;
        //     "AED(GSI)Amt" := 0;
        //     "AED(TTA)Amt" := 0;
        //     SEDAmt := 0;
        //     SAEDAmt := 0;
        //     CESSAmt := 0;
        //     NCCDAmt := 0;
        //     eCessAmt := 0;
        //     SHECessAmt := 0;
        //     ADETAmt := 0;
        //     ADEAmt := 0;
        //     Amt := 0;
        //     ADCVATAmt := 0;

        //     if ("Quantity Shipped" <> 0) or ("Return Qty. Received" <> 0) or ("Shipment No." <> '') or
        //        ("Return Receipt No." <> '')
        //     then begin
        //         DetailRG23D.Reset;
        //         if ("Quantity Shipped" <> 0) or ("Return Qty. Received" <> 0) then begin
        //             DetailRG23D.SetRange("Document Type", "Document Type");
        //             DetailRG23D.SetRange("Order No.", "Document No.");
        //             DetailRG23D.SetRange("Line No.", "Line No.");
        //         end else
        //             if "Shipment No." <> '' then begin
        //                 DetailRG23D.SetRange("Document Type", DetailRG23D."Document Type"::Order);
        //                 DetailRG23D.SetRange("Document No.", "Shipment No.");
        //                 DetailRG23D.SetRange("Line No.", "Shipment Line No.");
        //             end else
        //                 if "Return Receipt No." <> '' then begin
        //                     DetailRG23D.SetRange("Document Type", DetailRG23D."Document Type"::"Return Order");
        //                     DetailRG23D.SetRange("Document No.", "Return Receipt No.");
        //                     DetailRG23D.SetRange("Line No.", "Return Receipt Line No.");
        //                 end;
        //         if DetailRG23D.FindSet then
        //             repeat
        //                 RG23D.Get(DetailRG23D."RG 23 D Entry No.");
        //                 Location.CheckTradingLocation("Location Code");
        //                 if not CVDEntry then
        //                     CVDEntry := RG23D.CVD;
        //                 Amt += Abs(RG23D."Excise Base Amt Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 BEDAmt += Abs(RG23D."BED Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 "AED(GSI)Amt" += Abs(RG23D."AED(GSI) Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 "AED(TTA)Amt" += Abs(RG23D."AED(TTA) Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 SEDAmt += Abs(RG23D."SED Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 SAEDAmt += Abs(RG23D."SAED Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 CESSAmt += Abs(RG23D."CESS Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 NCCDAmt += Abs(RG23D."NCCD Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 eCessAmt += Abs(RG23D."eCess Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 SHECessAmt += Abs(RG23D."SHE Cess Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 ADETAmt += Abs(RG23D."ADET Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 ADEAmt += Abs(RG23D."ADE Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //                 ADCVATAmt += Abs(RG23D."ADC VAT Amount Per Unit") * Abs(DetailRG23D.Quantity) * CurrencyFactor;
        //             until DetailRG23D.Next = 0;
        //     end;
        //     if ("Shipment No." = '') and ("Return Receipt No." = '') then begin
        //         if Quantity - "Quantity Shipped" - "Return Qty. Received" <> 0 then begin
        //             QuantityInCurrLine := Quantity - "Quantity Shipped" - "Return Qty. Received";
        //             QtyInCurrLineAlreadyAdjusted := 0;
        //             GetSalesHeader;
        //             RG23D.Reset;
        //             RG23D.SetCurrentKey("Item No.", "Posting Date", "Transaction Type", Type, "Location Code");
        //             RG23D.SetRange("Item No.", "No.");
        //             if SalesHeader."Document Type" in
        //                [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
        //             then
        //                 RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Purchase)
        //             else begin
        //                 RG23D.SetRange("Document No.", SalesHeader."Applies-to Doc. No.");
        //                 RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Sale);
        //             end;
        //             RG23D.SetRange("Location Code", "Location Code");
        //             RG23D.SetRange(Closed, false);
        //             if RG23D.FindSet then
        //                 repeat
        //                     RefQuantity := 0;
        //                     if SalesHeader."Document Type" in
        //                        [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
        //                     then
        //                         RG23DEntryNo := RG23D."Entry No."
        //                     else
        //                         RG23DEntryNo := RG23D."Ref. Entry No.";
        //                     if not TempRG23DConsumedInCurrDoc.Get(RG23DEntryNo) then begin
        //                         if TempRG23DRemainder.Get(RG23DEntryNo) then begin
        //                             RefQuantity := TempRG23DRemainder.Quantity;
        //                             TempRG23DRemainder.Quantity :=
        //                               TempRG23DRemainder.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

        //                             if TempRG23DRemainder.Quantity <= 0 then begin
        //                                 TempRG23DConsumedInCurrDoc.TransferFields(TempRG23DRemainder);
        //                                 TempRG23DConsumedInCurrDoc.Insert;
        //                                 TempRG23DRemainder.Delete;
        //                             end else begin
        //                                 RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
        //                                 TempRG23DRemainder.Quantity := TempRG23DRemainder.Quantity - RefQuantity;
        //                                 TempRG23DRemainder.Modify;
        //                                 AllQtyInCurrLineAdjusted := true;
        //                             end;
        //                         end else begin
        //                             if SalesHeader."Document Type" in
        //                                [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
        //                             then begin
        //                                 RG23D.CalcFields("Remaining Quantity");
        //                                 TempRG23D.TransferFields(RG23D);
        //                                 TempRG23D.Quantity := RG23D."Remaining Quantity";
        //                             end else begin
        //                                 TempRG23D.TransferFields(RG23D);
        //                                 TempRG23D.Quantity := Abs(RG23D.Quantity);
        //                             end;
        //                             RefQuantity := TempRG23D.Quantity;
        //                             TempRG23D.Quantity :=
        //                               TempRG23D.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

        //                             if TempRG23D.Quantity <= 0 then begin
        //                                 TempRG23DConsumedInCurrDoc.TransferFields(RG23D);
        //                                 TempRG23DConsumedInCurrDoc.Insert;
        //                             end else begin
        //                                 AllQtyInCurrLineAdjusted := true;
        //                                 RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
        //                                 TempRG23DRemainder.TransferFields(RG23D);
        //                                 TempRG23DRemainder.Quantity := RG23D."Remaining Quantity" - RefQuantity;
        //                                 TempRG23DRemainder.Insert;
        //                             end;
        //                         end;

        //                         QtyInCurrLineAlreadyAdjusted := QtyInCurrLineAlreadyAdjusted + RefQuantity;
        //                         if not CVDEntry then
        //                             CVDEntry := RG23D.CVD;
        //                         Amt += Abs(RG23D."Excise Base Amt Per Unit") * RefQuantity * CurrencyFactor;
        //                         BEDAmt += Abs(RG23D."BED Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         "AED(GSI)Amt" += Abs(RG23D."AED(GSI) Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         "AED(TTA)Amt" += Abs(RG23D."AED(TTA) Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         SEDAmt += Abs(RG23D."SED Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         SAEDAmt += Abs(RG23D."SAED Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         CESSAmt += Abs(RG23D."CESS Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         NCCDAmt += Abs(RG23D."NCCD Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         eCessAmt += Abs(RG23D."eCess Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         SHECessAmt += Abs(RG23D."SHE Cess Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         ADETAmt += Abs(RG23D."ADET Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         ADEAmt += Abs(RG23D."ADE Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                         ADCVATAmt += Abs(RG23D."ADC VAT Amount Per Unit") * RefQuantity * CurrencyFactor;
        //                     end;
        //                 until (RG23D.Next = 0) or AllQtyInCurrLineAdjusted or (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted = 0);
        //         end;
        //     end;
        // end;
        //LKS-Raj Commented (Table Missing)
        // VSTF208159.end
    end;


    procedure GetBaseAmtForReturnOrder(SalesLine: Record "Sales Line"; var Amt: Decimal; var CVDEntry: Boolean): Boolean
    begin
        // VSTF208159.begin
        // WITH SalesLine DO BEGIN
        // GetSalesHeader;
        // IF NOT (SalesHeader."Document Type" IN [SalesHeader."Document Type"::"Return Order",
        // SalesHeader."Document Type"::"Credit Memo"]) AND (SalesHeader."Applies-to Doc. No."='')
        // THEN
        // EXIT(FALSE);
        // IF (SalesHeader."Currency Code" <> '') AND (SalesHeader."Currency Factor" <> 0) THEN
        // CurrencyFactor := SalesHeader."Currency Factor"
        // ELSE
        // CurrencyFactor := 1;
        //
        // Qty := "Qty. to Invoice";
        // BEDAmt := 0;
        // "AED(GSI)Amt" := 0;
        // "AED(TTA)Amt" := 0;
        // SEDAmt := 0;
        // SAEDAmt := 0;
        // CESSAmt := 0;
        // NCCDAmt := 0;
        // eCessAmt := 0;
        // SHECessAmt := 0;
        // ADETAmt := 0;
        // ADEAmt := 0;
        // ADCVATAmt := 0;
        // Amt := 0;
        // CheckAvailableQtyForReturn(DocNo);
        // Location.CheckTradingLocation("Location Code");
        // RG23D.RESET;
        // RG23D.SETCURRENTKEY("Item No.","Posting Date","Transaction Type",Type,"Location Code");
        // RG23D.SETRANGE("Item No.","No.");
        // RG23D.SETRANGE("Document No.",DocNo);
        // RG23D.SETRANGE("Transaction Type",RG23D."Transaction Type"::Sale);
        // RG23D.SETRANGE(Type,RG23D.Type::Invoice);
        // RG23D.SETRANGE("Location Code","Location Code");
        // IF RG23D.FINDSET THEN
        // REPEAT
        //  IF NOT CVDEntry THEN
        //    CVDEntry := RG23D.CVD;
        //  RefEntryNo := 0;
        //  Qty2 := 0;
        //  IF RG23D2.GET(RG23D."Ref. Entry No.") THEN;
        //  RG23D2.CALCFIELDS("Remaining Quantity");
        //  IF RG23D2."Remaining Quantity" <> RG23D2.Quantity THEN BEGIN
        //    Qty2 := RG23D2.Quantity - RG23D2."Remaining Quantity";
        //    IF Qty2 > Qty THEN
        //      Qty2 := Qty;
        //    Amt += -1 * RG23D."Excise Base Amt Per Unit" * Qty2 * CurrencyFactor;
        //    BEDAmt += -1 * RG23D."BED Amount Per Unit" * Qty2 * CurrencyFactor;
        //    "AED(GSI)Amt" += -1 * RG23D."AED(GSI) Amount Per Unit" * Qty2 * CurrencyFactor;
        //    "AED(TTA)Amt" += -1 * RG23D."AED(TTA) Amount Per Unit" * Qty2 * CurrencyFactor;
        //    SEDAmt += -1 * RG23D."SED Amount Per Unit" * Qty2 * CurrencyFactor;
        //    SAEDAmt += -1 * RG23D."SAED Amount Per Unit" * Qty2 * CurrencyFactor;
        //    CESSAmt += -1 * RG23D."CESS Amount Per Unit" * Qty2 * CurrencyFactor;
        //    NCCDAmt += -1 * RG23D."NCCD Amount Per Unit" * Qty2 * CurrencyFactor;
        //    eCessAmt += -1 * RG23D."eCess Amount Per Unit" * Qty2 * CurrencyFactor;
        //    SHECessAmt += -1 * RG23D."SHE Cess Amount Per Unit" * Qty2 * CurrencyFactor;
        //    ADETAmt += -1 * RG23D."ADET Amount Per Unit" * Qty2 * CurrencyFactor;
        //    ADEAmt += -1 * RG23D."ADE Amount Per Unit" * Qty2 * CurrencyFactor;
        //    ADCVATAmt += -1 * RG23D."ADC VAT Amount Per Unit" * Qty2 * CurrencyFactor;
        //
        //    RefEntryNo := GetRefEntryNo(RG23D);
        //    IF RefEntryNo <> 0 THEN
        //      InitDetailRG23D(Qty2,RefEntryNo);
        //  END;
        //  Qty -= Qty2;
        // UNTIL RG23D.NEXT = 0;
        // END;
        // EXIT(TRUE);
    end;


    procedure GetEntryNo(): Integer
    begin
        // VSTF208159.begin
        // DetailRG23D.RESET;
        // IF DetailRG23D.FINDLAST THEN
        // EXIT(DetailRG23D."Entry No." + 1)
        // ELSE
        // EXIT(1);
        // VSTF208159.end
    end;


    procedure InitDetailRG23D(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        //DetailRG23D: Record "Detail RG 23 D";//LKS-Raj Commented (Table Missing)
        //RG23D: Record "RG 23 D";//LKS-Raj Commented (Table Missing)
        //TempRG23D: Record "RG 23 D" temporary;//LKS-Raj Commented (Table Missing)
        QuantityInCurrLine: Decimal;
        QtyInCurrLineAlreadyAdjusted: Decimal;
        RefQuantity: Decimal;
        AllQtyInCurrLineAdjusted: Boolean;
        EntryNo: Integer;
    //TempRG23DInvtCheck: Record "RG 23 D" temporary;//LKS-Raj Commented (Table Missing)
    begin
        //LKS-Raj Commented (Table Missing)
        // // VSTF208159.begin
        // with SalesHeader do begin
        //     // IF Qty = 0 THEN
        //     // EXIT;
        //     // DetailRG23D.INIT;
        //     // DetailRG23D."Entry No." := GetEntryNo;
        //     // DetailRG23D."Document Type" := "Document Type";
        //     // DetailRG23D."Order No." := "Document No.";
        //     // DetailRG23D."Line No." := "Line No.";
        //     // DetailRG23D.Quantity := Qty;
        //     // DetailRG23D."RG 23 D Entry No." := EntryNo;
        //     // DetailRG23D."Transaction Type" := DetailRG23D."Transaction Type"::Sale;
        //     // DetailRG23D.INSERT(TRUE);
        //     if not Trading then
        //         exit;

        //     if (("Document Type" in ["Document Type"::Order, "Document Type"::Invoice]) and (not Ship)) or
        //        (("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and (not Receive))
        //     then
        //         exit;

        //     if InitDetailRG23DReturn(SalesHeader) then
        //         exit;

        //     TempRG23DRemainder.DeleteAll;
        //     TempRG23DConsumedInCurrDoc.DeleteAll;
        //     InvtBuffer[1].DeleteAll;
        //     TempRG23DInvtCheck.DeleteAll;

        //     SalesLine.Reset;
        //     SalesLine.SetRange("Document Type", "Document Type");
        //     SalesLine.SetRange("Document No.", "No.");
        //     SalesLine.SetRange(Type, SalesLine.Type::Item);
        //     if SalesLine.FindSet then
        //         repeat
        //             with SalesLine do begin
        //                 if "Shipment No." = '' then begin
        //                     if "Qty. to Ship" <> 0 then begin
        //                         Clear(InvtBuffer[1]);
        //                         InvtBuffer[1]."Item No." := "No.";
        //                         InvtBuffer[1].Quantity := -"Qty. to Ship";
        //                         InvtBuffer[2] := InvtBuffer[1];
        //                         if InvtBuffer[2].Find then begin
        //                             InvtBuffer[2].Quantity := InvtBuffer[2].Quantity + InvtBuffer[1].Quantity;
        //                             InvtBuffer[2].Modify;
        //                         end else
        //                             InvtBuffer[1].Insert;

        //                         QuantityInCurrLine := "Qty. to Ship";
        //                         QtyInCurrLineAlreadyAdjusted := 0;
        //                         AllQtyInCurrLineAdjusted := false;
        //                         RG23D.Reset;
        //                         RG23D.SetCurrentKey("Item No.", "Posting Date", "Transaction Type", Type, "Location Code");
        //                         RG23D.SetRange("Item No.", "No.");
        //                         RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Purchase);
        //                         RG23D.SetRange("Location Code", "Location Code");
        //                         RG23D.SetRange(Closed, false);
        //                         if RG23D.FindSet then
        //                             repeat
        //                                 RefQuantity := 0;
        //                                 RG23D.CalcFields("Remaining Quantity");
        //                                 if not TempRG23DInvtCheck.Get(RG23D."Entry No.") then begin
        //                                     TempRG23DInvtCheck."Entry No." := RG23D."Entry No.";
        //                                     TempRG23DInvtCheck.Insert;
        //                                     Clear(InvtBuffer[1]);
        //                                     InvtBuffer[1]."Item No." := "No.";
        //                                     InvtBuffer[1].Quantity := RG23D."Remaining Quantity";
        //                                     InvtBuffer[2] := InvtBuffer[1];
        //                                     if InvtBuffer[2].Find then begin
        //                                         InvtBuffer[2].Quantity := InvtBuffer[2].Quantity + InvtBuffer[1].Quantity;
        //                                         InvtBuffer[2].Modify;
        //                                     end else
        //                                         InvtBuffer[1].Insert;
        //                                 end;
        //                                 if not TempRG23DConsumedInCurrDoc.Get(RG23D."Entry No.") then begin
        //                                     if TempRG23DRemainder.Get(RG23D."Entry No.") then begin
        //                                         RefQuantity := TempRG23DRemainder.Quantity;
        //                                         TempRG23DRemainder.Quantity :=
        //                                           TempRG23DRemainder.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

        //                                         if TempRG23DRemainder.Quantity <= 0 then begin
        //                                             TempRG23DConsumedInCurrDoc.TransferFields(TempRG23DRemainder);
        //                                             TempRG23DConsumedInCurrDoc.Insert;
        //                                             TempRG23DRemainder.Delete;
        //                                         end else begin
        //                                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
        //                                             TempRG23DRemainder.Quantity := TempRG23DRemainder.Quantity - RefQuantity;
        //                                             TempRG23DRemainder.Modify;
        //                                             AllQtyInCurrLineAdjusted := true;
        //                                         end;
        //                                     end else begin
        //                                         TempRG23D.TransferFields(RG23D);
        //                                         TempRG23D.Quantity := RG23D."Remaining Quantity";
        //                                         RefQuantity := TempRG23D.Quantity;
        //                                         TempRG23D.Quantity :=
        //                                           TempRG23D.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

        //                                         if TempRG23D.Quantity <= 0 then begin
        //                                             TempRG23DConsumedInCurrDoc.TransferFields(RG23D);
        //                                             TempRG23DConsumedInCurrDoc.Insert;
        //                                         end else begin
        //                                             AllQtyInCurrLineAdjusted := true;
        //                                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
        //                                             TempRG23DRemainder.TransferFields(RG23D);
        //                                             TempRG23DRemainder.Quantity := RG23D."Remaining Quantity" - RefQuantity;
        //                                             TempRG23DRemainder.Insert;
        //                                         end;
        //                                     end;
        //                                     QtyInCurrLineAlreadyAdjusted := QtyInCurrLineAlreadyAdjusted + RefQuantity;

        //                                     DetailRG23D.Reset;
        //                                     if DetailRG23D.FindLast then
        //                                         EntryNo := DetailRG23D."Entry No." + 1
        //                                     else
        //                                         EntryNo := 1;

        //                                     DetailRG23D.Init;
        //                                     DetailRG23D."Entry No." := EntryNo;
        //                                     DetailRG23D."Document Type" := "Document Type";
        //                                     DetailRG23D."Order No." := "Document No.";
        //                                     DetailRG23D."Line No." := "Line No.";
        //                                     DetailRG23D.Quantity := -RefQuantity;
        //                                     DetailRG23D."RG 23 D Entry No." := RG23D."Entry No.";
        //                                     DetailRG23D."Transaction Type" := DetailRG23D."Transaction Type"::Sale;
        //                                     DetailRG23D.Insert(true);
        //                                 end;
        //                             until (RG23D.Next = 0) or AllQtyInCurrLineAdjusted or (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted = 0);
        //                     end;
        //                 end;
        //             end;
        //         until SalesLine.Next = 0;
        //     if InvtBuffer[1].Find('+') then
        //         repeat
        //             if InvtBuffer[1].Quantity < 0 then
        //                 Error(Text16500, InvtBuffer[1]."Item No.", Abs(InvtBuffer[1].Quantity));
        //         until InvtBuffer[1].Next(-1) = 0;
        // end;
        // // VSTF208159.end
        //LKS-Raj Commented (Table Missing)
    end;


    procedure CheckAvailableQty(DocNo: Code[20])
    begin
        // VSTF208159.begin
        // SalesLine.RESET;
        // SalesLine.SETCURRENTKEY("Document Type","Document No.",Type,"No.");
        // SalesLine.SETRANGE("Document Type","Document Type");
        // SalesLine.SETRANGE("Document No.","Document No.");
        // SalesLine.SETRANGE(Type,SalesLine.Type::Item);
        // SalesLine.SETRANGE("No.","No.");
        // SalesLine.CALCSUMS("Qty. to Invoice");
        //
        // GetSalesHeader;
        // Rg23D.RESET;
        // Rg23D.SETCURRENTKEY("Item No.","Posting Date","Transaction Type",Type,"Location Code");
        // Rg23D.SETRANGE("Item No.","No.");
        // IF SalesHeader."Applies-to Doc. No." <> '' THEN
        // Rg23D.SETRANGE("Document No.",DocNo);
        // Rg23D.SETRANGE("Transaction Type",Rg23D."Transaction Type"::Purchase);
        // Rg23D.SETRANGE("Location Code","Location Code");
        // Rg23D.SETRANGE(Closed,FALSE);
        // IF Rg23D.FINDSET THEN
        // REPEAT
        // DetailRg23D.RESET;
        // DetailRg23D.SETCURRENTKEY("RG 23 D Entry No.","Document No.");
        // DetailRg23D.SETRANGE("RG 23 D Entry No.",Rg23D."Entry No.");
        // DetailRg23D.SETFILTER("Document No.",'<>%1','');
        // DetailRg23D.CALCSUMS(Quantity);
        // QtyAllocated += DetailRg23D.Quantity;
        // UNTIL Rg23D.NEXT = 0;
        //
        // IF QtyAllocated < SalesLine."Qty. to Invoice" THEN
        // ERROR(Text16500,"No.",QtyAllocated,FIELDCAPTION("Qty. to Invoice"));
        // VSTF208159.end
    end;


    procedure CheckAvailableQtyForReturn(DocNo: Code[20])
    begin
        // VSTF208159.begin
        // SalesLine.RESET;
        // SalesLine.SETCURRENTKEY("Document Type","Document No.",Type,"No.");
        // SalesLine.SETRANGE("Document Type","Document Type");
        // SalesLine.SETRANGE("Document No.","Document No.");
        // SalesLine.SETRANGE(Type,SalesLine.Type::Item);
        // SalesLine.SETRANGE("No.","No.");
        // SalesLine.CALCSUMS("Qty. to Invoice");
        //
        // RG23D.RESET;
        // RG23D.SETCURRENTKEY("Item No.","Posting Date","Transaction Type",Type,"Location Code");
        // RG23D.SETRANGE("Item No.","No.");
        // RG23D.SETRANGE("Document No.",DocNo);
        // RG23D.SETRANGE("Transaction Type",RG23D."Transaction Type"::Sale);
        // RG23D.SETRANGE("Location Code","Location Code");
        // IF RG23D.FINDSET THEN
        // REPEAT
        //    QtyAllocated += ABS(RG23D.Quantity);
        // UNTIL RG23D.NEXT = 0;
        //
        // IF (QtyAllocated < SalesLine."Qty. to Invoice") OR (SalesLine."Qty. to Invoice" = 0) THEN
        // ERROR(Text16500,"No.",QtyAllocated,FIELDCAPTION("Qty. to Invoice"));
        // VSTF208159.end
    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure GetRefEntryNo(var RG23D: Record "RG 23 D"): Integer
    // begin
    //     // VSTF208159.begin
    //     // RG23D2.COPYFILTERS(RG23D);
    //     // IF RG23D2.FINDSET THEN
    //     // REPEAT
    //     // IF RG23D3.GET(RG23D2."Ref. Entry No.") THEN;
    //     // RG23D3.CALCFIELDS("Remaining Quantity");
    //     // IF RG23D3."Remaining Quantity" < RG23D3.Quantity THEN
    //     //  EXIT(RG23D3."Entry No.");
    //     // UNTIL RG23D2.NEXT = 0;
    //     // VSTF208159.end
    // end;

    // 
    // procedure GetCompanyInformation()
    // begin
    //     if not CompanyInfoRead then begin
    //         CompanyInfo.Get;
    //         CompanyInfoRead := true;
    //     end;
    // end;

    // 
    // procedure GetStandardDeduction(var SalesHeader: Record "Sales Header")
    // var
    //     TaxDetail: Record "Tax Detail";
    //     TaxAreaLine: Record "Tax Area Line";
    //     TaxArea: Record "Tax Area";
    //     StrOrderDetails: Record "Structure Order Details";
    // begin
    //     "Standard Deduction %" := 0;
    //     StrOrderDetails.Reset;
    //     StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //     StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //     StrOrderDetails.SetRange("Document Type", "Document Type");
    //     StrOrderDetails.SetRange("Document No.", "Document No.");
    //     if "Price Inclusive of Tax" then
    //         StrOrderDetails.SetRange("Document Line No.", "Line No.")
    //     else
    //         StrOrderDetails.SetRange("Document Line No.", 0);
    //     StrOrderDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type"::"Sales Tax");
    //     if StrOrderDetails.FindFirst then begin
    //         if "Tax Area Code" = '' then
    //             exit;
    //         TaxArea.SetRange(Code, "Tax Area Code");
    //         if TaxArea.FindFirst then
    //             TaxAreaLine.SetFilter("Tax Area", TaxArea.Code);

    //         if TaxAreaLine.FindSet then
    //             repeat
    //                 TaxDetail.SetFilter("Tax Jurisdiction Code", TaxAreaLine."Tax Jurisdiction Code");
    //                 TaxDetail.SetRange("Tax Group Code", "Tax Group Code");
    //                 TaxDetail.SetFilter("Effective Date", '<=%1', SalesHeader."Posting Date");
    //                 TaxDetail.SetFilter("Form Code", '%1', "Form Code");
    //                 if TaxDetail.FindLast then
    //                     "Standard Deduction %" := TaxDetail."Standard Deduction %"
    //             until TaxAreaLine.Next = 0;
    //     end;
    // end;

    // 
    // procedure GetSalesPriceExclusiveTaxes(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     StructureDetails: Record "Structure Details";
    //     StrOrderDetails: Record "Structure Order Details";
    //     StrOrderLineDetails: Record "Structure Order Line Details";
    //     StrOrderLines: Record "Structure Order Line Details";
    //     BaseAmount: Decimal;
    //     CFactor: Decimal;
    //     BaseAmountFixed: Decimal;
    //     BaseAmountVariable: Decimal;
    //     SalesLineBuffer: Record "Sale Line Detail Buffer";
    //     FixedAmt: Decimal;
    //     VariableAmt: Decimal;
    //     CalcInvDis: Codeunit "Sales-Calc. Discount";
    //     I: Integer;
    // begin
    //     with SalesHeader do begin
    //         StrOrderLines.LockTable;
    //         StrOrderLineDetails.LockTable;
    //         CalcFields("Price Inclusive of Taxes");
    //         for I := 1 to 2 do begin
    //             StrOrderLines.Reset;
    //             StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
    //             StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
    //             StrOrderLines.SetRange("Document Type", "Document Type");
    //             StrOrderLines.SetRange("Document No.", "No.");
    //             StrOrderLines.SetRange("Price Inclusive of Tax", true);
    //             if not Trading then
    //                 StrOrderLines.SetRange("Manually Changed", false);
    //             if StrOrderLines.FindFirst then
    //                 StrOrderLines.DeleteAll(true);

    //             SalesLine.Reset;
    //             SalesLine.SetRange("Document Type", "Document Type");
    //             SalesLine.SetRange("Document No.", "No.");
    //             SalesLine.SetRange("Price Inclusive of Tax", true);
    //             if SalesLine.Find('-') then begin
    //                 if "Calc. Inv. Discount (%)" and (I = 2) then begin
    //                     CalcInvDis.CalculateWithSalesHeaderPIT(SalesHeader, SalesLine);
    //                     SalesLine.Reset;
    //                     SalesLine.SetRange("Document Type", "Document Type");
    //                     SalesLine.SetRange("Document No.", "No.");
    //                     SalesLine.SetRange("Price Inclusive of Tax", true);
    //                     if SalesLine.Find('-') then;
    //                 end;
    //                 repeat
    //                     SalesLine.TestField("PIT Structure");
    //                     StructureDetails.Reset;
    //                     StructureDetails.SetRange(Code, SalesLine."PIT Structure");
    //                     StructureDetails.SetRange("Include PIT Calculation", true);
    //                     if not StructureDetails.FindFirst then
    //                         Error(Text16504, SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.");
    //                     if SalesLine.Quantity <> 0 then
    //                         with SalesLine do begin
    //                             SalesHeader.TestField("Free Supply", false);
    //                             SalesHeader.TestField(Trading, false);
    //                             "Amount Added to Excise Base" := 0;
    //                             "Amount Added to Tax Base" := 0;
    //                             "VAT Base Amount" := 0;
    //                             "Excise Base Variable" := 0;
    //                             "Tax Base Variable" := 0;
    //                             if (not SalesHeader."Calc. Inv. Discount (%)") or (I = 1) then begin
    //                                 "Inv Discount Fixed" := 0;
    //                                 "Inv Discount Variable" := 0;
    //                             end;
    //                             TestField(CVD, false);
    //                             TestField("Unit Price Incl. of Tax");
    //                             "Total UPIT Amount" := "Unit Price Incl. of Tax" * Quantity;
    //                             GetStandardDeduction(SalesHeader);
    //                             StrOrderDetails.Reset;
    //                             StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                             StrOrderDetails.SetRange("Document Type", "Document Type");
    //                             StrOrderDetails.SetRange("Document No.", "Document No.");
    //                             StrOrderDetails.SetRange("Document Line No.", "Line No.");
    //                             StrOrderDetails.SetRange("Include PIT Calculation", true);
    //                             if StrOrderDetails.FindSet then
    //                                 repeat
    //                                     if SalesHeader."Price Inclusive of Taxes" then
    //                                         StructureDetails.TestField(CVD, false);
    //                                     BaseAmountFixed := 0;
    //                                     BaseAmountVariable := 0;
    //                                     BaseAmount := 0;
    //                                     StrOrderLineDetails.Reset;
    //                                     StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                                     StrOrderLineDetails.SetRange("Calculation Order", StrOrderDetails."Calculation Order");
    //                                     StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                                     StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                                     StrOrderLineDetails.SetRange("Structure Code", Structure);
    //                                     StrOrderLineDetails.SetRange("Item No.", "No.");
    //                                     StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                                     if not StrOrderLineDetails.FindFirst then begin
    //                                         StrOrderLineDetails.Init;
    //                                         StrOrderLineDetails.Type := StrOrderDetails.Type;
    //                                         StrOrderLineDetails."Document Type" := StrOrderDetails."Document Type";
    //                                         StrOrderLineDetails."Document No." := StrOrderDetails."Document No.";
    //                                         StrOrderLineDetails."Structure Code" := StrOrderDetails."Structure Code";
    //                                         StrOrderLineDetails."Item No." := "No.";
    //                                         StrOrderLineDetails."Line No." := "Line No.";
    //                                         StrOrderLineDetails."Calculation Order" := StrOrderDetails."Calculation Order";
    //                                         StrOrderLineDetails."Tax/Charge Type" := StrOrderDetails."Tax/Charge Type";
    //                                         StrOrderLineDetails."Tax/Charge Group" := StrOrderDetails."Tax/Charge Group";
    //                                         StrOrderLineDetails."Tax/Charge Code" := StrOrderDetails."Tax/Charge Code";
    //                                         StrOrderLineDetails."Calculation Type" := StrOrderDetails."Calculation Type";
    //                                         StrOrderLineDetails."Calculation Value" := StrOrderDetails."Calculation Value";
    //                                         StrOrderLineDetails."Quantity Per" := StrOrderDetails."Quantity Per";
    //                                         StrOrderLineDetails."Loading on Inventory" := StrOrderDetails."Loading on Inventory";
    //                                         StrOrderLineDetails."% Loading on Inventory" := StrOrderDetails."% Loading on Inventory";
    //                                         StrOrderLineDetails."Header/Line" := StrOrderDetails."Header/Line";
    //                                         StrOrderLineDetails."Include Base" := StrOrderDetails."Include Base";
    //                                         StrOrderLineDetails."Include Line Discount" := StrOrderDetails."Include Line Discount";
    //                                         StrOrderLineDetails."Include Invoice Discount" := StrOrderDetails."Include Invoice Discount";
    //                                         StrOrderLineDetails."Payable to Third Party" := StrOrderDetails."Payable to Third Party";
    //                                         StrOrderLineDetails.LCY := StrOrderDetails.LCY;
    //                                         StrOrderLineDetails."Available for VAT input" := StrOrderDetails."Available for VAT Input";
    //                                         StrOrderLineDetails.CVD := StrOrderDetails.CVD;
    //                                         StrOrderLineDetails."Price Inclusive of Tax" := StrOrderDetails."Price Inclusive of Tax";
    //                                         StrOrderLineDetails."Include PIT Calculation" := StrOrderDetails."Include PIT Calculation";
    //                                         if StrOrderDetails."Payable to Third Party" then
    //                                             StrOrderDetails.TestField("Third Party Code");
    //                                         StrOrderLineDetails."Third Party Code" := StrOrderDetails."Third Party Code";
    //                                         if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                             (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                         then
    //                                             StrOrderDetails.TestField("Account No.");
    //                                         StrOrderLineDetails."Account No." := StrOrderDetails."Account No.";
    //                                         StrOrderLineDetails."Base Formula" := StrOrderDetails."Base Formula";
    //                                         if StrOrderLineDetails."Base Formula" <> '' then begin
    //                                             EvaluateExpressionPIT(true, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails,
    //                                               BaseAmountFixed);
    //                                             EvaluateExpressionPITVariable(true, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails,
    //                                               BaseAmountVariable);
    //                                         end else begin
    //                                             BaseAmountFixed := 0;
    //                                             BaseAmountVariable := 0;
    //                                         end;

    //                                         if StrOrderDetails."Include Base" then
    //                                             BaseAmountVariable := BaseAmountVariable + Quantity;
    //                                         if StrOrderDetails."Include Line Discount" then
    //                                             BaseAmountFixed := BaseAmountFixed - "Line Discount Amount";
    //                                         if StrOrderDetails."Include Invoice Discount" then begin
    //                                             BaseAmountFixed := BaseAmountFixed + "Inv Discount Fixed";
    //                                             BaseAmountVariable := BaseAmountVariable - "Inv Discount Variable";
    //                                         end;

    //                                         if SalesHeader."Currency Factor" <> 0 then
    //                                             CFactor := SalesHeader."Currency Factor"
    //                                         else
    //                                             CFactor := 1;

    //                                         if not StrOrderDetails.LCY then
    //                                             CFactor := 1;

    //                                         if Type = Type::Item then
    //                                             if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                                 (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                             then begin
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" then begin
    //                                                     StrOrderLineDetails."Fixed Base Amount" := 0;
    //                                                     StrOrderLineDetails."Fixed Amount" := (StrOrderDetails."Calculation Value" * CFactor);
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage then begin
    //                                                     StrOrderLineDetails."Fixed Base Amount" := BaseAmountFixed;
    //                                                     StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
    //                                                     StrOrderLineDetails."Variable Amount" := (StrOrderDetails."Calculation Value" * CFactor) *
    //                                                       BaseAmountVariable / 100;
    //                                                     StrOrderLineDetails."Fixed Amount" := (StrOrderDetails."Calculation Value" * CFactor) *
    //                                                       BaseAmountFixed / 100;
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" then begin
    //                                                     StrOrderLineDetails."Fixed Base Amount" := 0;
    //                                                     StrOrderLineDetails."Fixed Amount" :=
    //                                                       (StrOrderDetails."Calculation Value" * CFactor) * Quantity / StrOrderDetails."Quantity Per";
    //                                                 end;
    //                                             end;

    //                                         if Type in [Type::Item] then
    //                                             if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise then begin
    //                                                 if Trading then begin
    //                                                     // VSTF203964.begin
    //                                                     if ExecuteDetailRg23D then begin
    //                                                         // VSTF203964.end
    //                                                         // VSTF208159.begin
    //                                                         // CVD := GetBaseAmount(BaseAmountFixed,SalesLine,SalesHeader."Applies-to Doc. No.");
    //                                                         CVD := GetBaseAmount(BaseAmountFixed, SalesLine);
    //                                                         // VSTF208159.end
    //                                                         if not MRP then
    //                                                             "Amount Added to Excise Base" := BaseAmountFixed
    //                                                         else
    //                                                             "Amount Added to Excise Base" := "MRP Price" * "Quantity (Base)" * (1 - "Abatement %" / 100);
    //                                                         "Excise Base Variable" := BaseAmountVariable;
    //                                                         if "Amount Added to Excise Base" <> 0 then
    //                                                             "Excise Base Amount" := "Amount Added to Excise Base";
    //                                                         UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
    //                                                         StrOrderLineDetails."Fixed Base Amount" := "Amount Added to Excise Base";
    //                                                         StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
    //                                                         // VSTF203964.begin
    //                                                     end;
    //                                                     // VSTF203964.end
    //                                                 end else begin
    //                                                     if not MRP then
    //                                                         "Amount Added to Excise Base" := BaseAmountFixed
    //                                                     else
    //                                                         "Amount Added to Excise Base" := "MRP Price" * "Quantity (Base)" * (1 - "Abatement %" / 100);
    //                                                     "Excise Base Variable" := BaseAmountVariable;
    //                                                     CVD := StrOrderDetails.CVD;
    //                                                     if CVD and ("CIF Amount" + "BCD Amount" <> 0) then begin
    //                                                         "Amount Added to Excise Base" := "CIF Amount" + "BCD Amount";
    //                                                         BaseAmountFixed := "CIF Amount" + "BCD Amount";
    //                                                     end;
    //                                                     if "Amount Added to Excise Base" <> 0 then
    //                                                         "Excise Base Amount" := "Amount Added to Excise Base";
    //                                                     UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
    //                                                     StrOrderLineDetails."Fixed Base Amount" := BaseAmountFixed;
    //                                                     StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
    //                                                 end;
    //                                                 StrOrderLineDetails."Fixed Amount" := 0;
    //                                                 StrOrderLineDetails."Variable Amount" := 0;
    //                                                 SalesLineBuffer.Reset;
    //                                                 SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                                                 SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                                                 SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                                                 SalesLineBuffer.SetRange(Type, StrOrderLineDetails."Tax/Charge Type");
    //                                                 if SalesLineBuffer.FindSet then
    //                                                     repeat
    //                                                         StrOrderLineDetails."Fixed Amount" := StrOrderLineDetails."Fixed Amount" +
    //                                                           SalesLineBuffer."Fixed Amount";
    //                                                         StrOrderLineDetails."Variable Amount" := StrOrderLineDetails."Variable Amount" +
    //                                                           SalesLineBuffer."Variable Amount";
    //                                                     until SalesLineBuffer.Next = 0;
    //                                             end;

    //                                         if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" then begin
    //                                             "Amount Added to Tax Base" := Round(BaseAmountFixed, Currency."Amount Rounding Precision");
    //                                             "Tax Base Variable" := BaseAmountVariable;
    //                                             UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
    //                                             StrOrderLineDetails."Base Amount" := "Tax Base Amount";
    //                                             StrOrderLineDetails.Amount := "Amount Including Tax" - "Tax Base Amount";

    //                                             StrOrderLineDetails."Fixed Amount" := 0;
    //                                             StrOrderLineDetails."Variable Amount" := 0;
    //                                             SalesLineBuffer.Reset;
    //                                             SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                                             SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                                             SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                                             SalesLineBuffer.SetRange(Type, StrOrderLineDetails."Tax/Charge Type");
    //                                             if SalesLineBuffer.FindSet then
    //                                                 repeat
    //                                                     StrOrderLineDetails."Fixed Amount" := StrOrderLineDetails."Fixed Amount" +
    //                                                       SalesLineBuffer."Fixed Amount";
    //                                                     StrOrderLineDetails."Variable Amount" := StrOrderLineDetails."Variable Amount" +
    //                                                       SalesLineBuffer."Variable Amount";
    //                                                 until SalesLineBuffer.Next = 0;
    //                                         end;

    //                                         if "Currency Factor" <> 0 then
    //                                             CFactor := "Currency Factor"
    //                                         else
    //                                             CFactor := 1;

    //                                         if "Currency Code" <> '' then
    //                                             Currency.Get("Currency Code");

    //                                         StrOrderLineDetails.Insert;
    //                                     end;
    //                                 until StrOrderDetails.Next = 0;

    //                             FixedAmt := 0;
    //                             VariableAmt := 0;
    //                             FixedAmt := "Unit Price Incl. of Tax" * Quantity;
    //                             VariableAmt := Quantity;
    //                             StrOrderLineDetails.Reset;
    //                             StrOrderLineDetails.SetCurrentKey(Type, "Document Type", "Document No.", "Structure Code", "Item No.", "Line No.");
    //                             StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                             StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                             StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                             StrOrderLineDetails.SetRange("Structure Code", "PIT Structure");
    //                             StrOrderLineDetails.SetRange("Item No.", "No.");
    //                             StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                             StrOrderLineDetails.CalcSums("Fixed Amount", "Variable Amount");
    //                             FixedAmt -= StrOrderLineDetails."Fixed Amount";
    //                             VariableAmt += StrOrderLineDetails."Variable Amount";
    //                             "Unit Price" := 0;
    //                             if VariableAmt <> 0 then begin
    //                                 "Unit Price" := Round(FixedAmt / VariableAmt, GetRoundingPrecisionUnitPrice);
    //                                 if "Unit Price" < 0 then
    //                                     FieldError("Unit Price");
    //                                 ValidateUnitPrice;
    //                                 ChkQtyUpdatioAfterDDPLA;
    //                             end;
    //                         end;
    //                     SalesLine.Modify;
    //                 until SalesLine.Next = 0;
    //                 if I = 2 then begin
    //                     if "Calc. Inv. Discount (%)" then
    //                         CalcInvDis.CalculateWithSalesHeader(SalesHeader, SalesLine);
    //                     CalculateStructuresPIT(SalesHeader);
    //                 end;
    //             end;
    //         end;
    //     end;
    // end;

    // local procedure EvaluateExpressionPIT(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"; var StructureOrderDetails: Record "Structure Order Details"; var BaseAmountFixed: Decimal): Decimal
    // var
    //     StrOrderLineDetails2: Record "Structure Order Line Details";
    //     StructureOrderDetails1: Record "Structure Order Details";
    //     Result: Decimal;
    //     CallLevel: Integer;
    //     Parantheses: Integer;
    //     IsExpression: Boolean;
    //     Operators: Text[8];
    //     OperatorNo: Integer;
    //     IsFilter: Boolean;
    //     i: Integer;
    //     RightResult: Decimal;
    //     LeftResult: Decimal;
    //     RightOperand: Text[250];
    //     LeftOperand: Text[250];
    //     Operator: Char;
    //     DivisionError: Boolean;
    //     Exp: Integer;
    // begin
    //     Result := 0;
    //     CallLevel := CallLevel + 1;
    //     while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
    //         Expression := CopyStr(Expression, 2);
    //     if Expression <> '' then
    //         while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
    //             Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
    //     if StrLen(Expression) > 0 then begin
    //         Parantheses := 0;
    //         IsExpression := false;
    //         Operators := '+-*/^';
    //         OperatorNo := 1;
    //         repeat
    //             i := StrLen(Expression);
    //             repeat
    //                 if Expression[i] = '(' then
    //                     Parantheses := Parantheses + 1
    //                 else
    //                     if Expression[i] = ')' then
    //                         Parantheses := Parantheses - 1;
    //                 if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
    //                     IsExpression := true
    //                 else
    //                     i := i - 1;
    //             until IsExpression or (i <= 0);
    //             if not IsExpression then
    //                 OperatorNo := OperatorNo + 1;
    //         until (OperatorNo > StrLen(Operators)) or IsExpression;
    //         if IsExpression then begin
    //             if i > 1 then begin
    //                 LeftOperand := CopyStr(Expression, 1, i - 1);
    //             end else
    //                 LeftOperand := '';
    //             if i < StrLen(Expression) then begin
    //                 RightOperand := CopyStr(Expression, i + 1);
    //             end else
    //                 RightOperand := '';
    //             Operator := Expression[i];
    //             LeftResult := EvaluateExpressionPIT(IsTestExpression, LeftOperand, SalesLine, StructureOrderDetails, BaseAmountFixed);
    //             RightResult := EvaluateExpressionPIT(IsTestExpression, RightOperand, SalesLine, StructureOrderDetails, BaseAmountFixed);
    //             case Operator of
    //                 '^':
    //                     Result := Power(LeftResult, RightResult);
    //                 '*':
    //                     Result := LeftResult * RightResult;
    //                 '/':
    //                     if RightResult = 0 then begin
    //                         Result := 0;
    //                         DivisionError := true;
    //                     end else
    //                         Result := LeftResult / RightResult;
    //                 '+':
    //                     Result := LeftResult + RightResult;
    //                 '-':
    //                     Result := LeftResult - RightResult;
    //             end;
    //         end else
    //             if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
    //                 Result :=
    //                   EvaluateExpressionPIT(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine,
    //                     StructureOrderDetails, BaseAmountFixed)
    //             else begin
    //                 IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
    //                              StrPos(Expression, '<') + StrPos(Expression, '>') +
    //                              StrPos(Expression, '=') > 0);
    //                 if (StrLen(Expression) > 10) and (not IsFilter) then
    //                     Evaluate(Result, Expression)
    //                 else
    //                     if IsTestExpression then begin
    //                         Evaluate(Exp, Expression);
    //                         StructureOrderDetails1.SetRange(Type, StructureOrderDetails1.Type::Sale);
    //                         StructureOrderDetails1.SetRange("Document Type", StructureOrderDetails."Document Type");
    //                         StructureOrderDetails1.SetRange("Document No.", StructureOrderDetails."Document No.");
    //                         StructureOrderDetails1.SetRange("Structure Code", StructureOrderDetails."Structure Code");
    //                         StructureOrderDetails1.SetRange("Calculation Order", Exp);
    //                         StructureOrderDetails1.SetRange("Document Line No.", StructureOrderDetails."Document Line No.");
    //                         if StructureOrderDetails1.FindFirst then begin
    //                             StrOrderLineDetails2.Reset;
    //                             StrOrderLineDetails2.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderLineDetails2.SetRange("Document Type", StructureOrderDetails1."Document Type");
    //                             StrOrderLineDetails2.SetRange("Document No.", StructureOrderDetails1."Document No.");
    //                             StrOrderLineDetails2.SetRange("Item No.", SalesLine."No.");
    //                             StrOrderLineDetails2.SetRange("Line No.", SalesLine."Line No.");
    //                             StrOrderLineDetails2.SetRange("Structure Code", StructureOrderDetails1."Structure Code");
    //                             StrOrderLineDetails2.SetRange("Tax/Charge Code", StructureOrderDetails1."Tax/Charge Code");
    //                             Evaluate(Exp, Expression);
    //                             StrOrderLineDetails2.SetRange("Calculation Order", Exp);
    //                             if StrOrderLineDetails2.FindFirst then
    //                                 Result := Result + StrOrderLineDetails2."Fixed Amount";
    //                         end else
    //                             Evaluate(Result, Expression);
    //                     end;
    //             end;
    //     end;
    //     CallLevel := CallLevel - 1;
    //     BaseAmountFixed := Result;
    //     exit(Result);
    // end;

    // local procedure EvaluateExpressionPITVariable(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"; var StructureOrderDetails: Record "Structure Order Details"; var BaseAmountVariable: Decimal): Decimal
    // var
    //     StrOrderLineDetails2: Record "Structure Order Line Details";
    //     StructureOrderDetails1: Record "Structure Order Details";
    //     Result: Decimal;
    //     CallLevel: Integer;
    //     Parantheses: Integer;
    //     IsExpression: Boolean;
    //     Operators: Text[8];
    //     OperatorNo: Integer;
    //     IsFilter: Boolean;
    //     i: Integer;
    //     RightResult: Decimal;
    //     LeftResult: Decimal;
    //     RightOperand: Text[250];
    //     LeftOperand: Text[250];
    //     Operator: Char;
    //     DivisionError: Boolean;
    //     Exp: Integer;
    // begin
    //     Result := 0;
    //     CallLevel := CallLevel + 1;
    //     while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
    //         Expression := CopyStr(Expression, 2);
    //     if Expression <> '' then
    //         while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
    //             Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
    //     if StrLen(Expression) > 0 then begin
    //         Parantheses := 0;
    //         IsExpression := false;
    //         Operators := '+-*/^';
    //         OperatorNo := 1;
    //         repeat
    //             i := StrLen(Expression);
    //             repeat
    //                 if Expression[i] = '(' then
    //                     Parantheses := Parantheses + 1
    //                 else
    //                     if Expression[i] = ')' then
    //                         Parantheses := Parantheses - 1;
    //                 if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
    //                     IsExpression := true
    //                 else
    //                     i := i - 1;
    //             until IsExpression or (i <= 0);
    //             if not IsExpression then
    //                 OperatorNo := OperatorNo + 1;
    //         until (OperatorNo > StrLen(Operators)) or IsExpression;
    //         if IsExpression then begin
    //             if i > 1 then begin
    //                 LeftOperand := CopyStr(Expression, 1, i - 1);
    //             end else
    //                 LeftOperand := '';
    //             if i < StrLen(Expression) then begin
    //                 RightOperand := CopyStr(Expression, i + 1);
    //             end else
    //                 RightOperand := '';
    //             Operator := Expression[i];
    //             LeftResult := EvaluateExpressionPITVariable(IsTestExpression, LeftOperand, SalesLine, StructureOrderDetails, BaseAmountVariable)
    //               ;
    //             RightResult := EvaluateExpressionPITVariable(IsTestExpression, RightOperand, SalesLine, StructureOrderDetails,
    //                 BaseAmountVariable);
    //             case Operator of
    //                 '^':
    //                     Result := Power(LeftResult, RightResult);
    //                 '*':
    //                     Result := LeftResult * RightResult;
    //                 '/':
    //                     if RightResult = 0 then begin
    //                         Result := 0;
    //                         DivisionError := true;
    //                     end else
    //                         Result := LeftResult / RightResult;
    //                 '+':
    //                     Result := LeftResult + RightResult;
    //                 '-':
    //                     Result := LeftResult - RightResult;
    //             end;
    //         end else
    //             if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
    //                 Result :=
    //                   EvaluateExpressionPITVariable(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine,
    //                     StructureOrderDetails, BaseAmountVariable)
    //             else begin
    //                 IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
    //                              StrPos(Expression, '<') + StrPos(Expression, '>') +
    //                              StrPos(Expression, '=') > 0);
    //                 if (StrLen(Expression) > 10) and (not IsFilter) then
    //                     Evaluate(Result, Expression)
    //                 else
    //                     if IsTestExpression then begin
    //                         Evaluate(Exp, Expression);
    //                         StructureOrderDetails1.SetRange(Type, StructureOrderDetails1.Type::Sale);
    //                         StructureOrderDetails1.SetRange("Document Type", StructureOrderDetails."Document Type");
    //                         StructureOrderDetails1.SetRange("Document No.", StructureOrderDetails."Document No.");
    //                         StructureOrderDetails1.SetRange("Structure Code", StructureOrderDetails."Structure Code");
    //                         StructureOrderDetails1.SetRange("Document Line No.", StructureOrderDetails."Document Line No.");
    //                         StructureOrderDetails1.SetRange("Calculation Order", Exp);
    //                         if StructureOrderDetails1.FindFirst then begin
    //                             StrOrderLineDetails2.Reset;
    //                             StrOrderLineDetails2.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderLineDetails2.SetRange("Document Type", StructureOrderDetails1."Document Type");
    //                             StrOrderLineDetails2.SetRange("Document No.", StructureOrderDetails1."Document No.");
    //                             StrOrderLineDetails2.SetRange("Item No.", SalesLine."No.");
    //                             StrOrderLineDetails2.SetRange("Line No.", SalesLine."Line No.");
    //                             StrOrderLineDetails2.SetRange("Structure Code", StructureOrderDetails1."Structure Code");
    //                             StrOrderLineDetails2.SetRange("Tax/Charge Code", StructureOrderDetails1."Tax/Charge Code");
    //                             Evaluate(Exp, Expression);
    //                             StrOrderLineDetails2.SetRange("Calculation Order", Exp);
    //                             if StrOrderLineDetails2.FindFirst then
    //                                 Result := Result + StrOrderLineDetails2."Variable Amount";
    //                         end else
    //                             Evaluate(Result, Expression);
    //                     end;
    //             end;
    //     end;
    //     CallLevel := CallLevel - 1;
    //     BaseAmountVariable := Result;
    //     exit(Result);
    // end;

    // 
    // procedure UpdateExciseAmountPIT(SalesLine: Record "Sales Line")
    // var
    //     ExciseProdPostingGrp: Record "Excise Prod. Posting Group";
    //     ItemUOM: Record "Item Unit of Measure";
    //     ExcisePostingSetup: Record "Excise Posting Setup";
    //     SalesLineBuffer: Record "Sale Line Detail Buffer";
    // begin
    //     GetSalesHeader;
    //     if ("Amount Added to Excise Base" <> 0) or ("Excise Base Variable" <> 0) then begin
    //         "Excise Base Amount" := "Amount Added to Excise Base";
    //         if ExciseProdPostingGrp.Get("Excise Prod. Posting Group") then begin
    //             if ExciseProdPostingGrp."Unit of Measure Code" <> '' then begin
    //                 if Type = Type::Item then begin
    //                     if ItemUOM.Get("No.", ExciseProdPostingGrp."Unit of Measure Code") then begin
    //                         "Excise Base Quantity" := Round("Quantity (Base)" / ItemUOM."Qty. per Unit of Measure");
    //                     end else
    //                         "Excise Base Quantity" := 0;
    //                 end else
    //                     if Type = Type::"Fixed Asset" then
    //                         "Excise Base Quantity" := Quantity;
    //             end else
    //                 "Excise Base Quantity" := "Quantity (Base)";
    //         end;

    //         ExcisePostingSetup.SetRange("Excise Bus. Posting Group", "Excise Bus. Posting Group");
    //         ExcisePostingSetup.SetRange("Excise Prod. Posting Group", "Excise Prod. Posting Group");
    //         if SalesHeader."Posting Date" <> 0D then
    //             ExcisePostingSetup.SetRange("From Date", 0D, SalesHeader."Posting Date")
    //         else
    //             ExcisePostingSetup.SetRange("From Date", 0D, WorkDate);
    //         if ExcisePostingSetup.FindLast then begin
    //             SalesLineBuffer.Reset;
    //             SalesLineBuffer.SetRange("Document Type", "Document Type");
    //             SalesLineBuffer.SetRange("Document No.", "Document No.");
    //             SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //             SalesLineBuffer.SetRange(Type, SalesLineBuffer.Type::Excise);
    //             SalesLineBuffer.SetRange("Component Code", 1);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."BED Calculation Type" of
    //                     ExcisePostingSetup."BED Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."BED Calculation Formula" <> '' then begin
    //                                     //SalesLineBuffer."Fixed Amount" :=
    //                                     //  (EvaluateExpressionFixed(TRUE,ExcisePostingSetup."BED Calculation Formula",Rec) *
    //                                     // ExcisePostingSetup."BED %" / 100);
    //                                     //SalesLineBuffer."Variable Amount" :=
    //                                     //  EvaluateExpressionVariable(TRUE,ExcisePostingSetup."BED Calculation Formula",Rec) *
    //                                     //  ExcisePostingSetup."BED %" / 100;
    //                                 end else begin
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."BED %" * "Excise Base Amount" / 100);
    //                                     SalesLineBuffer."Variable Amount" := ExcisePostingSetup."BED %" * "Excise Base Variable" / 100;
    //                                 end;
    //                         end;
    //                     ExcisePostingSetup."BED Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."BED Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."BED Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."BED %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."BED Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."BED %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."BED Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := ExcisePostingSetup."BED %" * "Excise Base Variable" / 100;
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."BED Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end
    //                             else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."BED %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := BEDAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 4);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."SED Calculation Type" of
    //                     ExcisePostingSetup."SED Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."SED Calculation Formula" <> '' then begin
    //                                     /*
    //                                        SalesLineBuffer."Fixed Amount" := EvaluateExpressionFixed(TRUE,ExcisePostingSetup."SED Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."SED %" / 100;
    //                                        SalesLineBuffer."Variable Amount" :=
    //                                          EvaluateExpressionVariable(TRUE,ExcisePostingSetup."SED Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."SED %" / 100;
    //                                       */
    //                                 end else
    //                                     if ExcisePostingSetup."SED Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SED %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."SED %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."SED Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SED Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."SED Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SED %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."SED Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SED %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."SED Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."SED %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."SED Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SED %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := SEDAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 2);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."AED(GSI) Calculation Type" of
    //                     ExcisePostingSetup."AED(GSI) Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" <> '' then begin
    //                                     /*
    //                                         SalesLineBuffer."Fixed Amount" :=
    //                                           EvaluateExpressionFixed(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                                           ExcisePostingSetup."AED(GSI) %" / 100;
    //                                         SalesLineBuffer."Variable Amount" :=
    //                                           EvaluateExpressionVariable(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                                           ExcisePostingSetup."AED(GSI) %" / 100;
    //                                        */
    //                                 end else
    //                                     if ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(GSI) %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."AED(GSI) %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."AED(GSI) Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."AED(GSI) Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."AED(GSI) Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."AED(GSI) %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."AED(GSI) Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(GSI) %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."AED(GSI) Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."AED(GSI) %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."AED(GSI) Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(GSI) %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := "AED(GSI)Amt";
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 7);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."NCCD Calculation Type" of
    //                     ExcisePostingSetup."NCCD Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."NCCD Calculation Formula" <> '' then begin
    //                                     /*
    //                                        SalesLineBuffer."Fixed Amount" :=
    //                                          EvaluateExpressionFixed(TRUE,ExcisePostingSetup."NCCD Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."NCCD %" / 100;
    //                                        SalesLineBuffer."Variable Amount" :=
    //                                          EvaluateExpressionVariable(TRUE,ExcisePostingSetup."NCCD Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."NCCD %" / 100;
    //                                       */
    //                                 end else
    //                                     if ExcisePostingSetup."NCCD Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."NCCD %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."NCCD %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."NCCD Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."NCCD Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."NCCD Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."NCCD %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."NCCD Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."NCCD %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."NCCD Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."NCCD %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."NCCD Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."NCCD %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := NCCDAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 3);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."AED(TTA) Calculation Type" of
    //                     ExcisePostingSetup."AED(TTA) Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" <> '' then begin
    //                                     /*
    //                                       SalesLineBuffer."Fixed Amount" :=
    //                                         EvaluateExpressionFixed(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                                         ExcisePostingSetup."AED(TTA) %" / 100;
    //                                       SalesLineBuffer."Variable Amount" :=
    //                                         EvaluateExpressionVariable(TRUE,ExcisePostingSetup."AED(GSI/TTA) Calc. Formula",Rec) *
    //                                         ExcisePostingSetup."AED(TTA) %" / 100;
    //                                        */
    //                                 end else
    //                                     if ExcisePostingSetup."AED(GSI/TTA) Calc. Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(TTA) %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."AED(TTA) %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."AED(TTA) Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."AED(TTA) Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."AED(TTA) Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."AED(TTA) %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."AED(TTA) Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(TTA) %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."AED(TTA) Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."AED(TTA) %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."AED(TTA) Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."AED(TTA) %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := "AED(TTA)Amt";
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 5);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."SAED Calculation Type" of
    //                     ExcisePostingSetup."SAED Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."SAED Calculation Formula" <> '' then begin
    //                                     /*
    //                                        SalesLineBuffer."Fixed Amount" :=
    //                                          EvaluateExpressionFixed(TRUE,ExcisePostingSetup."SAED Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."SAED %" / 100;
    //                                        SalesLineBuffer."Variable Amount" :=
    //                                          EvaluateExpressionVariable(TRUE,ExcisePostingSetup."SAED Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."SAED %" / 100;
    //                                        */
    //                                 end else
    //                                     if ExcisePostingSetup."SAED Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SAED %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."SAED %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."SAED Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SAED Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."SAED Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SAED %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."SAED Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SAED %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."SAED Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."SAED %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."SAED Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SAED %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := SAEDAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 9);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."ADE Calculation Type" of
    //                     ExcisePostingSetup."ADE Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."ADE Calculation Formula" <> '' then begin
    //                                     /*
    //                                        SalesLineBuffer."Fixed Amount" := EvaluateExpressionFixed(TRUE,ExcisePostingSetup."ADE Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."ADE %" / 100;
    //                                        SalesLineBuffer."Variable Amount" :=
    //                                          EvaluateExpressionVariable(TRUE,ExcisePostingSetup."ADE Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."ADE %" / 100;
    //                                       */
    //                                 end else
    //                                     if ExcisePostingSetup."ADE Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADE %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."ADE %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."ADE Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADE Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."ADE Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADE %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."ADE Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADE %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."ADE Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."ADE %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."ADE Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADE %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := ADEAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 8);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."ADET Calculation Type" of
    //                     ExcisePostingSetup."ADET Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."ADET Calculation Formula" <> '' then begin
    //                                     /*
    //                                        SalesLineBuffer."Fixed Amount" := EvaluateExpressionFixed(TRUE,ExcisePostingSetup."ADET Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."ADET %" / 100;
    //                                        SalesLineBuffer."Variable Amount" :=
    //                                          EvaluateExpressionVariable(TRUE,ExcisePostingSetup."ADET Calculation Formula",Rec) *
    //                                          ExcisePostingSetup."ADET %" / 100;
    //                                        */
    //                                 end else
    //                                     if ExcisePostingSetup."ADET Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADET %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."ADET %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."ADET Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADET Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."ADET Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADET %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."ADET Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADET %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."ADET Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."ADET %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."ADET Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADET %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := ADETAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 6);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."CESS Calculation Type" of
    //                     ExcisePostingSetup."CESS Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."CESS Calculation Formula" <> '' then begin
    //                                     /*
    //                                       SalesLineBuffer."Fixed Amount" := EvaluateExpressionFixed(TRUE,ExcisePostingSetup."CESS Calculation Formula",Rec) *
    //                                         ExcisePostingSetup."CESS %" / 100;
    //                                       SalesLineBuffer."Variable Amount" :=
    //                                         EvaluateExpressionVariable(TRUE,ExcisePostingSetup."CESS Calculation Formula",Rec) *
    //                                         ExcisePostingSetup."CESS %" / 100;
    //                                       */
    //                                 end else
    //                                     if ExcisePostingSetup."CESS Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."CESS %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."CESS %" * "Excise Base Variable" / 100;
    //                                     end
    //                         end;
    //                     ExcisePostingSetup."CESS Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."CESS Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."CESS Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."CESS %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."CESS Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."CESS %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."CESS Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."CESS %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."CESS Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."CESS %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := CESSAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 10);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."eCess Calculation Type" of
    //                     ExcisePostingSetup."eCess Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."eCess Calculation Formula" <> '' then begin
    //                                     /*
    //                                       SalesLineBuffer."Fixed Amount" := EvaluateExpressionFixed(TRUE,ExcisePostingSetup."eCess Calculation Formula",Rec) *
    //                                         ExcisePostingSetup."eCess %" / 100;
    //                                       SalesLineBuffer."Variable Amount" :=
    //                                         EvaluateExpressionVariable(TRUE,ExcisePostingSetup."eCess Calculation Formula",Rec) *
    //                                         ExcisePostingSetup."eCess %" / 100;
    //                                        */
    //                                 end else
    //                                     if ExcisePostingSetup."eCess Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."eCess %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."eCess %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."eCess Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."eCess Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."eCess Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."eCess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."eCess Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."eCess %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."eCess Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."eCess %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."eCess Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."eCess %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := eCessAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             SalesLineBuffer.SetRange("Component Code", 12);
    //             if SalesLineBuffer.FindFirst then begin
    //                 case ExcisePostingSetup."SHE Cess Calculation Type" of
    //                     ExcisePostingSetup."SHE Cess Calculation Type"::"Excise %":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if ExcisePostingSetup."SHE Cess Calculation Formula" <> '' then begin
    //                                     /*
    //                                         SalesLineBuffer."Fixed Amount" :=
    //                                           EvaluateExpressionFixed(TRUE,ExcisePostingSetup."SHE Cess Calculation Formula",Rec) *
    //                                           ExcisePostingSetup."SHE Cess %" / 100;
    //                                         SalesLineBuffer."Variable Amount" :=
    //                                           EvaluateExpressionVariable(TRUE,ExcisePostingSetup."SHE Cess Calculation Formula",Rec) *
    //                                           ExcisePostingSetup."SHE Cess %" / 100;
    //                                       */
    //                                 end else
    //                                     if ExcisePostingSetup."SHE Cess Calculation Formula" = '' then begin
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SHE Cess %" * "Excise Base Amount" / 100);
    //                                         SalesLineBuffer."Variable Amount" := ExcisePostingSetup."SHE Cess %" * "Excise Base Variable" / 100;
    //                                     end;
    //                         end;
    //                     ExcisePostingSetup."SHE Cess Calculation Type"::"Amount/Unit":
    //                         begin
    //                             TestField("Excise Base Quantity");
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SHE Cess Amount Per Unit" * "Excise Base Quantity";
    //                         end;
    //                     ExcisePostingSetup."SHE Cess Calculation Type"::"% of Accessable Value":
    //                         SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."SHE Cess %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                     ExcisePostingSetup."SHE Cess Calculation Type"::"Excise %+Amount/Unit":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SHE Cess %" * "Excise Base Amount" / 100) +
    //                                   (ExcisePostingSetup."SHE Cess Amount Per Unit" * "Excise Base Quantity");
    //                                 SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."SHE Cess %" * "Excise Base Variable" / 100);
    //                             end;
    //                         end;
    //                     ExcisePostingSetup."SHE Cess Calculation Type"::"% of MRP":
    //                         begin
    //                             if Quantity = 0 then begin
    //                                 SalesLineBuffer."Fixed Amount" := 0;
    //                                 SalesLineBuffer."Variable Amount" := 0;
    //                             end else
    //                                 if MRP then
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."SHE Cess %" * "MRP Price" *
    //                                                                        (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                 else
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                         end;
    //                 end;
    //                 if SalesHeader.Trading then begin
    //                     SalesLineBuffer."Fixed Amount" := SHECessAmt;
    //                     SalesLineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SalesLineBuffer.Modify;
    //             end;

    //             if CVD then begin
    //                 SalesLineBuffer.Reset;
    //                 SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                 SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                 SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                 SalesLineBuffer.SetRange(Type, SalesLineBuffer.Type::Excise);
    //                 SalesLineBuffer.SetRange("Component Code", 11);
    //                 if SalesLineBuffer.FindFirst then begin
    //                     case ExcisePostingSetup."ADC VAT Calculation Type" of
    //                         ExcisePostingSetup."ADC VAT Calculation Type"::"Excise %":
    //                             begin
    //                                 if Quantity = 0 then begin
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                                     SalesLineBuffer."Variable Amount" := 0;
    //                                 end else
    //                                     if ExcisePostingSetup."ADC VAT Calculation Formula" <> '' then begin
    //                                         /*
    //                                            SalesLineBuffer."Fixed Amount" :=
    //                                              EvaluateExpressionFixed(TRUE,ExcisePostingSetup."ADC VAT Calculation Formula",Rec) *
    //                                              ExcisePostingSetup."ADC VAT %" / 100;
    //                                            SalesLineBuffer."Variable Amount" :=
    //                                              EvaluateExpressionVariable(TRUE,ExcisePostingSetup."ADC VAT Calculation Formula",Rec) *
    //                                              ExcisePostingSetup."ADC VAT %" / 100;
    //                                           */
    //                                     end else
    //                                         if ExcisePostingSetup."ADC VAT Calculation Formula" = '' then begin
    //                                             SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADC VAT %" * "Excise Base Amount" / 100);
    //                                             SalesLineBuffer."Variable Amount" := ExcisePostingSetup."ADC VAT %" * "Excise Base Variable" / 100;
    //                                         end;
    //                             end;
    //                         ExcisePostingSetup."ADC VAT Calculation Type"::"Amount/Unit":
    //                             begin
    //                                 TestField("Excise Base Quantity");
    //                                 SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADC VAT Amount Per Unit" * "Excise Base Quantity";
    //                             end;
    //                         ExcisePostingSetup."ADC VAT Calculation Type"::"% of Accessable Value":
    //                             SalesLineBuffer."Fixed Amount" := ExcisePostingSetup."ADC VAT %" * "Assessable Value" * Quantity / 100;  // PS38000
    //                         ExcisePostingSetup."ADC VAT Calculation Type"::"Excise %+Amount/Unit":
    //                             begin
    //                                 if Quantity = 0 then begin
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                                     SalesLineBuffer."Variable Amount" := 0;
    //                                 end else begin
    //                                     TestField("Excise Base Quantity");
    //                                     SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADC VAT %" * "Excise Base Amount" / 100) +
    //                                       (ExcisePostingSetup."ADC VAT Amount Per Unit" * "Excise Base Quantity");
    //                                     SalesLineBuffer."Variable Amount" := (ExcisePostingSetup."ADC VAT %" * "Excise Base Variable" / 100);
    //                                 end;
    //                             end;
    //                         ExcisePostingSetup."ADC VAT Calculation Type"::"% of MRP":
    //                             begin
    //                                 if Quantity = 0 then begin
    //                                     SalesLineBuffer."Fixed Amount" := 0;
    //                                     SalesLineBuffer."Variable Amount" := 0;
    //                                 end else
    //                                     if MRP then
    //                                         SalesLineBuffer."Fixed Amount" := (ExcisePostingSetup."ADC VAT %" * "MRP Price" *
    //                                                                            (1 - "Abatement %" / 100) * "Quantity (Base)" / 100)
    //                                     else
    //                                         SalesLineBuffer."Fixed Amount" := 0;
    //                             end;
    //                     end;
    //                     if SalesHeader.Trading then begin
    //                         SalesLineBuffer."Fixed Amount" := ADCVATAmt;
    //                         SalesLineBuffer."Variable Amount" := 0;
    //                     end;
    //                     SalesLineBuffer.Modify;
    //                 end;
    //             end;
    //         end else
    //             InitExciseAmount;
    //     end else
    //         InitExciseAmount;

    // end;

    // // local procedure InsertSalesLineBuffer(SalesLine: Record "Sales Line"; TaxType: Option Charges,"Sales Tax",Excise,"Other Taxes","Service Tax")
    // // var
    // //     SaleslineBuffer: Record "Sale Line Detail Buffer";
    // //     DutyCode: Record "Duty Code No.";
    // //     LineNoBuffer: Integer;
    // // begin
    // //     LineNoBuffer := 0;
    // //     // PS36451.begin
    // //     // SaleslineBuffer.RESET;
    // //     // SaleslineBuffer.SETRANGE("Document Type",SalesLine."Document Type");
    // //     // SaleslineBuffer.SETRANGE("Document No.",SalesLine."Document No.");
    // //     // SaleslineBuffer.SETRANGE("Document Line No.",SalesLine."Line No.");
    // //     // SaleslineBuffer.SETRANGE(Type,TaxType);
    // //     // IF SaleslineBuffer.FINDLAST THEN BEGIN
    // //     // IF TaxType = TaxType::"Sales Tax" THEN
    // //     // EXIT;
    // //     // LineNoBuffer := SaleslineBuffer."Line No.";
    // //     // END;
    // //     if TaxType = TaxType::"Sales Tax" then
    // //         exit;
    // //     SaleslineBuffer.Reset;
    // //     SaleslineBuffer.SetRange("Document Type", SalesLine."Document Type");
    // //     SaleslineBuffer.SetRange("Document No.", SalesLine."Document No.");
    // //     SaleslineBuffer.SetRange("Document Line No.", SalesLine."Line No.");
    // //     SaleslineBuffer.SetRange(Type, TaxType);
    // //     if SaleslineBuffer.FindLast then
    // //         LineNoBuffer := LineNoBuffer + 10000
    // //     else
    // //         LineNoBuffer := 10000;
    // //     // PS36451.end
    // //     DutyCode.Reset;
    // //     if DutyCode.FindSet then
    // //         repeat
    // //             // LineNoBuffer := LineNoBuffer + 10000; // PS36451
    // //             SaleslineBuffer.Init;
    // //             SaleslineBuffer."Document Type" := SalesLine."Document Type";
    // //             SaleslineBuffer."Document No." := SalesLine."Document No.";
    // //             SaleslineBuffer."Document Line No." := SalesLine."Line No.";
    // //             SaleslineBuffer.Type := TaxType;
    // //             SaleslineBuffer."Line No." := LineNoBuffer;
    // //             if TaxType = TaxType::Excise then
    // //                 SaleslineBuffer."Component Code" := DutyCode."Duty Code No."
    // //             else
    // //                 DutyCode.FindLast;
    // //             LineNoBuffer := LineNoBuffer + 10000; // PS36451
    // //             SaleslineBuffer.Insert;
    // //         until DutyCode.Next = 0;
    // // end;

    // local procedure EvaluateExpressionFixed(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"): Decimal
    // var
    //     SalesLine1: Record "Sales Line";
    //     Result: Decimal;
    //     CallLevel: Integer;
    //     Parantheses: Integer;
    //     IsExpression: Boolean;
    //     Operators: Text[8];
    //     OperatorNo: Integer;
    //     IsFilter: Boolean;
    //     i: Integer;
    //     RightResult: Decimal;
    //     LeftResult: Decimal;
    //     RightOperand: Text[250];
    //     LeftOperand: Text[250];
    // Operator: Char;
    //     DivisionError: Boolean;
    //     //SalesLineBuffer: Record "Sale Line Detail Buffer";//LKS-Raj Commented (Table Missing)
    // begin
    //     Result := 0;
    //     CallLevel := CallLevel + 1;
    //     while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
    //         Expression := CopyStr(Expression, 2);

    //     if Expression <> '' then
    //         while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
    //             Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
    //     if StrLen(Expression) > 0 then begin
    //         Parantheses := 0;
    //         IsExpression := false;
    //         Operators := '+-*/^';
    //         OperatorNo := 1;
    //         repeat
    //             i := StrLen(Expression);
    //             repeat
    //                 if Expression[i] = '(' then
    //                     Parantheses := Parantheses + 1
    //                 else
    //                     if Expression[i] = ')' then
    //                         Parantheses := Parantheses - 1;
    //                 if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
    //                     IsExpression := true
    //                 else
    //                     i := i - 1;
    //             until IsExpression or (i <= 0);
    //             if not IsExpression then
    //                 OperatorNo := OperatorNo + 1;
    //         until (OperatorNo > StrLen(Operators)) or IsExpression;
    //         if IsExpression then begin
    //             if i > 1 then begin
    //                 LeftOperand := CopyStr(Expression, 1, i - 1);
    //             end else
    //                 LeftOperand := '';
    //             if i < StrLen(Expression) then begin
    //                 RightOperand := CopyStr(Expression, i + 1);
    //             end else
    //                 RightOperand := '';
    //             Operator := Expression[i];
    //             LeftResult := EvaluateExpressionFixed(IsTestExpression, LeftOperand, SalesLine);
    //             RightResult := EvaluateExpressionFixed(IsTestExpression, RightOperand, SalesLine);
    //             case Operator of
    //                 '^':
    //                     Result := Power(LeftResult, RightResult);
    //                 '*':
    //                     Result := LeftResult * RightResult;
    //                 '/':
    //                     if RightResult = 0 then begin
    //                         Result := 0;
    //                         DivisionError := true;
    //                     end else
    //                         Result := LeftResult / RightResult;
    //                 '+':
    //                     Result := LeftResult + RightResult;
    //                 '-':
    //                     Result := LeftResult - RightResult;
    //             end;
    //         end else
    //             if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
    //                 Result :=
    //                   EvaluateExpressionFixed(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine1)
    //             else begin
    //                 IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
    //                              StrPos(Expression, '<') + StrPos(Expression, '>') +
    //                              StrPos(Expression, '=') > 0);
    //                 if not IsFilter then begin
    //                     SalesLineBuffer.Reset;
    //                     SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                     SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                     SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                     SalesLineBuffer.SetRange(Type, SalesLineBuffer.Type::Excise);
    //                     if Expression = Text13700 then begin // BED Amount
    //                         SalesLineBuffer.SetRange("Component Code", 1);
    //                         if SalesLineBuffer.Find('-') then
    //                             Result := Result + SalesLineBuffer."Fixed Amount";
    //                     end else
    //                         if Expression = Text13701 then begin  // AED (GSI), AED TTA
    //                             SalesLineBuffer.SetFilter("Component Code", '%1|%2', 2, 3);
    //                             if SalesLineBuffer.Find('-') then
    //                                 repeat
    //                                     Result := Result + SalesLineBuffer."Fixed Amount";
    //                                 until SalesLineBuffer.Next = 0;
    //                         end else
    //                             if Expression = Text13702 then begin // SED
    //                                 SalesLineBuffer.SetRange("Component Code", 4);
    //                                 if SalesLineBuffer.Find('-') then
    //                                     Result := Result + SalesLineBuffer."Fixed Amount";
    //                             end else
    //                                 if Expression = Text13703 then begin // SAED
    //                                     SalesLineBuffer.SetRange("Component Code", 5);
    //                                     if SalesLineBuffer.Find('-') then
    //                                         Result := Result + SalesLineBuffer."Fixed Amount";
    //                                 end else
    //                                     if Expression = Text13704 then begin // Cess
    //                                         SalesLineBuffer.SetRange("Component Code", 6);
    //                                         if SalesLineBuffer.Find('-') then
    //                                             Result := Result + SalesLineBuffer."Fixed Amount";
    //                                     end else
    //                                         if Expression = Text13705 then begin // NCCD
    //                                             SalesLineBuffer.SetRange("Component Code", 7);
    //                                             if SalesLineBuffer.Find('-') then
    //                                                 Result := Result + SalesLineBuffer."Fixed Amount";
    //                                         end else
    //                                             if Expression = Text13706 then begin // Ecess
    //                                                 SalesLineBuffer.SetRange("Component Code", 10);
    //                                                 if SalesLineBuffer.Find('-') then
    //                                                     Result := Result + SalesLineBuffer."Fixed Amount";
    //                                             end else
    //                                                 if Expression = Text13707 then begin // ADET
    //                                                     SalesLineBuffer.SetRange("Component Code", 8);
    //                                                     if SalesLineBuffer.Find('-') then
    //                                                         Result := Result + SalesLineBuffer."Fixed Amount";
    //                                                 end else
    //                                                     if Expression = Text13708 then begin // Line Amount
    //                                                         Result := Result - SalesLine."Line Discount Amount"
    //                                                     end else
    //                                                         if Expression = Text13709 then begin // ADE
    //                                                             SalesLineBuffer.SetRange("Component Code", 9);
    //                                                             if SalesLineBuffer.Find('-') then
    //                                                                 Result := Result + SalesLineBuffer."Fixed Amount";
    //                                                         end else
    //                                                             if Expression = Text13710 then begin // SHECess
    //                                                                 SalesLineBuffer.SetRange("Component Code", 12);
    //                                                                 if SalesLineBuffer.Find('-') then
    //                                                                     Result := Result + SalesLineBuffer."Fixed Amount";
    //                                                             end else
    //                                                                 if Expression = Text13711 then begin // Assessable Value
    //                                                                     Result := Result + SalesLine."Assessable Value";
    //                                                                 end else
    //                                                                     if Expression = Text16501 then begin
    //                                                                         SalesLineBuffer.SetRange("Component Code", 11);
    //                                                                         if SalesLineBuffer.Find('-') then
    //                                                                             Result := Result + SalesLineBuffer."Fixed Amount";
    //                                                                     end else
    //                                                                         if Expression = Text16502 then begin
    //                                                                             Result := Result + SalesLine."BCD Amount";
    //                                                                         end else
    //                                                                             if Expression = Text16503 then
    //                                                                                 Result := Result + SalesLine."CIF Amount";
    //                 end;
    //             end;
    //     end;
    //     CallLevel := CallLevel - 1;
    //     exit(Result);
    // end;

    // local procedure EvaluateExpressionVariable(IsTestExpression: Boolean; Expression: Code[250]; SalesLine: Record "Sales Line"): Decimal
    // var
    //     SalesLine1: Record "Sales Line";
    //     Result: Decimal;
    //     CallLevel: Integer;
    //     Parantheses: Integer;
    //     IsExpression: Boolean;
    //     Operators: Text[8];
    //     OperatorNo: Integer;
    //     IsFilter: Boolean;
    //     i: Integer;
    //     RightResult: Decimal;
    //     LeftResult: Decimal;
    //     RightOperand: Text[250];
    //     LeftOperand: Text[250];
    //     Operator: Char;
    //     DivisionError: Boolean;
    // //SalesLineBuffer: Record "Sale Line Detail Buffer";//LKS-Raj Commented (Table Missing)
    // begin
    //     Result := 0;
    //     CallLevel := CallLevel + 1;
    //     while (StrLen(Expression) > 1) and (Expression[1] = ' ') do
    //         Expression := CopyStr(Expression, 2);

    //     if Expression <> '' then
    //         while (StrLen(Expression) > 1) and (Expression[StrLen(Expression)] = ' ') do
    //             Expression := CopyStr(Expression, 1, StrLen(Expression) - 1);
    //     if StrLen(Expression) > 0 then begin
    //         Parantheses := 0;
    //         IsExpression := false;
    //         Operators := '+-*/^';
    //         OperatorNo := 1;
    //         repeat
    //             i := StrLen(Expression);
    //             repeat
    //                 if Expression[i] = '(' then
    //                     Parantheses := Parantheses + 1
    //                 else
    //                     if Expression[i] = ')' then
    //                         Parantheses := Parantheses - 1;
    //                 if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
    //                     IsExpression := true
    //                 else
    //                     i := i - 1;
    //             until IsExpression or (i <= 0);
    //             if not IsExpression then
    //                 OperatorNo := OperatorNo + 1;
    //         until (OperatorNo > StrLen(Operators)) or IsExpression;
    //         if IsExpression then begin
    //             if i > 1 then begin
    //                 LeftOperand := CopyStr(Expression, 1, i - 1);
    //             end else
    //                 LeftOperand := '';
    //             if i < StrLen(Expression) then begin
    //                 RightOperand := CopyStr(Expression, i + 1);
    //             end else
    //                 RightOperand := '';
    //             Operator := Expression[i];
    //             LeftResult := EvaluateExpressionVariable(IsTestExpression, LeftOperand, SalesLine);
    //             RightResult := EvaluateExpressionVariable(IsTestExpression, RightOperand, SalesLine);
    //             case Operator of
    //                 '^':
    //                     Result := Power(LeftResult, RightResult);
    //                 '*':
    //                     Result := LeftResult * RightResult;
    //                 '/':
    //                     if RightResult = 0 then begin
    //                         Result := 0;
    //                         DivisionError := true;
    //                     end else
    //                         Result := LeftResult / RightResult;
    //                 '+':
    //                     Result := LeftResult + RightResult;
    //                 '-':
    //                     Result := LeftResult - RightResult;
    //             end;
    //         end else
    //             if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
    //                 Result :=
    //                   EvaluateExpressionVariable(IsTestExpression, CopyStr(Expression, 2, StrLen(Expression) - 2), SalesLine1)
    //             else begin
    //                 IsFilter := (StrPos(Expression, '..') + StrPos(Expression, '|') +
    //                              StrPos(Expression, '<') + StrPos(Expression, '>') +
    //                              StrPos(Expression, '=') > 0);
    //                 if not IsFilter then begin
    //                     SalesLineBuffer.Reset;
    //                     SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                     SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                     SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                     SalesLineBuffer.SetRange(Type, SalesLineBuffer.Type::Excise);
    //                     if Expression = Text13700 then begin // BED Amount
    //                         SalesLineBuffer.SetRange("Component Code", 1);
    //                         if SalesLineBuffer.Find('-') then
    //                             Result := Result + SalesLineBuffer."Variable Amount";
    //                     end else
    //                         if Expression = Text13701 then begin  // AED (GSI), AED TTA
    //                             SalesLineBuffer.SetFilter("Component Code", '%1|%2', 2, 3);
    //                             if SalesLineBuffer.Find('-') then
    //                                 repeat
    //                                     Result := Result + SalesLineBuffer."Variable Amount";
    //                                 until SalesLineBuffer.Next = 0;
    //                         end else
    //                             if Expression = Text13702 then begin // SED
    //                                 SalesLineBuffer.SetRange("Component Code", 4);
    //                                 if SalesLineBuffer.Find('-') then
    //                                     Result := Result + SalesLineBuffer."Variable Amount";
    //                             end else
    //                                 if Expression = Text13703 then begin // SAED
    //                                     SalesLineBuffer.SetRange("Component Code", 5);
    //                                     if SalesLineBuffer.Find('-') then
    //                                         Result := Result + SalesLineBuffer."Variable Amount";
    //                                 end else
    //                                     if Expression = Text13704 then begin // Cess
    //                                         SalesLineBuffer.SetRange("Component Code", 6);
    //                                         if SalesLineBuffer.Find('-') then
    //                                             Result := Result + SalesLineBuffer."Variable Amount";
    //                                     end else
    //                                         if Expression = Text13705 then begin // NCCD
    //                                             SalesLineBuffer.SetRange("Component Code", 7);
    //                                             if SalesLineBuffer.Find('-') then
    //                                                 Result := Result + SalesLineBuffer."Variable Amount";
    //                                         end else
    //                                             if Expression = Text13706 then begin // Ecess
    //                                                 SalesLineBuffer.SetRange("Component Code", 10);
    //                                                 if SalesLineBuffer.Find('-') then
    //                                                     Result := Result + SalesLineBuffer."Variable Amount";
    //                                             end else
    //                                                 if Expression = Text13707 then begin // ADET
    //                                                     SalesLineBuffer.SetRange("Component Code", 8);
    //                                                     if SalesLineBuffer.Find('-') then
    //                                                         Result := Result + SalesLineBuffer."Variable Amount";
    //                                                 end else
    //                                                     if Expression = Text13708 then begin // Line Amount
    //                                                         Result := Result + SalesLine.Quantity
    //                                                     end else
    //                                                         if Expression = Text13709 then begin // ADE
    //                                                             SalesLineBuffer.SetRange("Component Code", 9);
    //                                                             if SalesLineBuffer.Find('-') then
    //                                                                 Result := Result + SalesLineBuffer."Variable Amount";
    //                                                         end else
    //                                                             if Expression = Text13710 then begin // SHECess
    //                                                                 SalesLineBuffer.SetRange("Component Code", 12);
    //                                                                 if SalesLineBuffer.Find('-') then
    //                                                                     Result := Result + SalesLineBuffer."Variable Amount";
    //                                                             end else
    //                                                                 if Expression = Text13711 then begin // Assessable Value
    //                                                                     Result := Result + 0;
    //                                                                 end else
    //                                                                     if Expression = Text16501 then begin
    //                                                                         SalesLineBuffer.SetRange("Component Code", 11);
    //                                                                         if SalesLineBuffer.Find('-') then
    //                                                                             Result := Result + SalesLineBuffer."Variable Amount";
    //                                                                     end else
    //                                                                         if Expression = Text16502 then begin
    //                                                                             Result := Result + 0;
    //                                                                         end else
    //                                                                             if Expression = Text16503 then
    //                                                                                 Result := Result + 0;
    //                 end;
    //             end;
    //     end;
    //     CallLevel := CallLevel - 1;
    //     exit(Result);
    // end;

    // 
    // procedure CalculateStructuresPIT(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     StrOrderDetails: Record "Structure Order Details";
    //     StrOrderLineDetails: Record "Structure Order Line Details";
    //     StrOrderLines: Record "Structure Order Line Details";
    //     SalesLineBuffer: Record "Sale Line Detail Buffer";
    //     BaseAmount: Decimal;
    //     CFactor: Decimal;
    //     i: Integer;
    //     FixedAmt: Decimal;
    //     VariableAmt: Decimal;
    //     CalcInvDis: Codeunit "Sales-Calc. Discount";
    //     AdjustedAmt: Decimal;
    //     DiffAdjustmentAmt: Decimal;
    // begin
    //     with SalesHeader do begin
    //         StrOrderLines.LockTable;
    //         StrOrderLineDetails.LockTable;

    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetRange("Price Inclusive of Tax", true);
    //         if SalesLine.Find('-') then begin
    //             repeat
    //                 if (SalesLine.Quantity <> 0) and (SalesLine."Unit Price" <> 0) then
    //                     for i := 1 to 3 do begin
    //                         with SalesLine do begin
    //                             StrOrderLines.Reset;
    //                             StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
    //                             StrOrderLines.SetRange("Document Type", "Document Type");
    //                             StrOrderLines.SetRange("Document No.", "Document No.");
    //                             StrOrderLines.SetRange("Line No.", "Line No.");
    //                             StrOrderLines.SetRange("Price Inclusive of Tax", true);
    //                             if not Trading then
    //                                 StrOrderLines.SetRange("Manually Changed", false);
    //                             if StrOrderLines.FindFirst then
    //                                 StrOrderLines.DeleteAll(true);

    //                             "Amount Added to Excise Base" := 0;
    //                             "Amount Added to Tax Base" := 0;
    //                             "VAT Base Amount" := 0;
    //                             CVD := false;
    //                             "Amount To Customer UPIT" := Quantity * "Unit Price";
    //                             StrOrderDetails.Reset;
    //                             StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                             StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                             StrOrderDetails.SetRange("Document Type", "Document Type");
    //                             StrOrderDetails.SetRange("Document No.", "Document No.");
    //                             StrOrderDetails.SetRange("Document Line No.", "Line No.");
    //                             if StrOrderDetails.FindSet then
    //                                 repeat
    //                                     StrOrderLineDetails.Reset;
    //                                     StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                                     StrOrderLineDetails.SetRange("Calculation Order", StrOrderDetails."Calculation Order");
    //                                     StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                                     StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                                     StrOrderLineDetails.SetRange("Structure Code", Structure);
    //                                     StrOrderLineDetails.SetRange("Item No.", "No.");
    //                                     StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                                     StrOrderLineDetails.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                                     if not StrOrderLineDetails.Find('-') then begin
    //                                         StrOrderLineDetails.Init;
    //                                         StrOrderLineDetails.Type := StrOrderDetails.Type;
    //                                         StrOrderLineDetails."Document Type" := StrOrderDetails."Document Type";
    //                                         StrOrderLineDetails."Document No." := StrOrderDetails."Document No.";
    //                                         StrOrderLineDetails."Structure Code" := StrOrderDetails."Structure Code";
    //                                         StrOrderLineDetails."Item No." := "No.";
    //                                         StrOrderLineDetails."Line No." := "Line No.";
    //                                         StrOrderLineDetails."Calculation Order" := StrOrderDetails."Calculation Order";
    //                                         StrOrderLineDetails."Tax/Charge Type" := StrOrderDetails."Tax/Charge Type";
    //                                         StrOrderLineDetails."Tax/Charge Group" := StrOrderDetails."Tax/Charge Group";
    //                                         StrOrderLineDetails."Tax/Charge Code" := StrOrderDetails."Tax/Charge Code";
    //                                         StrOrderLineDetails."Calculation Type" := StrOrderDetails."Calculation Type";
    //                                         StrOrderLineDetails."Calculation Value" := StrOrderDetails."Calculation Value";
    //                                         StrOrderLineDetails."Quantity Per" := StrOrderDetails."Quantity Per";
    //                                         StrOrderLineDetails."Loading on Inventory" := StrOrderDetails."Loading on Inventory";
    //                                         StrOrderLineDetails."% Loading on Inventory" := StrOrderDetails."% Loading on Inventory";
    //                                         StrOrderLineDetails."Header/Line" := StrOrderDetails."Header/Line";
    //                                         StrOrderLineDetails."Include Base" := StrOrderDetails."Include Base";
    //                                         StrOrderLineDetails."Include Line Discount" := StrOrderDetails."Include Line Discount";
    //                                         StrOrderLineDetails."Include Invoice Discount" := StrOrderDetails."Include Invoice Discount";
    //                                         StrOrderLineDetails."Payable to Third Party" := StrOrderDetails."Payable to Third Party";
    //                                         StrOrderLineDetails.LCY := StrOrderDetails.LCY;
    //                                         StrOrderLineDetails."Available for VAT input" := StrOrderDetails."Available for VAT Input";
    //                                         StrOrderLineDetails.CVD := StrOrderDetails.CVD;
    //                                         StrOrderLineDetails."Price Inclusive of Tax" := StrOrderDetails."Price Inclusive of Tax";
    //                                         StrOrderLineDetails."Include PIT Calculation" := StrOrderDetails."Include PIT Calculation";
    //                                         if StrOrderDetails."Payable to Third Party" then
    //                                             StrOrderDetails.TestField("Third Party Code");
    //                                         StrOrderLineDetails."Third Party Code" := StrOrderDetails."Third Party Code";
    //                                         if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                             (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                         then
    //                                             StrOrderDetails.TestField("Account No.");
    //                                         StrOrderLineDetails."Account No." := StrOrderDetails."Account No.";
    //                                         StrOrderLineDetails."Base Formula" := StrOrderDetails."Base Formula";
    //                                         if StrOrderLineDetails."Base Formula" <> '' then
    //                                             BaseAmount :=
    //                                               EvaluateExpressioninStructures(true, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails)
    //                                         else
    //                                             BaseAmount := 0;

    //                                         if StrOrderDetails."Include Base" then
    //                                             BaseAmount := BaseAmount + Quantity * "Unit Price";
    //                                         if StrOrderDetails."Include Line Discount" then
    //                                             BaseAmount := BaseAmount - "Line Discount Amount";
    //                                         if StrOrderDetails."Include Invoice Discount" then
    //                                             BaseAmount := BaseAmount - "Inv. Discount Amount";

    //                                         if SalesHeader."Currency Factor" <> 0 then
    //                                             CFactor := SalesHeader."Currency Factor"
    //                                         else
    //                                             CFactor := 1;

    //                                         if not StrOrderDetails.LCY then
    //                                             CFactor := 1;

    //                                         if Type = Type::Item then
    //                                             if ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) or
    //                                                 (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
    //                                             then begin
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" then begin
    //                                                     StrOrderLineDetails."Base Amount" := 0;
    //                                                     StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor);
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage then begin
    //                                                     StrOrderLineDetails."Base Amount" := BaseAmount;
    //                                                     StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor) * BaseAmount / 100;
    //                                                 end;
    //                                                 if StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" then begin
    //                                                     StrOrderLineDetails."Base Amount" := 0;
    //                                                     StrOrderLineDetails.Amount :=
    //                                                       (StrOrderDetails."Calculation Value" * CFactor) * Quantity / StrOrderDetails."Quantity Per";
    //                                                 end;
    //                                             end;

    //                                         if Type in [Type::Item] then
    //                                             if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise then
    //                                                 if Trading then begin
    //                                                     // VSTF203964.begin
    //                                                     if ExecuteDetailRg23D then begin
    //                                                         // VSTF203964.end
    //                                                         // VSTF208159.begin
    //                                                         // CVD := GetBaseAmount(BaseAmount,SalesLine,SalesHeader."Applies-to Doc. No.");
    //                                                         CVD := GetBaseAmount(BaseAmount, SalesLine);
    //                                                         // VSTF208159.end
    //                                                         if not MRP then
    //                                                             "Amount Added to Excise Base" := BaseAmount
    //                                                         else
    //                                                             "Amount Added to Excise Base" := "MRP Price" * "Quantity (Base)" * (1 - "Abatement %" / 100);
    //                                                         UpdateTaxAmounts;
    //                                                         StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                         StrOrderLineDetails.Amount := "Excise Amount";
    //                                                         // VSTF203964.begin
    //                                                     end;
    //                                                     // VSTF203964.end
    //                                                 end else begin
    //                                                     if not MRP then
    //                                                         "Amount Added to Excise Base" := BaseAmount
    //                                                     else
    //                                                         "Amount Added to Excise Base" := "MRP Price" * "Quantity (Base)" * (1 - "Abatement %" / 100);
    //                                                     CVD := StrOrderDetails.CVD;
    //                                                     if CVD and ("CIF Amount" + "BCD Amount" <> 0) then
    //                                                         "Amount Added to Excise Base" := "CIF Amount" + "BCD Amount";
    //                                                     UpdateTaxAmounts;
    //                                                     StrOrderLineDetails."Base Amount" := "Excise Base Amount";
    //                                                     StrOrderLineDetails.Amount := "Excise Amount";
    //                                                 end;

    //                                         if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" then begin
    //                                             "Amount Added to Tax Base" := Round(BaseAmount, Currency."Amount Rounding Precision");
    //                                             UpdateTaxAmounts;
    //                                             StrOrderLineDetails."Base Amount" := "Tax Base Amount";
    //                                             StrOrderLineDetails.Amount := "Amount Including Tax" - "Tax Base Amount";
    //                                         end;
    //                                         if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Service Tax" then begin
    //                                             "Service Tax Base" := Round(BaseAmount, Currency."Amount Rounding Precision");
    //                                             UpdateTaxAmounts;
    //                                             StrOrderLineDetails."Base Amount" := "Service Tax Base";
    //                                             StrOrderLineDetails.Amount := Round("Service Tax Amount" + "Service Tax eCess Amount" +
    //                                                 "Service Tax SHE Cess Amount");
    //                                         end;

    //                                         SalesLineBuffer.Reset;
    //                                         SalesLineBuffer.SetRange("Document Type", "Document Type");
    //                                         SalesLineBuffer.SetRange("Document No.", "Document No.");
    //                                         SalesLineBuffer.SetRange("Document Line No.", "Line No.");
    //                                         SalesLineBuffer.SetRange(Type, StrOrderLineDetails."Tax/Charge Type");
    //                                         if SalesLineBuffer.FindSet then
    //                                             repeat
    //                                                 StrOrderLineDetails."Fixed Amount" := StrOrderLineDetails."Fixed Amount" +
    //                                                   SalesLineBuffer."Fixed Amount";
    //                                                 StrOrderLineDetails."Variable Amount" := StrOrderLineDetails."Variable Amount" +
    //                                                   SalesLineBuffer."Variable Amount";
    //                                             until SalesLineBuffer.Next = 0;

    //                                         if "Currency Factor" <> 0 then
    //                                             CFactor := "Currency Factor"
    //                                         else
    //                                             CFactor := 1;

    //                                         if "Currency Code" <> '' then
    //                                             Currency.Get("Currency Code");

    //                                         StrOrderLineDetails."Amount (LCY)" := StrOrderLineDetails.Amount / CFactor;
    //                                         StrOrderLineDetails.Insert
    //                                     end;
    //                                     if StrOrderLineDetails."Include PIT Calculation" then
    //                                         "Amount To Customer UPIT" += StrOrderLineDetails.Amount;
    //                                 until StrOrderDetails.Next = 0;
    //                         end;
    //                         SalesLine.Modify;
    //                         if i < 3 then begin
    //                             FixedAmt := 0;
    //                             VariableAmt := 0;
    //                             AdjustedAmt := 0;
    //                             DiffAdjustmentAmt := 0;
    //                             FixedAmt := SalesLine."Unit Price Incl. of Tax" * SalesLine.Quantity;
    //                             VariableAmt := SalesLine.Quantity;
    //                             StrOrderLineDetails.Reset;
    //                             StrOrderLineDetails.SetCurrentKey(Type, "Document Type", "Document No.", "Structure Code", "Item No.", "Line No.");
    //                             StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                             StrOrderLineDetails.SetRange("Document Type", SalesLine."Document Type");
    //                             StrOrderLineDetails.SetRange("Document No.", SalesLine."Document No.");
    //                             StrOrderLineDetails.SetRange("Structure Code", SalesLine."PIT Structure");
    //                             StrOrderLineDetails.SetRange("Item No.", SalesLine."No.");
    //                             StrOrderLineDetails.SetRange("Line No.", SalesLine."Line No.");
    //                             StrOrderLineDetails.SetRange("Include PIT Calculation", true);
    //                             if StrOrderLineDetails.Find('-') then
    //                                 repeat
    //                                     FixedAmt -= StrOrderLineDetails.Amount;
    //                                     AdjustedAmt := AdjustedAmt + StrOrderLineDetails.Amount;
    //                                 // PS36451.begin
    //                                 // IF StrOrderLineDetails."Tax/Charge Type" = StrOrderLineDetails."Tax/Charge Type"::"Sales Tax" THEN
    //                                 // FixedAmt := FixedAmt + ROUND(SalesLine."Tax Amount" * SalesLine."Standard Deduction %" / 100);
    //                                 // IF StrOrderLineDetails."Tax/Charge Type" = StrOrderLineDetails."Tax/Charge Type"::"Sales Tax" THEN
    //                                 // AdjustedAmt := AdjustedAmt - ROUND(SalesLine."Tax Amount" * SalesLine."Standard Deduction %" / 100);
    //                                 // PS36451.end
    //                                 until StrOrderLineDetails.Next = 0;

    //                             SalesLine."Unit Price" := 0;
    //                             if VariableAmt <> 0 then begin
    //                                 SalesLine."Unit Price" := Round(FixedAmt / VariableAmt, GetRoundingPrecisionUnitPrice);
    //                                 if SalesLine."Unit Price" < 0 then
    //                                     SalesLine.FieldError("Unit Price");
    //                                 if (i = 2) and (FixedAmt <> 0) and (SalesLine.Quantity <> 0) then begin
    //                                     AdjustedAmt := AdjustedAmt + (SalesLine."Unit Price" * SalesLine.Quantity);
    //                                     FixedAmt := SalesLine."Unit Price Incl. of Tax" * SalesLine.Quantity;
    //                                     DiffAdjustmentAmt := ((FixedAmt - AdjustedAmt) / SalesLine.Quantity) *
    //                                       (SalesLine."Unit Price" * SalesLine.Quantity) / (FixedAmt);
    //                                     SalesLine."Unit Price" := Round(SalesLine."Unit Price" - DiffAdjustmentAmt, GetRoundingPrecisionUnitPrice);
    //                                     if SalesLine."Unit Price" < 0 then
    //                                         SalesLine.FieldError("Unit Price");
    //                                 end;
    //                                 SalesLine.ValidateUnitPrice;
    //                                 SalesLine.ChkQtyUpdatioAfterDDPLA;
    //                                 SalesLine.Modify;
    //                                 if "Calc. Inv. Discount (%)" then
    //                                     CalcInvDis.CalculateWithSalesHeader(SalesHeader, SalesLine);
    //                                 SalesLine.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.");
    //                             end;
    //                         end;
    //                     end;
    //             until SalesLine.Next = 0;
    //             if "Calc. Inv. Discount (%)" then
    //                 CalcInvDis.CalculateWithSalesHeader(SalesHeader, SalesLine);
    //         end;
    //     end;
    // end;

    // 
    // procedure InsertStrOrdDetail(SalesHeader: Record "Sales Header"; var SaleLines: Record "Sales Line")
    // var
    // StrOrderDetails: Record "Structure Order Details";
    // StrOrderLines: Record "Structure Order Line Details";
    // StrDetails: Record "Structure Details";
    // begin
    //     with SalesHeader do begin
    //         if "Price Inclusive of Tax" = false then
    //             exit;
    //         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //         StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //         StrOrderDetails.SetRange("Document Type", "Document Type");
    //         StrOrderDetails.SetRange("Document No.", "No.");
    //         StrOrderDetails.SetRange("Document Line No.", SaleLines."Line No.");
    //         StrOrderDetails.SetRange("Price Inclusive of Tax", true);
    //         if StrOrderDetails.FindFirst then
    //             StrOrderDetails.DeleteAll;

    //         StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
    //         StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
    //         StrOrderLines.SetRange("Document Type", "Document Type");
    //         StrOrderLines.SetRange("Document No.", "No.");
    //         StrOrderLines.SetRange("Line No.", SaleLines."Line No.");
    //         StrOrderLines.SetRange("Price Inclusive of Tax", true);
    //         if StrOrderLines.FindFirst then
    //             StrOrderLines.DeleteAll;

    //         with SaleLines do begin
    //             "Amount Added to Excise Base" := 0;
    //             "Amount Added to Tax Base" := 0;
    //             "Excise Amount" := 0;
    //             "VAT Base Amount" := 0;
    //             Validate("Tax Liable", false);
    //             UpdateAmounts;
    //             Modify;
    //         end;

    //         if SaleLines."PIT Structure" <> '' then begin
    //             StrDetails.SetRange(Code, SaleLines."PIT Structure");
    //             if StrDetails.FindSet then
    //                 repeat
    //                     if StrDetails."Include PIT Calculation" and StrDetails."Payable to Third Party" then
    //                         StrDetails.TestField("Payable to Third Party", false);
    //                     StrOrderDetails.Type := StrOrderDetails.Type::Sale;
    //                     StrOrderDetails."Document Type" := "Document Type";
    //                     StrOrderDetails."Document No." := "No.";
    //                     StrOrderDetails."Document Line No." := SaleLines."Line No.";
    //                     StrOrderDetails."Structure Code" := SaleLines."PIT Structure";
    //                     StrOrderDetails."Calculation Order" := StrDetails."Calculation Order";
    //                     StrOrderDetails."Tax/Charge Type" := StrDetails.Type;
    //                     StrOrderDetails."Tax/Charge Group" := StrDetails."Tax/Charge Group";
    //                     StrOrderDetails."Tax/Charge Code" := StrDetails."Tax/Charge Code";
    //                     StrOrderDetails."Calculation Type" := StrDetails."Calculation Type";
    //                     StrOrderDetails."Calculation Value" := StrDetails."Calculation Value";
    //                     StrOrderDetails."Quantity Per" := StrDetails."Quantity Per";
    //                     StrOrderDetails."Loading on Inventory" := StrDetails."Loading on Inventory";
    //                     StrOrderDetails."% Loading on Inventory" := StrDetails."% Loading on Inventory";
    //                     StrOrderDetails."Payable to Third Party" := StrDetails."Payable to Third Party";
    //                     StrOrderDetails."Account No." := StrDetails."Account No.";
    //                     StrOrderDetails."Base Formula" := StrDetails."Base Formula";
    //                     StrOrderDetails."Include Base" := StrDetails."Include Base";
    //                     StrOrderDetails."Include Line Discount" := StrDetails."Include Line Discount";
    //                     StrOrderDetails."Include Invoice Discount" := StrDetails."Include Invoice Discount";
    //                     StrOrderDetails."Charge Basis" := StrDetails."Charge Basis";
    //                     StrOrderDetails."Header/Line" := StrDetails."Header/Line";
    //                     StrOrderDetails."Available for VAT Input" := StrDetails."Available for VAT Input";
    //                     StrOrderDetails.CVD := StrDetails.CVD;
    //                     StrOrderDetails."Price Inclusive of Tax" := SaleLines."Price Inclusive of Tax";
    //                     StrOrderDetails."Include PIT Calculation" := StrDetails."Include PIT Calculation";
    //                     StrOrderDetails.Insert;
    //                 until StrDetails.Next = 0;
    //         end;
    //     end;
    // end;

    // 
    // procedure InitStrOrdDetail(SalesHeader: Record "Sales Header")
    // var
    //     //StrOrderDetails: Record "Structure Order Details";//LKS-Raj Commented (Table Missing)
    //     SaleLines: Record "Sales Line";
    // //StrDetails: Record "Structure Details";//LKS-Raj Commented (Table Missing)
    // begin
    //     with SalesHeader do begin
    //         SaleLines.SetRange("Document Type", "Document Type");
    //         SaleLines.SetRange("Document No.", "No.");
    //         SaleLines.SetFilter(Type, '<>%1', SaleLines.Type::" ");
    //         SaleLines.SetRange("Price Inclusive of Tax", true);
    //         if SaleLines.FindSet then
    //             repeat
    //                 StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                 StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                 StrOrderDetails.SetRange("Document Type", "Document Type");
    //                 StrOrderDetails.SetRange("Document No.", "No.");
    //                 StrOrderDetails.SetRange("Document Line No.", SaleLines."Line No.");
    //                 StrOrderDetails.SetRange("Price Inclusive of Tax", true);
    //                 if not StrOrderDetails.FindFirst then begin
    //                     SaleLines."Amount Added to Excise Base" := 0;
    //                     SaleLines."Amount Added to Tax Base" := 0;
    //                     SaleLines."Excise Amount" := 0;
    //                     SaleLines."VAT Base Amount" := 0;
    //                     SaleLines.Validate("Tax Liable", false);
    //                     SaleLines.UpdateAmounts;
    //                     SaleLines.Modify;

    //                     StrDetails.Reset;
    //                     StrDetails.SetRange(Code, SaleLines."PIT Structure");
    //                     if StrDetails.FindSet then
    //                         repeat
    //                             if StrDetails."Include PIT Calculation" and StrDetails."Payable to Third Party" then
    //                                 StrDetails.TestField("Payable to Third Party", false);
    //                             StrOrderDetails.Type := StrOrderDetails.Type::Sale;
    //                             StrOrderDetails."Document Type" := "Document Type";
    //                             StrOrderDetails."Document No." := "No.";
    //                             StrOrderDetails."Document Line No." := SaleLines."Line No.";
    //                             StrOrderDetails."Structure Code" := SaleLines."PIT Structure";
    //                             StrOrderDetails."Calculation Order" := StrDetails."Calculation Order";
    //                             StrOrderDetails."Tax/Charge Type" := StrDetails.Type;
    //                             StrOrderDetails."Tax/Charge Group" := StrDetails."Tax/Charge Group";
    //                             StrOrderDetails."Tax/Charge Code" := StrDetails."Tax/Charge Code";
    //                             StrOrderDetails."Calculation Type" := StrDetails."Calculation Type";
    //                             StrOrderDetails."Calculation Value" := StrDetails."Calculation Value";
    //                             StrOrderDetails."Quantity Per" := StrDetails."Quantity Per";
    //                             StrOrderDetails."Loading on Inventory" := StrDetails."Loading on Inventory";
    //                             StrOrderDetails."% Loading on Inventory" := StrDetails."% Loading on Inventory";
    //                             StrOrderDetails."Payable to Third Party" := StrDetails."Payable to Third Party";
    //                             StrOrderDetails."Account No." := StrDetails."Account No.";
    //                             StrOrderDetails."Base Formula" := StrDetails."Base Formula";
    //                             StrOrderDetails."Include Base" := StrDetails."Include Base";
    //                             StrOrderDetails."Include Line Discount" := StrDetails."Include Line Discount";
    //                             StrOrderDetails."Include Invoice Discount" := StrDetails."Include Invoice Discount";
    //                             StrOrderDetails."Charge Basis" := StrDetails."Charge Basis";
    //                             StrOrderDetails."Header/Line" := StrDetails."Header/Line";
    //                             StrOrderDetails."Available for VAT Input" := StrDetails."Available for VAT Input";
    //                             StrOrderDetails.CVD := StrDetails.CVD;
    //                             StrOrderDetails."Price Inclusive of Tax" := SaleLines."Price Inclusive of Tax";
    //                             StrOrderDetails."Include PIT Calculation" := StrDetails."Include PIT Calculation";
    //                             StrOrderDetails.Insert;
    //                         until StrDetails.Next = 0;
    //                 end;
    //             until SaleLines.Next = 0;
    //     end;
    // end;

    // local procedure UpdateSalesLineBuffer()
    // var
    // //SaleslineBuffer: Record "Sale Line Detail Buffer";
    // //DutyCode: Record "Duty Code No.";
    //     DutyCode.Reset;
    //     if DutyCode.FindSet then
    //         repeat
    //             SaleslineBuffer.Reset;
    //             SaleslineBuffer.SetRange("Document Type", "Document Type");
    //             SaleslineBuffer.SetRange("Document No.", "Document No.");
    //             SaleslineBuffer.SetRange("Document Line No.", "Line No.");
    //             SaleslineBuffer.SetRange(Type, SaleslineBuffer.Type::Excise);
    //             SaleslineBuffer.SetRange("Component Code", DutyCode."Duty Code No.");
    //             if SaleslineBuffer.FindFirst then begin
    //                 if DutyCode."Duty Code No." = 1 then
    //                     SaleslineBuffer."Actual Amount Forward" := "BED Amount";
    //                 if DutyCode."Duty Code No." = 2 then
    //                     SaleslineBuffer."Actual Amount Forward" := "AED(GSI) Amount";
    //                 if DutyCode."Duty Code No." = 3 then
    //                     SaleslineBuffer."Actual Amount Forward" := "AED(TTA) Amount";
    //                 if DutyCode."Duty Code No." = 4 then
    //                     SaleslineBuffer."Actual Amount Forward" := "SED Amount";
    //                 if DutyCode."Duty Code No." = 5 then
    //                     SaleslineBuffer."Actual Amount Forward" := "SAED Amount";
    //                 if DutyCode."Duty Code No." = 6 then
    //                     SaleslineBuffer."Actual Amount Forward" := "CESS Amount";
    //                 if DutyCode."Duty Code No." = 7 then
    //                     SaleslineBuffer."Actual Amount Forward" := "NCCD Amount";
    //                 if DutyCode."Duty Code No." = 8 then
    //                     SaleslineBuffer."Actual Amount Forward" := "ADET Amount";
    //                 if DutyCode."Duty Code No." = 9 then
    //                     SaleslineBuffer."Actual Amount Forward" := "ADE Amount";
    //                 if DutyCode."Duty Code No." = 10 then
    //                     SaleslineBuffer."Actual Amount Forward" := "eCess Amount";
    //                 if DutyCode."Duty Code No." = 11 then
    //                     SaleslineBuffer."Actual Amount Forward" := "ADC VAT Amount";
    //                 if DutyCode."Duty Code No." = 12 then
    //                     SaleslineBuffer."Actual Amount Forward" := "SHE Cess Amount";
    //                 SaleslineBuffer.Modify(true);
    //             end;
    //         until DutyCode.Next = 0;
    // end;
    //LKS-Raj Commented (Table Missing)
    local procedure GetRoundingPrecisionUnitPrice() Precision: Decimal
    var
        GenLedgSetup: Record "General Ledger Setup";
        Currency: Record Currency;
        LoopCount: Integer;
    begin
        if "Currency Code" = '' then begin
            GenLedgSetup.Get;
            if GenLedgSetup."Unit-Amount Rounding Precision" <> 0 then
                Precision := GenLedgSetup."Unit-Amount Rounding Precision"
            else begin
                Evaluate(LoopCount, CopyStr(GenLedgSetup."Unit-Amount Decimal Places", StrPos(GenLedgSetup."Unit-Amount Decimal Places", ':') +
                    1));
                Precision := 1;
                repeat
                    LoopCount -= 1;
                    Precision := (1 * Precision) / 10
                until LoopCount = 0;
            end;
        end else begin
            Currency.Get("Currency Code");
            if Currency."Unit-Amount Rounding Precision" <> 0 then
                Precision := Currency."Unit-Amount Rounding Precision"
            else begin
                Evaluate(LoopCount, CopyStr(Currency."Unit-Amount Decimal Places", StrPos(Currency."Unit-Amount Decimal Places", ':') + 1));
                Precision := 1;
                repeat
                    LoopCount -= 1;
                    Precision := (1 * Precision) / 10
                until LoopCount = 0;
            end;
        end;
    end;
    //LKS-Raj Commented (Table Missing)
    // local procedure RoundExciseAmt(ExciseDutyAmount: Decimal): Decimal
    // var
    //     GLSetup: Record "General Ledger Setup";
    //     ExciseRoundingDirection: Text[1];
    //     ExciseRoundingPrecision: Decimal;
    // begin
    //     GLSetup.Get;
    //     case GLSetup."Excise Rounding Type" of
    //         GLSetup."Excise Rounding Type"::Nearest:
    //             ExciseRoundingDirection := '=';
    //         GLSetup."Excise Rounding Type"::Up:
    //             ExciseRoundingDirection := '>';
    //         GLSetup."Excise Rounding Type"::Down:
    //             ExciseRoundingDirection := '<';
    //     end;
    //     if GLSetup."Excise Rounding Precision" <> 0 then
    //         ExciseRoundingPrecision := GLSetup."Excise Rounding Precision"
    //     else
    //         ExciseRoundingPrecision := 0.01;
    //     exit(Round(ExciseDutyAmount, ExciseRoundingPrecision, ExciseRoundingDirection));
    // end;


    // 
    // procedure UpdateTaxAmountsPIT(SalesLine: Record "Sales Line"; StrOrdLineDetail: Record "Structure Order Line Details")
    // var
    //     //SaleslineBuffer: Record "Sale Line Detail Buffer";
    //     //IndianSalesTaxCalculate: Codeunit "Indian Sales Tax Calculate";
    //     StandardDeductionAmount: Decimal;
    //     LineTaxAmount: Decimal;
    // begin
    //     with SalesLine do begin
    //         SaleslineBuffer.Reset;
    //         SaleslineBuffer.SetRange("Document Type", "Document Type");
    //         SaleslineBuffer.SetRange("Document No.", "Document No.");
    //         SaleslineBuffer.SetRange("Document Line No.", "Line No.");
    //         SaleslineBuffer.SetRange(Type, StrOrdLineDetail."Tax/Charge Type");
    //         if SaleslineBuffer.FindSet then
    //             SaleslineBuffer.DeleteAll;
    //         InsertSalesLineBuffer(SalesLine, StrOrdLineDetail."Tax/Charge Type");
    //         InsertSalesTaxLineBuffer(SalesLine, StrOrdLineDetail."Tax/Charge Type");  // PS36451
    //         if StrOrdLineDetail."Tax/Charge Type" = StrOrdLineDetail."Tax/Charge Type"::Excise then
    //             UpdateExciseAmountPIT(SalesLine);

    //         TaxAreaUpdate;
    //         if ("Amount Added to Tax Base" <> 0) or ("Tax Base Variable" <> 0) then
    //             "Tax Liable" := SalesHeader."Tax Liable";

    //         // PS36451.begin
    //         // SaleslineBuffer.RESET;
    //         // SaleslineBuffer.SETRANGE(SaleslineBuffer."Document Type","Document Type");
    //         // SaleslineBuffer.SETRANGE(SaleslineBuffer."Document No.","Document No.");
    //         // SaleslineBuffer.SETRANGE(SaleslineBuffer."Document Line No.","Line No.");
    //         // SaleslineBuffer.SETRANGE(SaleslineBuffer.Type,SaleslineBuffer.Type::"Sales Tax");
    //         // IF SaleslineBuffer.FINDFIRST THEN BEGIN
    //         // SaleslineBuffer."Fixed Amount" := IndianSalesTaxCalculate.CalculateTaxPIT(
    //         // "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
    //         // "Amount Added to Tax Base" * (1 - "Standard Deduction %"/100) ,Quantity,SalesHeader."Currency Factor","Form Code");
    //         // SaleslineBuffer."Variable Amount" := IndianSalesTaxCalculate.CalculateTaxPIT(
    //         // "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
    //         // "Tax Base Variable" * (1 - "Standard Deduction %"/100),Quantity,SalesHeader."Currency Factor","Form Code");
    //         //
    //         // IF (SalesHeader."Export or Deemed Export") OR (SalesHeader."VAT Exempted") THEN BEGIN
    //         // SaleslineBuffer."Fixed Amount" := 0;
    //         // SaleslineBuffer."Variable Amount" := 0;
    //         // END;
    //         // SaleslineBuffer.MODIFY(TRUE);
    //         // END;
    //         // END;
    //         SaleslineBuffer.Reset;
    //         SaleslineBuffer.SetRange("Document Type", "Document Type");
    //         SaleslineBuffer.SetRange("Document No.", "Document No.");
    //         SaleslineBuffer.SetRange("Document Line No.", "Line No.");
    //         SaleslineBuffer.SetRange(Type, SaleslineBuffer.Type::"Sales Tax");
    //         if SaleslineBuffer.FindFirst then
    //             repeat
    //                 StandardDeductionAmount := 0;
    //                 /*
    //                 IndianSalesTaxCalculate.GetStdDeductionFixedPIT(
    //                   Rec,SaleslineBuffer."Tax Jurisdiction Code","Amount Added to Tax Base",StandardDeductionAmount,LineTaxAmount);
    //                 */
    //                 SaleslineBuffer."Fixed Amount" := LineTaxAmount - StandardDeductionAmount;
    //                 SaleslineBuffer."Standard Deduction Fixed Amt" := StandardDeductionAmount;

    //                 StandardDeductionAmount := 0;
    //                 /*
    //                 IndianSalesTaxCalculate.GetStdDeductionVarPIT(
    //                   Rec,SaleslineBuffer."Tax Jurisdiction Code","Tax Base Variable",StandardDeductionAmount,LineTaxAmount);
    //                  */
    //                 SaleslineBuffer."Variable Amount" := LineTaxAmount - StandardDeductionAmount;
    //                 SaleslineBuffer."Standard Deduction Var Amt" := StandardDeductionAmount;

    //                 if SalesHeader."Export or Deemed Export" or SalesHeader."VAT Exempted" then begin
    //                     SaleslineBuffer."Fixed Amount" := 0;
    //                     SaleslineBuffer."Variable Amount" := 0;
    //                 end;
    //                 SaleslineBuffer.Modify(true);
    //             until SaleslineBuffer.Next = 0;
    //     end;
    //     // PS36451.end

    // end;


    // 
    // procedure UpdateSalesLinesPIT(var SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     //StrOrderDetails: Record "Structure Order Details";//LKS-Raj Commented (Table Missing)
    //     //StrOrderLineDetails: Record "Structure Order Line Details";//LKS-Raj Commented (Table Missing)
    //     Currency: Record Currency;
    //     ChargesToCustomer: Decimal;
    // begin
    //     with SalesHeader do begin
    //         if "Currency Code" = '' then
    //             Currency.InitRoundingPrecision
    //         else
    //             Currency.Get("Currency Code");

    //         SalesLine.LockTable;
    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetFilter(Type, '%1|%2|%3|%4|%5', SalesLine.Type::Item, SalesLine.Type::"G/L Account", SalesLine.Type::"Fixed Asset",
    //           SalesLine.Type::Resource, SalesLine.Type::"Charge (Item)");
    //         SalesLine.SetRange("Price Inclusive of Tax", true);
    //         if SalesLine.FindSet then
    //             repeat
    //                 if SalesLine."Line Amount" <> 0 then
    //                     with SalesLine do begin
    //                         ChargesToCustomer := 0;
    //                         StrOrderDetails.Reset;
    //                         StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
    //                         StrOrderDetails.SetRange("Document Type", "Document Type");
    //                         StrOrderDetails.SetRange("Document No.", "Document No.");
    //                         StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
    //                         StrOrderDetails.SetRange("Price Inclusive of Tax", "Price Inclusive of Tax");
    //                         StrOrderDetails.SetRange("Document Line No.", "Line No.");
    //                         if StrOrderDetails.FindSet then
    //                             repeat
    //                                 StrOrderLineDetails.Reset;
    //                                 StrOrderLineDetails.SetRange(Type, StrOrderLineDetails.Type::Sale);
    //                                 StrOrderLineDetails.SetRange("Calculation Order", StrOrderDetails."Calculation Order");
    //                                 StrOrderLineDetails.SetRange("Document Type", "Document Type");
    //                                 StrOrderLineDetails.SetRange("Document No.", "Document No.");
    //                                 StrOrderLineDetails.SetRange("Structure Code", "PIT Structure");
    //                                 StrOrderLineDetails.SetRange("Item No.", "No.");
    //                                 StrOrderLineDetails.SetRange("Line No.", "Line No.");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
    //                                 StrOrderLineDetails.SetRange("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
    //                                 StrOrderLineDetails.SetRange("Price Inclusive of Tax", "Price Inclusive of Tax");
    //                                 if StrOrderLineDetails.FindSet then
    //                                     repeat
    //                                         if not StrOrderDetails."Payable to Third Party" then
    //                                             if not (StrOrderDetails."Tax/Charge Type" in [StrOrderDetails."Tax/Charge Type"::"Sales Tax",
    //                                                                                           StrOrderDetails."Tax/Charge Type"::Excise,
    //                                                                                           StrOrderDetails."Tax/Charge Type"::"Service Tax"])
    //                                             then
    //                                                 ChargesToCustomer :=
    //                                                   ChargesToCustomer + Round(StrOrderLineDetails.Amount, Currency."Amount Rounding Precision");
    //                                     until StrOrderLineDetails.Next = 0;
    //                             until StrOrderDetails.Next = 0;
    //                         "Charges To Customer" := ChargesToCustomer;
    //                         if "TCS Nature of Collection" = '' then
    //                             "Amount To Customer" := "Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Tax Amount" +
    //                               "Charges To Customer" - "Bal. TDS/TCS Including SHECESS" +
    //                               "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount"
    //                         else
    //                             "Amount To Customer" := "Line Amount" - "Inv. Discount Amount" + "Excise Amount" + "Tax Amount" +
    //                               "Charges To Customer" + "Bal. TDS/TCS Including SHECESS" +
    //                               "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount";
    //                         Modify;
    //                     end;
    //             until SalesLine.Next = 0;
    //     end;
    // end;
    //LKS-Raj Commented (Table Missing)

    procedure ValidateUnitPrice()
    begin
        if "Free Supply" then
            "Line Discount %" := 100;
        if not "Price Inclusive of Tax" then
            "Line Discount Amount" := Round(Round(Quantity * "Unit Price", Currency."Amount Rounding Precision") * "Line Discount %" / 100,
                Currency."Amount Rounding Precision")
        else
            "Line Discount Amount" := Round(Round(Quantity * "Unit Price Incl. of Tax", Currency."Amount Rounding Precision") *
                "Line Discount %" / 100, Currency."Amount Rounding Precision");
        "Inv. Discount Amount" := 0;
        "Inv. Disc. Amount to Invoice" := 0;
        UpdateAmounts;
    end;

    //LKS-Raj Commented (Table Missing)
    //     
    //     procedure CalcVATAmountLinesPIT(QtyType: Option General,Invoicing,Shipping; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    //     var
    //         Currency: Record Currency;
    //         SalesSetup: Record "Sales & Receivables Setup";
    //         SalesLine2: Record "Sales Line";
    //         RoundingLineInserted: Boolean;
    //         TotalVATAmount: Decimal;
    //     begin
    //         if SalesHeader."Currency Code" = '' then
    //             Currency.InitRoundingPrecision
    //         else
    //             Currency.Get(SalesHeader."Currency Code");

    //         VATAmountLine.DeleteAll;

    //         with SalesLine do begin
    //             SetRange("Document Type", SalesHeader."Document Type");
    //             SetRange("Document No.", SalesHeader."No.");
    //             SetFilter(Type, '>0');
    //             SetFilter(Quantity, '<>0');
    //             SalesSetup.Get;
    //             if SalesSetup."Invoice Rounding" then begin
    //                 SalesLine2.CopyFilters(SalesLine);
    //                 RoundingLineInserted := Count <> SalesLine2.Count;
    //             end;
    //             if Find('-') then
    //                 repeat
    //                     if "VAT Calculation Type" in
    //                        ["VAT Calculation Type"::"Reverse Charge VAT", "VAT Calculation Type"::"Sales Tax"]
    //                     then
    //                         "VAT %" := 0;
    //                     if not VATAmountLine.Get(
    //                          "VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0)
    //                     then begin
    //                         VATAmountLine.Init;
    //                         VATAmountLine."VAT Identifier" := "VAT Identifier";
    //                         VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
    //                         VATAmountLine."Tax Group Code" := "Tax Group Code";
    //                         VATAmountLine."VAT %" := "VAT %";
    //                         VATAmountLine.Modified := true;
    //                         VATAmountLine.Positive := "Line Amount" >= 0;
    //                         VATAmountLine.Insert;
    //                     end;
    //                     VATAmountLine.Quantity := VATAmountLine.Quantity + "Quantity (Base)";
    //                     if "Price Inclusive of Tax" then begin
    //                         VATAmountLine."Line Amount Fixed" := VATAmountLine."Line Amount Fixed" + "Line Discount Amount";
    //                         VATAmountLine."Line Amount Variable" := VATAmountLine."Line Amount Variable" + Quantity;
    //                         if "Allow Invoice Disc." then begin
    //                             VATAmountLine."Inv. Disc. Base Amount Fixed" :=
    //                               VATAmountLine."Inv. Disc. Base Amount Fixed" - "Line Discount Amount";
    //                             VATAmountLine."Inv. Disc. Base Amt Variable" :=
    //                               VATAmountLine."Inv. Disc. Base Amt Variable" + Quantity;
    //                         end;
    //                     end else begin
    //                         VATAmountLine."Line Amount Fixed" := VATAmountLine."Line Amount Fixed" + "Line Amount";
    //                         if "Allow Invoice Disc." then
    //                             VATAmountLine."Inv. Disc. Base Amount Fixed" :=
    //                               VATAmountLine."Inv. Disc. Base Amount Fixed" + "Line Amount";
    //                     end;
    //                     VATAmountLine."VAT Difference" := VATAmountLine."VAT Difference" + "VAT Difference";
    //                     VATAmountLine.Modify;
    //                     if RoundingLineInserted then
    //                         TotalVATAmount := TotalVATAmount + "Amount Including VAT" - Amount + "VAT Difference";
    //                 until Next = 0;
    //             SetRange(Type);
    //             SetRange(Quantity);
    //         end;
    //     end;

    //     
    //     procedure UpdateVATOnLinesPIT(QtyType: Option General,Invoicing,Shipping; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    //     var
    //         TempVATAmountLineRemainder: Record "VAT Amount Line" temporary;
    //         Currency: Record Currency;
    //         InvDiscAmount: Decimal;
    //         LineAmountToInvoice: Decimal;
    //         InvDiscAmountVar: Decimal;
    //         LineAmountToInvoiceVar: Decimal;
    //     begin
    //         if QtyType = QtyType::Shipping then
    //             exit;
    //         if SalesHeader."Currency Code" = '' then
    //             Currency.InitRoundingPrecision
    //         else
    //             Currency.Get(SalesHeader."Currency Code");

    //         TempVATAmountLineRemainder.DeleteAll;

    //         with SalesLine do begin
    //             SetRange("Document Type", SalesHeader."Document Type");
    //             SetRange("Document No.", SalesHeader."No.");
    //             SetFilter(Type, '>0');
    //             SetFilter(Quantity, '<>0');
    //             case QtyType of
    //                 QtyType::Invoicing:
    //                     SetFilter("Qty. to Invoice", '<>0');
    //                 QtyType::Shipping:
    //                     SetFilter("Qty. to Ship", '<>0');
    //             end;
    //             LockTable;
    //             if Find('-') then
    //                 repeat
    //                     VATAmountLine.Get("VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0);
    //                     if VATAmountLine.Modified then begin
    //                         if not TempVATAmountLineRemainder.Get(
    //                              "VAT Identifier", "VAT Calculation Type", "Tax Group Code", false, "Line Amount" >= 0)
    //                         then begin
    //                             TempVATAmountLineRemainder := VATAmountLine;
    //                             TempVATAmountLineRemainder.Init;
    //                             TempVATAmountLineRemainder.Insert;
    //                         end;

    //                         if "Price Inclusive of Tax" then begin
    //                             if QtyType = QtyType::General then
    //                                 LineAmountToInvoice := -"Line Discount Amount"
    //                             else
    //                                 LineAmountToInvoice :=
    //                                   -"Line Discount Amount" * "Qty. to Invoice" / Quantity;

    //                             if QtyType = QtyType::General then
    //                                 LineAmountToInvoiceVar := Quantity
    //                             else
    //                                 LineAmountToInvoiceVar :=
    //                                   Quantity * "Qty. to Invoice" / Quantity;

    //                             if "Allow Invoice Disc." then begin
    //                                 if VATAmountLine."Inv. Disc. Base Amount Fixed" = 0 then
    //                                     InvDiscAmount := 0
    //                                 else begin
    //                                     TempVATAmountLineRemainder."Invoice Discount Amount Fixed" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed" +
    //                                       VATAmountLine."Invoice Discount Amount Fixed" * LineAmountToInvoice /
    //                                       VATAmountLine."Inv. Disc. Base Amount Fixed";
    //                                     InvDiscAmount :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed";
    //                                     TempVATAmountLineRemainder."Invoice Discount Amount Fixed" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed" - InvDiscAmount;
    //                                 end;

    //                                 if VATAmountLine."Inv. Disc. Base Amt Variable" = 0 then
    //                                     InvDiscAmountVar := 0
    //                                 else begin
    //                                     TempVATAmountLineRemainder."Invoice Discount Amt Variable" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amt Variable" +
    //                                       VATAmountLine."Invoice Discount Amt Variable" * LineAmountToInvoiceVar /
    //                                       VATAmountLine."Inv. Disc. Base Amt Variable";
    //                                     InvDiscAmountVar :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amt Variable";
    //                                     TempVATAmountLineRemainder."Invoice Discount Amt Variable" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amt Variable" - InvDiscAmountVar;
    //                                 end;
    //                                 if QtyType = QtyType::General then begin
    //                                     "Inv Discount Fixed" := InvDiscAmount;
    //                                     "Inv Discount Variable" := InvDiscAmountVar;
    //                                 end else
    //                                     "Inv. Disc. Amount to Invoice" := InvDiscAmount;
    //                             end else begin
    //                                 InvDiscAmount := 0;
    //                                 InvDiscAmountVar := 0;
    //                             end;
    //                         end else begin
    //                             if QtyType = QtyType::General then
    //                                 LineAmountToInvoice := "Line Amount"
    //                             else
    //                                 LineAmountToInvoice :=
    //                                   "Line Amount" * "Qty. to Invoice" / Quantity;

    //                             if "Allow Invoice Disc." then begin
    //                                 if VATAmountLine."Inv. Disc. Base Amount Fixed" = 0 then
    //                                     InvDiscAmount := 0
    //                                 else begin
    //                                     TempVATAmountLineRemainder."Invoice Discount Amount Fixed" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed" +
    //                                       VATAmountLine."Invoice Discount Amount Fixed" * LineAmountToInvoice /
    //                                       VATAmountLine."Inv. Disc. Base Amount Fixed";
    //                                     InvDiscAmount :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed";
    //                                     TempVATAmountLineRemainder."Invoice Discount Amount Fixed" :=
    //                                       TempVATAmountLineRemainder."Invoice Discount Amount Fixed" - InvDiscAmount;
    //                                 end;

    //                                 if QtyType = QtyType::General then begin
    //                                     "Inv Discount Fixed" := InvDiscAmount;
    //                                 end else
    //                                     "Inv. Disc. Amount to Invoice" := InvDiscAmount;
    //                             end else
    //                                 InvDiscAmount := 0;
    //                         end;
    //                         InitOutstanding;
    //                         Modify;
    //                         TempVATAmountLineRemainder.Modify;
    //                     end;
    //                 until Next = 0;
    //             SetRange(Type);
    //             SetRange(Quantity);
    //             SetRange("Qty. to Invoice");
    //             SetRange("Qty. to Ship");
    //         end;
    //     end;

    // 
    // procedure ShowStrOrderDetailsPIT()
    // var
    //     StructureOrderDetail: Record "Structure Order Details";
    //     StrOrderDetailsPITForm: Page "Structure Order Details PIT";
    //     SalesHeaderRec: Record "Sales Header";
    // begin
    //     SalesHeaderRec.Reset;
    //     SalesHeaderRec.Get("Document Type", "Document No.");
    //     InitStrOrdDetail(SalesHeaderRec);
    //     Commit;
    //     StructureOrderDetail.Reset;
    //     StructureOrderDetail.SetRange(Type, StructureOrderDetail.Type::Sale);
    //     StructureOrderDetail.SetRange("Document Type", "Document Type");
    //     StructureOrderDetail.SetRange("Document No.", "Document No.");
    //     StructureOrderDetail.SetRange("Document Line No.", "Line No.");
    //     StructureOrderDetail.SetRange("Price Inclusive of Tax", true);
    //     StrOrderDetailsPITForm.SetTableView(StructureOrderDetail);
    //     StrOrderDetailsPITForm.RunModal;
    // end;

    // 
    // procedure GetExcisePostingSetup()
    // var
    //     SalesHeader2: Record "Sales Header";
    // ExcisePostingSetup2: Record "Excise Posting Setup";
    // ExcisePostingSetupForm: Page "Excise Posting Setup List";
    // StructureDetails: Record "Structure Details";
    // begin
    //     SalesHeader2.Get("Document Type", "Document No.");
    //     if SalesHeader2.Structure <> '' then begin
    //         StructureDetails.SetRange(Code, SalesHeader2.Structure);
    //         StructureDetails.SetRange(Type, StructureDetails.Type::Excise);
    //         if StructureDetails.FindFirst then begin
    //             ExcisePostingSetup2.Reset;
    //             ExcisePostingSetup2.SetRange("Excise Bus. Posting Group", "Excise Bus. Posting Group");
    //             ExcisePostingSetup2.SetRange("Excise Prod. Posting Group", "Excise Prod. Posting Group");
    //             ExcisePostingSetup2.SetRange("From Date", 0D, SalesHeader2."Posting Date");
    //             if ExcisePostingSetup2.FindLast then
    //                 ExcisePostingSetup2.Mark := true;
    //             ExcisePostingSetup2.MarkedOnly(true);
    //             ExcisePostingSetupForm.Editable := false;
    //             ExcisePostingSetupForm.SetTableView(ExcisePostingSetup2);
    //             ExcisePostingSetupForm.RunModal;
    //         end else
    //             Error(Text16508);
    //     end else
    //         Error(Text16508);
    // end;

    // 
    // procedure ValidateTaxGroupCode()
    // var
    //     TaxAreaLine2: Record "Tax Area Line";
    //     TaxJurisdiction2: Record "Tax Jurisdiction";
    //     Taxdetail: Record "Tax Detail";
    // begin
    //     TaxAreaLine2.Reset;
    //     TaxAreaLine2.SetCurrentKey("Tax Area", "Calculation Order");
    //     TaxAreaLine2.SetRange("Tax Area", "Tax Area Code");
    //     if TaxAreaLine2.FindFirst then begin
    //         TaxJurisdiction2.Get(TaxAreaLine2."Tax Jurisdiction Code");
    //         Taxdetail.Reset;
    //         Taxdetail.SetRange("Tax Jurisdiction Code", TaxAreaLine2."Tax Jurisdiction Code");
    //         Taxdetail.SetFilter("Tax Group Code", '%1', "Tax Group Code");
    //         if not TaxJurisdiction2."Forms Not Applicable" then
    //             Taxdetail.SetRange("Form Code", "Form Code")
    //         else
    //             Taxdetail.SetRange("Forms Not Applicable", true);
    //         if Taxdetail.FindLast then
    //             "Standard Deduction %" := Taxdetail."Standard Deduction %";
    //     end;
    // end;

    // local procedure InsertSalesTaxLineBuffer(SalesLine: Record "Sales Line"; TaxType: Option Charges,"Sales Tax",Excise,"Other Taxes","Service Tax")
    // var
    //     SaleslineBuffer: Record "Sale Line Detail Buffer";
    //     TaxAreaLine: Record "Tax Area Line";
    //     LineNoBuffer: Integer;
    // begin
    //     // PS36451.begin
    //     LineNoBuffer := 0;
    //     if TaxType = TaxType::Excise then
    //         exit;
    //     SaleslineBuffer.Reset;
    //     SaleslineBuffer.SetRange("Document Type", SalesLine."Document Type");
    //     SaleslineBuffer.SetRange("Document No.", SalesLine."Document No.");
    //     SaleslineBuffer.SetRange("Document Line No.", SalesLine."Line No.");
    //     SaleslineBuffer.SetRange(Type, TaxType);
    //     if SaleslineBuffer.FindLast then
    //         LineNoBuffer := LineNoBuffer + 10000
    //     else
    //         LineNoBuffer := 10000;

    //     TaxAreaLine.Reset;
    //     TaxAreaLine.SetCurrentKey("Tax Area", "Calculation Order");
    //     TaxAreaLine.SetRange("Tax Area", SalesLine."Tax Area Code");
    //     if TaxAreaLine.FindSet then
    //         repeat
    //             SaleslineBuffer.Init;
    //             SaleslineBuffer."Document Type" := SalesLine."Document Type";
    //             SaleslineBuffer."Document No." := SalesLine."Document No.";
    //             SaleslineBuffer."Document Line No." := SalesLine."Line No.";
    //             SaleslineBuffer.Type := TaxType;
    //             SaleslineBuffer."Line No." := LineNoBuffer;
    //             SaleslineBuffer."Component Code" := TaxAreaLine."Calculation Order";
    //             SaleslineBuffer."Tax Jurisdiction Code" := TaxAreaLine."Tax Jurisdiction Code";
    //             LineNoBuffer := LineNoBuffer + 10000;
    //             SaleslineBuffer.Insert;
    //         until TaxAreaLine.Next = 0;
    //     // PS36451.end
    // end;

    // 
    // procedure CheckAssessableValue(SalesHeader: Record "Sales Header"): Boolean
    // var
    //     ExcisePostingSetup: Record "Excise Posting Setup";
    //     AssessableValue: Boolean;
    // begin
    //     // PS38000.begin
    //     with SalesHeader do begin
    //         ExcisePostingSetup.SetRange("Excise Bus. Posting Group", "Excise Bus. Posting Group");
    //         ExcisePostingSetup.SetRange("Excise Prod. Posting Group", "Excise Prod. Posting Group");
    //         if "Posting Date" <> 0D then
    //             ExcisePostingSetup.SetRange("From Date", 0D, "Posting Date")
    //         else
    //             ExcisePostingSetup.SetRange("From Date", 0D, WorkDate);
    //         if ExcisePostingSetup.FindLast then
    //             AssessableValue := ExcisePostingSetup."BED Calculation Type" =
    //               ExcisePostingSetup."BED Calculation Type"::"% of Accessable Value";
    //         exit(AssessableValue);
    //     end;
    //     // PS38000.end
    // end;

    // 
    // procedure InitRG23DSplitingBuffer(SalesHeader: Record "Sales Header")
    // var
    //     SalesLine: Record "Sales Line";
    //     DetailRG23D: Record "Detail RG 23 D";
    //     RG23DSplitingBuffer: Record "RG 23 D Spliting buffer";
    //     TempDetailRG23D: Record "Detail RG 23 D" temporary;
    //     TempDetailRG23DRemainder: Record "Detail RG 23 D" temporary;
    //     TempDetailRG23DConsInCurrDoc: Record "Detail RG 23 D" temporary;
    //     QuantityInCurrLine: Decimal;
    //     QtyInCurrLineAlreadyAdjusted: Decimal;
    //     RefQuantity: Decimal;
    //     AllQtyInCurrLineAdjusted: Boolean;
    //     EntryNo: Integer;
    // begin
    //     // VSTF208159.begin
    //     with SalesHeader do begin
    //         if not Trading then
    //             exit;
    //         if not Invoice then
    //             exit;
    //         TempDetailRG23DRemainder.DeleteAll;
    //         TempDetailRG23DConsInCurrDoc.DeleteAll;

    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetRange(Type, SalesLine.Type::Item);
    //         if SalesLine.FindSet then
    //             repeat
    //                 with SalesLine do begin
    //                     if "Qty. to Invoice" <> 0 then begin
    //                         QuantityInCurrLine := "Qty. to Invoice";
    //                         QtyInCurrLineAlreadyAdjusted := 0;
    //                         AllQtyInCurrLineAdjusted := false;
    //                         DetailRG23D.Reset;
    //                         DetailRG23D.SetCurrentKey("Document Type", "Order No.", "Document No.", "Line No.");
    //                         DetailRG23D.SetRange("Transaction Type", DetailRG23D."Transaction Type"::Sale);
    //                         DetailRG23D.SetRange(Undo, false);
    //                         if ("Shipment No." = '') and ("Return Receipt No." = '') then begin
    //                             DetailRG23D.SetRange("Document Type", "Document Type");
    //                             DetailRG23D.SetRange("Order No.", "Document No.");
    //                             DetailRG23D.SetRange("Line No.", "Line No.");
    //                         end else
    //                             if "Shipment No." <> '' then begin
    //                                 DetailRG23D.SetRange("Document Type", DetailRG23D."Document Type"::Order);
    //                                 DetailRG23D.SetRange("Document No.", "Shipment No.");
    //                                 DetailRG23D.SetRange("Line No.", "Shipment Line No.");
    //                             end else
    //                                 if "Return Receipt No." <> '' then begin
    //                                     DetailRG23D.SetRange("Document Type", DetailRG23D."Document Type"::"Return Order");
    //                                     DetailRG23D.SetRange("Document No.", "Return Receipt No.");
    //                                     DetailRG23D.SetRange("Line No.", "Return Receipt Line No.");
    //                                 end;
    //                         DetailRG23D.SetRange("Completely Invoiced", false);
    //                         if DetailRG23D.FindSet then
    //                             repeat
    //                                 RefQuantity := 0;
    //                                 if not TempDetailRG23DConsInCurrDoc.Get(DetailRG23D."Entry No.") then begin
    //                                     if TempDetailRG23DRemainder.Get(DetailRG23D."Entry No.") then begin
    //                                         RefQuantity := TempDetailRG23DRemainder.Quantity;
    //                                         TempDetailRG23DRemainder.Quantity :=
    //                                           TempDetailRG23DRemainder.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                                         if TempDetailRG23DRemainder.Quantity <= 0 then begin
    //                                             TempDetailRG23DConsInCurrDoc.TransferFields(TempDetailRG23DRemainder);
    //                                             TempDetailRG23DConsInCurrDoc.Insert;
    //                                             TempDetailRG23DRemainder.Delete;
    //                                         end else begin
    //                                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                                             TempDetailRG23DRemainder.Quantity := TempDetailRG23DRemainder.Quantity - RefQuantity;
    //                                             TempDetailRG23DRemainder.Modify;
    //                                             AllQtyInCurrLineAdjusted := true;
    //                                         end;
    //                                     end else begin
    //                                         TempDetailRG23D.TransferFields(DetailRG23D);
    //                                         TempDetailRG23D.Quantity := Abs(DetailRG23D.Quantity) - Abs(DetailRG23D."Quantity Invoiced");
    //                                         RefQuantity := TempDetailRG23D.Quantity;
    //                                         TempDetailRG23D.Quantity :=
    //                                           TempDetailRG23D.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                                         if TempDetailRG23D.Quantity <= 0 then begin
    //                                             TempDetailRG23DConsInCurrDoc.TransferFields(DetailRG23D);
    //                                             TempDetailRG23DConsInCurrDoc.Insert;
    //                                         end else begin
    //                                             AllQtyInCurrLineAdjusted := true;
    //                                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                                             TempDetailRG23DRemainder.TransferFields(DetailRG23D);
    //                                             TempDetailRG23DRemainder.Quantity := TempDetailRG23D.Quantity - RefQuantity;
    //                                             TempDetailRG23DRemainder.Insert;
    //                                         end;
    //                                     end;
    //                                     QtyInCurrLineAlreadyAdjusted := QtyInCurrLineAlreadyAdjusted + RefQuantity;

    //                                     RG23DSplitingBuffer.Reset;
    //                                     if RG23DSplitingBuffer.FindLast then
    //                                         EntryNo := RG23DSplitingBuffer."Entry No." + 1
    //                                     else
    //                                         EntryNo := 1;

    //                                     RG23DSplitingBuffer.Init;
    //                                     RG23DSplitingBuffer."Entry No." := EntryNo;
    //                                     RG23DSplitingBuffer."RG 23 D Entry No." := DetailRG23D."RG 23 D Entry No.";
    //                                     RG23DSplitingBuffer."Detail RG 23 D Entry No." := DetailRG23D."Entry No.";
    //                                     RG23DSplitingBuffer."Document Type" := "Document Type";
    //                                     RG23DSplitingBuffer."Document No." := "Document No.";
    //                                     RG23DSplitingBuffer."Line No." := "Line No.";
    //                                     if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice] then
    //                                         RG23DSplitingBuffer.Quantity := -RefQuantity
    //                                     else
    //                                         if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
    //                                             RG23DSplitingBuffer.Quantity := RefQuantity;
    //                                     RG23DSplitingBuffer."Posted Document No." := DetailRG23D."Document No.";
    //                                     RG23DSplitingBuffer."Posted Document Line No." := DetailRG23D."Document Line No.";
    //                                     RG23DSplitingBuffer."Transaction Type" := DetailRG23D."Transaction Type";
    //                                     RG23DSplitingBuffer.Insert;

    //                                     if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice] then
    //                                         DetailRG23D."Quantity Invoiced" += -RefQuantity
    //                                     else
    //                                         if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
    //                                             DetailRG23D."Quantity Invoiced" += RefQuantity;
    //                                     DetailRG23D."Completely Invoiced" := DetailRG23D.Quantity = DetailRG23D."Quantity Invoiced";
    //                                     DetailRG23D.Modify;
    //                                 end;
    //                             until (DetailRG23D.Next = 0) or AllQtyInCurrLineAdjusted or (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted = 0);
    //                     end;
    //                 end;
    //             until SalesLine.Next = 0;
    //     end;
    //     // VSTF208159.end
    // end;

    // 
    // procedure InitDetailRG23DReturn(SalesHeader: Record "Sales Header"): Boolean
    // var
    //     SalesLine: Record "Sales Line";
    //     DetailRG23D: Record "Detail RG 23 D";
    //     RG23D: Record "RG 23 D";
    //     RG23DPurch: Record "RG 23 D";
    //     TempRG23D: Record "RG 23 D" temporary;
    //     QuantityInCurrLine: Decimal;
    //     QtyInCurrLineAlreadyAdjusted: Decimal;
    //     RefQuantity: Decimal;
    //     AllQtyInCurrLineAdjusted: Boolean;
    //     EntryNo: Integer;
    //     TempRG23DInvtCheck: Record "RG 23 D" temporary;
    // begin
    //     // VSTF208159.begin
    //     with SalesHeader do begin
    //         if ("Document Type" in ["Document Type"::Order, "Document Type"::Invoice]) or
    //            (("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and (not Receive))
    //         then
    //             exit(false);

    //         TempRG23DRemainder.DeleteAll;
    //         TempRG23DConsumedInCurrDoc.DeleteAll;
    //         InvtBuffer[1].DeleteAll;
    //         TempRG23DInvtCheck.DeleteAll;

    //         SalesLine.Reset;
    //         SalesLine.SetRange("Document Type", "Document Type");
    //         SalesLine.SetRange("Document No.", "No.");
    //         SalesLine.SetRange(Type, SalesLine.Type::Item);
    //         if SalesLine.FindSet then
    //             repeat
    //                 with SalesLine do begin
    //                     if "Return Receipt No." = '' then begin
    //                         if "Return Qty. to Receive" <> 0 then begin
    //                             Clear(InvtBuffer[1]);
    //                             InvtBuffer[1]."Item No." := "No.";
    //                             InvtBuffer[1].Quantity := -"Return Qty. to Receive";
    //                             InvtBuffer[2] := InvtBuffer[1];
    //                             if InvtBuffer[2].Find then begin
    //                                 InvtBuffer[2].Quantity := InvtBuffer[2].Quantity + InvtBuffer[1].Quantity;
    //                                 InvtBuffer[2].Modify;
    //                             end else
    //                                 InvtBuffer[1].Insert;

    //                             QuantityInCurrLine := "Return Qty. to Receive";
    //                             QtyInCurrLineAlreadyAdjusted := 0;
    //                             AllQtyInCurrLineAdjusted := false;
    //                             RG23D.Reset;
    //                             RG23D.SetCurrentKey("Item No.", "Posting Date", "Transaction Type", Type, "Location Code");
    //                             RG23D.SetRange("Item No.", "No.");
    //                             RG23D.SetRange("Document No.", SalesHeader."Applies-to Doc. No.");
    //                             RG23D.SetRange(Type, RG23D.Type::Invoice);
    //                             RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Sale);
    //                             RG23D.SetRange("Location Code", "Location Code");
    //                             if RG23D.FindSet then
    //                                 repeat
    //                                     if not TempRG23DInvtCheck.Get(RG23D."Entry No.") then begin
    //                                         TempRG23DInvtCheck."Entry No." := RG23D."Entry No.";
    //                                         TempRG23DInvtCheck.Insert;
    //                                         Clear(InvtBuffer[1]);
    //                                         InvtBuffer[1]."Item No." := "No.";
    //                                         InvtBuffer[1].Quantity := Abs(RG23D.Quantity);
    //                                         InvtBuffer[2] := InvtBuffer[1];
    //                                         if InvtBuffer[2].Find then begin
    //                                             InvtBuffer[2].Quantity := InvtBuffer[2].Quantity + InvtBuffer[1].Quantity;
    //                                             InvtBuffer[2].Modify;
    //                                         end else
    //                                             InvtBuffer[1].Insert;
    //                                     end;
    //                                     RG23DPurch.Get(RG23D."Ref. Entry No.");
    //                                     RG23DPurch.CalcFields("Remaining Quantity");
    //                                     if RG23DPurch.Quantity <> RG23DPurch."Remaining Quantity" then begin
    //                                         RefQuantity := 0;
    //                                         if not TempRG23DConsumedInCurrDoc.Get(RG23D."Entry No.") then begin
    //                                             if TempRG23DRemainder.Get(RG23D."Entry No.") then begin
    //                                                 RefQuantity := TempRG23DRemainder.Quantity;
    //                                                 TempRG23DRemainder.Quantity :=
    //                                                   Abs(TempRG23DRemainder.Quantity) - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                                                 if TempRG23DRemainder.Quantity <= 0 then begin
    //                                                     TempRG23DConsumedInCurrDoc.TransferFields(TempRG23DRemainder);
    //                                                     TempRG23DConsumedInCurrDoc.Insert;
    //                                                     TempRG23DRemainder.Delete;
    //                                                 end else begin
    //                                                     RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                                                     TempRG23DRemainder.Quantity := TempRG23DRemainder.Quantity - RefQuantity;
    //                                                     TempRG23DRemainder.Modify;
    //                                                     AllQtyInCurrLineAdjusted := true;
    //                                                 end;
    //                                             end else begin
    //                                                 TempRG23D.TransferFields(RG23D);
    //                                                 TempRG23D.Quantity := Abs(TempRG23D.Quantity);
    //                                                 RefQuantity := TempRG23D.Quantity;
    //                                                 TempRG23D.Quantity :=
    //                                                   Abs(TempRG23D.Quantity) - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                                                 if TempRG23D.Quantity <= 0 then begin
    //                                                     TempRG23DConsumedInCurrDoc.TransferFields(RG23D);
    //                                                     TempRG23DConsumedInCurrDoc.Insert;
    //                                                 end else begin
    //                                                     AllQtyInCurrLineAdjusted := true;
    //                                                     RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                                                     TempRG23DRemainder.TransferFields(RG23D);
    //                                                     TempRG23DRemainder.Quantity := Abs(RG23D.Quantity) - RefQuantity;
    //                                                     TempRG23DRemainder.Insert;
    //                                                 end;
    //                                             end;
    //                                             QtyInCurrLineAlreadyAdjusted := Abs(QtyInCurrLineAlreadyAdjusted + RefQuantity);

    //                                             DetailRG23D.Reset;
    //                                             if DetailRG23D.FindLast then
    //                                                 EntryNo := DetailRG23D."Entry No." + 1
    //                                             else
    //                                                 EntryNo := 1;

    //                                             DetailRG23D.Init;
    //                                             DetailRG23D."Entry No." := EntryNo;
    //                                             DetailRG23D."Document Type" := "Document Type";
    //                                             DetailRG23D."Order No." := "Document No.";
    //                                             DetailRG23D."Line No." := "Line No.";
    //                                             DetailRG23D.Quantity := RefQuantity;
    //                                             DetailRG23D."RG 23 D Entry No." := RG23D."Ref. Entry No.";
    //                                             DetailRG23D."Transaction Type" := DetailRG23D."Transaction Type"::Sale;
    //                                             DetailRG23D.Insert(true);
    //                                         end;
    //                                     end;
    //                                 until (RG23D.Next = 0) or AllQtyInCurrLineAdjusted or (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted = 0);
    //                         end;
    //                     end;
    //                 end;
    //             until SalesLine.Next = 0;
    //         if InvtBuffer[1].Find('+') then
    //             repeat
    //                 if InvtBuffer[1].Quantity < 0 then
    //                     Error(Text16500, InvtBuffer[1]."Item No.", Abs(InvtBuffer[1].Quantity));
    //             until InvtBuffer[1].Next(-1) = 0;
    //         exit(true);
    //     end;
    //     // VSTF208159.end
    // end;

    // 
    // procedure GetExcseAmountsStats(var SalesLine: Record "Sales Line"; SalesLineQty: Decimal)
    // var
    //     RG23D: Record "RG 23 D";
    //     TempRG23D: Record "RG 23 D" temporary;
    //     StructureDetails: Record "Structure Details";
    //     QuantityInCurrLine: Decimal;
    //     QtyInCurrLineAlreadyAdjusted: Decimal;
    //     RefQuantity: Decimal;
    //     AllQtyInCurrLineAdjusted: Boolean;
    //     RG23DEntryNo: Integer;
    //     CurrencyFactor: Decimal;
    // begin
    //     // VSTF208159.begin
    //     if SalesLineQty = 0 then
    //         exit;
    //     with SalesLine do begin
    //         GetSalesHeader;
    //         if (not SalesHeader.Trading) or (not (SalesHeader.Structure = '')) then
    //             exit;

    //         StructureDetails.Reset;
    //         StructureDetails.SetRange(Code, SalesHeader.Structure);
    //         StructureDetails.SetRange(Type, StructureDetails.Type::Excise);
    //         if StructureDetails.IsEmpty then
    //             exit;

    //         if (SalesHeader."Currency Code" <> '') and (SalesHeader."Currency Factor" <> 0) then
    //             CurrencyFactor := SalesHeader."Currency Factor"
    //         else
    //             CurrencyFactor := 1;
    //         TestField(Type, Type::Item);

    //         BEDAmt := 0;
    //         "AED(GSI)Amt" := 0;
    //         "AED(TTA)Amt" := 0;
    //         SEDAmt := 0;
    //         SAEDAmt := 0;
    //         CESSAmt := 0;
    //         NCCDAmt := 0;
    //         eCessAmt := 0;
    //         SHECessAmt := 0;
    //         ADETAmt := 0;
    //         ADEAmt := 0;
    //         ADCVATAmt := 0;

    //         QuantityInCurrLine := SalesLineQty;
    //         QtyInCurrLineAlreadyAdjusted := 0;
    //         RG23D.Reset;
    //         RG23D.SetCurrentKey("Item No.", "Posting Date", "Transaction Type", Type, "Location Code");
    //         RG23D.SetRange("Item No.", "No.");
    //         if SalesHeader."Document Type" in
    //            [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
    //         then
    //             RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Purchase)
    //         else begin
    //             RG23D.SetRange("Document No.", SalesHeader."Applies-to Doc. No.");
    //             RG23D.SetRange("Transaction Type", RG23D."Transaction Type"::Sale);
    //         end;
    //         RG23D.SetRange("Location Code", "Location Code");
    //         RG23D.SetRange(Closed, false);
    //         if RG23D.FindSet then
    //             repeat
    //                 RefQuantity := 0;
    //                 if SalesHeader."Document Type" in
    //                    [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
    //                 then
    //                     RG23DEntryNo := RG23D."Entry No."
    //                 else
    //                     RG23DEntryNo := RG23D."Ref. Entry No.";
    //                 if not TempRG23DConsumedInCurrDoc.Get(RG23DEntryNo) then begin
    //                     if TempRG23DRemainder.Get(RG23DEntryNo) then begin
    //                         RefQuantity := TempRG23DRemainder.Quantity;
    //                         TempRG23DRemainder.Quantity :=
    //                           TempRG23DRemainder.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                         if TempRG23DRemainder.Quantity <= 0 then begin
    //                             TempRG23DConsumedInCurrDoc.TransferFields(TempRG23DRemainder);
    //                             TempRG23DConsumedInCurrDoc.Insert;
    //                             TempRG23DRemainder.Delete;
    //                         end else begin
    //                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                             TempRG23DRemainder.Quantity := TempRG23DRemainder.Quantity - RefQuantity;
    //                             TempRG23DRemainder.Modify;
    //                             AllQtyInCurrLineAdjusted := true;
    //                         end;
    //                     end else begin
    //                         if SalesHeader."Document Type" in
    //                            [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]
    //                         then begin
    //                             RG23D.CalcFields("Remaining Quantity");
    //                             TempRG23D.TransferFields(RG23D);
    //                             TempRG23D.Quantity := RG23D."Remaining Quantity";
    //                         end else begin
    //                             TempRG23D.TransferFields(RG23D);
    //                             TempRG23D.Quantity := Abs(RG23D.Quantity);
    //                         end;
    //                         RefQuantity := TempRG23D.Quantity;
    //                         TempRG23D.Quantity :=
    //                           TempRG23D.Quantity - (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);

    //                         if TempRG23D.Quantity <= 0 then begin
    //                             TempRG23DConsumedInCurrDoc.TransferFields(RG23D);
    //                             TempRG23DConsumedInCurrDoc.Insert;
    //                         end else begin
    //                             AllQtyInCurrLineAdjusted := true;
    //                             RefQuantity := (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted);
    //                             TempRG23DRemainder.TransferFields(RG23D);
    //                             TempRG23DRemainder.Quantity := RG23D."Remaining Quantity" - RefQuantity;
    //                             TempRG23DRemainder.Insert;
    //                         end;
    //                     end;

    //                     QtyInCurrLineAlreadyAdjusted := QtyInCurrLineAlreadyAdjusted + RefQuantity;
    //                     BEDAmt += Abs(RG23D."BED Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     "AED(GSI)Amt" += Abs(RG23D."AED(GSI) Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     "AED(TTA)Amt" += Abs(RG23D."AED(TTA) Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     SEDAmt += Abs(RG23D."SED Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     SAEDAmt += Abs(RG23D."SAED Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     CESSAmt += Abs(RG23D."CESS Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     NCCDAmt += Abs(RG23D."NCCD Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     eCessAmt += Abs(RG23D."eCess Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     SHECessAmt += Abs(RG23D."SHE Cess Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     ADETAmt += Abs(RG23D."ADET Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     ADEAmt += Abs(RG23D."ADE Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                     ADCVATAmt += Abs(RG23D."ADC VAT Amount Per Unit") * RefQuantity * CurrencyFactor;
    //                 end;
    //             until (RG23D.Next = 0) or AllQtyInCurrLineAdjusted or (QuantityInCurrLine - QtyInCurrLineAlreadyAdjusted = 0);

    //         "BED Amount" := BEDAmt;
    //         "AED(GSI) Amount" := "AED(GSI)Amt";
    //         "AED(TTA) Amount" := "AED(TTA)Amt";
    //         "SED Amount" := SEDAmt;
    //         "SAED Amount" := SAEDAmt;
    //         "CESS Amount" := CESSAmt;
    //         "NCCD Amount" := NCCDAmt;
    //         "eCess Amount" := eCessAmt;
    //         "SHE Cess Amount" := SHECessAmt;
    //         "ADET Amount" := ADETAmt;
    //         "ADE Amount" := ADEAmt;
    //         "ADC VAT Amount" := ADCVATAmt;
    //     end;
    //     // VSTF208159.end
    // end;
    //LKS-Raj Commented (Table Missing)
    local procedure CheckWMS()
    var
        DialogText: Text;
    begin
        DialogText := Text035;
        if (CurrFieldNo <> 0) and (Type = Type::Item) then
            if "Quantity (Base)" <> 0 then
                case "Document Type" of
                    "Document Type"::Invoice:
                        if Location.Get("Location Code") and Location."Directed Put-away and Pick" then begin
                            DialogText += Location.GetRequirementText(Location.FieldNo("Require Shipment"));
                            Error(Text016, DialogText, FieldCaption("Line No."), "Line No.");
                        end;
                    "Document Type"::"Credit Memo":
                        if Location.Get("Location Code") and Location."Directed Put-away and Pick" then begin
                            DialogText += Location.GetRequirementText(Location.FieldNo("Require Receive"));
                            Error(Text016, DialogText, FieldCaption("Line No."), "Line No.");
                        end;
                end;
    end;
}

