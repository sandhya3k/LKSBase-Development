xmlport 50005 "Entity-Vendor Office 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Office.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Order Address"; "Order Address")
            {
                AutoUpdate = true;
                XmlName = 'OrderAddress';
                fieldelement(Code; "Order Address".Code)
                {
                }
                fieldelement(Vendor_No; "Order Address"."Vendor No.")
                {
                }
                fieldelement(Office_Type; "Order Address"."Office Type")
                {
                }
                fieldelement(Client_Address_1; "Order Address"."Client Address 1")
                {
                }
                fieldelement(Client_Address_2; "Order Address"."Client Address 2")
                {
                }
                fieldelement(Post_Office; "Order Address"."Post Office")
                {
                }
                fieldelement(Post_Code; "Order Address"."Post Code")
                {
                }
                fieldelement(City_Town; "Order Address"."City Town")
                {
                }
                fieldelement(District; "Order Address".District)
                {
                }
                fieldelement(State_Name; "Order Address"."State Name")
                {
                }
                fieldelement(Country; "Order Address".Country)
                {
                }
                fieldelement("E-mail"; "Order Address"."E-Mail")
                {
                }
                fieldelement(Phone_No; "Order Address"."Phone No.")
                {
                }
                fieldelement(Telex_No; "Order Address"."Telex No.")
                {
                }
                fieldelement(Fax_No; "Order Address"."Fax No.")
                {
                }
                fieldelement(ISD; "Order Address".ISD)
                {
                }
                fieldelement(STD; "Order Address".STD)
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterInsertRecord()
                begin

                    Vend.Get("Order Address"."Vendor No.");
                    "Order Address".Name := Vend.Name;
                    "Order Address"."Name 2" := Vend."Name 2";

                    if StrLen("Order Address"."Client Address 1") > 50 then
                        "Order Address".Address := CopyStr("Order Address"."Client Address 1", 1, 50)
                    else
                        "Order Address".Address := "Order Address"."Client Address 1";

                    if StrLen("Order Address"."Client Address 2") > 50 then
                        "Order Address"."Address 2" := CopyStr("Order Address"."Client Address 2", 1, 50)
                    else
                        "Order Address"."Address 2" := "Order Address"."Client Address 2";
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
        Vend: Record Vendor;
}

