report 50160 "Update ShiptoCon"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Update ShiptoCon';
    RDLCLayout = './res/UpdateShiptoCon.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Invoice), Open = CONST(true));

            trigger OnAfterGetRecord()
            var
                SalesInvHeader: Record "Sales Invoice Header";
                Cont: Record Contact;
            begin
                SalesInvHeader.Reset;
                if SalesInvHeader.Get("Cust. Ledger Entry"."Document No.") then
                    if Cont.Get(SalesInvHeader."Bill-to Contact No.") then begin
                        "Cust. Ledger Entry"."Ship-to Contact" := Cont.Initials + ' ' + Cont."F Name" + ' ' + Cont."M Name" + ' ' + Cont."L Name";
                        "Cust. Ledger Entry".Modify;
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
}

