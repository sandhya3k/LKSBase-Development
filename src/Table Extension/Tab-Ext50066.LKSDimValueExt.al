tableextension 50066 "LKSDimValueExt" extends "Dimension Value"
{
    // Integartion LCMS
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 3)".

        field(50000; "Case-Office ID"; Code[10])
        {
            Description = 'LCMS Integration';

            trigger OnValidate()
            begin
                //Integartion LCMS
                if "Case-Client ID" <> '' then
                    ShiptoAddress.Get("Case-Client ID", "Case-Office ID");
            end;
        }
        field(50001; "Case-Client ID"; Code[20])
        {
            Description = 'LCMS Integration';
            TableRelation = Customer;

            trigger OnValidate()
            begin
                //Integartion LCMS
                if "Case-Office ID" <> '' then
                    ShiptoAddress.Get("Case-Client ID", "Case-Office ID");
            end;
        }
        field(50002; "Case-Process"; Text[30])
        {
        }
        field(50003; "Case-Document Name"; Text[50])
        {
        }
        field(50004; "Case-Activity Type"; Text[100])
        {
        }
        field(50005; "Case-Solution"; Text[30])
        {
        }
        field(50006; "Case-Branch"; Text[30])
        {
            Description = 'LCMS Integration';
            TableRelation = Location;
        }
        field(50007; "Case-Practice"; Text[50])
        {
        }
        field(50008; "Case-Area"; Text[50])
        {
            Description = '40->50 LCMS Integration';
        }
        field(50009; "Case-Rain Maker"; Text[60])
        {
        }
        field(50010; "Case-Rain Giver"; Text[60])
        {
        }
        field(50011; "Case-Forum"; Text[100])
        {
        }
        field(50012; "Case-Sub Forum"; Text[100])
        {
        }
        field(50013; "Case-Creation Date"; Date)
        {
        }
        field(50014; "Case-Referance Type"; Text[20])
        {
        }
        field(50015; "Case-Forum City"; Text[60])
        {
        }
        field(50016; "Case-Target Forum"; Text[60])
        {
        }
        field(50017; "Case-Target Sub Forum"; Text[60])
        {
        }
        field(50018; "Case-Target Forum City"; Text[60])
        {
        }
        field(50019; "Case-Owner1"; Text[64])
        {
            Description = 'LCMS Integration';
            TableRelation = Employee;

            trigger OnValidate()
            var
                DimensionValueL: Record "Dimension Value";
            begin
            end;
        }
        field(50020; "Case-Owner2"; Text[64])
        {
            Description = 'LCMS Integration';
            TableRelation = Employee;

            trigger OnValidate()
            var
                DimensionValueL: Record "Dimension Value";
            begin
                //Integartion LCMS
                if "Dimension Code" = 'CASE' then begin
                    if "Case-Owner2" <> '' then begin
                        DimensionValueL.Reset;
                        DimensionValueL.SetRange("Dimension Code", 'OWNER2');
                        DimensionValueL.SetRange(Code, "Case-Owner2");
                        if DimensionValueL.Count = 0 then
                            Error('Case-Owner2 %1 not exists in Case-Owner2 dimension for the case %2', Associate, Code);
                        if DimensionValueL.FindFirst then begin
                            if "Group-Head" <> '' then begin
                                DimensionValue.Reset;
                                DimensionValue.SetRange("Dimension Code", 'GROUPHEAD');
                                DimensionValue.SetRange(Code, "Group-Head");
                                if DimensionValue.FindFirst then begin
                                    if DimensionValue.Code <> DimensionValueL."Group-Head" then
                                        Error('Group Head %1 of Owner1 %2 doesnot belong for this Group Code %3 in Case %4', DimensionValueL."Group-Head", "Case-Owner2", "Group-Head", Code);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        }
        field(50021; "Region-Head"; Text[100])
        {
        }
        field(50022; "Branch-Head"; Text[100])
        {
        }
        field(50023; "Branch-Region ID"; Code[20])
        {
        }
        field(50024; "Group-Head"; Text[100])
        {

            trigger OnValidate()
            var
                DimensionValueL: Record "Dimension Value";
            begin
                //Integartion LCMS
                if "Dimension Code" = 'CASE' then begin
                    if "Group-Head" <> '' then begin
                        DimensionValue.Reset;
                        DimensionValue.SetRange("Dimension Code", 'GROUPHEAD');
                        DimensionValue.SetRange(Code, "Group-Head");
                        if DimensionValue.Count = 0 then
                            Error('Group-Code %1 doesnot exists', "Group-Head");
                        if DimensionValue.FindFirst then begin
                            if "Case-Owner2" <> '' then begin
                                DimensionValueL.Reset;
                                DimensionValueL.SetRange("Dimension Code", 'OWNER2');
                                DimensionValueL.SetRange(Code, "Case-Owner2");
                                if DimensionValueL.FindFirst then begin
                                    if DimensionValue.Code <> DimensionValueL."Group-Head" then
                                        Error('Group Head %1 of Owner2 %2 doesnot belong for this Group Code %3 in Case %4', DimensionValueL."Group-Head", "Case-Owner2", "Group-Head", Code);
                                end;
                            end;
                            if Associate <> '' then begin
                                DimensionValueL.Reset;
                                DimensionValueL.SetRange("Dimension Code", 'ASSOCIATES');
                                DimensionValueL.SetRange(Code, Associate);
                                if DimensionValueL.FindFirst then begin
                                    if DimensionValue.Code <> DimensionValueL."Group-Head" then
                                        Error('Group Head %1 of Associates %2 doesnot belong for this Group Code %3 in Case %4', DimensionValueL."Group-Head", Associate, "Group-Head", Code);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        }
        field(50025; "Group-Branch ID"; Code[20])
        {
        }
        field(50026; "Group-Region ID"; Code[20])
        {
        }
        field(50027; "Case-Referance No"; Text[100])
        {
        }
        field(50028; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(50029; Correspondence_Contact_ID; Code[20])
        {
            Description = 'LCMS Integration';
            TableRelation = Contact;

            trigger OnValidate()
            var
                ContBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                Text001: Label 'Correspondence Contact Id  %1 %2 is related to a different company than Client %3.';
            begin
                //Integartion LCMS
                if "Dimension Code" = 'CASE' then begin
                    if Correspondence_Contact_ID = '' then
                        Error('Correspondence_Contact_ID must have a value for Case %1', Code);
                    Cont.Get(Correspondence_Contact_ID);
                    ContBusinessRelation.Reset;
                    ContBusinessRelation.SetCurrentKey("Link to Table", "No.");
                    ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
                    ContBusinessRelation.SetRange("No.", "Case-Client ID");
                    if ContBusinessRelation.FindFirst then
                        if ContBusinessRelation."Contact No." <> Cont."Company No." then
                            Error(Text001, Cont."No.", Cont.Name, "Case-Client ID");
                end;
            end;
        }
        field(50030; Billing_Contact_ID; Code[20])
        {
            Description = 'LCMS Integration';
            TableRelation = Contact;

            trigger OnValidate()
            var
                ContBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                Text001: Label 'Billing Contact Id  %1 %2 is related to a different company Client %3.';
            begin
                //Integartion LCMS
                if "Dimension Code" = 'CASE' then begin
                    if Billing_Contact_ID = '' then
                        Error('Billing_Contact_ID must have a value for Case %1', Code);
                    Cont.Get(Billing_Contact_ID);
                    ContBusinessRelation.Reset;
                    ContBusinessRelation.SetCurrentKey("Link to Table", "No.");
                    ContBusinessRelation.SetRange("Link to Table", ContBusinessRelation."Link to Table"::Customer);
                    ContBusinessRelation.SetRange("No.", "Case-Client ID");
                    if ContBusinessRelation.FindFirst then
                        if ContBusinessRelation."Contact No." <> Cont."Company No." then
                            Error(Text001, Cont."No.", Cont.Name, "Case-Client ID");
                end;
            end;
        }
        field(50031; Owner_2Email; Text[100])
        {
        }
        field(50032; "Group_Head Email"; Text[100])
        {
        }
        field(50033; "Owner_2Email_Outs."; Text[50])
        {
        }
        field(50034; "Sub Group Owner 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('SUBGRP-OWNER2'));
        }
        field(50035; "Owner 2 Exception"; Boolean)
        {
        }
        field(50036; "Additional Email"; Text[100])
        {
        }
        field(50037; "Practice-Head"; Code[20])
        {
            Description = 'LCMS Integration';
        }
        field(50038; "Owner 1 Designation"; Text[50])
        {
            Description = 'LCMS Integration';
        }
        field(50039; "Owner 2 Designation"; Text[50])
        {
            Description = 'LCMS Integration';
        }
        field(50040; Associate; Code[20])
        {
            Description = 'LCMS Integration';
            TableRelation = Employee;

            trigger OnValidate()
            var
                DimensionValueL: Record "Dimension Value";
            begin
                //Integartion LCMS
                if "Dimension Code" = 'CASE' then begin
                    if Associate <> '' then begin
                        DimensionValueL.Reset;
                        DimensionValueL.SetRange("Dimension Code", 'ASSOCIATES');
                        DimensionValueL.SetRange(Code, Associate);
                        if DimensionValueL.Count = 0 then
                            Error('Associates %1 not exists in Associate dimension for the case %2', Associate, Code);
                        if DimensionValueL.FindFirst then begin
                            if "Group-Head" <> '' then begin
                                DimensionValue.Reset;
                                DimensionValue.SetRange("Dimension Code", 'GROUPHEAD');
                                DimensionValue.SetRange(Code, "Group-Head");
                                if DimensionValue.FindFirst then begin
                                    if DimensionValue.Code <> DimensionValueL."Group-Head" then
                                        Error('Group Head %1 of Associates %2 doesnot belong for this Group Code %3 in Case %4', DimensionValueL."Group-Head", Associate, "Group-Head", Code);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        }
        field(50041; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
            Description = 'LCMS Integration';
        }
        field(50042; "Company E-Mail"; Text[80])
        {
            Caption = 'Company E-Mail';
            Description = 'LCMS Integration';
        }
        field(50043; "Reporting To"; Code[20])
        {
            Description = 'LCMS Integration';
        }
        field(50044; "Employee Role"; Text[30])
        {
            Description = 'LCMS Integration';
        }
        field(50045; "Region ID"; Code[20])
        {
            Description = 'LCMS Integration';
        }
        field(50046; Designation; Text[50])
        {
            Description = 'LCMS Integration';
        }
        field(50047; "HR Code"; Code[20])
        {
            Description = 'LCMS Integration';
        }
        field(50048; "Full Name"; Text[100])
        {
            Description = 'LCMS Integration';
        }
    }
    keys
    {
        key(Key1; "Group-Head")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CheckIfDimValueUsed then
      Error(Text000,GetCheckDimErr);

    DimValueComb.SetRange("Dimension 1 Code","Dimension Code");
    #5..20
    AnalysisSelectedDim.SetRange("Dimension Code","Dimension Code");
    AnalysisSelectedDim.SetRange("New Dimension Value Code",Code);
    AnalysisSelectedDim.DeleteAll(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     if CheckIfDimValueUsed then
    #2..23
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Dimension Code");
    TestField(Code);
    "Global Dimension No." := GetGlobalDimensionNo;

    if CostAccSetup.Get then begin
      CostAccMgt.UpdateCostCenterFromDim(Rec,Rec,0);
      CostAccMgt.UpdateCostObjectFromDim(Rec,Rec,0);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //8112
    GLSetup.Get;
    "Global Dimension No." := 0;
    if GLSetup."Global Dimension 1 Code" = "Dimension Code" then
      "Global Dimension No." := 1;
    if GLSetup."Global Dimension 2 Code" = "Dimension Code" then
      "Global Dimension No." := 2;
    //8112
    //TESTFIELD("Dimension Code");
    //TESTFIELD(Code);
    #3..8
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Dimension Code" <> xRec."Dimension Code" then
      "Global Dimension No." := GetGlobalDimensionNo;
    if CostAccSetup.Get then begin
      CostAccMgt.UpdateCostCenterFromDim(Rec,xRec,1);
      CostAccMgt.UpdateCostObjectFromDim(Rec,xRec,1);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //8112
    if "Dimension Code" <> xRec."Dimension Code" then begin
      GLSetup.Get;
      "Global Dimension No." := 0;
      if GLSetup."Global Dimension 1 Code" = "Dimension Code" then
        "Global Dimension No." := 1;
      if GLSetup."Global Dimension 2 Code" = "Dimension Code" then
        "Global Dimension No." := 2;
      end;
    //8112
    #1..6
    */
    //end;


    //Unsupported feature: Code Modification on "GetGlobalDimensionNo(PROCEDURE 8)".

    //procedure GetGlobalDimensionNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GeneralLedgerSetup.Get;
    case "Dimension Code" of
      GeneralLedgerSetup."Global Dimension 1 Code":
    #4..11
        exit(5);
      GeneralLedgerSetup."Shortcut Dimension 6 Code":
        exit(6);
      GeneralLedgerSetup."Shortcut Dimension 7 Code":
        exit(7);
      GeneralLedgerSetup."Shortcut Dimension 8 Code":
        exit(8);
      else
        exit(0);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //  GeneralLedgerSetup."Shortcut Dimension 7 Code":
    //    EXIT(7);
      GeneralLedgerSetup."Shortcut Dimension 9 Code":
        exit(9);
      GeneralLedgerSetup."Shortcut Dimension 10 Code":
        exit(10);
      GeneralLedgerSetup."Shortcut Dimension 11 Code":
        exit(11);
      GeneralLedgerSetup."Shortcut Dimension 12 Code":
        exit(12);
      GeneralLedgerSetup."Shortcut Dimension 13 Code":
        exit(13);
      GeneralLedgerSetup."Shortcut Dimension 14 Code":
        exit(14);
      GeneralLedgerSetup."Shortcut Dimension 15 Code":
        exit(15);
    #19..21
    */
    //end;

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".


    var
        GLSetup: Record "General Ledger Setup";

    var
        DimensionValue: Record "Dimension Value";
        ShiptoAddress: Record "Ship-to Address";
}

