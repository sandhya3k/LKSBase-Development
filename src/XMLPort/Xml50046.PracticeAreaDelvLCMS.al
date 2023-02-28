xmlport 50046 PracticeAreaDelv_LCMS
{
    Direction = Import;
    //TBD //FieldDelimiter = '<None>';
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfPractice)
        {
            tableelement("Practice/Area/Deliverables"; "Practice/Area/Deliverables")
            {
                AutoUpdate = true;
                XmlName = 'Practice';
                fieldelement(category; "Practice/Area/Deliverables"."Practice Name")
                {
                }
                fieldelement(sub_category; "Practice/Area/Deliverables"."Area Name")
                {
                }
                fieldelement(document; "Practice/Area/Deliverables"."Document Name")
                {
                }
                fieldelement(type_of_activity; "Practice/Area/Deliverables"."Type of Activity")
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

