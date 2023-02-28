xmlport 50044 "Forum Info_LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfForum)
        {
            tableelement("Forum Info"; "Forum Info")
            {
                AutoUpdate = true;
                XmlName = 'Forum';
                fieldelement(name; "Forum Info"."Forum Name")
                {
                }
                fieldelement(sub_forum; "Forum Info"."Sub Forum")
                {
                }
                fieldelement(forum_city; "Forum Info"."Forum City")
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

