report 50140 "Group_Head_Update New"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Group_Head_Update New';
    RDLCLayout = './res/GroupHeadUpdateNew.rdlc';
    Permissions = TableData "Cust. Ledger Entry" = rimd,
                  TableData "Sales Invoice Header" = rm;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            CalcFields = "Applied Document (Invoice)", "Applied Document";

            trigger OnAfterGetRecord()
            var
                CustLedEntrry: Record "Cust. Ledger Entry";
                CustLedEntrry1: Record "Cust. Ledger Entry";
                SIH: Record "Sales Invoice Header";
            begin

                /*Dim_Value.RESET;
                Dim_Value.SETFILTER(Dim_Value."Dimension Code",'CASE');
                Dim_Value.SETFILTER(Dim_Value.Code,"Cust. Ledger Entry"."Global Dimension 2 Code");
                IF Dim_Value.FINDFIRST THEN BEGIN
                   "Cust. Ledger Entry".OWNER2 :=Dim_Value."Case-Owner2";
                   "Cust. Ledger Entry".MODIFY
                   END;               */

                Dim_Value.Reset;
                Dim_Value.SetFilter(Dim_Value."Dimension Code", 'OWNER2');
                Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry".OWNER2);
                if Dim_Value.FindFirst then begin
                    "Cust. Ledger Entry"."Group Heade" := Dim_Value."Group-Head";
                    "Cust. Ledger Entry".Modify;
                    if SIH.Get("Cust. Ledger Entry"."Document No.") then begin
                        SIH."Group Code" := Dim_Value."Group-Head";
                        SIH.Modify;
                    end;
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

