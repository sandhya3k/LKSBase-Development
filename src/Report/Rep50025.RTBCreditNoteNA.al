report 50025 "RTB Credit Note(N/A)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/RTBCreditNoteNA.rdlc';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            column(FORMAT__Sales_Cr_Memo_Header___Posting_Date__0_4_; Format("Sales Cr.Memo Header"."Posting Date", 0, 4))
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Shortcut_Dimension_2_Code_; "Sales Cr.Memo Header"."Shortcut Dimension 2 Code")
            {
            }
            column(Sales_Cr_Memo_Header___No________________Sales_Cr_Memo_Header___Shortcut_Dimension_1_Code_; "Sales Cr.Memo Header"."No." + '' + ' - ' + '' + "Sales Cr.Memo Header"."Shortcut Dimension 1 Code")
            {
            }
            column(Sales_Cr_Memo_Header___Ship_to_Name_______Sales_Cr_Memo_Header___Ship_to_Name_2_; "Sales Cr.Memo Header"."Ship-to Name" + ' ' + "Sales Cr.Memo Header"."Ship-to Name 2")
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Ship_to_Address_; "Sales Cr.Memo Header"."Ship-to Address")
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Ship_to_Address_2_; "Sales Cr.Memo Header"."Ship-to Address 2")
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Ship_to_Contact_; "Sales Cr.Memo Header"."Ship-to Contact")
            {
            }
            column(CompanyInfo__Service_Tax_Registration_No__; '')
            {
            }
            column(CompanyInfo__P_A_N__No__; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(Inwords; Inwords)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
                AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1_; Round(LineTotAmt, 1))
            {
            }
            column(CREDIT_NOTECaption; CREDIT_NOTECaptionLbl)
            {
            }
            column(Case_ID_Caption; Case_ID_CaptionLbl)
            {
            }
            column(Category_Of_Service__Caption; Category_Of_Service__CaptionLbl)
            {
            }
            column(Service_Tax_Code_Caption; Service_Tax_Code_CaptionLbl)
            {
            }
            column(Kind_Attn_Caption; Kind_Attn_CaptionLbl)
            {
            }
            column(Legal_Consultancy_ServiceCaption; Legal_Consultancy_ServiceCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
            {
            }
            column(AMOUNTCaption; AMOUNTCaptionLbl)
            {
            }
            column(PAN_NO_Caption; PAN_NO_CaptionLbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(Sales_Cr_Memo_Header_No_; "No.")
            {
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                column(Text1; Text1)
                {
                }
                column(Sales_Cr_Memo_Line__Sales_Cr_Memo_Line___Line_Amount_; "Sales Cr.Memo Line"."Line Amount")
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CurrencyCode_Control1000000008; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Cr_Memo_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Cr_Memo_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Text1 := "Sales Cr.Memo Line".Description
                end;
            }
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
        CompanyInfo: Record "Company Information";
        Text1: Text[250];
        Inwords: Text[250];
        CurrencyCode: Text[30];
        LineTotAmt: Decimal;
        LineAmt: Decimal;
        CREDIT_NOTECaptionLbl: Label 'CREDIT NOTE';
        Case_ID_CaptionLbl: Label 'Case ID:';
        Category_Of_Service__CaptionLbl: Label 'Category Of Service :';
        Service_Tax_Code_CaptionLbl: Label 'Service Tax Code:';
        Kind_Attn_CaptionLbl: Label 'Kind Attn:';
        Legal_Consultancy_ServiceCaptionLbl: Label 'Legal Consultancy Service';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        PAN_NO_CaptionLbl: Label 'PAN NO:';
        TOTALCaptionLbl: Label 'TOTAL';
}

