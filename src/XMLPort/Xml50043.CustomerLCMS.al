xmlport 50043 Customer_LCMS
{
    Direction = Import;
    //TBD //FieldDelimiter = '<''''>';
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfClient)
        {
            tableelement(Customer; Customer)
            {
                AutoUpdate = true;
                XmlName = 'Client';
                fieldelement(client_id; Customer."No.")
                {
                }
                textelement(client_name)
                {

                    trigger OnAfterAssignVariable()
                    begin
                        Customer.Validate(Customer."Client Name", client_name);
                        if StrLen(client_name) > 50 then begin
                            Customer.Validate(Name, CopyStr(client_name, 1, 50));
                            Customer.Validate("Name 2", CopyStr(client_name, 51, StrLen(client_name)));
                        end
                        else
                            Customer.Name := client_name;
                        Customer.Validate("Client Name", client_name);

                        if Cust.Get(Customer."No.") then
                            Customer.Modify(true);
                    end;
                }
                fieldelement(client_sector; Customer."Client Sector")
                {
                }
                fieldelement(client_old_name; Customer."Client Old Name")
                {
                }
                fieldelement(client_grp_name; Customer."Client Group Name")
                {
                }
                fieldelement(classification; Customer.Classification)
                {
                }
                fieldelement(enrolment_year; Customer."Enrolment Year")
                {
                }
                fieldelement(Enrolment_month; Customer."Enrolment Month")
                {
                }
                fieldelement(rain_maker; Customer."Rain Maker")
                {
                }
                fieldelement(rain_giver; Customer."Rain Giver")
                {
                }
                fieldelement(pan; Customer."P.A.N. No.")
                {
                }
                fieldelement(stc_no; Customer."STC No.")
                {
                }
                fieldelement(service_tax_no; Customer."Service Tax No.")
                {
                }
                fieldelement(central_excise_reg; Customer."Central Excise Regn No.")
                {
                }
                fieldelement(customer_reg_no; Customer."Customer Regn No.")
                {
                }
                fieldelement(import_export_no; Customer."Importer Exporter No.")
                {
                }
                fieldelement(home_page; Customer."Home Page")
                {
                }
                fieldelement(email; Customer."E-Mail")
                {
                }
                fieldelement(entity_status; Customer."Entity Status")
                {
                }
                fieldelement(client_for; Customer."Client For")
                {

                    trigger OnAfterAssignField()
                    begin
                        if Customer."Client For" = '' then
                            Customer."Client For" := 'Tax';
                    end;
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
        "Client Name": Text[60];
        C_Name: Text[60];
}

