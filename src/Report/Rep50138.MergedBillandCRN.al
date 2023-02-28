report 50138 "Merged Bill and CRN"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/MergedBillandCRN.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";
            column(Caseactivitytype; Caseactivitytype)
            {
            }
            column(Client_code; Client_code)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Sales_Invoice_Header__No__; "No.")
            {
            }
            column(Sales_Invoice_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Invoice_Header__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
            {
            }
            column(Sales_Invoice_Header__Shortcut_Dimension_2_Code_; "Shortcut Dimension 2 Code")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Sell_to_Customer_Name_; "Sales Invoice Header"."Sell-to Customer Name")
            {
            }
            column(Owner1; Owner1)
            {
            }
            column(Owner2; Owner2)
            {
            }
            column(Contactname; Contactname)
            {
            }
            column(Case_Process; CaseProcess)
            {
            }
            column(Case_Solution; CaseSolution)
            {
            }
            column(Cas_Area; CaseArea)
            {
            }
            column(Cas_Practice; CasePractice)
            {
            }
            column(Group_Head; GroupHead)
            {
            }
            column(GroupHeadName; GroupHeadName)
            {
            }
            column(SubGroupName; SubGroupName)
            {
            }
            column(Currency; Currency)
            {
            }
            column(BILLAMT; BILLAMT)
            {
            }
            column(BILLAMTLCY; BILLAMTLCY)
            {
            }
            column(Bill_Desc; Bill_Desc + ' ' + Bill_Desc2)
            {
            }
            column(BILLAMT_Control1000000026; BILLAMT)
            {
            }
            column(BILLAMTLCY_Control1000000027; BILLAMTLCY)
            {
            }
            column(BILLAMT_Control1000000023; BILLAMT)
            {
            }
            column(BILLAMTLCY_Control1000000024; BILLAMTLCY)
            {
            }
            column(Bill_No_Caption; Bill_No_CaptionLbl)
            {
            }
            column(Bill_DateCaption; Bill_DateCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Owner_1Caption; Owner_1CaptionLbl)
            {
            }
            column(Owner_2Caption; Owner_2CaptionLbl)
            {
            }
            column(Billing_Contact_NameCaption; Billing_Contact_NameCaptionLbl)
            {
            }
            column(Billing_DescriptionCaption; Billing_DescriptionCaptionLbl)
            {
            }
            column(Billing_CurrencyCaption; Billing_CurrencyCaptionLbl)
            {
            }
            column(Total_Amount__in_Billing_currency_Caption; Total_Amount__in_Billing_currency_CaptionLbl)
            {
            }
            column(Total_amount_in_INRCaption; Total_amount_in_INRCaptionLbl)
            {
            }
            column(STax; S_Tax)
            {
            }
            column(ReimExp; Reim_Exp)
            {
            }
            column(NetBillAmtSIH; (BILLAMTLCY - Reim_Exp - S_Tax))
            {
            }

            trigger OnAfterGetRecord()
            var
                I: Integer;
            begin
                /*
                rec_DimensionValue.RESET;
                rec_DimensionValue.SETRANGE("Dimension Code",'CASE');
                rec_DimensionValue.SETRANGE(Code,"Shortcut Dimension 2 Code");
                IF rec_DimensionValue.FINDFIRST THEN;
                */

                Owner1 := '';
                Owner2 := '';
                Clear(GroupHeadName);
                Clear(SubGroupName);
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
                            Owner1 := DimSetEntry."Dimension Value Code"
                        else
                            if I = 2 then
                                Owner2 := DimSetEntry."Dimension Value Code"
                            else
                                GroupHeadName := DimSetEntry."Dimension Value Name";
                end; //6700

                CaseSolution := '';
                CaseArea := '';
                CasePractice := '';
                CaseProcess := '';
                Caseactivitytype := '';
                Client_code := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Sales Invoice Header"."Shortcut Dimension 2 Code");
                if DimVal.Find('-') then begin
                    //Owner1:=DimVal."Case-Owner1"; Blocked (Picked straight from Dim set Entry above)
                    //Owner2:=DimVal."Case-Owner2";
                    CaseSolution := DimVal."Case-Solution";
                    CaseArea := DimVal."Case-Area";
                    CasePractice := DimVal."Case-Practice";
                    CaseProcess := DimVal."Case-Process";
                    Caseactivitytype := DimVal."Case-Activity Type";
                    Client_code := DimVal."Case-Client ID";
                end;

                //Contactname:='';
                Cont.Reset;
                Cont.SetRange(Cont."No.", "Bill-to Contact No.");
                if Cont.Find('-') then begin
                    Contactname := Cont."F Name" + Cont."M Name" + Cont."L Name";
                end;

                if "Sales Invoice Header"."Currency Code" = '' then
                    Currency := 'INR'
                else
                    Currency := "Sales Invoice Header"."Currency Code";

                CurRate := 0;
                CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                CurrExchangerate.SetRange(CurrExchangerate."Starting Date", "Posting Date");
                if CurrExchangerate.Find('+') then begin
                    CurRate := CurrExchangerate."Relational Exch. Rate Amount";
                end;

                BILLAMT := 0;
                //TBD
                /*
                SIL.SetRange(SIL."Document No.", "No.");
                if SIL.Find('-') then begin
                    repeat
                        BILLAMT += SIL."Amount To Customer";
                    until
                    SIL.Next = 0;
                end;
                */

                BILLAMTLCY := 0;
                if CurRate > 0 then
                    BILLAMTLCY := BILLAMT * CurRate
                else
                    BILLAMTLCY := BILLAMT;

                SIL.Reset;
                SIL.SetRange(SIL."Document No.", "Sales Invoice Header"."No.");
                if SIL.Find('-') then
                    Bill_Desc := SIL."Other Detail 1";
                Bill_Desc2 := SIL."Other Detail 2";

                //   MESSAGE(Bill_Desc);  \

                Taxable := 0;
                stax := 0;
                staxshe := 0;
                staxecess := 0;
                R_SIL.SetRange(R_SIL."Document No.", "Sales Invoice Header"."No.");
                //TBD //R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                if R_SIL.Find('-') then begin
                    repeat
                        Taxable += R_SIL."Line Amount";
                    //TBD
                    /*
                    stax += R_SIL."Service Tax Amount";
                    staxshe += R_SIL."Service Tax SHE Cess Amount";
                    staxecess += R_SIL."Service Tax eCess Amount";
                    */
                    until
                      R_SIL.Next = 0;
                end;
                S_TAX1 := stax + staxshe + staxecess;

                S_Tax := 0;
                if CurRate > 0 then
                    S_Tax := S_TAX1 * CurRate
                else
                    S_Tax := S_TAX1;

                Reim_Exp := 0;
                R_SIL1.SetRange(R_SIL1."Document No.", "Sales Invoice Header"."No.");
                R_SIL1.SetFilter(R_SIL1.Description, 'REIMBURSABLE');
                if R_SIL1.Find('-') then begin
                    repeat
                        if CurRate > 0 then
                            Reim_Exp += R_SIL1.Amount * CurRate
                        else
                            Reim_Exp += R_SIL1.Amount
                    until
                    R_SIL1.Next = 0;
                end;
                Clear(SubGroupCode);

                CustLedgEntry.Reset;
                CustLedgEntry.SetRange(CustLedgEntry."Document No.", "No.");
                if CustLedgEntry.FindFirst then begin
                    GroupHead := CustLedgEntry."Group Heade";
                    SubGroupCode := CustLedgEntry."Sub Group Owner 2";
                end;

                Clear(GroupHeadName);
                if DimVal.Get('GROUPHEAD', GroupHead) then
                    GroupHeadName := DimVal.Name;

                if DimVal.Get('SUBGRP-OWNER2', SubGroupCode) then
                    SubGroupName := DimVal.Name;

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(BILLAMTLCY, BILLAMT);

                if (DateFilterNew <> 0D) and (EndingDateNew <> 0D) then
                    SetRange("Posting Date", DateFilterNew, EndingDateNew);
                if (OwnerFilterNew <> '') and (not Owner1BoolGlob) then
                    SetRange("Owner 2", OwnerFilterNew);
                if GroupFilterNew <> '' then
                    SetRange("Group Code", GroupFilterNew);
                if SubGroupFilterGlobal <> '' then
                    SetRange("Sub Group Code", SubGroupFilterGlobal);
                if (OwnerFilterNew <> '') and (Owner1BoolGlob) then
                    SetRange("Owner 1", OwnerFilterNew);
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("Shortcut Dimension 1 Code") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(Compinfo_Picture; Compinfo2.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Sales_Cr_Memo_Header__No__; "No.")
            {
            }
            column(Sales_Cr_Memo_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Cr_Memo_Header__Applies_to_Doc__No__; "Applies-to Doc. No.")
            {
            }
            column(Clientname2; Clientname2)
            {
            }
            column(INVDATE2; INVDATE2)
            {
            }
            column(INVBR2; INVBR2)
            {
            }
            column(INVcase2; INVcase2)
            {
            }
            column(Owner_1; Owner_1)
            {
            }
            column(Owner_2; Owner_2)
            {
            }
            column(Owner1_Control1000000018; Owner_1)
            {
            }
            column(Contact_name2; Contactname2)
            {
            }
            column(Group_Head2; GroupHead2)
            {
            }
            column(SubGroupName2; SubGroupName2)
            {
            }
            column(Case_Process2; CaseProcess2)
            {
            }
            column(Case_Solution2; CaseSolution2)
            {
            }
            column(Case_Area2; CaseArea2)
            {
            }
            column(Case_Practice2; CasePractice2)
            {
            }
            column(Caseactivitytype2; Caseactivitytype2)
            {
            }
            column(Client_code2; Client_code2)
            {
            }
            column(Inv_Amt_Billi_Curr2; -Inv_Amt_Billi_Curr2)
            {
            }
            column(Inv_Amt_Billi_Curr2Pos; Inv_Amt_Billi_Curr2)
            {
            }
            column(Reimbursableinc2; -Reimbursableinc2)
            {
            }
            column(Reimbursableinc2Pos; Reimbursableinc2)
            {
            }
            column(ProfessionalFee2; ProfessionalFee2)
            {
            }
            column(S_Tax2; -S_Tax2)
            {
            }
            column(INVAMT2; INVAMT2)
            {
            }
            column(S_Tax2Pos; S_Tax2)
            {
            }
            column(INVAMT2Pos; INVAMT2)
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Currency_Code_; CrrCodeCM)
            {
            }
            column(Sales_Cr_Memo_Header__Bill_Description_; "Bill Description")
            {
            }
            column(INVAMT_Control10000000002; INVAMT2)
            {
            }
            column(Reimbursableinc_Control10000000012; Reimbursableinc2)
            {
            }
            column(ProfessionalFee_Control10000000032; ProfessionalFee2)
            {
            }
            column(S_Tax_Control10000000052; S_Tax2)
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Location_Code_; "Sales Cr.Memo Header"."Location Code")
            {
            }
            column(INVAMT_Control10000000402; INVAMT2)
            {
            }
            column(S_Tax_Control10000000382; S_Tax2)
            {
            }
            column(ProfessionalFee_Control10000000392; ProfessionalFee2)
            {
            }
            column(Reimbursableinc_Control10000000412; Reimbursableinc2)
            {
            }
            column(Sales_Cr_Memo_Header_Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(AppliedOwner1; AppliedOwner1)
            {
            }
            column(AppliedOwner2; AppliedOwner2)
            {
            }
            column(NetCrMemoAmt; (INVAMT2 - Reimbursableinc2 - S_Tax2))
            {
            }
            column(GroupHeadName2; GroupHeadName2)
            {
            }

            trigger OnAfterGetRecord()
            var
                I: Integer;
                CLE: Record "Cust. Ledger Entry";
                CurRateNew: Decimal;
                SIHNew: Record "Sales Invoice Header";
            begin
                Clear(CrrCodeCM);
                if "Sales Cr.Memo Header"."Currency Code" = '' then
                    CrrCodeCM := 'INR'
                else
                    CrrCodeCM := "Sales Cr.Memo Header"."Currency Code";

                SIH2.SetRange(SIH2."No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIH2.Find('-') then begin
                    INVDATE2 := SIH2."Posting Date";
                    INVBR2 := SIH2."Shortcut Dimension 1 Code";
                    INVcase2 := SIH2."Shortcut Dimension 2 Code";
                    Clientname2 := SIH2."Sell-to Customer Name";
                    Clear(AppliedOwner1);
                    Clear(AppliedOwner2);
                    for I := 1 to 2 do begin //6700 For applied owner1 and 2
                        DimSetEntry.Reset;
                        DimSetEntry.SetRange("Dimension Set ID", SIH2."Dimension Set ID");
                        if I = 1 then
                            DimSetEntry.SetRange("Dimension Code", 'OWNER1')
                        else
                            if I = 2 then
                                DimSetEntry.SetRange("Dimension Code", 'OWNER2');

                        if DimSetEntry.FindFirst then
                            if I = 1 then
                                AppliedOwner1 := DimSetEntry."Dimension Value Code"
                            else
                                if I = 2 then
                                    AppliedOwner2 := DimSetEntry."Dimension Value Code";

                    end; //6700
                end;

                Owner_1 := '';
                Owner_2 := '';
                GroupHeadName2 := '';
                SubGroupName2 := '';
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
                            Owner_1 := DimSetEntry."Dimension Value Code"
                        else
                            if I = 2 then
                                Owner_2 := DimSetEntry."Dimension Value Code"
                            else
                                GroupHeadName2 := DimSetEntry."Dimension Value Name"
                end; //6700

                Caseactivitytype2 := '';
                Client_code2 := '';
                DimVal2.SetRange(DimVal2."Dimension Code", 'CASE');
                DimVal2.SetRange(DimVal2.Code, INVcase2);
                if DimVal2.Find('-') then begin
                    //Owner_1:=DimVal2."Case-Owner1"; //6700 Blocked (Picked straight from Dim set Entry above)
                    //Owner_2:=DimVal2."Case-Owner2";

                    CaseProcess2 := DimVal2."Case-Process";
                    CaseSolution2 := DimVal2."Case-Solution";
                    CaseArea2 := DimVal2."Case-Area";
                    CasePractice2 := DimVal2."Case-Practice";
                    Caseactivitytype2 := DimVal2."Case-Activity Type";
                    Client_code2 := DimVal2."Case-Client ID";
                end;

                CurRate2 := 0;
                CurrExchangerate2.SetRange(CurrExchangerate2."Currency Code", "Currency Code");
                CurrExchangerate2.SetRange(CurrExchangerate2."Starting Date", "Posting Date");
                if CurrExchangerate2.Find('+') then begin
                    CurRate2 := CurrExchangerate2."Relational Exch. Rate Amount";
                end;


                INVAMT2 := 0;
                INVDesc2 := '';
                //TBD
                /*
                SIL2.SetRange(SIL2."Document No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIL2.Find('-') then begin
                    repeat
                        if CurRate2 > 0 then
                            INVAMT2 += SIL2."Amount To Customer" * CurRate2
                        else
                            INVAMT2 += SIL2."Amount To Customer"
                     until
                     SIL2.Next = 0;
                end;
                */
                CLE.Reset;
                CLE.SetRange("Document No.", "Sales Cr.Memo Header"."No.");
                if CLE.FindFirst then begin
                    CLE.CalcFields("Amount (LCY)");
                    INVAMT2 := CLE."Amount (LCY)";
                end;
                //message('%1',INVAMT);

                Inv_Amt_Billi_Curr2 := 0;
                //TBD
                /*
                SIL2.SetRange(SIL2."Document No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIL2.Find('-') then begin
                    repeat
                        Inv_Amt_Billi_Curr2 += SIL2."Amount To Customer";
                    until
                   SIL2.Next = 0;
                end;
                */


                Taxable2 := 0;
                stax2 := 0;
                staxshe2 := 0;
                staxecess2 := 0;
                R_SIL2.Reset;
                //TBD
                /*
                R_SIL2.SetRange(R_SIL2."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL2.SetFilter(R_SIL2."Service Tax Group", 'LEGAL');
                if R_SIL2.Find('-') then begin
                    repeat
                        stax2 += R_SIL2."Service Tax Amount";
                        staxshe2 += R_SIL2."Service Tax SHE Cess Amount";
                        staxecess2 += R_SIL2."Service Tax eCess Amount";
                    until
                      R_SIL2.Next = 0

                end;
                */
                ServiceTax2 := stax2 + staxshe2 + staxecess2;

                if CurRate2 > 0 then
                    S_Tax2 := ServiceTax2 * CurRate2
                else
                    S_Tax2 := ServiceTax2;

                ProfessionalFee2 := 0;
                R_SIL12.SetRange(R_SIL12."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL12.SetFilter(R_SIL12.Description, 'PROFESSIONAL');
                if R_SIL12.Find('-') then begin
                    repeat
                        if CurRate2 > 0 then
                            ProfessionalFee2 += R_SIL12."Line Amount" * CurRate2
                        else
                            ProfessionalFee2 += R_SIL12."Line Amount"
                    until
                    R_SIL12.Next = 0;
                end;

                if SIHNew.Get("Sales Cr.Memo Header"."Applies-to Doc. No.") then;
                CurRateNew := 0;
                CurrExchangerateNew.SetRange(CurrExchangerateNew."Currency Code", "Currency Code");
                CurrExchangerateNew.SetRange(CurrExchangerateNew."Starting Date", SIHNew."Posting Date");
                if CurrExchangerateNew.Find('+') then begin
                    CurRateNew := CurrExchangerateNew."Relational Exch. Rate Amount";
                end;

                Reimbursableinc2 := 0;
                R_SIL22.SetRange(R_SIL22."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL22.SetFilter(R_SIL22.Description, '<>PROFESSIONAL');
                if R_SIL22.Find('-') then begin
                    repeat
                        if CurRate2 > 0 then
                            Reimbursableinc2 += R_SIL22."Line Amount" * CurRateNew
                        else
                            Reimbursableinc2 += R_SIL22."Line Amount"
                    until
                    R_SIL22.Next = 0
                end;

                //Contactname:='';
                Cont2.Reset;
                Cont2.SetRange(Cont2."No.", "Bill-to Contact No.");
                if Cont2.Find('-') then begin
                    Contactname2 := Cont2."F Name" + Cont2."M Name" + Cont2."L Name";
                    //   message(Contactname);
                end;

                Clear(SubGroupCode2);

                CustLedger2.Reset;
                CustLedger2.SetRange(CustLedger2."Document No.", "Sales Cr.Memo Header"."No.");
                if CustLedger2.FindFirst then begin
                    GroupHead2 := CustLedger2."Group Heade";
                    SubGroupCode2 := CustLedger2."Sub Group Owner 2";
                end;

                if GroupHeadName2 = '' then
                    if DimVal.Get('GROUPHEAD', GroupHead2) then
                        GroupHeadName2 := DimVal.Name;

                if DimVal.Get('SUBGRP-OWNER2', SubGroupCode2) then
                    SubGroupName2 := DimVal.Name;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(INVAMT2, ServiceTax2, ProfessionalFee2, Reimbursableinc2, S_Tax2);

                if (DateFilterNew <> 0D) and (EndingDateNew <> 0D) then
                    SetRange("Posting Date", DateFilterNew, EndingDateNew);
                if (OwnerFilterNew <> '') and (not Owner1BoolGlob) then
                    SetRange("Owner 2", OwnerFilterNew);
                if GroupFilterNew <> '' then
                    SetRange("Group Code", GroupFilterNew);
                if SubGroupFilterGlobal <> '' then
                    SetRange("Sub Group Code", SubGroupFilterGlobal);
                if (OwnerFilterNew <> '') and (Owner1BoolGlob) then
                    SetRange("Owner 1", OwnerFilterNew);
            end;
        }
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
                column(SubGroupNameWO; SubGroupNameWO)
                {
                }
                column(CurrencyWO; CurrencyWO)
                {
                }
                column(BILLAMTWO; -BILLAMTWO)
                {
                }
                column(BILLAMTLCYWO; -BILLAMTLCYWO)
                {
                }
                column(Bill_DescWO; Bill_DescWO + ' ' + Bill_Desc2WO)
                {
                }
                column(BILLAMT_Control1000000026WO; -BILLAMTWO)
                {
                }
                column(BILLAMTLCY_Control1000000027WO; -BILLAMTLCYWO)
                {
                }
                column(BILLAMT_Control1000000023WO; -BILLAMTWO)
                {
                }
                column(BILLAMTLCY_Control1000000024WO; -BILLAMTLCYWO)
                {
                }
                column(STaxWO; -S_TaxWO)
                {
                }
                column(ReimExpWO; -Reim_ExpWO)
                {
                }
                column(NetBillAmtSIHWO; ((-BILLAMTLCYWO) - (-Reim_ExpWO) - (-S_TaxWO)))
                {
                }
                column(SihWoDate; SihWoDate)
                {
                }
                column(CaseactivitytypeWO; CaseactivitytypeWO)
                {
                }
                column(Client_codeWO; Client_codeWO)
                {
                }

                trigger OnAfterGetRecord()
                var
                    I: Integer;
                begin
                    OWNER1Writeoff := '';
                    OWNER2Writeoff := '';
                    Clear(GroupHeadNameWO);
                    Clear(SubGroupNameWO);
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
                                    GroupHeadNameWO := DimSetEntry."Dimension Value Name"


                    end; //6700

                    CaseSolutionWO := '';
                    CaseAreaWO := '';
                    CasePracticeWO := '';
                    CaseProcessWO := '';
                    CaseactivitytypeWO := '';
                    Client_codeWO := '';
                    DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                    DimVal.SetRange(DimVal.Code, SIHWO."Shortcut Dimension 2 Code");
                    if DimVal.Find('-') then begin
                        //Owner1:=DimVal."Case-Owner1"; Blocked (Picked straight from Dim set Entry above)
                        //Owner2:=DimVal."Case-Owner2";
                        CaseSolutionWO := DimVal."Case-Solution";
                        CaseAreaWO := DimVal."Case-Area";
                        CasePracticeWO := DimVal."Case-Practice";
                        CaseProcessWO := DimVal."Case-Process";
                        CaseactivitytypeWO := DimVal."Case-Activity Type";
                        Client_codeWO := DimVal."Case-Client ID";
                    end;

                    ContactnameWO := '';
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
                    //IF SIHWO."No." = 'LKS16-1718-00005' THEN
                    //  MESSAGE('%1  %2',CurRateWO,BILLAMTWO);
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
                    R_SIL.SetRange(R_SIL."Document No.", SIHWO."No.");
                    //TBD //R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                    if R_SIL.Find('-') then begin
                        repeat
                            TaxableWO += R_SIL."Line Amount";
                        //TBD 
                        /*
                        staxWO += R_SIL."Service Tax Amount";
                        staxsheWO += R_SIL."Service Tax SHE Cess Amount";
                        staxecessWO += R_SIL."Service Tax eCess Amount";
                        */
                        until
                          R_SIL.Next = 0;
                    end;
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
                    Clear(SubGroupCodeWO);
                    CustLedgEntry.Reset;
                    CustLedgEntry.SetRange(CustLedgEntry."Document No.", "No.");
                    if CustLedgEntry.FindFirst then begin
                        GroupHeadWO := CustLedgEntry."Group Heade";
                        SubGroupCodeWO := CustLedgEntry."Sub Group Owner 2";
                    end;

                    Clear(GroupHeadNameWO);
                    if DimVal.Get('GROUPHEAD', GroupHeadWO) then
                        GroupHeadNameWO := DimVal.Name;

                    if DimVal.Get('SUBGRP-OWNER2', SubGroupCodeWO) then
                        SubGroupNameWO := DimVal.Name;

                    //CLEAR(SihWoDate);
                    //IF SIHRec.GET(SIHWO."Applies-to Doc. No.") THEN
                    //SihWoDate := SIHRec."Posting Date";

                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(BILLAMTLCY, BILLAMT);

                    if (DateFilterNew <> 0D) and (EndingDateNew <> 0D) then
                        SetRange("Posting Date", DateFilterNew, EndingDateNew);
                    if (OwnerFilterNew <> '') and (not Owner1BoolGlob) then
                        SetRange("Owner 2", OwnerFilterNew);
                    if GroupFilterNew <> '' then
                        SetRange("Group Code", GroupFilterNew);
                    if SubGroupFilterGlobal <> '' then
                        SetRange("Sub Group Code", SubGroupFilterGlobal);
                    if (OwnerFilterNew <> '') and (Owner1BoolGlob) then
                        SetRange("Owner 1", OwnerFilterNew);

                    SIHWO.SetRange("No.", "Cust. Ledger Entry"."Applied Document (Invoice)");
                end;
            }

            trigger OnAfterGetRecord()
            var
                AppliedCLE: Record "Cust. Ledger Entry";
            begin
                Clear(SihWoDate);
                "Cust. Ledger Entry".CalcFields("Applied Document (Invoice)");
                AppliedCLE.Reset;
                AppliedCLE.SetRange("Document No.", "Cust. Ledger Entry"."Applied Document (Invoice)");
                if AppliedCLE.FindFirst then begin
                    SihWoDate := AppliedCLE."Posting Date";
                end;

                AppliedCLE.CalcFields("Original Amount");
                CalcFields("Original Amount");
                if Abs(AppliedCLE."Original Amount") <> Abs("Cust. Ledger Entry"."Original Amount") then
                    CurrReport.Skip;




                //IF SIHRec.GET("Cust. Ledger Entry"."Applied Document (Invoice)") THEN
                //SihWoDate := SIHRec."Posting Date";
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

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Owner1: Text[60];
        Owner2: Text[60];
        DimVal: Record "Dimension Value";
        Cont: Record Contact;
        Contactname: Text[200];
        SIH: Record "Sales Invoice Header";
        CurrExchangerate: Record "Currency Exchange Rate";
        SIL: Record "Sales Invoice Line";
        BILLAMT: Decimal;
        BILLAMTLCY: Decimal;
        CurRate: Decimal;
        CustLedgEntry: Record "Cust. Ledger Entry";
        AmountLCY: Decimal;
        CompanyInfo: Record "Company Information";
        Bill_Desc: Text[500];
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Compinfo: Record "Company Information";
        Bill_Desc2: Text[250];
        Currency: Code[10];
        Bill_No_CaptionLbl: Label 'Bill No.';
        Bill_DateCaptionLbl: Label 'Bill Date';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Client_NameCaptionLbl: Label 'Client Name';
        Owner_1CaptionLbl: Label 'Owner 1';
        Owner_2CaptionLbl: Label 'Owner 2';
        Billing_Contact_NameCaptionLbl: Label 'Billing Contact Name';
        Billing_DescriptionCaptionLbl: Label 'Billing Description';
        Billing_CurrencyCaptionLbl: Label 'Billing Currency';
        Total_Amount__in_Billing_currency_CaptionLbl: Label 'Total Amount (in Billing currency)';
        Total_amount_in_INRCaptionLbl: Label 'Total amount in INR';
        Reim_Exp: Decimal;
        S_TAX1: Decimal;
        Taxable: Decimal;
        stax: Decimal;
        staxshe: Decimal;
        staxecess: Decimal;
        R_SIL: Record "Sales Invoice Line";
        R_SIL1: Record "Sales Invoice Line";
        R_SIL2: Record "Sales Invoice Line";
        S_Tax: Decimal;
        CaseProcess: Text[50];
        CaseSolution: Text[50];
        CaseArea: Text[50];
        CasePractice: Text[50];
        GroupHead: Code[10];
        INVDesc2: Text[200];
        INVAMT2: Decimal;
        INVDATE2: Date;
        INVBR2: Code[20];
        INVcase2: Code[20];
        Clientname2: Text[100];
        SIH2: Record "Sales Invoice Header";
        SIL2: Record "Sales Invoice Line";
        Owner_1: Text[60];
        Owner_2: Text[60];
        R_SIL22: Record "Sales Cr.Memo Line";
        DimVal2: Record "Dimension Value";
        Compinfo2: Record "Company Information";
        ProfessionalFee2: Decimal;
        Reimbursableinc2: Decimal;
        ServiceTax2: Decimal;
        Taxable2: Decimal;
        stax2: Decimal;
        staxshe2: Decimal;
        staxecess2: Decimal;
        STAXTOTAL2: Decimal;
        CurRate2: Decimal;
        CurrExchangerate2: Record "Currency Exchange Rate";
        CurrExchangerateNew: Record "Currency Exchange Rate";
        Inv_Amt_Billi_Curr2: Decimal;
        S_Tax2: Decimal;
        ExcelBuf2: Record "Excel Buffer" temporary;
        PrintToExcel2: Boolean;
        R_SIL12: Record "Sales Cr.Memo Line";
        Number2: Integer;
        PrintDetail2: Boolean;
        CaseProcess2: Text[50];
        CaseSolution2: Text[50];
        CaseArea2: Text[50];
        CasePractice2: Text[50];
        Contactname2: Text[100];
        Cont2: Record Contact;
        GroupHead2: Code[10];
        CustLedger2: Record "Cust. Ledger Entry";
        AppliedOwner1: Text[50];
        AppliedOwner2: Text[50];
        DimSetEntry: Record "Dimension Set Entry";
        CrrCodeCM: Code[30];
        GroupHeadName: Text[50];
        GroupHeadName2: Text[50];
        DateFilterNew: Date;
        EndingDateNew: Date;
        OwnerFilterNew: Code[30];
        GroupFilterNew: Code[30];
        SubGroupFilterGlobal: Code[20];
        Owner1BoolGlob: Boolean;
        MemoNo: Code[20];
        Cust_Led_Entry: Record "Cust. Ledger Entry";
        Client_Name: Text[100];
        Cust: Record Customer;
        Memo_Date: Date;
        Branch_Code: Code[20];
        Case_ID: Code[10];
        Invoice_Amt: Decimal;
        Cheque_No: Code[50];
        Cheque_Date: Date;
        Cheque_Amt: Decimal;
        TDS: Decimal;
        Gross_Amt: Decimal;
        Narration: Text[100];
        Company_Info: Record "Company Information";
        Posted_Narration: Record "Posted Narration";
        OWNER1Writeoff: Code[30];
        OWNER2Writeoff: Code[30];
        GroupHeadNameWO: Text[50];
        CaseSolutionWO: Code[50];
        CaseAreaWO: Code[30];
        CasePracticeWO: Code[30];
        CaseProcessWO: Code[30];
        ContactnameWO: Code[30];
        CurrencyWO: Code[30];
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
        SubGroupName: Text[50];
        SubGroupName2: Text[50];
        SubGroupNameWO: Text[50];
        SubGroupCode: Code[30];
        SubGroupCode2: Code[30];
        SubGroupCodeWO: Code[30];
        SIHRec: Record "Sales Invoice Header";
        SihWoDate: Date;
        rec_DimensionValue: Record "Dimension Value";
        Caseactivitytype: Text[50];
        Client_code: Text[50];
        CaseactivitytypeWO: Text[50];
        Client_codeWO: Text[50];
        Caseactivitytype2: Text[50];
        Client_code2: Text[50];


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(Compinfo.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Report',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('Bill_Memo Issued',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Bill No',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Bill Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Case ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Contact Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Description ',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Description2 ',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Billing Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount(Billing Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Total Amount (INR)',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('Bill_Memo Issued','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
         */

    end;


    procedure SIH1()
    begin
    end;


    procedure SIB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Invoice Header"."No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Shortcut Dimension 1 Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Shortcut Dimension 2 Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer Name",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner2,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Contactname,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bill_Desc,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Bill_Desc2,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Currency,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMTLCY,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure SIT()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMTLCY,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SIF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BILLAMTLCY,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure Setfilters(DateFilter: Date; EndingDate: Date; OwnerFilter: Code[30]; GroupFilter: Code[30]; SubGroupFilter: Code[20])
    begin
        DateFilterNew := DateFilter;
        EndingDateNew := EndingDate;
        OwnerFilterNew := OwnerFilter;
        GroupFilterNew := GroupFilter;
        SubGroupFilterGlobal := SubGroupFilter;
    end;


    procedure SetFilters2(Owner1Bool: Boolean)
    begin
        Owner1BoolGlob := Owner1Bool;
    end;
}

