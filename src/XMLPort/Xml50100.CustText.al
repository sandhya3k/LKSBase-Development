xmlport 50100 "CustText"
//PAN UPG Rename from 60001 to 50100
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
                textelement(Cname)
                {

                    trigger OnAfterAssignVariable()
                    begin
                        if StrLen(Cname) > 50 then begin
                            Customer.Validate(Name, CopyStr(Cname, 1, 50));
                            Customer.Validate("Name 2", CopyStr(Cname, 51, StrLen(Cname)));
                        end;
                        /*
                        
                        ELSE BEGIN
                           Customer.Name := CName;
                        END;
                        Customer.VALIDATE("Client Name","Client Name");
                         */

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
}

