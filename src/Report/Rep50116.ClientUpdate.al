report 50116 ClientUpdate
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/ClientUpdate.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord()
            begin
                //TEAM::1426
                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Company Head", CommonMaster."Company Head"::LKS);
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Client);
                CommonMaster.SetRange(CommonMaster."Master ID", "No.");
                if CommonMaster.FindFirst then begin
                    if CompanyName = 'Lakshmi Kumaran & Sridharan' then begin
                        CommonMaster."Company Head" := CommonMaster."Company Head"::LKS;
                    end;
                    if CompanyName = 'V.Lakshmikumaran' then begin
                        CommonMaster."Company Head" := CommonMaster."Company Head"::VLK;
                    end;
                    if CompanyName = 'V.Sridharan' then begin
                        CommonMaster."Company Head" := CommonMaster."Company Head"::VSH;
                    end;
                    CommonMaster."Master Description" := Customer.Name;
                    CommonMaster.Modify(true);
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
}

