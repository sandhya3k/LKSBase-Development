tableextension 50076 "LKSContactExt" extends Contact
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on "City(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 9)".


        //Unsupported feature: Property Modification (Data type) on ""Fax No."(Field 84)".


        //Unsupported feature: Property Modification (Data type) on "County(Field 92)".


        //Unsupported feature: Property Modification (Data type) on ""First Name"(Field 5054)".


        //Unsupported feature: Property Modification (Data type) on ""Middle Name"(Field 5055)".


        //Unsupported feature: Property Modification (Data type) on "Surname(Field 5056)".


        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 5058)".


        //Unsupported feature: Property Modification (Data type) on "Initials(Field 5059)".


        //Unsupported feature: Property Modification (Data type) on ""Extension No."(Field 5060)".


        //Unsupported feature: Property Modification (Data type) on ""Mobile Phone No."(Field 5061)".


        //Unsupported feature: Property Modification (Data type) on "Pager(Field 5062)".

        field(50000; "Office ID"; Code[10])
        {
        }
        field(50001; "Client ID"; Code[20])
        {
        }
        field(50002; Department; Text[100])
        {
        }
        field(50003; Designation; Text[100])
        {
        }
        field(50004; "F Name"; Text[100])
        {
        }
        field(50005; "M Name"; Text[100])
        {
        }
        field(50006; "L Name"; Text[100])
        {
        }
        field(50007; "Phone 2"; Text[30])
        {
        }
        field(50008; "Mobile 2"; Text[30])
        {
        }
        field(50009; "Pref Way of Comm"; Text[30])
        {
        }
        field(50010; "Time Slot"; Text[30])
        {
        }
    }

    procedure AddText(Text: Text[249]): Text[250]
    begin
        if Text <> '' then
            exit(Text + ' ');
    end;
}

