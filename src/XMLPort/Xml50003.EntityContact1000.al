xmlport 50003 "Entity-Contact 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Contact.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Contact; Contact)
            {
                AutoReplace = true;
                XmlName = 'Contact';
                fieldelement(No; Contact."No.")
                {
                }
                fieldelement(Office_ID; Contact."Office ID")
                {
                }
                fieldelement(Client_ID; Contact."Client ID")
                {
                }
                fieldelement(Department; Contact.Department)
                {
                }
                fieldelement(Designation; Contact.Designation)
                {
                }
                fieldelement(Initial; Contact.Initials)
                {
                }
                fieldelement(F_Name; Contact."F Name")
                {

                    trigger OnAfterAssignField()
                    begin
                        if StrLen(Contact."F Name") > 50 then
                            Contact."First Name" := CopyStr(Contact."F Name", 1, 50)
                        else
                            Contact."First Name" := Contact."F Name";

                        Contact.Type := 1;
                    end;
                }
                fieldelement(M_Name; Contact."M Name")
                {
                }
                fieldelement(L_Name; Contact."L Name")
                {
                }
                fieldelement(Phone_No; Contact."Phone No.")
                {
                }
                fieldelement(Phone_2; Contact."Phone 2")
                {
                }
                fieldelement(Mobile_Phone_No; Contact."Mobile Phone No.")
                {
                }
                fieldelement(Mobile_2; Contact."Mobile 2")
                {
                }
                fieldelement("E-Mail"; Contact."E-Mail")
                {
                }
                fieldelement(Pref_Way_of_Comm; Contact."Pref Way of Comm")
                {
                }
                fieldelement(Time_Slot; Contact."Time Slot")
                {
                    MaxOccurs = Once;
                    MinOccurs = Zero;
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

