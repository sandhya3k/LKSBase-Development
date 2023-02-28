report 50108 "Comman master update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/Commanmasterupdate.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord()
            begin
                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Client);
                CommonMaster.SetRange(CommonMaster."Master ID", Customer."No.");
                CommonMaster.Get(Customer."No.");
                Result := CommonMaster.Rename(Customer.Name);
                if Result then
                    Message(CommonMaster."Master Description");
                //   MESSAGE('%1',Cust);
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
        Cust: Text[250];
        Result: Boolean;
}

