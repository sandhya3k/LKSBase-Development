table 50002 "Forum Info"
{

    fields
    {
        field(1; "Forum Name"; Text[60])
        {
        }
        field(2; "Sub Forum"; Text[60])
        {
        }
        field(3; "Forum City"; Text[60])
        {
        }
    }

    keys
    {
        key(Key1; "Forum Name", "Sub Forum", "Forum City")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

