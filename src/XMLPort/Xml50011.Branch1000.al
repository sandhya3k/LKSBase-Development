xmlport 50011 "Branch 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Branch.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Dimvalue';
                fieldelement(Code; "Dimension Value".Code)
                {
                }
                fieldelement(BranchRegionID; "Dimension Value"."Branch-Region ID")
                {
                }
                fieldelement(Name; "Dimension Value".Name)
                {
                }
                fieldelement(BranchHead; "Dimension Value"."Branch-Head")
                {

                    trigger OnBeforePassField()
                    begin
                        "Dimension Value".Validate("Dimension Value".Code);
                    end;
                }

                trigger OnAfterInsertRecord()
                begin
                    "Dimension Value"."Dimension Code" := 'BRANCH';
                end;
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

