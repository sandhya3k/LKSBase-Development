pageextension 50087 pageextension50087 extends "Customer List"
{
    layout
    {

        addafter(Name)
        {
            field("Client Name"; Rec."Client Name")
            {
                ApplicationArea = All;
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
            }
        }
        addafter("Combine Shipments")
        {
            field("Client For"; Rec."Client For")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        //addafter("Customer - Payment Receipt")


        addafter(ReportCustomerPaymentReceipt)
        {
            action("Email Customer Aging")
            {
                ApplicationArea = All;
                Caption = 'Email Customer Aging';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GLSetup: Record "General Ledger Setup";
                    ReportTorun: Report "Customer Aging Mail";
                begin
                    GLSetup.Get();
                    if (UpperCase(UserId) <> UpperCase(GLSetup."Customer Aging Email User ID")) and (UpperCase(UserId) <> UpperCase('LSLAW\RAMESH.TEAM')) then
                        Error('You can not execute this report!!!');

                    ReportTorun.RunModal;
                end;
            }
        }
    }

    var
        CustomerAgeVisible: Boolean;


}

