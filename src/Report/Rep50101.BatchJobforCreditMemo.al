report 50101 "Batch Job for Credit Memo"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BatchJobforCreditMemo.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE("Document Type" = FILTER("Credit Memo"));

            trigger OnAfterGetRecord()
            begin
                DimValue.Reset;
                DimValue.SetRange(DimValue."Dimension Code", 'BRANCH');
                DimValue.SetRange(DimValue.Code, "Sales Header"."Shortcut Dimension 1 Code");
                if DimValue.FindFirst then begin
                    "Sales Header"."Location Code" := DimValue.Name;
                    "Sales Header".Modify;
                end;

                PostedSalesInv.Reset;
                PostedSalesInv.SetRange(PostedSalesInv."No.", "Sales Header"."Applies-to Doc. No.");
                if PostedSalesInv.FindFirst then begin
                    "Sales Header"."Bill-to Contact No." := PostedSalesInv."Bill-to Contact No.";
                    "Sales Header"."Bill-to Name" := PostedSalesInv."Ship-to Name";
                    "Sales Header"."Bill-to Name 2" := PostedSalesInv."Ship-to Name 2";
                    "Sales Header"."Bill-to Address" := PostedSalesInv."Ship-to Address";
                    "Sales Header"."Bill-to Address 2" := PostedSalesInv."Ship-to Address 2";
                    "Sales Header"."Bill-to City" := PostedSalesInv."Ship-to City";
                    "Sales Header".Modify;
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
        DimValue: Record "Dimension Value";
        BranchDimVal: Record "Dimension Value";
        PostedSalesInv: Record "Sales Invoice Header";
}

