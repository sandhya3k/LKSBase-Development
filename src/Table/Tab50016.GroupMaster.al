table 50016 "Group Master"
{

    fields
    {
        field(1; Group; Code[10])
        {
        }
        field(2; "Group Name"; Text[100])
        {
        }
        field(3; "Email Id"; Text[100])
        {
        }
        field(4; "Copy Email Id"; Text[100])
        {
        }
        field(5; "Common copy to"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; Group)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

