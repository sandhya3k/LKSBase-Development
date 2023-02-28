table 50007 "PO Information"
{

    fields
    {
        field(1; "Vendor No."; Text[30])
        {
            Editable = true;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('ENTITY'));
            ValidateTableRelation = false;
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Document No."; Code[20])
        {
        }
        field(5; "Posting  Date"; Date)
        {
        }
        field(6; "PO Date"; Date)
        {
        }
        field(7; Status; Boolean)
        {
        }
        field(8; "Line No."; Integer)
        {
        }
        field(9; "Posted Document No."; Code[20])
        {
        }
        field(10; "Purchase Order No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Pay-to Vendor No." = FIELD("Vendor No."));
        }
    }

    keys
    {
        key(Key1; "Document No.", "Posting  Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PurchChaseOrder: Record "Purchase Header";
        POINFO: Record "PO Information";
}

