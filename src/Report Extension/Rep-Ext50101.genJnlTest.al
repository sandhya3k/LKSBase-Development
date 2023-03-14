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

                field(GenTemplate; GenTemplate)
                {
                    Caption = 'Journal Template Name';
                    ApplicationArea = all;
                    TableRelation = "Gen. Journal Template";
                }
                field(Genbatch; Genbatch)
                {
                    Caption = 'Journal Batch Name';
                    ApplicationArea = all;
                    TableRelation = "Gen. Journal Batch";
                }

            }

        }
    }
    var
        genJnl: Record "Gen. Journal Line";
        GenTemplate: Code[10];
        Genbatch: Code[10];


}