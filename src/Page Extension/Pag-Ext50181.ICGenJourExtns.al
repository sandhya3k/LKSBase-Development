pageextension 50181 "ICGenJourExtns" extends "IC General Journal"
{
    layout
    {
        //#122
        modify(Description)
        {
            Visible = false;
        }

        addafter("Account No.")
        {
            field("Description 3"; Rec."Description 3 ")
            {
                Caption = 'Description';
                ApplicationArea = all;
            }
        }
        //#122
    }
}