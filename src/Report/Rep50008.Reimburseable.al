report 50008 Reimburseable
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Reimburseable';
    DefaultLayout = RDLC;
    RDLCLayout = './res/Reimburseable.rdlc';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.");
            RequestFilterFields = "Document No.", "Posting Date";
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
            column(Sales_Invoice_Line__Document_No__; "Document No.")
            {
            }
            column(Sales_Invoice_Line__Item_Description_; "Item Description")
            {
            }
            column(Sales_Invoice_Line__Line_Amount_; "Line Amount")
            {
            }
            column(RTBDate; RTBDate)
            {
            }
            column(Sales_Invoice_Line__Location_Code_; "Location Code")
            {
            }
            column(RTBNo; RTBNo)
            {
            }
            column(Sales_Invoice_Line__Posting_Date_; "Posting Date")
            {
            }
            column(Currency; Currency)
            {
            }
            column(Sales_Invoice_Line__Line_Amount__Control1000000024; "Line Amount")
            {
            }
            column(Total_For_RTB_No______RTBNo; 'Total For RTB No' + '' + RTBNo)
            {
            }
            column(Sales_Invoice_Line__Line_Amount__Control1000000022; "Line Amount")
            {
            }
            column(Reimburseable_ExpensesCaption; Reimburseable_ExpensesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Invoice_No_Caption; Invoice_No_CaptionLbl)
            {
            }
            column(RTB_Date_Caption; RTB_Date_CaptionLbl)
            {
            }
            column(Breanch_Caption; Breanch_CaptionLbl)
            {
            }
            column(Type_of_Reimbursement_HeadCaption; Type_of_Reimbursement_HeadCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(RTB_Date_Caption_Control1000000008; RTB_Date_Caption_Control1000000008Lbl)
            {
            }
            column(Inv_DateCaption; Inv_DateCaptionLbl)
            {
            }
            column(CurrencyCaption; CurrencyCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Sales_Invoice_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                SaleInvHeader.Reset;
                SaleInvHeader.SetFilter(SaleInvHeader."No.", "Sales Invoice Line"."Document No.");
                if SaleInvHeader.FindFirst then
                    RTBNo := SaleInvHeader."Pre-Assigned No.";
                RTBDate := SaleInvHeader."Document Date";
                if SaleInvHeader."Currency Code" = '' then
                    Currency := 'INR'
                else
                    Currency := SaleInvHeader."Currency Code";
            end;

            trigger OnPreDataItem()
            begin
                "Sales Invoice Line".SetFilter("Sales Invoice Line".Description, 'REIMBURSABLE');
                CurrReport.CreateTotals("Line Amount");
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
        RTBNo: Code[20];
        SaleInvHeader: Record "Sales Invoice Header";
        RTBDate: Date;
        Currency: Code[10];
        Reimburseable_ExpensesCaptionLbl: Label 'Reimburseable Expenses';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Invoice_No_CaptionLbl: Label 'Invoice No.';
        RTB_Date_CaptionLbl: Label 'RTB Date.';
        Breanch_CaptionLbl: Label 'Breanch ';
        Type_of_Reimbursement_HeadCaptionLbl: Label 'Type of Reimbursement Head';
        AmountCaptionLbl: Label 'Amount';
        RTB_Date_Caption_Control1000000008Lbl: Label 'RTB Date.';
        Inv_DateCaptionLbl: Label 'Inv Date';
        CurrencyCaptionLbl: Label 'Currency';
        TotalCaptionLbl: Label 'Total';
}

