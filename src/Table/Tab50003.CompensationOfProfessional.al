table 50003 "Compensation Of Professional"
{

    fields
    {
        field(1; Name; Text[50])
        {
        }
        field(2; "Employee ID"; Text[20])
        {
        }
        field(3; "Date of Joining"; Date)
        {
        }
        field(4; Category; Text[30])
        {
        }
        field(5; Classification; Text[30])
        {
        }
        field(6; Branch; Code[10])
        {
        }
        field(7; Wing; Text[30])
        {
        }
        field(8; Level; Text[30])
        {
        }
        field(9; Month; Integer)
        {
        }
        field(10; Year; Integer)
        {
        }
        field(11; "Payment Typer"; Option)
        {
            OptionCaption = 'Regular/Arrears/Bonus';
            OptionMembers = "Regular/Arrears/Bonus";
        }
        field(12; "Annual  Compensation"; Integer)
        {
        }
        field(13; "Monthly Compensation"; Integer)
        {
        }
        field(14; "Firm Factor"; Integer)
        {
        }
        field(15; "Group Factor"; Integer)
        {
        }
        field(16; "Fixed"; Integer)
        {
        }
        field(17; "Firm Varriable"; Integer)
        {
        }
        field(18; "Group Variable"; Integer)
        {
        }
        field(19; Total; Integer)
        {
        }
        field(20; "Arrear Gross"; Integer)
        {
        }
        field(21; "TDS Rates"; Integer)
        {
        }
        field(22; "Amount Of TDS"; Integer)
        {
        }
        field(23; "Net Payable"; Integer)
        {
        }
        field(24; Telephone; Integer)
        {
        }
        field(25; Loan; Integer)
        {
        }
        field(26; "Other Deduction"; Integer)
        {
        }
        field(27; "Net Paid"; Integer)
        {
        }
        field(28; "Payment Mode"; Option)
        {
            OptionCaption = 'Bank Transfer,Cheque Payment';
            OptionMembers = "Bank Transfer","Cheque Payment";
        }
        field(29; Remarks; Integer)
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

