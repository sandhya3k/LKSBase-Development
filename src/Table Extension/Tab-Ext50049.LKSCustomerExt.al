tableextension 50049 "LKSCustomerExt" extends Customer
{
    fields
    {

        //Unsupported feature: Property Insertion (SQL Data Type) on ""No."(Field 1)".


        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on "Address(Field 5)".


        //Unsupported feature: Code Modification on ""IC Partner Code"(Field 119).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if xRec."IC Partner Code" <> "IC Partner Code" then begin
          if not CustLedgEntry.SetCurrentKey("Customer No.",Open) then
            CustLedgEntry.SetCurrentKey("Customer No.");
          CustLedgEntry.SetRange("Customer No.","No.");
          CustLedgEntry.SetRange(Open,true);
          if CustLedgEntry.FindLast then
            Error(Text012,FieldCaption("IC Partner Code"),TableCaption);

          CustLedgEntry.Reset;
          CustLedgEntry.SetCurrentKey("Customer No.","Posting Date");
          CustLedgEntry.SetRange("Customer No.","No.");
          AccountingPeriod.SetRange(Closed,false);
        #13..29
          ICPartner."Customer No." := '';
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
            CustLedgEntry.SetFilter("Posting Date",'>=%1',AccountingPeriod."Starting Date");
          if CustLedgEntry.FindFirst then
            if not Confirm(Text011,false,TableCaption) then
              "IC Partner Code" := xRec."IC Partner Code";
                 CustLedgEntry.Reset;
          //8112
        #2..32
        */
        //end;
        field(50000; "Client Name"; Text[100])
        {

            trigger OnValidate()
            begin
                if StrLen("Client Name") > 50 then begin
                    Name := CopyStr("Client Name", 1, 50);
                    "Name 2" := CopyStr("Client Name", 51, StrLen("Client Name"));
                end else begin
                    Name := "Client Name";
                end;
            end;
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
        field(50015; "Client For"; Text[30])
        {
        }
        field(50016; "GST Reg No."; Code[16])
        {
            Description = 'Team::7814';
        }
        modify("IC Partner Code")
        {
            trigger OnBeforeValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                AccountingPeriod: Record "Accounting Period";
                Text011: Label 'Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?';
            begin
                IF xRec."IC Partner Code" <> "IC Partner Code" THEN BEGIN
                    //8112
                    CustLedgEntry.SETCURRENTKEY("Customer No.", "Posting Date");
                    CustLedgEntry.SETRANGE("Customer No.", "No.");
                    AccountingPeriod.SETRANGE(Closed, FALSE);
                    IF AccountingPeriod.FINDFIRST THEN
                        CustLedgEntry.SETFILTER("Posting Date", '>=%1', AccountingPeriod."Starting Date");
                    IF CustLedgEntry.FINDFIRST THEN
                        IF NOT CONFIRM(Text011, FALSE, TABLECAPTION) THEN
                            "IC Partner Code" := xRec."IC Partner Code";
                    CustLedgEntry.RESET;
                    //8112
                end;
            end;
        }
    }
    keys
    {
        //TBD
        /*
        key(Key1; "Global Dimension 1 Code")
        {
        }
        */
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      SalesSetup.Get;
      SalesSetup.TestField("Customer Nos.");
    #4..11
    DimMgt.UpdateDefaultDim(
      DATABASE::Customer,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
      //8112
    //2021 Automatic Flow of Posting Group
      "Gen. Bus. Posting Group" := 'General';
      "Customer Posting Group" := 'General';
      "VAT Bus. Posting Group" := 'General';
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
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := Today;

    if IsContactUpdateNeeded then begin
    #4..7
        if Find then;
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    //8112

    {
    //509::Updating Collection Common Client Master on Entity Updload
    CommonMaster.RESET;
    CommonMaster.SETRANGE("Master Type",CommonMaster."Master Type"::Client);
    CommonMaster.SETRANGE("Master ID","No.");
    CommonMaster.SETFILTER("Division Type",'<>IPR');
    IF CommonMaster.FINDSET THEN BEGIN
      CommonMaster."Master Description" := Name;
      CommonMaster.Address := Address;
      CommonMaster."Address 2" := "Address 2";
      CommonMaster.City := City;
      CommonMaster.MODIFY;
    END;
    //509::End
     }
       recDimensionValue.Reset;
       recDimensionValue.SetRange("Dimension Code",'ENTITY');
       recDimensionValue.SetRange(Code, "No.");
       if recDimensionValue.Find('-') then begin
          recDimensionValue.Name :=Name;
          recDimensionValue.Modify;
       end;
    //8112
    */
    //end;

    procedure LookUpAdjmtValueEntries(CustDateFilter: Text[30])
    var
        ValueEntry: Record "Value Entry";
    begin
        ValueEntry.SetCurrentKey("Source Type", "Source No.");
        ValueEntry.SetRange("Source Type", ValueEntry."Source Type"::Customer);
        ValueEntry.SetRange("Source No.", "No.");
        ValueEntry.SetFilter("Posting Date", CustDateFilter);
        ValueEntry.SetFilter("Global Dimension 1 Code", GetFilter("Global Dimension 1 Filter"));
        ValueEntry.SetFilter("Global Dimension 2 Code", GetFilter("Global Dimension 2 Filter"));
        ValueEntry.SetRange(Adjustment, true);
        ValueEntry.SetRange("Expected Cost", false);
        PAGE.RunModal(0, ValueEntry);
    end;

    var
        CommonMaster: Record "Common Master";
        recDimensionValue: Record "Dimension Value";
}

