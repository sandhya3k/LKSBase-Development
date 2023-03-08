pageextension 50185 "Bank Acc. Ldeger PreviewExt" extends "Bank Acc. Ledg. Entr. Preview"
{
    layout
    {
        // Add changes to page layout here
        modify(Description)
        {
            Visible = false;
        }
        addafter("Bank Account No.")
        {
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = all;
                caption = 'Description';
            }
            //>>#94
            field("Cheque No. 2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = All;
            }
            //<<#94
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}