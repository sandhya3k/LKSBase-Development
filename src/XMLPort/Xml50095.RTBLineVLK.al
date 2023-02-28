xmlport 50095 "RTB Line VLK"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\1000\RTBLine_V. Lakshmikumaran.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Line"; "Sales Line")
            {
                AutoUpdate = true;
                XmlName = 'SalesLines';
                textelement("<cddoc>")
                {
                    XmlName = 'cdDoc.';
                }
                textelement("<txtdesc>")
                {
                    XmlName = 'txtDesc.';
                }
                textelement("<txtitemdesc>")
                {
                    XmlName = 'txtitemDesc.';
                }
                fieldelement(Unit_of_Measure; "Sales Line"."Unit of Measure")
                {
                }
                textelement("<decquantity>")
                {
                    XmlName = 'decQuantity.';
                }
                textelement("<unitprice>")
                {
                    XmlName = 'UnitPrice.';
                }
                textelement("<lineamount>")
                {
                    XmlName = 'LineAmount.';
                }
                textelement("<otherdetail1>")
                {
                    XmlName = 'OtherDetail1.';
                }
                textelement("<otherdetail2>")
                {
                    XmlName = 'OtherDetail2.';
                }
                textelement("<supportingbillno>")
                {
                    XmlName = 'SupportingBillNo.';
                }
                textelement("<supportingbilldate>")
                {
                    XmlName = 'SupportingBillDate.';
                }
                textelement("<dateofexpense>")
                {
                    XmlName = 'DateofExpense.';
                }
                textelement("<servicetaxapplicable>")
                {
                    XmlName = 'ServiceTaxApplicable.';
                }

                trigger OnAfterInitRecord()
                begin
                    /*
                    //EVALUATE(VarUnitPrice,"<UnitPrice>");
                    EVALUATE(VarSupportingBillDate,"<SupportingBillDate>");
                    EVALUATE(VarDateofExpense,"<DateofExpense>");
                    //EVALUATE(VarServiceTaxApplicable,"<ServiceTaxApplicable>");
                    EVALUATE(VardecQuantity,"<decQuantity>");
                    EVALUATE(VarLineAmount,"<LineAmount>");
                    
                    SalesHead.RESET;
                    SalesHead.SETRANGE("No.","<cdDoc>");
                    IF SalesHead.FINDFIRST THEN BEGIN
                      SalesLine.RESET;
                      SalesLine.SETRANGE("Document No.",SalesHead."No.");
                      IF SalesLine.FINDLAST THEN
                        LineNo := SalesLine."Line No." + 10000
                      ELSE
                        LineNo := 1000;
                    END;
                    
                    R_SL.INIT;
                    R_SL."Document Type" := SalesHead."Document Type";
                    R_SL."Shortcut Dimension 1 Code" := SalesHead."Shortcut Dimension 1 Code";
                    R_SL."Shortcut Dimension 2 Code":=SalesHead."Shortcut Dimension 2 Code";
                    R_SL."Document No.":="<cdDoc>";
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.VALIDATE("No.",'99-99-999999');
                    R_SL."Line No." := LineNo;
                    
                    R_SL.Description:="<txtDesc>";
                    R_SL."Unit Price" :=VarUnitPrice;
                    R_SL."Item Description" :="<txtitemDesc>";
                    R_SL."Other Detail 1" :="<OtherDetail1>";
                    R_SL."Other Detail 2" :="<OtherDetail2>";
                    R_SL."Supporting Bill No.":="<SupportingBillNo>";
                    R_SL."Supporting Bill Dt.":=VarSupportingBillDate;
                    R_SL."Date of Expense" :=VarDateofExpense;
                    R_SL."Service Tax Applicable":=VarServiceTaxApplicable;
                     IF "Sales Line"."Service Tax Applicable"= TRUE THEN
                     BEGIN
                        R_SL."Service Tax Group"    :='LC';
                        R_SL."Service Tax Registration No." :='AAAFL1585HST001';
                     END;
                    R_SL.VALIDATE(Quantity,VardecQuantity);
                    R_SL.VALIDATE("Unit Price",VarUnitPrice);
                      IF R_SL."Unit Price"=0 THEN
                      BEGIN
                      R_SL."Unit Price" := VarLineAmount;
                      END;
                    R_SL."Item Description":="<txtitemDesc>";
                    R_SL.VALIDATE("Line Amount",VarLineAmount);
                    R_SL.INSERT(TRUE);
                    
                    //TEAM::4217++
                    SalesLineHistory.RESET;
                    SalesLineHistory.INIT;
                    SalesLineHistory.TRANSFERFIELDS(R_SL);
                    SalesLineHistory.INSERT(TRUE);
                    //TEAM::4217--
                     */
                    /*
                    SalesHead.RESET;
                    SalesHead.SETRANGE("No.","<cdDoc>");
                    IF SalesHead.FINDFIRST THEN BEGIN
                      SalesLine.RESET;
                      SalesLine.SETRANGE("Document No.",SalesHead."No.");
                      IF SalesLine.FINDLAST THEN
                        LineNo := SalesLine."Line No." + 10000
                      ELSE
                        LineNo := 1000;
                    END;
                    ERROR('%1-%2',"<cdDoc>",SalesHead."Document Type");//2021
                    R_SL.INIT;
                    R_SL."Document Type" := SalesHead."Document Type";
                    R_SL."Shortcut Dimension 1 Code" := SalesHead."Shortcut Dimension 1 Code";
                    R_SL."Shortcut Dimension 2 Code":=SalesHead."Shortcut Dimension 2 Code";
                    R_SL."Document No.":="<cdDoc>";
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.VALIDATE("No.",'99-99-999999');
                    R_SL."Line No." := LineNo;
                    
                    R_SL.Description:="<txtDesc>";
                    R_SL."Unit Price" :=UnitPrice;
                    R_SL."Item Description" :="<txtitemDesc>";
                    R_SL."Other Detail 1" :="<OtherDetail1>";
                    R_SL."Other Detail 2" :="<OtherDetail2>";
                    R_SL."Supporting Bill No.":="<SupportingBillNo>";
                    R_SL."Supporting Bill Dt.":=SupportingBillDate;
                    R_SL."Date of Expense" :=DateofExpense;
                    R_SL."Service Tax Applicable":=ServiceTaxApplicable;
                     IF "Sales Line"."Service Tax Applicable"= TRUE THEN
                     BEGIN
                        R_SL."Service Tax Group"    :='LC';
                        R_SL."Service Tax Registration No." :='AAAFL1585HST001';
                     END;
                    R_SL.VALIDATE(Quantity,decQuantity);
                    R_SL.VALIDATE("Unit Price",UnitPrice);
                      IF R_SL."Unit Price"=0 THEN
                      BEGIN
                      R_SL."Unit Price" := LineAmount;
                      END;
                    R_SL."Item Description":="<txtitemDesc>";
                    R_SL.VALIDATE("Line Amount",LineAmount);
                    R_SL.INSERT(TRUE);
                    
                    //TEAM::4217++
                    SalesLineHistory.RESET;
                    SalesLineHistory.INIT;
                    SalesLineHistory.TRANSFERFIELDS(R_SL);
                    SalesLineHistory.INSERT(TRUE);
                    //TEAM::4217--
                     */

                end;

                trigger OnBeforeModifyRecord()
                begin
                    //ERROR('%1-%2',"<cdDoc>",SalesHead."Document Type");//2021
                    Evaluate(VarUnitPrice, "<UnitPrice>");
                    Evaluate(VarSupportingBillDate, "<SupportingBillDate>");
                    Evaluate(VarDateofExpense, "<DateofExpense>");
                    Evaluate(VarServiceTaxApplicable, "<ServiceTaxApplicable>");
                    Evaluate(VardecQuantity, "<decQuantity>");
                    Evaluate(VarLineAmount, "<LineAmount>");

                    SalesHead.Reset;
                    SalesHead.SetRange("No.", "<cdDoc>");
                    if SalesHead.FindFirst then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document No.", SalesHead."No.");
                        if SalesLine.FindLast then
                            LineNo := SalesLine."Line No." + 10000
                        else
                            LineNo := 1000;
                    end;

                    R_SL.Init;
                    //R_SL."Document Type" := SalesHead."Document Type"::Invoice;
                    R_SL."Document Type" := R_SL."Document Type"::Invoice;
                    R_SL."Document No." := "<cdDoc>";
                    R_SL."Line No." := LineNo;
                    R_SL.Insert(true);
                    R_SL."Shortcut Dimension 1 Code" := SalesHead."Shortcut Dimension 1 Code";
                    R_SL."Shortcut Dimension 2 Code" := SalesHead."Shortcut Dimension 2 Code";
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.Validate("No.", '99-99-999999');
                    R_SL.Description := "<txtDesc>";
                    R_SL."Unit Price" := VarUnitPrice;
                    R_SL."Item Description" := "<txtitemDesc>";
                    R_SL."Other Detail 1" := "<OtherDetail1>";
                    R_SL."Other Detail 2" := "<OtherDetail2>";
                    R_SL."Supporting Bill No." := "<SupportingBillNo>";
                    R_SL."Supporting Bill Dt." := VarSupportingBillDate;
                    R_SL."Date of Expense" := VarDateofExpense;
                    R_SL."Service Tax Applicable" := VarServiceTaxApplicable;
                    R_SL.Validate(Quantity, VardecQuantity);
                    R_SL.Validate("Unit Price", VarUnitPrice);
                    if R_SL."Unit Price" = 0 then begin
                        R_SL."Unit Price" := VarLineAmount;
                    end;
                    R_SL."Item Description" := "<txtitemDesc>";
                    R_SL.Validate("Line Amount", VarLineAmount);
                    //R_SL.INSERT(TRUE);
                    R_SL.Modify;//2021
                    /*
                    //TEAM::4217++
                    SalesLineHistory.RESET;
                    SalesLineHistory.INIT;
                    SalesLineHistory.TRANSFERFIELDS(R_SL);
                    SalesLineHistory.INSERT(TRUE);
                    //TEAM::4217--
                    */
                    /*IF SalesLine."Service Tax Applicable" = TRUE THEN
                       SalesLine.INIT;
                       SalesLine."Service Tax Group"    :='LC';
                       SalesLine."Service Tax Registration No." :='AAAFL1585HST001';
                       SalesLine.INIT;
                       SalesLine.Quantity := Quantity;
                       SalesLine."Line Amount" :="Line Amount";
                     */

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

    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        SavedFileName: Text[100];
        R_SL: Record "Sales Line";
        cdDoc: Code[20];
        txtDesc: Text[50];
        txtitemDesc: Text[100];
        uom: Code[10];
        decQuantity: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        OtherDetail1: Text[250];
        OtherDetail2: Text[250];
        SupportingBillNo: Text[50];
        SupportingBillDate: Date;
        DateofExpense: Date;
        ServiceTaxApplicable: Boolean;
        SalesLineHistory: Record "Sales Line History";
        VarUnitPrice: Decimal;
        VarSupportingBillDate: Date;
        VarDateofExpense: Date;
        VarServiceTaxApplicable: Boolean;
        VardecQuantity: Decimal;
        VarLineAmount: Decimal;
}

