xmlport 50008 "Process 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Process.csv';
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
                        "Dimension Value"."Dimension Code" := 'PROCESS';
                    end;
                }
                fieldelement(Name; "Dimension Value".Name)
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

