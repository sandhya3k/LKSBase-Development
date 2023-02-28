xmlport 50040 Branch_LCMS
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfBranch)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Branch';
                fieldelement(branch_id; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'BRANCH';
                        //"Dimension Value".Name := "Dimension Value".Code;
                        "Dimension Value"."Global Dimension No." := 1;
                        "Dimension Value".Validate("Dimension Value"."Global Dimension No.", 1);
                    end;
                }
                fieldelement(branch_region_id; "Dimension Value"."Branch-Region ID")
                {
                }
                fieldelement(branch_name; "Dimension Value".Name)
                {
                }
                fieldelement(branch_head; "Dimension Value"."Branch-Head")
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

