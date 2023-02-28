report 50103 "Batch Job For CM Update"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord()
            begin

                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Division Type", CommonMaster."Division Type"::TAX);
                CommonMaster.SetRange(CommonMaster."Master ID", Customer."No.");
                if not CommonMaster.FindFirst then begin
                    CommonMaster.Init;
                    CommonMaster."Company Head" := CommonMaster."Company Head"::LKS;
                    CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                    CommonMaster."Master ID" := Customer."No.";
                    CommonMaster."Master Description" := Customer.Name;
                    ShiptoAddress.Reset;
                    ShiptoAddress.SetRange(ShiptoAddress."Customer No.", Customer."No.");
                    if ShiptoAddress.FindFirst then begin
                        CommonMaster.Address := ShiptoAddress."Client Address 1";
                        CommonMaster."Address 2" := ShiptoAddress."Client Address 2";
                        CommonMaster.City := ShiptoAddress.City;
                    end;
                    CommonMaster.Insert;
                end;

                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Division Type", CommonMaster."Division Type"::TAX);
                CommonMaster.SetRange(CommonMaster."Master ID", Customer."No.");
                if not CommonMaster.FindFirst then begin
                    CommonMaster.Init;
                    CommonMaster."Company Head" := CommonMaster."Company Head"::VSH;
                    CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                    CommonMaster."Master ID" := Customer."No.";
                    CommonMaster."Master Description" := Customer.Name;
                    ShiptoAddress.Reset;
                    ShiptoAddress.SetRange(ShiptoAddress."Customer No.", Customer."No.");
                    if ShiptoAddress.FindFirst then begin
                        CommonMaster.Address := ShiptoAddress."Client Address 1";
                        CommonMaster."Address 2" := ShiptoAddress."Client Address 2";
                        CommonMaster.City := ShiptoAddress.City;
                    end;
                    CommonMaster.Insert;
                end;

                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Division Type", CommonMaster."Division Type"::TAX);
                CommonMaster.SetRange(CommonMaster."Master ID", Customer."No.");
                if not CommonMaster.FindFirst then begin
                    CommonMaster.Init;
                    CommonMaster."Company Head" := CommonMaster."Company Head"::VLK;
                    CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                    CommonMaster."Master ID" := Customer."No.";
                    CommonMaster."Master Description" := Customer.Name;
                    ShiptoAddress.Reset;
                    ShiptoAddress.SetRange(ShiptoAddress."Customer No.", Customer."No.");
                    if ShiptoAddress.FindFirst then begin
                        CommonMaster.Address := ShiptoAddress."Client Address 1";
                        CommonMaster."Address 2" := ShiptoAddress."Client Address 2";
                        CommonMaster.City := ShiptoAddress.City;
                    end;
                    CommonMaster.Insert;
                end


                /*
                CommonMaster.RESET;
                CommonMaster.SETRANGE(CommonMaster."Master Type",CommonMaster."Master Type"::Client);
                CommonMaster.SETRANGE(CommonMaster."Master ID",Customer."No.");
                IF NOT CommonMaster.FINDSET THEN BEGIN
                       CommonMaster.INIT;
                       IF COMPANYNAME = 'Lakshmi Kumaran & Sridharan' THEN BEGIN
                          CommonMaster."Company Head" := CommonMaster."Company Head"::LKS;
                       END;
                //       IF COMPANYNAME = 'V.Lakshmikumaran' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::VLK;
                //       END;
                //       IF COMPANYNAME = 'V.Sridharan' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::VSH;
                //       END;
                       CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                       CommonMaster."Master ID" := Customer."No.";
                       CommonMaster."Master Description" := Customer.Name;
                       ShiptoAddress.RESET;
                       ShiptoAddress.SETRANGE(ShiptoAddress."Customer No.",Customer."No.");
                       IF ShiptoAddress.FINDFIRST THEN BEGIN
                          CommonMaster.Address := ShiptoAddress.Address;
                          CommonMaster."Address 2" := ShiptoAddress."Address 2";
                          CommonMaster.City := ShiptoAddress.City;
                       END;
                       CommonMaster.INSERT;
                END;
                
                CommonMaster.RESET;
                CommonMaster.SETRANGE(CommonMaster."Master Type",CommonMaster."Master Type"::Client);
                CommonMaster.SETRANGE(CommonMaster."Master ID",Customer."No.");
                IF NOT CommonMaster.FINDSET THEN BEGIN
                       CommonMaster.INIT;
                //       IF COMPANYNAME = 'Lakshmi Kumaran & Sridharan' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::LKS;
                //       END;
                       IF COMPANYNAME = 'V.Lakshmikumaran' THEN BEGIN
                          CommonMaster."Company Head" := CommonMaster."Company Head"::VLK;
                       END;
                //       IF COMPANYNAME = 'V.Sridharan' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::VSH;
                //       END;
                       CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                       CommonMaster."Master ID" := Customer."No.";
                       CommonMaster."Master Description" := Customer.Name;
                       ShiptoAddress.RESET;
                       ShiptoAddress.SETRANGE(ShiptoAddress."Customer No.",Customer."No.");
                       IF ShiptoAddress.FINDFIRST THEN BEGIN
                          CommonMaster.Address := ShiptoAddress.Address;
                          CommonMaster."Address 2" := ShiptoAddress."Address 2";
                          CommonMaster.City := ShiptoAddress.City;
                       END;
                       CommonMaster.INSERT;
                END;
                
                CommonMaster.RESET;
                CommonMaster.SETRANGE(CommonMaster."Master Type",CommonMaster."Master Type"::Client);
                CommonMaster.SETRANGE(CommonMaster."Master ID",Customer."No.");
                IF NOT CommonMaster.FINDSET THEN BEGIN
                       CommonMaster.INIT;
                //       IF COMPANYNAME = 'Lakshmi Kumaran & Sridharan' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::LKS;
                //       END;
                //       IF COMPANYNAME = 'V.Lakshmikumaran' THEN BEGIN
                //          CommonMaster."Company Head" := CommonMaster."Company Head"::VLK;
                //       END;
                       IF COMPANYNAME = 'V.Sridharan' THEN BEGIN
                          CommonMaster."Company Head" := CommonMaster."Company Head"::VSH;
                       END;
                       CommonMaster."Master Type" := CommonMaster."Master Type"::Client;
                       CommonMaster."Master ID" := Customer."No.";
                       CommonMaster."Master Description" := Customer.Name;
                       ShiptoAddress.RESET;
                       ShiptoAddress.SETRANGE(ShiptoAddress."Customer No.",Customer."No.");
                       IF ShiptoAddress.FINDFIRST THEN BEGIN
                          CommonMaster.Address := ShiptoAddress.Address;
                          CommonMaster."Address 2" := ShiptoAddress."Address 2";
                          CommonMaster.City := ShiptoAddress.City;
                       END;
                       CommonMaster.INSERT;
                END;
                 */

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
        ShiptoAddress: Record "Ship-to Address";
}

