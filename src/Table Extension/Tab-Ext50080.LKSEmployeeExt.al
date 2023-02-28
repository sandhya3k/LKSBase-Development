tableextension 50080 "LKSEmployeeExt" extends Employee
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Country/Region Code"(Field 25)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112
        if ("Country/Region Code" <> xRec."Country/Region Code") and (xRec."Country/Region Code" <> '') then
          PostCode.ClearFields(City,"Post Code",County);
        //8112
        */
        //end;
        field(50000; "Full Name"; Text[100])
        {
        }
        field(50001; "Reporting To"; Code[20])
        {
        }
        field(50002; "Employee Role"; Text[30])
        {
        }
        field(50003; "Region ID"; Code[20])
        {
        }
        field(50004; "Group ID"; Code[20])
        {
        }
        field(50005; Solution; Text[30])
        {
        }
        field(50006; Practice; Text[50])
        {
        }
        field(50007; "Area"; Text[40])
        {
        }
        field(50008; Domain; Text[50])
        {
        }
        field(50009; Designation; Text[50])
        {
        }
        field(50010; "Company ID"; Integer)
        {
        }
        field(50011; "HR Code"; Code[20])
        {
            Description = 'LCMS Integration';
        }
    }
}

