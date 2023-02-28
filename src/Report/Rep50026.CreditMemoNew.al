report 50026 "Credit Memo New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CreditMemoNew.rdl';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Cr_Memo_Header___No________________Sales_Cr_Memo_Header___Shortcut_Dimension_1_Code_; "Sales Cr.Memo Header"."No." + '' + ' - ' + '' + "Sales Cr.Memo Header"."Shortcut Dimension 1 Code")
            {
            }
            column(FORMAT__Sales_Cr_Memo_Header___Posting_Date__0_4_; Format("Sales Cr.Memo Header"."Posting Date", 0, 4))
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___Shortcut_Dimension_2_Code_; "Sales Cr.Memo Header"."Shortcut Dimension 2 Code")
            {
            }
            column(Sales_Cr_Memo_Header___Sell_to_Customer_Name_______Sales_Cr_Memo_Header___Sell_to_Customer_Name_2_; "Sales Cr.Memo Header"."Sell-to Customer Name" + ' ' + "Sales Cr.Memo Header"."Sell-to Customer Name 2")
            {
            }
            column(Sales_Cr_Memo_Header__Bill_to_Address_; "Bill-to Address")
            {
            }
            column(Structure_SalesCrMemoHeader; '')
            {
            }
            column(Sales_Cr_Memo_Header__Bill_to_Address_2_; "Bill-to Address 2")
            {
            }
            column(Sales_Cr_Memo_Header__Bill_to_City_; "Bill-to City")
            {
            }
            column(Sales_Cr_Memo_Header__Bill_to_Contact_; "Bill-to Contact")
            {
            }
            column(Sales_Cr_Memo_Header__Sales_Cr_Memo_Header___State_Name_; "Sales Cr.Memo Header"."State Name")
            {
            }
            column(LineTotAmt; LineTotAmt)
            {
                AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                AutoFormatType = 1;
            }
            column(CompanyInfo__P_A_N__No__; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(AppliedToText; Inwords)
            {
            }
            column(Sales_Cr_Memo_Line__Line_Amount__Control67; CurrencyCode)
            {
                AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                AutoFormatType = 1;
            }
            column(CREDIT_NOTECaption; CREDIT_NOTECaptionLbl)
            {
            }
            column(Case_ID_Caption; Case_ID_CaptionLbl)
            {
            }
            column(Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_Caption; Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_CaptionLbl)
            {
            }
            column(Sales_Cr_Memo_Line__Service_Tax_Amount__Caption; Sales_Cr_Memo_Line__Service_Tax_Amount__CaptionLbl)
            {
            }
            column(AmountInWord; Inwords)
            {
            }
            column(Sales_Cr_Memo_Header_No_; "No.")
            {
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Text1; Text1)
                {
                }
                column(CurrencyCode; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(LineAmt; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Text7; Text7)
                {
                }
                column(CurrencyCode_Control1000000049; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(LineAmt_Control1000000050; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Text3; Text3)
                {
                }
                column(CurrencyCode_Control1000000053; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(LineAmt_Control1000000054; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Text4; Text4)
                {
                }
                column(LineAmt_Control1000000057; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CurrencyCode_Control1000000058; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Text5; Text5)
                {
                }
                column(CurrencyCode_Control1000000061; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(LineAmt_Control1000000062; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Text6; Text6)
                {
                }
                column(CurrencyCode_Control1000000065; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(LineAmt_Control1000000066; LineAmt)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CurrencyCode_Control1000000030; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Cr_Memo_Line__Service_Tax_Amount__; 0)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_; 0)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CurrencyCode_Control1000000035; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Cr_Memo_Line__Service_Tax_SHE_Cess_Amount_; 0)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CurrencyCode_Control1000000036; CurrencyCode)
                {
                    AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(OtherDetail1_SalesCrMemoLine; "Sales Cr.Memo Line"."Other Detail 1")
                {
                }
                column(OtherDetail2_SalesCrMemoLine; "Sales Cr.Memo Line"."Other Detail 2")
                {
                }
                column(AppliedToText_______Sales_Cr_Memo_Header___Shortcut_Dimension_1_Code_; AppliedToText + '- ' + "Sales Cr.Memo Header"."Shortcut Dimension 1 Code")
                {
                }
                column(Sales_Cr_Memo_Header___Bill_Description_; "Sales Cr.Memo Header"."Bill Description")
                {
                }
                column(AppliedDate; Format(AppliedDate))
                {
                }
                column(ServiceTaxeCessAmount_SalesCrMemoLine; 0)
                {
                }
                column(ServiceTaxSHECessAmount_SalesCrMemoLine; 0)
                {
                }
                column(ServiceTaxAmount_SalesCrMemoLine; 0)
                {
                }
                column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
                {
                }
                column(Desc_SalesCreditMemo; Desc)
                {
                }
                column(AMOUNTCaption; AMOUNTCaptionLbl)
                {
                }
                column(Sales_Cr_Memo_Line__Service_Tax_Amount__Caption_Control1000000007; Sales_Cr_Memo_Line__Service_Tax_Amount__Caption_Control1000000007Lbl)
                {
                }
                column(Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_Caption_Control1000000010; Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_Caption_Control1000000010Lbl)
                {
                }
                column(Sales_Cr_Memo_Line__Service_Tax_SHE_Cess_Amount_Caption; Sales_Cr_Memo_Line__Service_Tax_SHE_Cess_Amount_CaptionLbl)
                {
                }
                column(Reasons_for_Credit_Note_Caption; Reasons_for_Credit_Note_CaptionLbl)
                {
                }
                column(DatedCaption; DatedCaptionLbl)
                {
                }
                column(Sales_Cr_Memo_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Cr_Memo_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Intprint += 1;
                    LineAmt := "Sales Cr.Memo Line"."Line Amount";
                    //TBD
                    /*
                    LineTotAmt := LineTotAmt + LineAmt + "Sales Cr.Memo Line"."Service Tax Amount" + "Sales Cr.Memo Line"."Service Tax SHE Cess Amount" +
                                                       "Sales Cr.Memo Line"."Service Tax eCess Amount";
                    */
                    LineTotAmt := LineTotAmt + LineAmt; //3k-UPG
                    //TEAM::1426
                    //Desc := '';
                    Text1 := '';
                    Text7 := '';
                    Text3 := '';
                    Text4 := '';
                    Text5 := '';
                    Text6 := '';
                    SaleCrMomoLine.Reset;
                    SaleCrMomoLine.SetRange(SaleCrMomoLine."Document No.", "Sales Cr.Memo Line"."Document No.");
                    SaleCrMomoLine.SetRange(SaleCrMomoLine."Line No.", "Sales Cr.Memo Line"."Line No.");
                    if SaleCrMomoLine.Find('-') then
                        Desc := SaleCrMomoLine."Other Detail 1" + ' ' + SaleCrMomoLine."Other Detail 2";
                    MaxLength := StrLen(Desc);
                    //MESSAGE('%1',MaxLength);
                    //END;

                    if MaxLength <= 80 then
                        Text1 := Desc;
                    //END;
                    if (MaxLength > 80) and (MaxLength <= 160) then
                        Text7 := Desc;
                    //END ;
                    if (MaxLength > 160) and (MaxLength <= 240) then
                        Text3 := Desc;
                    //END ;
                    if (MaxLength > 240) and (MaxLength <= 320) then
                        Text4 := Desc;
                    //END;
                    if (MaxLength > 320) and (MaxLength <= 400) then
                        Text5 := Desc;
                    //END ;
                    if (MaxLength > 400) then
                        Text6 := Desc;
                    //END ;

                    //TBD //CurrReport.ShowOutput := "Sales Cr.Memo Header"."Currency Code" = '';
                    CheckReport.InitTextVariable;
                    CheckReport.FormatNoText(NumberText, LineTotAmt, "Sales Cr.Memo Header"."Currency Code");
                    Inwords := NumberText[1];
                end;

                trigger OnPreDataItem()
                begin
                    LineTotAmt := 0;
                    LineAmt := 0;
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Integer_Number; Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    Intprint := 4 - Intprint;
                    SetRange(Number, 0, Intprint);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get;

                if "Applies-to Doc. No." = '' then
                    AppliedToText := ''
                else
                    AppliedToText := StrSubstNo(Text001, "Applies-to Doc. Type", "Applies-to Doc. No.");

                SaleInvHeader.Reset;
                SaleInvHeader.SetRange(SaleInvHeader."No.", "Sales Cr.Memo Header"."Applies-to Doc. No.");
                if SaleInvHeader.Find('-') then
                    if SaleInvHeader."Posting Date" = 0D then
                        AppliedDate := 0D
                    else
                        AppliedDate := SaleInvHeader."Posting Date";
                /*
                IF "Bill Description" = '' THEN
                    Reason :=''
                ELSE
                   Reason :="Sales Cr.Memo Header"."Bill Description";
                */


                if "Sales Cr.Memo Header"."Currency Code" = '' then
                    CurrencyCode := 'Rs.'
                else
                    CurrencyCode := "Sales Cr.Memo Header"."Currency Code";

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
        AppliedToText: Text[100];
        Text001: Label 'Credit Note Against %1 No. %2';
        CompanyInfo: Record "Company Information";
        Intprint: Integer;
        Text2: Label 'Invoice Date %1';
        AppliedDate: Date;
        Reason: Text[250];
        Inwords: Text[1024];
        CheckReport: Report "Check report";
        NumberText: array[2] of Text[1024];
        CurrencyCode: Text[30];
        LineTotAmt: Decimal;
        LineAmt: Decimal;
        SaleCrMomoHeader: Record "Sales Cr.Memo Header";
        SaleCrMomoLine: Record "Sales Cr.Memo Line";
        Desc: Text[600];
        SaleInvHeader: Record "Sales Invoice Header";
        MaxLength: Integer;
        Text1: Text[90];
        Text3: Text[250];
        Text4: Text[330];
        Text5: Text[410];
        Text6: Text[510];
        Text7: Text[180];
        CREDIT_NOTECaptionLbl: Label 'CREDIT NOTE';
        Case_ID_CaptionLbl: Label 'Case ID:';
        Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_CaptionLbl: Label 'PAN No.';
        Sales_Cr_Memo_Line__Service_Tax_Amount__CaptionLbl: Label 'Total';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        Sales_Cr_Memo_Line__Service_Tax_Amount__Caption_Control1000000007Lbl: Label 'Service Tax Amount';
        Sales_Cr_Memo_Line__Service_Tax_eCess_Amount_Caption_Control1000000010Lbl: Label 'Service Tax eCess Amount';
        Sales_Cr_Memo_Line__Service_Tax_SHE_Cess_Amount_CaptionLbl: Label 'Service Tax SHE Cess Amount';
        Reasons_for_Credit_Note_CaptionLbl: Label 'Reasons for Credit Note:';
        DatedCaptionLbl: Label 'Dated';
}

