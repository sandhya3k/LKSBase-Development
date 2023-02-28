tableextension 50091 "LKSUserSetupExt" extends "User Setup"
{
    fields
    {
        field(50000; "Uneditable Page"; Boolean)
        {
            Description = 'LCMS Integration';
        }
        field(50001; "Location"; Code[20])
        {
            Description = 'LMS';
        }
    }
}

