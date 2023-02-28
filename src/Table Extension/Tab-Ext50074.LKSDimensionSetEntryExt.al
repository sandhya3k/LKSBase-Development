tableextension 50074 "LKSDimensionSetEntryExt" extends "Dimension Set Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Dimension Value Name"(Field 6)".

        field(50000; "Case-Office ID"; Code[10])
        {
        }
        field(50001; "Case-Client ID"; Code[20])
        {
        }
        field(50002; "Case-Process"; Text[30])
        {
        }
        field(50003; "Case-Document Name"; Text[50])
        {
        }
        field(50004; "Case-Activity Type"; Text[100])
        {
        }
        field(50005; "Case-Solution"; Text[30])
        {
        }
        field(50006; "Case-Branch"; Text[30])
        {
        }
        field(50007; "Case-Practice"; Text[50])
        {
        }
        field(50008; "Case-Area"; Text[40])
        {
        }
        field(50009; "Case-Rain Maker"; Text[60])
        {
        }
        field(50010; "Case-Rain Giver"; Text[60])
        {
        }
        field(50011; "Case-Forum"; Text[100])
        {
        }
        field(50012; "Case-Sub Forum"; Text[100])
        {
        }
        field(50013; "Case-Creation Date"; Date)
        {
        }
        field(50014; "Case-Referance Type"; Text[20])
        {
        }
        field(50015; "Case-Forum City"; Text[60])
        {
        }
        field(50016; "Case-Target Forum"; Text[60])
        {
        }
        field(50017; "Case-Target Sub Forum"; Text[60])
        {
        }
        field(50018; "Case-Target Forum City"; Text[60])
        {
        }
        field(50019; "Case-Owner1"; Text[64])
        {
        }
        field(50020; "Case-Owner2"; Text[64])
        {
        }
        field(50021; "Region-Head"; Text[100])
        {
        }
        field(50022; "Branch-Head"; Text[100])
        {
        }
        field(50023; "Branch-Region ID"; Code[20])
        {
        }
        field(50024; "Group-Head"; Text[100])
        {
        }
        field(50025; "Group-Branch ID"; Code[20])
        {
        }
        field(50026; "Group-Region ID"; Code[20])
        {
        }
        field(50027; "Case-Referance No"; Text[20])
        {
        }
        field(50028; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(50029; Correspondence_Contact_ID; Code[10])
        {
        }
        field(50030; Billing_Contact_ID; Code[10])
        {
        }
    }
}

