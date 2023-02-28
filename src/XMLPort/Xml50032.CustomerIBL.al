xmlport 50032 CustomerIBL
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(CustText)
        {
            tableelement(Customer; Customer)
            {
                AutoUpdate = true;
                XmlName = 'CustTable';
                fieldelement(CustNo; Customer."No.")
                {
                }
                fieldelement(CName; Customer.Name)
                {
                }
                fieldelement(CNAme2; Customer."Name 2")
                {
                }
                fieldelement(Gen; Customer."Gen. Bus. Posting Group")
                {
                }
                fieldelement(Custpo; Customer."Customer Posting Group")
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

    trigger OnPostXmlPort()
    begin
        REPORT.Run(50103);
    end;

    var
        Cust: Record Customer;
}

