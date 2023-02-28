xmlport 50049 "Region LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfRegion)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Region';
                fieldelement(region_id; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'REGION';
                    end;
                }
                fieldelement(region_name; "Dimension Value".Name)
                {
                }
                fieldelement(region_head; "Dimension Value"."Region-Head")
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

