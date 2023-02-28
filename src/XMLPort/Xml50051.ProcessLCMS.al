xmlport 50051 "Process LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfProcess)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Process';
                fieldelement(id; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'PROCESS';
                    end;
                }
                fieldelement(name; "Dimension Value".Name)
                {
                    MinOccurs = Zero;
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

