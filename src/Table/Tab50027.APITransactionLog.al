table 50027 "API Transaction Log"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(21; API; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(22; "Entry Type"; Enum "API Log Entry Type")
        {
            DataClassification = CustomerContent;
        }
        field(23; "Triggered By Us"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(24; "Payload"; Media)
        {
            DataClassification = CustomerContent;
        }
        field(25; Method; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(26; Message; Text[1024])
        {
            DataClassification = CustomerContent;
        }
        field(27; "Reference No."; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}