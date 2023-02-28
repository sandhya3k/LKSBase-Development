xmlport 50041 Contact_LCMS
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfContact)
        {
            tableelement(Contact; Contact)
            {
                AutoUpdate = true;
                XmlName = 'Contact';
                fieldelement(contact_id; Contact."No.")
                {
                }
                fieldelement(office_id; Contact."Office ID")
                {
                }
                fieldelement(client_id; Contact."Client ID")
                {
                }
                fieldelement(department; Contact.Department)
                {
                }
                fieldelement(designation; Contact.Designation)
                {
                }
                fieldelement(initials; Contact.Initials)
                {
                }
                fieldelement(first_name; Contact."F Name")
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
                fieldelement(Middle_name; Contact."M Name")
                {
                }
                fieldelement(last_name; Contact."L Name")
                {
                }
                fieldelement(phone_no; Contact."Phone No.")
                {
                }
                fieldelement(Phone_no_2; Contact."Phone 2")
                {
                }
                fieldelement(mobile_no; Contact."Mobile Phone No.")
                {
                }
                fieldelement(mobile_no_2; Contact."Mobile 2")
                {
                }
                fieldelement(email; Contact."E-Mail")
                {
                }
                fieldelement(pref_way_of_comm; Contact."Pref Way of Comm")
                {
                }
                fieldelement(time_slot; Contact."Time Slot")
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

