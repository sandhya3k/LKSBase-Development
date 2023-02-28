report 50104 Test
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/Test.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; Customer."No.")
            {
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(Master_Desc; MasterDesc)
            {
            }
            column(Master_ID; MasterID)
            {
            }

            trigger OnAfterGetRecord()
            begin
                MasterID := '';
                MasterDesc := '';
                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Client);
                CommonMaster.SetRange(CommonMaster."Division Type", CommonMaster."Division Type"::TAX);
                CommonMaster.SetRange(CommonMaster."Master ID", Customer."No.");
                if CommonMaster.FindFirst then begin
                    MasterID := CommonMaster."Master ID";
                    MasterDesc := CommonMaster."Master Description";
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CommonMaster: Record "Common Master";
        MasterDesc: Text[250];
        MasterID: Code[20];
}

