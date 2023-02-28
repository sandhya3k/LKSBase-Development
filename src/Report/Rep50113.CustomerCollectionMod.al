report 50113 "Customer Collection Mod"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustomerCollectionMod.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Entry No.") ORDER(Ascending) WHERE("Document Type" = FILTER(Payment | Refund | " "), Reversed = FILTER(false), "Amount (LCY)" = FILTER(< 0), "Document No." = FILTER(<> '@JVWO*' & <> '@BC*'), "Applied Document (Invoice)" = FILTER(<> '@JV*' & <> '@BC*' & <> '@BP*'), "Applied Document" = FILTER(<> '@JVPI*' & <> '@BC*'), "Journal Batch Name" = FILTER(<> '@BOUNCE*'));
            RequestFilterFields = "Posting Date", "Document Date", "Customer No.";
            column(ServiceTaxAmt; -ServiceTaxAmt)
            {
            }
            column(NetCollINR; (-Amount1) - Reim_Exp - (-ServiceTaxAmt))
            {
            }
            column(Cust__Ledger_Entry__Document_No__; "Document No.")
            {
            }
            column(Amount1; -Amount1)
            {
            }
            column(Client_Name; Client_Name)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Document_Date_; "Cust. Ledger Entry"."Document Date")
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(IncomeHead; IncomeHead)
            {
            }
            column(Case_Id; Caseid)
            {
            }
            column(BranchCode; BranchCode)
            {
            }
            column(Location_Code; Location_Code)
            {
            }
            column(Docno; Docno)
            {
            }
            column(Memo_Date; Memo_Date)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Closed_at_Date_; "Cust. Ledger Entry"."Closed at Date")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_No__; "Cust. Ledger Entry"."Cheque No.")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_Date_; "Cust. Ledger Entry"."Cheque Date")
            {
            }
            column(Curr; Curr)
            {
            }
            column(Curr_Rate; Curr_Rate)
            {
            }
            column(Reimble_Exp; Reim_Exp)
            {
            }
            column(Amt2; Abs(Amt2))
            {
            }
            column(Amount1_Control1000000023; Amount1)
            {
            }
            column(Amt2_Control1000000036; Amt2)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Document_DateCaption; Document_DateCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Income_HeadCaption; Income_HeadCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Memo_NoCaption; Memo_NoCaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Applied_DateCaption; Applied_DateCaptionLbl)
            {
            }
            column(Check_No_Caption; Check_No_CaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(Curr_Caption; Curr_CaptionLbl)
            {
            }
            column(Curr__RateCaption; Curr__RateCaptionLbl)
            {
            }
            column(Gross_AmountCaption; Gross_AmountCaptionLbl)
            {
            }
            column(Gross_Local_currency_i_e_INR_Caption; Gross_Local_currency_i_e_INR_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Location_codeCaption; Location_codeCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Cust__Ledger_Entry_Amount__LCY_; -"Amount (LCY)")
            {
            }
            column(Cust__Ledger_Entry_Amount; Amount)
            {
            }
            column(Owner_1; OWNER1)
            {
            }
            column(Owner_2; "Cust. Ledger Entry".OWNER2)
            {
            }
            column(Case_Practice; CasePractice)
            {
            }
            column(Case_Area; CaseArea)
            {
            }
            column(Cas_Process; CaseProcess)
            {
            }
            column(Case_Solution; CaseSolution)
            {
            }

            trigger OnAfterGetRecord()
            var
                SIH: Record "Sales Invoice Header";
                DimSetEntry: Record "Dimension Set Entry";
                Dim_Value: Record "Dimension Value";
            begin
                Clear(SubGroupName);
                if not Owner1GlobalBoo then begin
                    Dim_Value.Reset;
                    Dim_Value.SetRange("Dimension Code", 'OWNER2');
                    Dim_Value.SetRange(Code, "Cust. Ledger Entry".OWNER2);
                    if Dim_Value.FindFirst then
                        if Dim_Value."Owner 2 Exception" then
                            if "Cust. Ledger Entry".OWNER1 = "Cust. Ledger Entry".OWNER2 then
                                CurrReport.Skip;
                end;

                I += 1;
                if I = 1 then
                    //  MESSAGE(FORMAT("Cust. Ledger Entry".COUNT));


                    OWNER1 := '';
                OWNER2 := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if DimVal.Find('-') then begin
                    OWNER1 := DimVal."Case-Owner1";
                    OWNER2 := DimVal."Case-Owner2";
                    //   MESSAGE(Owner1);
                end;


                /*
                Owner1 :='';
                Owner2 :='';
                DimVal.SETRANGE(DimVal."Dimension Code",'CASE');
                DimVal.SETRANGE(DimVal.Code,"Cust. Ledger Entry"."Global Dimension 2 Code");
                IF DimVal.FIND('-') THEN BEGIN
                   Owner1:=DimVal."Case-Owner1";
                   Owner2:=DimVal."Case-Owner2";
                //   MESSAGE(Owner1);
                END ;
                */

                Client_Name := '';
                Cust.Reset;
                Cust.SetFilter(Cust."No.", "Cust. Ledger Entry"."Customer No.");
                if Cust.Find('-') then
                    Client_Name := Cust."Client Name";

                BranchCode := '';
                Dim.Reset;
                Dim.SetFilter(Dim."Dimension Code", 'BRANCH');
                Dim.SetRange(Dim.Code, "Global Dimension 1 Code");
                if Dim.FindFirst then
                    BranchCode := Dim.Name;
                // MESSAGE(BranchCode);


                Location_Code := '';

                //TBD
                /*
                GL_Entry.Reset;
                GL_Entry.SetRange(GL_Entry."Entry No.", "Entry No.");
                if GL_Entry.Find('-') then
                    Location_Code := GL_Entry."Location Code";
                */

                IncomeHead := '';
                CustPosting.Reset;
                CustPosting.SetRange(CustPosting.Code, "Customer Posting Group");
                if CustPosting.Find('-') then
                    GL_Acc.SetFilter(GL_Acc."No.", CustPosting."Receivables Account");
                if GL_Acc.FindFirst then
                    IncomeHead := GL_Acc.Name;

                /*
                Reim_Exp :=0;
                R_SIL1.SETRANGE(R_SIL1."Document No.",Docno);
                R_SIL1.SETFILTER(R_SIL1.Description,'REIMBURSABLE');
                IF R_SIL1.FINDFIRST THEN BEGIN
                     REPEAT
                      Reim_Exp+=R_SIL1.Amount;
                      UNTIL
                      R_SIL1.NEXT = 0;
                         MESSAGE('%1..%2',Reim_Exp,Docno);
                END;
                */
                /*
                GL_Entry1.RESET;
                GL_Entry1.SETRANGE(GL_Entry1."Document No.","Cust. Ledger Entry"."Document No.");
                GL_Entry1.SETRANGE(GL_Entry1."Global Dimension 2 Code","Cust. Ledger Entry"."Global Dimension 2 Code");
                GL_Entry1.SETRANGE(GL_Entry1."Entry No.","Cust. Ledger Entry"."Entry No.");
                IF GL_Entry1.FIND('-') THEN
                   GL_Acc.SETFILTER(GL_Acc."No.",GL_Entry1."G/L Account No.");
                   IF GL_Acc.FINDFIRST THEN
                      IncomeHead :=GL_Acc.Name;
                */

                if "Cust. Ledger Entry"."Currency Code" = '' then
                    Curr := 'INR'
                else
                    Curr := "Cust. Ledger Entry"."Currency Code";

                Curr_Rate := 0;
                CLE.Reset;
                CLE.SetRange(CLE."Document No.", "Document No.");
                if CLE.Find('-') then
                    Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Currency Code", CLE."Currency Code");
                Curr_Exch_Rate.SetRange(Curr_Exch_Rate."Starting Date", CLE."Posting Date");
                if Curr_Exch_Rate.Find('+') then
                    Curr_Rate := Curr_Exch_Rate."Relational Exch. Rate Amount";

                Caseid := '';
                Docno := '';
                Memo_Date := 0D;
                Gross_Amt_FC := 0;
                //Amt2 :=0;
                V_CLE.Reset;
                V_CLE.SetRange(V_CLE."Entry No.", "Cust. Ledger Entry"."Closed by Entry No.");
                V_CLE.SetFilter(V_CLE."Document Type", 'Invoice');
                V_CLE.SetFilter(V_CLE."Document No.", '<>JV@*');
                if V_CLE.Find('-') then begin
                    V_CLE.CalcFields(V_CLE.Amount);
                    //   Amt2 := V_CLE.Amount;
                    Docno := V_CLE."Document No.";
                    //  MESSAGE('%1',Amt2);
                    Memo_Date := V_CLE."Posting Date";
                    Caseid := V_CLE."Global Dimension 2 Code";
                    // MESSAGE('%1',Caseid)
                end
                else
                    Docno := '';
                V_CLE.Reset;
                V_CLE.SetRange(V_CLE."Closed by Entry No.", "Cust. Ledger Entry"."Entry No.");
                V_CLE.SetFilter(V_CLE."Document Type", 'Invoice');
                V_CLE.SetFilter(V_CLE."Document No.", '<>JV@*');
                if V_CLE.Find('-') then begin
                    //   V_CLE.CALCFIELDS(V_CLE.Amount);
                    // Amt2 := V_CLE.Amount;
                    Docno := V_CLE."Document No.";
                    //   MESSAGE('%1',Amt2);
                    Memo_Date := V_CLE."Posting Date";
                    Caseid := V_CLE."Global Dimension 2 Code";
                    //   MESSAGE('%1',Caseid);
                    //   Amt2 := V_CLE.Amount;
                end
                else
                    V_CLE.Reset;
                V_CLE.SetRange(V_CLE."Entry No.", "Cust. Ledger Entry"."Entry No.");
                V_CLE.SetFilter(V_CLE."Document Type", 'Payment');
                V_CLE.SetFilter(V_CLE."Document No.", '<>JV@*');
                if V_CLE.Find('-') then begin
                    V_CLE.CalcFields(V_CLE.Amount);
                    //   Amt2 := V_CLE.Amount;
                    // Docno := V_CLE."Document No." ;
                    //   Memo_Date:=V_CLE."Posting Date";
                    Caseid := V_CLE."Global Dimension 2 Code";
                    //    MESSAGE('%1',Amt2);
                    //   Amt2 := V_CLE.Amount;
                end
                //TEAM::1426
                else
                    V_CLE.Reset;
                V_CLE.SetRange(V_CLE."Entry No.", "Cust. Ledger Entry"."Entry No.");
                V_CLE.SetFilter(V_CLE."Document Type", 'Refund');
                V_CLE.SetFilter(V_CLE."Document No.", '<>JV@*');
                if V_CLE.Find('-') then begin
                    V_CLE.CalcFields(V_CLE.Amount);
                    //   Amt2 := V_CLE.Amount;
                    //   Docno := V_CLE."Document No." ;
                    //   Memo_Date:=V_CLE."Posting Date";
                    Caseid := V_CLE."Global Dimension 2 Code";
                    //    MESSAGE('%1',Amt2);
                    //   Amt2 := V_CLE.Amount;
                end;



                /*Reim_Exp :=0;
                R_SIL1.SETRANGE(R_SIL1."Document No.",Docno);
                R_SIL1.SETFILTER(R_SIL1.Description,'REIMBURSABLE');
                IF R_SIL1.FINDFIRST THEN BEGIN
                     REPEAT
                      Reim_Exp+=R_SIL1.Amount;
                      UNTIL
                      R_SIL1.NEXT = 0;
                      IF Curr_Rate <> 0 THEN
                        Reim_Exp := Reim_Exp * Curr_Rate;
                    //     MESSAGE('%1..%2',Reim_Exp,Docno);
                END;*/



                Reim_Exp := 0;
                R_SIL1.SetRange(R_SIL1."Document No.", Docno);
                R_SIL1.SetFilter(R_SIL1.Description, 'REIMBURSABLE');
                if R_SIL1.FindFirst then begin
                    repeat
                        Reim_Exp += R_SIL1.Amount;
                    until
                     R_SIL1.Next = 0;
                    if Curr_Rate <> 0 then begin
                        "Cust. Ledger Entry".CalcFields(Amount);
                        CLE.Reset;
                        CLE.SetRange("Document No.", Docno);
                        if CLE.FindFirst then;
                        CLE.CalcFields("Remaining Amount");
                        CLE.CalcFields(Amount);
                        //MESSAGE(
                        //IF CLE."Remaining Amount" > 0 THEN
                        Reim_Exp := (Reim_Exp / CLE.Amount) * (Abs("Cust. Ledger Entry".Amount)) * Curr_Rate;
                        //Reim_Exp := Reim_Exp * Curr_Rate
                    end else begin
                        "Cust. Ledger Entry".CalcFields(Amount);
                        CLE.Reset;
                        CLE.SetRange("Document No.", Docno);
                        if CLE.FindFirst then;
                        CLE.CalcFields("Remaining Amount");
                        CLE.CalcFields(Amount);
                        //MESSAGE(
                        //IF CLE."Remaining Amount" > 0 THEN
                        Reim_Exp := (Reim_Exp / CLE.Amount) * (Abs("Cust. Ledger Entry".Amount));
                    end;
                    //     MESSAGE('%1..%2',Reim_Exp,Docno);
                end;


                Clear(ServiceTaxAmt);
                Clear(Amount1);
                D_V_CLE.Reset;
                D_V_CLE.SetRange(D_V_CLE."Document No.", "Document No.");
                D_V_CLE.SetRange(D_V_CLE."Cust. Ledger Entry No.", "Entry No.");
                D_V_CLE.SetFilter(D_V_CLE."Entry Type", 'Initial Entry');
                //D_V_CLE.SETFILTER(D_V_CLE."Document Type",'Payment');
                if D_V_CLE.FindFirst then
                    if not (IncomeHead = 'Service Tax Payable') then
                        Amount1 := D_V_CLE."Amount (LCY)"
                    else
                        ServiceTaxAmt := D_V_CLE."Amount (LCY)";



                /*
                ELSE
                GL_Entry1.RESET;
                GL_Entry1.SETRANGE(GL_Entry1."Document No.","Cust. Ledger Entry"."Document No.");
                GL_Entry1.SETRANGE(GL_Entry1."Transaction No.","Transaction No.");
                GL_Entry1.SETFILTER(GL_Entry1."G/L Account No.",'21-03-180200');
                IF GL_Entry1.FINDFIRST THEN
                   Amount1 := GL_Entry1.Amount;
                */

                D_V_CLE.Reset;
                D_V_CLE.SetRange(D_V_CLE."Document No.", "Document No.");
                D_V_CLE.SetRange(D_V_CLE."Cust. Ledger Entry No.", "Entry No.");
                D_V_CLE.SetFilter(D_V_CLE."Document Type", 'Payment');
                D_V_CLE.SetFilter(D_V_CLE."Entry Type", 'Application');
                if D_V_CLE.FindFirst then
                    Applied_Date := "Cust. Ledger Entry"."Applied Date";



                Amt2 := 0;
                //TBD
                /*
                SalesInvHeader.Reset;
                SalesInvHeader.SetFilter(SalesInvHeader."No.", Docno);
                if SalesInvHeader.FindSet then
                    SalesInvHeader.CalcFields(SalesInvHeader."Amount to Customer");
                Amt2 := SalesInvHeader."Amount to Customer";
                */
                // MESSAGE('%1',Amt2);

                OWNER1 := '';
                OWNER2 := '';
                CasePractice := '';
                CaseArea := '';
                CaseProcess := '';
                CaseSolution := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if DimVal.Find('-') then begin
                    OWNER1 := DimVal."Case-Owner1";
                    OWNER2 := DimVal."Case-Owner2";
                    CasePractice := DimVal."Case-Practice";
                    CaseArea := DimVal."Case-Area";
                    CaseProcess := DimVal."Case-Process";
                    CaseSolution := DimVal."Case-Solution";
                    //   MESSAGE(Owner1);
                end;

                OWNER1 := '';
                OWNER2 := '';

                CalcFields("Applied Document (Invoice)");
                CalcFields("Applied Document");
                if "Applied Document (Invoice)" <> '' then begin
                    if SIH.Get("Applied Document (Invoice)") then begin
                        if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER1') then
                            OWNER1 := DimSetEntry."Dimension Value Code";

                        if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then
                            OWNER2 := DimSetEntry."Dimension Value Code";
                    end;
                end else
                    if "Applied Document" <> '' then begin
                        if SIH.Get("Applied Document") then begin
                            if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER1') then
                                OWNER1 := DimSetEntry."Dimension Value Code";

                            if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then
                                OWNER2 := DimSetEntry."Dimension Value Code";
                        end;
                    end else begin
                        Dim_Value.Reset;
                        Dim_Value.SetFilter(Dim_Value."Dimension Code", 'CASE');
                        Dim_Value.SetFilter(Dim_Value.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                        if Dim_Value.FindFirst then begin
                            OWNER1 := Dim_Value."Case-Owner1";
                            OWNER2 := Dim_Value."Case-Owner2";
                        end;
                    end;

                if SIH.Get("Cust. Ledger Entry"."Document No.") then begin
                    if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER1') then
                        OWNER1 := DimSetEntry."Dimension Value Code";

                    if DimSetEntry.Get(SIH."Dimension Set ID", 'OWNER2') then
                        OWNER2 := DimSetEntry."Dimension Value Code";

                end;

                if DimVal.Get('SUBGRP-OWNER2', "Cust. Ledger Entry"."Sub Group Owner 2") then
                    SubGroupName := DimVal.Name;

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Cust. Ledger Entry"."Amount (LCY)", "Original Amt. (LCY)", Amount1, Amt2);

                if UpperCase(UserId) <> 'LSLAW\RAMESH.TEAM' then
                    SetFilter("Posting Date", '%1..%2', DateFilterNew, EndingDateNew);
                if Owner1GlobalBoo then
                    SetFilter(OWNER1, OwnerFilterNew)
                else
                    SetFilter(OWNER2, OwnerFilterNew);
                //    MESSAGE(FORMAT("Cust. Ledger Entry".COUNT));
                // if UpperCase(UserId) = 'LSLAW\RAMESH.TEAM' then
                // SetFilter(OWNER2, 'SANDEEP.SACHDEVA');
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
        //CompanyInfo.GET;
        //CompanyInfo.CALCFIELDS(Picture);

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Cust: Record Customer;
        Client_Name: Text[100];
        IncomeHead: Text[50];
        BranchCode: Code[20];
        Dim: Record "Dimension Value";
        Docno: Code[20];
        Location_Code: Code[20];
        Memo_Date: Date;
        Applied_Date: Date;
        Cheque_No: Code[50];
        Curr: Code[20];
        Curr_Rate: Decimal;
        Gross_Amt_FC: Decimal;
        GL_Entry: Record "G/L Entry";
        GL_Entry1: Record "G/L Entry";
        GL_Acc: Record "G/L Account";
        Bank_Ledger_Entry: Record "Bank Account Ledger Entry";
        Curr_Exch_Rate: Record "Currency Exchange Rate";
        CLE: Record "Cust. Ledger Entry";
        V_CLE: Record "Cust. Ledger Entry";
        Compinfo: Record "Company Information";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Amount1: Decimal;
        D_V_CLE: Record "Detailed Cust. Ledg. Entry";
        Caseid: Code[20];
        CustPosting: Record "Customer Posting Group";
        Amt2: Decimal;
        Owner1: Text[100];
        Owner2: Text[100];
        DimVal: Record "Dimension Value";
        Client_NameCaptionLbl: Label 'Client Name';
        Document_DateCaptionLbl: Label 'Document Date';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Income_HeadCaptionLbl: Label 'Income Head';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Memo_NoCaptionLbl: Label 'Memo No';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Applied_DateCaptionLbl: Label 'Applied Date';
        Check_No_CaptionLbl: Label 'Check No.';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Curr_CaptionLbl: Label 'Curr.';
        Curr__RateCaptionLbl: Label 'Curr. Rate';
        Gross_AmountCaptionLbl: Label 'Gross Amount';
        Gross_Local_currency_i_e_INR_CaptionLbl: Label 'Gross(Local currency i.e INR)';
        Location_codeCaptionLbl: Label 'Location code';
        Reim_Exp: Decimal;
        R_SIL1: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        DateFilterNew: Date;
        OwnerFilterNew: Code[20];
        EndingDateNew: Date;
        I: Integer;
        CasePractice: Text[50];
        CaseArea: Text[50];
        CaseProcess: Text[50];
        CaseSolution: Text[50];
        ServiceTaxAmt: Decimal;
        Owner1GlobalBoo: Boolean;
        SubGroupName: Text;


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
        ExcelBuf.AddInfoColumn('Customer Collection Details',FALSE,'',FALSE,FALSE,FALSE,'');
        //ExcelBuf.NewRow;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
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
        ExcelBuf.CreateSheet('Customer Collection Details','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
         */

    end;


    procedure GLH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document Date.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Posting Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Invome Head',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Case ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Location Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Applied Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Currency Rate',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Gross Amount(Local Currency i.e. INR',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure GLB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Client_Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(IncomeHead,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 2 Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BranchCode,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Location_Code,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Docno,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Memo_Date,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Applied_Date,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Cheque No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Cheque Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Curr_Rate,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Gross_Amt_FC,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Amount1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner2,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure GLF()
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
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Amount1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure Setfilters(DateFilter: Date; EndingDate: Date; OwnerFilter: Code[20]; Own1: Boolean)
    begin
        DateFilterNew := DateFilter;
        EndingDateNew := EndingDate;
        OwnerFilterNew := OwnerFilter;
        Owner1GlobalBoo := Own1;
    end;
}

