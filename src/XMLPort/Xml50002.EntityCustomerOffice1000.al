xmlport 50002 "Entity-Customer Office 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Office.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Ship-to Address"; "Ship-to Address")
            {
                AutoUpdate = true;
                XmlName = 'Ship-to-Address';
                fieldelement(Code; "Ship-to Address".Code)
                {
                }
                fieldelement(Customer_No; "Ship-to Address"."Customer No.")
                {
                }
                fieldelement(Office_Type; "Ship-to Address"."Office Type")
                {
                }
                fieldelement(Client_Address_1; "Ship-to Address"."Client Address 1")
                {
                }
                fieldelement(Client_Address_2; "Ship-to Address"."Client Address 2")
                {
                }
                fieldelement(Post_Office; "Ship-to Address"."Post Office")
                {
                }
                fieldelement(City_Town; "Ship-to Address"."City Town")
                {
                }
                fieldelement(District; "Ship-to Address".District)
                {
                }
                fieldelement(State_Name; "Ship-to Address"."State Name")
                {
                }
                fieldelement(Country; "Ship-to Address".Country)
                {
                }
                fieldelement("E-mail"; "Ship-to Address"."E-Mail")
                {
                }
                fieldelement(Phone_No; "Ship-to Address"."Phone No.")
                {
                }
                fieldelement(Telex_No; "Ship-to Address"."Telex No.")
                {
                }
                fieldelement(Fax_No; "Ship-to Address"."Fax No.")
                {
                }
                fieldelement(ISD; "Ship-to Address".ISD)
                {
                }
                fieldelement(STD; "Ship-to Address".STD)
                {
                    MinOccurs = Once;
                }

                trigger OnAfterInsertRecord()
                begin
                    /*
                    Cust.GET("Ship-to Address"."Customer No.");
                    "Ship-to Address".Name := Cust.Name;
                    "Ship-to Address"."Name 2" := Cust."Name 2";
                    
                    IF STRLEN("Ship-to Address"."Client Address 1") > 50 THEN
                      "Ship-to Address".Address := COPYSTR("Ship-to Address"."Client Address 1",1,50)
                    ELSE
                      "Ship-to Address".Address := "Ship-to Address"."Client Address 1";
                     IF STRLEN("Ship-to Address"."Client Address 2") > 50 THEN
                      "Ship-to Address"."Address 2" := COPYSTR("Ship-to Address"."Client Address 2",1,50)
                    ELSE
                      "Ship-to Address"."Address 2" := "Ship-to Address"."Client Address 2";
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
        Cust: Record Customer;
}

