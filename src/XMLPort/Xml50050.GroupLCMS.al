xmlport 50050 "Group LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfGroup)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Group';
                fieldelement(group_id; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'GROUPHEAD';
                    end;
                }
                fieldelement(branch_id; "Dimension Value"."Group-Branch ID")
                {
                }
                fieldelement(region_id; "Dimension Value"."Group-Region ID")
                {
                }
                fieldelement(group_name; "Dimension Value".Name)
                {
                }
                fieldelement(group_head; "Dimension Value"."Group-Head")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    "Dimension Value"."Dimension Code" := 'GROUPHEAD';
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

