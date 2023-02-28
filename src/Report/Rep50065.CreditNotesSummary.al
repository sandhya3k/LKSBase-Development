report 50065 "Credit Notes(Summary)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Credit Notes(Summary)';
    DefaultLayout = RDLC;
    RDLCLayout = './res/CreditNotesSummary.rdlc';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("Shortcut Dimension 1 Code") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(Compinfo_Picture; Compinfo.Picture)
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
            column("Min"; Min)
            {
            }
            column("Max"; Max)
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Location_Code_; "Sales Cr.Memo Header"."Location Code")
            {
            }
            column(S_Tax; S_Tax)
            {
            }
            column(ProfessionalFee; ProfessionalFee)
            {
            }
            column(Reimbursableinc; Reimbursableinc)
            {
            }
            column(INVAMT; INVAMT)
            {
            }
            column(INVAMT_Control1000000040; INVAMT)
            {
            }
            column(S_Tax_Control1000000038; S_Tax)
            {
            }
            column(ProfessionalFee_Control1000000039; ProfessionalFee)
            {
            }
            column(Reimbursableinc_Control1000000041; Reimbursableinc)
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Invoice_Amount__INR_Caption; Invoice_Amount__INR_CaptionLbl)
            {
            }
            column(Customer_Detailed_AgingCaption; Customer_Detailed_AgingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Reimburseable_ExpensesCaption; Reimburseable_ExpensesCaptionLbl)
            {
            }
            column(Professional_FeesCaption; Professional_FeesCaptionLbl)
            {
            }
            column(Service_TaxCaption; Service_TaxCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(Sales_Cr_Memo_Header_No_; "No.")
            {
            }
            column(Sales_Cr_Memo_Header_Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                SIH.SetRange(SIH."No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIH.Find('-') then begin
                    INVDATE := SIH."Posting Date";
                    INVBR := SIH."Shortcut Dimension 1 Code";
                    INVcase := SIH."Shortcut Dimension 2 Code";
                    Clientname := SIH."Sell-to Customer Name";
                end;

                Owner1 := '';
                Owner2 := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, INVcase);
                if DimVal.Find('-') then begin
                    Owner1 := DimVal."Case-Owner1";
                    Owner2 := DimVal."Case-Owner2";
                end;

                CurRate := 0;
                CurrExchangerate.SetRange(CurrExchangerate."Currency Code", "Currency Code");
                CurrExchangerate.SetRange(CurrExchangerate."Starting Date", "Posting Date");
                if CurrExchangerate.Find('+') then begin
                    CurRate := CurrExchangerate."Relational Exch. Rate Amount";
                end;


                INVAMT := 0;
                INVDesc := '';
                //TBD
                /*
                SIL.SetRange(SIL."Document No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIL.Find('-') then begin
                    repeat
                        if CurRate > 0 then
                            INVAMT += SIL."Amount To Customer" * CurRate
                        else
                            INVAMT += SIL."Amount To Customer"
                     until
                     SIL.Next = 0;
                end;                
                //message('%1',INVAMT);

                Inv_Amt_Billi_Curr := 0;
                SIL.SetRange(SIL."Document No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SIL.Find('-') then begin
                    repeat
                        Inv_Amt_Billi_Curr += SIL."Amount To Customer";
                    until
                   SIL.Next = 0;
                end;
                */


                Taxable := 0;
                stax := 0;
                staxshe := 0;
                staxecess := 0;
                R_SIL.Reset;
                //TBD
                /*
                R_SIL.SetRange(R_SIL."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL.SetFilter(R_SIL."Service Tax Group", 'LEGAL');
                if R_SIL.Find('-') then begin
                    repeat
                        stax += R_SIL."Service Tax Amount";
                        staxshe += R_SIL."Service Tax SHE Cess Amount";
                        staxecess += R_SIL."Service Tax eCess Amount";
                    until
                      R_SIL.Next = 0

                end;
                */
                ServiceTax := stax + staxshe + staxecess;

                if CurRate > 0 then
                    S_Tax := ServiceTax * CurRate
                else
                    S_Tax := ServiceTax;

                ProfessionalFee := 0;
                R_SIL1.SetRange(R_SIL1."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL1.SetFilter(R_SIL1.Description, 'PROFESSIONAL');
                if R_SIL1.Find('-') then begin
                    repeat
                        if CurRate > 0 then
                            ProfessionalFee += R_SIL1."Line Amount" * CurRate
                        else
                            ProfessionalFee += R_SIL1."Line Amount"
                    until
                    R_SIL1.Next = 0;
                end;

                Reimbursableinc := 0;
                R_SIL.SetRange(R_SIL."Document No.", "Sales Cr.Memo Header"."No.");
                R_SIL.SetFilter(R_SIL.Description, '<>PROFESSIONAL');
                if R_SIL.Find('-') then begin
                    repeat
                        if CurRate > 0 then
                            Reimbursableinc += R_SIL."Line Amount" * CurRate
                        else
                            Reimbursableinc += R_SIL."Line Amount"
                    until
                    R_SIL.Next = 0
                end;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(INVAMT, ServiceTax, ProfessionalFee, Reimbursableinc, S_Tax);

                Min := "Sales Cr.Memo Header".GetRangeMin("Sales Cr.Memo Header"."Posting Date");
                Max := "Sales Cr.Memo Header".GetRangeMax("Sales Cr.Memo Header"."Posting Date");
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
        Compinfo.Get;
        Compinfo.CalcFields(Picture);

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        INVDesc: Text[200];
        INVAMT: Decimal;
        INVDATE: Date;
        INVBR: Code[20];
        INVcase: Code[20];
        Clientname: Text[100];
        SIH: Record "Sales Invoice Header";
        SIL: Record "Sales Invoice Line";
        Owner1: Text[60];
        Owner2: Text[60];
        R_SIL: Record "Sales Cr.Memo Line";
        DimVal: Record "Dimension Value";
        Compinfo: Record "Company Information";
        ProfessionalFee: Decimal;
        Reimbursableinc: Decimal;
        ServiceTax: Decimal;
        Taxable: Decimal;
        stax: Decimal;
        staxshe: Decimal;
        staxecess: Decimal;
        STAXTOTAL: Decimal;
        CurRate: Decimal;
        CurrExchangerate: Record "Currency Exchange Rate";
        Inv_Amt_Billi_Curr: Decimal;
        S_Tax: Decimal;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        R_SIL1: Record "Sales Cr.Memo Line";
        Number: Integer;
        PrintDetail: Boolean;
        "Min": Date;
        "Max": Date;
        Client_NameCaptionLbl: Label 'Client Name';
        Invoice_Amount__INR_CaptionLbl: Label 'Invoice Amount (INR)';
        Customer_Detailed_AgingCaptionLbl: Label 'Report For Credit Notes';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Reimburseable_ExpensesCaptionLbl: Label 'Reimburseable Expenses';
        Professional_FeesCaptionLbl: Label 'Professional Fees';
        Service_TaxCaptionLbl: Label 'Service Tax';
        FromCaptionLbl: Label 'From';
        ToCaptionLbl: Label 'To';


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
        ExcelBuf.AddInfoColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Case Id',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Reason',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Curr. Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Invoice Amt Billing Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Incoice Amt INR',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Credit Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Credit Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Reimbusable Exp',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Professional Fee',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Service Tax',FALSE,'',TRUE,FALSE,FALSE,'');
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
        ExcelBuf.CreateSheet('Report for Credit Notes','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
         */

    end;


    procedure CRH2()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Memo Case Id',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Reason',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Curr. Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Invoice Amt Billing Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Incoice Amt INR',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Credit Memo No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Credit Memo Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Reimbusable Exp',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Professional Fee',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Service Tax',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure CB1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Clientname,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."Applies-to Doc. No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(INVDATE,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(INVBR,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(INVcase,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner2,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."Bill Description",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."Currency Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Inv_Amt_Billi_Curr,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(INVAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."Posting Date",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Reimbursableinc,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(ProfessionalFee,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(S_Tax,FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure SCMH2()
    begin
    end;


    procedure CF1()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Grand Total',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Sales Cr.Memo Header"."Currency Code",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(INVAMT,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Reimbursableinc,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(ProfessionalFee,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(S_Tax,FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;
}

