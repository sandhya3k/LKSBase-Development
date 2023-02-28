report 50196 "Test Check"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/TestCheck.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING(Open, "Due Date") WHERE("Journal Batch Name" = FILTER('JVWRITEOFF'), Reversed = FILTER(false), "Document Type" = CONST(Payment), "Document No." = FILTER('JVWO*'), "Applied Document (Invoice)" = FILTER(<> ''));
            RequestFilterFields = "Customer No.", "Posting Date", "Global Dimension 1 Code";
            dataitem(SIHWO; "Sales Invoice Header")
            {
                RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";
                column(CRNWO; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(CRNDateWO; "Cust. Ledger Entry"."Document Date")
                {
                }
                column(Sales_Invoice_Header__No__WO; "No.")
                {
                }
                column(Sales_Invoice_Header__Posting_Date_WO; "Posting Date")
                {
                }
                column(Sales_Invoice_Header__Shortcut_Dimension_1_Code_WO; "Shortcut Dimension 1 Code")
                {
                }
                column(Sales_Invoice_Header__Shortcut_Dimension_2_Code_WO; "Shortcut Dimension 2 Code")
                {
                }
                column(Sales_Invoice_Header__Sales_Invoice_Header___Sell_to_Customer_Name_WO; "Sell-to Customer Name")
                {
                }
                column(OWNER1Writeoff; OWNER1Writeoff)
                {
                }
                column(OWNER2Writeoff; OWNER2Writeoff)
                {
                }
                column(ContactnameWO; ContactnameWO)
                {
                }
                column(CaseProcessWO; CaseProcessWO)
                {
                }
                column(CaseSolutionWO; CaseSolutionWO)
                {
                }
                column(CaseAreaWO; CaseAreaWO)
                {
                }
                column(CasePracticeWO; CasePracticeWO)
                {
                }
                column(GroupHeadWO; GroupHeadWO)
                {
                }
                column(GroupHeadNameWO; GroupHeadNameWO)
                {
                }
                column(CurrencyWO; CurrencyWO)
                {
                }
                column(BILLAMTWO; BILLAMTWO)
                {
                }
                column(BILLAMTLCYWO; BILLAMTLCYWO)
                {
                }
                column(Bill_DescWO; Bill_DescWO + ' ' + Bill_Desc2WO)
                {
                }
                column(BILLAMT_Control1000000026WO; BILLAMTWO)
                {
                }
                column(BILLAMTLCY_Control1000000027WO; BILLAMTLCYWO)
                {
                }
                column(BILLAMT_Control1000000023WO; BILLAMTWO)
                {
                }
                column(BILLAMTLCY_Control1000000024WO; BILLAMTLCYWO)
                {
                }
                column(STaxWO; S_TaxWO)
                {
                }
                column(ReimExpWO; Reim_ExpWO)
                {
                }
                column(NetBillAmtSIHWO; (BILLAMTLCYWO - Reim_ExpWO - S_TaxWO))
                {
                }

                trigger OnAfterGetRecord()
                var
                    I: Integer;
                    DimSetEntry: Record "Dimension Set Entry";
                    DimVal: Record "Dimension Value";
                    Cont: Record Contact;
                    CurrExchangerate: Record "Currency Exchange Rate";
                    SIL: Record "Sales Invoice Line";
                    R_SIL: Record "Sales Invoice Line";
                    R_SIL1: Record "Sales Invoice Line";
                    CustLedgEntry: Record "Cust. Ledger Entry";
                begin
                    OWNER1Writeoff := '';
                    OWNER2Writeoff := '';
                    Clear(GroupHeadNameWO);
                    for I := 1 to 3 do begin //6700 For owner1 and 2
                        DimSetEntry.Reset;
                        DimSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                        if I = 1 then
                            DimSetEntry.SetRange("Dimension Code", 'OWNER1')
                        else
                            if I = 2 then
                                DimSetEntry.SetRange("Dimension Code", 'OWNER2')
                            else
                                DimSetEntry.SetRange("Dimension Code", 'GROUPHEAD');
                        if DimSetEntry.FindFirst then
                            if I = 1 then
                                OWNER1Writeoff := DimSetEntry."Dimension Value Code"
                            else
                                if I = 2 then
                                    OWNER2Writeoff := DimSetEntry."Dimension Value Code"
                                else
                                    GroupHeadNameWO := DimSetEntry."Dimension Value Name";
                    end; //6700

                    CaseSolutionWO := '';
                    CaseAreaWO := '';
                    CasePracticeWO := '';
                    CaseProcessWO := '';
                    DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                    DimVal.SetRange(DimVal.Code, SIHWO."Shortcut Dimension 2 Code");
                    if DimVal.Find('-') then begin
                        //Owner1:=DimVal."Case-Owner1"; Blocked (Picked straight from Dim set Entry above)
                        //Owner2:=DimVal."Case-Owner2";
                        CaseSolutionWO := DimVal."Case-Solution";
                        CaseAreaWO := DimVal."Case-Area";
                        CasePracticeWO := DimVal."Case-Practice";
                        CaseProcessWO := DimVal."Case-Process";
                    end;

                    //Contactname:='';
                    Cont.Reset;
                    Cont.SetRange(Cont."No.", "Bill-to Contact No.");
                    if Cont.Find('-') then begin
                        ContactnameWO := Cont."F Name" + Cont."M Name" + Cont."L Name";
                    end;

                    if SIHWO."Currency Code" = '' then
                        CurrencyWO := 'INR'
                    else
                        CurrencyWO := SIHWO."Currency Code";

                    CurRateWO := 0;
                    CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                    CurrExchangerate.SetRange(CurrExchangerate."Starting Date", "Posting Date");
                    if CurrExchangerate.Find('+') then begin
                        CurRateWO := CurrExchangerate."Relational Exch. Rate Amount";
                    end;

                    BILLAMTWO := 0;
                    //TBD
                    /*                    
                    SIL.SetRange(SIL."Document No.", "No.");
                    if SIL.Find('-') then begin
                        repeat
                            BILLAMTWO += SIL."Amount To Customer";
                        until
                        SIL.Next = 0;
                    end;
                    */

                    BILLAMTLCYWO := 0;
                    if CurRateWO > 0 then
                        BILLAMTLCYWO := BILLAMTWO * CurRateWO
                    else
                        BILLAMTLCYWO := BILLAMTWO;

                    SIL.Reset;
                    SIL.SetRange(SIL."Document No.", SIHWO."No.");
                    if SIL.Find('-') then
                        Bill_DescWO := SIL."Other Detail 1";
                    Bill_Desc2WO := SIL."Other Detail 2";

                    //   MESSAGE(Bill_Desc);  \

                    TaxableWO := 0;
                    staxWO := 0;
                    staxsheWO := 0;
                    staxecessWO := 0;
                    //TBD
                    /*
                    R_SIL.SetRange(R_SIL."Document No.", SIHWO."No.");
                    R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                    if R_SIL.Find('-') then begin
                        repeat
                            TaxableWO += R_SIL."Line Amount";
                            staxWO += R_SIL."Service Tax Amount";
                            staxsheWO += R_SIL."Service Tax SHE Cess Amount";
                            staxecessWO += R_SIL."Service Tax eCess Amount";
                        until
                          R_SIL.Next = 0;
                    end;
                    */
                    S_TAX1WO := staxWO + staxsheWO + staxecessWO;

                    S_TaxWO := 0;
                    if CurRateWO > 0 then
                        S_TaxWO := S_TAX1WO * CurRateWO
                    else
                        S_TaxWO := S_TAX1WO;

                    Reim_ExpWO := 0;
                    R_SIL1.SetRange(R_SIL1."Document No.", SIHWO."No.");
                    R_SIL1.SetFilter(R_SIL1.Description, 'REIMBURSABLE');
                    if R_SIL1.Find('-') then begin
                        repeat
                            if CurRateWO > 0 then
                                Reim_ExpWO += R_SIL1.Amount * CurRateWO
                            else
                                Reim_ExpWO += R_SIL1.Amount
                        until
                        R_SIL1.Next = 0;
                    end;

                    CustLedgEntry.Reset;
                    CustLedgEntry.SetRange(CustLedgEntry."Document No.", "No.");
                    if CustLedgEntry.FindFirst then
                        GroupHeadWO := CustLedgEntry."Group Heade";

                    Clear(GroupHeadNameWO);
                    if DimVal.Get('GROUPHEAD', GroupHeadWO) then
                        GroupHeadNameWO := DimVal.Name;
                end;

                trigger OnPreDataItem()
                begin
                    /*
                    IF (DateFilterNew <> 0D) AND (EndingDateNew <> 0D) THEN
                      SETRANGE("Posting Date",DateFilterNew,EndingDateNew);
                    IF (OwnerFilterNew <> '') AND (NOT Owner1BoolGlob) THEN
                      SETRANGE("Owner 2",OwnerFilterNew);
                    IF GroupFilterNew <> '' THEN
                      SETRANGE("Group Code",GroupFilterNew);
                    IF SubGroupFilterGlobal <> '' THEN
                      SETRANGE("Sub Group Code",SubGroupFilterGlobal);
                    IF (OwnerFilterNew <> '') AND (Owner1BoolGlob) THEN
                      SETRANGE("Owner 1",OwnerFilterNew);
                      */

                    SIHWO.SetRange("No.", "Cust. Ledger Entry"."Applied Document (Invoice)");

                end;
            }

            trigger OnAfterGetRecord()
            var
                AppliedCLE: Record "Cust. Ledger Entry";
            begin
                "Cust. Ledger Entry".CalcFields("Applied Document (Invoice)");
                AppliedCLE.Reset;
                AppliedCLE.SetRange("Document No.", "Cust. Ledger Entry"."Applied Document (Invoice)");
                if AppliedCLE.FindFirst then;

                AppliedCLE.CalcFields("Original Amount");
                CalcFields("Original Amount");
                //IF AppliedCLE."Original Amount" <> ABS("Cust. Ledger Entry"."Original Amount") THEN
                //CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS("Cust. Ledger Entry".Amount,Invoice_Amt,"Cust. Ledger Entry"."Amount (LCY)");
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
        OWNER1Writeoff: Code[30];
        OWNER2Writeoff: Code[30];
        GroupHeadNameWO: Code[50];
        CaseSolutionWO: Code[30];
        CaseAreaWO: Code[30];
        CasePracticeWO: Code[30];
        CaseProcessWO: Code[30];
        ContactnameWO: Text[50];
        CurrencyWO: Code[20];
        CurRateWO: Decimal;
        BILLAMTWO: Decimal;
        BILLAMTLCYWO: Decimal;
        Bill_DescWO: Text[500];
        Bill_Desc2WO: Text[500];
        TaxableWO: Decimal;
        staxWO: Decimal;
        staxsheWO: Decimal;
        staxecessWO: Decimal;
        S_TAX1WO: Decimal;
        S_TaxWO: Decimal;
        Reim_ExpWO: Decimal;
        GroupHeadWO: Code[20];
}

