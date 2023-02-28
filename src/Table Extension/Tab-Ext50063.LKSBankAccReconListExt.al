tableextension 50063 "LKSBankAccReconListExt" extends "Bank Acc. Reconciliation Line"
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
}

