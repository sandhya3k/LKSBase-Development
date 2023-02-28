table 50001 "Practice/Area/Deliverables"
{

    fields
    {
        field(1; "Practice Name"; Text[30])
        {
        }
        field(2; "Area Name"; Text[40])
        {

            trigger OnValidate()
            begin
                // DimValue.RESET;
                // DimValue.SETRANGE(Name,"Practice Name");
                // IF NOT DimValue.FINDFIRST THEN BEGIN
                //  DimValue.INIT;
                //  DimValue."Dimension Code" := 'PRACTICE';
                //  DimValue.Code := COPYSTR("Practice Name",1,2);
                //  DimValue.Name := "Practice Name";
                //  DimValue.INSERT;
                // END;
            end;
        }
        field(3; "Document Name"; Text[50])
        {
        }
        field(4; "Type of Activity"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Practice Name", "Area Name", "Document Name", "Type of Activity")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimValue: Record "Dimension Value";
}

