report 50139 "Owner Update New"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/OwnerUpdateNew.rdlc';
    Caption = 'Owner Update New';
    Permissions = TableData "Cust. Ledger Entry" = rimd,
                  TableData "Sales Invoice Header" = rimd,
                  TableData "Sales Cr.Memo Header" = rimd;


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
                DimSetEntry: Record "Dimension Set Entry";
            begin

                CalcFields("Applied Document (Invoice)");
                CalcFields("Applied Document");
                if "Applied Document (Invoice)" <> '' then begin
                    if SIH.Get("Applied Document (Invoice)") then
                        if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then begin
                            if "Cust. Ledger Entry".OWNER2 = '' then
                                "Cust. Ledger Entry".OWNER2 := DimSetEntry."Dimension Value Code";
                            if "Cust. Ledger Entry"."Sub Group Owner 2" = '' then
                                if Dim_Value.Get('OWNER2', DimSetEntry."Dimension Value Code") then
                                    "Cust. Ledger Entry"."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                            "Cust. Ledger Entry".Modify
                        end;
                end else
                    if "Applied Document" <> '' then begin
                        if SIH.Get("Applied Document") then
                            if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then begin
                                if "Cust. Ledger Entry".OWNER2 = '' then
                                    "Cust. Ledger Entry".OWNER2 := DimSetEntry."Dimension Value Code";
                                if "Cust. Ledger Entry"."Sub Group Owner 2" = '' then
                                    if Dim_Value.Get('OWNER2', DimSetEntry."Dimension Value Code") then
                                        "Cust. Ledger Entry"."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                                "Cust. Ledger Entry".Modify
                            end;
                    end else begin
                        Dim_Value.Reset;
                        Dim_Value.SetFilter(Dim_Value."Dimension Code", 'CASE');
                        Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                        if Dim_Value.FindFirst then begin
                            //IF "Cust. Ledger Entry".OWNER2 = '' THEN
                            //New Changes-
                            if "Cust. Ledger Entry".OWNER2 <> Dim_Value."Case-Owner2" then
                                "Cust. Ledger Entry".OWNER2 := Dim_Value."Case-Owner2";
                            if "Cust. Ledger Entry".OWNER1 <> Dim_Value."Case-Owner1" then
                                "Cust. Ledger Entry".OWNER1 := Dim_Value."Case-Owner1";
                            //New Changes-
                            if "Cust. Ledger Entry"."Sub Group Owner 2" = '' then
                                "Cust. Ledger Entry"."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                            "Cust. Ledger Entry".Modify
                        end;
                    end;

                if SIH.Get("Cust. Ledger Entry"."Document No.") then begin
                    if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then begin
                        if "Cust. Ledger Entry".OWNER2 = '' then
                            "Cust. Ledger Entry".OWNER2 := DimSetEntry."Dimension Value Code";
                        if "Cust. Ledger Entry"."Sub Group Owner 2" = '' then
                            if Dim_Value.Get('OWNER2', DimSetEntry."Dimension Value Code") then
                                "Cust. Ledger Entry"."Sub Group Owner 2" := Dim_Value."Sub Group Owner 2";
                        "Cust. Ledger Entry".Modify
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                Date1 := GetRangeMin("Posting Date");
                Date2 := GetRangeMax("Posting Date");
            end;
        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            trigger OnAfterGetRecord()
            var
                DimSetEntry: Record "Dimension Set Entry";
                CustLedgerEmtry: Record "Cust. Ledger Entry";
            begin
                if DimSetEntry.Get("Sales Invoice Header"."Dimension Set ID", 'OWNER2') then begin
                    if "Sales Invoice Header"."Owner 2" = '' then
                        "Sales Invoice Header"."Owner 2" := DimSetEntry."Dimension Value Code";
                    if "Sales Invoice Header"."Sub Group Code" = '' then
                        if Dim_Value.Get('OWNER2', DimSetEntry."Dimension Value Code") then
                            "Sales Invoice Header"."Sub Group Code" := Dim_Value."Sub Group Owner 2";
                    "Sales Invoice Header".Modify;
                end;
                //New changes-
                Dim_Value.Reset;
                Dim_Value.SetFilter(Dim_Value."Dimension Code", 'CASE');
                Dim_Value.SetFilter(Dim_Value.Code, "Sales Invoice Header"."Shortcut Dimension 2 Code");
                if Dim_Value.FindFirst then begin
                    if "Sales Invoice Header"."Owner 2" <> Dim_Value."Case-Owner2" then
                        "Sales Invoice Header"."Owner 2" := Dim_Value."Case-Owner2";
                    if "Sales Invoice Header"."Owner 1" <> Dim_Value."Case-Owner1" then
                        "Sales Invoice Header"."Owner 1" := Dim_Value."Case-Owner1";
                    "Sales Invoice Header".Modify;
                end;
                //New Changes-
                /*
               IF DimSetEntry.GET("Sales Invoice Header"."Dimension Set ID",'GROUP') THEN BEGIN
                 "Sales Invoice Header"."Group Code" := DimSetEntry."Dimension Value Code";
                 "Sales Invoice Header".MODIFY;
               END;
                 */
                CustLedgerEmtry.Reset;
                CustLedgerEmtry.SetRange("Document No.", "No.");
                if CustLedgerEmtry.FindFirst then begin
                    if "Sales Invoice Header"."Group Code" = '' then
                        "Sales Invoice Header"."Group Code" := CustLedgerEmtry."Group Heade";
                    "Sales Invoice Header".Modify;
                end;

            end;

            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", Date1, Date2);
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {

            trigger OnAfterGetRecord()
            var
                CustLedgerEmtry: Record "Cust. Ledger Entry";
            begin
                if DimSetEntry.Get("Dimension Set ID", 'OWNER2') then begin
                    if "Sales Cr.Memo Header"."Owner 2" = '' then
                        "Owner 2" := DimSetEntry."Dimension Value Code";
                    if "Sales Cr.Memo Header"."Sub Group Code" = '' then
                        if Dim_Value.Get('OWNER2', DimSetEntry."Dimension Value Code") then
                            "Sub Group Code" := Dim_Value."Sub Group Owner 2";
                    Modify;
                end;
                /*
                IF DimSetEntry.GET("Dimension Set ID",'GROUP') THEN BEGIN
                  "Group Code" := DimSetEntry."Dimension Value Code";
                  MODIFY;
                END;
                  */
                CustLedgerEmtry.Reset;
                CustLedgerEmtry.SetRange("Document No.", "No.");
                if CustLedgerEmtry.FindFirst then begin
                    if "Sales Cr.Memo Header"."Group Code" = '' then begin
                        "Group Code" := CustLedgerEmtry."Group Heade";
                        Modify;
                    end;
                end;

            end;

            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", Date1, Date2);
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
        Date1: Date;
        Date2: Date;
}

