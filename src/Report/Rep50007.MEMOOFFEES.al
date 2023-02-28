report 50007 "MEMO OF FEES"
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
    RDLCLayout = './res/MEMOOFFEES.rdlc';

    Caption = 'MEMO OF FEES';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(Inwords; Inwords)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
                AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1_; Round(LineTotAmt, 1))
            {
            }
            column(CompanyInfo__P_A_N__No__; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo__P_A_N__No___Control1000000047; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name_Control1000000048; CompanyInfo.Name)
            {
            }
            column(Inwords_Control1000000038; Inwords)
            {
            }
            column(CurrencyCode_Control1000000011; CurrencyCode)
            {
                AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                AutoFormatType = 1;
            }
            column(ROUND_LineTotAmt_1__Control1000000041; Round(LineTotAmt, 1))
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(PAN_NO_Caption; PAN_NO_CaptionLbl)
            {
            }
            column(KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaption; KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl)
            {
            }
            column(PAN_NO_Caption_Control1000000043; PAN_NO_Caption_Control1000000043Lbl)
            {
            }
            column(DataItem1000000045; NOTE___Please_note_Service_Tax__of_NotifiLbl)
            {
            }
            column(DataItem1000000025; KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl)
            {
            }
            column(TOTALCaption_Control1000000012; TOTALCaption_Control1000000012Lbl)
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
                    column(Sales_Invoice_Header___No________________Sales_Invoice_Header___Shortcut_Dimension_1_Code_; "Sales Invoice Header"."No." + '' + ' - ' + '' + "Sales Invoice Header"."Shortcut Dimension 1 Code")
                    {
                    }
                    column(FORMAT__Sales_Invoice_Header___Posting_Date__0___Day_2____Month_Text____Year4___; Format("Sales Invoice Header"."Posting Date", 0, '<Day,2>, <Month Text>  <Year4>'))
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Contact_; "Sales Invoice Header"."Ship-to Contact")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Name_______Sales_Invoice_Header___Ship_to_Name_2_; "Sales Invoice Header"."Ship-to Name" + ' ' + "Sales Invoice Header"."Ship-to Name 2")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address_; "Sales Invoice Header"."Ship-to Address")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address_2_; "Sales Invoice Header"."Ship-to Address 2")
                    {
                    }
                    column(PostOffice_____CityN_________PinCode1; PostOffice + ' ' + CityN + '  -  ' + PinCode1)
                    {
                    }
                    column(Sales_Invoice_Header___State_Name_; "Sales Invoice Header"."State Name")
                    {
                    }
                    column(Sales_Invoice_Header___Shortcut_Dimension_2_Code_; "Sales Invoice Header"."Shortcut Dimension 2 Code")
                    {
                    }
                    column(Sales_Invoice_Header__District; "Sales Invoice Header".District)
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
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            //TBD
                            /*
                            if Number = 1 then begin
                                if not PostedDocDim1.Find('-') then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo(
                                      '%1 %2', PostedDocDim1."Dimension Code", PostedDocDim1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        PostedDocDim1."Dimension Code", PostedDocDim1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until (PostedDocDim1.Next = 0);
                            */
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text1; Text1)
                        {
                        }
                        column(CurrencyCode_Control1000000024; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control70; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text2; Text2)
                        {
                        }
                        column(CurrencyCode_Control1000000040; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000044; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text3; Text3)
                        {
                        }
                        column(CurrencyCode_Control1000000050; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000051; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text4; Text4)
                        {
                        }
                        column(CurrencyCode_Control1000000054; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000055; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text5; Text5)
                        {
                        }
                        column(CurrencyCode_Control1000000058; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000059; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Text6; Text6)
                        {
                        }
                        column(CurrencyCode_Control1000000062; CurrencyCode)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmt_Control1000000063; LineAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AMOUNTCaption; AMOUNTCaptionLbl)
                        {
                        }
                        column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
                        {
                        }
                        column(ContinuedCaption; ContinuedCaptionLbl)
                        {
                        }
                        column(Sales_Invoice_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Sales_Invoice_Line_Line_No_; "Line No.")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            intPrint += 1;

                            // This code is created by ankit
                            "Sales Invoice Line".SetRange("Sales Invoice Line"."Document No.", "Sales Invoice Line"."Document No.");
                            //"Sales Invoice Line".SETRANGE("Tax Group Code","Sales Invoice Line"."Tax Group Code");
                            //TBD
                            /*
                            if ("Sales Invoice Line"."Tax Group Code" = 'V-04') or ("Sales Invoice Line"."Tax Group Code" = 'V-12.5') then
                                vatTax := vatTax + "Sales Invoice Line"."Tax Amount";
                            if ("Sales Invoice Line"."Tax Group Code" = 'C-04') or ("Sales Invoice Line"."Tax Group Code" = 'C-02') or
                            ("Sales Invoice Line"."Tax Group Code" = 'C-03') or ("Sales Invoice Line"."Tax Group Code" = 'C-10') then
                                cstTax := cstTax + "Sales Invoice Line"."Tax Amount";
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
                            LineAmt := "Sales Invoice Line"."Line Amount";
                            LineTotAmt := LineTotAmt + LineAmt;
                            //TBD
                            /*
                            StructureLineDetails.Reset;
                            StructureLineDetails.SetRange(Type, StructureLineDetails.Type::Sale);
                            StructureLineDetails.SetRange("Document Type", StructureLineDetails."Document Type"::Invoice);
                            StructureLineDetails.SetRange("Invoice No.", "Document No.");
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
                                    if (not (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise)) then
                                        LineTotAmt := LineTotAmt + Abs(StructureLineDetails.Amount);

                                    //2021 VAT %age has been removed from new version with vat%
                                    //EISINT-003 EIS.240 EISINT ILG-059 10May05 BEGIN
                                    //    IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::VAT THEN
                                    begin
                                        VATAmt := VATAmt + StructureLineDetails.Amount;
                                        //EISINT-003.EIS.240.EISINT ILG-059.07Jul05 BEGIN
                                        if "Sales Invoice Line"."VAT %" = 4.0 then
                                            VATFG := VATFG + StructureLineDetails.Amount
                                        else
                                            if "Sales Invoice Line"."VAT %" = 12.5 then
                                                "VAT12.5" := "VAT12.5" + StructureLineDetails.Amount
                                            else
                                                if "Sales Invoice Line"."VAT %" = 10.0 then
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


                            if "Sales Invoice Line".Type = 1 then
                                "Sales Invoice Line"."No." := '';




                            //TEAM::4216
                            //FOR X:=1 TO 2000 DO
                            //Sno[X]:='';
                            Sno := '';
                            valentry.SetRange(valentry."Document No.", "Document No.");
                            valentry.SetRange(valentry."Item No.", "Sales Invoice Line"."No.");
                            valentry.SetRange(valentry.Adjustment, false);

                            if valentry.Find('-') then begin
                                repeat

                                    //X:=1;
                                    itemledentry.SetRange(itemledentry."Entry No.", valentry."Item Ledger Entry No.");
                                    itemledentry.SetRange(itemledentry."Item No.", valentry."Item No.");
                                    //Sno:='';
                                    if itemledentry.Find('-') then begin
                                        //MESSAGE(FORMAT(itemledentry."Entry No."));
                                        //X+=1;
                                        Sno := Sno + ', ' + itemledentry."Serial No.";



                                    end;
                                until valentry.Next = 0;
                            end;
                            //MESSAGE(FORMAT(Sno[X]));

                            //TEAM::4216
                            //TEAM::1426 Invoice Discription Statr

                            //Desc := '';
                            Text1 := '';
                            Text2 := '';
                            Text3 := '';
                            Text4 := '';
                            Text5 := '';
                            Text6 := '';
                            SaleInv.Reset;
                            SaleInv.SetRange(SaleInv."Document No.", "Document No.");
                            SaleInv.SetRange(SaleInv."Line No.", "Line No.");
                            if SaleInv.Find('-') then
                                Desc := SaleInv."Other Detail 1" + ' ' + SaleInv."Other Detail 2";
                            maxlength := StrLen(Desc);
                            //MESSAGE('%1',maxlength);
                            //END;

                            if maxlength <= 80 then
                                Text1 := Desc;
                            //END;

                            if (maxlength > 80) and (maxlength <= 160) then
                                Text2 := Desc;
                            //END ;

                            if (maxlength > 160) and (maxlength <= 240) then
                                Text3 := Desc;
                            //END ;

                            if (maxlength > 240) and (maxlength <= 320) then
                                Text4 := Desc;
                            //END;

                            if (maxlength > 320) and (maxlength <= 400) then
                                Text5 := Desc;
                            //END ;
                            if (maxlength > 400) then
                                Text6 := Desc;
                            //END ;

                            if "Sales Invoice Header"."Currency Code" = '' then
                                CurrencyCode := 'Rs.'
                            else
                                CurrencyCode := "Sales Invoice Header"."Currency Code";
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
                }
                dataitem("Integer"; "Integer")
                {
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        intPrint := 8 - intPrint;
                        SetRange(Number, 0, intPrint);
                    end;
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

                    LocationText := CopyStr("Sales Invoice Header"."Location Code", 1, 3);

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

                    if Location1.Get("Sales Invoice Header"."Location Code") then begin
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
                    if not CurrReport.Preview then
                        SalesInvCountPrinted.Run("Sales Invoice Header");
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
                //3K CurrReport.Language := Language.GetLanguageID("Language Code");
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                CompanyInfo.Get;

                if RespCenter.Get("Responsibility Center") then begin
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else begin
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                end;


                //TBD
                /*
                PostedDocDim1.SetRange("Table ID", DATABASE::"Sales Invoice Header");
                PostedDocDim1.SetRange("Document No.", "Sales Invoice Header"."No.");
                */

                if "Order No." = '' then
                    OrderNoText := ''
                else
                    OrderNoText := FieldCaption("Order No.");
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
                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
                Cust.Get("Bill-to Customer No.");

                if "Payment Terms Code" = '' then
                    PaymentTerms.Init
                else
                    PaymentTerms.Get("Payment Terms Code");
                if "Shipment Method Code" = '' then
                    ShipmentMethod.Init
                else
                    ShipmentMethod.Get("Shipment Method Code");

                //TBD //FormatAddr.SalesInvShipTo(ShipToAddr, "Sales Invoice Header");
                FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, "Sales Invoice Header"); //3k-UPG
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
                CityN := "Sales Invoice Header"."Ship-to City";
                PinCode1 := "Sales Invoice Header"."Ship-to Post Code";
                PostOffice := "Sales Invoice Header"."Post Office";

            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;  // NAVIN
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
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
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
        slinvln: Record "Sales Invoice Line";
        Sno: Text[1024];
        itemledentry: Record "Item Ledger Entry";
        valentry: Record "Value Entry";
        X: Integer;
        ServiceTaxAmt: Decimal;
        CurrencyCode: Text[30];
        intPrint: Integer;
        PostOffice: Text[100];
        Text1: Text[90];
        Text2: Text[170];
        Text3: Text[280];
        Text4: Text[330];
        Text5: Text[450];
        Text6: Text[525];
        SaleInv: Record "Sales Invoice Line";
        maxlength: Integer;
        TOTALCaptionLbl: Label 'TOTAL';
        PAN_NO_CaptionLbl: Label 'PAN NO:';
        KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__AND_QUOTE_THIS_MEMO_NO__WHILE_MAKING_PAYMENTCaptionLbl: Label 'KINDLY PAY IN FAVOUR OF ''LAKSHMI KUMARAN & SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        PAN_NO_Caption_Control1000000043Lbl: Label 'PAN NO:';
        NOTE___Please_note_Service_Tax__of_NotifiLbl: Label 'NOTE:Please remit through Telegraphic Transfer to Account No. 00322430000225 with HDFC BANK C-5 SAFDARJUNG DEVELOPMENT AREA, NEW DELHI - 110016, INDIA SWIFT CODE : HDFC INBB. The name of the account holder is LAKSHMI KUMARAN AND SRIDHARAN';
        KINDLY_PAY_IN_FAVOUR_OF__LAKSHMI_KUMARAN___SRIDHARAN__Lbl: Label 'KINDLY PAY IN FAVOUR OF ''LAKSHMI KUMARAN & SRIDHARAN'' AND QUOTE THIS MEMO NO. WHILE MAKING PAYMENT';
        TOTALCaption_Control1000000012Lbl: Label 'TOTAL';
        Kind_Attn_CaptionLbl: Label 'Kind Attn:';
        MEMO_OF_FEESCaptionLbl: Label 'MEMO OF FEES';
        Case_ID_CaptionLbl: Label 'Case ID:';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        ContinuedCaptionLbl: Label 'Continued';


    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;
}

