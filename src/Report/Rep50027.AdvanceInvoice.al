report 50027 "Advance Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/AdvanceInvoice.rdlc';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(Sales_Shipment_Header___No__________Sales_Shipment_Header___Shortcut_Dimension_1_Code_; "Sales Shipment Header"."No." + ' - ' + "Sales Shipment Header"."Shortcut Dimension 1 Code")
            {
            }
            column(Sales_Shipment_Header___Ship_to_Name_______Sales_Shipment_Header___Ship_to_Name_2_; "Sales Shipment Header"."Ship-to Name" + ' ' + "Sales Shipment Header"."Ship-to Name 2")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Address_; "Sales Shipment Header"."Ship-to Address")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Address_2_; "Sales Shipment Header"."Ship-to Address 2")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Contact_; "Sales Shipment Header"."Ship-to Contact")
            {
            }
            column(FORMAT__Sales_Shipment_Header___Posting_Date__0___Day_2_____Month_TEXT____Year4___; Format("Sales Shipment Header"."Posting Date", 0, '<Day,2>,  <Month TEXT>  <Year4>'))
            {
            }
            column(Sales_Shipment_Header___Ship_to_City_______Ship_to_Post_Code_; "Sales Shipment Header"."Ship-to City" + '-' + "Ship-to Post Code")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header__State; "Sales Shipment Header".State)
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Shortcut_Dimension_2_Code_; "Sales Shipment Header"."Shortcut Dimension 2 Code")
            {
            }
            column(STNo; STNo)
            {
            }
            column(Category; Category)
            {
            }
            column(Inwords; Inwords)
            {
            }
            column(CompanyInfo__P_A_N__No__; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(LineTotAmt; LineTotAmt)
            {
            }
            column(Inwords_Control1000000007; Inwords)
            {
            }
            column(CompanyInfo__P_A_N__No___Control1000000034; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name_Control1000000036; CompanyInfo.Name)
            {
            }
            column(ROUND_LineTotAmt_1_; Round(LineTotAmt, 1))
            {
            }
            column(MEMO_OF_FEESCaption; MEMO_OF_FEESCaptionLbl)
            {
            }
            column(Kind_Attn_Caption; Kind_Attn_CaptionLbl)
            {
            }
            column(Case_ID_Caption; Case_ID_CaptionLbl)
            {
            }
            column(PAN_NO_Caption; PAN_NO_CaptionLbl)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption; KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(PAN_NO_Caption_Control1000000029; PAN_NO_Caption_Control1000000029Lbl)
            {
            }
            column(DataItem1000000032; NOTE_Please_remit_to_Account_No__00322430000225_with_HDFC_BANK_C_5_SAFDARJUNG_DEVELOPMENT_AREA__Lbl)
            {
            }
            column(DataItem1000000035; KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl)
            {
            }
            column(TOTALCaption_Control1000000037; TOTALCaption_Control1000000037Lbl)
            {
            }
            column(Sales_Shipment_Header_No_; "No.")
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Desc1; Desc1)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price_; "Sales Shipment Line"."Unit Price")
                {
                }
                column(Desc2; Desc2)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price__Control1000000020; "Sales Shipment Line"."Unit Price")
                {
                }
                column(Desc3; Desc3)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price__Control1000000046; "Sales Shipment Line"."Unit Price")
                {
                }
                column(Desc4; Desc4)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price__Control1000000049; "Sales Shipment Line"."Unit Price")
                {
                }
                column(Desc5; Desc5)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price__Control1000000052; "Sales Shipment Line"."Unit Price")
                {
                }
                column(Desc6; Desc6)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_Price__Control1000000055; "Sales Shipment Line"."Unit Price")
                {
                }
                column(ServiceTaxAmt; ServiceTax)
                {
                    AutoFormatType = 1;
                }
                column(ServiceTaxECessAmt; Ecess)
                {
                    AutoFormatType = 1;
                }
                column(ServiceTaxSHECessAmt; SheCess)
                {
                    AutoFormatType = 1;
                }
                column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
                {
                }
                column(AMOUNTCaption; AMOUNTCaptionLbl)
                {
                }
                column(Service_Tax_AmountCaption; Service_Tax_AmountCaptionLbl)
                {
                }
                column(Service_Tax_eCess_AmountCaption; Service_Tax_eCess_AmountCaptionLbl)
                {
                }
                column(Service_Tax_SHE_Cess_AmountCaption; Service_Tax_SHE_Cess_AmountCaptionLbl)
                {
                }
                column(Sales_Shipment_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Shipment_Line_Line_No_; "Line No.")
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        intprint := 4 - intprint;
                        SetRange(Number, 0, intprint);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    intprint += 1;
                    Desc := ' ';
                    SalesShipLine.Reset;
                    SalesShipLine.SetRange(SalesShipLine."Document No.", "Sales Shipment Line"."Document No.");
                    SalesShipLine.SetRange(SalesShipLine."Line No.", "Sales Shipment Line"."Line No.");
                    if SalesShipLine.Find('-') then
                        Desc := SalesShipLine."Other Detail 1" + ' ' + SalesShipLine."Other Detail 2";
                    MaxLength := StrLen(Desc);
                    //MESSAGE('%1',MaxLength);

                    if MaxLength <= 80 then begin
                        Desc1 := Desc;
                    end;
                    if (MaxLength > 80) and (MaxLength <= 160) then begin
                        Desc2 := Desc;
                    end;
                    if (MaxLength > 160) and (MaxLength <= 240) then begin
                        Desc3 := Desc;
                    end;
                    if (MaxLength > 240) and (MaxLength <= 320) then begin
                        Desc4 := Desc;
                    end;
                    if (MaxLength > 320) and (MaxLength <= 400) then begin
                        Desc5 := Desc;
                    end;
                    if (MaxLength > 400) and (MaxLength <= 480) then begin
                        Desc6 := Desc;
                    end;

                    //TBD
                    /*
                    if "Sales Shipment Header".Structure = 'ST' then
                        SalesLine.Reset;
                    SalesLine.SetRange(SalesLine."Document No.", "Sales Shipment Line"."Order No.");
                    if SalesLine.FindFirst then
                        ServiceTax := ServiceTax + SalesLine."Service Tax Amount";
                    Ecess := Ecess + SalesLine."Service Tax eCess Amount";
                    SheCess := SheCess + SalesLine."Service Tax SHE Cess Amount";
                    */

                    LineTotAmt := ServiceTax + Ecess + SheCess + "Sales Shipment Line"."Unit Price";
                end;
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
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
        STNo: Text[100];
        Category: Text[100];
        CompanyInfo: Record "Company Information";
        SalesInv: Record "Sales Header";
        ServiceTax: Decimal;
        Ecess: Decimal;
        SheCess: Decimal;
        TotAmount: Decimal;
        LineAmount: Decimal;
        Inwords: Text[1024];
        intprint: Decimal;
        SalesLine: Record "Sales Line";
        Desc: Text[500];
        SalesShipLine: Record "Sales Shipment Line";
        MaxLength: Integer;
        Desc1: Text[80];
        Desc2: Text[160];
        Desc3: Text[240];
        Desc4: Text[320];
        Desc5: Text[400];
        Desc6: Text[500];
        LineTotAmt: Decimal;
        NumberText: array[2] of Text[1024];
        CheckReport: Report Check;
        MEMO_OF_FEESCaptionLbl: Label 'MEMO OF FEES';
        Kind_Attn_CaptionLbl: Label 'Kind Attn:';
        Case_ID_CaptionLbl: Label 'Case ID:';
        PAN_NO_CaptionLbl: Label 'PAN NO:';
        KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl: Label 'KINDLY PAY IN FAVOUR OF ''LAKSHMI KUMARAN & SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        TOTALCaptionLbl: Label 'TOTAL';
        PAN_NO_Caption_Control1000000029Lbl: Label 'PAN NO:';
        NOTE_Please_remit_to_Account_No__00322430000225_with_HDFC_BANK_C_5_SAFDARJUNG_DEVELOPMENT_AREA__Lbl: Label 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322430000225 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBB. The name of the account holder is LAKSHMI KUMARAN AND SRIDHARAN';
        KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl: Label 'KINDLY PAY IN FAVOUR OF ''LAKSHMI KUMARAN & SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        TOTALCaption_Control1000000037Lbl: Label 'TOTAL';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        Service_Tax_AmountCaptionLbl: Label 'Service Tax (10%)';
        Service_Tax_eCess_AmountCaptionLbl: Label 'ECess (2%)';
        Service_Tax_SHE_Cess_AmountCaptionLbl: Label 'SHECess (1%)';
}

