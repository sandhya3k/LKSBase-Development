table 50015 "Common Master"
{
    DataPerCompany = false;
    DrillDownPageID = "Common Master List";
    LookupPageID = "Common Master List";

    fields
    {
        field(1; "Company Head"; Option)
        {
            OptionCaption = 'Lakshmi Kumaran & Sridharan,V.Lakshmikumaran,V.Sridharan';
            OptionMembers = LKS,VLK,VSH;
        }
        field(2; "Master Type"; Option)
        {
            OptionCaption = ' ,Bank,Client,Expense,ClientBank,BankCity,Vendor,G/L Account';
            OptionMembers = " ",Bank,Client,Expense,ClientBank,BankCity,Vendor,"G/L Account";
        }
        field(3; "Master ID"; Code[20])
        {
        }
        field(4; "Master Description"; Text[100])
        {
        }
        field(5; "Division Type"; Option)
        {
            OptionCaption = 'TAX,IPR,VLK,VSH';
            OptionMembers = TAX,IPR,VLK,VSH;
        }
        field(6; Remarks; Text[100])
        {
        }
        field(7; "Petty Cash"; Boolean)
        {
        }
        field(8; "Bank Cash"; Boolean)
        {
        }
        field(9; "TDS Account"; Boolean)
        {
        }
        field(10; "ST Account"; Boolean)
        {
        }
        field(11; "Expence Account"; Boolean)
        {
        }
        field(12; Address; Text[100])
        {
        }
        field(13; "Address 2"; Text[100])
        {
        }
        field(14; City; Code[40])
        {
        }
        field(15; Nation; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Company Head", "Master Type", "Master ID", "Master Description")
        {
            Clustered = true;
        }
        key(Key2; "Master ID", "Master Description")
        {
        }
    }

    fieldgroups
    {
    }
}

