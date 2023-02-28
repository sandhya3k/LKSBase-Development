xmlport 50004 "Entity-Vendor 1000"
{
    Direction = Import;
    FieldDelimiter = '<''''>';
    FieldSeparator = '~';
    FileName = 'C:\1000\Entity.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Vendor; Vendor)
            {
                AutoReplace = true;
                XmlName = 'Vendor';
                fieldelement(No; Vendor."No.")
                {
                }
                fieldelement(Client_Name; Vendor."Client Name")
                {
                }
                fieldelement(Client_Sector; Vendor."Client Sector")
                {
                }
                fieldelement(Client_Old_Name; Vendor."Client Old Name")
                {
                }
                fieldelement(Client_Group_Name; Vendor."Client Group Name")
                {
                }
                fieldelement(Classification; Vendor.Classification)
                {
                }
                fieldelement(Enrolment_Year; Vendor."Enrolment Year")
                {
                }
                fieldelement(Rain_Maker; Vendor."Rain Maker")
                {
                }
                fieldelement(Rain_Giver; Vendor."Rain Giver")
                {
                }
                fieldelement("P.A.N._No."; Vendor."P.A.N. No.")
                {
                }
                fieldelement(STC_No; Vendor."STC No.")
                {
                }
                fieldelement(Service_Tax_No; Vendor."Service Tax No.")
                {
                }
                fieldelement(Central_Excise_Regn_No; Vendor."Central Excise Regn No.")
                {
                }
                fieldelement(Customer_Regn_No; Vendor."Customer Regn No.")
                {
                }
                fieldelement(Importer_Exporter_No; Vendor."Importer Exporter No.")
                {
                }
                fieldelement(Home_Page; Vendor."Home Page")
                {
                }
                fieldelement("E-Mail"; Vendor."E-Mail")
                {
                }
                fieldelement(Entity_Status; Vendor."Entity Status")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    /*
                    IF STRLEN(Vendor."Client Name") > 50 THEN BEGIN
                      Vendor.Name := COPYSTR(Vendor."Client Name",1,50);
                      Vendor."Name 2" := COPYSTR(Vendor."Client Name",51,STRLEN(Vendor."Client Name"));
                    END ELSE BEGIN
                      Vendor.Name := Vendor."Client Name";
                    END;
                    */

                end;
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
        VEN: Record Vendor;
        VenDim: Record "Dimension Value";
}

