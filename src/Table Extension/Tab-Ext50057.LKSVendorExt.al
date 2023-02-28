tableextension 50057 "LKSVendorExt" extends Vendor
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on ""Vendor Location"(Field 16361)".


        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
          "Search Name" := Name;
        if Name <> xRec.Name then
          UpdateDedName;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        //8112
        //2021 Automatic Create Dimension in Dimension Value
          DimValue.Init;
          DimValue."Dimension Code" := 'VENDOR';
          DimValue.Validate(DimValue.Code,"No.");
          DimValue.Name:= Name;
          DimValue.Validate(DimValue."Dimension Value Type",DimValue."Dimension Value Type"::Standard);
          DimValue.Insert;
        //2021 Automatic Create Dimension in Dimension Value
        //8112
        */
        //end;


        //Unsupported feature: Code Insertion on ""Country/Region Code"(Field 35)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112
        if ("Country/Region Code" <> xRec."Country/Region Code") and (xRec."Country/Region Code" <> '') then
          PostCode.ClearFields(City,"Post Code",County);
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on ""IC Partner Code"(Field 119).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if xRec."IC Partner Code" <> "IC Partner Code" then begin
          if not VendLedgEntry.SetCurrentKey("Vendor No.",Open) then
            VendLedgEntry.SetCurrentKey("Vendor No.");
          VendLedgEntry.SetRange("Vendor No.","No.");
          VendLedgEntry.SetRange(Open,true);
          if VendLedgEntry.FindLast then
            Error(Text010,FieldCaption("IC Partner Code"),TableCaption);

          VendLedgEntry.Reset;
          VendLedgEntry.SetCurrentKey("Vendor No.","Posting Date");
          VendLedgEntry.SetRange("Vendor No.","No.");
          AccountingPeriod.SetRange(Closed,false);
        #13..29
          ICPartner."Vendor No." := '';
          ICPartner.Modify;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if xRec."IC Partner Code" <> "IC Partner Code" then begin
          //8112
        #10..12
          if AccountingPeriod.FindFirst then
            VendLedgEntry.SetFilter("Posting Date",'>=%1',AccountingPeriod."Starting Date");
          if VendLedgEntry.FindFirst then
            if not Confirm(Text009,false,TableCaption) then
              "IC Partner Code" := xRec."IC Partner Code";
          VendLedgEntry.Reset;
          //8112
        #2..32
        */
        //end;
        field(50000; "Client Name"; Text[60])
        {
        }
        field(50001; "Client Sector"; Text[60])
        {
        }
        field(50002; "Client Old Name"; Text[60])
        {
        }
        field(50003; "Client Group Name"; Text[60])
        {
        }
        field(50004; Classification; Text[30])
        {
        }
        field(50005; "Enrolment Year"; Text[4])
        {
        }
        field(50006; "Enrolment Month"; Text[4])
        {
        }
        field(50007; "Rain Maker"; Text[60])
        {
        }
        field(50008; "Rain Giver"; Text[60])
        {
        }
        field(50009; "STC No."; Text[30])
        {
        }
        field(50010; "Service Tax No."; Text[30])
        {
        }
        field(50011; "Central Excise Regn No."; Text[30])
        {
        }
        field(50012; "Customer Regn No."; Text[30])
        {
        }
        field(50013; "Importer Exporter No."; Text[30])
        {
        }
        field(50014; "Entity Status"; Text[50])
        {
        }
    }

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        //DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode); //TBD
        //DimMgt.SaveDefaultDim(DATABASE::Vendor, "No.", FieldNumber, ShortcutDimCode);  //TBD
    end;

    var
        "--2021--": Integer;
        DimValue: Record "Dimension Value";
        CommonMaster: Record "Common Master";
}

