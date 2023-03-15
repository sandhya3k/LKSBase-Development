tableextension 50062 "LKSCheckLedgerEntryExt" extends "Check Ledger Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".
        field(50000; "Cheque No. 2"; Code[30])
        {
            Caption = 'Cheque No.';
        }
        //<<#122
        field(50001; "Description 3 "; text[100])
        {
            Caption = 'Description';
        }
        //#122>>
        // //<<#122
        // field(50002; "Description 3"; text[100])
        // {
        //     Caption = 'Description';
        // }
        // //#122>>

    }
}

