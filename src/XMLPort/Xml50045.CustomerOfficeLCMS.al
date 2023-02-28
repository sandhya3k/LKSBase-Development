xmlport 50045 "Customer Office_LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfOffice)
        {
            tableelement("Ship-to Address"; "Ship-to Address")
            {
                AutoUpdate = true;
                XmlName = 'Office';
                fieldelement(office_id; "Ship-to Address".Code)
                {
                }
                fieldelement(client_id; "Ship-to Address"."Customer No.")
                {
                }
                fieldelement(office_type; "Ship-to Address"."Office Type")
                {
                }
                fieldelement(address1; "Ship-to Address"."Client Address 1")
                {
                }
                fieldelement(address2; "Ship-to Address"."Client Address 2")
                {
                }
                fieldelement(pin_code; "Ship-to Address"."Post Office")
                {
                }
                fieldelement(city; "Ship-to Address"."City Town")
                {
                }
                fieldelement(district; "Ship-to Address".District)
                {
                }
                fieldelement(state; "Ship-to Address"."State Name")
                {
                }
                fieldelement(country; "Ship-to Address".Country)
                {
                }
                fieldelement(email; "Ship-to Address"."E-Mail")
                {
                }
                fieldelement(phone; "Ship-to Address"."Phone No.")
                {
                }
                fieldelement(telex_no; "Ship-to Address"."Telex No.")
                {
                }
                fieldelement(fax_no; "Ship-to Address"."Fax No.")
                {
                }
                fieldelement(isd; "Ship-to Address".ISD)
                {
                }
                fieldelement(std; "Ship-to Address".STD)
                {
                    MinOccurs = Once;
                }
                fieldelement(gstin; "Ship-to Address"."GST Reg No.")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    Cust.Get("Ship-to Address"."Customer No.");
                    "Ship-to Address".Name := Cust.Name;
                    "Ship-to Address"."Name 2" := Cust."Name 2";

                    if StrLen("Ship-to Address"."Client Address 1") > 50 then
                        "Ship-to Address".Address := CopyStr("Ship-to Address"."Client Address 1", 1, 50)
                    else
                        "Ship-to Address".Address := "Ship-to Address"."Client Address 1";
                    if StrLen("Ship-to Address"."Client Address 2") > 50 then
                        "Ship-to Address"."Address 2" := CopyStr("Ship-to Address"."Client Address 2", 1, 50)
                    else
                        "Ship-to Address"."Address 2" := "Ship-to Address"."Client Address 2";
                    //"Ship-to Address".VALIDATE("Customer No.",client_id);
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
        Cust: Record Customer;
}

