report 50137 Group_Head_Update
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/GroupHeadUpdate.rdlc';
    Permissions = TableData "Cust. Ledger Entry" = rimd;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            CalcFields = "Applied Document (Invoice)", "Applied Document";

            trigger OnAfterGetRecord()
            var
                CustLedEntrry: Record "Cust. Ledger Entry";
                CustLedEntrry1: Record "Cust. Ledger Entry";
            begin

                Dim_Value.Reset;
                Dim_Value.SetFilter(Dim_Value."Dimension Code", 'CASE');
                Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if Dim_Value.FindFirst then begin
                    "Cust. Ledger Entry".OWNER2 := Dim_Value."Case-Owner2";
                    "Cust. Ledger Entry".Modify
                end;

                Dim_Value.Reset;
                Dim_Value.SetFilter(Dim_Value."Dimension Code", 'OWNER2');
                Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry".OWNER2);
                if Dim_Value.FindFirst then begin
                    "Cust. Ledger Entry"."Group Heade" := Dim_Value."Group-Head";
                    "Cust. Ledger Entry".Modify
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
        DimSetEntry: Record "Dimension Set Entry";
        Dim_Value: Record "Dimension Value";
}

