table 50000 "Inward/Outward"
{

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Editable = false;
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(2; "Amount to Customer"; Decimal)
        {
            CalcFormula = Sum ("Sales Invoice Line".Amount WHERE ("Document No." = FIELD ("Invoice No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Courier No."; Code[50])
        {
        }
        field(4; "Date of Delivery at Client"; Date)
        {
        }
        field(5; "Bank Name"; Text[80])
        {
        }
        field(6; "Cheque No."; Code[30])
        {
        }
        field(7; "Cheque Date"; Date)
        {
        }
        field(8; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Invoice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

