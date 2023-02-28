pageextension 50155 pageextension50155 extends "Account Manager Activities"
{

    //Unsupported feature: Insertion (ActionCollection) on "Payments(Control 6)".


    //Unsupported feature: Insertion (ActionCollection) on ""Document Approvals"(Control 19)".

    actions
    {
        addafter("New Purchase Credit Memo")
        {
            action("Client Bank")
            {
                ApplicationArea = All;
                Caption = 'Client Bank';
                RunObject = Page "Bank Name";
            }
            action("Merged Bill and CRN")
            {
                ApplicationArea = All;
                Caption = 'Merged Bill and CRN';
                RunObject = Report "Merged Bill and CRN";
            }
            action("Customer Collection")
            {
                ApplicationArea = All;
                Caption = 'Customer Collection';
                RunObject = report "Cusotmer Collection";
            }

        }
        addafter("Create Finance Charge Memos...")
        {
            action("Client Bank1")
            {
                ApplicationArea = All;
                Caption = 'Client Bank';
                RunObject = Page "Bank Name";
            }
            action("Merged Bill and CRN1")
            {
                ApplicationArea = All;
                Caption = 'Merged Bill and CRN';
                RunObject = Report "Merged Bill and CRN";
            }
            action("Customer Detailed Aging")
            {
                ApplicationArea = All;
                Caption = 'Customer Detailed Aging';
                RunObject = report "Customer Detailed Aging (NEW)";
            }

        }

    }
}

