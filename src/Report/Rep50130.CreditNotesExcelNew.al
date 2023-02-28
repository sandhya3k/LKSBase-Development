report 50130 "Credit Notes(Excel)_New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CreditNotesExcelNew.rdlc';

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
            column(Sales_Cr_Memo_Header__No__; "No.")
            {
            }
            column(Sales_Cr_Memo_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Cr_Memo_Header__Applies_to_Doc__No__; "Applies-to Doc. No.")
            {
            }
            column(Clientname; Clientname)
            {
            }
            column(INVDATE; INVDATE)
            {
            }
            column(INVBR; INVBR)
            {
            }
            column(INVcase; INVcase)
            {
            }
            column(Owner1; Owner1)
            {
            }
            column(Owner1_Control1000000018; Owner1)
            {
            }
            column(Case_Process; CaseProcess)
            {
            }
            column(Case_Solution; CaseSolution)
            {
            }
            column(Case_Area; CaseArea)
            {
            }
            column(Case_Practice; CasePractice)
            {
            }
            column(Inv_Amt_Billi_Curr; Abs(Inv_Amt_Billi_Curr))
            {
            }
            column(Reimbursableinc; Abs(Reimbursableinc))
            {
            }
            column(ProfessionalFee; Abs(ProfessionalFee))
            {
            }
            column(S_Tax; Abs(S_Tax))
            {
            }
            column(INVAMT; Abs(INVAMT))
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Currency_Code_; "Sales Cr.Memo Header"."Currency Code")
            {
            }
            column(Sales_Cr_Memo_Header__Bill_Description_; "Bill Description")
            {
            }
            column(INVAMT_Control1000000000; INVAMT)
            {
            }
            column(Reimbursableinc_Control1000000001; Reimbursableinc)
            {
            }
            column(ProfessionalFee_Control1000000003; ProfessionalFee)
            {
            }
            column(S_Tax_Control1000000005; S_Tax)
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Location_Code_; "Sales Cr.Memo Header"."Location Code")
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
            column(Credit_Note_No___CRTB_No__Caption; Credit_Note_No___CRTB_No__CaptionLbl)
            {
            }
            column(Credit_Note_DateCaption; Credit_Note_DateCaptionLbl)
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
            column(Memo_Br__CodeCaption; Memo_Br__CodeCaptionLbl)
            {
            }
            column(Memo_Case_IDCaption; Memo_Case_IDCaptionLbl)
            {
            }
            column(Owner_1Caption; Owner_1CaptionLbl)
            {
            }
            column(Owner_2Caption; Owner_2CaptionLbl)
            {
            }
            column(Invoice_Amount_Billing_Curr_Caption; Invoice_Amount_Billing_Curr_CaptionLbl)
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
            column(Curr__CodeCaption; Curr__CodeCaptionLbl)
            {
            }
            column(Bill_DiscriptionCaption; Bill_DiscriptionCaptionLbl)
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
        Credit_Note_No___CRTB_No__CaptionLbl: Label 'Credit Note No. (CRTB No.)';
        Credit_Note_DateCaptionLbl: Label 'Credit Note Date';
        Client_NameCaptionLbl: Label 'Client Name';
        Memo_No_CaptionLbl: Label 'Memo No.';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Memo_Br__CodeCaptionLbl: Label 'Memo Br. Code';
        Memo_Case_IDCaptionLbl: Label 'Memo Case ID';
        Owner_1CaptionLbl: Label 'Owner 1';
        Owner_2CaptionLbl: Label 'Owner 2';
        Invoice_Amount_Billing_Curr_CaptionLbl: Label 'Invoice Amount Billing Curr.';
        Invoice_Amount__INR_CaptionLbl: Label 'Invoice Amount (INR)';
        Customer_Detailed_AgingCaptionLbl: Label 'Report For Credit Notes';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Reimburseable_ExpensesCaptionLbl: Label 'Reimburseable Expenses';
        Professional_FeesCaptionLbl: Label 'Professional Fees';
        Service_TaxCaptionLbl: Label 'Service Tax';
        Curr__CodeCaptionLbl: Label 'Curr. Code';
        Bill_DiscriptionCaptionLbl: Label 'Bill Discription';
        CaseProcess: Text[50];
        CaseSolution: Text[50];
        CaseArea: Text[50];
        CasePractice: Text[50];


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

