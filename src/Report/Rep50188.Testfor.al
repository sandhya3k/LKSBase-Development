report 50188 "Test for"
//PAN UPG Rename from 89078 to 50188
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/Testfor.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {

            trigger OnAfterGetRecord()
            begin
                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Collection No.", "Collection Detail"."Receipt No.");
                if GLEntry.FindFirst then begin
                    "Collection Detail".Posted := true;
                    "Collection Detail"."Voucher No. of Navision" := GLEntry."Document No.";
                    "Collection Detail".Modify;
                end;
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
        GLEntry: Record "G/L Entry";
}

