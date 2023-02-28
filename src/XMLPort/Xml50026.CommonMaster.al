xmlport 50026 "Common Master"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Common Master"; "Common Master")
            {
                AutoUpdate = true;
                XmlName = 'CommonMaster';
                fieldelement(CompanyHead; "Common Master"."Company Head")
                {
                }
                fieldelement(MasterType; "Common Master"."Master Type")
                {
                }
                fieldelement(MasterID; "Common Master"."Master ID")
                {
                }
                fieldelement(MasterDesc; "Common Master"."Master Description")
                {
                }
                fieldelement(DivType; "Common Master"."Division Type")
                {
                }
                fieldelement(Add1; "Common Master".Address)
                {
                }
                fieldelement(Add2; "Common Master"."Address 2")
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

