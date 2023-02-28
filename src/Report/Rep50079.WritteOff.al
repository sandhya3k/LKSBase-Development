report 50079 "Writte Off"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Writte Off';
    DefaultLayout = RDLC;
    RDLCLayout = './res/WritteOff.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING(Open, "Due Date") WHERE("Journal Batch Name" = FILTER('JVWRITEOFF'), Reversed = FILTER(false));
            RequestFilterFields = "Customer No.", "Posting Date", "Global Dimension 1 Code";
            column(DocumentDate; "Cust. Ledger Entry"."Document Date")
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Company_Info_Picture; Company_Info.Picture)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Amount__LCY__; "Cust. Ledger Entry"."Amount (LCY)")
            {
            }
            column(MemoNo; MemoNo)
            {
            }
            column(Client_Name; Client_Name)
            {
            }
            column(Memo_Date; Memo_Date)
            {
            }
            column(Branch_Code; Branch_Code)
            {
            }
            column(Case_ID; Case_ID)
            {
            }
            column(Owner1; OWNER1)
            {
            }
            column(Owner2; OWNER2)
            {
            }
            column(Invoice_Amt; Invoice_Amt)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_No__; "Cust. Ledger Entry"."Cheque No.")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_Date_; "Cust. Ledger Entry"."Cheque Date")
            {
            }
            column(Narration; Narration)
            {
            }
            column(Invoice_Amt_Control1000000042; Invoice_Amt)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Amount__LCY___Control1000000044; "Cust. Ledger Entry"."Amount (LCY)")
            {
            }
            column(Invoice_Amt_Control1000000043; Invoice_Amt)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Amount__LCY___Control1000000046; "Cust. Ledger Entry"."Amount (LCY)")
            {
            }
            column(Cust__Ledger_EntryCaption; Cust__Ledger_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Written_off_AmountCaption; Written_off_AmountCaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Memo_No_Caption; Memo_No_CaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Owner_1Caption; Owner_1CaptionLbl)
            {
            }
            column(Owner_2Caption; Owner_2CaptionLbl)
            {
            }
            column(Invoice_AmountCaption; Invoice_AmountCaptionLbl)
            {
            }
            column(Cheque_No_Caption; Cheque_No_CaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(NarrationCaption; NarrationCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Client_Name := '';
                Cust.Reset;
                Cust.SetRange(Cust."No.", "Cust. Ledger Entry"."Customer No.");
                if Cust.Find('-') then
                    Client_Name := Cust.Name;

                OWNER1 := '';
                OWNER2 := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if DimVal.Find('-') then begin
                    OWNER1 := DimVal."Case-Owner1";
                    OWNER2 := DimVal."Case-Owner2";
                end;

                Branch_Code := '';
                DimVal.Reset;
                DimVal.SetFilter(DimVal.Code, 'BRANCH');
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                if DimVal.Find('-') then
                    Branch_Code := DimVal.Name;

                MemoNo := '';
                Memo_Date := 0D;
                //Branch_Code:='';
                Case_ID := '';
                Cust_Led_Entry.Reset;
                Cust_Led_Entry.SetRange(Cust_Led_Entry."Closed by Entry No.", "Cust. Ledger Entry"."Entry No.");
                Cust_Led_Entry.CalcFields(Cust_Led_Entry."Amount (LCY)");
                if Cust_Led_Entry.Find('-') then
                    MemoNo := Cust_Led_Entry."Document No.";
                Memo_Date := Cust_Led_Entry."Posting Date";
                //   Branch_Code := Cust_Led_Entry."Global Dimension 1 Code";
                Case_ID := Cust_Led_Entry."Global Dimension 2 Code";

                Invoice_Amt := 0;
                Cust_Led_Entry.Reset;
                Cust_Led_Entry.SetRange(Cust_Led_Entry."Closed by Entry No.", "Cust. Ledger Entry"."Entry No.");
                if Cust_Led_Entry.Find('-') then
                    Cust_Led_Entry.CalcFields(Cust_Led_Entry."Amount (LCY)");
                Invoice_Amt := Cust_Led_Entry."Amount (LCY)";

                Narration := '';
                Posted_Narration.Reset;
                Posted_Narration.SetRange(Posted_Narration."Document No.", "Cust. Ledger Entry"."Document No.");
                if Posted_Narration.Find('-') then
                    Narration := Posted_Narration.Narration;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Cust. Ledger Entry".Amount, Invoice_Amt, "Cust. Ledger Entry"."Amount (LCY)");
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
        MemoNo: Code[20];
        Cust_Led_Entry: Record "Cust. Ledger Entry";
        Client_Name: Text[100];
        Cust: Record Customer;
        Memo_Date: Date;
        Branch_Code: Code[20];
        Case_ID: Code[10];
        Owner1: Text[100];
        Owner2: Text[100];
        Invoice_Amt: Decimal;
        Cheque_No: Code[50];
        Cheque_Date: Date;
        Cheque_Amt: Decimal;
        TDS: Decimal;
        Gross_Amt: Decimal;
        Narration: Text[100];
        Company_Info: Record "Company Information";
        DimVal: Record "Dimension Value";
        Posted_Narration: Record "Posted Narration";
        Cust__Ledger_EntryCaptionLbl: Label 'Cust. Ledger Entry';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Written_off_AmountCaptionLbl: Label 'Written off Amount';
        Client_NameCaptionLbl: Label 'Client Name';
        Memo_No_CaptionLbl: Label 'Memo No.';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Owner_1CaptionLbl: Label 'Owner 1';
        Owner_2CaptionLbl: Label 'Owner 2';
        Invoice_AmountCaptionLbl: Label 'Invoice Amount';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        NarrationCaptionLbl: Label 'Narration';
}

