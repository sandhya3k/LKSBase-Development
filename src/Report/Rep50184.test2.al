report 50184 "test2"
//PAN UPG Rename from 70010 to 50184
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {

            trigger OnAfterGetRecord()
            begin
                if "Gen. Journal Line"."Payble At" <> '' then begin
                    genNar.Reset;
                    genNar.SetRange(genNar."Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                    genNar.SetRange(genNar."Journal Batch Name", "Gen. Journal Line"."Journal Batch Name");
                    genNar.SetRange(genNar."Document No.", "Gen. Journal Line"."Document No.");
                    genNar.SetRange(genNar."Gen. Journal Line No.", "Gen. Journal Line"."Line No.");
                    if not genNar.Find('-') then begin
                        genNar.Init;
                        genNar."Journal Template Name" := "Gen. Journal Line"."Journal Template Name";
                        genNar."Journal Batch Name" := "Gen. Journal Line"."Journal Batch Name";
                        genNar."Document No." := "Gen. Journal Line"."Document No.";
                        genNar."Gen. Journal Line No." := "Gen. Journal Line"."Line No.";
                        genNar."Line No." := 10000;
                        genNar.Narration := CopyStr("Gen. Journal Line"."Payble At", 1, 50);
                        genNar.Insert;

                        genNar.Init;
                        genNar."Journal Template Name" := "Gen. Journal Line"."Journal Template Name";
                        genNar."Journal Batch Name" := "Gen. Journal Line"."Journal Batch Name";
                        genNar."Document No." := "Gen. Journal Line"."Document No.";
                        genNar."Gen. Journal Line No." := "Gen. Journal Line"."Line No.";
                        genNar."Line No." := 20000;
                        genNar.Narration := CopyStr("Gen. Journal Line"."Payble At", 51);
                        genNar.Insert;

                    end;
                    // "Gen. Journal Line".VALIDATE("Gen. Journal Line"."Narration 1");
                    // "Gen. Journal Line".MODIFY;
                end;
            end;

            trigger OnPreDataItem()
            begin
                //"Gen. Journal Line".SETRANGE("Gen. Journal Line"."Journal Template Name","Gen. Journal Line"."Journal Template Name");
                //"Gen. Journal Line".SETRANGE("Gen. Journal Line"."Journal Batch Name","Gen. Journal Line"."Journal Batch Name");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        genNar: Record "Gen. Journal Narration";
}

