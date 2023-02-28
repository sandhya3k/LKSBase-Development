pageextension 50116 pageextension50116 extends "Sales List"
{
    layout
    {

        //Unsupported feature: Property Modification (ImplicitType) on ""Bill-to Name"(Control 15)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to Name"(Control 153)".

        addafter("External Document No.")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

