table 50017 "Approval For the LCMS"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Rtb No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Invoice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Payment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Payment Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Payment Date time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Payment Location"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Unapply; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Writeoff; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Actual Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Actual Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "CLE Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(14; Reversal; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(16; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            DataClassification = ToBeClassified;
        }
        field(17; "Applies Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Applies Remaining Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Status; Option)
        {
            OptionCaption = 'Open,Approved,Approved To Unapplied,UnApplied,Applied';
            OptionMembers = Open,Approved,"Approved To Unapplied",UnApplied,Applied;
        }
        field(20; "Created By"; Code[50])
        {
        }
        field(21; "Creation Date-Time"; DateTime)
        {
        }
        field(22; "Approved By"; Code[50])
        {
        }
        field(23; "Aproved Date-Time"; DateTime)
        {
        }
        field(24; "Unapplied By"; Code[50])
        {
        }
        field(25; "Unapplied Date-Time"; DateTime)
        {
        }
        field(26; "API status"; Option)
        {
            OptionMembers = " ",Success,Failed;
        }
        field(27; "API Exception"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Creation Date-Time" := CurrentDateTime;
    end;
}

