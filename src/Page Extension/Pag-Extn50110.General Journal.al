pageextension 50110 pageextension50110 extends "General Journal"
{
    layout
    {
        //#122
        modify(Description)
        {
            Visible = false;
        }

        addafter("Document No.")
        {
            field("Description 3"; Rec."Description 3 ")
            {
                Caption = 'Description';
                ApplicationArea = all;
            }
        }
        //#122
        modify("Cheque No.")
        {
            Visible = false;
        }
        addbefore("Cheque Date")
        {
            field("Cheque No. 2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = all;
            }

        }
        addafter("ShortcutDimCode8")
        {
            field("Group Head"; Rec."Group Head")
            {
                ApplicationArea = All;
            }
        }
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

