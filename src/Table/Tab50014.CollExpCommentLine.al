table 50014 "Coll.Exp.Comment Line"
{

    fields
    {
        field(1; "Voucher No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Company Head"; Option)
        {
            Editable = false;
            OptionCaption = 'Lakshmi Kumaran & Sridharan,V.Lakshmikumaran,V.Sridharan';
            OptionMembers = LKS,VLK,VSH;
        }
        field(3; Division; Option)
        {
            Editable = false;
            OptionCaption = 'TAX,IPR,VLK,VSH';
            OptionMembers = TAX,IPR,VLK,VSH;
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(5; Comment; Text[100])
        {
        }
        field(6; "Document Type"; Option)
        {
            OptionCaption = 'Collection,Expense';
            OptionMembers = Collection,Expense;
        }
        field(7; Date; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Voucher No.", "Company Head", Division, "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

