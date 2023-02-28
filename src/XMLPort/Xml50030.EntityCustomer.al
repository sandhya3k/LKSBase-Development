xmlport 50030 "Entity-Customer"
{
    Direction = Both;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\1000\Entity.csv';
    Format = VariableText;
    Permissions = TableData Customer = rimd;

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
                textelement("<cname>")
                {
                    XmlName = 'CName';

                    trigger OnAfterAssignVariable()
                    begin
                        /*
                        Customer.VALIDATE(Customer."Client Name",C_Name);
                        IF STRLEN(Customer."Client Name") > 50 THEN BEGIN
                          Customer.Name := COPYSTR(Customer."Client Name",1,50);
                          Customer."Name 2" := COPYSTR(Customer."Client Name",51,STRLEN("Client Name"));
                        END ELSE BEGIN
                           Customer.Name := Customer."Client Name";
                        END;
                        Customer.VALIDATE("Client Name","Client Name");
                        
                        IF Cust.GET(Customer."No.") THEN
                           Customer.MODIFY(TRUE);
                        
                        
                        IF STRLEN(CName) > 50 THEN BEGIN
                          Customer.VALIDATE(Name,COPYSTR(CName,1,50));
                          Customer.VALIDATE("Name 2",COPYSTR(CName,51,STRLEN(CName)));
                        END
                        ELSE BEGIN
                           Customer.Name := CName;
                        END;
                        Customer.VALIDATE("Client Name","Client Name");
                        */

                    end;
                }
                fieldelement(ClientSector; Customer."Client Sector")
                {
                }
                fieldelement(Client_Old_Name; Customer."Client Old Name")
                {
                }
                fieldelement(Client_Group_Name; Customer."Client Group Name")
                {
                }
                fieldelement(Classification; Customer.Classification)
                {
                }
                fieldelement(Enrolment_Year; Customer."Enrolment Year")
                {
                }
                fieldelement(Emrolment_Month; Customer."Enrolment Month")
                {
                }
                fieldelement(Rain_Maker; Customer."Rain Maker")
                {
                }
                fieldelement(Rain_Giver; Customer."Rain Giver")
                {
                }
                fieldelement("P.A.N._No."; Customer."P.A.N. No.")
                {
                }
                fieldelement("STC_No."; Customer."STC No.")
                {
                }
                fieldelement("Service_Tax_No."; Customer."Service Tax No.")
                {
                }
                fieldelement("Central_Excise_Regn_No."; Customer."Central Excise Regn No.")
                {
                }
                fieldelement("Customer_Regn_No."; Customer."Customer Regn No.")
                {
                }
                fieldelement("Importer_Exporter_No."; Customer."Importer Exporter No.")
                {
                }
                fieldelement(Home_Page; Customer."Home Page")
                {
                }
                fieldelement("E-Mail"; Customer."E-Mail")
                {
                }
                fieldelement(Entity_Status; Customer."Entity Status")
                {
                }
                fieldelement(Client_For; Customer."Client For")
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

    var
        "Client Name": Text[60];
        Cust: Record Customer;
        C_Name: Text[60];
}

