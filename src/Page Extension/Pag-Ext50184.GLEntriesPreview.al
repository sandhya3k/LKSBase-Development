pageextension 50184 "G/L Entries PreviewExt" extends "G/L Entries Preview"
{
    layout
    {
        // Add changes to page layout here
        modify(Description)
        {
            Visible = false;
        }
        addafter("G/L Account Name")
        {
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = all;
                caption = 'Description';
            }
            //>>#94
            field("Cheque No. 2"; Rec."Cheque No.")
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