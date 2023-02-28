tableextension 50064 "LKSBankAccntStateLineExt" extends "Bank Account Statement Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 6)".


        //Unsupported feature: Property Modification (Data type) on ""Check No."(Field 14)".

        field(50000; Location; Code[30])
        {
        }
        field(50001; Reversed; Boolean)
        {
        }
        field(50002; "Entry Status"; Option)
        {
            OptionCaption = ',Printed,Voided,Posted,Financially Voided,Test Print';
            OptionMembers = ,Printed,Voided,Posted,"Financially Voided","Test Print";
        }
    }
    keys
    {
        //TBD
        /*
        key(Key1; "Transaction Date")
        {
        }
        key(Key2; "Value Date")
        {
        }
        key(Key3; "Bank Account No.", "Value Date")
        {
        }
        */
    }
}

