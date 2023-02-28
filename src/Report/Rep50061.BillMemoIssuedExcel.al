report 50061 "Bill/Memo Issued (Excel)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bill/Memo Issued (Excel)';
    DefaultLayout = RDLC;
    RDLCLayout = './res/BillMemoIssuedExcel.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";
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

            trigger OnAfterGetRecord()
            begin
                Owner1 := '';
                Owner2 := '';
                CaseSolution := '';
                CaseArea := '';
                CasePractice := '';
                CaseProcess := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Sales Invoice Header"."Shortcut Dimension 2 Code");
                if DimVal.Find('-') then begin
                    Owner1 := DimVal."Case-Owner1";
                    Owner2 := DimVal."Case-Owner2";
                    CaseSolution := DimVal."Case-Solution";
                    CaseArea := DimVal."Case-Area";
                    CasePractice := DimVal."Case-Practice";
                    CaseProcess := DimVal."Case-Process";
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
                //TBD
                /*
                R_SIL.SetRange(R_SIL."Document No.", "Sales Invoice Header"."No.");
                R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                if R_SIL.Find('-') then begin
                    repeat
                        Taxable += R_SIL."Line Amount";
                        stax += R_SIL."Service Tax Amount";
                        staxshe += R_SIL."Service Tax SHE Cess Amount";
                        staxecess += R_SIL."Service Tax eCess Amount";
                    until
                      R_SIL.Next = 0;
                end;
                */
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

                CustLedgEntry.Reset;
                CustLedgEntry.SetRange(CustLedgEntry."Document No.", "No.");
                if CustLedgEntry.FindFirst then
                    GroupHead := CustLedgEntry."Group Heade";
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(BILLAMTLCY, BILLAMT);
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
}

