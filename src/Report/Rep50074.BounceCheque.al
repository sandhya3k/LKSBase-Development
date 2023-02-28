report 50074 "Bounce Cheque"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bounce Cheque';
    DefaultLayout = RDLC;
    RDLCLayout = './res/BounceCheque.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.") ORDER(Ascending) WHERE("Journal Batch Name" = FILTER('BOUNCE'));
            RequestFilterFields = "Customer No.", "Posting Date", "Global Dimension 1 Code", "Cheque No.";
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
            column(Cheque_Amt; Cheque_Amt)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Document_No__; "Cust. Ledger Entry"."Document No.")
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Client_Name; Client_Name)
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
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Amount__LCY___Control1000000046; "Cust. Ledger Entry"."Amount (LCY)")
            {
            }
            column(Bounce_Cheque__ReportCaption; Bounce_Cheque__ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(IncomeCaption; IncomeCaptionLbl)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
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
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Doeument_DateCaption; Doeument_DateCaptionLbl)
            {
            }
            column(Cheque_AmountCaption; Cheque_AmountCaptionLbl)
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

                Narration := '';
                Posted_Narration.Reset;
                Posted_Narration.SetRange(Posted_Narration."Document No.", "Cust. Ledger Entry"."Document No.");
                if Posted_Narration.Find('-') then
                    Narration := Posted_Narration.Narration;

                Cheque_Amt := 0;
                Bank_Ledge_Entry.Reset;
                Bank_Ledge_Entry.SetRange(Bank_Ledge_Entry."Document No.", "Cust. Ledger Entry"."Document No.");
                if Bank_Ledge_Entry.Find('-') then
                    Cheque_Amt := Abs(Bank_Ledge_Entry."Amount (LCY)");
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Cust. Ledger Entry".Amount, Invoice_Amt, "Cust. Ledger Entry"."Amount (LCY)");
                //CurrReport.CREATETOTALS(Cheque_Amt);
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
        TDS: Decimal;
        Gross_Amt: Decimal;
        Narration: Text[100];
        Company_Info: Record "Company Information";
        DimVal: Record "Dimension Value";
        Posted_Narration: Record "Posted Narration";
        Cheque_Amt: Decimal;
        Bank_Ledge_Entry: Record "Bank Account Ledger Entry";
        Doc_No: Code[20];
        Bounce_Cheque__ReportCaptionLbl: Label 'Bounce Cheque  Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        IncomeCaptionLbl: Label 'Income';
        Client_NameCaptionLbl: Label 'Client Name';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        NarrationCaptionLbl: Label 'Narration';
        Document_No_CaptionLbl: Label 'Document No.';
        Doeument_DateCaptionLbl: Label 'Doeument Date';
        Cheque_AmountCaptionLbl: Label 'Cheque Amount';
}

