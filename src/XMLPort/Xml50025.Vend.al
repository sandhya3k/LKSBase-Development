xmlport 50025 Vend
{
    FileName = 'D:\Dynamic Clients\Vend.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Name"; "Bank Name")
            {
                AutoUpdate = true;
                XmlName = 'BankMaster';
                fieldelement(Name; "Bank Name"."Bank  Name")
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

