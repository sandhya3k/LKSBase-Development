reportextension 50101 "genJnlTest" extends "General Journal - Test GST"
{
    // dataset
    // {
    //     add("Gen. Journal Line")
    //     {

    //     }
    // }
    requestpage
    {
        layout
        {
            addafter(Options)
            {

                field("Journal Template Name"; genJnl."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                    ApplicationArea = all;




                }
                field("Journal Batch Name"; genJnl."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ApplicationArea = all;

                }
            }

        }
    }
    var
        genJnl: Record "Gen. Journal Line";

}