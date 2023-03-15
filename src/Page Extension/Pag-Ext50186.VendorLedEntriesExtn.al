pageextension 50186 "Vendor Ledger EntriesExt" extends "Vendor Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor No.")
        {
            // field("Description 3"; Rec."Description 3")
            // {
            //     ApplicationArea = all;
            //     caption = 'Description';
            // }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}