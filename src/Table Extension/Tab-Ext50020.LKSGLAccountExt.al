tableextension 50020 "LKSGLAccountExt" extends "G/L Account"
{
    fields
    {
        field(50000; "Income Account"; Boolean)
        {
            Description = 'T4270 - For Income Account Bifurcation';
        }
        field(50001; Hide; Boolean)
        {
            Description = 'T1426-For Hide Account';
        }
    }
}

