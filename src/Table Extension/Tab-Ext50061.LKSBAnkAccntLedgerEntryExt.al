tableextension 50061 "LKSBAnkAccntLedgerEntryExt" extends "Bank Account Ledger Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Cheque No."(Field 16501)".

        field(50000; "Payment Made By"; Text[100])
        {
            Description = '//TEAM::1426';
        }
        field(50001; "Currency Amount"; Decimal)
        {
        }
        field(50002; "Currency Code 1"; Code[20])
        {
        }
        field(50003; "Debit Currency"; Decimal)
        {
        }
        field(50004; "Credit Currency"; Decimal)
        {
        }
        field(50005; "Location Code"; code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;

        }
        field(50006; "Cheque No. 2"; Code[30])
        {
            Caption = 'Cheque No.';
        }
        //<<#122
        field(50007; "Description 3"; text[100])
        {
            Caption = 'Description';
        }
        //#122>>
    }
    keys
    {
        //TBD
        /*
        key(Key1; "Location Code", "Posting Date")
        {
        }
        key(Key2; "Posting Date")
        {
        }
        */
    }


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 3)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Bank Account No." := GenJnlLine."Account No.";
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    #4..15
    "User ID" := UserId;
    "Bal. Account Type" := GenJnlLine."Bal. Account Type";
    "Bal. Account No." := GenJnlLine."Bal. Account No.";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    //TMC-11905
    if GenJnlLine."Currency Code" <> '' then begin
      "Currency Amount" := GenJnlLine.Amount;
      "Currency Code 1" := GenJnlLine."Currency Code";
      "Debit Currency" := GenJnlLine."Debit Amount";
      "Credit Currency" := GenJnlLine."Credit Amount";
    end;
    //TMC-11905
    */
    //end;
}

