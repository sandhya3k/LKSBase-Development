report 50148 "Draft Invoice GST"
{
    // //EIS.240 EISINT_003.080405 Modification made in Std. Invoice to enable multiple copies of the Invoice.
    // //EISINT-003 EIS.240 EISINT ILG-059 10May05. Modifications made in order to show the VAT Amount Breakup
    // //EISINT-003.E-240.EISINT ILG-082#25/05/05 -Modifications made in order to change the address if location code is either
    //                                            -AHD-TRA or AHW-TRA
    // //EISINT-003.E-240.EISINT ILG-085#29/05/05 -changes made to enable the flow of Security Filters in the S&R Reports.
    // //EISINT-003.EIS.240.EISINT ILG-059.07Jul05. Modifications made in order to pick the VAT %age from the Sales Invoice Line
    // //EISINT-003.E-240.EISINT ILG-127-Modifications made to generate seperate Terms & Conditions for MUM-TRA.
    // //E-244 Added this code on 030905 to get City NamE
    DefaultLayout = RDLC;
    RDLCLayout = './res/DraftInvoiceGST.rdlc';

    Caption = 'MEMO OF FEES';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Header';
            column(HSNDESC; HSNDESC)
            {
            }
            column(CategoryDesc; CategoryDesc)
            {
            }
            column(Rental; Rental)
            {
            }
            column(BankDet; BankDet)
            {
            }
            column(CaptiontobeAdded; CaptiontobeAdded)
            {
            }
            column(SelectOption; OptionMultiple)
            {
            }
            column(DataItem1000000038; KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl)
            {
            }
            column(LineTotAmt; Round(LineTotAmt))
            {
            }
            column(place1; place1)
            {
            }
            column(DataItem1000000018; Direct_remittance_Details__003Lbl)
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Currency Code")
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
            column(CurrencyCode; CurrencyCode)
            {
                AutoFormatExpression = "Sales Header"."Currency Code";
                AutoFormatType = 1;
            }
            column(ShortcutDimension1Code_SalesInvoiceHeader; "Shortcut Dimension 1 Code")
            {
            }
            column(RecipientGSTNo; RecipientGST)
            {
            }
            column(SupplierGSTRegNo; RecLocation."GST Reg No.")
            {
            }
            column(CustState; State)
            {
            }
            column(LocationCode_SalesInvoiceHeader; StateDesc)
            {
            }
            column(State_Code; State_Code)
            {
            }
            column(ROUND_LineTotAmt_1_; Round(LineTotAmt, 1))
            {
            }
            column(CompanyInfo__P_A_N__No___Control1000000036; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name_Control1000000037; CompanyInfo.Name)
            {
            }
            column(Inwords_Control1000000044; Inwords)
            {
            }
            column(CurrencyCode_Control1000000047; CurrencyCode)
            {
                AutoFormatExpression = "Sales Header"."Currency Code";
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1__Control1000000048; Round(LineTotAmt, 1))
            {
            }
            column(Inwords_Control1000000009; Inwords)
            {
            }
            column(CompanyInfo__P_A_N__No___Control1000000019; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name_Control1000000042; CompanyInfo.Name)
            {
            }
            column(CurrencyCode_Control1000000060; CurrencyCode)
            {
                AutoFormatExpression = "Sales Header"."Currency Code";
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1__Control1000000086; Round(LineTotAmt, 1))
            {
            }
            column(Inwords_Control1000000087; Inwords)
            {
            }
            column(CompanyInfo__P_A_N__No___Control1000000090; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name_Control1000000092; CompanyInfo.Name)
            {
            }
            column(CurrencyCode_Control1000000096; CurrencyCode)
            {
                AutoFormatExpression = "Sales Header"."Currency Code";
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1__Control1000000097; Round(LineTotAmt, 1))
            {
            }
            column(PAN_NO_Caption; PAN_NO_CaptionLbl)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__V_SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption; KINDLY_PAY_IN_FAVOUR_OF__V_SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(DataItem1000000024; Direct_remittance_Details__INLbl)
            {
            }
            column(DataItem1000000025; NOTE___Please_note_Service_Tax__of_NotifiLbl)
            {
            }
            column(PAN_NO_Caption_Control1000000034; PAN_NO_Caption_Control1000000034Lbl)
            {
            }
            column(DataItem1000000035; Direct_remittance_Details__000Lbl)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption; KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl)
            {
            }
            column(Structure_SalesInvoiceHeader; '')
            {
            }
            column(TOTALCaption_Control1000000045; TOTALCaption_Control1000000045Lbl)
            {
            }
            column(PAN_NO_Caption_Control1000000015; PAN_NO_Caption_Control1000000015Lbl)
            {
            }
            column(DataItem1000000022; Direct_remittance_Details__001Lbl)
            {
            }
            column(TOTALCaption_Control1000000054; TOTALCaption_Control1000000054Lbl)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000055; KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000055Lbl)
            {
            }
            column(PAN_NO_Caption_Control1000000089; PAN_NO_Caption_Control1000000089Lbl)
            {
            }
            column(DataItem1000000091; Direct_remittance_Details__002Lbl)
            {
            }
            column(TOTALCaption_Control1000000093; TOTALCaption_Control1000000093Lbl)
            {
            }
            column(Account_No0322430000225; Account_No__00322430000225)
            {
            }
            column(Account_No00322440000056; Account_No__00322440000056)
            {
            }
            column(Account_No00322260000031; Account_No__00322260000031)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000094; KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000094Lbl)
            {
            }
            column(Country_Name; CountryName)
            {
            }
            column(City_Name; CityName)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(Sales_Invoice_Header___No__; "Sales Header"."No.")
                    {
                    }
                    column(FORMAT__Sales_Invoice_Header___Posting_Date__0___Day_2_____Month_Text____Year4___; Format("Sales Header"."Posting Date", 0, '<Day,2>,  <Month Text>  <Year4>'))
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Contact_; "Sales Header"."Ship-to Contact")
                    {
                    }
                    column(Sales_Invoice_Header___Sell_to_Customer_Name________Sales_Invoice_Header___Sell_to_Customer_Name_2_; "Sales Header"."Sell-to Customer Name" + '  ' + "Sales Header"."Sell-to Customer Name 2")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address________Sales_Invoice_Header___Ship_to_Address_2_; "Sales Header"."Ship-to Address" + ' ' + "Sales Header"."Ship-to Address 2")
                    {
                    }
                    column(DataItem1000000013; "Sales Header".District + '  ' + "Sales Header"."State Name" + '  ' + "Sales Header"."Sell-to Country/Region Code")
                    {
                    }
                    column(Sales_Invoice_Header___Post_Office_______Sales_Invoice_Header___Ship_to_City______PinCode1; ShiptoPostCode)
                    {
                    }
                    column(STNo; STNo)
                    {
                    }
                    column(Category_of_Service__________Category; 'Category of Service :-' + '  ' + Category)
                    {
                    }
                    column(Mobile; Mobile)
                    {
                    }
                    column(Sales_Invoice_Header___Shortcut_Dimension_2_Code_; "Sales Header"."Shortcut Dimension 2 Code")
                    {
                    }
                    column(Kind_Attn_Caption; Kind_Attn_CaptionLbl)
                    {
                    }
                    column(MEMO_OF_FEESCaption; MEMO_OF_FEESCaptionLbl)
                    {
                    }
                    column(Case_ID_Caption; Case_ID_CaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    column(StateCodeVar; StateCodeVar)
                    {
                    }
                    column(DestinationVar; DestinationVar)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            /*
                            IF Number = 1 THEN BEGIN
                              IF NOT PostedDocDim1.FIND('-') THEN
                                CurrReport.BREAK;
                            END ELSE
                              IF NOT Continue THEN
                                CurrReport.BREAK;
                            
                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO(
                                  '%1 %2',PostedDocDim1."Dimension Code",PostedDocDim1."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 %3',DimText,
                                    PostedDocDim1."Dimension Code",PostedDocDim1."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (PostedDocDim1.NEXT = 0);
                             */

                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document No." = FIELD("No."), "Document Type" = FIELD("Document Type");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Description_SalesInvoiceLine; Description)
                        {
                        }
                        column(Text1; Text1)
                        {
                        }
                        column(LineAmt_Control1000000063; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(amt_wrds; words[1])
                        {
                        }
                        column(CurrencyCode_Control1000000064; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Text2; Text2)
                        {
                        }
                        column(CurrencyCode_Control1000000068; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000069; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Text3; Text3)
                        {
                        }
                        column(CurrencyCode_Control1000000076; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000077; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Text4; Text4)
                        {
                        }
                        column(CurrencyCode_Control1000000080; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000081; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Text5; Text5)
                        {
                        }
                        column(CurrencyCode_Control1000000072; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000073; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Text6; Text6)
                        {
                        }
                        column(CurrencyCode_Control1000000084; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000085; LineAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(OtherDetail1_SalesInvoiceLine; "Other Detail 1")
                        {
                        }
                        column(OtherDetail2_SalesInvoiceLine; "Other Detail 2")
                        {
                        }
                        column(CurrencyCode_Control1000000026; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(CurrencyCode_Control1000000027; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxAmt; ServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxECessAmt; ServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(CurrencyCode_Control1000000028; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxSHECessAmt; ServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AMOUNTCaption; AMOUNTCaptionLbl)
                        {
                        }
                        column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
                        {
                        }
                        column(Desc; Desc)
                        {
                        }
                        column(LineNo; LineNo)
                        {
                        }
                        column(ServiceTaxAmount_SalesInvoiceLine; 0)
                        {
                        }
                        column(ServiceTaxeCessAmount_SalesInvoiceLine; 0)
                        {
                        }
                        column(ServiceTaxSHECessAmount_SalesInvoiceLine; 0)
                        {
                        }
                        column(ContinuedCaption; ContinuedCaptionLbl)
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
                        column(Sales_Invoice_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Sales_Invoice_Line_Line_No_; "Line No.")
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                            trigger OnAfterGetRecord()
                            begin
                                /*
                                IF Number = 1 THEN BEGIN
                                  IF NOT PostedDocDim2.FIND('-') THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',PostedDocDim2."Dimension Code",PostedDocDim2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        PostedDocDim2."Dimension Code",PostedDocDim2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (PostedDocDim2.NEXT = 0);
                                 */

                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange(Number, 1, X);


                                if not ShowInternalInfo then
                                    CurrReport.Break;

                                //PostedDocDim2.SETRANGE("Table ID",DATABASE::"Sales Invoice Line");
                                //PostedDocDim2.SETRANGE("Document No.","Sales Invoice Line"."Document No.");
                                //PostedDocDim2.SETRANGE("Line No.","Sales Invoice Line"."Line No.");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            intPrint += 1;
                            // This code is created by ankit

                            "Sales Line".SetRange("Sales Line"."Document No.", "Sales Line"."Document No.");
                            //"Sales Invoice Line".SETRANGE("Tax Group Code","Sales Invoice Line"."Tax Group Code");
                            //TBD
                            /*
                            if ("Sales Line"."Tax Group Code" = 'V-04') or ("Sales Line"."Tax Group Code" = 'V-12.5') then
                                vatTax := vatTax + "Sales Line"."Tax Amount";
                            if ("Sales Line"."Tax Group Code" = 'C-04') or ("Sales Line"."Tax Group Code" = 'C-02') or
                            ("Sales Line"."Tax Group Code" = 'C-03') or ("Sales Line"."Tax Group Code" = 'C-10') then
                                cstTax := cstTax + "Sales Line"."Tax Amount";
                            */
                            //IF "Sales Invoice Line"."Tax Group Code" = ''  THEN
                            //varr1:=varr1+0;

                            //................


                            if (Type = Type::"G/L Account") and (not ShowInternalInfo) then
                                // "No." := '';
                                //1540 START
                                VATAmountLine.Init;
                            //VATAmountLine."Tax Identifier" := "VAT Identifier";
                            //VATAmountLine."Tax Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            //VATAmountLine."Tax %" := "VAT %";
                            //VATAmountLine."Tax Base" := Amount;
                            //VATAmountLine."Amount Including Tax" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            if "Allow Invoice Disc." then
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            //message('%1',"Inv. Discount Amount");
                            VATAmountLine.InsertLine;

                            //1540 END
                            // NAVIN
                            //LineAmt := Quantity * "Unit Price";
                            LineAmt := "Sales Line"."Line Amount";
                            //MESSAGE('%1',LineAmt);
                            LineTotAmt := LineTotAmt + LineAmt;
                            //MESSAGE('%1',LineTotAmt);
                            //TBD
                            /*
                            StructureLineDetails.Reset;
                            StructureLineDetails.SetRange(Type, StructureLineDetails.Type::Sale);
                            StructureLineDetails.SetRange("Document Type", StructureLineDetails."Document Type");
                            StructureLineDetails.SetRange("Document No.", "Document No.");
                            StructureLineDetails.SetRange("Item No.", "No.");
                            StructureLineDetails.SetRange("Line No.", "Line No.");
                            if StructureLineDetails.Find('-') then
                                repeat
                                    if StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges then
                                        Charges := Charges + Abs(StructureLineDetails.Amount);
                                    if StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" then
                                        Othertaxes := Othertaxes + Abs(StructureLineDetails.Amount);
                                    if StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Sales Tax" then
                                        SalesTax := SalesTax + Abs(StructureLineDetails.Amount);
                                    //    IF (NOT(StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise)) THEN
                                    //      LineTotAmt := LineTotAmt + ROUND((StructureLineDetails.Amount),1);
                                    LineTotAmt := LineTotAmt + "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount";
                                    //2021 VAT %age has been removed from new version with vat%
                                    //EISINT-003 EIS.240 EISINT ILG-059 10May05 BEGIN
                                    if StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Service Tax" then begin
                                        VATAmt := VATAmt + StructureLineDetails.Amount;
                                        //EISINT-003.EIS.240.EISINT ILG-059.07Jul05 BEGIN
                                        if "Sales Line"."VAT %" = 4.0 then
                                            VATFG := VATFG + StructureLineDetails.Amount
                                        else
                                            if "Sales Line"."VAT %" = 12.5 then
                                                "VAT12.5" := "VAT12.5" + StructureLineDetails.Amount
                                            else
                                                if "Sales Line"."VAT %" = 10.0 then
                                                    VAT10 := VAT10 + StructureLineDetails.Amount;
                                    end
                                    //2021 VAT %age has been removed from new version with vat%
                                    //EISINT-003.EIS.240.EISINT ILG-059.07Jul05 END
                                until StructureLineDetails.Next = 0;
                            */
                            if VATFG <> 0.0 then
                                VATText1 := 'VAT4%'
                            else
                                VATText1 := '';

                            if "VAT12.5" <> 0.0 then
                                VATText2 := 'VAT12.5%'
                            else
                                VATText2 := '';

                            if VAT10 <> 0.0 then
                                VATText3 := 'VAT10%'
                            else
                                VATText3 := '';
                            //EISINT-003 EIS.240 EISINT ILG-059 10May05 BEGIN
                            // NAVIN
                            // VISU
                            //TBD
                            /*
                            ExciseAmount += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                            "NCCD Amount" + "eCess Amount" + "ADET Amount";
                            LineTotAmt += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                          "NCCD Amount" + "eCess Amount" + "ADET Amount";
                            */
                            // VISU


                            if "Sales Line".Type = 1 then
                                "Sales Line"."No." := '';

                            //TEAM::1426
                            //Desc := '';
                            Text1 := '';
                            Text2 := '';
                            Text3 := '';
                            Text4 := '';
                            Text5 := '';
                            Text6 := '';
                            Text7 := '';

                            SaleInv.Reset;
                            SaleInv.SetRange(SaleInv."Document No.", "Document No.");
                            SaleInv.SetRange(SaleInv."Line No.", "Line No.");
                            if SaleInv.Find('-') then
                                Desc := SaleInv."Other Detail 1" + ' ' + SaleInv."Other Detail 2";
                            MaxLength := StrLen(Desc);
                            //MESSAGE('%1',MaxLength);
                            //END;
                            //Merge Lines
                            LineNo := "Sales Line"."Line No.";
                            if "Sales Line"."Merge Lines" then begin
                                SaleInv.SetRange(SaleInv."Line No.");
                                SaleInv.SetFilter("Merge Description", '<>%1', '');
                                SaleInv.SetRange("Merge Lines", true);
                                if SaleInv.FindFirst then
                                    Desc := SaleInv."Merge Description" + SaleInv."Merge Description 2"
                                else
                                    Desc := '';
                                MaxLength := StrLen(Desc);
                                LineNo := -1;
                            end;
                            //Merge Lines

                            if (MaxLength > 5) and (MaxLength <= 80) then
                                Text1 := Desc;
                            //END;

                            if (MaxLength > 80) and (MaxLength <= 160) then
                                Text2 := Desc;
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



                            if "Sales Header"."Currency Code" = '' then
                                CurrencyCode := 'Rs.'
                            else
                                CurrencyCode := "Sales Header"."Currency Code";
                            //  message('%1',CurrencyCode);
                            //  TEAM::1426
                            //amtw+=LineAmt;
                            //check.InitTextVariable;
                            //check.FormatNoText(words,amtw,'');
                            //TBD //CurrReport.ShowOutput := "Sales Header"."Currency Code" = '';
                            //2021 For Showing description
                            CheckReport.InitTextVariable;
                            //CheckReport.FormatNoText(NumberText,"Sales Invoice Line"."Amount Including Tax","Sales Invoice Header"."Currency Code");
                            CheckReport.FormatNoText(NumberText, Round(LineTotAmt, 1), "Sales Header"."Currency Code");
                            //CheckReport.FormatNoText(NumberText, "Sales. Inv. Line"."Amount Including Tax","Purch. Inv. Header"."Currency Code");

                            Inwords := NumberText[1];
                            //place1:='CurrencyCode'+LineAmt ;
                        end;

                        trigger OnPostDataItem()
                        begin
                            //EISINT-003 EIS.240 EISINT ILG-059 18/05/05 BEGIN
                            VATFG := 0.0;
                            "VAT12.5" := 0.0;
                            VAT10 := 0.0;
                            //EISINT-003 EIS.240 EISINT ILG-059 18/05/05 END
                        end;

                        trigger OnPreDataItem()
                        begin
                            // NAVIN
                            LineTotAmt := 0;
                            ExciseAmount := 0;
                            Charges := 0;
                            Othertaxes := 0;
                            SalesTax := 0;
                            // NAVIN

                            vatTax := 0;
                            cstTax := 0;
                            varr1 := 0;


                            VATAmountLine.DeleteAll;
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break;
                            SetRange("Line No.", 0, "Line No.");

                            // NAVIN
                            //CurrReport.CREATETOTALS("Line Amount",Amount,"Amount Including VAT","Inv. Discount Amount");
                            //TBD
                            /*
                            CurrReport.CreateTotals("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount",
                            "Line Discount Amount", "Inv. Discount Amount", "Amount Including Excise",
                            "Amount Including Tax", "Excise Amount", "Tax Base Amount");
                            CurrReport.CreateTotals(LineAmt);
                            // NAVIN
                            CurrReport.CreateTotals("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount", "Excise Amount", "Tax Amount",
                              "Service Tax Amount", "Service Tax eCess Amount", "Amount To Customer");
                            CurrReport.CreateTotals("Service Tax SHE Cess Amount");
                            */
                        end;
                    }
                    dataitem("Integer"; "Integer")
                    {
                        column(Integer_Number; Number)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            intPrint := 6 - intPrint;
                            SetRange(Number, 0, intPrint);
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //EISINT-003.E-240.EISINT ILG-082#25/05/05 BEGIN
                    AHDCaption := '';
                    LST := '';
                    CST := '';
                    PAN := '';
                    LTEG := '';
                    wName1 := '';
                    wName2 := '';
                    wAddress2 := '';
                    wAddress1 := '';
                    wPhone1 := '';
                    wPhone2 := '';
                    wFax1 := '';
                    wCity1 := '';

                    LocationText := CopyStr("Sales Header"."Location Code", 1, 3);

                    if LocationText = 'AHD' then begin
                        AHDCaption := 'WAREHOUSE ADDRESS';
                        if Location1.Get('AHW-TRA') then begin
                            wName1 := Location1.Name;
                            wName2 := Location1."Name 2";
                            wAddress1 := Location1.Address;
                            wAddress2 := Location1."Address 2";
                            wCity1 := Location1.City;
                            wPhone1 := Location1."Phone No.";
                            wPhone2 := Location1."Phone No. 2";
                            wFax1 := Location1."Fax No.";
                            Location1.Reset;
                        end
                    end

                    else
                        if LocationText = 'AHW' then begin
                            if Location1.Get('AHD-TRA') then begin
                                AHDCaption := 'AHD COMPANY ADDRESS';
                                wName1 := Location1.Name;
                                wName2 := Location1."Name 2";
                                wAddress1 := Location1.Address;
                                wAddress2 := Location1."Address 2";
                                wCity1 := Location1.City;
                                wPhone1 := Location1."Phone No.";
                                wPhone2 := Location1."Phone No. 2";
                                wFax1 := Location1."Fax No.";
                                Location1.Reset;
                            end
                        end;

                    if Location1.Get("Sales Header"."Location Code") then begin
                        Name1 := Location1.Name;
                        Name2 := Location1."Name 2";
                        Address1 := Location1.Address;
                        Address2 := Location1."Address 2";
                        City1 := Location1.City;
                        PostCode1 := Location1."Post Code";//2021 Added For BMT
                        Phone1 := Location1."Phone No.";
                        Phone2 := Location1."Phone No. 2";
                        Fax1 := Location1."Fax No.";
                        //TBD
                        /*
                        LST := Location1."L.S.T. No.";
                        CST := Location1."C.S.T No.";
                        */
                        //PAN:=Location1."P.A.N No.";
                        //LTEG:=Location1."L.T.E.G. No";
                        //TBD //TIN := Location1."T.I.N. No.";
                    end;
                    //EISINT-003.E-240.EISINT ILG-082#25/05/05 END
                    /*
                    IF Number > 1 THEN
                      CopyText := Text003;
                    CurrReport.PAGENO := 1;
                    */

                    //EIS.240 EISINT_003 080405 Begin
                    if Number = 1 then
                        CopyText := Text010;
                    if Number > 1 then
                        if (Number / 2) = 1 then
                            CopyText := Text007;
                    if (Number / 3) = 1 then
                        CopyText := Text008;
                    if (Number / 4) = 1 then
                        CopyText := Text009;
                    CurrReport.PageNo := 1;
                    //EIS.240 EISINT_003 080405 End

                end;

                trigger OnPostDataItem()
                begin
                    //IF NOT CurrReport.PREVIEW THEN
                    SalesInvCountPrinted.Run("Sales Header");
                end;

                trigger OnPreDataItem()
                begin

                    NoOfLoops := Abs(NoOfCopies) + Cust."Invoice Copies" + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                counter := counter + 1;
                CurrReport.Language := Language.GetLanguageID("Language Code");

                CompanyInfo.Get;

                if RespCenter.Get("Responsibility Center") then begin
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else begin
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                end;


                if UpperCase(CompanyName) = 'V.SRIDHARAN' then
                    BankDet := 'NOTE:Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, '
                    + 'NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004 IFSC Code HDFC0000032. The name ofthe account holder is V. SRIDHARAN'
                else
                    if UpperCase(CompanyName) = 'V.LAKSHMIKUMARAN' then
                        BankDet := 'NOTE:Direct remittance Details - Account No. 00322260000014 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, '
                      + 'NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004 IFSC Code HDFC0000032. The name ofthe account holder is V. Lakshmikumaran'
                    else begin
                        if "Sales Header"."Currency Code" = 'USD' then
                            BankDet := 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322430000225 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account '
                            + 'holder isLAKSHMI KUMARAN AND SRIDHARAN. Intermediary Bank: JPMorgan Chase Bank, New York, Account No.: 0011406717,ABA Routing: 021000021, Swift Code: CHASUS33'
                        else
                            if "Sales Header"."Currency Code" = 'EUR' then
                                BankDet := 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322440000056 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account '
                                + 'holder isLAKSHMI KUMARAN AND SRIDHARAN. Intermediary Bank: JPMorgan Chase Bank, Germany, IBAN No:DE26501108006231602308, Swift Code: CHASDEFX, Account No: 6231602308'
                            else
                                if "Sales Header"."Currency Code" = 'GBP' then
                                    BankDet := 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322260000031 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account '
                                    + 'holder isLAKSHMI KUMARAN AND SRIDHARAN';
                    end;

                //PostedDocDim1.SETRANGE("Table ID",DATABASE::"Sales Invoice Header");
                //PostedDocDim1.SETRANGE("Document No.","Sales Invoice Header"."No.");
                /*
                IF "Order No." = '' THEN
                  OrderNoText := ''
                ELSE
                  OrderNoText := FIELDCAPTION("Order No.");
                */
                if "Salesperson Code" = '' then begin
                    SalesPurchPerson.Init;
                    SalesPersonText := '';
                end else begin
                    SalesPurchPerson.Get("Salesperson Code");
                    SalesPersonText := Text000;
                end;
                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := FieldCaption("Your Reference");
                if "VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := FieldCaption("VAT Registration No.");
                if "Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(Text001, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(Text002, GLSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(Text006, GLSetup."LCY Code");
                end else begin
                    TotalText := StrSubstNo(Text001, "Currency Code");
                    TotalInclVATText := StrSubstNo(Text002, "Currency Code");
                    TotalExclVATText := StrSubstNo(Text006, "Currency Code");
                end;
                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
                Cust.Get("Bill-to Customer No.");

                if "Payment Terms Code" = '' then
                    PaymentTerms.Init
                else
                    PaymentTerms.Get("Payment Terms Code");
                if "Shipment Method Code" = '' then
                    ShipmentMethod.Init
                else
                    ShipmentMethod.Get("Shipment Method Code");


                //TBD //FormatAddr.SalesHeaderShipTo(ShipToAddr, "Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, "Sales Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                for i := 1 to ArrayLen(ShipToAddr) do
                    if ShipToAddr[i] <> CustAddr[i] then
                        ShowShippingAddr := true;

                /*
                IF LogInteraction THEN
                  IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF "Bill-to Contact No." <> '' THEN
                      SegManagement.LogDocument(
                        4,"No.",0,0,DATABASE::Contact,"Bill-to Contact No.","Salesperson Code",
                        "Campaign No.","Posting Description")
                    ELSE
                      SegManagement.LogDocument(
                        4,"No.",0,0,DATABASE::Customer,"Bill-to Customer No.","Salesperson Code",
                        "Campaign No.","Posting Description");
                  END;
                
                */
                //E-244 Added this code on 030905 to get City NamE
                CityN := "Sales Header"."Ship-to City";
                PinCode1 := "Sales Header"."Ship-to Post Code";
                PostOffice := "Sales Header"."Post Office";



                ContactR.SetRange(ContactR."No.", "Sales Header"."Bill-to Contact No.");
                if ContactR.Find('-') then begin
                    Mobile := ContactR."Mobile Phone No.";
                    Phone := ContactR."Phone No.";
                end;
                //TEAM::1426
                //TBD
                /*
                ServiceTaxEntry.Reset;
                ServiceTaxEntry.SetFilter(ServiceTaxEntry."Document Type", 'Invoice');
                ServiceTaxEntry.SetRange(ServiceTaxEntry."Document No.", "No.");
                if ServiceTaxEntry.Find('-') then
                    STGroup := ServiceTaxEntry."Service Tax Group Code";
                // MESSAGE(STGroup);
                STCODE.Reset;
                STCODE.SetRange(STCODE.Code, STGroup);
                if STCODE.FindFirst then
                    Category := STCODE.Description;
                */
                //TEAM::1426

                //TEAM::2021--Begin--
                ShiptoAddress.SetRange(ShiptoAddress."Customer No.", "Sales Header"."Sell-to Customer No.");
                ShiptoAddress.SetRange(ShiptoAddress.Code, "Sales Header"."Ship-to Code");
                if ShiptoAddress.FindFirst then begin
                    CountryName := ShiptoAddress.Country;
                    ShipLocation := ShiptoAddress.Country;
                    RecipientGST := ShiptoAddress."GST Reg No.";
                    ShiptoPostCode := "Ship-to City" + ' ' + ShiptoAddress.District + ' ' + "Ship-to Post Code" + ' ' + ShipToStateName + ' ' + ShiptoAddress.Country;
                    //CityName := ShiptoAddress."State Name";
                end;
                //TEAM::2021--End--
                //IF RecCustomer.GET("Sell-to Customer No.") THEN;
                if RecLocation.Get("Location Code") then;

                //"Sales Invoice Header".GET("Sales Invoice Header".State)

                State_Code := '';
                Clear(StateDesc);
                /*
                IF REc_State.GET(ShipLocation) THEN BEGIN
                  State_Code:=REc_State."State Code for TIN";
                  StateDesc:=REc_State.Description;
                END;
                */
                StateDesc := ShiptoAddress.Country;
                REc_State.Reset;
                REc_State.SetRange(REc_State.Description, "Sales Header".ShipToStateName);
                if REc_State.FindFirst then
                    //StateCodeVar := "Sales Header".ShipToStateName+' - '+REc_State."State Code for TIN";
                    StateCodeVar := "Sales Header".ShipToStateName + ' - ' + REc_State."State Code (GST Reg. No.)";
                DestinationVar := StateCodeVar;

                if "Sales Header"."Currency Code" <> '' then
                    if "Sales Header"."Currency Code" <> 'INR' then begin
                        StateCodeVar := 'OUTSIDE INDIA';
                        DestinationVar := ShiptoAddress.Country;
                    end;

            end;

            trigger OnPreDataItem()
            begin
                if Rental = true then begin
                    CategoryDesc := 'RENTAL OR LEASING SERVICES';
                    HSNDESC := '9972'
                end
                else begin
                    CategoryDesc := 'LEGAL SERVICES';
                    HSNDESC := '9982'
                end;
                CompanyInfo.Get;  // NAVIN

                CaptiontobeAdded := 'KINDLY PAY IN FAVOUR OF "' + UpperCase(CompanyInfo.Name) + '" AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
                counter := 0;
                //TBD //CurrReport.CreateTotals(ServiceTaxEntry."Service Tax Amount");
                /*
                //EISINT-003.E-240.EISINT ILG-085#29/05/05 BEGIN
                "User ID":=USERID;
                UserSetup1.SETRANGE(UserSetup1."User ID","User ID");
                IF UserSetup1.FIND('-') THEN
                BEGIN
                IF (UserSetup1."Location Tree Range" <>'') THEN
                "Sales Invoice Header".SETFILTER("Location Tree Code",UserSetup1."Location Tree Range");
                IF(UserSetup1."Security Filter 2 Range"<>'') THEN
                "Sales Invoice Header".SETFILTER("Security Filter 2 Code",UserSetup1."Security Filter 2 Range");
                IF (UserSetup1."Security Filter 3 Range"<>'') THEN
                "Sales Invoice Header".SETFILTER("Security Filter 3 Code",UserSetup1."Security Filter 3 Range");
                IF (UserSetup1."Security Filter 4 Range"<>'')  THEN
                "Sales Invoice Header".SETFILTER("Security Filter 4 Code",UserSetup1."Security Filter 4 Range");
                END;
                //EISINT-003.E-240.EISINT ILG-085#29/05/05 END
                */

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(OptionMultiple; OptionMultiple)
                    {
                        Caption = 'Select';
                        ApplicationArea = All;
                    }
                    field("Rental/Leasing"; Rental)
                    {
                        ApplicationArea = All;
                    }
                }
            }
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
        GLSetup.Get;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
        /*
        IF GLSetup.GET THEN
        BEGIN
         UserSetup.RESET;
         UserSetup.SETRANGE(UserSetup."User ID",USERID);
          IF UserSetup.FIND('-') THEN
           BEGIN
            DimValues.SETRANGE(DimValues."Dimension Code",GLSetup."Location Tree Code");
            DimValues.SETFILTER(DimValues.Code,UserSetup."Location Tree Range");
               FormDimValue.GETRECORD(DimValues);
              //"Location Tree Code" :=DimValues.Code;
          END
        END;
        CLEAR(FormDimValue);
        */

    end;

    var
        Text000: Label 'Account Manager';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'TAX - INVOICE ';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        AppliedServiceTaxECessAmt: Decimal;
        AppliedServiceTaxSHECessAmt: Decimal;
        AppliedServiceTaxAmt: Decimal;
        CurrExchRate: Record "Currency Exchange Rate";
        ServiceTaxSHECessAmt: Decimal;
        ServiceTaxECessAmt: Decimal;
        "SUM": Decimal;
        NumberText: array[2] of Text[1024];
        CheckReport: Report Check;
        Inwords: Text[1024];
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        Cust: Record Customer;
        VATAmountLine: Record "VAT Amount Line" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Codeunit Language;
        SalesInvCountPrinted: Codeunit "Sales-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[1024];
        ShipToAddr: array[8] of Text[1024];
        CompanyAddr: array[8] of Text[1024];
        OrderNoText: Text[1024];
        SalesPersonText: Text[1024];
        VATNoText: Text[1024];
        ReferenceText: Text[1024];
        TotalText: Text[1024];
        TotalExclVATText: Text[1024];
        TotalInclVATText: Text[1024];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[1024];
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[1024];
        OldDimText: Text[1024];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        "-NAVIN-": Integer;
        TotalTaxAmount: Decimal;
        LineAmt: Decimal;
        LineTotAmt: Decimal;
        ExciseAmount: Decimal;
        Charges: Decimal;
        Othertaxes: Decimal;
        SalesTax: Decimal;
        Test: Integer;
        Location1: Record Location;
        LST: Code[30];
        CST: Code[30];
        PAN: Code[30];
        LTEG: Code[30];
        Text007: Label 'DUPLICATE';
        Text008: Label 'TRIPLICATE';
        Text009: Label 'QUADRIPULATE';
        counter: Integer;
        Text010: Label 'ORIGINAL';
        Name1: Text[1024];
        Name2: Text[1024];
        Address2: Text[1024];
        Address1: Text[1024];
        Phone1: Code[30];
        Phone2: Code[30];
        Fax1: Code[30];
        City1: Text[1024];
        TIN: Code[20];
        VATAmt: Decimal;
        VATFG: Decimal;
        "VAT12.5": Decimal;
        Item1: Record Item;
        VATProdGroup: Code[10];
        VAT10: Decimal;
        VATText1: Text[1024];
        VATText2: Text[1024];
        VATText3: Text[1024];
        LocationText: Text[1024];
        AHDCaption: Text[1024];
        wName1: Text[1024];
        wName2: Text[1024];
        wAddress2: Text[1024];
        wAddress1: Text[1024];
        wPhone1: Code[30];
        wPhone2: Code[30];
        wFax1: Code[30];
        wCity1: Text[1024];
        "User Id": Code[30];
        UserSetup1: Record "User Setup";
        UserFilter1: Code[20];
        UserFilter2: Code[20];
        UserFilter3: Code[20];
        UserFilter4: Code[20];
        "Contact Name": Text[1024];
        CityIn: Text[1024];
        DimValues: Record "Dimension Value";
        "-----------EIS----------------": Integer;
        wfSalesLine: Record "Sales Line";
        UserSetup: Record "User Setup";
        SalesLine1: Record "Sales Line";
        Caption1: Text[1024];
        Caption2: Text[1024];
        Caption3: Text[1024];
        Caption4: Text[1024];
        CityN: Text[1024];
        PinCode1: Code[10];
        Desc: Text[1024];
        Item: Record Item;
        ItemDesc: Text[1024];
        Add: Decimal;
        "----2021----": Integer;
        TaxAmt: Decimal;
        picture: Integer;
        var2: Text[1024];
        var1: Decimal;
        PostCode1: Code[10];
        cstTax: Decimal;
        vatTax: Decimal;
        varr1: Decimal;
        slinvln: Record "Sales Line";
        Sno: Text[1024];
        itemledentry: Record "Item Ledger Entry";
        valentry: Record "Value Entry";
        X: Integer;
        ServiceTaxAmt: Decimal;
        CurrencyCode: Text[30];
        ShipTOadd: Record "Ship-to Address";
        intPrint: Integer;
        PostOffice: Text[100];
        Desc1: Text[90];
        Desc2: Text[170];
        SaleInv: Record "Sales Line";
        Desc3: Text[250];
        Desc4: Text[330];
        Desc5: Text[410];
        Desc6: Text[490];
        MaxLength: Integer;
        Text1: Text[90];
        Text2: Text[170];
        Text3: Text[250];
        Text4: Text[330];
        Text5: Text[410];
        Text6: Text[510];
        STNo: Text[100];
        Category: Text[100];
        ContactR: Record Contact;
        Mobile: Text[30];
        Phone: Text[30];
        Text7: Text[30];
        STGroup: Text[100];
        STaxCat: Text[100];
        PAN_NO_CaptionLbl: Label 'PAN NO:';
        KINDLY_PAY_IN_FAVOUR_OF__V_SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl: Label 'KINDLY PAY IN FAVOUR OF ''V.SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        TOTALCaptionLbl: Label 'TOTAL';
        Direct_remittance_Details__INLbl: Label 'Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 110240004  IFSC Code HDFC0000032. The name of the account holder is V. SRIDHARAN';
        NOTE___Please_note_Service_Tax__of_NotifiLbl: Label 'NOTE: “Please note Service Tax, EDU. Cess and SHE Cess liability as Service Recipient in terms of Clause I (A) (iv) of Notification No.30/2012-ST dt. 20 June 2012.”';
        PAN_NO_Caption_Control1000000034Lbl: Label 'PAN NO:';
        Direct_remittance_Details__000Lbl: Label 'Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004  IFSC Code HDFC0000032. The name of the account holder is V. SRIDHARAN';
        KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl: Label 'KINDLY PAY IN FAVOUR OF ''V.SHRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        TOTALCaption_Control1000000045Lbl: Label 'TOTAL';
        PAN_NO_Caption_Control1000000015Lbl: Label 'PAN NO:';
        Direct_remittance_Details__001Lbl: Label 'Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004  IFSC Code HDFC0000032. The name of the account holder is V. SRIDHARAN';
        TOTALCaption_Control1000000054Lbl: Label 'TOTAL';
        KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000055Lbl: Label 'KINDLY PAY IN FAVOUR OF ''V.SHRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        PAN_NO_Caption_Control1000000089Lbl: Label 'PAN NO:';
        Direct_remittance_Details__002Lbl: Label 'Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004  IFSC Code HDFC0000032. The name of the account holder is V. SRIDHARAN';
        Direct_remittance_Details__003Lbl: Label 'Direct remittance Details - Account No. 00322260000024 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA, Account Type - Current, MICR - 1 1 0240004  IFSC Code HDFC0000032. The name of the account holder is Lakshmi Kumaran & Sridharan';
        TOTALCaption_Control1000000093Lbl: Label 'TOTAL';
        KINDLY_PAY_IN_FAVOUR_OF__V_SHRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption_Control1000000094Lbl: Label 'KINDLY PAY IN FAVOUR OF ''V.SHRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        Kind_Attn_CaptionLbl: Label 'Kind Attn:';
        MEMO_OF_FEESCaptionLbl: Label 'TAX INVOICE';
        Case_ID_CaptionLbl: Label 'Case ID:';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        ContinuedCaptionLbl: Label 'Continued';
        Service_Tax_AmountCaptionLbl: Label 'Service Tax (12%)';
        Service_Tax_eCess_AmountCaptionLbl: Label 'ECess (2%)';
        Service_Tax_SHE_Cess_AmountCaptionLbl: Label 'SHECess (1%)';
        check: Report Check;
        amtw: Decimal;
        words: array[2] of Text[250];
        KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl: Label 'KINDLY PAY IN FAVOUR OF ''LAKSHMI KUMARAN & SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        place1: Decimal;
        Account_No__00322430000225: Label 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322430000225 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account holder is LAKSHMI KUMARAN AND SRIDHARAN. Intermediary Bank: JPMorgan Chase Bank, New York, Account No.: 0011406717, ABA Routing: 021000021, Swift Code: CHASUS33';
        Account_No__00322440000056: Label 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322440000056 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account holder is LAKSHMI KUMARAN AND SRIDHARAN. Intermediary Bank: JPMorgan Chase Bank, Germany, IBAN No: DE26501108006231602308, Swift Code: CHASDEFX, Account No: 6231602308';
        Account_No__00322260000031: Label 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322260000031 with HDFC BANK C-5/32 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBBXXX. The name of the account holder is LAKSHMI KUMARAN AND SRIDHARAN. Intermediary Bank: JPMorgan Chase Bank, London, Account No: 111-35191, SORTCODE: 609242, Swift Code: CHASGB2L';
        "--2021--": Integer;
        ShiptoAddress: Record "Ship-to Address";
        CountryName: Text[100];
        CityName: Text[100];
        RecCustomer: Record Customer;
        RecLocation: Record Location;
        OptionMultiple: Option " ","ORIGINAL FOR RECIPIENT","DUPLICATE FOR SUPPLIER";
        RecipientGST: Code[16];
        ShipLocation: Text[100];
        REc_State: Record State;
        State_Code: Code[10];
        StateDesc: Text;
        ShiptoPostCode: Code[250];
        StateCodeVar: Code[100];
        DestinationVar: Text[100];
        CaptiontobeAdded: Text[100];
        BankDet: Text[1000];
        Rental: Boolean;
        CategoryDesc: Text[100];
        HSNDESC: Text[10];
        LineNo: Integer;


    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;
}

