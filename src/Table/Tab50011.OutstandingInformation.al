table 50011 "Outstanding Information"
{

    fields
    {
        field(1; "Posting Date"; Date)
        {
        }
        field(2; "RTB No."; Code[20])
        {
        }
        field(3; "Document No."; Code[20])
        {
        }
        field(4; "Remaining Amt."; Decimal)
        {
        }
        field(5; "Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Posting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

