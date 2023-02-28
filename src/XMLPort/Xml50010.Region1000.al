xmlport 50010 "Region 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Region.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'DimValue';
                fieldelement(Code; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'REGION';
                    end;
                }
                fieldelement(Name; "Dimension Value".Name)
                {
                }
                fieldelement(RegionCode; "Dimension Value"."Region-Head")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

