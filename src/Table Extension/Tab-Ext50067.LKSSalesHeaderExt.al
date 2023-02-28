tableextension 50067 "LKSSalesHeaderExt" extends "Sales Header"
{
    // LCSM Integration -
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Bill-to Name"(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Name 2"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Address"(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Address 2"(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Name"(Field 13)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address"(Field 15)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address 2"(Field 16)".


        //Unsupported feature: Property Modification (Data type) on ""Posting Description"(Field 22)".


        //Unsupported feature: Property Insertion (Enabled) on ""Pmt. Discount Date"(Field 26)".


        //Unsupported feature: Property Insertion (Enabled) on ""Shipment Method Code"(Field 27)".


        //Unsupported feature: Property Insertion (Editable) on ""Shortcut Dimension 2 Code"(Field 30)".


        //Unsupported feature: Property Insertion (Enabled) on ""Prices Including VAT"(Field 35)".


        //Unsupported feature: Property Insertion (Enabled) on ""Invoice Disc. Code"(Field 37)".


        //Unsupported feature: Property Insertion (Enabled) on ""Customer Disc. Group"(Field 40)".


        //Unsupported feature: Property Insertion (Enabled) on ""Language Code"(Field 41)".


        //Unsupported feature: Property Insertion (Enabled) on ""Order Class"(Field 45)".


        //Unsupported feature: Property Insertion (Enabled) on ""On Hold"(Field 51)".


        //Unsupported feature: Property Insertion (Enabled) on ""Last Prepayment No."(Field 67)".


        //Unsupported feature: Property Insertion (Enabled) on ""Credit Card No."(Field 827)".


        //Unsupported feature: Property Insertion (Enabled) on ""Campaign No."(Field 5050)".


        //Unsupported feature: Property Insertion (Enabled) on ""Opportunity No."(Field 5055)".


        //Unsupported feature: Property Insertion (Enabled) on ""Responsibility Center"(Field 5700)".


        //Unsupported feature: Property Insertion (Enabled) on ""Transit Document"(Field 13751)".


        //Unsupported feature: Property Insertion (Enabled) on ""LC No."(Field 13753)".


        //Unsupported feature: Property Insertion (Enabled) on ""VAT Exempted"(Field 16412)".


        //Unsupported feature: Property Insertion (Enabled) on "Trading(Field 16501)".


        //Unsupported feature: Property Insertion (Enabled) on ""Transaction No. Serv. Tax"(Field 16502)".


        //Unsupported feature: Property Insertion (Enabled) on ""Re-Dispatch"(Field 16503)".


        //Unsupported feature: Property Insertion (Enabled) on ""Return Re-Dispatch Rcpt. No."(Field 16504)".


        //Unsupported feature: Property Insertion (Enabled) on ""TDS Certificate Receivable"(Field 16505)".


        //Unsupported feature: Property Insertion (Enabled) on ""Time of Removal"(Field 16510)".


        //Unsupported feature: Property Insertion (Enabled) on ""LR/RR No."(Field 16511)".


        //Unsupported feature: Property Insertion (Enabled) on ""LR/RR Date"(Field 16512)".


        //Unsupported feature: Property Insertion (Enabled) on ""Vehicle No."(Field 16513)".


        //Unsupported feature: Property Insertion (Enabled) on ""Mode of Transport"(Field 16514)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bill Of Export No."(Field 16606)".


        //Unsupported feature: Property Insertion (Enabled) on ""Bill Of Export Date"(Field 16607)".


        //Unsupported feature: Property Insertion (Enabled) on ""e-Commerce Customer"(Field 16608)".


        //Unsupported feature: Property Insertion (Enabled) on ""e-Commerce Merchant Id"(Field 16609)".



        //Unsupported feature: Code Modification on ""Sell-to Customer No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckCreditLimitIfLineNotInsertedYet;
        TestField(Status,Status::Open);
        if ("Sell-to Customer No." <> xRec."Sell-to Customer No.") and
        #4..24
              Init;
              SalesSetup.Get;
              "No. Series" := xRec."No. Series";

              InitRecord;
              GSTManagement.UpdateInvoiceType(Rec);
        #31..82
          SalesLine.Reset;
        end;
        GetCust("Sell-to Customer No.");
        InitSellToCustFromCustomer(Rec,Cust);
        "Responsibility Center" := UserSetupMgt.GetRespCenter(0,Cust."Responsibility Center");
        Validate("Location Code",UserSetupMgt.GetLocation(0,Cust."Location Code","Responsibility Center"));
        #89..122

        if( "GST Customer Type" <>  "GST Customer Type"::" ") and (xRec."Sell-to Customer No." <> "Sell-to Customer No.") then
          Validate("Invoice Type");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //8112
        //2021
        //Name := Cust.Name;
        //Name := Cust."Client Name";//TEAM::1426
        //2021
        //8112
        #1..27
              //8112
              InitRecord;
              if xRec."Shipping No." <> '' then begin
                "Shipping No. Series" := xRec."Shipping No. Series";
                "Shipping No." := xRec."Shipping No.";
              end;
              if xRec."Posting No." <> '' then begin
                "Posting No. Series" := xRec."Posting No. Series";
                "Posting No." := xRec."Posting No.";
              end;
              if xRec."Return Receipt No." <> '' then begin
                "Return Receipt No. Series" := xRec."Return Receipt No. Series";
                "Return Receipt No." := xRec."Return Receipt No.";
              end;
              if xRec."Prepayment No." <> '' then begin
                "Prepayment No. Series" := xRec."Prepayment No. Series";
                "Prepayment No." := xRec."Prepayment No.";
              end;
              if xRec."Prepmt. Cr. Memo No." <> '' then begin
                "Prepmt. Cr. Memo No. Series" := xRec."Prepmt. Cr. Memo No. Series";
                "Prepmt. Cr. Memo No." := xRec."Prepmt. Cr. Memo No.";
              end;
              //8112
              GSTManagement.UpdateInvoiceType(Rec);
        #28..85
        //8112
        Cust.CheckBlockedCustOnDocs(Cust,"Document Type",false,false);
        Cust.TestField("Gen. Bus. Posting Group");
        "Sell-to Customer Template Code" := '';
        "Sell-to Customer Name" := Cust.Name;
        //"Sell-to Customer Name" := Cust."Client Name";//TEAM::1426
        "Sell-to Customer Name 2" := Cust."Name 2";
        "Sell-to Address" := Cust.Address;
        "Sell-to Address 2" := Cust."Address 2";
        "Sell-to City" := Cust.City;
        "Sell-to Post Code" := Cust."Post Code";
        "Sell-to County" := Cust.County;
        "Sell-to Country/Region Code" := Cust."Country/Region Code";
        "Nature of Services" := Cust."Nature of Services";
        if not SkipSellToContact then
          "Sell-to Contact" := Cust.Contact;
        "Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        "VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
        // "Tax Area Code" := Cust."Tax Area Code";
        "Tax Liable" := Cust."Tax Liable";
        "VAT Registration No." := Cust."VAT Registration No.";
        "VAT Country/Region Code" := Cust."Country/Region Code";
        "Shipping Advice" := Cust."Shipping Advice";
        State := Cust."State Code";
        Structure := Cust.Structure;
        "Excise Bus. Posting Group" := Cust."Excise Bus. Posting Group";
        //8112
        #86..125
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Status,Status::Open);
        BilltoCustomerNoChanged := xRec."Bill-to Customer No." <> "Bill-to Customer No.";
        GetCust("Bill-to Customer No.");
        #4..71
        Cust.CheckBlockedCustOnDocs(Cust,"Document Type",false,false);
        Cust.TestField("Customer Posting Group");
        CheckCrLimit;
        InitBillToCustFromCustomer(Rec,Cust);

        if not BilltoCustomerNoChanged then begin
        #78..106

        "Bill-to IC Partner Code" := Cust."IC Partner Code";
        "Send IC Document" := ("Bill-to IC Partner Code" <> '') and ("IC Direction" = "IC Direction"::Outgoing);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..74
        //8112

        "Bill-to Customer Template Code" := '';
        "Bill-to Name" := Cust.Name;
        "Bill-to Name 2" := Cust."Name 2";
        "Bill-to Address" := Cust.Address;
        "Bill-to Address 2" := Cust."Address 2";
        "Bill-to City" := Cust.City;
        "Bill-to Post Code" := Cust."Post Code";
        "Bill-to County" := Cust.County;
        "Bill-to Country/Region Code" := Cust."Country/Region Code";
        if not SkipBillToContact then
          "Bill-to Contact" := Cust.Contact;
        "Payment Terms Code" := Cust."Payment Terms Code";
        "Prepmt. Payment Terms Code" := Cust."Payment Terms Code";

        if "Document Type" = "Document Type"::"Credit Memo" then begin
          "Payment Method Code" := '';
          if PaymentTerms.Get("Payment Terms Code") then
            if PaymentTerms."Calc. Pmt. Disc. on Cr. Memos" then
              "Payment Method Code" := Cust."Payment Method Code"
        end else
          "Payment Method Code" := Cust."Payment Method Code";

        "Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        GLSetup.Get;
        if GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No." then begin
          "VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
          "VAT Country/Region Code" := Cust."Country/Region Code";
          "VAT Registration No." := Cust."VAT Registration No.";
        end;
        "Customer Posting Group" := Cust."Customer Posting Group";
        "Currency Code" := Cust."Currency Code";
        "Customer Price Group" := Cust."Customer Price Group";
        "Prices Including VAT" := Cust."Prices Including VAT";
        "Allow Line Disc." := Cust."Allow Line Disc.";
        "Invoice Disc. Code" := Cust."Invoice Disc. Code";
        "Customer Disc. Group" := Cust."Customer Disc. Group";
        "Language Code" := Cust."Language Code";
        "Salesperson Code" := Cust."Salesperson Code";
        "Combine Shipments" := Cust."Combine Shipments";
        Reserve := Cust.Reserve;
        if "Document Type" = "Document Type"::Order then
          "Prepayment %" := Cust."Prepayment %";
        //8112
        #75..109
        */
        //end;


        //Unsupported feature: Code Modification on ""Ship-to Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Document Type" = "Document Type"::Order) and
           (xRec."Ship-to Code" <> "Ship-to Code")
        then begin
        #4..28
            ShipToAddr.Get("Sell-to Customer No.","Ship-to Code");
            "Ship-to Name" := ShipToAddr.Name;
            "Ship-to Name 2" := ShipToAddr."Name 2";
            "Ship-to Address" := ShipToAddr.Address;
            "Ship-to Address 2" := ShipToAddr."Address 2";
            "Ship-to City" := ShipToAddr.City;
            "Ship-to Post Code" := ShipToAddr."Post Code";
            "Ship-to County" := ShipToAddr.County;
            Validate("Ship-to Country/Region Code",ShipToAddr."Country/Region Code");
            "Ship-to Contact" := ShipToAddr.Contact;
            "Shipment Method Code" := ShipToAddr."Shipment Method Code";
            if ShipToAddr."Location Code" <> '' then
              Validate("Location Code",ShipToAddr."Location Code");
            "Shipping Agent Code" := ShipToAddr."Shipping Agent Code";
            "Shipping Agent Service Code" := ShipToAddr."Shipping Agent Service Code";
            if ShipToAddr."Tax Area Code" <> '' then
              "Tax Area Code" := ShipToAddr."Tax Area Code";
            "Tax Liable" := ShipToAddr."Tax Liable";
            if "GST Customer Type" <> "GST Customer Type"::" " then
              if "GST Customer Type" in ["GST Customer Type"::Exempted,"GST Customer Type"::"Deemed Export",
                                         "GST Customer Type"::"SEZ Development","GST Customer Type"::"SEZ Unit",
        #50..55
                "GST Ship-to State Code" := ShipToAddr.State;
                "Ship-to GST Reg. No." := ShipToAddr."GST Registration No.";
              end;
          end else
            if "Sell-to Customer No." <> '' then begin
              GetCust("Sell-to Customer No.");
              "Ship-to Name" := Cust.Name;
              "Ship-to Name 2" := Cust."Name 2";
              "Ship-to Address" := Cust.Address;
              "Ship-to Address 2" := Cust."Address 2";
              "Ship-to City" := Cust.City;
              "Ship-to Post Code" := Cust."Post Code";
              "Ship-to County" := Cust.County;
              Validate("Ship-to Country/Region Code",Cust."Country/Region Code");
              "Ship-to Contact" := Cust.Contact;
        #71..90
            end;
        end;

        GetShippingTime(FieldNo("Ship-to Code"));

        TaxAreaUpdate;
        #97..109
            if xRec."Tax Liable" <> "Tax Liable" then
              Validate("Tax Liable");
          end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //2021
        Cust.Get("Sell-to Customer No.");
        //2021

        #1..31
        //TCPL::6904 160817 START
            {
        #32..35
            }
            "Ship-to Address" := ShipToAddr."Client Address 1";
            "Ship-to Address 2" := ShipToAddr."Client Address 2";
            "Ship-to City" := ShipToAddr."City Town";
            "Ship-to Post Code" := ShipToAddr."Post Office";
            ShipToStateName := ShipToAddr."State Name";
        //TCPL::6904 160817 END
            Validate("Ship-to Country/Region Code",ShipToAddr."Country/Region Code");
            //"Ship-to Contact" := ShipToAddr.Contact; Blocked later as per requirement
        #39..46

        #47..58

        #59..63
              //TCPL::6904 160817 START
              {
        #64..67
              }
              "Ship-to Address" := ShipToAddr."Client Address 1";
              "Ship-to Address 2" := ShipToAddr."Client Address 2";
              "Ship-to City" := ShipToAddr."City Town";
              "Ship-to Post Code" := ShipToAddr."Post Office";
              ShipToStateName := ShipToAddr."State Name";
            //TCPL::6904 160817 END
        #68..93
        if "Document Type" = "Document Type"::"Credit Memo" then
          begin
            //TCPL::6904 160817 START
            {
            "Ship-to Address" := ShipToAddr.Address;
            "Ship-to Address 2" := ShipToAddr."Address 2";
            "Ship-to City" := ShipToAddr.City;
            "Ship-to Post Code" := ShipToAddr."Post Code";
            }
            if ShipToAddr.Get("Sell-to Customer No.","Ship-to Code") then;
           "Ship-to Name" := ShipToAddr.Name;
           "Ship-to Name 2" := ShipToAddr."Name 2";
           Rec."Ship-to Name" := ShipToAddr.Name;
            "Ship-to Address" := ShipToAddr."Client Address 1";
            "Ship-to Address 2" := ShipToAddr."Client Address 2";
            "Ship-to City" := ShipToAddr."City Town";
            "Ship-to Post Code" := ShipToAddr."Post Office";
            "GST Ship-to State Code":=ShipToAddr.State;     //Team::7814
            ShipToStateName := ShipToAddr."State Name";
            country := ShipToAddr.Country;
        //TCPL::6904 160817 END
            "Ship-to County" := ShipToAddr.County;
          end;
        #94..112
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Status,Status::Open);
        if ("Location Code" <> xRec."Location Code") and
           (xRec."Sell-to Customer No." = "Sell-to Customer No.")
        then
          MessageIfSalesLinesExist(FieldCaption("Location Code"));

        UpdateShipToAddress;
        UpdateOutboundWhseHandlingTime;
        CompanyInfo.Get;
        if "Location Code" <> '' then begin
        #11..23
          "Location GST Reg. No." := Location."GST Registration No.";
          "Location State Code" := Location."State Code";
        end;
        if "Location Code" <> '' then
          GetPostInvoiceNoSeries;

        ReferenceInvoiceNoValidation;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
        //8112
        if "Location Code" <> '' then begin
                                                                          if Location.Get("Location Code") then
                                                                            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                                                                        end else begin
                                                                          if InvtSetup.Get then
                                                                            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                                                                        end;
        //8112
        #8..26

        #27..30
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 30).OnValidate".

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
        //8112
        //TEAM::1426/01
            DimValue.Reset;
            DimValue.SetRange(DimValue."Dimension Code",'CASE');
            DimValue.SetRange(DimValue.Code,"Shortcut Dimension 2 Code");
            //MESSAGE(DimValue.Code);//TEAM::1426
            if DimValue.Find('-') then
            begin
            "Location Code":=DimValue."Case-Branch";
            //"Ship-to Code" := DimValue."Case-Office ID";
            //VALIDATE("Ship-to Code", DimValue."Case-Office ID");
            //"Bill-to Contact No.":=DimValue.Billing_Contact_ID;
            Validate("Bill-to Contact No.",DimValue.Billing_Contact_ID);
            Validate("Location Code",DimValue."Case-Branch");
            //MESSAGE("Bill-to Contact No.");//TEAM::1426
            end;
            //TEAM::1426/01

            //2021
            DimValue.Reset;
            DimValue.SetRange(DimValue."Dimension Code",'CASE');
            DimValue.SetRange(DimValue.Code,"Shortcut Dimension 2 Code");
            if DimValue.FindFirst then
             ForumDimVal.Reset;
             ForumDimVal.SetRange("Dimension Code",'FORUM');
             ForumDimVal.SetRange(Name,DimValue."Case-Forum");
             if ForumDimVal.FindFirst then
             Validate("Shortcut Dimension 9 Code",ForumDimVal.Code);

             ForumDimVal.Reset;
             ForumDimVal.SetRange("Dimension Code",'FORUMCITY');
            ForumDimVal.SetRange(Name,DimValue."Case-Forum City");
            if ForumDimVal.FindFirst then
            Validate("Shortcut Dimension 10 Code",ForumDimVal.Code);

            Employee.Reset;
            Employee.SetRange("No.",DimValue."Case-Owner2");
            Employee.SetFilter("Group ID",'<>%1','');
            if Employee.FindFirst then begin
            //MESSAGE('%1|%2',Employee."No.",Employee."Group ID");
            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code",'GROUPHEAD');
            ForumDimVal.SetRange(Code,Employee."Group ID");
            if ForumDimVal.FindFirst then
              Validate("Shortcut Dimension 11 Code",ForumDimVal.Code);
            end;

            {
            ForumDimVal.RESET;
            ForumDimVal.SETRANGE("Dimension Code",'OWNER1');
            ForumDimVal.SETRANGE(Name,DimValue."Case-Owner1");
            IF ForumDimVal.FINDFIRST THEN BEGIN
            VALIDATE("Shortcut Dimension 12 Code",ForumDimVal.Code);
            END;

            ForumDimVal.RESET;
            ForumDimVal.SETRANGE("Dimension Code",'OWNER2');
            ForumDimVal.SETRANGE(Name,DimValue."Case-Owner2");
            IF ForumDimVal.FINDFIRST THEN
            VALIDATE("Shortcut Dimension 13 Code",ForumDimVal.Code);
            }
            Validate("Shortcut Dimension 12 Code",DimValue."Case-Owner1");
            Validate("Shortcut Dimension 13 Code",DimValue."Case-Owner2");

            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code",'PROCESS');
            ForumDimVal.SetRange(Name,DimValue."Case-Process");
            if ForumDimVal.FindFirst then
            Validate("Shortcut Dimension 14 Code",ForumDimVal.Code);

            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code",'SOLUTION');
            ForumDimVal.SetRange(Name,DimValue."Case-Solution");
            if ForumDimVal.FindFirst then
            Validate("Shortcut Dimension 15 Code",ForumDimVal.Code);

            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code",'SUBFORUM');
            ForumDimVal.SetRange(Name,DimValue."Case-Sub Forum");
            if ForumDimVal.FindFirst then
            Validate("Shortcut Dimension 16 Code",ForumDimVal.Code);
            //2021
           // END;
        //8112

        //LCMS Integration-
        Clear(DimMgt);
        DimMgt.ValidateShortcutDimValuesAdd('ASSOCIATES',DimValue.Associate,"Dimension Set ID");
        */
        //end;


        //Unsupported feature: Code Insertion on ""Bill-to Country/Region Code"(Field 87)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        if ("Bill-to Country/Region Code" <> xRec."Bill-to Country/Region Code") and (xRec."Bill-to Country/Region Code" <> '') then
          PostCode.ClearFields("Bill-to City","Bill-to Post Code","Bill-to County");
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Sell-to Country/Region Code"(Field 90).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Validate("Ship-to Country/Region Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Validate("Ship-to Country/Region Code");
        //8112


        if ("Sell-to Country/Region Code" <> xRec."Sell-to Country/Region Code") and (xRec."Sell-to Country/Region Code" <> '') then
          PostCode.ClearFields("Sell-to City","Sell-to Post Code","Sell-to County");

        //8112
        */
        //end;


        //Unsupported feature: Code Insertion on ""Ship-to Country/Region Code"(Field 93)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        if ("Ship-to Country/Region Code" <> xRec."Ship-to Country/Region Code") and (xRec."Ship-to Country/Region Code" <> '') then
          PostCode.ClearFields("Ship-to City","Ship-to Post Code","Ship-to County");
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Sell-to Contact No."(Field 5052).OnLookup".

        //trigger "(Field 5052)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Sell-to Customer No." <> '' then
          if Cont.Get("Sell-to Contact No.") then
            Cont.SetRange("Company No.",Cont."Company No.")
          else begin
            ContBusinessRelation.Reset;
            ContBusinessRelation.SetCurrentKey("Link to Table","No.");
            ContBusinessRelation.SetRange("Link to Table",ContBusinessRelation."Link to Table"::Customer);
            ContBusinessRelation.SetRange("No.","Sell-to Customer No.");
            if ContBusinessRelation.FindFirst then
              Cont.SetRange("Company No.",ContBusinessRelation."Contact No.")
            else
              Cont.SetRange("No.",'');
          end;

        if "Sell-to Contact No." <> '' then
          if Cont.Get("Sell-to Contact No.") then ;
        if PAGE.RunModal(0,Cont) = ACTION::LookupOK then begin
          xRec := Rec;
          Validate("Sell-to Contact No.",Cont."No.");
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        IF "Sell-to Customer No." <> '' THEN
          IF Cont.GET("Sell-to Contact No.") THEN
            Cont.SETRANGE("Company No.",Cont."Company No.")
          ELSE BEGIN
            ContBusinessRelation.RESET;
            ContBusinessRelation.SETCURRENTKEY("Link to Table","No.");
            ContBusinessRelation.SETRANGE("Link to Table",ContBusinessRelation."Link to Table"::Customer);
            ContBusinessRelation.SETRANGE("No.","Sell-to Customer No.");
            IF ContBusinessRelation.FINDFIRST THEN
              Cont.SETRANGE("Company No.",ContBusinessRelation."Contact No.")
            ELSE
              Cont.SETRANGE("No.",'');
          END;
        }
        #15..20
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Contact No."(Field 5053).OnValidate".

        //trigger "(Field 5053)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Status,Status::Open);

        if "Bill-to Contact No." <> '' then
        #4..20
              Init;
              SalesSetup.Get;
              "No. Series" := xRec."No. Series";
              InitRecord;
              InitNoSeries;
              exit;
        #27..42
        end;

        UpdateBillToCust("Bill-to Contact No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //8112

        if Cont.Get("Bill-to Contact No.") then
               //TEAM::1426/02
                 "Ship-to Code"    :=Cont."Office ID";
                 Validate("Ship-to Code",Cont."Office ID");
                "Ship-to Contact" := Cont.Initials+' '+Cont."F Name"+' '+Cont."M Name"+' '+Cont."L Name";
               //TEAM::1426/02
        //8112
        #1..23
              //8112

              "No. Series" := xRec."No. Series";
              if xRec."Shipping No." <> '' then begin
                "Shipping No. Series" := xRec."Shipping No. Series";
                "Shipping No." := xRec."Shipping No.";
              end;
              if xRec."Posting No." <> '' then begin
                "Posting No. Series" := xRec."Posting No. Series";
                "Posting No." := xRec."Posting No.";
              end;
              if xRec."Return Receipt No." <> '' then begin
                "Return Receipt No. Series" := xRec."Return Receipt No. Series";
                "Return Receipt No." := xRec."Return Receipt No.";
              end;
              if xRec."Prepayment No." <> '' then begin
                "Prepayment No. Series" := xRec."Prepayment No. Series";
                "Prepayment No." := xRec."Prepayment No.";
              end;
              if xRec."Prepmt. Cr. Memo No." <> '' then begin
                "Prepmt. Cr. Memo No. Series" := xRec."Prepmt. Cr. Memo No. Series";
                "Prepmt. Cr. Memo No." := xRec."Prepmt. Cr. Memo No.";
              end;
              //8112
        #24..45
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer Template Code"(Field 5054).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Document Type","Document Type"::Quote);
        TestField(Status,Status::Open);

        #4..18
              Init;
              SalesSetup.Get;
              "No. Series" := xRec."No. Series";
              InitRecord;
              InitNoSeries;
              exit;
        #25..53
           (xRec."Bill-to Customer Template Code" <> "Bill-to Customer Template Code")
        then
          RecreateSalesLines(FieldCaption("Bill-to Customer Template Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..21
              //8112

              if xRec."Shipping No." <> '' then begin
                "Shipping No. Series" := xRec."Shipping No. Series";
                "Shipping No." := xRec."Shipping No.";
              end;
              if xRec."Posting No." <> '' then begin
                "Posting No. Series" := xRec."Posting No. Series";
                "Posting No." := xRec."Posting No.";
              end;
              if xRec."Return Receipt No." <> '' then begin
                "Return Receipt No. Series" := xRec."Return Receipt No. Series";
                "Return Receipt No." := xRec."Return Receipt No.";
              end;
              if xRec."Prepayment No." <> '' then begin
                "Prepayment No. Series" := xRec."Prepayment No. Series";
                "Prepayment No." := xRec."Prepayment No.";
              end;
              if xRec."Prepmt. Cr. Memo No." <> '' then begin
                "Prepmt. Cr. Memo No. Series" := xRec."Prepmt. Cr. Memo No. Series";
                "Prepmt. Cr. Memo No." := xRec."Prepmt. Cr. Memo No.";
              end;
              //8112
        #22..56
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Opportunity No."(Field 5055).OnValidate".

        //trigger (Variable: Opportunity)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Opportunity No."(Field 5055).OnValidate".

        //trigger "(Field 5055)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        LinkSalesDocWithOpportunity(xRec."Opportunity No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        LinkSalesDocWithOpportunity(xRec."Opportunity No.");
        //8112

        if xRec."Opportunity No." <> "Opportunity No." then begin
          if "Opportunity No." <> '' then
            if Opportunity.Get("Opportunity No.") then begin
              Opportunity.TestField(Status,Opportunity.Status::"In Progress");
              if Opportunity."Sales Document No." <> '' then begin
                if Confirm(Text048,false,Opportunity."Sales Document No.",Opportunity."No.") then begin
                  if SalesHeader.Get("Document Type"::Quote,Opportunity."Sales Document No.") then begin
                    SalesHeader."Opportunity No." := '';
                    SalesHeader.Modify;
                  end;
                  Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::Quote;
                  Opportunity."Sales Document No." := "No.";
                  Opportunity.Modify;
                end else
                  "Opportunity No." := xRec."Opportunity No.";
              end else begin
                Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::Quote;
                Opportunity."Sales Document No." := "No.";
                Opportunity.Modify;
              end
            end;
          if xRec."Opportunity No." <> '' then
            if Opportunity.Get(xRec."Opportunity No.") then begin
              Opportunity."Sales Document No." := '';
              Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::" ";
              Opportunity.Modify;
            end;
        end;
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""Responsibility Center"(Field 5700).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Status,Status::Open);
        if not UserSetupMgt.CheckRespCenter(0,"Responsibility Center") then
          Error(
            Text027,
            RespCenter.TableCaption,UserSetupMgt.GetSalesFilter);

        "Location Code" := UserSetupMgt.GetLocation(0,'',"Responsibility Center");
        UpdateOutboundWhseHandlingTime;
        UpdateShipToAddress;

        #11..18
          RecreateSalesLines(FieldCaption("Responsibility Center"));
          "Assigned User ID" := '';
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
        //8112
        if "Location Code" <> '' then begin
                                                                          if Location.Get("Location Code") then
                                                                            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                                                                        end else begin
                                                                          if InvtSetup.Get then
                                                                            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                                                                        end;
        //8112
        #8..21
        */
        //end;
        field(50000; "Bill Description"; Text[50])
        {

            trigger OnValidate()
            begin
                //Location.GET("Location Code");
            end;
        }
        field(50001; "Service Tax Applicable"; Boolean)
        {
        }
        field(50002; "Prof. Chrg. Amt."; Decimal)
        {
        }
        field(50003; "Reimbursable Exp. Amt."; Decimal)
        {
        }
        field(50004; "Adjust Against Adv."; Decimal)
        {
        }
        field(50005; "Confirmation Reference"; Text[50])
        {
        }
        field(50006; "RTB Type"; Text[30])
        {
        }
        field(50007; Cancelled; Boolean)
        {

            trigger OnValidate()
            var
                LineNo: Integer;
                LengthCove: Integer;
            begin
                //LCMS Integration

                if Cancelled then begin
                    //CancelComm:=Window.InputBox('Input Cancellation Remarks','Comment Box','',100,100);
                    NoofLines := StrLen(CancelComm) div 80;
                    if (StrLen(CancelComm) mod 80) <> 0 then
                        NoofLines += 1;

                    if CancelComm = '' then
                        exit;
                    I := NoofLines;
                    Clear(LengthCove);
                    while I > 0 do begin
                        TempStr += 1;
                        LineNo += 10000;

                        SCL.Init;
                        SCL."Document Type" := "Document Type";
                        if I = 1 then
                            SCL.Comment := CopyStr(CancelComm, TempStr, StrLen(CancelComm) - LengthCove)
                        else
                            SCL.Comment := CopyStr(CancelComm, TempStr, 80);
                        TempStr += 79;
                        LengthCove += 80;
                        SCL."No." := "No.";
                        SCL."Line No." := LineNo;
                        SCL.Date := Today;
                        SCL.Insert;
                        I -= 1;
                    end;

                    if "Document Type" in ["Document Type"::Invoice] then
                        RTBStatus;
                    if "Document Type" in ["Document Type"::"Credit Memo"] then
                        C_RTBStatus;
                end;
            end;
        }
        field(50008; InvoiceType; Option)
        {
            OptionCaption = ',TAXABLE,NON-TAXABLE,MIXED';
            OptionMembers = ,TAXABLE,"NON-TAXABLE",MIXED;
        }
        field(50009; "State Name"; Text[40])
        {
            Description = '30->40';
        }
        field(50010; "Post Office"; Text[60])
        {
        }
        field(50011; District; Text[60])
        {
        }
        field(50012; country; Text[30])
        {
        }
        field(50013; "Amount LCY"; Decimal)
        {
        }
        field(50014; "Shortcut Dimension 9 Code"; Code[20])
        {
            CaptionClass = '1,2,9';
            Caption = 'Shortcut Dimension 9 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(9));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(9, "Shortcut Dimension 9 Code");
            end;
        }
        field(50015; "Shortcut Dimension 10 Code"; Code[20])
        {
            CaptionClass = '1,2,10';
            Caption = 'Shortcut Dimension 10 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(10));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(10, "Shortcut Dimension 10 Code");
            end;
        }
        field(50016; "Shortcut Dimension 11 Code"; Code[20])
        {
            CaptionClass = '1,2,11';
            Caption = 'Shortcut Dimension 11 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(11));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(11, "Shortcut Dimension 11 Code");
            end;
        }
        field(50017; "Shortcut Dimension 12 Code"; Code[20])
        {
            CaptionClass = '1,2,12';
            Caption = 'Shortcut Dimension 12 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(12));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(12, "Shortcut Dimension 12 Code");
            end;
        }
        field(50018; "Shortcut Dimension 13 Code"; Code[20])
        {
            CaptionClass = '1,2,13';
            Caption = 'Shortcut Dimension 13 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(13));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(13, "Shortcut Dimension 13 Code");
            end;
        }
        field(50019; "Shortcut Dimension 14 Code"; Code[20])
        {
            CaptionClass = '1,2,14';
            Caption = 'Shortcut Dimension 14 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(14));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(14, "Shortcut Dimension 14 Code");
            end;
        }
        field(50020; "Shortcut Dimension 15 Code"; Code[20])
        {
            CaptionClass = '1,2,15';
            Caption = 'Shortcut Dimension 15 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(15));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(15, "Shortcut Dimension 15 Code");
            end;
        }
        field(50021; "Shortcut Dimension 16 Code"; Code[20])
        {
            CaptionClass = '1,2,16';
            Caption = 'Shortcut Dimension 16 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(16));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(16, "Shortcut Dimension 16 Code");
            end;
        }
        field(50022; ShipToStateName; Text[40])
        {
            Description = '30->40';
        }

        modify("Shortcut Dimension 2 Code")
        {
            //Editable = false;
            trigger OnAfterValidate()
            var
                myInt: Integer;
                DimMgt: Codeunit DimensionManagement;
            begin
                //8112
                //TEAM::1426/01
                DimValue.RESET;
                DimValue.SETRANGE(DimValue."Dimension Code", 'CASE');
                DimValue.SETRANGE(DimValue.Code, "Shortcut Dimension 2 Code");
                //MESSAGE(DimValue.Code);//TEAM::1426
                IF DimValue.FIND('-') THEN BEGIN
                    "Location Code" := DimValue."Case-Branch";
                    //"Ship-to Code" := DimValue."Case-Office ID";
                    //VALIDATE("Ship-to Code", DimValue."Case-Office ID");
                    //"Bill-to Contact No.":=DimValue.Billing_Contact_ID;
                    VALIDATE("Bill-to Contact No.", DimValue.Billing_Contact_ID);
                    VALIDATE("Location Code", DimValue."Case-Branch");
                    //MESSAGE("Bill-to Contact No.");//TEAM::1426
                END;
                //TEAM::1426/01

                //2021
                DimValue.RESET;
                DimValue.SETRANGE(DimValue."Dimension Code", 'CASE');
                DimValue.SETRANGE(DimValue.Code, "Shortcut Dimension 2 Code");
                IF DimValue.FINDFIRST THEN
                    ForumDimVal.RESET;
                ForumDimVal.SETRANGE("Dimension Code", 'FORUM');
                ForumDimVal.SETRANGE(Name, DimValue."Case-Forum");
                IF ForumDimVal.FINDFIRST THEN
                    VALIDATE("Shortcut Dimension 9 Code", ForumDimVal.Code);

                ForumDimVal.RESET;
                ForumDimVal.SETRANGE("Dimension Code", 'FORUMCITY');
                ForumDimVal.SETRANGE(Name, DimValue."Case-Forum City");
                IF ForumDimVal.FINDFIRST THEN
                    VALIDATE("Shortcut Dimension 10 Code", ForumDimVal.Code);

                Employee.RESET;
                Employee.SETRANGE("No.", DimValue."Case-Owner2");
                Employee.SETFILTER("Group ID", '<>%1', '');
                IF Employee.FINDFIRST THEN BEGIN
                    //MESSAGE('%1|%2',Employee."No.",Employee."Group ID");
                    ForumDimVal.RESET;
                    ForumDimVal.SETRANGE("Dimension Code", 'GROUPHEAD');
                    ForumDimVal.SETRANGE(Code, Employee."Group ID");
                    IF ForumDimVal.FINDFIRST THEN
                        VALIDATE("Shortcut Dimension 11 Code", ForumDimVal.Code);
                END;

                VALIDATE("Shortcut Dimension 12 Code", DimValue."Case-Owner1");
                VALIDATE("Shortcut Dimension 13 Code", DimValue."Case-Owner2");

                ForumDimVal.RESET;
                ForumDimVal.SETRANGE("Dimension Code", 'PROCESS');
                ForumDimVal.SETRANGE(Name, DimValue."Case-Process");
                IF ForumDimVal.FINDFIRST THEN
                    VALIDATE("Shortcut Dimension 14 Code", ForumDimVal.Code);

                ForumDimVal.RESET;
                ForumDimVal.SETRANGE("Dimension Code", 'SOLUTION');
                ForumDimVal.SETRANGE(Name, DimValue."Case-Solution");
                IF ForumDimVal.FINDFIRST THEN
                    VALIDATE("Shortcut Dimension 15 Code", ForumDimVal.Code);

                ForumDimVal.RESET;
                ForumDimVal.SETRANGE("Dimension Code", 'SUBFORUM');
                ForumDimVal.SETRANGE(Name, DimValue."Case-Sub Forum");
                IF ForumDimVal.FINDFIRST THEN
                    VALIDATE("Shortcut Dimension 16 Code", ForumDimVal.Code);
                //2021
                // END;
                //8112

                //LCMS Integration-
                CLEAR(DimMgt);
                //DimMgt.ValidateShortcutDimValuesAdd('ASSOCIATES', DimValue.Associate, "Dimension Set ID");
                ValidateShortcutDimValuesAdd('ASSOCIATES', DimValue.Associate, "Dimension Set ID"); // 3k
            end;
        }
        modify("Bill-to Country/Region Code")
        {
            trigger OnBeforeValidate()
            var
                PostCode: Record "Post Code";
            begin
                //8112
                IF ("Bill-to Country/Region Code" <> xRec."Bill-to Country/Region Code") AND (xRec."Bill-to Country/Region Code" <> '') THEN
                    PostCode.ClearFields("Bill-to City", "Bill-to Post Code", "Bill-to County");
                //8112
            END;
        }
        modify("Sell-to Country/Region Code")
        {
            trigger OnAfterValidate()
            var
                PostCode: Record "Post Code";
            begin
                //8112
                IF ("Sell-to Country/Region Code" <> xRec."Sell-to Country/Region Code") AND (xRec."Sell-to Country/Region Code" <> '') THEN
                    PostCode.ClearFields("Sell-to City", "Sell-to Post Code", "Sell-to County");
                //8112
            end;
        }
        modify("Bill-to Contact No.")
        {
            trigger OnBeforeValidate()
            var
                Cont: Record Contact;
            begin
                //8112
                IF Cont.GET("Bill-to Contact No.") THEN
                    //TEAM::1426/02
                    "Ship-to Code" := Cont."Office ID";
                VALIDATE("Ship-to Code", Cont."Office ID");
                "Ship-to Contact" := Cont.Initials + ' ' + Cont."F Name" + ' ' + Cont."M Name" + ' ' + Cont."L Name";
                //TEAM::1426/02
                //8112
            end;
        }
        modify("Opportunity No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                Text048: Label 'Sales quote %1 has already been assigned to opportunity %2. Would you like to reassign this quote?';
            begin
                //8112
                IF xRec."Opportunity No." <> "Opportunity No." THEN BEGIN
                    IF "Opportunity No." <> '' THEN
                        IF Opportunity.GET("Opportunity No.") THEN BEGIN
                            Opportunity.TESTFIELD(Status, Opportunity.Status::"In Progress");
                            IF Opportunity."Sales Document No." <> '' THEN BEGIN
                                IF CONFIRM(Text048, FALSE, Opportunity."Sales Document No.", Opportunity."No.") THEN BEGIN
                                    IF SalesHeader.GET("Document Type"::Quote, Opportunity."Sales Document No.") THEN BEGIN
                                        SalesHeader."Opportunity No." := '';
                                        SalesHeader.MODIFY;
                                    END;
                                    Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::Quote;
                                    Opportunity."Sales Document No." := "No.";
                                    Opportunity.MODIFY;
                                END ELSE
                                    "Opportunity No." := xRec."Opportunity No.";
                            END ELSE BEGIN
                                Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::Quote;
                                Opportunity."Sales Document No." := "No.";
                                Opportunity.MODIFY;
                            END
                        END;
                    IF xRec."Opportunity No." <> '' THEN
                        IF Opportunity.GET(xRec."Opportunity No.") THEN BEGIN
                            Opportunity."Sales Document No." := '';
                            Opportunity."Sales Document Type" := Opportunity."Sales Document Type"::" ";
                            Opportunity.MODIFY;
                        END;
                END;
                //8112
            end;
        }

    }

    LOCAL PROCEDURE ValidateShortcutDimValuesAdd(DimensionCode: Code[20]; VAR ShortcutDimCode: Code[20]; VAR DimSetID: Integer);
    VAR
        DimVal: Record "Dimension Value";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimMgt: Codeunit DimensionManagement;
    BEGIN
        DimVal."Dimension Code" := DimensionCode;
        IF ShortcutDimCode <> '' THEN BEGIN
            DimVal.GET(DimVal."Dimension Code", ShortcutDimCode);
            IF NOT DimMgt.CheckDim(DimVal."Dimension Code") THEN
                ERROR(DimMgt.GetDimErr);
            IF NOT DimMgt.CheckDimValue(DimVal."Dimension Code", ShortcutDimCode) THEN
                ERROR(DimMgt.GetDimErr);
        END;
        DimMgt.GetDimensionSet(TempDimSetEntry, DimSetID);
        IF TempDimSetEntry.GET(TempDimSetEntry."Dimension Set ID", DimVal."Dimension Code") THEN
            IF TempDimSetEntry."Dimension Value Code" <> ShortcutDimCode THEN
                TempDimSetEntry.DELETE;
        IF ShortcutDimCode <> '' THEN BEGIN
            TempDimSetEntry."Dimension Code" := DimVal."Dimension Code";
            TempDimSetEntry."Dimension Value Code" := DimVal.Code;
            TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
            IF TempDimSetEntry.INSERT THEN;
        END;
        DimSetID := DimMgt.GetDimensionSetID(TempDimSetEntry);
    END;

    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: Opp)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if DOPaymentTransLogEntry.FindFirst then
      DOPaymentTransLogMgt.ValidateCanDeleteDocument("Payment Method Code","Document Type",Format("Document Type"),"No.");

    if not UserSetupMgt.CheckRespCenter(0,"Responsibility Center") then
      Error(
        Text022,
        RespCenter.TableCaption,UserSetupMgt.GetSalesFilter);

    SalesPost.DeleteHeader(
      Rec,SalesShptHeader,SalesInvHeader,SalesCrMemoHeader,ReturnRcptHeader,SalesInvHeaderPrepmt,SalesCrMemoHeaderPrepmt);

    ArchiveManagement.AutoArchiveSalesDocument(Rec);

    UpdateOpportunity;

    Validate("Applies-to ID",'');
    Validate("Incoming Document Entry No.",0);

    ApprovalsMgmt.DeleteApprovalEntries(RecordId);
    SalesLine.Reset;
    SalesLine.LockTable;

    WhseRequest.SetRange("Source Type",DATABASE::"Sales Line");
    WhseRequest.SetRange("Source Subtype","Document Type");
    WhseRequest.SetRange("Source No.","No.");
    WhseRequest.DeleteAll(true);

    SalesLine.SetRange("Document Type","Document Type");
    SalesLine.SetRange("Document No.","No.");
    SalesLine.SetRange(Type,SalesLine.Type::"Charge (Item)");

    DeleteSalesLines;
    SalesLine.SetRange(Type);
    DeleteSalesLines;

    SalesCommentLine.SetRange("Document Type","Document Type");
    SalesCommentLine.SetRange("No.","No.");
    SalesCommentLine.DeleteAll;

    GateEntryAttachment2.Reset;
    GateEntryAttachment2.SetRange("Source Type",GateEntryAttachment2."Source Type"::"Sales Return Order");
    GateEntryAttachment2.SetRange("Entry Type",GateEntryAttachment2."Entry Type"::Inward);
    GateEntryAttachment2.SetRange("Source No.","No.");
    if GateEntryAttachment2.FindFirst then
      GateEntryAttachment2.DeleteAll;

    StrOrder.SetCurrentKey("Document Type","Document No.",Type);
    StrOrder.SetRange("Document Type","Document Type");
    StrOrder.SetRange("Document No.","No.");
    StrOrder.SetRange(Type,StrOrder.Type::Sale);
    if StrOrder.FindFirst then
      StrOrder.DeleteAll;

    StrOrderLine.SetCurrentKey("Document Type","Document No.",Type);
    StrOrderLine.SetRange("Document Type","Document Type");
    StrOrderLine.SetRange("Document No.","No.");
    StrOrderLine.SetRange(Type,StrOrder.Type::Sale);
    if StrOrderLine.FindFirst then
      StrOrderLine.DeleteAll;

    if (SalesShptHeader."No." <> '') or
       (SalesInvHeader."No." <> '') or
       (SalesCrMemoHeader."No." <> '') or
       (ReturnRcptHeader."No." <> '') or
       (SalesInvHeaderPrepmt."No." <> '') or
       (SalesCrMemoHeaderPrepmt."No." <> '')
    then
      Message(PostedDocsToPrintCreatedMsg);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     if DOPaymentTransLogEntry.FindFirst then
      DOPaymentTransLogMgt.ValidateCanDeleteDocument("Payment Method Code","Document Type",Format("Document Type"),"No.");

     if not UserSetupMgt.CheckRespCenter(0,"Responsibility Center") then
    #5..7
     //8112
     if ("Opportunity No." <> '') and
       ("Document Type" in ["Document Type"::Quote,"Document Type"::Order])
     then begin
      if Opp.Get("Opportunity No.") then begin
        if "Document Type" = "Document Type"::Order then begin
          if not Confirm(Text040,true) then
            Error(Text044);
          TempOpportunityEntry.Init;
          TempOpportunityEntry.Validate("Opportunity No.",Opp."No.");
          TempOpportunityEntry."Sales Cycle Code" := Opp."Sales Cycle Code";
          TempOpportunityEntry."Contact No." := Opp."Contact No.";
          TempOpportunityEntry."Contact Company No." := Opp."Contact Company No.";
          TempOpportunityEntry."Salesperson Code" := Opp."Salesperson Code";
          TempOpportunityEntry."Campaign No." := Opp."Campaign No.";
          TempOpportunityEntry."Action Taken" := TempOpportunityEntry."Action Taken"::Lost;
          TempOpportunityEntry.Insert;
          TempOpportunityEntry.SetRange("Action Taken",TempOpportunityEntry."Action Taken"::Lost);
          PAGE.RunModal(PAGE::"Close Opportunity",TempOpportunityEntry);
          if Opp.Get("Opportunity No.") then
            if Opp.Status <> Opp.Status::Lost then
              Error(Text043);
        end;
        Opp."Sales Document Type" := Opp."Sales Document Type"::" ";
        Opp."Sales Document No." := '';
        Opp.Modify;
        "Opportunity No." := '';
      end;
     end;
     //8112
     SalesPost.DeleteHeader(
      Rec,SalesShptHeader,SalesInvHeader,SalesCrMemoHeader,ReturnRcptHeader,SalesInvHeaderPrepmt,SalesCrMemoHeaderPrepmt);

     ArchiveManagement.AutoArchiveSalesDocument(Rec);

     UpdateOpportunity;

     Validate("Applies-to ID",'');
     Validate("Incoming Document Entry No.",0);

     ApprovalsMgmt.DeleteApprovalEntries(RecordId);
     SalesLine.Reset;
     SalesLine.LockTable;

     WhseRequest.SetRange("Source Type",DATABASE::"Sales Line");
     WhseRequest.SetRange("Source Subtype","Document Type");
     WhseRequest.SetRange("Source No.","No.");
     WhseRequest.DeleteAll(true);

     SalesLine.SetRange("Document Type","Document Type");
     SalesLine.SetRange("Document No.","No.");
     SalesLine.SetRange(Type,SalesLine.Type::"Charge (Item)");

     DeleteSalesLines;
     SalesLine.SetRange(Type);
     DeleteSalesLines;

     SalesCommentLine.SetRange("Document Type","Document Type");
     SalesCommentLine.SetRange("No.","No.");
     SalesCommentLine.DeleteAll;

     GateEntryAttachment2.Reset;
     GateEntryAttachment2.SetRange("Source Type",GateEntryAttachment2."Source Type"::"Sales Return Order");
     GateEntryAttachment2.SetRange("Entry Type",GateEntryAttachment2."Entry Type"::Inward);
     GateEntryAttachment2.SetRange("Source No.","No.");
     if GateEntryAttachment2.FindFirst then
      GateEntryAttachment2.DeleteAll;

     StrOrder.SetCurrentKey("Document Type","Document No.",Type);
     StrOrder.SetRange("Document Type","Document Type");
     StrOrder.SetRange("Document No.","No.");
     StrOrder.SetRange(Type,StrOrder.Type::Sale);
     if StrOrder.FindFirst then
      StrOrder.DeleteAll;

     StrOrderLine.SetCurrentKey("Document Type","Document No.",Type);
     StrOrderLine.SetRange("Document Type","Document Type");
     StrOrderLine.SetRange("Document No.","No.");
     StrOrderLine.SetRange(Type,StrOrder.Type::Sale);
     if StrOrderLine.FindFirst then
      StrOrderLine.DeleteAll;

     if (SalesShptHeader."No." <> '') or
    #62..66
       //8112
     then
     begin

      Commit;

      if SalesShptHeader."No." <> '' then
        if Confirm(
             Text000,true,
             SalesShptHeader."No.")
        then begin
          SalesShptHeader.SetRecFilter;
          SalesShptHeader.PrintRecords(true);
        end;

      if SalesInvHeader."No." <> '' then
        if Confirm(
             Text001,true,
             SalesInvHeader."No.")
        then begin
          SalesInvHeader.SetRecFilter;
          SalesInvHeader.PrintRecords(true);
        end;

      if SalesCrMemoHeader."No." <> '' then
        if Confirm(
             Text002,true,
             SalesCrMemoHeader."No.")
        then begin
          SalesCrMemoHeader.SetRecFilter;
          SalesCrMemoHeader.PrintRecords(true);
        end;

      if ReturnRcptHeader."No." <> '' then
        if Confirm(
             Text023,true,
             ReturnRcptHeader."No.")
        then begin
          ReturnRcptHeader.SetRecFilter;
          ReturnRcptHeader.PrintRecords(true);
        end;

      if SalesInvHeaderPrepmt."No." <> '' then
        if Confirm(
             Text055,true,
             SalesInvHeader."No.")
        then begin
          SalesInvHeaderPrepmt.SetRecFilter;
          SalesInvHeaderPrepmt.PrintRecords(true);
        end;

      if SalesCrMemoHeaderPrepmt."No." <> '' then
        if Confirm(
             Text054,true,
             SalesCrMemoHeaderPrepmt."No.")
        then begin
          SalesCrMemoHeaderPrepmt.SetRecFilter;
          SalesCrMemoHeaderPrepmt.PrintRecords(true);
        end;
     end;
    // // VSTF208159.begin
    // // DetailRG23D.RESET;
    // // DetailRG23D.SETRANGE("Document Type","Document Type");
    // // DetailRG23D.SETRANGE("Order No.","No.");
    // // DetailRG23D.SETRANGE("Document No.",'');
    // // DetailRG23D.DELETEALL;
    // // VSTF208159.end
    // //8112
    //  MESSAGE(PostedDocsToPrintCreatedMsg);
    //
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;
    InsertMode := true;

    if GetFilterCustNo <> '' then
      Validate("Sell-to Customer No.",GetFilterCustNo);

    if GetFilterContNo <> '' then
      Validate("Sell-to Contact No.",GetFilterContNo);

    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document Type","No.");

    if "Salesperson Code" = '' then
      SetDefaultSalesperson;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    InitInsert;
    InsertMode := true;
    {
    IF GetFilterCustNo <> '' THEN
      VALIDATE("Sell-to Customer No.",GetFilterCustNo);

    IF GetFilterContNo <> '' THEN
      VALIDATE("Sell-to Contact No.",GetFilterContNo);
      }
            "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document Type","No.");
    //8112
    if "No." = '' then begin
      TestNoSeries;
      NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Posting Date","No.","No. Series");
    end;

    CompanyInfo.Get;
    Trading := CompanyInfo."Trading Co.";

    InitRecord;
    InsertMode := true;

    if GetFilter("Sell-to Customer No.") <> '' then
      if GetRangeMin("Sell-to Customer No.") = GetRangeMax("Sell-to Customer No.") then
        Validate("Sell-to Customer No.",GetRangeMin("Sell-to Customer No."));

    if GetFilter("Sell-to Contact No.") <> '' then
      if GetRangeMin("Sell-to Contact No.") = GetRangeMax("Sell-to Contact No.") then
        Validate("Sell-to Contact No.",GetRangeMin("Sell-to Contact No."));

    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document Type","No.");
    //8112
    if "Salesperson Code" = '' then
      SetDefaultSalesperson;
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Error(Text003,TableCaption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //ERROR(Text003,TABLECAPTION);
    */
    //end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 10)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesSetup.Get;
    case "Document Type" of
      "Document Type"::Quote,"Document Type"::Order,"Document Type"::"Blanket Order":
    #4..17
          if "Location Code" <> '' then begin
            Location.Get("Location Code");
            if not Trading then begin
              if Location."Sales Shipment Nos." <> '' then
                NoSeriesMgt.SetDefaultSeries("Shipping No. Series",Location."Sales Shipment Nos.");
            end else begin
    #24..140

    "Responsibility Center" := UserSetupMgt.GetRespCenter(0,"Responsibility Center");
    "Time of Removal" := Time;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20
              //8112
              if Location."Sales Invoice Nos." <> '' then
                      NoSeriesMgt.SetDefaultSeries("Posting No. Series",Location."Sales Invoice Nos.");
              //8112
              GetPostInvoiceNoSeries;

    #21..143
    */
    //end;


    //Unsupported feature: Code Modification on "RecreateSalesLines(PROCEDURE 4)".

    //procedure RecreateSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SalesLinesExist then begin
      if HideValidationDialog or not GuiAllowed then
        Confirmed := true
    #4..14
        SalesLine.SetRange("Document No.","No.");
        if SalesLine.FindSet then begin
          TempReservEntry.DeleteAll;
          RecreateReservEntryReqLine(SalesLineTmp,TempATOLink,ATOLink);
          ItemChargeAssgntSales.SetRange("Document Type","Document Type");
          ItemChargeAssgntSales.SetRange("Document No.","No.");
          TransferItemChargeAssgntSalesToTemp(ItemChargeAssgntSales,TempItemChargeAssgntSales);
          SalesLine.DeleteAll(true);
          SalesLine.Init;
    #24..27
          repeat
            if SalesLineTmp."Attached to Line No." = 0 then begin
              CreateSalesLine(SalesLineTmp);
              ExtendedTextAdded := false;

              if SalesLine.Type = SalesLine.Type::Item then begin
    #34..72
          ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
          SalesLineTmp.SetRange(Type,SalesLine.Type::"Charge (Item)");
          CreateItemChargeAssgntSales(ItemChargeAssgntSales,TempItemChargeAssgntSales,SalesLineTmp,TempInteger);
          SalesLineTmp.SetRange(Type);
          SalesLineTmp.DeleteAll;
          ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
    #79..82
          Text017,ChangedFieldName);
    end;
    SalesLine.BlockDynamicTracking(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
          //8112
          repeat
           SalesLine.TestField("Job No.",'');
                  SalesLine.TestField("Job Contract Entry No.",0);
                  SalesLine.TestField("Quantity Shipped",0);
                  SalesLine.TestField("Quantity Invoiced",0);
                  SalesLine.TestField("Return Qty. Received",0);
                  SalesLine.TestField("Shipment No.",'');
                  SalesLine.TestField("Return Receipt No.",'');
                  SalesLine.TestField("Blanket Order No.",'');
                  SalesLine.TestField("Prepmt. Amt. Inv.",0);
                  if SalesLine."Location Code" <> "Location Code" then
                    SalesLine.Validate("Location Code","Location Code");
                  SalesLineTmp := SalesLine;
                  if SalesLine.Nonstock then begin
                    SalesLine.Nonstock := false;
                    SalesLine.Modify;
                  end;

                  if ATOLink.AsmExistsForSalesLine(SalesLineTmp) then begin
                    TempATOLink := ATOLink;
                    TempATOLink.Insert;
                    ATOLink.Delete;
                  end;

                  SalesLineTmp.Insert;
                  RecreateReservEntry(SalesLine,0,true);
                  RecreateReqLine(SalesLine,0,true);
                until SalesLine.Next = 0;
          //8112
    #18..20
          //8112
          if ItemChargeAssgntSales.FindSet then begin
                  repeat
                    TempItemChargeAssgntSales.Init;
                    TempItemChargeAssgntSales := ItemChargeAssgntSales;
                    TempItemChargeAssgntSales.Insert;
                  until ItemChargeAssgntSales.Next = 0;
                  ItemChargeAssgntSales.DeleteAll;
                end;
          //8112
    #21..30
              //8112
              SalesLine.Init;
                    SalesLine."Line No." := SalesLine."Line No." + 10000;
                    SalesLine.Validate(Type,SalesLineTmp.Type);
                    if SalesLineTmp."No." = '' then begin
                      SalesLine.Validate(Description,SalesLineTmp.Description);
                      SalesLine.Validate("Description 2",SalesLineTmp."Description 2");
                    end else begin
                      SalesLine.Validate("No.",SalesLineTmp."No.");
                      if SalesLine.Type <> SalesLine.Type::" " then begin
                        SalesLine.Validate("Unit of Measure Code",SalesLineTmp."Unit of Measure Code");
                        SalesLine.Validate("Variant Code",SalesLineTmp."Variant Code");
                        if SalesLineTmp.Quantity <> 0 then begin
                          SalesLine.Validate(Quantity,SalesLineTmp.Quantity);
                          SalesLine.Validate("Qty. to Assemble to Order",SalesLineTmp."Qty. to Assemble to Order");
                        end;
                        SalesLine."Purchase Order No." := SalesLineTmp."Purchase Order No.";
                        SalesLine."Purch. Order Line No." := SalesLineTmp."Purch. Order Line No.";
                        SalesLine."Drop Shipment" := SalesLine."Purch. Order Line No." <> 0;
                      end;
                    end;
                    SalesLine."Direct Debit To PLA / RG" := SalesLineTmp."Direct Debit To PLA / RG";

                    SalesLine.Insert;
              //8112
    #31..75
          //8112
          if SalesLineTmp.FindSet then
                  repeat
                    TempItemChargeAssgntSales.SetRange("Document Line No.",SalesLineTmp."Line No.");
                    if TempItemChargeAssgntSales.FindSet then begin
                      repeat
                        TempInteger.FindFirst;
                        ItemChargeAssgntSales.Init;
                        ItemChargeAssgntSales := TempItemChargeAssgntSales;
                        ItemChargeAssgntSales."Document Line No." := TempInteger.Number;
                        ItemChargeAssgntSales.Validate("Unit Cost",0);
                        ItemChargeAssgntSales.Insert;
                      until TempItemChargeAssgntSales.Next = 0;
                      TempInteger.Delete;
                    end;
                  until SalesLineTmp.Next = 0;
          //8112
    #76..85
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateSalesLines(PROCEDURE 15)".

    //procedure UpdateSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not SalesLinesExist then
      exit;

    #4..76
            if SalesLine.Type <> SalesLine.Type::" " then begin
              SalesLine.Validate("Form Code","Form Code");
              SalesLine.Validate("Form No.","Form No.");
            end;
        end;
        SalesLineReserve.AssignForPlanning(SalesLine);
        SalesLine.Modify(true);
      until SalesLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..79
              //8112
              SalesLine.Validate("Unit Price");
                    SalesLine.Validate("Unit Cost (LCY)");

              //8112
    #80..84
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateSellToCust(PROCEDURE 25)".

    //procedure UpdateSellToCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Cont.Get(ContactNo) then
      "Sell-to Contact No." := Cont."No."
    else begin
      "Sell-to Contact" := '';
      exit;
    end;

    ContBusinessRelation.Reset;
    ContBusinessRelation.SetCurrentKey("Link to Table","Contact No.");
    ContBusinessRelation.SetRange("Link to Table",ContBusinessRelation."Link to Table"::Customer);
    ContBusinessRelation.SetRange("Contact No.",Cont."Company No.");
    if ContBusinessRelation.FindFirst then begin
      if ("Sell-to Customer No." <> '') and
         ("Sell-to Customer No." <> ContBusinessRelation."No.")
      then
        Error(Text037,Cont."No.",Cont.Name,"Sell-to Customer No.");
      if "Sell-to Customer No." = '' then begin
        SkipSellToContact := true;
        Validate("Sell-to Customer No.",ContBusinessRelation."No.");
        SkipSellToContact := false;
      end;
    end else begin
      if "Document Type" = "Document Type"::Quote then begin
        Cont.TestField("Company No.");
        ContComp.Get(Cont."Company No.");
        "Sell-to Customer Name" := ContComp."Company Name";
        "Sell-to Customer Name 2" := ContComp."Name 2";
        "Ship-to Name" := ContComp."Company Name";
        "Ship-to Name 2" := ContComp."Name 2";
        "Ship-to Address" := ContComp.Address;
        "Ship-to Address 2" := ContComp."Address 2";
        "Ship-to City" := ContComp.City;
        "Ship-to Post Code" := ContComp."Post Code";
        "Ship-to County" := ContComp.County;
        Validate("Ship-to Country/Region Code",ContComp."Country/Region Code");
        if ("Sell-to Customer Template Code" = '') and (not CustTemplate.IsEmpty) then
          Validate("Sell-to Customer Template Code",Cont.FindCustomerTemplate);
      end else
        Error(Text039,Cont."No.",Cont.Name);
    end;

    if Cont.Type = Cont.Type::Person then
      "Sell-to Contact" := Cont.Name
    else
      if Customer.Get("Sell-to Customer No.") then
        "Sell-to Contact" := Customer.Contact
      else
        "Sell-to Contact" := '';

    if "Document Type" = "Document Type"::Quote then begin
      if Customer.Get("Sell-to Customer No.") or Customer.Get(ContBusinessRelation."No.") then begin
        if Customer."Copy Sell-to Addr. to Qte From" = Customer."Copy Sell-to Addr. to Qte From"::Company then begin
          Cont.TestField("Company No.");
          Cont.Get(Cont."Company No.");
        end;
      end else begin
        Cont.TestField("Company No.");
        Cont.Get(Cont."Company No.");
      end;
      "Sell-to Address" := Cont.Address;
      "Sell-to Address 2" := Cont."Address 2";
      "Sell-to City" := Cont.City;
      "Sell-to Post Code" := Cont."Post Code";
      "Sell-to County" := Cont.County;
      "Sell-to Country/Region Code" := Cont."Country/Region Code";
      "Nature of Services" := Cust."Nature of Services";
    end;
    if ("Sell-to Customer No." = "Bill-to Customer No.") or
       ("Bill-to Customer No." = '')
    then
      Validate("Bill-to Contact No.","Sell-to Contact No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    #1..21
    end else
      begin
        if "Document Type" = "Document Type"::Quote then begin
          Cont.TestField("Company No.");
          ContComp.Get(Cont."Company No.");
          "Sell-to Customer Name" := ContComp."Company Name";
          "Sell-to Customer Name 2" := ContComp."Name 2";
          "Ship-to Name" := ContComp."Company Name";
          "Ship-to Name 2" := ContComp."Name 2";
          "Ship-to Address" := ContComp.Address;
          "Ship-to Address 2" := ContComp."Address 2";
          "Ship-to City" := ContComp.City;
          "Ship-to Post Code" := ContComp."Post Code";
          "Ship-to County" := ContComp.County;
          Validate("Ship-to Country/Region Code",ContComp."Country/Region Code");
          if ("Sell-to Customer Template Code" = '') and (not CustTemplate.IsEmpty) then
            Validate("Sell-to Customer Template Code",Cont.FindCustomerTemplate);
      end
      // ELSE
        //ERROR(Text039,Cont."No.",Cont.Name);
    #40..71
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateBillToCust(PROCEDURE 26)".

    //procedure UpdateBillToCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Cont.Get(ContactNo) then begin
      "Bill-to Contact No." := Cont."No.";
      if Cont.Type = Cont.Type::Person then
    #4..41
        "Language Code" := ContComp."Language Code";
        if ("Bill-to Customer Template Code" = '') and (not CustTemplate.IsEmpty) then
          Validate("Bill-to Customer Template Code",Cont.FindCustomerTemplate);
      end else
        Error(Text039,Cont."No.",Cont.Name);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..44
      end
      //ELSE
        //ERROR(Text039,Cont."No.",Cont.Name);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "CheckCreditMaxBeforeInsert(PROCEDURE 28)".

    //procedure CheckCreditMaxBeforeInsert();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if HideCreditCheckDialogue then
      exit;
    if (GetFilterCustNo <> '') or ("Sell-to Customer No." <> '') then begin
    #4..12
    end else
      if GetFilterContNo <> '' then begin
        Cont.Get(GetFilterContNo);
        ContBusinessRelation.Reset;
        ContBusinessRelation.SetCurrentKey("Link to Table","No.");
        ContBusinessRelation.SetRange("Link to Table",ContBusinessRelation."Link to Table"::Customer);
    #19..25
          CustCheckCreditLimit.SalesHeaderCheck(SalesHeader);
        end;
      end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
        //8112
        Cont.Get(GetRangeMin("Sell-to Contact No."));
        //8112
    #16..28
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 32)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',"Document Type","No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      if SalesLinesExist then
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
       Modify;
    #8..10
    */
    //end;


    //Unsupported feature: Code Modification on "RecreateReservEntryReqLine(PROCEDURE 75)".

    //procedure RecreateReservEntryReqLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    repeat
      TestSalesLineFieldsBeforeRecreate;
      if (SalesLine."Location Code" <> "Location Code") and not SalesLine.IsServiceItem then
    #4..13
        ATOLink.Delete;
      end;

      TempSalesLine.Insert;
      RecreateReservEntry(SalesLine,0,true);
      RecreateReqLine(SalesLine,0,true);
    until SalesLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
     if not TempSalesLine.Insert then //TCPL::6904 110817
     TempSalesLine.Modify; //TCPL::6904 110817
    #18..20
    */
    //end;

    procedure RTBStatus()
    var
        ExchRate: Decimal;
    begin
        RTBNo := "No.";
        RTBState := 'RA';
        if "Currency Factor" <> 0 then
            ExchRate := 1 / "Currency Factor"
        else
            ExchRate := 1;

        /*
        LKS := LKS.LKSFunctions();
        MESSAGE(FORMAT(LKS.RTBUpdate(RTBNo,RTBState,InvoiceNo,FORMAT(CURRENTDATETIME,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'),FORMAT(ExchRate)
        ,'',CancelComm)));
        */

    end;

    procedure C_RTBStatus()
    begin
        Crtb_No := "No.";
        CrtbStatus := 'RA';
        RejreasonCrtb := CancelComm;
        /*
        LKS := LKS.LKSFunctions();
        MESSAGE(FORMAT(LKS.CRTBUpdate(Crtb_No,CrtbStatus,'',FORMAT(CURRENTDATETIME,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'),'',CancelComm)));
        */

    end;

    var
        Opportunity: Record Opportunity;
        SalesHeader: Record "Sales Header";

    var
        Opp: Record Opportunity;
        TempOpportunityEntry: Record "Opportunity Entry" temporary;


    //Unsupported feature: Property Modification (Id) on "PITCalcInvDiscErr(Variable 1000000000)".

    //var
    //>>>> ORIGINAL VALUE:
    //PITCalcInvDiscErr : 1000000000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PITCalcInvDiscErr : 1000000031;
    //Variable type has not been exported.

    var
        Text000: Label 'Do you want to print shipment %1?';
        Text001: Label 'Do you want to print invoice %1?';
        Text002: Label 'Do you want to print credit memo %1?';

    var
        Text023: Label 'Do you want to print return receipt %1?';

    var
        Text043: Label 'Wizard Aborted';

    var
        Text055: Label 'Do you want to print prepayment invoice %1?';
        Text054: Label 'Do you want to print prepayment credit memo %1?';

    var
        ArchiveManagement: Codeunit ArchiveManagement;
        DimValue: Record "Dimension Value";
        Employee: Record Employee;
        ForumDimVal: Record "Dimension Value";
        SalesHdrR: Record "Sales Header";
        CancelComm: Text[250];
        SCL: Record "Sales Comment Line";
        NoofLines: Integer;
        I: Integer;
        TempStr: Integer;
        RTBNo: Code[20];
        RTBState: Text[20];
        InvoiceNo: Text[20];
        InvGenDate: DateTime;
        InvDoc: Code[20];
        Rejreason: Text[250];
        InvConvRate: Text[20];
        CrtbStatus: Text[20];
        CreditNoteDoc: Code[20];
        CreditNoteDate: DateTime;
        RejreasonCrtb: Text[250];
        Crtb_No: Code[20];
}

