pageextension 50104 pageextension50104 extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
            field("Statement Status"; Rec."Statement Status")
            {
                ApplicationArea = All;
            }
            field("Statement No."; Rec."Statement No.")
            {
                ApplicationArea = All;
            }
            field("Statement Line No."; Rec."Statement Line No.")
            {
                ApplicationArea = All;
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = all;
            }
        }
        addafter(Open)
        {
            field("Closed at Date"; Rec."Closed at Date")
            {
                ApplicationArea = All;
            }
        }
        //TBD
        /*
        addafter("Reversed Entry No.")
        {
            field("Cheque No."; Rec."Cheque No.")
            {ApplicationArea = All;
            }
            field("Cheque Date"; Rec."Cheque Date")
            {ApplicationArea = All;
            }
        }
        */
        modify("Cheque No.")
        {
            Visible = False;
        }
        addbefore("Cheque Date")
        {
            field("Cheque No.2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = All;
            }
        }
        addafter("Bank Account No.")
        {
            field("Description 3"; Rec."Description 3")
            {
                Caption = 'Description';
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            field("Currency Amount"; Rec."Currency Amount")
            {
                ApplicationArea = All;
                Caption = 'Foreign Amount';
            }
            field("Currency Code 1"; Rec."Currency Code 1")
            {
                ApplicationArea = All;
                Caption = 'Currency Code';
            }
            field("Debit Currency"; Rec."Debit Currency")
            {
                ApplicationArea = All;
            }
            field("Credit Currency"; Rec."Credit Currency")
            {
                ApplicationArea = All;
            }
        }
    }
}

