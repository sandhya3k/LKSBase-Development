report 50180 "Batch Job-Test"
//PAN UPG Rename from 60000 to 50180
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Common Master"; "Common Master")
        {
            DataItemTableView = WHERE("Master Type" = FILTER(Client), "Company Head" = FILTER(VSH), "Division Type" = FILTER(VSH));

            trigger OnAfterGetRecord()
            begin
                ShiptoAdd.SetRange(ShiptoAdd."Customer No.", "Common Master"."Master ID");
                if ShiptoAdd.FindFirst then begin
                    repeat
                        "Common Master".Address := ShiptoAdd.Address;
                        "Common Master"."Address 2" := ShiptoAdd."Address 2";
                        "Common Master".City := ShiptoAdd.City;
                        "Common Master".Modify;
                    until ShiptoAdd.Next = 0;
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
        ShiptoAdd: Record "Ship-to Address";
        Cust: Record Customer;
}

