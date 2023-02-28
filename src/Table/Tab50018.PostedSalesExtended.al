table 50018 "Posted Sales Extended"
{

    fields
    {
        field(1; "Posted Document Type"; Option)
        {
            OptionCaption = 'Invoice,Shipment,Credit-Memo,Return Receipt';
            OptionMembers = Invoice,Shipment,"Credit-Memo","Return Receipt";
        }
        field(2; "No."; Code[20])
        {
        }
        field(50000; "Posting Date"; Date)
        {
        }
        field(70000; "IRN No."; Text[70])
        {
        }
        field(70001; "Ack No."; Code[20])
        {
        }
        field(70002; "Ack Date"; DateTime)
        {
        }
        field(70003; "Cancel Remarks"; Option)
        {
            OptionCaption = ' ,Duplicate,Data Entry Mistake,Wrong Entry';
            OptionMembers = " ",Duplicate,"Data Entry Mistake","Wrong Entry";
        }
        field(70004; "QR Code"; BLOB)
        {
            SubType = Bitmap;
        }
    }

    keys
    {
        key(Key1; "Posted Document Type", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

