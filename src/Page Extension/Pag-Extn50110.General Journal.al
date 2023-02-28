pageextension 50110 pageextension50110 extends "General Journal"
{
    layout
    {
        addafter("ShortcutDimCode8")
        {
            field("Group Head"; Rec."Group Head")
            {
                ApplicationArea = All;
            }
        }
        //#122
        modify(Description)
        {
            Visible = false;
        }

        addafter("Account Name")
        {
            field("Description 3"; Rec."Description 3 ")
            {
                Caption = 'Description';
                ApplicationArea = all;
            }
        }
        //#122
    }
    actions
    {
        addfirst("F&unctions")
        {
            action("Import Salary")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(BankPaymentAdvice);
                    BankPaymentAdvice.SetTemplateBatch(Rec."Journal Template Name", Rec."Journal Batch Name");
                    BankPaymentAdvice.Run;
                end;
            }
        }
    }

    var
        BankPaymentAdvice: XMLport "Bank Payment Advice";
}

