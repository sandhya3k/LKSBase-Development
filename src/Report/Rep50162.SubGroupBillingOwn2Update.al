report 50162 "Sub Group Billing Own 2 Update"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Sub Group Billing Own 2 Update';
    RDLCLayout = './res/SubGroupBillingOwn2Update.rdlc';
    Permissions = TableData "Cust. Ledger Entry" = rm,
                  TableData "Sales Invoice Header" = rm,
                  TableData "Sales Cr.Memo Header" = rm;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {

            trigger OnAfterGetRecord()
            begin
                Clear(DimValue);
                DimValue.Get('OWNER2', OWNER2);
                "Sub Group Owner 2" := DimValue."Sub Group Owner 2";
                Modify;
            end;

            trigger OnPreDataItem()
            begin
                if not UpdateCLE then
                    "Cust. Ledger Entry".SetRange("Entry No.", 0);
            end;
        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            trigger OnAfterGetRecord()
            begin
                Clear(DimValue);
                DimValue.Get('OWNER2', "Owner 2");
                "Sub Group Code" := DimValue."Sub Group Owner 2";
                Modify;
            end;

            trigger OnPreDataItem()
            begin
                if not UpdateSIH then
                    "Sales Invoice Header".SetRange("No.", 'Test001');
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {

            trigger OnAfterGetRecord()
            begin
                Clear(DimValue);
                DimValue.Get('OWNER2', "Owner 2");
                "Sub Group Code" := DimValue."Sub Group Owner 2";
                Modify;
            end;

            trigger OnPreDataItem()
            begin
                if not UpdateSCM then
                    SetRange("No.", 'Test001');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Update Collection"; UpdateCLE)
                {
                    ApplicationArea = All;
                }
                field("Update Billing"; UpdateSIH)
                {
                    ApplicationArea = All;
                }
                field("Update CRN"; UpdateSCM)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        UpdateCLE: Boolean;
        UpdateSIH: Boolean;
        UpdateSCM: Boolean;
        DimValue: Record "Dimension Value";
}

