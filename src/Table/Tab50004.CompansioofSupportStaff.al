table 50004 "Compansio of Support Staff"
{

    fields
    {
        field(1; Name; Text[50])
        {
        }
        field(2; "Employee ID"; Integer)
        {
        }
        field(3; "Date of Joining"; Date)
        {
        }
        field(4; Branch; Code[10])
        {
        }
        field(5; Degisation; Text[30])
        {
        }
        field(6; Month; Integer)
        {
        }
        field(7; Year; Integer)
        {
        }
        field(8; "Payment Type"; Text[30])
        {
        }
        field(9; "Basic Pay"; Integer)
        {
        }
        field(10; HRA; Integer)
        {
        }
        field(11; Conveyance; Integer)
        {
        }
        field(12; "Special Allowance"; Integer)
        {
        }
        field(13; "Gross Pay"; Integer)
        {
        }
        field(14; Arears; Integer)
        {
        }
        field(15; "Professional Tax"; Integer)
        {
        }
        field(16; "Loan-Recovery"; Integer)
        {
        }
        field(17; PF; Integer)
        {
        }
        field(18; ESI; Integer)
        {
        }
        field(19; "Other Deduction"; Integer)
        {
        }
        field(20; "Net Pay"; Integer)
        {
        }
        field(21; "Payment Mode"; Option)
        {
            OptionCaption = 'Bank transfer/Cheque';
            OptionMembers = "Bank transfer/Cheque";
        }
        field(22; Remark; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

