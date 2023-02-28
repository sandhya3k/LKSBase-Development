report 50037 "Cust. Detail with Date Filter"
{
    // TEAM::4217 Created this report on 19/08/10 for customer outstanding as date filter.
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Cust. Detail with Date Filter';
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustDetailwithDateFilter.rdlc';


    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Customer No.", "Posting Date", "Currency Code") WHERE("Remaining Amount" = FILTER(<> 0));
            RequestFilterFields = "Customer No.", "Posting Date", "Global Dimension 1 Code", "Global Dimension 2 Code";
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
            column(Custfilter; Custfilter)
            {
            }
            column(Cust__Ledger_Entry__Customer_No__; "Customer No.")
            {
            }
            column(CustName; CustName)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Cust__Ledger_Entry__Document_No__; "Document No.")
            {
            }
            column(Cust__Ledger_Entry_Amount; Amount)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amount_; "Remaining Amount")
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amt___LCY__; "Remaining Amt. (LCY)")
            {
            }
            column(Cust__Ledger_Entry__Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(Cust__Ledger_Entry__Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(Owner1; OWNER1)
            {
            }
            column(Owner2; OWNER2)
            {
            }
            column(Cust__Ledger_Entry__Currency_Code_; "Currency Code")
            {
            }
            column(Cust__Ledger_Entry__Original_Amt___LCY__; "Original Amt. (LCY)")
            {
            }
            column(ContactPerson; ContactPerson)
            {
            }
            column(TotalFor___CustName; TotalFor + CustName)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amount__Control1000000033; "Remaining Amount")
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amt___LCY___Control1000000034; "Remaining Amt. (LCY)")
            {
            }
            column(Grand_Total_; 'Grand Total')
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amount__Control1000000043; "Remaining Amount")
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amt___LCY___Control1000000044; "Remaining Amt. (LCY)")
            {
            }
            column(Customer_Detail_AgeingCaption; Customer_Detail_AgeingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Qwner_1Caption; Qwner_1CaptionLbl)
            {
            }
            column(Owner_2Caption; Owner_2CaptionLbl)
            {
            }
            column(Billing_CurrencyCaption; Billing_CurrencyCaptionLbl)
            {
            }
            column(Billing_AmountCaption; Billing_AmountCaptionLbl)
            {
            }
            column(Billing_Inv__Amt___INR_Caption; Billing_Inv__Amt___INR_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amount_Caption; Cust__Ledger_Entry__Remaining_Amount_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amt___LCY__Caption; Cust__Ledger_Entry__Remaining_Amt___LCY__CaptionLbl)
            {
            }
            column(Contact_PersonCaption; Contact_PersonCaptionLbl)
            {
            }
            column(Customer_Caption; Customer_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                OWNER1 := '';
                OWNER2 := '';

                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if DimVal.Find('-') then begin
                    OWNER1 := DimVal."Case-Owner1";
                    OWNER2 := DimVal."Case-Owner2";
                end;

                ContactPerson := '';
                InvoiceHeader.SetRange(InvoiceHeader."No.", "Cust. Ledger Entry"."Document No.");
                //InvoiceHeader.SETFILTER();
                if InvoiceHeader.FindFirst then
                    ContactPerson := InvoiceHeader."Ship-to Contact";
                MOF := InvoiceHeader."Bill Description";


                Cust.SetRange(Cust."No.", "Cust. Ledger Entry"."Customer No.");
                if Cust.Find('-') then begin
                    CustName := Cust.Name;
                end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Customer No.");
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

    trigger OnInitReport()
    begin
        Compinfo.Get;
    end;

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        Custfilter := "Cust. Ledger Entry".GetFilters;
        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        Owner1: Code[50];
        Owner2: Code[50];
        DimVal: Record "Dimension Value";
        InvoiceHeader: Record "Sales Invoice Header";
        "Client Name": Text[100];
        MOF: Text[250];
        ContactPerson: Text[100];
        Cust: Record Customer;
        CustName: Text[100];
        Custfilter: Text[100];
        ExcelBuf: Record "Excel Buffer" temporary;
        Compinfo: Record "Company Information";
        PrintToExcel: Boolean;
        Customer_Detail_AgeingCaptionLbl: Label 'Customer Detail Ageing';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Qwner_1CaptionLbl: Label 'Qwner 1';
        Owner_2CaptionLbl: Label 'Owner 2';
        Billing_CurrencyCaptionLbl: Label 'Billing Currency';
        Billing_AmountCaptionLbl: Label 'Billing Amount';
        Billing_Inv__Amt___INR_CaptionLbl: Label 'Billing Inv. Amt. (INR)';
        Cust__Ledger_Entry__Remaining_Amount_CaptionLbl: Label 'Remg. Amt. in Billing Currency';
        Cust__Ledger_Entry__Remaining_Amt___LCY__CaptionLbl: Label 'Remaining Amount LCY';
        Contact_PersonCaptionLbl: Label 'Contact Person';
        Customer_CaptionLbl: Label 'Customer:';


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
        ExcelBuf.AddInfoColumn('Customer Detail Aging With Date Filter',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Filters',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(Custfilter,FALSE,'',FALSE,FALSE,FALSE,'');
        
        ExcelBuf.NewRow;
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
        ExcelBuf.CreateSheet('Customer Det. Agn. Date Filter','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
         */

    end;


    procedure CLEH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Posting Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Case Id',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('MOF',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Curr. Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Amount(Billing Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Original Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Remaining Amount(Billing Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Remaining Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('CONTACT PERSON',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure CLEGH()
    begin
    end;


    procedure CLEB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustName,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Posting Date",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document No.",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 1 Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 2 Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner1,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner2,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(MOF,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Currency Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry".Amount,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Original Amt. (LCY)",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amount",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amt. (LCY)",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(ContactPerson,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure CLEGF()
    begin
        /*ExcelBuf.NewRow;
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
        ExcelBuf.AddColumn(TotalFor + CustName,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amount",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amt. (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
          */

    end;


    procedure CLEF()
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
        ExcelBuf.AddColumn('GRAND TOTAL',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry".Amount,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Original Amt. (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amount",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amt. (LCY)",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

