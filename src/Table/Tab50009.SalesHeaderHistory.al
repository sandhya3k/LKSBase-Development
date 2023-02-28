table 50009 "Sales Header History"
{
    // <changelog>
    //     <change releaseversion="IN6.00"/>
    //   <add id="IN0062" dev="Ravinder" date="2007-11-29" area="STRND" releaseversion="IN5.00.01" feature="25225"
    //   >The Fields Service Tax Rounding Type and Service Tax Rounding Precision Added.</add>
    //   <add id="IN0063" dev="Ravinder" date="2007-12-07" area="EXCREFUND" releaseversion="IN5.00.01" feature="25199"
    //   >Check for Status applied</add>
    //   <add id="PS39773" dev="Anup" date="2008-11-15" area="STAPPL" releaseversion="IN6.00.01" feature="39773"
    //   >The onvalidate trigger of the fields Service Tax Rounding Precision, Service Tax Rounding Type, Applies-to Doc. No. and
    //    onLookup trigger of Applies-to Doc. No. is updated</add>
    //   <add id="PS35404" dev="suneethg" date="2009-03-08" area="Trading" releaseversion="IN6.00.01" feature="35404"
    //   >New functiona inittradingnoseries has been added, code commented with PS35404 has been added in location code onvalidate
    //   </add>
    //   <add id="49427" dev="suneethg" date="2009-03-24" area="FORMCODE" releaseversion="IN6.00.01" feature="49427"
    //   >New code added onlookup of form code </add>
    //   <add id="35965" dev="suneethg" date="2009-04-12" area="GateEntry" releaseversion="IN6.00.01" feature="35965"
    //   >code commented with 35965 has been added in getgateentrylines function. Deleted function fillgateentrylines.</add>
    //   <change id="37919" dev="suneethg" date="2009-05-05" area="Trading" releaseversion="IN6.00.01" feature="37919"
    //   >code commented with 37919 has been added in initnoseries function. code has been changed in Inittradingnoseries function.</change>
    //   <change id="IN0001" dev="SUNEETHG" feature="VSTF231134" date="2010-09-21"
    //     area="STRUCTURE" baseversion="IN6.00.01" releaseversion="IN7.00"> Service tax amount not initialized on removal of Structure.
    //   </change>
    //   <change id="VSTF214377" dev="v-sankya" feature="VSTF214377" date="2010-07-23" area="CST"
    //   baseversion="IN6.00.01" releaseversion="IN7.00">
    //   Form Code is not updated on Sales Lines causing incorrect Tax calculation.
    //   </change>
    //   <change id="VSTF208159" dev="v-anrout" feature="VSTF208159"
    //     date="2010-08-12" area="RG23D"  baseversion="IN6.00.01"
    //     releaseversion="IN7.00">
    //     Design change in RG 23 D
    //   </change>
    //   <add id="IN0002" dev="ALL-E" date="2011-08-23" area="SERVICETAX" feature="VSTF273271"
    //   releaseversion="IN7.00">Service Tax  Change in POINT OF TAX for determination of Service Tax and Tax rate</add>
    // </changelog>
    // 
    // //TEAM::1426/01 Field Adde for Capturing Billing address/Location Code/Branch Dimension On
    //   Basis on Case Dimension
    // //TEAM::1426/02 Code added for Capturing Invoicing Address on the basis of Billing contact Id.
    // //TEAM::1426/03 Code Added for capturing Shipping address on Credit Memo.

    Caption = 'Sales Header';
    DataCaptionFields = "No.", "Sell-to Customer Name";

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
            TableRelation = Customer;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if ("Sell-to Customer No." <> xRec."Sell-to Customer No.") and
                   (xRec."Sell-to Customer No." <> '')
                then begin
                    if ("Opportunity No." <> '') and ("Document Type" in ["Document Type"::Quote, "Document Type"::Order]) then
                        Error(
                          Text062,
                          FieldCaption("Sell-to Customer No."),
                          FieldCaption("Opportunity No."),
                          "Opportunity No.",
                          "Document Type");
                    if HideValidationDialog or not GuiAllowed then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text004, false, FieldCaption("Sell-to Customer No."));
                    if Confirmed then begin
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if "Sell-to Customer No." = '' then begin
                            if SalesLine.FindFirst then
                                Error(
                                  Text005,
                                  FieldCaption("Sell-to Customer No."));
                            Init;
                            SalesSetup.Get;
                            "No. Series" := xRec."No. Series";
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
                            exit;
                        end;
                        if "Document Type" = "Document Type"::Order then
                            SalesLine.SetFilter("Quantity Shipped", '<>0')
                        else
                            if "Document Type" = "Document Type"::Invoice then begin
                                SalesLine.SetRange("Sell-to Customer No.", xRec."Sell-to Customer No.");
                                SalesLine.SetFilter("Shipment No.", '<>%1', '');
                            end;

                        if SalesLine.FindFirst then
                            if "Document Type" = "Document Type"::Order then
                                SalesLine.TestField("Quantity Shipped", 0)
                            else
                                SalesLine.TestField("Shipment No.", '');
                        SalesLine.SetRange("Shipment No.");
                        SalesLine.SetRange("Quantity Shipped");

                        if "Document Type" = "Document Type"::Order then begin
                            SalesLine.SetFilter("Prepmt. Amt. Inv.", '<>0');
                            if SalesLine.Find('-') then
                                SalesLine.TestField("Prepmt. Amt. Inv.", 0);
                            SalesLine.SetRange("Prepmt. Amt. Inv.");
                        end;

                        if "Document Type" = "Document Type"::"Return Order" then
                            SalesLine.SetFilter("Return Qty. Received", '<>0')
                        else
                            if "Document Type" = "Document Type"::"Credit Memo" then begin
                                SalesLine.SetRange("Sell-to Customer No.", xRec."Sell-to Customer No.");
                                SalesLine.SetFilter("Return Receipt No.", '<>%1', '');
                            end;

                        if SalesLine.FindFirst then
                            if "Document Type" = "Document Type"::"Return Order" then
                                SalesLine.TestField("Return Qty. Received", 0)
                            else
                                SalesLine.TestField("Return Receipt No.", '');
                        SalesLine.Reset
                    end else begin
                        Rec := xRec;
                        exit;
                    end;
                end;

                if ("Document Type" = "Document Type"::Order) and
                   (xRec."Sell-to Customer No." <> "Sell-to Customer No.")
                then begin
                    SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SetRange("Document No.", "No.");
                    SalesLine.SetFilter("Purch. Order Line No.", '<>0');
                    if not SalesLine.IsEmpty then
                        Error(
                          Text006,
                          FieldCaption("Sell-to Customer No."));
                    SalesLine.Reset;
                end;

                GetCust("Sell-to Customer No.");

                Cust.CheckBlockedCustOnDocs(Cust, "Document Type", false, false);
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
                //"Nature of Services" := Cust."Nature of Services";//LKS-Raj Commented (Customer doesn't have Nature of Services field)
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
                //Structure := Cust.Structure; //LKS-Raj Commented (Table missig need to check)
                //"Excise Bus. Posting Group" := Cust."Excise Bus. Posting Group";//LKS-Raj Commented (Table missig need to check)
                "Responsibility Center" := UserSetupMgt.GetRespCenter(0, Cust."Responsibility Center");
                Validate("Location Code", UserSetupMgt.GetLocation(0, Cust."Location Code", "Responsibility Center"));

                if "Sell-to Customer No." = xRec."Sell-to Customer No." then begin
                    if ShippedSalesLinesExist or ReturnReceiptExist then begin
                        TestField("VAT Bus. Posting Group", xRec."VAT Bus. Posting Group");
                        TestField("Gen. Bus. Posting Group", xRec."Gen. Bus. Posting Group");
                    end;
                end;

                "Sell-to IC Partner Code" := Cust."IC Partner Code";
                "Send IC Document" := ("Sell-to IC Partner Code" <> '') and ("IC Direction" = "IC Direction"::Outgoing);

                if Cust."Bill-to Customer No." <> '' then
                    Validate("Bill-to Customer No.", Cust."Bill-to Customer No.")
                else begin
                    if "Bill-to Customer No." = "Sell-to Customer No." then
                        SkipBillToContact := true;
                    Validate("Bill-to Customer No.", "Sell-to Customer No.");
                    SkipBillToContact := false;
                end;
                Validate("Ship-to Code", '');

                GetShippingTime(FieldNo("Sell-to Customer No."));

                if (xRec."Sell-to Customer No." <> "Sell-to Customer No.") or
                   (xRec."Currency Code" <> "Currency Code") or
                   (xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group") or
                   (xRec."VAT Bus. Posting Group" <> "VAT Bus. Posting Group")
                then
                    RecreateSalesLines(FieldCaption("Sell-to Customer No."));

                Validate(Structure);
                //LKS-Raj Commented (Codeunit Missing)
                // if NODHeader.Get(NODHeader.Type::Customer, "Sell-to Customer No.") then
                //     Validate("Assessee Code", NODHeader."Assesse Code")
                // else
                //     Validate("Assessee Code", '');
                //LKS-Raj Commented (Codeunit Missing)
                if not SkipSellToContact then
                    UpdateSellToCont("Sell-to Customer No.");
            end;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                end;
            end;
        }
        field(4; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                BilltoCustomerNoChanged := xRec."Bill-to Customer No." <> "Bill-to Customer No.";
                if BilltoCustomerNoChanged and
                   (xRec."Bill-to Customer No." <> '')
                then begin
                    Validate("Credit Card No.", '');
                    if HideValidationDialog or not GuiAllowed then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text004, false, FieldCaption("Bill-to Customer No."));
                    if Confirmed then begin
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if "Document Type" = "Document Type"::Order then
                            SalesLine.SetFilter("Quantity Shipped", '<>0')
                        else
                            if "Document Type" = "Document Type"::Invoice then
                                SalesLine.SetFilter("Shipment No.", '<>%1', '');

                        if SalesLine.FindFirst then
                            if "Document Type" = "Document Type"::Order then
                                SalesLine.TestField("Quantity Shipped", 0)
                            else
                                SalesLine.TestField("Shipment No.", '');
                        SalesLine.SetRange("Shipment No.");
                        SalesLine.SetRange("Quantity Shipped");

                        if "Document Type" = "Document Type"::Order then begin
                            SalesLine.SetFilter("Prepmt. Amt. Inv.", '<>0');
                            if SalesLine.Find('-') then
                                SalesLine.TestField("Prepmt. Amt. Inv.", 0);
                            SalesLine.SetRange("Prepmt. Amt. Inv.");
                        end;

                        if "Document Type" = "Document Type"::"Return Order" then
                            SalesLine.SetFilter("Return Qty. Received", '<>0')
                        else
                            if "Document Type" = "Document Type"::"Credit Memo" then
                                SalesLine.SetFilter("Return Receipt No.", '<>%1', '');

                        if SalesLine.FindFirst then
                            if "Document Type" = "Document Type"::"Return Order" then
                                SalesLine.TestField("Return Qty. Received", 0)
                            else
                                SalesLine.TestField("Return Receipt No.", '');
                        SalesLine.Reset
                    end else
                        "Bill-to Customer No." := xRec."Bill-to Customer No.";
                end;

                GetCust("Bill-to Customer No.");
                Cust.CheckBlockedCustOnDocs(Cust, "Document Type", false, false);
                Cust.TestField("Customer Posting Group");
                CheckCrLimit;
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

                if not BilltoCustomerNoChanged then begin
                    if ShippedSalesLinesExist then begin
                        TestField("Customer Disc. Group", xRec."Customer Disc. Group");
                        TestField("Currency Code", xRec."Currency Code");
                    end;
                end;

                CreateDim(
                  DATABASE::Customer, "Bill-to Customer No.",
                  DATABASE::"Salesperson/Purchaser", "Salesperson Code",
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::"Responsibility Center", "Responsibility Center",
                  DATABASE::"Customer Template", "Bill-to Customer Template Code");

                Validate("Payment Terms Code");
                Validate("Prepmt. Payment Terms Code");
                Validate("Payment Method Code");
                Validate("Currency Code");
                Validate("Prepayment %");

                if (xRec."Sell-to Customer No." = "Sell-to Customer No.") and
                   BilltoCustomerNoChanged
                then begin
                    RecreateSalesLines(FieldCaption("Bill-to Customer No."));
                    BilltoCustomerNoChanged := false;
                end;
                if not SkipBillToContact then
                    UpdateBillToCont("Bill-to Customer No.");

                //TaxAreaUpdate;//LKS-Raj Commented 

                "Bill-to IC Partner Code" := Cust."IC Partner Code";
                "Send IC Document" := ("Bill-to IC Partner Code" <> '') and ("IC Direction" = "IC Direction"::Outgoing);
            end;
        }
        field(5; "Bill-to Name"; Text[50])
        {
            Caption = 'Bill-to Name';
        }
        field(6; "Bill-to Name 2"; Text[50])
        {
            Caption = 'Bill-to Name 2';
        }
        field(7; "Bill-to Address"; Text[60])
        {
            Caption = 'Bill-to Address';
        }
        field(8; "Bill-to Address 2"; Text[60])
        {
            Caption = 'Bill-to Address 2';
        }
        field(9; "Bill-to City"; Text[30])
        {
            Caption = 'Bill-to City';
            TableRelation = "Post Code".City;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(
                  "Bill-to City", "Bill-to Post Code", "Bill-to County", "Bill-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(10; "Bill-to Contact"; Text[50])
        {
            Caption = 'Bill-to Contact';
        }
        field(11; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));

            trigger OnValidate()
            begin
                if ("Document Type" = "Document Type"::Order) and
                   (xRec."Ship-to Code" <> "Ship-to Code")
                then begin
                    SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SetRange("Document No.", "No.");
                    SalesLine.SetFilter("Purch. Order Line No.", '<>0');
                    if not SalesLine.IsEmpty then
                        Error(
                          Text006,
                          FieldCaption("Ship-to Code"));
                    SalesLine.Reset;
                end;

                if ("Document Type" <> "Document Type"::"Return Order") and
                   ("Document Type" <> "Document Type"::"Credit Memo")
                then begin
                    if "Ship-to Code" <> '' then begin
                        if xRec."Ship-to Code" <> '' then begin
                            GetCust("Sell-to Customer No.");
                            if Cust."Location Code" <> '' then
                                Validate("Location Code", Cust."Location Code");
                            // "Tax Area Code" := Cust."Tax Area Code";
                        end;
                        ShipToAddr.Get("Sell-to Customer No.", "Ship-to Code");
                        "Ship-to Name" := ShipToAddr.Name;
                        "Ship-to Name 2" := ShipToAddr."Name 2";
                        "Ship-to Address" := ShipToAddr."Client Address 1";//TEAM:;4217
                        "Ship-to Address 2" := ShipToAddr."Client Address 2";//TEAM::4217
                                                                             //  "Ship-to Address" := ShipToAddr.Address;
                                                                             //  "Ship-to Address 2" := ShipToAddr."Address 2";
                        District := ShipToAddr.District;
                        "Post Office" := ShipToAddr."Post Office";//TEAM::1426/01
                        "Ship-to City" := ShipToAddr."City Town";//TEAM::1426/01
                                                                 //  "Ship-to City" := ShipToAddr.City;
                        "Ship-to Post Code" := ShipToAddr."Post Code";
                        "State Name" := ShipToAddr."State Name";//TEAM::1426/01
                        "Ship-to County" := ShipToAddr.County;
                        //  "Sell-to Country/Region Code" :=ShipToAddr.Country;//TEAM::1426/01
                        country := ShipToAddr.Country;//TEAM::1426/01

                        Validate("Ship-to Country/Region Code", ShipToAddr."Country/Region Code");
                        "Ship-to Contact" := ShipToAddr.Contact;
                        "Shipment Method Code" := ShipToAddr."Shipment Method Code";
                        if ShipToAddr."Location Code" <> '' then
                            Validate("Location Code", ShipToAddr."Location Code");
                        "Shipping Agent Code" := ShipToAddr."Shipping Agent Code";
                        "Shipping Agent Service Code" := ShipToAddr."Shipping Agent Service Code";
                        if ShipToAddr."Tax Area Code" <> '' then
                            "Tax Area Code" := ShipToAddr."Tax Area Code";
                        "Tax Liable" := ShipToAddr."Tax Liable";
                    end else
                        if "Sell-to Customer No." <> '' then begin
                            GetCust("Sell-to Customer No.");
                            "Ship-to Name" := Cust.Name;
                            "Ship-to Name 2" := Cust."Name 2";
                            "Ship-to Address" := Cust.Address;
                            "Ship-to Address 2" := Cust."Address 2";
                            "Ship-to City" := Cust.City;
                            "Ship-to Post Code" := Cust."Post Code";
                            "Post Office" := ShipToAddr."Post Office";//TEAM::1426/01
                            "Ship-to City" := ShipToAddr."City Town";//TEAM::1426/01
                                                                     //  "Ship-to County" := Cust.County;
                            Validate("Ship-to Country/Region Code", Cust."Country/Region Code");
                            "Ship-to Contact" := Cust.Contact;
                            "Shipment Method Code" := Cust."Shipment Method Code";
                            // "Tax Area Code" := Cust."Tax Area Code";
                            "Tax Liable" := Cust."Tax Liable";
                            if Cust."Location Code" <> '' then
                                Validate("Location Code", Cust."Location Code");
                            "Shipping Agent Code" := Cust."Shipping Agent Code";
                            "Shipping Agent Service Code" := Cust."Shipping Agent Service Code";
                        end;
                end;

                GetShippingTime(FieldNo("Ship-to Code"));

                //TaxAreaUpdate;//LKS-Raj Commented

                if (xRec."Sell-to Customer No." = "Sell-to Customer No.") and
                   (xRec."Ship-to Code" <> "Ship-to Code")
                then
                    if (xRec."VAT Country/Region Code" <> "VAT Country/Region Code") or
                       (xRec."Tax Area Code" <> "Tax Area Code")
                    then
                        RecreateSalesLines(FieldCaption("Ship-to Code"))
                    else begin
                        if xRec."Shipping Agent Code" <> "Shipping Agent Code" then
                            MessageIfSalesLinesExist(FieldCaption("Shipping Agent Code"));
                        if xRec."Shipping Agent Service Code" <> "Shipping Agent Service Code" then
                            MessageIfSalesLinesExist(FieldCaption("Shipping Agent Service Code"));
                        if xRec."Tax Liable" <> "Tax Liable" then
                            Validate("Tax Liable");
                    end;
            end;
        }
        field(13; "Ship-to Name"; Text[50])
        {
            Caption = 'Ship-to Name';
        }
        field(14; "Ship-to Name 2"; Text[50])
        {
            Caption = 'Ship-to Name 2';
        }
        field(15; "Ship-to Address"; Text[60])
        {
            Caption = 'Ship-to Address';
        }
        field(16; "Ship-to Address 2"; Text[60])
        {
            Caption = 'Ship-to Address 2';
        }
        field(17; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            TableRelation = "Post Code".City;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(
                  "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(18; "Ship-to Contact"; Text[50])
        {
            Caption = 'Ship-to Contact';
        }
        field(19; "Order Date"; Date)
        {
            Caption = 'Order Date';

            trigger OnValidate()
            begin
                if ("Document Type" in ["Document Type"::Quote, "Document Type"::Order]) and
                   not ("Order Date" = xRec."Order Date")
                then
                    PriceMessageIfSalesLinesExist(FieldCaption("Order Date"));
            end;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                TestNoSeriesDate(
                  "Posting No.", "Posting No. Series",
                  FieldCaption("Posting No."), FieldCaption("Posting No. Series"));
                TestNoSeriesDate(
                  "Prepayment No.", "Prepayment No. Series",
                  FieldCaption("Prepayment No."), FieldCaption("Prepayment No. Series"));
                TestNoSeriesDate(
                  "Prepmt. Cr. Memo No.", "Prepmt. Cr. Memo No. Series",
                  FieldCaption("Prepmt. Cr. Memo No."), FieldCaption("Prepmt. Cr. Memo No. Series"));

                //VALIDATE("Document Date","Posting Date");//TEAM::1426

                if ("Document Type" in ["Document Type"::Invoice, "Document Type"::"Credit Memo"]) and
                   not ("Posting Date" = xRec."Posting Date")
                then
                    PriceMessageIfSalesLinesExist(FieldCaption("Posting Date"));

                if "Currency Code" <> '' then begin
                    UpdateCurrencyFactor;
                    if "Currency Factor" <> xRec."Currency Factor" then
                        ConfirmUpdateCurrencyFactor;
                end;

                UpdateSalesLines(FieldCaption("Posting Date"), CurrFieldNo <> 0);
                UpdateGenJnlLInePostingDate;
            end;
        }
        field(21; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Shipment Date"), CurrFieldNo <> 0);
            end;
        }
        field(22; "Posting Description"; Text[250])
        {
            Caption = 'Posting Description';
        }
        field(23; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate()
            begin
                if ("Payment Terms Code" <> '') and ("Document Date" <> 0D) then begin
                    PaymentTerms.Get("Payment Terms Code");
                    if (("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and
                        not PaymentTerms."Calc. Pmt. Disc. on Cr. Memos")
                    then begin
                        Validate("Due Date", "Document Date");
                        Validate("Pmt. Discount Date", 0D);
                        Validate("Payment Discount %", 0);
                    end else begin
                        "Due Date" := CalcDate(PaymentTerms."Due Date Calculation", "Document Date");
                        "Pmt. Discount Date" := CalcDate(PaymentTerms."Discount Date Calculation", "Document Date");
                        if not UpdateDocumentDate then
                            Validate("Payment Discount %", PaymentTerms."Discount %")
                    end;
                end else begin
                    Validate("Due Date", "Document Date");
                    if not UpdateDocumentDate then begin
                        Validate("Pmt. Discount Date", 0D);
                        Validate("Payment Discount %", 0);
                    end;
                end;
                if xRec."Payment Terms Code" = "Prepmt. Payment Terms Code" then begin
                    if xRec."Prepayment Due Date" = 0D then
                        "Prepayment Due Date" := CalcDate(PaymentTerms."Due Date Calculation", "Document Date");
                    Validate("Prepmt. Payment Terms Code", "Payment Terms Code");
                end;
            end;
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(25; "Payment Discount %"; Decimal)
        {
            Caption = 'Payment Discount %';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date"), FieldNo("Document Date")]) then
                    TestField(Status, Status::Open);
                GLSetup.Get;
                if "Payment Discount %" < GLSetup."VAT Tolerance %" then
                    "VAT Base Discount %" := "Payment Discount %"
                else
                    "VAT Base Discount %" := GLSetup."VAT Tolerance %";
                Validate("VAT Base Discount %");
            end;
        }
        field(26; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(27; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if ("Location Code" <> xRec."Location Code") and
                   (xRec."Sell-to Customer No." = "Sell-to Customer No.")
                then
                    MessageIfSalesLinesExist(FieldCaption("Location Code"));

                UpdateShipToAddress;

                if "Location Code" <> '' then begin
                    if Location.Get("Location Code") then
                        "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                end else begin
                    if InvtSetup.Get then
                        "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                end;

                CompanyInfo.Get;
                if "Location Code" <> '' then begin
                    Location.Get("Location Code");
                    // PS35404.begin
                    // IF Location."Sales Invoice Nos." <> '' THEN
                    // "Posting No. Series" := Location."Sales Invoice Nos.";
                    // IF Location."Sales Shipment Nos." <> '' THEN
                    // "Shipping No. Series" := Location."Sales Shipment Nos.";
                    // VSTF208159.begin
                    if CurrFieldNo <> FieldNo(Trading) then
                        // VSTF208159.end
                        Trading := Location."Trading Location";
                    // PS35404.end
                end else
                    Trading := CompanyInfo."Trading Co.";
                //InitTradingNoSeries;     //LKS-Raj Commented 

                //TaxAreaUpdate;//LKS-Raj Commented
                if "Location Code" <> xRec."Location Code" then begin
                    SalesLine.Reset;
                    SalesLine.SetRange("Document Type", "Document Type");
                    SalesLine.SetRange("Document No.", "No.");
                    if SalesLine.Find('-') then
                        repeat
                            //SalesLine.Validate("Direct Debit To PLA / RG", false);//LKS-Raj Commented (Field Missing)
                            SalesLine.Modify(true);
                        until SalesLine.Next = 0;
                end;

                //TEAM::1426/01
                DimValue.Reset;
                DimValue.SetRange(DimValue."Dimension Code", 'Branch');
                DimValue.SetRange(DimValue.Name, "Location Code");
                if DimValue.Find('-') then begin
                    "Shortcut Dimension 1 Code" := DimValue.Code;
                    Validate("Shortcut Dimension 1 Code", DimValue.Code);
                end;
                //TEAM::1426/01
            end;
        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");

                //TEAM::1426/01
                DimValue.Reset;
                DimValue.SetRange(DimValue."Dimension Code", 'CASE');
                DimValue.SetRange(DimValue.Code, "Shortcut Dimension 2 Code");
                //MESSAGE(DimValue.Code);//TEAM::1426
                if DimValue.Find('-') then begin
                    "Location Code" := DimValue."Case-Branch";
                    //"Ship-to Code" := DimValue."Case-Office ID";
                    //VALIDATE("Ship-to Code", DimValue."Case-Office ID");
                    "Bill-to Contact No." := DimValue.Billing_Contact_ID;
                    Validate("Bill-to Contact No.", DimValue.Billing_Contact_ID);
                    Validate("Location Code", DimValue."Case-Branch");
                    //MESSAGE("Bill-to Contact No.");//TEAM::1426
                end;
                //TEAM::1426/01
            end;
        }
        field(31; "Customer Posting Group"; Code[10])
        {
            Caption = 'Customer Posting Group';
            Editable = false;
            TableRelation = "Customer Posting Group";
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestField(Status, Status::Open);
                //DOPaymentTransLogMgt.ValidateHasNoValidTransactions("Document Type", Format("Document Type"), "No.");//LKS-Raj Commented (Codeunit Missing)
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else begin
                    if "Currency Code" <> xRec."Currency Code" then begin
                        UpdateCurrencyFactor;
                        RecreateSalesLines(FieldCaption("Currency Code"));
                    end else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
                end;
            end;
        }
        field(33; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdateSalesLines(FieldCaption("Currency Factor"), false);
            end;
        }
        field(34; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";

            trigger OnValidate()
            begin
                MessageIfSalesLinesExist(FieldCaption("Customer Price Group"));
            end;
        }
        field(35; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';

            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
                Currency: Record Currency;
                RecalculatePrice: Boolean;
            begin
                TestField(Status, Status::Open);

                if "Prices Including VAT" <> xRec."Prices Including VAT" then begin
                    SalesLine.SetRange("Document Type", "Document Type");
                    SalesLine.SetRange("Document No.", "No.");
                    SalesLine.SetFilter("Job Contract Entry No.", '<>%1', 0);
                    if SalesLine.Find('-') then begin
                        SalesLine.TestField("Job No.", '');
                        SalesLine.TestField("Job Contract Entry No.", 0);
                    end;

                    SalesLine.Reset;
                    SalesLine.SetRange("Document Type", "Document Type");
                    SalesLine.SetRange("Document No.", "No.");
                    SalesLine.SetFilter("Unit Price", '<>%1', 0);
                    SalesLine.SetFilter("VAT %", '<>%1', 0);
                    if SalesLine.FindFirst then begin
                        RecalculatePrice :=
                          Confirm(
                            StrSubstNo(
                              Text024,
                              FieldCaption("Prices Including VAT"), SalesLine.FieldCaption("Unit Price")),
                            true);
                        //  SalesLine.SetSalesHeader(Rec);

                        if "Currency Code" = '' then
                            Currency.InitRoundingPrecision
                        else
                            Currency.Get("Currency Code");
                        SalesLine.LockTable;
                        LockTable;
                        SalesLine.FindSet;
                        repeat
                            SalesLine.TestField("Quantity Invoiced", 0);
                            SalesLine.TestField("Prepmt. Amt. Inv.", 0);
                            if not RecalculatePrice then begin
                                SalesLine."VAT Difference" := 0;
                                SalesLine.InitOutstandingAmount;
                            end else
                                if "Prices Including VAT" then begin
                                    SalesLine."Unit Price" :=
                                      Round(
                                        SalesLine."Unit Price" * (1 + (SalesLine."VAT %" / 100)),
                                        Currency."Unit-Amount Rounding Precision");
                                    if SalesLine.Quantity <> 0 then begin
                                        SalesLine."Line Discount Amount" :=
                                          Round(
                                            SalesLine.Quantity * SalesLine."Unit Price" * SalesLine."Line Discount %" / 100,
                                            Currency."Amount Rounding Precision");
                                        SalesLine.Validate("Inv. Discount Amount",
                                          Round(
                                            SalesLine."Inv. Discount Amount" * (1 + (SalesLine."VAT %" / 100)),
                                            Currency."Amount Rounding Precision"));
                                    end;
                                end else begin
                                    SalesLine."Unit Price" :=
                                      Round(
                                        SalesLine."Unit Price" / (1 + (SalesLine."VAT %" / 100)),
                                        Currency."Unit-Amount Rounding Precision");
                                    if SalesLine.Quantity <> 0 then begin
                                        SalesLine."Line Discount Amount" :=
                                          Round(
                                            SalesLine.Quantity * SalesLine."Unit Price" * SalesLine."Line Discount %" / 100,
                                            Currency."Amount Rounding Precision");
                                        SalesLine.Validate("Inv. Discount Amount",
                                          Round(
                                            SalesLine."Inv. Discount Amount" / (1 + (SalesLine."VAT %" / 100)),
                                            Currency."Amount Rounding Precision"));
                                    end;
                                end;
                            SalesLine.Modify;
                        until SalesLine.Next = 0;
                    end;
                end;
            end;
        }
        field(37; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                MessageIfSalesLinesExist(FieldCaption("Invoice Disc. Code"));
            end;
        }
        field(40; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                MessageIfSalesLinesExist(FieldCaption("Customer Disc. Group"));
            end;
        }
        field(41; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;

            trigger OnValidate()
            begin
                MessageIfSalesLinesExist(FieldCaption("Language Code"));
            end;
        }
        field(43; "Salesperson Code"; Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                ApprovalEntry.SetRange("Table ID", DATABASE::"Sales Header");
                ApprovalEntry.SetRange("Document Type", "Document Type");
                ApprovalEntry.SetRange("Document No.", "No.");
                ApprovalEntry.SetFilter(Status, '<>%1&<>%2', ApprovalEntry.Status::Canceled, ApprovalEntry.Status::Rejected);
                if not ApprovalEntry.IsEmpty then
                    Error(Text053, FieldCaption("Salesperson Code"));

                CreateDim(
                  DATABASE::"Salesperson/Purchaser", "Salesperson Code",
                  DATABASE::Customer, "Bill-to Customer No.",
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::"Responsibility Center", "Responsibility Center",
                  DATABASE::"Customer Template", "Bill-to Customer Template Code");
            end;
        }
        field(45; "Order Class"; Code[10])
        {
            Caption = 'Order Class';
        }
        field(46; Comment; Boolean)
        {
            CalcFormula = Exist("Sales Comment Line" WHERE("Document Type" = FIELD("Document Type"),
                                                            "No." = FIELD("No."),
                                                            "Document Line No." = CONST(0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(51; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
        }
        field(52; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(53; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            begin
                TestField("Bal. Account No.", '');
                CustLedgEntry.SetCurrentKey("Customer No.", Open, Positive, "Due Date");
                CustLedgEntry.SetRange("Customer No.", "Bill-to Customer No.");
                CustLedgEntry.SetRange(Open, true);
                if "Applies-to Doc. No." <> '' then begin
                    CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                    CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                    if CustLedgEntry.FindFirst then;
                    CustLedgEntry.SetRange("Document Type");
                    CustLedgEntry.SetRange("Document No.");
                end else
                    if "Applies-to Doc. Type" <> 0 then begin
                        CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                        if CustLedgEntry.FindFirst then;
                        CustLedgEntry.SetRange("Document Type");
                    end else
                        if Amount <> 0 then begin
                            CustLedgEntry.SetRange(Positive, Amount < 0);
                            if CustLedgEntry.FindFirst then;
                            CustLedgEntry.SetRange(Positive);
                        end;

                //ApplyCustEntries.SetSales(Rec,CustLedgEntry,SalesHeader.FIELDNO("Applies-to Doc. No."));
                ApplyCustEntries.SetTableView(CustLedgEntry);
                ApplyCustEntries.SetRecord(CustLedgEntry);
                ApplyCustEntries.LookupMode(true);
                if ApplyCustEntries.RunModal = ACTION::LookupOK then begin
                    ApplyCustEntries.GetCustLedgEntry(CustLedgEntry);
                    GenJnlApply.CheckAgainstApplnCurrency(
                      "Currency Code", CustLedgEntry."Currency Code", GenJnILine."Account Type"::Customer, true);
                    "Applies-to Doc. Type" := CustLedgEntry."Document Type";
                    "Applies-to Doc. No." := CustLedgEntry."Document No.";
                    // IN0062.begin
                    // IF CustLedgEntry."Serv. Tax on Advance Payment" THEN
                    // "Transaction No. Serv. Tax" := CustLedgEntry."Transaction No.";
                    "Transaction No. Serv. Tax" := 0;
                    //LKS-Raj Commented (Field missing)
                    // if CustLedgEntry."Serv. Tax on Advance Payment" then
                    //     "Transaction No. Serv. Tax" := CustLedgEntry."Transaction No.";
                    //LKS-Raj Commented (Field missing)
                    // PS39773.begin
                    // ServTaxEntry.RESET;
                    // ServTaxEntry.SETRANGE("Transaction No.",CustLedgEntry."Transaction No.");
                    // IF ServTaxEntry.FINDFIRST THEN BEGIN
                    // "Service Tax Rounding Precision" := ServTaxEntry."Service Tax Rounding Precision";
                    // "Service Tax Rounding Type" := ServTaxEntry."Service Tax Rounding Type";
                    // END;
                    // PS39773.end

                    // IN0062.end
                end;
                Clear(ApplyCustEntries);
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
            begin
                if "Applies-to Doc. No." <> '' then
                    TestField("Bal. Account No.", '');

                if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." <> '') and
                   ("Applies-to Doc. No." <> '')
                then begin
                    SetAmountToApply("Applies-to Doc. No.", "Bill-to Customer No.");
                    SetAmountToApply(xRec."Applies-to Doc. No.", "Bill-to Customer No.");
                end else
                    if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." = '') then
                        SetAmountToApply("Applies-to Doc. No.", "Bill-to Customer No.")
                    else
                        if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and ("Applies-to Doc. No." = '') then
                            SetAmountToApply(xRec."Applies-to Doc. No.", "Bill-to Customer No.");
                CustLedgEntry.Reset;
                CustLedgEntry.SetCurrentKey("Document No.", "Document Type", "Customer No.");
                CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                if "Applies-to Doc. Type" <> 0 then
                    CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                CustLedgEntry.SetRange("Customer No.", "Sell-to Customer No.");
                if CustLedgEntry.FindFirst then begin
                    CustLedgEntry.CalcFields("Remaining Amt. (LCY)");
                    // IN0062.begin
                    // IF NOT (CustLedgEntry."Remaining Amt. (LCY)" = 0) AND (CustLedgEntry."Serv. Tax on Advance Payment") THEN
                    // "Transaction No. Serv. Tax" := CustLedgEntry."Transaction No.";
                    "Transaction No. Serv. Tax" := 0;
                    //LKS-Raj Commented (Field missing)
                    // if not (CustLedgEntry."Remaining Amt. (LCY)" = 0) and CustLedgEntry."Serv. Tax on Advance Payment" then
                    //     "Transaction No. Serv. Tax" := CustLedgEntry."Transaction No.";
                    //LKS-Raj Commented (Field missing)
                    // PS39773.begin
                    // ServTaxEntry.RESET;
                    // ServTaxEntry.SETRANGE("Transaction No.",CustLedgEntry."Transaction No.");
                    // IF ServTaxEntry.FINDFIRST THEN BEGIN
                    // "Service Tax Rounding Precision" := ServTaxEntry."Service Tax Rounding Precision";
                    // "Service Tax Rounding Type" := ServTaxEntry."Service Tax Rounding Type";
                    // END;
                    // PS39773.end

                    // IN0062.end
                end;

                if "Applies-to Doc. No." = '' then
                    "Transaction No. Serv. Tax" := 0;
            end;
        }
        field(55; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account";

            trigger OnValidate()
            begin
                if "Bal. Account No." <> '' then
                    case "Bal. Account Type" of
                        "Bal. Account Type"::"G/L Account":
                            begin
                                GLAcc.Get("Bal. Account No.");
                                GLAcc.CheckGLAcc;
                                GLAcc.TestField("Direct Posting", true);
                            end;
                        "Bal. Account Type"::"Bank Account":
                            begin
                                BankAcc.Get("Bal. Account No.");
                                BankAcc.TestField(Blocked, false);
                                BankAcc.TestField("Currency Code", "Currency Code");
                            end;
                    end;
            end;
        }
        field(57; Ship; Boolean)
        {
            Caption = 'Ship';
            Editable = false;
        }
        field(58; Invoice; Boolean)
        {
            Caption = 'Invoice';
        }
        field(59; "Print Posted Documents"; Boolean)
        {
            Caption = 'Print Posted Documents';
        }
        field(60; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line".Amount WHERE("Document Type" = FIELD("Document Type"),
                                                         "Document No." = FIELD("No.")));
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Amount Including VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" WHERE("Document Type" = FIELD("Document Type"),
                                                                         "Document No." = FIELD("No.")));
            Caption = 'Amount Including VAT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Shipping No."; Code[20])
        {
            Caption = 'Shipping No.';
        }
        field(63; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
        }
        field(64; "Last Shipping No."; Code[20])
        {
            Caption = 'Last Shipping No.';
            Editable = false;
            TableRelation = "Sales Shipment Header";
        }
        field(65; "Last Posting No."; Code[20])
        {
            Caption = 'Last Posting No.';
            Editable = false;
            TableRelation = "Sales Invoice Header";
        }
        field(66; "Prepayment No."; Code[20])
        {
            Caption = 'Prepayment No.';
        }
        field(67; "Last Prepayment No."; Code[20])
        {
            Caption = 'Last Prepayment No.';
            TableRelation = "Sales Invoice Header";
        }
        field(68; "Prepmt. Cr. Memo No."; Code[20])
        {
            Caption = 'Prepmt. Cr. Memo No.';
        }
        field(69; "Last Prepmt. Cr. Memo No."; Code[20])
        {
            Caption = 'Last Prepmt. Cr. Memo No.';
            TableRelation = "Sales Cr.Memo Header";
        }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(71; "Combine Shipments"; Boolean)
        {
            Caption = 'Combine Shipments';
        }
        field(73; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(74; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then begin
                        "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                        RecreateSalesLines(FieldCaption("Gen. Bus. Posting Group"));
                    end;
            end;
        }
        field(75; "EU 3-Party Trade"; Boolean)
        {
            Caption = 'EU 3-Party Trade';
        }
        field(76; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Transaction Type"), false);
            end;
        }
        field(77; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Transport Method"), false);
            end;
        }
        field(78; "VAT Country/Region Code"; Code[10])
        {
            Caption = 'VAT Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(79; "Sell-to Customer Name"; Text[50])
        {
            Caption = 'Sell-to Customer Name';
        }
        field(80; "Sell-to Customer Name 2"; Text[50])
        {
            Caption = 'Sell-to Customer Name 2';
        }
        field(81; "Sell-to Address"; Text[50])
        {
            Caption = 'Sell-to Address';
        }
        field(82; "Sell-to Address 2"; Text[50])
        {
            Caption = 'Sell-to Address 2';
        }
        field(83; "Sell-to City"; Text[30])
        {
            Caption = 'Sell-to City';
            TableRelation = "Post Code".City;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(
                  "Sell-to City", "Sell-to Post Code", "Sell-to County", "Sell-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(84; "Sell-to Contact"; Text[50])
        {
            Caption = 'Sell-to Contact';
        }
        field(85; "Bill-to Post Code"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(
                  "Bill-to City", "Bill-to Post Code", "Bill-to County", "Bill-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(86; "Bill-to County"; Text[30])
        {
            Caption = 'Bill-to County';
        }
        field(87; "Bill-to Country/Region Code"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                if ("Bill-to Country/Region Code" <> xRec."Bill-to Country/Region Code") and (xRec."Bill-to Country/Region Code" <> '') then
                    PostCode.ClearFields("Bill-to City", "Bill-to Post Code", "Bill-to County");
            end;
        }
        field(88; "Sell-to Post Code"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(
                  "Sell-to City", "Sell-to Post Code", "Sell-to County", "Sell-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(89; "Sell-to County"; Text[30])
        {
            Caption = 'Sell-to County';
        }
        field(90; "Sell-to Country/Region Code"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                Validate("Ship-to Country/Region Code");
                if ("Sell-to Country/Region Code" <> xRec."Sell-to Country/Region Code") and (xRec."Sell-to Country/Region Code" <> '') then
                    PostCode.ClearFields("Sell-to City", "Sell-to Post Code", "Sell-to County");
            end;
        }
        field(91; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(
                  "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(92; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(93; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                if ("Ship-to Country/Region Code" <> xRec."Ship-to Country/Region Code") and (xRec."Ship-to Country/Region Code" <> '') then
                    PostCode.ClearFields("Ship-to City", "Ship-to Post Code", "Ship-to County");
            end;
        }
        field(94; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Bank Account';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(97; "Exit Point"; Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Exit Point"), false);
            end;
        }
        field(98; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';

            trigger OnValidate()
            begin
                if xRec."Document Date" <> "Document Date" then
                    UpdateDocumentDate := true;
                Validate("Payment Terms Code");
                Validate("Prepmt. Payment Terms Code");
            end;
        }
        field(100; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(101; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption(Area), false);
            end;
        }
        field(102; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Transaction Specification"), false);
            end;
        }
        field(104; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";

            trigger OnValidate()
            begin
                //LKS-Raj Commented (Codeunit Missing)
                //DOPaymentTransLogMgt.ValidateHasNoValidTransactions("Document Type", Format("Document Type"), "No.");
                //if DOPaymentMgt.IsValidPaymentMethod(xRec."Payment Method Code") and not DOPaymentMgt.IsValidPaymentMethod("Payment Method Code")
                //then
                //TestField("Credit Card No.", '');
                //LKS-Raj Commented (Codeunit Missing)
                PaymentMethod.Init;
                if "Payment Method Code" <> '' then
                    PaymentMethod.Get("Payment Method Code");
                "Bal. Account Type" := PaymentMethod."Bal. Account Type";
                "Bal. Account No." := PaymentMethod."Bal. Account No.";
                if "Bal. Account No." <> '' then begin
                    TestField("Applies-to Doc. No.", '');
                    TestField("Applies-to ID", '');
                end;
            end;
        }
        field(105; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if xRec."Shipping Agent Code" = "Shipping Agent Code" then
                    exit;

                "Shipping Agent Service Code" := '';
                GetShippingTime(FieldNo("Shipping Agent Code"));
                UpdateSalesLines(FieldCaption("Shipping Agent Code"), CurrFieldNo <> 0);
            end;
        }
        field(106; "Package Tracking No."; Text[30])
        {
            Caption = 'Package Tracking No.';
        }
        field(107; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                with SalesHeader do begin
                    //  SalesHeader := Rec;
                    SalesSetup.Get;
                    TestNoSeries;
                    if NoSeriesMgt.LookupSeries(GetPostingNoSeriesCode, "Posting No. Series") then
                        Validate("Posting No. Series");
                    //  Rec := SalesHeader;
                end;
            end;

            trigger OnValidate()
            begin
                if "Posting No. Series" <> '' then begin
                    SalesSetup.Get;
                    TestNoSeries;
                    NoSeriesMgt.TestSeries(GetPostingNoSeriesCode, "Posting No. Series");
                end;
                TestField("Posting No.", '');
            end;
        }
        field(109; "Shipping No. Series"; Code[10])
        {
            Caption = 'Shipping No. Series';
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                with SalesHeader do begin
                    //  SalesHeader := Rec;
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Shipment Nos.");
                    if NoSeriesMgt.LookupSeries(SalesSetup."Posted Shipment Nos.", "Shipping No. Series") then
                        Validate("Shipping No. Series");
                    //  Rec := SalesHeader;
                end;
            end;

            trigger OnValidate()
            begin
                if "Shipping No. Series" <> '' then begin
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Shipment Nos.");
                    NoSeriesMgt.TestSeries(SalesSetup."Posted Shipment Nos.", "Shipping No. Series");
                end;
                TestField("Shipping No.", '');
            end;
        }
        field(114; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                MessageIfSalesLinesExist(FieldCaption("Tax Area Code"));
                TaxAreaUpdatelines;
            end;
        }
        field(115; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                MessageIfSalesLinesExist(FieldCaption("Tax Liable"));
                TaxAreaUpdatelines;
            end;
        }
        field(116; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if xRec."VAT Bus. Posting Group" <> "VAT Bus. Posting Group" then
                    RecreateSalesLines(FieldCaption("VAT Bus. Posting Group"));
            end;
        }
        field(117; Reserve; Option)
        {
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(118; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempCustLedgEntry: Record "Cust. Ledger Entry";
            begin
                if "Applies-to ID" <> '' then
                    TestField("Bal. Account No.", '');
                if ("Applies-to ID" <> xRec."Applies-to ID") and (xRec."Applies-to ID" <> '') then begin
                    CustLedgEntry.SetCurrentKey("Customer No.", Open);
                    CustLedgEntry.SetRange("Customer No.", "Bill-to Customer No.");
                    CustLedgEntry.SetRange(Open, true);
                    CustLedgEntry.SetRange("Applies-to ID", xRec."Applies-to ID");
                    if CustLedgEntry.FindFirst then
                        CustEntrySetApplID.SetApplId(CustLedgEntry, TempCustLedgEntry, '');
                    CustLedgEntry.Reset;
                end;
            end;
        }
        field(119; "VAT Base Discount %"; Decimal)
        {
            Caption = 'VAT Base Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date"), FieldNo("Document Date")]) then
                    TestField(Status, Status::Open);
                GLSetup.Get;
                if "VAT Base Discount %" > GLSetup."VAT Tolerance %" then
                    Error(
                      Text007,
                      FieldCaption("VAT Base Discount %"),
                      GLSetup.FieldCaption("VAT Tolerance %"),
                      GLSetup.TableCaption);

                if ("VAT Base Discount %" = xRec."VAT Base Discount %") and
                   (CurrFieldNo <> 0)
                then
                    exit;

                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                SalesLine.SetFilter(Type, '<>%1', SalesLine.Type::" ");
                SalesLine.SetFilter(Quantity, '<>0');
                SalesLine.LockTable;
                LockTable;
                if SalesLine.FindSet then begin
                    Modify;
                    repeat
                        if (SalesLine."Quantity Invoiced" <> SalesLine.Quantity) or
                           ("Shipping Advice" <> "Shipping Advice"::Partial) or
                           (SalesLine.Type <> SalesLine.Type::"Charge (Item)") or
                           (CurrFieldNo <> 0)
                        then begin
                            SalesLine.UpdateAmounts;
                            SalesLine.Modify;
                        end;
                    until SalesLine.Next = 0;
                end;
                SalesLine.Reset;
            end;
        }
        field(120; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(121; "Invoice Discount Calculation"; Option)
        {
            Caption = 'Invoice Discount Calculation';
            Editable = false;
            OptionCaption = 'None,%,Amount';
            OptionMembers = "None","%",Amount;
        }
        field(122; "Invoice Discount Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Invoice Discount Value';
            Editable = false;
        }
        field(123; "Send IC Document"; Boolean)
        {
            Caption = 'Send IC Document';

            trigger OnValidate()
            begin
                if "Send IC Document" then begin
                    if "Bill-to IC Partner Code" = '' then
                        TestField("Sell-to IC Partner Code");
                    TestField("IC Direction", "IC Direction"::Outgoing);
                end;
            end;
        }
        field(124; "IC Status"; Option)
        {
            Caption = 'IC Status';
            OptionCaption = 'New,Pending,Sent';
            OptionMembers = New,Pending,Sent;
        }
        field(125; "Sell-to IC Partner Code"; Code[20])
        {
            Caption = 'Sell-to IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(126; "Bill-to IC Partner Code"; Code[20])
        {
            Caption = 'Bill-to IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(129; "IC Direction"; Option)
        {
            Caption = 'IC Direction';
            OptionCaption = 'Outgoing,Incoming';
            OptionMembers = Outgoing,Incoming;

            trigger OnValidate()
            begin
                if "IC Direction" = "IC Direction"::Incoming then
                    "Send IC Document" := false;
            end;
        }
        field(130; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                UpdateSalesLines(FieldCaption("Prepayment %"), CurrFieldNo <> 0);
            end;
        }
        field(131; "Prepayment No. Series"; Code[10])
        {
            Caption = 'Prepayment No. Series';
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                with SalesHeader do begin
                    //  SalesHeader := Rec;
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Prepmt. Inv. Nos.");
                    if NoSeriesMgt.LookupSeries(SalesSetup."Posted Prepmt. Inv. Nos.", "Prepayment No. Series") then
                        Validate("Prepayment No. Series");
                    //  Rec := SalesHeader;
                end;
            end;

            trigger OnValidate()
            begin
                if "Prepayment No. Series" <> '' then begin
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Prepmt. Inv. Nos.");
                    NoSeriesMgt.TestSeries(SalesSetup."Posted Prepmt. Inv. Nos.", "Prepayment No. Series");
                end;
                TestField("Prepayment No.", '');
            end;
        }
        field(132; "Compress Prepayment"; Boolean)
        {
            Caption = 'Compress Prepayment';
            InitValue = true;
        }
        field(133; "Prepayment Due Date"; Date)
        {
            Caption = 'Prepayment Due Date';
        }
        field(134; "Prepmt. Cr. Memo No. Series"; Code[10])
        {
            Caption = 'Prepmt. Cr. Memo No. Series';
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                with SalesHeader do begin
                    //  SalesHeader := Rec;
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Prepmt. Cr. Memo Nos.");
                    if NoSeriesMgt.LookupSeries(GetPostingNoSeriesCode, "Prepmt. Cr. Memo No.") then
                        Validate("Prepmt. Cr. Memo No.");
                    //  Rec := SalesHeader;
                end;
            end;

            trigger OnValidate()
            begin
                if "Prepmt. Cr. Memo No." <> '' then begin
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Prepmt. Cr. Memo Nos.");
                    NoSeriesMgt.TestSeries(SalesSetup."Posted Prepmt. Cr. Memo Nos.", "Prepmt. Cr. Memo No.");
                end;
                TestField("Prepmt. Cr. Memo No.", '');
            end;
        }
        field(135; "Prepmt. Posting Description"; Text[50])
        {
            Caption = 'Prepmt. Posting Description';
        }
        field(138; "Prepmt. Pmt. Discount Date"; Date)
        {
            Caption = 'Prepmt. Pmt. Discount Date';
        }
        field(139; "Prepmt. Payment Terms Code"; Code[10])
        {
            Caption = 'Prepmt. Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate()
            var
                PaymentTerms: Record "Payment Terms";
            begin
                if ("Prepmt. Payment Terms Code" <> '') and ("Document Date" <> 0D) then begin
                    PaymentTerms.Get("Prepmt. Payment Terms Code");
                    if (("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and
                        not PaymentTerms."Calc. Pmt. Disc. on Cr. Memos")
                    then begin
                        Validate("Prepayment Due Date", "Document Date");
                        Validate("Prepmt. Pmt. Discount Date", 0D);
                        Validate("Prepmt. Payment Discount %", 0);
                    end else begin
                        "Prepayment Due Date" := CalcDate(PaymentTerms."Due Date Calculation", "Document Date");
                        "Prepmt. Pmt. Discount Date" := CalcDate(PaymentTerms."Discount Date Calculation", "Document Date");
                        if not UpdateDocumentDate then
                            Validate("Prepmt. Payment Discount %", PaymentTerms."Discount %")
                    end;
                end else begin
                    Validate("Prepayment Due Date", "Document Date");
                    if not UpdateDocumentDate then begin
                        Validate("Prepmt. Pmt. Discount Date", 0D);
                        Validate("Prepmt. Payment Discount %", 0);
                    end;
                end;
            end;
        }
        field(140; "Prepmt. Payment Discount %"; Decimal)
        {
            Caption = 'Prepmt. Payment Discount %';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date"), FieldNo("Document Date")]) then
                    TestField(Status, Status::Open);
                GLSetup.Get;
                if "Payment Discount %" < GLSetup."VAT Tolerance %" then
                    "VAT Base Discount %" := "Payment Discount %"
                else
                    "VAT Base Discount %" := GLSetup."VAT Tolerance %";
                Validate("VAT Base Discount %");
            end;
        }
        field(151; "Quote No."; Code[20])
        {
            Caption = 'Quote No.';
            Editable = false;
        }
        field(160; "Job Queue Status"; Option)
        {
            Caption = 'Job Queue Status';
            Editable = false;
            OptionCaption = ' ,Scheduled for Posting,Error,Posting';
            OptionMembers = " ","Scheduled for Posting",Error,Posting;

            trigger OnLookup()
            var
                JobQueueEntry: Record "Job Queue Entry";
            begin
                if "Job Queue Status" = "Job Queue Status"::" " then
                    exit;
                JobQueueEntry.ShowStatusMsg("Job Queue Entry ID");
            end;
        }
        field(161; "Job Queue Entry ID"; Guid)
        {
            Caption = 'Job Queue Entry ID';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(825; "Authorization Required"; Boolean)
        {
            Caption = 'Authorization Required';
        }
        field(827; "Credit Card No."; Code[20])
        {
            Caption = 'Credit Card No.';
            //TableRelation = "DO Payment Credit Card" WHERE("Customer No." = FIELD("Bill-to Customer No.")); //LKS-Raj Commented (Table missig need to check)

            trigger OnValidate()
            begin
                //DOPaymentTransLogMgt.ValidateHasNoValidTransactions("Document Type", Format("Document Type"), "No.");//LKS-Raj Commented (Codeunit Missing)

                if "Credit Card No." = '' then
                    exit;

                //LKS-Raj Commented (Codeunit Missing)
                // DOPaymentMgt.CheckCreditCardData("Credit Card No.");

                // if not DOPaymentMgt.IsValidPaymentMethod("Payment Method Code") then
                //     FieldError("Payment Method Code");
                //LKS-Raj Commented (Codeunit Missing)
            end;
        }
        field(5043; "No. of Archived Versions"; Integer)
        {
            CalcFormula = Max("Sales Header Archive"."Version No." WHERE("Document Type" = FIELD("Document Type"),
                                                                          "No." = FIELD("No."),
                                                                          "Doc. No. Occurrence" = FIELD("Doc. No. Occurrence")));
            Caption = 'No. of Archived Versions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5048; "Doc. No. Occurrence"; Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }
        field(5050; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;

            trigger OnValidate()
            begin
                CreateDim(
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::Customer, "Bill-to Customer No.",
                  DATABASE::"Salesperson/Purchaser", "Salesperson Code",
                  DATABASE::"Responsibility Center", "Responsibility Center",
                  DATABASE::"Customer Template", "Bill-to Customer Template Code");
            end;
        }
        field(5051; "Sell-to Customer Template Code"; Code[10])
        {
            Caption = 'Sell-to Customer Template Code';
            TableRelation = "Customer Template";

            trigger OnValidate()
            var
                SellToCustTemplate: Record "Customer Template";
            begin
                TestField("Document Type", "Document Type"::Quote);
                TestField(Status, Status::Open);

                if not InsertMode and
                   ("Sell-to Customer Template Code" <> xRec."Sell-to Customer Template Code") and
                   (xRec."Sell-to Customer Template Code" <> '')
                then begin
                    if HideValidationDialog then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text004, false, FieldCaption("Sell-to Customer Template Code"));
                    if Confirmed then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if "Sell-to Customer Template Code" = '' then begin
                            if not SalesLine.IsEmpty then
                                Error(Text005, FieldCaption("Sell-to Customer Template Code"));
                            Init;
                            SalesSetup.Get;
                            InitRecord;
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
                            exit;
                        end;
                    end else begin
                        "Sell-to Customer Template Code" := xRec."Sell-to Customer Template Code";
                        exit;
                    end;
                end;

                if SellToCustTemplate.Get("Sell-to Customer Template Code") then begin
                    SellToCustTemplate.TestField("Gen. Bus. Posting Group");
                    "Gen. Bus. Posting Group" := SellToCustTemplate."Gen. Bus. Posting Group";
                    "VAT Bus. Posting Group" := SellToCustTemplate."VAT Bus. Posting Group";
                    if "Bill-to Customer No." = '' then
                        Validate("Bill-to Customer Template Code", "Sell-to Customer Template Code");
                end;

                if not InsertMode and
                   ((xRec."Sell-to Customer Template Code" <> "Sell-to Customer Template Code") or
                    (xRec."Currency Code" <> "Currency Code"))
                then
                    RecreateSalesLines(FieldCaption("Sell-to Customer Template Code"));
            end;
        }
        field(5052; "Sell-to Contact No."; Code[20])
        {
            Caption = 'Sell-to Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusinessRelation: Record "Contact Business Relation";
            begin
                //TEAM::1426/02
                /*
                IF "Sell-to Customer No." <> '' THEN BEGIN
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
                END;
                */
                if "Sell-to Contact No." <> '' then
                    if Cont.Get("Sell-to Contact No.") then;
                if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
                    xRec := Rec;
                    Validate("Sell-to Contact No.", Cont."No.");
                end;

            end;

            trigger OnValidate()
            var
                ContBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                Opportunity: Record Opportunity;
            begin
                TestField(Status, Status::Open);

                if ("Sell-to Contact No." <> xRec."Sell-to Contact No.") and
                   (xRec."Sell-to Contact No." <> '')
                then begin
                    if ("Sell-to Contact No." = '') and ("Opportunity No." <> '') then
                        Error(Text049, FieldCaption("Sell-to Contact No."));
                    if HideValidationDialog or not GuiAllowed then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text004, false, FieldCaption("Sell-to Contact No."));
                    if Confirmed then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if ("Sell-to Contact No." = '') and ("Sell-to Customer No." = '') then begin
                            if not SalesLine.IsEmpty then
                                Error(Text005, FieldCaption("Sell-to Contact No."));
                            Init;
                            SalesSetup.Get;
                            InitRecord;
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
                            exit;
                        end;
                        if "Opportunity No." <> '' then begin
                            Opportunity.Get("Opportunity No.");
                            if Opportunity."Contact No." <> "Sell-to Contact No." then begin
                                Modify;
                                Opportunity.Validate("Contact No.", "Sell-to Contact No.");
                                Opportunity.Modify;
                            end
                        end;
                    end else begin
                        Rec := xRec;
                        exit;
                    end;
                end;

                if ("Sell-to Customer No." <> '') and ("Sell-to Contact No." <> '') then begin
                    Cont.Get("Sell-to Contact No.");
                    ContBusinessRelation.Reset;
                    ContBusinessRelation.SetCurrentKey("Link to Table", "No.");
                    ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
                    ContBusinessRelation.SetRange("No.", "Sell-to Customer No.");
                    if ContBusinessRelation.FindFirst then
                        if ContBusinessRelation."Contact No." <> Cont."Company No." then
                            Error(Text038, Cont."No.", Cont.Name, "Sell-to Customer No.");
                end;

                UpdateSellToCust("Sell-to Contact No.");
            end;
        }
        field(5053; "Bill-to Contact No."; Code[20])
        {
            Caption = 'Bill-to Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusinessRelation: Record "Contact Business Relation";
            begin
                //TEAM::1426/02
                /*
                IF "Bill-to Customer No." <> '' THEN BEGIN
                  IF Cont.GET("Bill-to Contact No.") THEN
                    Cont.SETRANGE("Company No.",Cont."Company No.")
                  ELSE BEGIN
                    ContBusinessRelation.RESET;
                    ContBusinessRelation.SETCURRENTKEY("Link to Table","No.");
                    ContBusinessRelation.SETRANGE("Link to Table",ContBusinessRelation."Link to Table"::Customer);
                    ContBusinessRelation.SETRANGE("No.","Bill-to Customer No.");
                    IF ContBusinessRelation.FINDFIRST THEN
                      Cont.SETRANGE("Company No.",ContBusinessRelation."Contact No.")
                    ELSE
                      Cont.SETRANGE("No.",'');
                  END;
                END;
                */
                if "Bill-to Contact No." <> '' then
                    if Cont.Get("Bill-to Contact No.") then;
                if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
                    xRec := Rec;
                    Validate("Bill-to Contact No.", Cont."No.");
                end;

            end;

            trigger OnValidate()
            var
                ContBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
            begin
                if Cont.Get("Bill-to Contact No.") then
                    //TEAM::1426/02
                    "Ship-to Code" := Cont."Office ID";
                Validate("Ship-to Code", Cont."Office ID");
                "Ship-to Contact" := Cont.Initials + ' ' + Cont."F Name" + ' ' + Cont."M Name" + ' ' + Cont."L Name";
                //TEAM::1426/02
                /*
                TESTFIELD(Status,Status::Open);
                
                IF ("Bill-to Contact No." <> xRec."Bill-to Contact No.") AND
                   (xRec."Bill-to Contact No." <> '')
                THEN BEGIN
                  IF HideValidationDialog THEN
                    Confirmed := TRUE
                  ELSE
                    Confirmed := CONFIRM(Text004,FALSE,FIELDCAPTION("Bill-to Contact No."));
                  IF Confirmed THEN BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type","Document Type");
                    SalesLine.SETRANGE("Document No.","No.");
                    IF ("Bill-to Contact No." = '') AND ("Bill-to Customer No." = '') THEN BEGIN
                      IF NOT SalesLine.ISEMPTY THEN
                        ERROR(Text005,FIELDCAPTION("Bill-to Contact No."));
                      INIT;
                      SalesSetup.GET;
                      InitRecord;
                      "No. Series" := xRec."No. Series";
                      IF xRec."Shipping No." <> '' THEN BEGIN
                        "Shipping No. Series" := xRec."Shipping No. Series";
                        "Shipping No." := xRec."Shipping No.";
                      END;
                      IF xRec."Posting No." <> '' THEN BEGIN
                        "Posting No. Series" := xRec."Posting No. Series";
                        "Posting No." := xRec."Posting No.";
                      END;
                      IF xRec."Return Receipt No." <> '' THEN BEGIN
                        "Return Receipt No. Series" := xRec."Return Receipt No. Series";
                        "Return Receipt No." := xRec."Return Receipt No.";
                      END;
                      IF xRec."Prepayment No." <> '' THEN BEGIN
                        "Prepayment No. Series" := xRec."Prepayment No. Series";
                        "Prepayment No." := xRec."Prepayment No.";
                      END;
                      IF xRec."Prepmt. Cr. Memo No." <> '' THEN BEGIN
                        "Prepmt. Cr. Memo No. Series" := xRec."Prepmt. Cr. Memo No. Series";
                        "Prepmt. Cr. Memo No." := xRec."Prepmt. Cr. Memo No.";
                      END;
                      EXIT;
                    END;
                  END ELSE BEGIN
                    "Bill-to Contact No." := xRec."Bill-to Contact No.";
                    EXIT;
                  END;
                END;
                
                IF ("Bill-to Customer No." <> '') AND ("Bill-to Contact No." <> '') THEN BEGIN
                  Cont.GET("Bill-to Contact No.");
                  ContBusinessRelation.RESET;
                  ContBusinessRelation.SETCURRENTKEY("Link to Table","No.");
                  ContBusinessRelation.SETRANGE("Link to Table",ContBusinessRelation."Link to Table"::Customer);
                  ContBusinessRelation.SETRANGE("No.","Bill-to Customer No.");
                  IF ContBusinessRelation.FINDFIRST THEN
                    IF ContBusinessRelation."Contact No." <> Cont."Company No." THEN
                      ERROR(Text038,Cont."No.",Cont.Name,"Bill-to Customer No.");
                END;
                
                UpdateBillToCust("Bill-to Contact No.");
                */

            end;
        }
        field(5054; "Bill-to Customer Template Code"; Code[10])
        {
            Caption = 'Bill-to Customer Template Code';
            TableRelation = "Customer Template";

            trigger OnValidate()
            var
                BillToCustTemplate: Record "Customer Template";
            begin
                TestField("Document Type", "Document Type"::Quote);
                TestField(Status, Status::Open);

                if not InsertMode and
                   ("Bill-to Customer Template Code" <> xRec."Bill-to Customer Template Code") and
                   (xRec."Bill-to Customer Template Code" <> '')
                then begin
                    if HideValidationDialog then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text004, false, FieldCaption("Bill-to Customer Template Code"));
                    if Confirmed then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if "Bill-to Customer Template Code" = '' then begin
                            if not SalesLine.IsEmpty then
                                Error(Text005, FieldCaption("Bill-to Customer Template Code"));
                            Init;
                            SalesSetup.Get;
                            InitRecord;
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
                            exit;
                        end;
                    end else begin
                        "Bill-to Customer Template Code" := xRec."Bill-to Customer Template Code";
                        exit;
                    end;
                end;

                Validate("Ship-to Code", '');
                if BillToCustTemplate.Get("Bill-to Customer Template Code") then begin
                    BillToCustTemplate.TestField("Customer Posting Group");
                    "Customer Posting Group" := BillToCustTemplate."Customer Posting Group";
                    "Invoice Disc. Code" := BillToCustTemplate."Invoice Disc. Code";
                    "Customer Price Group" := BillToCustTemplate."Customer Price Group";
                    "Customer Disc. Group" := BillToCustTemplate."Customer Disc. Group";
                    "Allow Line Disc." := BillToCustTemplate."Allow Line Disc.";
                    Validate("Payment Terms Code", BillToCustTemplate."Payment Terms Code");
                    Validate("Payment Method Code", BillToCustTemplate."Payment Method Code");
                    "Shipment Method Code" := BillToCustTemplate."Shipment Method Code";
                end;

                CreateDim(
                  DATABASE::"Customer Template", "Bill-to Customer Template Code",
                  DATABASE::"Salesperson/Purchaser", "Salesperson Code",
                  DATABASE::Customer, "Bill-to Customer No.",
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::"Responsibility Center", "Responsibility Center");

                if not InsertMode and
                   (xRec."Sell-to Customer Template Code" = "Sell-to Customer Template Code") and
                   (xRec."Bill-to Customer Template Code" <> "Bill-to Customer Template Code")
                then
                    RecreateSalesLines(FieldCaption("Bill-to Customer Template Code"));
            end;
        }
        field(5055; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = IF ("Document Type" = FILTER(<> Order)) Opportunity."No." WHERE("Contact No." = FIELD("Sell-to Contact No."),
                                                                                          Closed = CONST(false))
            ELSE
            IF ("Document Type" = CONST(Order)) Opportunity."No." WHERE("Contact No." = FIELD("Sell-to Contact No."),
                                                                                                                                                          "Sales Document No." = FIELD("No."),
                                                                                                                                                          "Sales Document Type" = CONST(Order));

            trigger OnValidate()
            var
                Opportunity: Record Opportunity;
                SalesHeader: Record "Sales Header";
            begin
                if xRec."Opportunity No." <> "Opportunity No." then begin
                    if "Opportunity No." <> '' then
                        if Opportunity.Get("Opportunity No.") then begin
                            Opportunity.TestField(Status, Opportunity.Status::"In Progress");
                            if Opportunity."Sales Document No." <> '' then begin
                                if Confirm(Text048, false, Opportunity."Sales Document No.", Opportunity."No.") then begin
                                    if SalesHeader.Get("Document Type"::Quote, Opportunity."Sales Document No.") then begin
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
            end;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if not UserSetupMgt.CheckRespCenter(0, "Responsibility Center") then
                    Error(
                      Text027,
                      RespCenter.TableCaption, UserSetupMgt.GetSalesFilter);

                "Location Code" := UserSetupMgt.GetLocation(0, '', "Responsibility Center");
                if "Location Code" <> '' then begin
                    if Location.Get("Location Code") then
                        "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                end else begin
                    if InvtSetup.Get then
                        "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
                end;

                UpdateShipToAddress;

                CreateDim(
                  DATABASE::"Responsibility Center", "Responsibility Center",
                  DATABASE::Customer, "Bill-to Customer No.",
                  DATABASE::"Salesperson/Purchaser", "Salesperson Code",
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::"Customer Template", "Bill-to Customer Template Code");

                if xRec."Responsibility Center" <> "Responsibility Center" then begin
                    RecreateSalesLines(FieldCaption("Responsibility Center"));
                    "Assigned User ID" := '';
                end;
            end;
        }
        field(5750; "Shipping Advice"; Option)
        {
            Caption = 'Shipping Advice';
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if InventoryPickConflict("Document Type", "No.", "Shipping Advice") then
                    Error(Text066, FieldCaption("Shipping Advice"), Format("Shipping Advice"), TableCaption);
                if WhseShpmntConflict("Document Type", "No.", "Shipping Advice") then
                    Error(StrSubstNo(Text070, FieldCaption("Shipping Advice"), Format("Shipping Advice"), TableCaption));
                //WhseSourceHeader.SalesHeaderVerifyChange(Rec,xRec);
            end;
        }
        field(5751; "Shipped Not Invoiced"; Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE("Document Type" = FIELD("Document Type"),
                                                    "Document No." = FIELD("No."),
                                                    "Qty. Shipped Not Invoiced" = FILTER(<> 0)));
            Caption = 'Shipped Not Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752; "Completely Shipped"; Boolean)
        {
            CalcFormula = Min("Sales Line"."Completely Shipped" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "Document No." = FIELD("No."),
                                                                       Type = FILTER(<> " "),
                                                                       "Location Code" = FIELD("Location Filter")));
            Caption = 'Completely Shipped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5753; "Posting from Whse. Ref."; Integer)
        {
            Caption = 'Posting from Whse. Ref.';
        }
        field(5754; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if "Promised Delivery Date" <> 0D then
                    Error(
                      Text028,
                      FieldCaption("Requested Delivery Date"),
                      FieldCaption("Promised Delivery Date"));

                if "Requested Delivery Date" <> xRec."Requested Delivery Date" then
                    UpdateSalesLines(FieldCaption("Requested Delivery Date"), CurrFieldNo <> 0);
            end;
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if "Promised Delivery Date" <> xRec."Promised Delivery Date" then
                    UpdateSalesLines(FieldCaption("Promised Delivery Date"), CurrFieldNo <> 0);
            end;
        }
        field(5792; "Shipping Time"; DateFormula)
        {
            Caption = 'Shipping Time';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if "Shipping Time" <> xRec."Shipping Time" then
                    UpdateSalesLines(FieldCaption("Shipping Time"), CurrFieldNo <> 0);
            end;
        }
        field(5793; "Outbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                if ("Outbound Whse. Handling Time" <> xRec."Outbound Whse. Handling Time") and
                   (xRec."Sell-to Customer No." = "Sell-to Customer No.")
                then
                    UpdateSalesLines(FieldCaption("Outbound Whse. Handling Time"), CurrFieldNo <> 0);
            end;
        }
        field(5794; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                GetShippingTime(FieldNo("Shipping Agent Service Code"));
                UpdateSalesLines(FieldCaption("Shipping Agent Service Code"), CurrFieldNo <> 0);
            end;
        }
        field(5795; "Late Order Shipping"; Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE("Document Type" = FIELD("Document Type"),
                                                    "Sell-to Customer No." = FIELD("Sell-to Customer No."),
                                                    "Document No." = FIELD("No."),
                                                    "Shipment Date" = FIELD("Date Filter"),
                                                    "Outstanding Quantity" = FILTER(<> 0)));
            Caption = 'Late Order Shipping';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5796; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5800; Receive; Boolean)
        {
            Caption = 'Receive';
        }
        field(5801; "Return Receipt No."; Code[20])
        {
            Caption = 'Return Receipt No.';
        }
        field(5802; "Return Receipt No. Series"; Code[10])
        {
            Caption = 'Return Receipt No. Series';
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                with SalesHeader do begin
                    //  SalesHeader := Rec;
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Return Receipt Nos.");
                    if NoSeriesMgt.LookupSeries(SalesSetup."Posted Return Receipt Nos.", "Return Receipt No. Series") then
                        Validate("Return Receipt No. Series");
                    //  Rec := SalesHeader;
                end;
            end;

            trigger OnValidate()
            begin
                if "Return Receipt No. Series" <> '' then begin
                    SalesSetup.Get;
                    SalesSetup.TestField("Posted Return Receipt Nos.");
                    NoSeriesMgt.TestSeries(SalesSetup."Posted Return Receipt Nos.", "Return Receipt No. Series");
                end;
                TestField("Return Receipt No.", '');
            end;
        }
        field(5803; "Last Return Receipt No."; Code[20])
        {
            Caption = 'Last Return Receipt No.';
            Editable = false;
            TableRelation = "Return Receipt Header";
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                MessageIfSalesLinesExist(FieldCaption("Allow Line Disc."));
            end;
        }
        field(7200; "Get Shipment Used"; Boolean)
        {
            Caption = 'Get Shipment Used';
            Editable = false;
        }
        field(9000; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";


            //TBD
            /*
            trigger OnValidate()
            begin
                if not UserSetupMgt.CheckRespCenter2(0, "Responsibility Center", "Assigned User ID") then
                    Error(
                      Text061, "Assigned User ID",
                      RespCenter.TableCaption, UserSetupMgt.GetSalesFilter2("Assigned User ID"));
            end;
            */
        }
        field(13701; "Assessee Code"; Code[10])
        {
            Caption = 'Assessee Code';
            TableRelation = "Assessee Code";

            trigger OnValidate()
            begin
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.Find('-') then begin
                    SalesLine."Assessee Code" := "Assessee Code";
                    SalesLine.Modify;
                    Modify;
                end;
            end;
        }
        field(13706; "Excise Bus. Posting Group"; Code[10])
        {
            Caption = 'Excise Bus. Posting Group';
            //TableRelation = "Excise Bus. Posting Group";
        }
        field(13731; "Amount to Customer"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            //LKS-Raj Commented (Amount To Customer have to map with different field)
            // CalcFormula = Sum("Sales Line"."Amount To Customer" WHERE("Document Type" = FIELD("Document Type"),
            //                                                            "Document No." = FIELD("No.")));
            //LKS-Raj Commented 
            Caption = 'Amount to Customer';
            Editable = false;
            //FieldClass = FlowField;
        }
        field(13736; "Bill to Customer State"; Code[10])
        {
            Caption = 'Bill to Customer State';
            TableRelation = State;
        }
        field(13737; "Form Code"; Code[10])
        {
            Caption = 'Form Code';
            //LKS-Raj Commented (Table missig need to check)
            // TableRelation = "State Forms"."Form Code" WHERE(State = FIELD(State),
            //                                                  "Transit Document" = CONST(false));
            //LKS-Raj Commented (Table missig need to check)
            trigger OnLookup()
            begin
                // PS49427.Begin
                //StateForms.LookupStateForm(State, "Form Code");//LKS-Raj Commented (Table Missing)
                // PS49427.End
                // VSTF214377.begin
                Validate("Form Code");
                // VSTF214377.end
            end;

            trigger OnValidate()
            begin
                TaxLiableUpdate;
                UpdateSalesLines(FieldCaption("Form Code"), CurrFieldNo <> 0);
            end;
        }
        field(13738; "Form No."; Code[10])
        {
            Caption = 'Form No.';

            trigger OnValidate()
            begin
                TaxLiableUpdate;
            end;
        }
        field(13751; "Transit Document"; Boolean)
        {
            Caption = 'Transit Document';
        }
        field(13752; State; Code[10])
        {
            Caption = 'State';
            TableRelation = State;
        }
        field(13753; "LC No."; Code[20])
        {
            Caption = 'LC No.';
            //LKS-Raj Commented (LC Detail Table Missing)
            // TableRelation = "LC Detail"."No." WHERE("Transaction Type" = CONST(Sale),
            //                                          "Issued To/Received From" = FIELD("Bill-to Customer No."),
            //                                          Closed = CONST(false),
            //                                          Released = CONST(true));
            //LKS-Raj Commented
            trigger OnValidate()
            var
                //LCDetail: Record "LC Detail";//LKS-Raj Commented (LC Detail Table Missing)
                Text13700: Label 'The LC which you have selected is Foreign type you cannot utilise for this order.';
            begin
                if "LC No." <> '' then begin
                    //LKS-Raj Commented (LC Detail Table Missing)
                    // LCDetail.Get("LC No.");
                    // if LCDetail."Type of LC" = LCDetail."Type of LC"::Foreign then
                    //LKS-Raj Commented 
                    if "Currency Code" = '' then
                        Error(Text13700);
                end;
            end;
        }
        field(13790; Structure; Code[10])
        {
            Caption = 'Structure';
            //TableRelation = "Structure Header";//LKS-Raj Commented 

            trigger OnValidate()
            var
                //StrDetails: Record "Structure Details";//LKS-Raj Commented (Table missing)
                //StrOrderDetails: Record "Structure Order Details";//LKS-Raj Commented (Table missing)
                //StrOrderLines: Record "Structure Order Line Details";//LKS-Raj Commented (Table missing)
                SaleLines: Record "Sales Line";
            begin
                //LKS-Raj Commented (Table missing)
                // StrOrderDetails.SetCurrentKey("Document Type", "Document No.", Type);
                // StrOrderDetails.SetRange(Type, StrOrderDetails.Type::Sale);
                // StrOrderDetails.SetRange("Document Type", "Document Type");
                // StrOrderDetails.SetRange("Document No.", "No.");
                // StrOrderDetails.SetRange("Price Inclusive of Tax", false);
                // if StrOrderDetails.FindFirst then
                //     StrOrderDetails.DeleteAll;

                // StrOrderLines.SetCurrentKey("Document Type", "Document No.", Type);
                // StrOrderLines.SetRange(Type, StrOrderLines.Type::Sale);
                // StrOrderLines.SetRange("Document Type", "Document Type");
                // StrOrderLines.SetRange("Document No.", "No.");
                // StrOrderLines.SetRange("Price Inclusive of Tax", false);
                // if StrOrderLines.FindFirst then
                //     StrOrderLines.DeleteAll;
                //LKS-Raj Commented (Table missing)
                SaleLines.SetRange("Document Type", "Document Type");
                SaleLines.SetRange("Document No.", "No.");
                SaleLines.SetFilter(Type, '<>%1', SaleLines.Type::" ");
                SaleLines.SetRange("Price Inclusive of Tax", false);
                if SaleLines.Find('-') then
                    repeat
                        //LKS-Raj Commented (Field missing)
                        // // IN0001.begin
                        // SaleLines."Service Tax Base" := 0;
                        // SaleLines."Charges To Customer" := 0;
                        // // IN0001.end
                        // SaleLines."Amount Added to Excise Base" := 0;
                        // SaleLines."Amount Added to Tax Base" := 0;
                        // SaleLines."Excise Amount" := 0;
                        //LKS-Raj Commented (Field missing)
                        SaleLines."VAT Base Amount" := 0;
                        SaleLines.Validate("Tax Liable", false);
                        SaleLines.UpdateAmounts;
                        //   SaleLines.GetStandardDeduction(Rec);
                        SaleLines.Modify;
                    until SaleLines.Next = 0;

                GetGLSetup;
                PoT := false;
                // IN0002.end
                //LKS-Raj Commented (Table missing)
                // StrDetails.SetRange(Code, Structure);
                // if StrDetails.Find('-') then
                //     repeat
                //         StrOrderDetails.Type := StrOrderDetails.Type::Sale;
                //         StrOrderDetails."Document Type" := "Document Type";
                //         StrOrderDetails."Document No." := "No.";
                //         StrOrderDetails."Structure Code" := Structure;
                //         StrOrderDetails."Calculation Order" := StrDetails."Calculation Order";
                //         StrOrderDetails."Tax/Charge Type" := StrDetails.Type;
                //         StrOrderDetails."Tax/Charge Group" := StrDetails."Tax/Charge Group";
                //         StrOrderDetails."Tax/Charge Code" := StrDetails."Tax/Charge Code";
                //         StrOrderDetails."Calculation Type" := StrDetails."Calculation Type";
                //         StrOrderDetails."Calculation Value" := StrDetails."Calculation Value";
                //         StrOrderDetails."Quantity Per" := StrDetails."Quantity Per";
                //         StrOrderDetails."Loading on Inventory" := StrDetails."Loading on Inventory";
                //         StrOrderDetails."% Loading on Inventory" := StrDetails."% Loading on Inventory";
                //         StrOrderDetails."Payable to Third Party" := StrDetails."Payable to Third Party";
                //         StrOrderDetails."Account No." := StrDetails."Account No.";
                //         StrOrderDetails."Base Formula" := StrDetails."Base Formula";
                //         StrOrderDetails."Include Base" := StrDetails."Include Base";
                //         StrOrderDetails."Include Line Discount" := StrDetails."Include Line Discount";
                //         StrOrderDetails."Include Invoice Discount" := StrDetails."Include Invoice Discount";
                //         StrOrderDetails."Charge Basis" := StrDetails."Charge Basis";
                //         StrOrderDetails."Header/Line" := StrDetails."Header/Line";
                //         StrOrderDetails."Available for VAT Input" := StrDetails."Available for VAT Input";
                //         StrOrderDetails.CVD := StrDetails.CVD;
                //         StrOrderDetails.Insert;
                //         // IN0002.begin
                //         if not PoT then
                //             if StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Service Tax" then
                //                 PoT := GLSetup.PoT;
                //     // IN0002.end
                //     until StrDetails.Next = 0;

                // // IN0062.begin
                // if "Applies-to Doc. No." = '' then begin
                //     StrDetails.SetRange(Type, StrDetails.Type::"Service Tax");
                //     if StrDetails.FindFirst then begin
                //         GLSetup.Get;
                //         "Service Tax Rounding Precision" := GLSetup."Service Tax Rounding Precision";
                //         "Service Tax Rounding Type" := GLSetup."Service Tax Rounding Type";
                //     end else begin
                //         "Service Tax Rounding Precision" := 0;
                //         "Service Tax Rounding Type" := "Service Tax Rounding Type"::Nearest;
                //     end;
                // end;
                // // IN0062.end
                //LKS-Raj Commented (Table missing)
            end;
        }
        field(16410; "Free Supply"; Boolean)
        {
            Caption = 'Free Supply';

            trigger OnValidate()
            begin
                FreeSupplyUpdate;
                CalcFields("Price Inclusive of Taxes");
                if "Price Inclusive of Taxes" then
                    TestField("Free Supply", false);
            end;
        }
        field(16411; "Export or Deemed Export"; Boolean)
        {
            Caption = 'Export or Deemed Export';
            Editable = false;

            trigger OnValidate()
            begin
                CalcFields("Price Inclusive of Taxes");
                if "Price Inclusive of Taxes" then
                    TestField("Export or Deemed Export", false);
            end;
        }
        field(16412; "VAT Exempted"; Boolean)
        {
            Caption = 'VAT Exempted';
            Editable = false;

            trigger OnValidate()
            begin
                CalcFields("Price Inclusive of Taxes");
                if "Price Inclusive of Taxes" then
                    TestField("VAT Exempted", false);
            end;
        }
        field(16501; Trading; Boolean)
        {
            Caption = 'Trading';

            trigger OnValidate()
            begin
                SalesSetup.Get;
                InitRecord;
            end;
        }
        field(16502; "Transaction No. Serv. Tax"; Integer)
        {
            Caption = 'Transaction No. Serv. Tax';
        }
        field(16503; "Re-Dispatch"; Boolean)
        {
            Caption = 'Re-Dispatch';
        }
        field(16504; "Return Re-Dispatch Rcpt. No."; Code[20])
        {
            Caption = 'Return Re-Dispatch Rcpt. No.';

            trigger OnLookup()
            var
                ReturnRcptLine: Record "Return Receipt Line";
            begin
                ReturnRcptLine.Reset;
                //LKS-Raj Commented (Field missing)
                // ReturnRcptLine.SetCurrentKey("Qty. to be Re-Dispatched", "Location Code");
                // ReturnRcptLine.SetFilter("Qty. to be Re-Dispatched", '>%1', 0);
                //LKS-Raj Commented (Field missing)
                ReturnRcptLine.SetFilter("Location Code", "Location Code");
                if PAGE.RunModal(0, ReturnRcptLine) = ACTION::LookupOK then begin
                    "Return Re-Dispatch Rcpt. No." := ReturnRcptLine."Document No.";
                    Modify;
                    Validate("Return Re-Dispatch Rcpt. No.");
                end;
            end;

            trigger OnValidate()
            var
                ReturnRcptLine: Record "Return Receipt Line";
                LineNo: Integer;
            begin
                SalesLine.Reset;
                SalesLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
                SalesLine.SetRange("Document No.", "No.");
                SalesLine.SetRange("Document Type", "Document Type");
                //SalesLine.SetRange("Re-Dispatch", true);//LKS-Raj Commented (Field missing)
                SalesLine.DeleteAll;

                ReturnRcptLine.Reset;
                ReturnRcptLine.SetRange("Document No.", "Return Re-Dispatch Rcpt. No.");
                ReturnRcptLine.SetFilter(Type, '<>%1', ReturnRcptLine.Type::" ");
                if ReturnRcptLine.FindSet then
                    repeat
                        LineNo := 10000;
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", "Document Type");
                        SalesLine.SetRange("Document No.", "No.");
                        if SalesLine.FindLast then
                            LineNo := SalesLine."Line No." + 10000;

                        SalesLine.Init;
                        SalesLine.Validate("Document Type", "Document Type");
                        SalesLine.Validate("Document No.", "No.");
                        SalesLine."Line No." := LineNo;
                        SalesLine.Insert;
                        SalesLine.Validate(Type, ReturnRcptLine.Type);
                        SalesLine.Validate("No.", ReturnRcptLine."No.");
                        //LKS-Raj Commented (Field missing)
                        //SalesLine.Validate("Variant Code", ReturnRcptLine."Variant Code");
                        //SalesLine.Validate("Unit of Measure Code", ReturnRcptLine."Unit of Measure Code");
                        //LKS-Raj Commented (Field missing)
                        SalesLine.Validate("Location Code", ReturnRcptLine."Location Code");
                        //LKS-Raj Commented (Field missing)
                        // SalesLine.Validate(Quantity, ReturnRcptLine."Qty. to be Re-Dispatched");
                        // SalesLine.Validate("Re-Dispatch", "Re-Dispatch");
                        // SalesLine.Validate("Return Rcpt Line No.", ReturnRcptLine."Line No.");
                        //LKS-Raj Commented (Field missing)
                        SalesLine.Validate("Unit Price", ReturnRcptLine."Unit Price");
                        //SalesLine.Validate("Return Re-Dispatch Rcpt. No.", "Return Re-Dispatch Rcpt. No.");//LKS-Raj Commented (Field missing)
                        SalesLine.Modify;
                    until ReturnRcptLine.Next = 0;
            end;
        }
        field(16505; "TDS Certificate Receivable"; Boolean)
        {
            Caption = 'TDS Certificate Receivable';
        }
        field(16508; "Price Inclusive of Taxes"; Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE("Document Type" = FIELD("Document Type"),
                                                    "Document No." = FIELD("No."),
                                                    Type = FILTER(Item),
                                                    "Price Inclusive of Tax" = FILTER(true)));
            Caption = 'Price Inclusive of Taxes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16509; "Calc. Inv. Discount (%)"; Boolean)
        {
            Caption = 'Calc. Inv. Discount (%)';

            trigger OnValidate()
            var
                SalesLine2: Record "Sales Line";
            begin
                CalcFields("Price Inclusive of Taxes");
                if "Price Inclusive of Taxes" and (not "Calc. Inv. Discount (%)") then begin
                    SalesLine2.Reset;
                    SalesLine2.SetRange("Document Type", "Document Type");
                    SalesLine2.SetRange("Document No.", "No.");
                    if SalesLine2.FindSet then
                        repeat
                            SalesLine2."Inv. Discount Amount" := 0;
                            SalesLine2."Inv. Disc. Amount to Invoice" := 0;
                            //LKS-Raj Commented (Field missing)
                            // SalesLine2."Inv Discount Fixed" := 0;
                            // SalesLine2."Inv Discount Variable" := 0;
                            //LKS-Raj Commented (Field missing)
                            SalesLine2.Modify;
                        until SalesLine2.Next = 0;
                end;
            end;
        }
        field(16510; "Time of Removal"; Time)
        {
            Caption = 'Time of Removal';
        }
        field(16511; "LR/RR No."; Code[20])
        {
            Caption = 'LR/RR No.';
        }
        field(16512; "LR/RR Date"; Date)
        {
            Caption = 'LR/RR Date';
        }
        field(16513; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
        }
        field(16514; "Mode of Transport"; Text[15])
        {
            Caption = 'Mode of Transport';
        }
        field(16515; "ST Pure Agent"; Boolean)
        {
            Caption = 'ST Pure Agent';
        }
        field(16516; "Nature of Services"; Option)
        {
            Caption = 'Nature of Services';
            OptionCaption = ' ,Exempted,Export';
            OptionMembers = " ",Exempted,Export;
        }
        field(16522; "Service Tax Rounding Precision"; Decimal)
        {
            Caption = 'Service Tax Rounding Precision';

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                // PS39773.begin
                // IF ("Applies-to Doc. Type" = "Applies-to Doc. Type"::Payment) AND ("Applies-to Doc. No." <> '') AND
                // ("Transaction No. Serv. Tax" <> 0)
                // THEN
                // FIELDERROR("Service Tax Rounding Precision");
                // PS39773.end
            end;
        }
        field(16523; "Service Tax Rounding Type"; Option)
        {
            Caption = 'Service Tax Rounding Type';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                // PS39773.begin
                // IF ("Applies-to Doc. Type" = "Applies-to Doc. Type"::Payment) AND ("Applies-to Doc. No." <> '') AND
                // ("Transaction No. Serv. Tax" <> 0)
                // THEN
                // FIELDERROR("Service Tax Rounding Type");
                // PS39773.end
            end;
        }
        field(16524; "Sale Return Type"; Option)
        {
            Caption = 'Sale Return Type';
            OptionCaption = ' ,Sales Cancellation';
            OptionMembers = " ","Sales Cancellation";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(16525; PoT; Boolean)
        {
            Caption = 'PoT';
        }
        field(50000; "Bill Description"; Text[250])
        {
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
        field(50005; "Confirmation Reference"; Text[250])
        {
        }
        field(50006; "RTB Type"; Text[30])
        {
        }
        field(50007; Cancelled; Boolean)
        {
        }
        field(50008; "Invoice Type"; Option)
        {
            OptionCaption = ',TAXABLE,NON-TAXABLE,MIXED';
            OptionMembers = ,TAXABLE,"NON-TAXABLE",MIXED;
        }
        field(50009; "State Name"; Text[30])
        {
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
    }

    keys
    {
        key(Key1; "Document Type", "No.")
        {
            Clustered = true;
        }
        key(Key2; "No.", "Document Type")
        {
        }
        key(Key3; "Document Type", "Sell-to Customer No.")
        {
        }
        key(Key4; "Document Type", "Bill-to Customer No.")
        {
        }
        key(Key5; "Document Type", "Combine Shipments", "Bill-to Customer No.", "Currency Code", "EU 3-Party Trade")
        {
        }
        key(Key6; "Sell-to Customer No.", "External Document No.")
        {
        }
        key(Key7; "Document Type", "Sell-to Contact No.")
        {
        }
        key(Key8; "Bill-to Contact No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        Opp: Record Opportunity;
        TempOpportunityEntry: Record "Opportunity Entry" temporary;
    begin
        //DOPaymentTransLogMgt.ValidateCanDeleteDocument("Payment Method Code", "Document Type", Format("Document Type"), "No.");//LKS-Raj Commented (Codeunit Missing)

        if not UserSetupMgt.CheckRespCenter(0, "Responsibility Center") then
            Error(
              Text022,
              RespCenter.TableCaption, UserSetupMgt.GetSalesFilter);

        if ("Opportunity No." <> '') and
           ("Document Type" in ["Document Type"::Quote, "Document Type"::Order])
        then begin
            if Opp.Get("Opportunity No.") then begin
                if "Document Type" = "Document Type"::Order then begin
                    if not Confirm(Text040, true) then
                        Error(Text044);
                    TempOpportunityEntry.Init;
                    TempOpportunityEntry.Validate("Opportunity No.", Opp."No.");
                    TempOpportunityEntry."Sales Cycle Code" := Opp."Sales Cycle Code";
                    TempOpportunityEntry."Contact No." := Opp."Contact No.";
                    TempOpportunityEntry."Contact Company No." := Opp."Contact Company No.";
                    TempOpportunityEntry."Salesperson Code" := Opp."Salesperson Code";
                    TempOpportunityEntry."Campaign No." := Opp."Campaign No.";
                    TempOpportunityEntry."Action Taken" := TempOpportunityEntry."Action Taken"::Lost;
                    TempOpportunityEntry.Insert;
                    TempOpportunityEntry.SetRange("Action Taken", TempOpportunityEntry."Action Taken"::Lost);
                    PAGE.RunModal(PAGE::"Close Opportunity", TempOpportunityEntry);
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
        /*
        SalesPost.DeleteHeader(
          Rec,SalesShptHeader,SalesInvHeader,SalesCrMemoHeader,ReturnRcptHeader,SalesInvHeaderPrepmt,SalesCrMemoHeaderPrepmt);
        VALIDATE("Applies-to ID",'');
        */
        //ApprovalMgt.DeleteApprovalEntry(DATABASE::"Sales Header","Document Type","No.");
        //ApprovalMgt.DeleteApprovalEntries(DATABASE::"Sales Header","Document Type","No.");
        //ApprovalMgt.DeleteApprovalEntry(DATABASE::"Sales Header", "Document Type", "No.");
        ApprovalMgt.OnDeleteRecordInApprovalRequest(RECORDID);
        SalesLine.Reset;
        SalesLine.LockTable;

        WhseRequest.SetRange("Source Type", DATABASE::"Sales Line");
        WhseRequest.SetRange("Source Subtype", "Document Type");
        WhseRequest.SetRange("Source No.", "No.");
        WhseRequest.DeleteAll(true);

        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.SetRange(Type, SalesLine.Type::"Charge (Item)");

        DeleteSalesLines;
        SalesLine.SetRange(Type);
        DeleteSalesLines;

        SalesCommentLine.SetRange("Document Type", "Document Type");
        SalesCommentLine.SetRange("No.", "No.");
        SalesCommentLine.DeleteAll;

        GateEntryAttachment2.Reset;
        GateEntryAttachment2.SetRange("Source Type", GateEntryAttachment2."Source Type"::"Sales Return Order");
        GateEntryAttachment2.SetRange("Entry Type", GateEntryAttachment2."Entry Type"::Inward);
        GateEntryAttachment2.SetRange("Source No.", "No.");
        //TBD
        /*
        if GateEntryAttachment2.FindFirst then
            GateEntryAttachment2.DeleteAll;
        */

        //LKS-Raj Commented (Table Missing)
        // StrOrder.SetCurrentKey("Document Type", "Document No.", Type);
        // StrOrder.SetRange("Document Type", "Document Type");
        // StrOrder.SetRange("Document No.", "No.");
        // StrOrder.SetRange(Type, StrOrder.Type::Sale);
        // if StrOrder.FindFirst then
        //     StrOrder.DeleteAll;

        // StrOrderLine.SetCurrentKey("Document Type", "Document No.", Type);
        // StrOrderLine.SetRange("Document Type", "Document Type");
        // StrOrderLine.SetRange("Document No.", "No.");
        // StrOrderLine.SetRange(Type, StrOrder.Type::Sale);
        // if StrOrderLine.FindFirst then
        //     StrOrderLine.DeleteAll;
        //LKS-Raj Commented (Table Missing)

        if (SalesShptHeader."No." <> '') or
           (SalesInvHeader."No." <> '') or
           (SalesCrMemoHeader."No." <> '') or
           (ReturnRcptHeader."No." <> '') or
           (SalesInvHeaderPrepmt."No." <> '') or
           (SalesCrMemoHeaderPrepmt."No." <> '')
        then begin
            Delete;
            Commit;

            if SalesShptHeader."No." <> '' then
                if Confirm(
                     Text000, true,
                     SalesShptHeader."No.")
                then begin
                    SalesShptHeader.SetRecFilter;
                    SalesShptHeader.PrintRecords(true);
                end;

            if SalesInvHeader."No." <> '' then
                if Confirm(
                     Text001, true,
                     SalesInvHeader."No.")
                then begin
                    SalesInvHeader.SetRecFilter;
                    SalesInvHeader.PrintRecords(true);
                end;

            if SalesCrMemoHeader."No." <> '' then
                if Confirm(
                     Text002, true,
                     SalesCrMemoHeader."No.")
                then begin
                    SalesCrMemoHeader.SetRecFilter;
                    SalesCrMemoHeader.PrintRecords(true);
                end;

            if ReturnRcptHeader."No." <> '' then
                if Confirm(
                     Text023, true,
                     ReturnRcptHeader."No.")
                then begin
                    ReturnRcptHeader.SetRecFilter;
                    ReturnRcptHeader.PrintRecords(true);
                end;

            if SalesInvHeaderPrepmt."No." <> '' then
                if Confirm(
                     Text055, true,
                     SalesInvHeader."No.")
                then begin
                    SalesInvHeaderPrepmt.SetRecFilter;
                    SalesInvHeaderPrepmt.PrintRecords(true);
                end;

            if SalesCrMemoHeaderPrepmt."No." <> '' then
                if Confirm(
                     Text054, true,
                     SalesCrMemoHeaderPrepmt."No.")
                then begin
                    SalesCrMemoHeaderPrepmt.SetRecFilter;
                    SalesCrMemoHeaderPrepmt.PrintRecords(true);
                end;
        end;
        // VSTF208159.begin
        // DetailRG23D.RESET;
        // DetailRG23D.SETRANGE("Document Type","Document Type");
        // DetailRG23D.SETRANGE("Order No.","No.");
        // DetailRG23D.SETRANGE("Document No.",'');
        // DetailRG23D.DELETEALL;
        // VSTF208159.end

    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            TestNoSeries;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", "Posting Date", "No.", "No. Series");
        end;

        CompanyInfo.Get;
        Trading := CompanyInfo."Trading Co.";

        InitRecord;
        InsertMode := true;

        if GetFilter("Sell-to Customer No.") <> '' then
            if GetRangeMin("Sell-to Customer No.") = GetRangeMax("Sell-to Customer No.") then
                Validate("Sell-to Customer No.", GetRangeMin("Sell-to Customer No."));

        if GetFilter("Sell-to Contact No.") <> '' then
            if GetRangeMin("Sell-to Contact No.") = GetRangeMax("Sell-to Contact No.") then
                Validate("Sell-to Contact No.", GetRangeMin("Sell-to Contact No."));

        "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header", "Document Type", "No.");
    end;

    trigger OnRename()
    begin
        Error(Text003, TableCaption);
    end;

    var
        Text000: Label 'Do you want to print shipment %1?';
        Text001: Label 'Do you want to print invoice %1?';
        Text002: Label 'Do you want to print credit memo %1?';
        Text003: Label 'You cannot rename a %1.';
        Text004: Label 'Do you want to change %1?';
        Text005: Label 'You cannot reset %1 because the document still has one or more lines.';
        Text006: Label 'You cannot change %1 because the order is associated with one or more purchase orders.';
        Text007: Label '%1 cannot be greater than %2 in the %3 table.';
        Text009: Label 'Deleting this document will cause a gap in the number series for shipments. An empty shipment %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text012: Label 'Deleting this document will cause a gap in the number series for posted invoices. An empty posted invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text014: Label 'Deleting this document will cause a gap in the number series for posted credit memos. An empty posted credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text015: Label 'If you change %1, the existing sales lines will be deleted and new sales lines based on the new information on the header will be created.\\Do you want to change %1?';
        Text017: Label 'You must delete the existing sales lines before you can change %1.';
        Text018: Label 'You have changed %1 on the sales header, but it has not been changed on the existing sales lines.\';
        Text019: Label 'You must update the existing sales lines manually.';
        Text020: Label 'The change may affect the exchange rate used in the price calculation of the sales lines.';
        Text021: Label 'Do you want to update the exchange rate?';
        Text022: Label 'You cannot delete this document. Your identification is set up to process from %1 %2 only.';
        Text023: Label 'Do you want to print return receipt %1?';
        Text024: Label 'You have modified the %1 field. The recalculation of VAT may cause penny differences, so you must check the amounts afterward. Do you want to update the %2 field on the lines to reflect the new value of %1?';
        Text027: Label 'Your identification is set up to process from %1 %2 only.';
        Text028: Label 'You cannot change the %1 when the %2 has been filled in.';
        Text030: Label 'Deleting this document will cause a gap in the number series for return receipts. An empty return receipt %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text031: Label 'You have modified %1.\\';
        Text032: Label 'Do you want to update the lines?';
        Text067: Label '%1 %4 with amount of %2 has already been authorized on %3 and is not expired yet. You must void the previous authorization before you can re-authorize this %1.';
        Text068: Label 'There is nothing to void.';
        Text069: Label 'The selected operation cannot complete with the specified %1.';
        SalesSetup: Record "Sales & Receivables Setup";
        GLSetup: Record "General Ledger Setup";
        GLAcc: Record "G/L Account";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustLedgEntry: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        CurrExchRate: Record "Currency Exchange Rate";
        SalesCommentLine: Record "Sales Comment Line";
        ShipToAddr: Record "Ship-to Address";
        PostCode: Record "Post Code";
        BankAcc: Record "Bank Account";
        SalesShptHeader: Record "Sales Shipment Header";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        ReturnRcptHeader: Record "Return Receipt Header";
        SalesInvHeaderPrepmt: Record "Sales Invoice Header";
        SalesCrMemoHeaderPrepmt: Record "Sales Cr.Memo Header";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenJnILine: Record "Gen. Journal Line";
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        Location: Record Location;
        WhseRequest: Record "Warehouse Request";
        ShippingAgentService: Record "Shipping Agent Services";
        TempReqLine: Record "Requisition Line" temporary;
        UserSetupMgt: Codeunit "User Setup Management";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        //TransferExtendedText: Codeunit "Transfer Extended Text";//LKS-Raj Commented (Codeunit Missing)
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        SalesPost: Codeunit "Sales-Post";
        CustEntrySetApplID: Codeunit "Cust. Entry-SetAppl.ID";
        DimMgt: Codeunit DimensionManagement;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        WhseSourceHeader: Codeunit "Whse. Validate Source Header";
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        //DOPaymentMgt: Codeunit "DO Payment Mgt.";//LKS-Raj Commented (Codeunit Missing)
        //DOPaymentTransLogMgt: Codeunit "DO Payment Trans. Log Mgt."; //LKS-Raj Commented (Codeunit Missing)
        ApplyCustEntries: Page "Apply Customer Entries";
        CurrencyDate: Date;
        HideValidationDialog: Boolean;
        Confirmed: Boolean;
        Text035: Label 'You cannot Release Quote or Make Order unless you specify a customer on the quote.\\Do you want to create customer(s) now?';
        Text037: Label 'Contact %1 %2 is not related to customer %3.';
        Text038: Label 'Contact %1 %2 is related to a different company than customer %3.';
        Text039: Label 'Contact %1 %2 is not related to a customer.';
        ReservEntry: Record "Reservation Entry";
        TempReservEntry: Record "Reservation Entry" temporary;
        Text040: Label 'A won opportunity is linked to this order.\It has to be changed to status Lost before the Order can be deleted.\Do you want to change the status for this opportunity now?';
        Text043: Label 'Wizard Aborted';
        Text044: Label 'The status of the opportunity has not been changed. The program has aborted deleting the order.';
        SkipSellToContact: Boolean;
        SkipBillToContact: Boolean;
        Text045: Label 'You can not change the %1 field because %2 %3 has %4 = %5 and the %6 has already been assigned %7 %8.';
        Text048: Label 'Sales quote %1 has already been assigned to opportunity %2. Would you like to reassign this quote?';
        Text049: Label 'The %1 field cannot be blank because this quote is linked to an opportunity.';
        InsertMode: Boolean;
        CompanyInfo: Record "Company Information";
        HideCreditCheckDialogue: Boolean;
        Text051: Label 'The sales %1 %2 already exists.';
        Text052: Label 'The sales %1 %2 has item tracking. Do you want to delete it anyway?';
        Text053: Label 'You must cancel the approval process if you wish to change the %1.';
        Text055: Label 'Do you want to print prepayment invoice %1?';
        Text054: Label 'Do you want to print prepayment credit memo %1?';
        Text056: Label 'Deleting this document will cause a gap in the number series for prepayment invoices. An empty prepayment invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text057: Label 'Deleting this document will cause a gap in the number series for prepayment credit memos. An empty prepayment credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text061: Label '%1 is set up to process from %2 %3 only.';
        Text062: Label 'You cannot change %1 because the corresponding %2 %3 has been assigned to this %4.';
        Text063: Label 'Reservations exist for this order. These reservations will be canceled if a date conflict is caused by this change.\\Do you want to continue?';
        Text064: Label 'You may have changed a dimension.\\Do you want to update the lines?';
        UpdateDocumentDate: Boolean;
        Text066: Label 'You cannot change %1 to %2 because an open inventory pick on the %3.';
        Text070: Label 'You cannot change %1  to %2 because an open warehouse shipment exists for the %3.';
        BilltoCustomerNoChanged: Boolean;
        Text071: Label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';
        Text072: Label 'There are unpaid prepayment invoices related to the document of type %1 with the number %2.';
        // StrOrder: Record "Structure Order Details";//LKS-Raj Commented (Table Missing)
        // StrOrderLine: Record "Structure Order Line Details";//LKS-Raj Commented (Table Missing)
        // NODHeader: Record "NOD/NOC Header";//LKS-Raj Commented (Table Missing)
        GLSetupRead: Boolean;
        Text16500: Label 'Place a check mark in Direct Debit To PLA/RG.';
        Text16501: Label 'The PLA/RG direct debit form can be accessed only when excise is liable.';
        PostedGateEntryLine: Record "Posted Gate Entry Line";
        GateEntryAttachment: Record "Gate Entry Attachment";
        GateEntryAttachment2: Record "Gate Entry Attachment";
        //PostedGateEntryLineList: Page "Posted Gate Entry Line List";//LKS-Raj Commented (Page Missing)
        Text16502: Label 'The Service Tax Registration No. entered in Sales Line for Document Type %1 and Document No. %2 should be same for all the entries.';
        //ExciseCenvatClaim: Record "Excise Cenvat Claim";//LKS-Raj Commented (Table Missing)
        TotalBEDAmt: Decimal;
        "TotalAED(GSI)Amt": Decimal;
        TotalSEDAmt: Decimal;
        TotalSAEDAmt: Decimal;
        TotalCESSAmt: Decimal;
        TotalNCCDAmt: Decimal;
        TotaleCessAmt: Decimal;
        TotalADETAmt: Decimal;
        TotalADEAmt: Decimal;
        "TotalAED(TTA)Amt": Decimal;
        TotalADCVATAmt: Decimal;
        TotalSHECessAmt: Decimal;
        //CenvatClaimForm: Page "Excise Cenvat Claim";//LKS-Raj Commented (Page Missing)
        //StateForms: Record "State Forms"; //LKS-Raj Commented (Table Missing)
        DimValue: Record "Dimension Value";


    procedure InitRecord()
    begin
        //LKS-Raj Commented (Field Missing)
        // SalesSetup.Get;

        // case "Document Type" of
        //     "Document Type"::Quote, "Document Type"::Order, "Document Type"::"Blanket Order":
        //         begin
        //             // PS37919.begin
        //             if Trading then begin
        //                 //LKS-Raj Commented (Field Missing)
        //                 // NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos. (Trading)");
        //                 // NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Sales Shpt. (Trading)");
        //                 //LKS-Raj Commented (Field Missing)
        //             end else begin
        //                 // PS37919.end
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos.");
        //                 NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Shipment Nos.");
        //             end;
        //             if "Document Type" = "Document Type"::Order then begin
        //                 NoSeriesMgt.SetDefaultSeries("Prepayment No. Series", SalesSetup."Posted Prepmt. Inv. Nos.");
        //                 NoSeriesMgt.SetDefaultSeries("Prepmt. Cr. Memo No. Series", SalesSetup."Posted Prepmt. Cr. Memo Nos.");
        //             end;

        //             if Trading then
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos. (Trading)");
        //             if "Location Code" <> '' then begin
        //                 Location.Get("Location Code");
        //                 if not Trading then begin
        //                     if Location."Sales Invoice Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos.");
        //                     if Location."Sales Shipment Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shipment Nos.");
        //                 end else begin
        //                     if Location."Sales Invoice Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos. (Trading)");
        //                     if Location."Sales Shpt. Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shpt. Nos. (Trading)");
        //                 end;
        //             end;

        //         end;
        //     "Document Type"::Invoice:
        //         begin
        //             if ("No. Series" <> '') and
        //                (SalesSetup."Invoice Nos." = SalesSetup."Posted Invoice Nos.")
        //             then
        //                 "Posting No. Series" := "No. Series"
        //             else
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos.");
        //             // PS37919.begin
        //             // IF SalesSetup."Shipment on Invoice" THEN
        //             // NoSeriesMgt.SetDefaultSeries("Shipping No. Series",SalesSetup."Posted Shipment Nos.");
        //             if SalesSetup."Shipment on Invoice" then begin
        //                 if Trading then
        //                     NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Sales Shpt. (Trading)")
        //                 else
        //                     NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Shipment Nos.");
        //             end;
        //             // PS37919.end
        //             if Trading then
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos. (Trading)");
        //             if "Location Code" <> '' then begin
        //                 Location.Get("Location Code");
        //                 if not Trading then begin
        //                     if Location."Sales Invoice Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos.");
        //                     if (Location."Sales Shipment Nos." <> '') and SalesSetup."Shipment on Invoice" then
        //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shipment Nos.");
        //                 end else begin
        //                     if Location."Sales Invoice Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos. (Trading)");
        //                     if (Location."Sales Shpt. Nos. (Trading)" <> '') and SalesSetup."Shipment on Invoice" then
        //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shpt. Nos. (Trading)");
        //                 end;
        //             end;
        //         end;
        //     "Document Type"::"Return Order":
        //         begin
        //             // PS37919.begin
        //             if Trading then begin
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Sale Cr. Memo (Trading)");
        //                 NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Ret Rcpt Nos. (Trading)");
        //             end else begin
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Credit Memo Nos.");
        //                 NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
        //             end;
        //             // PS37919.end
        //             if "Location Code" <> '' then begin
        //                 Location.Get("Location Code");
        //                 if not Trading then begin
        //                     if Location."Sales Credit Memo Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Credit Memo Nos.");
        //                     if Location."Sales Return Receipt Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Return Receipt Nos.");
        //                 end else begin
        //                     if Location."Sale Cr. Memo Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sale Cr. Memo Nos. (Trading)");
        //                     if Location."Sales Ret Rcpt Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Ret Rcpt Nos. (Trading)");
        //                 end;
        //             end;
        //         end;
        //     "Document Type"::"Credit Memo":
        //         begin
        //             if ("No. Series" <> '') and
        //                (SalesSetup."Credit Memo Nos." = SalesSetup."Posted Credit Memo Nos.")
        //             then
        //                 "Posting No. Series" := "No. Series"
        //             else
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Credit Memo Nos.");
        //             if Trading then
        //                 NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Sale Cr. Memo (Trading)");
        //             // PS37919.begin
        //             if SalesSetup."Return Receipt on Credit Memo" then
        //                 if Trading then
        //                     NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Ret Rcpt Nos. (Trading)")
        //                 else
        //                     NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
        //             // PS37919.end
        //             if "Location Code" <> '' then begin
        //                 Location.Get("Location Code");
        //                 if not Trading then begin
        //                     if Location."Sales Credit Memo Nos." <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Credit Memo Nos.");
        //                     if (Location."Sales Return Receipt Nos." <> '') and SalesSetup."Return Receipt on Credit Memo" then
        //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Return Receipt Nos.");
        //                 end else begin
        //                     if Location."Sale Cr. Memo Nos. (Trading)" <> '' then
        //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sale Cr. Memo Nos. (Trading)");
        //                     if (Location."Sales Ret Rcpt Nos. (Trading)" <> '') and SalesSetup."Return Receipt on Credit Memo" then
        //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Ret Rcpt Nos. (Trading)");
        //                 end;
        //             end;
        //         end;
        // end;

        // if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice, "Document Type"::Quote] then begin
        //     "Shipment Date" := WorkDate;
        //     "Order Date" := WorkDate;
        // end;
        // if "Document Type" = "Document Type"::"Return Order" then
        //     "Order Date" := WorkDate;

        // if not ("Document Type" in ["Document Type"::"Blanket Order", "Document Type"::Quote]) and
        //    ("Posting Date" = 0D)
        // then
        //     "Posting Date" := WorkDate;

        // if SalesSetup."Default Posting Date" = SalesSetup."Default Posting Date"::"No Date" then
        //     "Posting Date" := 0D;

        // "Document Date" := WorkDate;

        // if not Trading then
        //     Validate("Location Code", UserSetupMgt.GetLocation(0, Cust."Location Code", "Responsibility Center"));

        // if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
        //     GLSetup.Get;
        //     Correction := GLSetup."Mark Cr. Memos as Corrections";
        // end;

        // "Posting Description" := Format("Document Type") + ' ' + "No.";

        // Reserve := Reserve::Optional;

        // if InvtSetup.Get then
        //     Validate("Outbound Whse. Handling Time", InvtSetup."Outbound Whse. Handling Time");

        // "Responsibility Center" := UserSetupMgt.GetRespCenter(0, "Responsibility Center");
        // "Time of Removal" := Time;
        //LKS-Raj Commented (Field Missing)
    end;


    procedure AssistEdit(OldSalesHeader: Record "Sales Header"): Boolean
    var
        SalesHeader2: Record "Sales Header";
    begin
        /*
        WITH SalesHeader DO BEGIN
          COPY(Rec);
          SalesSetup.GET;
          TestNoSeries;
          IF NoSeriesMgt.SelectSeries(GetNoSeriesCode,OldSalesHeader."No. Series","No. Series") THEN BEGIN
            IF ("Sell-to Customer No." = '') AND ("Sell-to Contact No." = '') THEN BEGIN
              HideCreditCheckDialogue := FALSE;
              CheckCreditMaxBeforeInsert;
              HideCreditCheckDialogue := TRUE;
            END;
            NoSeriesMgt.SetSeries("No.");
            IF SalesHeader2.GET("Document Type","No.") THEN
              ERROR(Text051,LOWERCASE(FORMAT("Document Type")),"No.");
            Rec := SalesHeader;
            EXIT(TRUE);
          END;
        END;
          */

    end;

    local procedure TestNoSeries(): Boolean
    begin
        SalesSetup.Get;

        case "Document Type" of
            "Document Type"::Quote:
                SalesSetup.TestField("Quote Nos.");
            "Document Type"::Order:
                SalesSetup.TestField("Order Nos.");
            "Document Type"::Invoice:
                begin
                    SalesSetup.TestField("Invoice Nos.");
                    SalesSetup.TestField("Posted Invoice Nos.");
                end;
            "Document Type"::"Return Order":
                SalesSetup.TestField("Return Order Nos.");
            "Document Type"::"Credit Memo":
                begin
                    SalesSetup.TestField("Credit Memo Nos.");
                    SalesSetup.TestField("Posted Credit Memo Nos.");
                end;
            "Document Type"::"Blanket Order":
                SalesSetup.TestField("Blanket Order Nos.");
        end;
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        case "Document Type" of
            "Document Type"::Quote:
                exit(SalesSetup."Quote Nos.");
            "Document Type"::Order:
                exit(SalesSetup."Order Nos.");
            "Document Type"::Invoice:
                exit(SalesSetup."Invoice Nos.");
            "Document Type"::"Return Order":
                exit(SalesSetup."Return Order Nos.");
            "Document Type"::"Credit Memo":
                exit(SalesSetup."Credit Memo Nos.");
            "Document Type"::"Blanket Order":
                exit(SalesSetup."Blanket Order Nos.");
        end;
    end;

    local procedure GetPostingNoSeriesCode(): Code[10]
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            exit(SalesSetup."Posted Credit Memo Nos.");
        exit(SalesSetup."Posted Invoice Nos.");
    end;

    local procedure TestNoSeriesDate(No: Code[20]; NoSeriesCode: Code[10]; NoCapt: Text[1024]; NoSeriesCapt: Text[1024])
    var
        NoSeries: Record "No. Series";
    begin
        if (No <> '') and (NoSeriesCode <> '') then begin
            NoSeries.Get(NoSeriesCode);
            if NoSeries."Date Order" then
                Error(
                  Text045,
                  FieldCaption("Posting Date"), NoSeriesCapt, NoSeriesCode,
                  NoSeries.FieldCaption("Date Order"), NoSeries."Date Order", "Document Type",
                  NoCapt, No);
        end;
    end;


    procedure ConfirmDeletion(): Boolean
    begin
        /*
        SalesPost.TestDeleteHeader(
          Rec,SalesShptHeader,SalesInvHeader,SalesCrMemoHeader,ReturnRcptHeader,
          SalesInvHeaderPrepmt,SalesCrMemoHeaderPrepmt);
        IF SalesShptHeader."No." <> '' THEN
          IF NOT CONFIRM(
               Text009,TRUE,
               SalesShptHeader."No.")
          THEN
            EXIT;
        IF SalesInvHeader."No." <> '' THEN
          IF NOT CONFIRM(
               Text012,TRUE,
               SalesInvHeader."No.")
          THEN
            EXIT;
        IF SalesCrMemoHeader."No." <> '' THEN
          IF NOT CONFIRM(
               Text014,TRUE,
               SalesCrMemoHeader."No.")
          THEN
            EXIT;
        IF ReturnRcptHeader."No." <> '' THEN
          IF NOT CONFIRM(
               Text030,TRUE,
               ReturnRcptHeader."No.")
          THEN
            EXIT;
        IF "Prepayment No." <> '' THEN
          IF NOT CONFIRM(
               Text056,TRUE,
               SalesInvHeaderPrepmt."No.")
          THEN
            EXIT;
        IF "Prepmt. Cr. Memo No." <> '' THEN
          IF NOT CONFIRM(
               Text057,TRUE,
               SalesCrMemoHeaderPrepmt."No.")
          THEN
            EXIT;
        EXIT(TRUE);
        */

    end;

    local procedure GetCust(CustNo: Code[20])
    begin
        if not (("Document Type" = "Document Type"::Quote) and (CustNo = '')) then begin
            if CustNo <> Cust."No." then
                Cust.Get(CustNo);
        end else
            Clear(Cust);
    end;


    procedure SalesLinesExist(): Boolean
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        exit(SalesLine.FindFirst);
    end;


    procedure RecreateSalesLines(ChangedFieldName: Text[100])
    var
        SalesLineTmp: Record "Sales Line" temporary;
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary;
        TempInteger: Record "Integer" temporary;
        TempATOLink: Record "Assemble-to-Order Link" temporary;
        ATOLink: Record "Assemble-to-Order Link";
        ExtendedTextAdded: Boolean;
    begin
        if SalesLinesExist then begin
            if HideValidationDialog or not GuiAllowed then
                Confirmed := true
            else
                Confirmed :=
                  Confirm(
                    Text015, false, ChangedFieldName);
            if Confirmed then begin
                SalesLine.LockTable;
                ItemChargeAssgntSales.LockTable;
                ReservEntry.LockTable;
                Modify;

                SalesLine.Reset;
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.FindSet then begin
                    TempReservEntry.DeleteAll;
                    repeat
                        SalesLine.TestField("Job No.", '');
                        SalesLine.TestField("Job Contract Entry No.", 0);
                        SalesLine.TestField("Quantity Shipped", 0);
                        SalesLine.TestField("Quantity Invoiced", 0);
                        SalesLine.TestField("Return Qty. Received", 0);
                        SalesLine.TestField("Shipment No.", '');
                        SalesLine.TestField("Return Receipt No.", '');
                        SalesLine.TestField("Blanket Order No.", '');
                        SalesLine.TestField("Prepmt. Amt. Inv.", 0);
                        if SalesLine."Location Code" <> "Location Code" then
                            SalesLine.Validate("Location Code", "Location Code");
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
                        RecreateReservEntry(SalesLine, 0, true);
                        RecreateReqLine(SalesLine, 0, true);
                    until SalesLine.Next = 0;

                    ItemChargeAssgntSales.SetRange("Document Type", "Document Type");
                    ItemChargeAssgntSales.SetRange("Document No.", "No.");
                    if ItemChargeAssgntSales.FindSet then begin
                        repeat
                            TempItemChargeAssgntSales.Init;
                            TempItemChargeAssgntSales := ItemChargeAssgntSales;
                            TempItemChargeAssgntSales.Insert;
                        until ItemChargeAssgntSales.Next = 0;
                        ItemChargeAssgntSales.DeleteAll;
                    end;

                    SalesLine.DeleteAll(true);
                    SalesLine.Init;
                    SalesLine."Line No." := 0;
                    SalesLineTmp.FindSet;
                    ExtendedTextAdded := false;
                    SalesLine.BlockDynamicTracking(true);
                    repeat
                        if SalesLineTmp."Attached to Line No." = 0 then begin
                            SalesLine.Init;
                            SalesLine."Line No." := SalesLine."Line No." + 10000;
                            SalesLine.Validate(Type, SalesLineTmp.Type);
                            if SalesLineTmp."No." = '' then begin
                                SalesLine.Validate(Description, SalesLineTmp.Description);
                                SalesLine.Validate("Description 2", SalesLineTmp."Description 2");
                            end else begin
                                SalesLine.Validate("No.", SalesLineTmp."No.");
                                if SalesLine.Type <> SalesLine.Type::" " then begin
                                    SalesLine.Validate("Unit of Measure Code", SalesLineTmp."Unit of Measure Code");
                                    SalesLine.Validate("Variant Code", SalesLineTmp."Variant Code");
                                    if SalesLineTmp.Quantity <> 0 then begin
                                        SalesLine.Validate(Quantity, SalesLineTmp.Quantity);
                                        SalesLine.Validate("Qty. to Assemble to Order", SalesLineTmp."Qty. to Assemble to Order");
                                    end;
                                    SalesLine."Purchase Order No." := SalesLineTmp."Purchase Order No.";
                                    SalesLine."Purch. Order Line No." := SalesLineTmp."Purch. Order Line No.";
                                    SalesLine."Drop Shipment" := SalesLine."Purch. Order Line No." <> 0;
                                end;
                            end;
                            //SalesLine."Direct Debit To PLA / RG" := SalesLineTmp."Direct Debit To PLA / RG";//LKS-Raj Commented (Field Missing)

                            SalesLine.Insert;
                            ExtendedTextAdded := false;

                            if SalesLine.Type = SalesLine.Type::Item then begin
                                ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
                                TempItemChargeAssgntSales.SetRange("Applies-to Doc. Type", SalesLineTmp."Document Type");
                                TempItemChargeAssgntSales.SetRange("Applies-to Doc. No.", SalesLineTmp."Document No.");
                                TempItemChargeAssgntSales.SetRange("Applies-to Doc. Line No.", SalesLineTmp."Line No.");
                                if TempItemChargeAssgntSales.FindSet then
                                    repeat
                                        if not TempItemChargeAssgntSales.Mark then begin
                                            TempItemChargeAssgntSales."Applies-to Doc. Line No." := SalesLine."Line No.";
                                            TempItemChargeAssgntSales.Description := SalesLine.Description;
                                            TempItemChargeAssgntSales.Modify;
                                            TempItemChargeAssgntSales.Mark(true);
                                        end;
                                    until TempItemChargeAssgntSales.Next = 0;
                            end;
                            if SalesLine.Type = SalesLine.Type::"Charge (Item)" then begin
                                TempInteger.Init;
                                TempInteger.Number := SalesLine."Line No.";
                                TempInteger.Insert;
                            end;
                        end else
                            if not ExtendedTextAdded then begin
                                //LKS-Raj Commented (Codeunit Missing)
                                // TransferExtendedText.SalesCheckIfAnyExtText(SalesLine, true);
                                // TransferExtendedText.InsertSalesExtText(SalesLine);
                                //LKS-Raj Commented (Codeunit Missing)
                                SalesLine.FindLast;
                                ExtendedTextAdded := true;
                            end;
                        RecreateReservEntry(SalesLineTmp, SalesLine."Line No.", false);
                        RecreateReqLine(SalesLineTmp, SalesLine."Line No.", false);
                        SynchronizeForReservations(SalesLine, SalesLineTmp);

                        if TempATOLink.AsmExistsForSalesLine(SalesLineTmp) then begin
                            ATOLink := TempATOLink;
                            ATOLink.Insert;
                            SalesLine.AutoAsmToOrder;
                            TempATOLink.Delete;
                        end;
                    until SalesLineTmp.Next = 0;

                    ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
                    SalesLineTmp.SetRange(Type, SalesLine.Type::"Charge (Item)");
                    if SalesLineTmp.FindSet then
                        repeat
                            TempItemChargeAssgntSales.SetRange("Document Line No.", SalesLineTmp."Line No.");
                            if TempItemChargeAssgntSales.FindSet then begin
                                repeat
                                    TempInteger.FindFirst;
                                    ItemChargeAssgntSales.Init;
                                    ItemChargeAssgntSales := TempItemChargeAssgntSales;
                                    ItemChargeAssgntSales."Document Line No." := TempInteger.Number;
                                    ItemChargeAssgntSales.Validate("Unit Cost", 0);
                                    ItemChargeAssgntSales.Insert;
                                until TempItemChargeAssgntSales.Next = 0;
                                TempInteger.Delete;
                            end;
                        until SalesLineTmp.Next = 0;

                    SalesLineTmp.SetRange(Type);
                    SalesLineTmp.DeleteAll;
                    ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
                    TempItemChargeAssgntSales.DeleteAll;
                end;
            end else
                Error(
                  Text017, ChangedFieldName);
        end;
        SalesLine.BlockDynamicTracking(false);
    end;


    procedure MessageIfSalesLinesExist(ChangedFieldName: Text[100])
    begin
        if SalesLinesExist and not HideValidationDialog then
            Message(
              Text018 +
              Text019,
              ChangedFieldName);
    end;


    procedure PriceMessageIfSalesLinesExist(ChangedFieldName: Text[100])
    begin
        if SalesLinesExist and not HideValidationDialog then
            Message(
              Text018 +
              Text020, ChangedFieldName);
    end;

    local procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Posting Date" <> 0D then
                CurrencyDate := "Posting Date"
            else
                CurrencyDate := WorkDate;

            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else
            "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        if HideValidationDialog then
            Confirmed := true
        else
            Confirmed := Confirm(Text021, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
    end;


    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;


    procedure UpdateSalesLines(ChangedFieldName: Text[100]; AskQuestion: Boolean)
    var
        JobTransferLine: Codeunit "Job Transfer Line";
        Question: Text[250];
    begin
        if not SalesLinesExist then
            exit;

        if AskQuestion then begin
            Question := StrSubstNo(
                Text031 +
                Text032, ChangedFieldName);
            if GuiAllowed then
                if DIALOG.Confirm(Question, true) then
                    case ChangedFieldName of
                        FieldCaption("Shipment Date"),
                      FieldCaption("Shipping Agent Code"),
                      FieldCaption("Shipping Agent Service Code"),
                      FieldCaption("Shipping Time"),
                      FieldCaption("Requested Delivery Date"),
                      FieldCaption("Promised Delivery Date"),
                      FieldCaption("Outbound Whse. Handling Time"):
                            ConfirmResvDateConflict;
                    end
                else
                    exit;
        end;

        SalesLine.LockTable;
        Modify;

        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        if SalesLine.FindSet then
            repeat
                case ChangedFieldName of
                    FieldCaption("Shipment Date"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Shipment Date", "Shipment Date");
                    FieldCaption("Currency Factor"):
                        if SalesLine.Type <> SalesLine.Type::" " then begin
                            SalesLine.Validate("Unit Price");
                            SalesLine.Validate("Unit Cost (LCY)");
                            if SalesLine."Job No." <> '' then
                                JobTransferLine.FromSalesHeaderToPlanningLine(SalesLine, "Currency Factor");
                        end;
                    FieldCaption("Transaction Type"):
                        SalesLine.Validate("Transaction Type", "Transaction Type");
                    FieldCaption("Transport Method"):
                        SalesLine.Validate("Transport Method", "Transport Method");
                    FieldCaption("Exit Point"):
                        SalesLine.Validate("Exit Point", "Exit Point");
                    FieldCaption(Area):
                        SalesLine.Validate(Area, Area);
                    FieldCaption("Transaction Specification"):
                        SalesLine.Validate("Transaction Specification", "Transaction Specification");
                    FieldCaption("Shipping Agent Code"):
                        SalesLine.Validate("Shipping Agent Code", "Shipping Agent Code");
                    FieldCaption("Shipping Agent Service Code"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Shipping Agent Service Code", "Shipping Agent Service Code");
                    FieldCaption("Shipping Time"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Shipping Time", "Shipping Time");
                    FieldCaption("Prepayment %"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Prepayment %", "Prepayment %");
                    FieldCaption("Requested Delivery Date"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Requested Delivery Date", "Requested Delivery Date");
                    FieldCaption("Promised Delivery Date"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Promised Delivery Date", "Promised Delivery Date");
                    FieldCaption("Outbound Whse. Handling Time"):
                        if SalesLine."No." <> '' then
                            SalesLine.Validate("Outbound Whse. Handling Time", "Outbound Whse. Handling Time");
                    // VSTF214377.begin
                    FieldCaption("Form Code"):
                        if SalesLine.Type <> SalesLine.Type::" " then begin
                            // SalesLine.Validate("Form Code", "Form Code");
                            // SalesLine.Validate("Form No.", "Form No.");
                            SalesLine.Validate("Unit Price");
                            SalesLine.Validate("Unit Cost (LCY)");
                        end;
                // VSTF214377.end;
                end;
                SalesLineReserve.AssignForPlanning(SalesLine);
                SalesLine.Modify(true);
            until SalesLine.Next = 0;
    end;


    procedure ConfirmResvDateConflict()
    var
        ResvEngMgt: Codeunit "Reservation Engine Mgt.";
    begin
        /*
        IF ResvEngMgt.ResvExistsForSalesHeader(Rec) THEN
          IF NOT CONFIRM(Text063,FALSE) THEN
            ERROR('');
         */

    end;


    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20]; Type5: Integer; No5: Code[20])
    var
        SourceCodeSetup: Record "Source Code Setup";
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
        OldDimSetID: Integer;
    begin
        SourceCodeSetup.Get;
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        TableID[5] := Type5;
        No[5] := No5;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(TableID, No, SourceCodeSetup.Sales, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);

        if (OldDimSetID <> "Dimension Set ID") and SalesLinesExist then begin
            Modify;
            UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        //TEAM::1426/03
        /*
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        IF "No." <> '' THEN
          MODIFY;
        
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF SalesLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
        //TEAM::1426/03

    end;


    procedure ShippedSalesLinesExist(): Boolean
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.SetFilter("Quantity Shipped", '<>0');
        exit(SalesLine.FindFirst);
    end;


    procedure ReturnReceiptExist(): Boolean
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.SetFilter("Return Qty. Received", '<>0');
        exit(SalesLine.FindFirst);
    end;

    local procedure DeleteSalesLines()
    begin
        if SalesLine.FindSet then begin
            HandleItemTrackingDeletion;
            repeat
                SalesLine.SuspendStatusCheck(true);
                SalesLine.Delete(true);
            until SalesLine.Next = 0;
        end;
    end;


    procedure HandleItemTrackingDeletion()
    var
        ReservEntry2: Record "Reservation Entry";
    begin
        with ReservEntry do begin
            Reset;
            SetCurrentKey(
              "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
              "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
            SetRange("Source Type", DATABASE::"Sales Line");
            SetRange("Source Subtype", "Document Type");
            SetRange("Source ID", "No.");
            SetRange("Source Batch Name", '');
            SetRange("Source Prod. Order Line", 0);
            SetFilter("Item Tracking", '> %1', "Item Tracking"::None);
            if IsEmpty then
                exit;

            if HideValidationDialog or not GuiAllowed then
                Confirmed := true
            else
                Confirmed := Confirm(Text052, false, LowerCase(Format("Document Type")), "No.");

            if not Confirmed then
                Error('');

            if FindSet then
                repeat
                    ReservEntry2 := ReservEntry;
                    ReservEntry2.ClearItemTrackingFields;
                    ReservEntry2.Modify;
                until Next = 0;
        end;
    end;

    local procedure ClearItemAssgntSalesFilter(var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)")
    begin
        TempItemChargeAssgntSales.SetRange("Document Line No.");
        TempItemChargeAssgntSales.SetRange("Applies-to Doc. Type");
        TempItemChargeAssgntSales.SetRange("Applies-to Doc. No.");
        TempItemChargeAssgntSales.SetRange("Applies-to Doc. Line No.");
    end;


    procedure CheckCustomerCreated(Prompt: Boolean): Boolean
    var
        Cont: Record Contact;
    begin
        if ("Bill-to Customer No." <> '') and ("Sell-to Customer No." <> '') then
            exit(true);

        if Prompt then
            if not Confirm(Text035, true) then
                exit(false);

        if "Sell-to Customer No." = '' then begin
            TestField("Sell-to Contact No.");
            TestField("Sell-to Customer Template Code");
            Cont.Get("Sell-to Contact No.");
            //TBD //Cont.CreateCustomer("Sell-to Customer Template Code");
            Commit;
            Get("Document Type"::Quote, "No.");
        end;

        if "Bill-to Customer No." = '' then begin
            TestField("Bill-to Contact No.");
            TestField("Bill-to Customer Template Code");
            Cont.Get("Bill-to Contact No.");
            //TBD //Cont.CreateCustomer("Bill-to Customer Template Code");
            Commit;
            Get("Document Type"::Quote, "No.");
        end;

        exit(("Bill-to Customer No." <> '') and ("Sell-to Customer No." <> ''));
    end;


    procedure RecreateReservEntry(OldSalesLine: Record "Sales Line"; NewSourceRefNo: Integer; ToTemp: Boolean)
    begin
        if ToTemp then begin
            Clear(ReservEntry);
            ReservEntry.SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");
            ReservEntry.SetRange("Source ID", OldSalesLine."Document No.");
            ReservEntry.SetRange("Source Ref. No.", OldSalesLine."Line No.");
            ReservEntry.SetRange("Source Type", DATABASE::"Sales Line");
            ReservEntry.SetRange("Source Subtype", OldSalesLine."Document Type");
            if ReservEntry.FindSet then
                repeat
                    TempReservEntry := ReservEntry;
                    TempReservEntry.Insert;
                until ReservEntry.Next = 0;
            ReservEntry.DeleteAll;
        end else begin
            Clear(TempReservEntry);
            TempReservEntry.SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");
            TempReservEntry.SetRange("Source Type", DATABASE::"Sales Line");
            TempReservEntry.SetRange("Source Subtype", OldSalesLine."Document Type");
            TempReservEntry.SetRange("Source ID", OldSalesLine."Document No.");
            TempReservEntry.SetRange("Source Ref. No.", OldSalesLine."Line No.");
            if TempReservEntry.FindSet then
                repeat
                    ReservEntry := TempReservEntry;
                    ReservEntry."Source Ref. No." := NewSourceRefNo;
                    ReservEntry.Insert;
                until TempReservEntry.Next = 0;
            TempReservEntry.DeleteAll;
        end;
    end;


    procedure RecreateReqLine(OldSalesLine: Record "Sales Line"; NewSourceRefNo: Integer; ToTemp: Boolean)
    var
        ReqLine: Record "Requisition Line";
    begin
        if ToTemp then begin
            ReqLine.SetCurrentKey("Order Promising ID", "Order Promising Line ID", "Order Promising Line No.");
            ReqLine.SetRange("Order Promising ID", OldSalesLine."Document No.");
            ReqLine.SetRange("Order Promising Line ID", OldSalesLine."Line No.");
            if ReqLine.FindSet then
                repeat
                    TempReqLine := ReqLine;
                    TempReqLine.Insert;
                until ReqLine.Next = 0;
            ReqLine.DeleteAll;
        end else begin
            Clear(TempReqLine);
            TempReqLine.SetCurrentKey("Order Promising ID", "Order Promising Line ID", "Order Promising Line No.");
            TempReqLine.SetRange("Order Promising ID", OldSalesLine."Document No.");
            TempReqLine.SetRange("Order Promising Line ID", OldSalesLine."Line No.");
            if TempReqLine.FindSet then
                repeat
                    ReqLine := TempReqLine;
                    ReqLine."Order Promising Line ID" := NewSourceRefNo;
                    ReqLine.Insert;
                until TempReqLine.Next = 0;
            TempReqLine.DeleteAll;
        end;
    end;


    procedure UpdateSellToCont(CustomerNo: Code[20])
    var
        ContBusRel: Record "Contact Business Relation";
        Cust: Record Customer;
    begin
        if Cust.Get(CustomerNo) then begin
            if Cust."Primary Contact No." <> '' then
                "Sell-to Contact No." := Cust."Primary Contact No."
            else begin
                ContBusRel.Reset;
                ContBusRel.SetCurrentKey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
                ContBusRel.SetRange("No.", "Sell-to Customer No.");
                if ContBusRel.FindFirst then
                    "Sell-to Contact No." := ContBusRel."Contact No."
                else
                    "Sell-to Contact No." := '';
            end;
            "Sell-to Contact" := Cust.Contact;
        end;
    end;


    procedure UpdateBillToCont(CustomerNo: Code[20])
    var
        ContBusRel: Record "Contact Business Relation";
        Cust: Record Customer;
    begin
        if Cust.Get(CustomerNo) then begin
            if Cust."Primary Contact No." <> '' then
                "Bill-to Contact No." := Cust."Primary Contact No."
            else begin
                ContBusRel.Reset;
                ContBusRel.SetCurrentKey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
                ContBusRel.SetRange("No.", "Bill-to Customer No.");
                if ContBusRel.FindFirst then
                    "Bill-to Contact No." := ContBusRel."Contact No."
                else
                    "Bill-to Contact No." := '';
            end;
            "Bill-to Contact" := Cust.Contact;
        end;
    end;


    procedure UpdateSellToCust(ContactNo: Code[20])
    var
        ContBusinessRelation: Record "Contact Business Relation";
        Customer: Record Customer;
        Cont: Record Contact;
        CustTemplate: Record "Customer Template";
        ContComp: Record Contact;
    begin
        if Cont.Get(ContactNo) then
            "Sell-to Contact No." := Cont."No."
        else begin
            "Sell-to Contact" := '';
            exit;
        end;

        ContBusinessRelation.Reset;
        ContBusinessRelation.SetCurrentKey("Link to Table", "Contact No.");
        ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
        ContBusinessRelation.SetRange("Contact No.", Cont."Company No.");
        if ContBusinessRelation.FindFirst then begin
            if ("Sell-to Customer No." <> '') and
               ("Sell-to Customer No." <> ContBusinessRelation."No.")
            then
                Error(Text037, Cont."No.", Cont.Name, "Sell-to Customer No.");
            if "Sell-to Customer No." = '' then begin
                SkipSellToContact := true;
                Validate("Sell-to Customer No.", ContBusinessRelation."No.");
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
                Validate("Ship-to Country/Region Code", ContComp."Country/Region Code");
                //TBD
                /*
                if ("Sell-to Customer Template Code" = '') and (not CustTemplate.IsEmpty) then
                    Validate("Sell-to Customer Template Code", Cont.FindCustomerTemplate);
                */
            end else
                Error(Text039, Cont."No.", Cont.Name);
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
            //"Nature of Services" := Cust."Nature of Services";//LKS-Raj Commented (Field Missing)
        end;
        if ("Sell-to Customer No." = "Bill-to Customer No.") or
           ("Bill-to Customer No." = '')
        then
            Validate("Bill-to Contact No.", "Sell-to Contact No.");
    end;


    procedure UpdateBillToCust(ContactNo: Code[20])
    var
        ContBusinessRelation: Record "Contact Business Relation";
        Cust: Record Customer;
        Cont: Record Contact;
        CustTemplate: Record "Customer Template";
        ContComp: Record Contact;
    begin
        if Cont.Get(ContactNo) then begin
            "Bill-to Contact No." := Cont."No.";
            if Cont.Type = Cont.Type::Person then
                "Bill-to Contact" := Cont.Name
            else
                if Cust.Get("Bill-to Customer No.") then
                    "Bill-to Contact" := Cust.Contact
                else
                    "Bill-to Contact" := '';
        end else begin
            "Bill-to Contact" := '';
            exit;
        end;

        ContBusinessRelation.Reset;
        ContBusinessRelation.SetCurrentKey("Link to Table", "Contact No.");
        ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
        ContBusinessRelation.SetRange("Contact No.", Cont."Company No.");
        if ContBusinessRelation.FindFirst then begin
            if "Bill-to Customer No." = '' then begin
                SkipBillToContact := true;
                Validate("Bill-to Customer No.", ContBusinessRelation."No.");
                SkipBillToContact := false;
                "Bill-to Customer Template Code" := '';
            end else
                if "Bill-to Customer No." <> ContBusinessRelation."No." then
                    Error(Text037, Cont."No.", Cont.Name, "Bill-to Customer No.");
        end else begin
            if "Document Type" = "Document Type"::Quote then begin
                Cont.TestField("Company No.");
                ContComp.Get(Cont."Company No.");
                "Bill-to Name" := ContComp."Company Name";
                "Bill-to Name 2" := ContComp."Name 2";
                "Bill-to Address" := ContComp.Address;
                "Bill-to Address 2" := ContComp."Address 2";
                "Bill-to City" := ContComp.City;
                "Bill-to Post Code" := ContComp."Post Code";
                "Bill-to County" := ContComp.County;
                "Bill-to Country/Region Code" := ContComp."Country/Region Code";
                "VAT Registration No." := ContComp."VAT Registration No.";
                Validate("Currency Code", ContComp."Currency Code");
                "Language Code" := ContComp."Language Code";
                //TBD
                /*
                if ("Bill-to Customer Template Code" = '') and (not CustTemplate.IsEmpty) then
                    Validate("Bill-to Customer Template Code", Cont.FindCustomerTemplate);
                */
            end else
                Error(Text039, Cont."No.", Cont.Name);
        end;
    end;


    procedure GetShippingTime(CalledByFieldNo: Integer)
    begin
        if (CalledByFieldNo <> CurrFieldNo) and (CurrFieldNo <> 0) then
            exit;

        if ShippingAgentService.Get("Shipping Agent Code", "Shipping Agent Service Code") then
            "Shipping Time" := ShippingAgentService."Shipping Time"
        else begin
            GetCust("Sell-to Customer No.");
            "Shipping Time" := Cust."Shipping Time"
        end;
        if not (CalledByFieldNo in [FieldNo("Shipping Agent Code"), FieldNo("Shipping Agent Service Code")]) then
            Validate("Shipping Time");
    end;


    procedure CheckCreditMaxBeforeInsert()
    var
        SalesHeader: Record "Sales Header";
        ContBusinessRelation: Record "Contact Business Relation";
        Cont: Record Contact;
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
    begin
        if HideCreditCheckDialogue then
            exit;
        if GetFilter("Sell-to Customer No.") <> '' then begin
            if GetRangeMin("Sell-to Customer No.") = GetRangeMax("Sell-to Customer No.") then begin
                Cust.Get(GetRangeMin("Sell-to Customer No."));
                if Cust."Bill-to Customer No." <> '' then
                    SalesHeader."Bill-to Customer No." := Cust."Bill-to Customer No."
                else
                    SalesHeader."Bill-to Customer No." := Cust."No.";
                CustCheckCreditLimit.SalesHeaderCheck(SalesHeader);
            end
        end else
            if GetFilter("Sell-to Contact No.") <> '' then
                if GetRangeMin("Sell-to Contact No.") = GetRangeMax("Sell-to Contact No.") then begin
                    Cont.Get(GetRangeMin("Sell-to Contact No."));
                    ContBusinessRelation.Reset;
                    ContBusinessRelation.SetCurrentKey("Link to Table", "No.");
                    ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
                    ContBusinessRelation.SetRange("Contact No.", Cont."Company No.");
                    if ContBusinessRelation.FindFirst then begin
                        Cust.Get(ContBusinessRelation."No.");
                        if Cust."Bill-to Customer No." <> '' then
                            SalesHeader."Bill-to Customer No." := Cust."Bill-to Customer No."
                        else
                            SalesHeader."Bill-to Customer No." := Cust."No.";
                        CustCheckCreditLimit.SalesHeaderCheck(SalesHeader);
                    end;
                end;
    end;


    procedure CreateInvtPutAwayPick()
    var
        WhseRequest: Record "Warehouse Request";
    begin
        TestField(Status, Status::Released);

        WhseRequest.Reset;
        WhseRequest.SetCurrentKey("Source Document", "Source No.");
        case "Document Type" of
            "Document Type"::Order:
                WhseRequest.SetRange("Source Document", WhseRequest."Source Document"::"Sales Order");
            "Document Type"::"Return Order":
                WhseRequest.SetRange("Source Document", WhseRequest."Source Document"::"Sales Return Order");
        end;
        WhseRequest.SetRange("Source No.", "No.");
        REPORT.RunModal(REPORT::"Create Invt Put-away/Pick/Mvmt", true, false, WhseRequest);
    end;


    procedure CreateTodo()
    var
        TempTodo: Record "To-do" temporary;
    begin
        TestField("Sell-to Contact No.");
        //TempTodo.CreateToDoFromSalesHeader(Rec);
    end;

    local procedure UpdateShipToAddress()
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
            if "Location Code" <> '' then begin
                Location.Get("Location Code");
                "Ship-to Name" := Location.Name;
                "Ship-to Name 2" := Location."Name 2";
                "Ship-to Address" := Location.Address;
                "Ship-to Address 2" := Location."Address 2";
                "Ship-to City" := Location.City;
                "Ship-to Post Code" := Location."Post Code";
                "Ship-to County" := Location.County;
                "Ship-to Country/Region Code" := Location."Country/Region Code";
                "Ship-to Contact" := Location.Contact;
            end else begin
                CompanyInfo.Get;
                "Ship-to Code" := '';
                "Ship-to Name" := CompanyInfo."Ship-to Name";
                "Ship-to Name 2" := CompanyInfo."Ship-to Name 2";
                "Ship-to Address" := CompanyInfo."Ship-to Address";
                "Ship-to Address 2" := CompanyInfo."Ship-to Address 2";
                "Ship-to City" := CompanyInfo."Ship-to City";
                "Ship-to Post Code" := CompanyInfo."Ship-to Post Code";
                "Ship-to County" := CompanyInfo."Ship-to County";
                "Ship-to Country/Region Code" := CompanyInfo."Ship-to Country/Region Code";
                "Ship-to Contact" := CompanyInfo."Ship-to Contact";
            end;
        end;
    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        //TBD 
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        */
        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if SalesLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ATOLink: Record "Assemble-to-Order Link";
        NewDimSetID: Integer;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text064) then
            exit;

        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.LockTable;
        if SalesLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(SalesLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if SalesLine."Dimension Set ID" <> NewDimSetID then begin
                    SalesLine."Dimension Set ID" := NewDimSetID;
                    DimMgt.UpdateGlobalDimFromDimSetID(
                      SalesLine."Dimension Set ID", SalesLine."Shortcut Dimension 1 Code", SalesLine."Shortcut Dimension 2 Code");
                    SalesLine.Modify;
                    ATOLink.UpdateAsmDimFromSalesLine(SalesLine);
                end;
            until SalesLine.Next = 0;
    end;


    procedure SetAmountToApply(AppliesToDocNo: Code[20]; CustomerNo: Code[20])
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgEntry.SetCurrentKey("Document No.");
        CustLedgEntry.SetRange("Document No.", AppliesToDocNo);
        CustLedgEntry.SetRange("Customer No.", CustomerNo);
        CustLedgEntry.SetRange(Open, true);
        if CustLedgEntry.FindFirst then begin
            if CustLedgEntry."Amount to Apply" = 0 then begin
                CustLedgEntry.CalcFields("Remaining Amount");
                CustLedgEntry."Amount to Apply" := CustLedgEntry."Remaining Amount";
            end else
                CustLedgEntry."Amount to Apply" := 0;
            CustLedgEntry."Accepted Payment Tolerance" := 0;
            CustLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
            CODEUNIT.Run(CODEUNIT::"Cust. Entry-Edit", CustLedgEntry);
        end;
    end;


    procedure LookupAdjmtValueEntries(QtyType: Option General,Invoicing)
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        SalesLine: Record "Sales Line";
        SalesShptLine: Record "Sales Shipment Line";
        ReturnRcptLine: Record "Return Receipt Line";
        TempValueEntry: Record "Value Entry" temporary;
    begin
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        TempValueEntry.Reset;
        TempValueEntry.DeleteAll;

        case "Document Type" of
            "Document Type"::Order, "Document Type"::Invoice:
                begin
                    if SalesLine.FindSet then
                        repeat
                            if (SalesLine.Type = SalesLine.Type::Item) and (SalesLine.Quantity <> 0) then
                                with SalesShptLine do begin
                                    if SalesLine."Shipment No." <> '' then begin
                                        SetRange("Document No.", SalesLine."Shipment No.");
                                        SetRange("Line No.", SalesLine."Shipment Line No.");
                                    end else begin
                                        SetCurrentKey("Order No.", "Order Line No.");
                                        SetRange("Order No.", SalesLine."Document No.");
                                        SetRange("Order Line No.", SalesLine."Line No.");
                                    end;
                                    SetRange(Correction, false);
                                    if QtyType = QtyType::Invoicing then
                                        SetFilter("Qty. Shipped Not Invoiced", '<>0');

                                    if FindSet then
                                        repeat
                                            FilterPstdDocLnItemLedgEntries(ItemLedgEntry);
                                            if ItemLedgEntry.FindSet then
                                                repeat
                                                    CreateTempAdjmtValueEntries(TempValueEntry, ItemLedgEntry."Entry No.");
                                                until ItemLedgEntry.Next = 0;
                                        until Next = 0;
                                end;
                        until SalesLine.Next = 0;
                end;
            "Document Type"::"Return Order", "Document Type"::"Credit Memo":
                begin
                    if SalesLine.FindSet then
                        repeat
                            if (SalesLine.Type = SalesLine.Type::Item) and (SalesLine.Quantity <> 0) then
                                with ReturnRcptLine do begin
                                    if SalesLine."Return Receipt No." <> '' then begin
                                        SetRange("Document No.", SalesLine."Return Receipt No.");
                                        SetRange("Line No.", SalesLine."Return Receipt Line No.");
                                    end else begin
                                        SetCurrentKey("Return Order No.", "Return Order Line No.");
                                        SetRange("Return Order No.", SalesLine."Document No.");
                                        SetRange("Return Order Line No.", SalesLine."Line No.");
                                    end;
                                    SetRange(Correction, false);
                                    if QtyType = QtyType::Invoicing then
                                        SetFilter("Return Qty. Rcd. Not Invd.", '<>0');

                                    if FindSet then
                                        repeat
                                            FilterPstdDocLnItemLedgEntries(ItemLedgEntry);
                                            if ItemLedgEntry.FindSet then
                                                repeat
                                                    CreateTempAdjmtValueEntries(TempValueEntry, ItemLedgEntry."Entry No.");
                                                until ItemLedgEntry.Next = 0;
                                        until Next = 0;
                                end;
                        until SalesLine.Next = 0;
                end;
        end;
        PAGE.RunModal(0, TempValueEntry);
    end;


    procedure CreateTempAdjmtValueEntries(var TempValueEntry: Record "Value Entry" temporary; ItemLedgEntryNo: Integer)
    var
        ValueEntry: Record "Value Entry";
    begin
        with ValueEntry do begin
            SetCurrentKey("Item Ledger Entry No.");
            SetRange("Item Ledger Entry No.", ItemLedgEntryNo);
            if FindSet then
                repeat
                    if Adjustment then begin
                        TempValueEntry := ValueEntry;
                        if TempValueEntry.Insert then;
                    end;
                until Next = 0;
        end;
    end;


    procedure GetPstdDocLinesToRevere()
    var
        SalesPostedDocLines: Page "Posted Sales Document Lines";
    begin
        GetCust("Sell-to Customer No.");
        //SalesPostedDocLines.SetToSalesHeader(Rec);
        SalesPostedDocLines.SetRecord(Cust);
        SalesPostedDocLines.LookupMode := true;
        //TBD 
        /*
        if SalesPostedDocLines.RunModal = ACTION::LookupOK then
            SalesPostedDocLines.CopyLineToDoc;
        */

        Clear(SalesPostedDocLines);
    end;


    procedure CalcInvDiscForHeader()
    var
        SalesInvDisc: Codeunit "Sales-Calc. Discount";
    begin
        SalesSetup.Get;
        if SalesSetup."Calc. Inv. Discount" then;
        //SalesInvDisc.CalculateIncDiscForHeader(Rec);
    end;


    procedure SetSecurityFilterOnRespCenter()
    begin
        if UserSetupMgt.GetSalesFilter <> '' then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserSetupMgt.GetSalesFilter);
            FilterGroup(0);
        end;

        SetRange("Date Filter", 0D, WorkDate - 1);
    end;

    procedure Authorize()
    var
    //DOPaymentTransLogEntry: Record "DO Payment Trans. Log Entry";//LKS-Raj Commented (Table Missing)
    begin
        /*
        IF NOT DOPaymentMgt.IsValidPaymentMethod("Payment Method Code") THEN
          ERROR(Text069,FIELDCAPTION("Payment Method Code"));
        DOPaymentTransLogMgt.FindValidAuthorizationEntry("Document Type","No.",DOPaymentTransLogEntry);
        IF DOPaymentTransLogEntry."Entry No." = DOPaymentMgt.AuthorizeSalesDoc(Rec,0,TRUE) THEN
          ERROR(Text067,
            DOPaymentTransLogEntry."Document Type",
            DOPaymentTransLogEntry.Amount,
            DOPaymentTransLogEntry."Transaction Date-Time",
            DOPaymentTransLogEntry."Document No.");
        "Authorization Required" := TRUE;
        MODIFY;
         */

    end;


    procedure Void()
    var
    //DOPaymentTransLogEntry: Record "DO Payment Trans. Log Entry";//LKS-Raj Commented (Table Missing)
    //DOPaymentTransLogMgt: Codeunit "DO Payment Trans. Log Mgt.";//LKS-Raj Commented (Codeunit Missing)
    begin
        /*
        IF NOT DOPaymentMgt.IsValidPaymentMethod("Payment Method Code") THEN
          ERROR(Text069,FIELDCAPTION("Payment Method Code"));
        CLEAR(DOPaymentMgt);
        //DOPaymentMgt.CheckSalesDoc(Rec);
        IF DOPaymentTransLogMgt.FindValidAuthorizationEntry("Document Type","No.",DOPaymentTransLogEntry) THEN
         // DOPaymentMgt.VoidSalesDoc(Rec,DOPaymentTransLogEntry)
        ELSE
          MESSAGE(Text068);
        "Authorization Required" := FALSE;
        MODIFY;
         */

    end;


    procedure GetCreditcardNumber(): Text[20]
    var
    //DOPaymentCreditCard: Record "DO Payment Credit Card";//LKS-Raj Commented (Table Missing)
    begin
        if "Credit Card No." = '' then
            exit('');
        //exit(DOPaymentCreditCard.GetCreditCardNumber("Credit Card No."));//LKS-Raj Commented (Table Missing)
    end;


    procedure SynchronizeForReservations(var NewSalesLine: Record "Sales Line"; OldSalesLine: Record "Sales Line")
    begin
        NewSalesLine.CalcFields("Reserved Quantity");
        if NewSalesLine."Reserved Quantity" = 0 then
            exit;
        if NewSalesLine."Location Code" <> OldSalesLine."Location Code" then
            NewSalesLine.Validate("Location Code", OldSalesLine."Location Code");
        if NewSalesLine."Bin Code" <> OldSalesLine."Bin Code" then
            NewSalesLine.Validate("Bin Code", OldSalesLine."Bin Code");
        if NewSalesLine.Modify then;
    end;


    procedure InventoryPickConflict(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DocNo: Code[20]; ShippingAdvice: Option Partial,Complete): Boolean
    var
        WarehouseActivityLine: Record "Warehouse Activity Line";
        SalesLine: Record "Sales Line";
    begin
        if ShippingAdvice <> ShippingAdvice::Complete then
            exit(false);
        WarehouseActivityLine.SetCurrentKey("Source Type", "Source Subtype", "Source No.");
        WarehouseActivityLine.SetRange("Source Type", DATABASE::"Sales Line");
        WarehouseActivityLine.SetRange("Source Subtype", DocType);
        WarehouseActivityLine.SetRange("Source No.", DocNo);
        if WarehouseActivityLine.IsEmpty then
            exit(false);
        SalesLine.SetRange("Document Type", DocType);
        SalesLine.SetRange("Document No.", DocNo);
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.IsEmpty then
            exit(false);
        exit(true);
    end;


    procedure WhseShpmntConflict(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DocNo: Code[20]; ShippingAdvice: Option Partial,Complete): Boolean
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        if ShippingAdvice <> ShippingAdvice::Complete then
            exit(false);
        WarehouseShipmentLine.SetCurrentKey("Source Type", "Source Subtype", "Source No.", "Source Line No.");
        WarehouseShipmentLine.SetRange("Source Type", DATABASE::"Sales Line");
        WarehouseShipmentLine.SetRange("Source Subtype", DocType);
        WarehouseShipmentLine.SetRange("Source No.", DocNo);
        if WarehouseShipmentLine.IsEmpty then
            exit(false);
        exit(true);
    end;


    procedure CheckCrLimit()
    begin
        if GuiAllowed and (CurrFieldNo <> 0) and ("Document Type" <= "Document Type"::Invoice) then begin
            "Amount Including VAT" := 0;
            if "Document Type" = "Document Type"::Order then
                if BilltoCustomerNoChanged then begin
                    SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SetRange("Document No.", "No.");
                    SalesLine.CalcSums("Outstanding Amount", "Shipped Not Invoiced");
                    "Amount Including VAT" := SalesLine."Outstanding Amount" + SalesLine."Shipped Not Invoiced";
                end;
            // CustCheckCreditLimit.SalesHeaderCheck(Rec);
            CalcFields("Amount Including VAT");
        end;
    end;


    procedure QtyToShipIsZero(): Boolean
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.SetFilter("Qty. to Ship", '<>0');
        exit(SalesLine.IsEmpty);
    end;


    procedure IsApprovedForPosting(): Boolean
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        /*
        PurchaseHeader.INIT;
        IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN BEGIN
          IF ApprovalMgt.TestSalesPrepayment(Rec) THEN
            ERROR(STRSUBSTNO(Text071,"Document Type","No."));
          IF ApprovalMgt.TestSalesPayment(Rec) THEN
            ERROR(STRSUBSTNO(Text072,"Document Type","No."));
          EXIT(TRUE);
        END;
         */

    end;


    procedure IsApprovedForPostingBatch(): Boolean
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        /*
        PurchaseHeader.INIT;
        IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN BEGIN
          IF ApprovalMgt.TestSalesPrepayment(Rec) THEN
            EXIT(FALSE);
          IF ApprovalMgt.TestSalesPayment(Rec) THEN
            EXIT(FALSE);
          EXIT(TRUE);
        END;
         */

    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure TaxAreaUpdate()
    // var
    //     TaxLocation: Record "Tax Area Locations";
    //     BilltoCust: Record Customer;
    // begin
    //     SalesSetup.Get;
    //     TaxLocation.SetRange("Dispatch / Receiving Location", "Location Code");
    //     if SalesSetup."Tax Dependency Type" = SalesSetup."Tax Dependency Type"::"Bill To Customer" then
    //         if "Bill-to Customer No." <> '' then begin
    //             BilltoCust.Get("Bill-to Customer No.");
    //             "Bill to Customer State" := BilltoCust."State Code";
    //             TaxLocation.SetRange("Customer / Vendor Location", BilltoCust."State Code");
    //             TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //             if TaxLocation.FindFirst then
    //                 "Tax Area Code" := TaxLocation."Tax Area Code";
    //         end;
    //     if SalesSetup."Tax Dependency Type" = SalesSetup."Tax Dependency Type"::"Ship To Customer" then begin
    //         if "Ship-to Code" <> '' then begin
    //             ShipToAddr.Get("Sell-to Customer No.", "Ship-to Code");
    //             "Bill to Customer State" := ShipToAddr.State;
    //             TaxLocation.SetRange("Customer / Vendor Location", ShipToAddr.State);
    //             TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //             if TaxLocation.FindFirst then
    //                 "Tax Area Code" := TaxLocation."Tax Area Code";
    //         end else
    //             if "Sell-to Customer No." <> '' then begin
    //                 BilltoCust.Get("Sell-to Customer No.");
    //                 "Bill to Customer State" := BilltoCust."State Code";
    //                 TaxLocation.SetRange("Customer / Vendor Location", BilltoCust."State Code");
    //                 TaxLocation.SetRange(Type, TaxLocation.Type::Customer);
    //                 if TaxLocation.FindFirst then
    //                     "Tax Area Code" := TaxLocation."Tax Area Code";
    //             end;
    //     end;
    //     if xRec."Tax Area Code" <> "Tax Area Code" then
    //         RecreateSalesLines(FieldCaption("Tax Area Code"));
    // end;
    //LKS-Raj Commented (Table Missing)


    procedure TaxAreaUpdatelines()
    begin
        if SalesLinesExist then begin
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", "Document Type");
            SalesLine.SetRange("Document No.", "No.");
            SalesLine.SetRange(Type, 1, 5);
            if SalesLine.Find('-') then begin
                Modify;
                repeat
                    SalesLine."Tax Area Code" := "Tax Area Code";
                    SalesLine.UpdateAmounts;
                    SalesLine.Modify;
                until SalesLine.Next = 0;
            end;
        end;
    end;


    procedure TaxLiableUpdate()
    begin
        if SalesLinesExist then begin
            SalesLine.SetRange("Document Type", "Document Type");
            SalesLine.SetRange("Document No.", "No.");
            if SalesLine.Find('-') then
                repeat
                    SalesLine.Validate("Tax Liable", "Tax Liable");
                    Modify;
                    SalesLine.Modify;
                until SalesLine.Next = 0;
        end;
    end;


    procedure FreeSupplyUpdate()
    begin
        if SalesLinesExist then begin
            SalesLine.SetRange("Document Type", "Document Type");
            SalesLine.SetRange("Document No.", "No.");
            if SalesLine.Find('-') then
                repeat
                    //SalesLine.Validate("Free Supply", "Free Supply");//LKS-Raj Commented (Field Missing)
                    SalesLine.Validate("Line Discount %", 100);
                    Modify;
                    SalesLine.Modify;
                until SalesLine.Next = 0;
        end;
    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure OpenExciseCentvatClaimForm()
    // var
    //     SourceCodeSetup: Record "Source Code Setup";
    //     SalesLine: Record "Sales Line";
    //     NextLineNo: Integer;
    //     GenJnlLine: Record "Gen. Journal Line";
    //     ServiceTaxRegNo: Code[20];
    //     SalesLine2: Record "Sales Line";
    // begin
    //     GetGLSetup;
    //     SourceCodeSetup.Get;
    //     GetLocation;
    //     CompanyInfo.Get;
    //     TestField(Trading, false);
    //     SalesLine.Reset;
    //     SalesLine.SetCurrentKey("Document Type", "Document No.", "Direct Debit To PLA / RG", "Excise Prod. Posting Group", Type, "No.");
    //     SalesLine.SetRange("Document Type", "Document Type");
    //     SalesLine.SetRange("Document No.", "No.");
    //     SalesLine.SetRange("Direct Debit To PLA / RG", true);
    //     if not SalesLine.Find('-') then
    //         Error(Text16500);
    //     TotalBEDAmt := 0;
    //     "TotalAED(GSI)Amt" := 0;
    //     TotalSEDAmt := 0;
    //     TotalSAEDAmt := 0;
    //     TotalCESSAmt := 0;
    //     TotalNCCDAmt := 0;
    //     TotaleCessAmt := 0;
    //     TotalSHECessAmt := 0;
    //     TotalADETAmt := 0;
    //     TotalADEAmt := 0;
    //     "TotalAED(TTA)Amt" := 0;
    //     TotalADCVATAmt := 0;
    //     repeat
    //         TotalBEDAmt += RoundExciseAmount(SalesLine."BED Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         "TotalAED(GSI)Amt" += RoundExciseAmount(SalesLine."AED(GSI) Amount",
    //             SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalSEDAmt += RoundExciseAmount(SalesLine."SED Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalSAEDAmt += RoundExciseAmount(SalesLine."SAED Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalCESSAmt += RoundExciseAmount(SalesLine."CESS Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalNCCDAmt += RoundExciseAmount(SalesLine."NCCD Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotaleCessAmt += RoundExciseAmount(SalesLine."eCess Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalSHECessAmt += RoundExciseAmount(SalesLine."SHE Cess Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)")
    //           ;
    //         TotalADETAmt += RoundExciseAmount(SalesLine."ADET Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         TotalADEAmt += RoundExciseAmount(SalesLine."ADE Amount", SalesLine."Qty. to Invoice (Base)", SalesLine."Quantity (Base)");
    //         "TotalAED(TTA)Amt" += RoundExciseAmount(SalesLine."AED(TTA) Amount", SalesLine."Qty. to Invoice (Base)",
    //             SalesLine."Quantity (Base)");
    //         TotalADCVATAmt += RoundExciseAmount(SalesLine."ADC VAT Amount", SalesLine."Qty. to Invoice (Base)",
    //             SalesLine."Quantity (Base)");
    //         if ServiceTaxRegNo = '' then
    //             ServiceTaxRegNo := SalesLine."Service Tax Registration No.";

    //     until SalesLine.Next = 0;
    //     if TotalBEDAmt + "TotalAED(GSI)Amt" + TotalSEDAmt + TotalSAEDAmt + TotalCESSAmt + TotalNCCDAmt + TotaleCessAmt + TotalADETAmt +
    //        TotalADEAmt + "TotalAED(TTA)Amt" + TotalADCVATAmt + TotalSHECessAmt = 0
    //     then
    //         Error(Text16501);

    //     SalesLine.Reset;
    //     SalesLine.SetCurrentKey("Document Type", "Document No.", "Direct Debit To PLA / RG", "Excise Prod. Posting Group", Type, "No.");
    //     SalesLine.SetRange("Document Type", "Document Type");
    //     SalesLine.SetRange("Document No.", "No.");
    //     SalesLine.SetRange("Direct Debit To PLA / RG", true);
    //     SalesLine.SetFilter("Service Tax Registration No.", '<>%1', '');

    //     SalesLine2.Reset;
    //     SalesLine2.SetCurrentKey("Document Type", "Document No.", "Direct Debit To PLA / RG", "Excise Prod. Posting Group", Type, "No.");
    //     SalesLine2.SetRange("Document Type", "Document Type");
    //     SalesLine2.SetRange("Document No.", "No.");
    //     SalesLine2.SetRange("Direct Debit To PLA / RG", true);
    //     SalesLine2.SetRange("Service Tax Registration No.", ServiceTaxRegNo);

    //     if (SalesLine.Count <> SalesLine2.Count) and (ServiceTaxRegNo <> '') then
    //         Error(Text16502, "Document Type", "No.");

    //     GenJnlLine.Reset;
    //     GenJnlLine.SetRange("Journal Template Name", '');
    //     GenJnlLine.SetRange("Journal Batch Name", '');
    //     if GenJnlLine.FindLast then
    //         NextLineNo := 10000 + GenJnlLine."Line No."
    //     else
    //         NextLineNo := 10000;

    //     GenJnlLine.SetRange("Document No.", "No.");
    //     if not GenJnlLine.FindLast then begin
    //         GenJnlLine.Init;
    //         GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
    //         GenJnlLine."Posting Date" := "Posting Date";
    //         GenJnlLine."Document Date" := "Document Date";
    //         GenJnlLine."Document No." := "No.";
    //         GenJnlLine."Source Code" := SourceCodeSetup.Sales;
    //         GenJnlLine."System-Created Entry" := true;
    //         GenJnlLine."VAT Posting" := GenJnlLine."VAT Posting"::"Automatic VAT Entry";
    //         GenJnlLine."VAT Calculation Type" := GenJnlLine."VAT Calculation Type"::"Normal VAT";
    //         GenJnlLine."Allow Application" := true;
    //         GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
    //         GenJnlLine."Bal. VAT Calculation Type" := GenJnlLine."Bal. VAT Calculation Type"::"Normal VAT";
    //         GenJnlLine."Additional-Currency Posting" := GenJnlLine."Additional-Currency Posting"::None;
    //         if "Location Code" <> '' then
    //             GenJnlLine."E.C.C. No." := Location."E.C.C. No."
    //         else
    //             GenJnlLine."E.C.C. No." := CompanyInfo."E.C.C. No.";
    //         GenJnlLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
    //         GenJnlLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
    //         GenJnlLine."Pay Excise" := true;
    //         // GenJnlLine."BED Amount" := TotalBEDAmt;
    //         // GenJnlLine."AED(GSI) Amount" := "TotalAED(GSI)Amt";
    //         // GenJnlLine."SED Amount" := TotalSEDAmt;
    //         // GenJnlLine."SAED Amount" := TotalSAEDAmt;
    //         // GenJnlLine."CESS Amount" := TotalCESSAmt;
    //         // GenJnlLine."NCCD Amount" := TotalNCCDAmt;
    //         // GenJnlLine."eCess Amount" := TotaleCessAmt;
    //         // GenJnlLine."SHE Cess Amount" := TotalSHECessAmt;
    //         // GenJnlLine."ADET Amount" := TotalADETAmt;
    //         // GenJnlLine."ADE Amount" := TotalADEAmt;
    //         // GenJnlLine."AED(TTA) Amount" := "TotalAED(TTA)Amt";
    //         // GenJnlLine."ADC VAT Amount" := TotalADCVATAmt;
    //         GenJnlLine."Line No." := NextLineNo;
    //         GenJnlLine."Service Tax Registration No." := ServiceTaxRegNo;
    //         GenJnlLine.Insert;
    //     end else begin
    //         if "Location Code" <> '' then
    //             GenJnlLine."E.C.C. No." := Location."E.C.C. No."
    //         else
    //             GenJnlLine."E.C.C. No." := CompanyInfo."E.C.C. No.";
    //         // GenJnlLine."BED Amount" := TotalBEDAmt;
    //         // GenJnlLine."AED(GSI) Amount" := "TotalAED(GSI)Amt";
    //         // GenJnlLine."SED Amount" := TotalSEDAmt;
    //         // GenJnlLine."SAED Amount" := TotalSAEDAmt;
    //         // GenJnlLine."CESS Amount" := TotalCESSAmt;
    //         // GenJnlLine."NCCD Amount" := TotalNCCDAmt;
    //         // GenJnlLine."eCess Amount" := TotaleCessAmt;
    //         // GenJnlLine."SHE Cess Amount" := TotalSHECessAmt;
    //         // GenJnlLine."ADET Amount" := TotalADETAmt;
    //         // GenJnlLine."ADE Amount" := TotalADEAmt;
    //         // GenJnlLine."AED(TTA) Amount" := "TotalAED(TTA)Amt";
    //         // GenJnlLine."ADC VAT Amount" := TotalADCVATAmt;
    //         GenJnlLine."Service Tax Registration No." := ServiceTaxRegNo;
    //         GenJnlLine.Modify;
    //     end;
    //     GenJnlLine.SetRange("Document No.", "No.");
    //     InsertCenvatDetails(GenJnlLine);
    //     CenvatClaimForm.SetECCNo(GenJnlLine."E.C.C. No.");
    //     CenvatClaimForm.GetRecord(GenJnlLine);
    //     Commit;

    //     ExciseCenvatClaim.Reset;
    //     ExciseCenvatClaim.SetRange("Journal Template Name", '');
    //     ExciseCenvatClaim.SetRange("Journal Batch Name", '');
    //     ExciseCenvatClaim.SetRange("Document No.", "No.");
    //     if ExciseCenvatClaim.FindFirst then begin
    //         CenvatClaimForm.SetTableView(ExciseCenvatClaim);
    //         CenvatClaimForm.GetDateFilter("Posting Date", "Posting Date");
    //         CenvatClaimForm.Run;
    //     end
    // end;

    // 
    // procedure RoundExciseAmount(ExciseDutyAmount: Decimal; Qty: Decimal; TotalQty: Decimal): Decimal
    // var
    //     ExciseRoundingDirection: Text[1];
    //     ExciseRoundingPrecision: Decimal;
    // begin
    //     if TotalQty = 0 then
    //         exit;
    //     GetGLSetup;
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
    //     exit(Round(ExciseDutyAmount * (Qty / TotalQty), ExciseRoundingPrecision, ExciseRoundingDirection));
    // end;
    //LKS-Raj Commented (Table Missing)

    procedure GetGLSetup()
    begin
        if not GLSetupRead then
            GLSetup.Get;
        GLSetupRead := true;
    end;


    procedure GetLocation()
    begin
        if "Location Code" <> '' then
            Location.Get("Location Code");
    end;


    procedure UpdateGenJnlLInePostingDate()
    var
        GenJnlLIne: Record "Gen. Journal Line";
    begin
        GenJnlLIne.Reset;
        GenJnlLIne.SetRange("Journal Template Name", '');
        GenJnlLIne.SetRange("Journal Batch Name", '');
        GenJnlLIne.SetRange("Document No.", "No.");
        if GenJnlLIne.FindFirst then begin
            GenJnlLIne."Posting Date" := "Posting Date";
            GenJnlLIne.Modify(true);
        end;
    end;


    procedure GetGateEntryLines()
    begin
        // SalesHeader2.GET("Document Type","No."); // PS35965
        PostedGateEntryLine.ModifyAll(Mark, false);
        PostedGateEntryLine.Reset;
        PostedGateEntryLine.SetCurrentKey("Entry Type", "Source Type", "Source No.", Status);
        case "Document Type" of
            "Document Type"::"Return Order":
                begin
                    PostedGateEntryLine.SetRange("Entry Type", PostedGateEntryLine."Entry Type"::Inward);
                    PostedGateEntryLine.SetRange("Source Type", PostedGateEntryLine."Source Type"::"Sales Return Order");
                    PostedGateEntryLine.SetRange("Source No.", "No.");
                    PostedGateEntryLine.SetRange(Status, PostedGateEntryLine.Status::Open);
                end;
            "Document Type"::"Credit Memo":
                begin
                    PostedGateEntryLine.SetRange("Entry Type", PostedGateEntryLine."Entry Type"::Inward);
                    PostedGateEntryLine.SetRange("Source Type", PostedGateEntryLine."Source Type"::" ");
                    PostedGateEntryLine.SetRange(Status, PostedGateEntryLine.Status::Open);
                end;
        end;
        // PS35965.begin
        GateEntryAttachment.SetCurrentKey("Source Type", "Source No.", "Entry Type", "Gate Entry No.", "Line No.");
        if PostedGateEntryLine.FindSet then
            repeat
                GateEntryAttachment.SetRange("Source No.", PostedGateEntryLine."Source No.");
                GateEntryAttachment.SetRange("Gate Entry No.", PostedGateEntryLine."Gate Entry No.");
                GateEntryAttachment.SetRange("Line No.", PostedGateEntryLine."Line No.");
                if not GateEntryAttachment.FindFirst then begin
                    PostedGateEntryLine.Mark := true;
                    PostedGateEntryLine.Modify;
                    Commit;
                end;
            until PostedGateEntryLine.Next = 0;

        PostedGateEntryLine.Reset;
        PostedGateEntryLine.SetCurrentKey("Entry Type", "Source Type", "Source No.", Status);
        PostedGateEntryLine.SetRange(Mark, true);

        // PS35965.begin
        if PostedGateEntryLine.FindFirst then begin
            // CLEAR(PostedGateEntryLineList);
            //LKS-Raj Commented (Page Missing)
            // PostedGateEntryLineList.SetTableView(PostedGateEntryLine);
            // if PAGE.RunModal(PAGE::"Posted Gate Entry Line List", PostedGateEntryLine) = ACTION::LookupOK then begin
            //     GateEntryAttachment.Init;
            //     GateEntryAttachment."Source Type" := PostedGateEntryLine."Source Type";
            //     GateEntryAttachment."Source No." := PostedGateEntryLine."Source No.";
            //     GateEntryAttachment."Entry Type" := PostedGateEntryLine."Entry Type";
            //     GateEntryAttachment."Gate Entry No." := PostedGateEntryLine."Gate Entry No.";
            //     GateEntryAttachment."Line No." := PostedGateEntryLine."Line No.";
            //     GateEntryAttachment."Sales Credit Memo No." := "No.";
            //     GateEntryAttachment.Insert;
            // end;
            //LKS-Raj Commented (Page Missing)
        end;
        // GateEntryAttachment.SETCURRENTKEY("Source Type","Source No.","Entry Type","Gate Entry No.","Line No.");
        // IF PostedGateEntryLine.FINDSET THEN
        // REPEAT
        // GateEntryAttachment.SETRANGE("Source No.",PostedGateEntryLine."Source No.");
        // GateEntryAttachment.SETRANGE("Gate Entry No.",PostedGateEntryLine."Gate Entry No.");
        // GateEntryAttachment.SETRANGE("Line No.",PostedGateEntryLine."Line No.");
        // IF NOT GateEntryAttachment.FINDFIRST THEN
        //  PostedGateEntryLine.MARK(TRUE);
        // UNTIL PostedGateEntryLine.NEXT = 0;
        // PostedGateEntryLine.MARKEDONLY(TRUE);
        // IF PostedGateEntryLine.FINDFIRST THEN BEGIN
        // CLEAR(PostedGateEntryLineList);
        // PostedGateEntryLineList.SETTABLEVIEW(PostedGateEntryLine);
        // PostedGateEntryLineList.LOOKUPMODE := TRUE;
        // IF "Document Type" = "Document Type"::"Return Order" THEN
        // PostedGateEntryLineList.GetDocType(2)
        // ELSE IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
        // PostedGateEntryLineList.GetDocType(8);
        // PostedGateEntryLineList.GetDocumentNo("No.");
        // END;
        // PostedGateEntryLineList.RUNMODAL;
        // END;
        // PS35965.end
    end;

    //LKS-Raj Commented (Table Missing)
    // 
    // procedure InsertCenvatDetails(GenJnlLine: Record "Gen. Journal Line")
    // begin
    //     ExciseCenvatClaim.Reset;
    //     ExciseCenvatClaim.SetRange("Journal Template Name", '');
    //     ExciseCenvatClaim.SetRange("Journal Batch Name", '');
    //     ExciseCenvatClaim.SetRange("Line No.", GenJnlLine."Line No.");
    //     if not ExciseCenvatClaim.FindFirst then begin
    //         ExciseCenvatClaim.Init;
    //         ExciseCenvatClaim."Journal Template Name" := GenJnlLine."Journal Template Name";
    //         ExciseCenvatClaim."Journal Batch Name" := GenJnlLine."Journal Batch Name";
    //         ExciseCenvatClaim."Line No." := GenJnlLine."Line No.";
    //         ExciseCenvatClaim."Document No." := GenJnlLine."Document No.";
    //         ExciseCenvatClaim."BED Amount" := Abs(TotalBEDAmt);
    //         ExciseCenvatClaim."AED(GSI) Amount" := Abs("TotalAED(GSI)Amt");
    //         ExciseCenvatClaim."AED(TTA) Amount" := Abs("TotalAED(TTA)Amt");
    //         ExciseCenvatClaim."SED Amount" := Abs(TotalSEDAmt);
    //         ExciseCenvatClaim."SAED Amount" := Abs(TotalSAEDAmt);
    //         ExciseCenvatClaim."CESS Amount" := Abs(TotalCESSAmt);
    //         ExciseCenvatClaim."NCCD Amount" := Abs(TotalNCCDAmt);
    //         ExciseCenvatClaim."eCess Amount" := Abs(TotaleCessAmt);
    //         ExciseCenvatClaim."SHE Cess Amount" := Abs(TotalSHECessAmt);
    //         ExciseCenvatClaim."ADET Amount" := Abs(TotalADETAmt);
    //         ExciseCenvatClaim."ADE Amount" := Abs(TotalADEAmt);
    //         ExciseCenvatClaim."E.C.C. No." := GenJnlLine."E.C.C. No.";
    //         ExciseCenvatClaim.Insert(true);
    //     end else begin
    //         ExciseCenvatClaim."Journal Template Name" := GenJnlLine."Journal Template Name";
    //         ExciseCenvatClaim."Journal Batch Name" := GenJnlLine."Journal Batch Name";
    //         ExciseCenvatClaim."Line No." := GenJnlLine."Line No.";
    //         ExciseCenvatClaim."Document No." := GenJnlLine."Document No.";
    //         ExciseCenvatClaim."BED Amount" := Abs(TotalBEDAmt);
    //         ExciseCenvatClaim."AED(GSI) Amount" := Abs("TotalAED(GSI)Amt");
    //         ExciseCenvatClaim."AED(TTA) Amount" := Abs("TotalAED(TTA)Amt");
    //         ExciseCenvatClaim."SED Amount" := Abs(TotalSEDAmt);
    //         ExciseCenvatClaim."SAED Amount" := Abs(TotalSAEDAmt);
    //         ExciseCenvatClaim."CESS Amount" := Abs(TotalCESSAmt);
    //         ExciseCenvatClaim."NCCD Amount" := Abs(TotalNCCDAmt);
    //         ExciseCenvatClaim."eCess Amount" := Abs(TotaleCessAmt);
    //         ExciseCenvatClaim."SHE Cess Amount" := Abs(TotalSHECessAmt);
    //         ExciseCenvatClaim."ADET Amount" := Abs(TotalADETAmt);
    //         ExciseCenvatClaim."ADE Amount" := Abs(TotalADEAmt);
    //         ExciseCenvatClaim."E.C.C. No." := GenJnlLine."E.C.C. No.";
    //         ExciseCenvatClaim.Modify(true);
    //     end;
    // end;

    // 
    // procedure InitTradingNoSeries()
    // begin
    //     GetLocation;
    //     SalesSetup.Get;
    //     case "Document Type" of
    //         "Document Type"::Quote, "Document Type"::Order, "Document Type"::"Blanket Order":
    //             begin
    //                 if not Trading then begin
    //                     if Location."Sales Invoice Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos.");
    //                     if Location."Sales Shipment Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shipment Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Shipment Nos.");
    //                 end else begin
    //                     if Location."Sales Invoice Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos. (Trading)");
    //                     if Location."Sales Shpt. Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shpt. Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Sales Shpt. (Trading)");
    //                 end;
    //             end;
    //         "Document Type"::Invoice:
    //             begin
    //                 if not Trading then begin
    //                     if Location."Sales Invoice Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos.");
    //                     if (Location."Sales Shipment Nos." <> '') and SalesSetup."Shipment on Invoice" then
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shipment Nos.")
    //                     else
    //                         if (Location."Sales Shipment Nos." = '') and SalesSetup."Shipment on Invoice" then
    //                             NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Shipment Nos.");
    //                 end else begin
    //                     if Location."Sales Invoice Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Invoice Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Invoice Nos. (Trading)");

    //                     if (Location."Sales Shpt. Nos. (Trading)" <> '') and SalesSetup."Shipment on Invoice" then
    //                         NoSeriesMgt.SetDefaultSeries("Shipping No. Series", Location."Sales Shpt. Nos. (Trading)")
    //                     else
    //                         if (Location."Sales Shpt. Nos. (Trading)" = '') and SalesSetup."Shipment on Invoice" then
    //                             NoSeriesMgt.SetDefaultSeries("Shipping No. Series", SalesSetup."Posted Sales Shpt. (Trading)");
    //                 end;
    //             end;
    //         "Document Type"::"Return Order":
    //             begin
    //                 if not Trading then begin
    //                     if Location."Sales Credit Memo Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Credit Memo Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Credit Memo Nos.");
    //                     if Location."Sales Return Receipt Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Return Receipt Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
    //                 end else begin
    //                     if Location."Sale Cr. Memo Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sale Cr. Memo Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Sale Cr. Memo (Trading)");
    //                     if Location."Sales Ret Rcpt Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Ret Rcpt Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Ret Rcpt Nos. (Trading)");
    //                 end;
    //             end;
    //         "Document Type"::"Credit Memo":
    //             begin
    //                 if not Trading then begin
    //                     if Location."Sales Credit Memo Nos." <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sales Credit Memo Nos.")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Credit Memo Nos.");
    //                     if (Location."Sales Return Receipt Nos." <> '') and SalesSetup."Return Receipt on Credit Memo" then
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Return Receipt Nos.")
    //                     else
    //                         if (Location."Sales Return Receipt Nos." = '') and SalesSetup."Return Receipt on Credit Memo" then
    //                             NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
    //                 end else begin
    //                     if Location."Sale Cr. Memo Nos. (Trading)" <> '' then
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", Location."Sale Cr. Memo Nos. (Trading)")
    //                     else
    //                         NoSeriesMgt.SetDefaultSeries("Posting No. Series", SalesSetup."Posted Sale Cr. Memo (Trading)");
    //                     if (Location."Sales Ret Rcpt Nos. (Trading)" <> '') and SalesSetup."Return Receipt on Credit Memo" then
    //                         NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", Location."Sales Ret Rcpt Nos. (Trading)")
    //                     else
    //                         if (Location."Sales Ret Rcpt Nos. (Trading)" = '') and SalesSetup."Return Receipt on Credit Memo" then
    //                             NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series", SalesSetup."Posted Ret Rcpt Nos. (Trading)");
    //                 end;
    //             end;
    //     end;
    // end;
    //LKS-Raj Commented (Table Missing)

    procedure SendToPosting(PostingCodeunitID: Integer)
    begin
        if not IsApprovedForPosting then
            exit;
        CODEUNIT.Run(PostingCodeunitID, Rec);
    end;


    procedure CancelBackgroundPosting()
    var
        SalesPostViaJobQueue: Codeunit "Sales Post via Job Queue";
    begin
        //SalesPostViaJobQueue.CancelQueueEntry(Rec);
    end;
}

