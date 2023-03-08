pageextension 50034 pageextension50034 extends States
{
    layout
    {

        //Unsupported feature: Property Modification (ImplicitType) on "Code(Control 2)".

        addafter("State Code (GST Reg. No.)")
        {
            field("State Code for E-Invoicing"; rec."State Code for E-Invoicing")
            {
                ApplicationArea = All;
            }
        }
    }
}

