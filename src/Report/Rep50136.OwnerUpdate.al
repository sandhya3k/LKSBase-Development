report 50136 "Owner Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/OwnerUpdate.rdlc';
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
                /*
                CustLedEntrry.CALCFIELDS("Applied Document (Invoice)");
                IF CustLedEntrry."Applied Document (Invoice)" <>'' THEN BEGIN
                   CustLedEntrry.RESET;
                   CustLedEntrry.SETRANGE("Document No.","Cust. Ledger Entry"."Applied Document (Invoice)");
                  IF CustLedEntrry.FINDFIRST THEN
                  REPEAT
                  "Cust. Ledger Entry".OWNER2:=CustLedEntrry.OWNER2;
                  "Cust. Ledger Entry".MODIFY;
                  UNTIL
                  CustLedEntrry.NEXT = 0;
                  END
                ELSE
                BEGIN
                CustLedEntrry1.CALCFIELDS("Applied Document");
                IF CustLedEntrry1."Applied Document" <>'' THEN
                BEGIN
                CustLedEntrry1.RESET;
                CustLedEntrry1.SETRANGE("Document No.","Cust. Ledger Entry"."Applied Document");
                IF CustLedEntrry1.FINDFIRST THEN
                  REPEAT
                  "Cust. Ledger Entry".OWNER2:=CustLedEntrry1.OWNER2;
                  "Cust. Ledger Entry".MODIFY;
                  UNTIL
                  CustLedEntrry1.NEXT = 0;
                  END
                END;
                */
                Dim_Value.Reset;
                Dim_Value.SetFilter(Dim_Value."Dimension Code", 'CASE');
                Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if Dim_Value.FindFirst then begin
                    "Cust. Ledger Entry".OWNER2 := Dim_Value."Case-Owner2";
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

