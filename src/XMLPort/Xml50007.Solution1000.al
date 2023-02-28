xmlport 50007 "Solution 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Solution.csv';
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
                        "Dimension Value"."Dimension Code" := 'SOLUTION';
                    end;
                }
                fieldelement(Name; "Dimension Value".Name)
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

