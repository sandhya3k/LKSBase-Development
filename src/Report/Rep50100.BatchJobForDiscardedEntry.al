report 50100 "Batch Job For Discarded Entry"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './res/BatchJobForDiscardedEntry.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(= ''));

            trigger OnAfterGetRecord()
            begin
                if "Collection Detail"."On Submit Receipt No." = '' then
                    "Collection Detail".DeleteAll;
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
    trigger OnPostReport()
    begin
        message('The report has been processed successfully');
    end;

    var
        ok: Boolean;
}

