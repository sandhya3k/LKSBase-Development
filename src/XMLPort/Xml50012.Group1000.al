xmlport 50012 "Group 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Group.csv';
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
                }
                fieldelement(GroupBranchID; "Dimension Value"."Group-Branch ID")
                {
                }
                fieldelement(GroupRegionID; "Dimension Value"."Group-Region ID")
                {
                }
                fieldelement(Name; "Dimension Value".Name)
                {
                }
                fieldelement(GroupHead; "Dimension Value"."Group-Head")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    "Dimension Value"."Dimension Code" := 'GROUP';
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

