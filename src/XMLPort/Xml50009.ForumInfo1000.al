xmlport 50009 "Forum Info 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\ForumInfo.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Forum Info"; "Forum Info")
            {
                AutoUpdate = true;
                XmlName = 'ForumInfo';
                fieldelement(Forum_Name; "Forum Info"."Forum Name")
                {
                }
                fieldelement(Sub_Forum; "Forum Info"."Sub Forum")
                {
                }
                fieldelement(Forum_City; "Forum Info"."Forum City")
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

