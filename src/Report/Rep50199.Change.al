report 50199 Change
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/Change.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE("No." = CONST('0000501113'), "Document Type" = CONST(Quote));

            trigger OnAfterGetRecord()
            begin
                "Sales Header".Rename("Sales Header"."Document Type"::Quote, '');
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
}

