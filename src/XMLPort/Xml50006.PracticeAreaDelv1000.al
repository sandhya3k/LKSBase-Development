xmlport 50006 "PracticeAreaDelv 1000"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\1000\Practice.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Practice/Area/Deliverables"; "Practice/Area/Deliverables")
            {
                AutoReplace = true;
                XmlName = 'Practice_Area_Deliverables';
                fieldelement(Practice_Name; "Practice/Area/Deliverables"."Practice Name")
                {
                }
                fieldelement(Area_Name; "Practice/Area/Deliverables"."Area Name")
                {
                }
                fieldelement(Document_Name; "Practice/Area/Deliverables"."Document Name")
                {
                }
                fieldelement(Type_of_Actrivity; "Practice/Area/Deliverables"."Type of Activity")
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

