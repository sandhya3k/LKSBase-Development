xmlport 50099 Test
{
    FieldSeparator = '~';
    Format = VariableText;

    schema
    {
        textelement(CustText)
        {
            tableelement(Customer; Customer)
            {
                AutoReplace = true;
                XmlName = 'CustTable';
                fieldelement(CustNo; Customer."No.")
                {
                }
                textelement(CName)
                {

                    trigger OnAfterAssignVariable()
                    begin
                        if StrLen(CName) > 50 then begin
                            Customer.Validate(Name, CopyStr(CName, 1, 50));
                            Customer.Validate("Name 2", CopyStr(CName, 51, StrLen(CName)));
                        end
                        else
                            Customer.Name := CName;
                        Customer.Validate("Client Name", CName);
                    end;
                }
                fieldelement(ClientSector; Customer."Client Sector")
                {
                }
                fieldelement(ClientOldName; Customer."Client Old Name")
                {
                }
                fieldelement(ClientGroupName; Customer."Client Group Name")
                {
                }
                fieldelement(Classification; Customer.Classification)
                {
                }
                fieldelement(EnrollYear; Customer."Enrolment Year")
                {
                }
                fieldelement(EnrollMnth; Customer."Enrolment Month")
                {
                }
                fieldelement(RainMaker; Customer."Rain Maker")
                {
                }
                fieldelement(RainGiver; Customer."Rain Giver")
                {
                }
                fieldelement(PANNO; Customer."P.A.N. No.")
                {
                }
                fieldelement(STCNo; Customer."STC No.")
                {
                }
                fieldelement(ServTaxNo; Customer."Service Tax No.")
                {
                }
                fieldelement(CentralExciseNo; Customer."Central Excise Regn No.")
                {
                }
                fieldelement(CustRegnNo; Customer."Customer Regn No.")
                {
                }
                fieldelement(ImpExpNo; Customer."Importer Exporter No.")
                {
                }
                fieldelement(HomePage; Customer."Home Page")
                {
                }
                fieldelement(Email; Customer."E-Mail")
                {
                }
                fieldelement(EntitySt; Customer."Entity Status")
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

