tableextension 50051 "LKSCustLedgerEntryExt" extends "Cust. Ledger Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".

        field(50000; "Adv. RTB No."; Code[20])
        {
        }
        field(50001; Processed; Boolean)
        {
        }
        field(50002; Updated; Boolean)
        {
            Editable = true;
        }
        field(50003; "RTBNo."; Code[20])
        {
        }
        field(50004; "Cheque No."; Code[35])
        {
            Description = 'FOR RTGS RECEIPT';
        }
        field(50005; "Cheque Date"; Date)
        {
        }
        field(50006; "TDS Amount"; Decimal)
        {
            Description = 'TEAM::1426';
        }
        field(50007; "Payment Applied"; Decimal)
        {
            Description = 'TEAM::1426';
        }
        field(50008; "Nature of Invoice"; Option)
        {
            Description = 'TEAM::1426';
            OptionCaption = ',Taxable,Non Taxable,Both';
            OptionMembers = ,Taxable,"Non Taxable",Both;
        }
        field(50009; "Applied Document"; Code[20])
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Document No." WHERE("Entry No." = FIELD("Closed by Entry No.")));
            Description = 'TEAM::1426';
            FieldClass = FlowField;
        }
        field(50010; "Applied Date"; Date)
        {
            CalcFormula = Lookup("Detailed Cust. Ledg. Entry"."Initial Entry Due Date" WHERE("Entry Type" = FILTER(Application),
                                                                                              Unapplied = FILTER(false),
                                                                                              "Cust. Ledger Entry No." = FIELD("Entry No.")));
            Description = 'TEAM::1426';
            FieldClass = FlowField;
        }
        field(50011; "Applied Document (Invoice)"; Code[20])
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Document No." WHERE("Closed by Entry No." = FIELD("Entry No.")));
            Description = 'TEAM::1426';
            FieldClass = FlowField;
        }
        field(50012; "Payment Made By"; Text[100])
        {
            Description = 'TEAM::1426';
        }
        field(50013; OWNER2; Text[100])
        {
            TableRelation = "Dimension Set Entry"."Dimension Value Code" WHERE("Dimension Code" = CONST('OWNER2'));
        }
        field(50014; "Group Heade"; Code[10])
        {
            Description = 'TEAM::1426 For head Wise Report';
        }
        field(50015; "Ship-to Contact"; Text[50])
        {
            Caption = 'Ship-to Contact';
            Description = '6700';
        }
        field(50016; "Owner2 Email"; Text[50])
        {
            Description = '6700';
        }
        field(50017; "Sub Group Owner 2"; Code[20])
        {
            Description = '6700';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('SUBGRP-OWNER2'));
        }
        field(50018; OWNER1; Text[100])
        {
            Description = '6700';
            TableRelation = "Dimension Set Entry"."Dimension Value Code" WHERE("Dimension Code" = CONST('OWNER2'));
        }
        //#122
        field(50019; "Description 3"; Text[100])
        {
            Caption = 'Description';
        }
        //#122
    }
    keys
    {
        //TBD
        /*
        key(Key1; "Customer No.", Open, OWNER2, "Posting Date")
        {
        }
        */
    }
}

