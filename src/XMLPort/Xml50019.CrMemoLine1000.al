xmlport 50019 "Cr Memo Line 1000"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\1000\CRTBLine_Lakshmi kumaran & Sridharan.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Line"; "Sales Line")
            {
                AutoUpdate = true;
                XmlName = 'Sales_Line';
                textelement("<cddoc>")
                {
                    XmlName = 'CdDoc.';
                }
                textelement("<txtdesc>")
                {
                    XmlName = 'TxtDesc.';
                }
                textelement("<txtitemdesc>")
                {
                    XmlName = 'txtitemDesc.';
                }
                textelement("<uom>")
                {
                    XmlName = 'uom.';
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

                trigger OnAfterInsertRecord()
                begin
                    /*
                    EVALUATE(VarUnitPrice,"<UnitPrice>");
                    EVALUATE(VarSupportingBillDate,"<SupportingBillDate>");
                    EVALUATE(VarDateofExpense,"<DateofExpense>");
                    EVALUATE(VarServiceTaxApplicable,"<ServiceTaxApplicable>");
                    EVALUATE(VardecQuantity,"<decQuantity>");
                    EVALUATE(VarLineAmount,"<LineAmount>");
                    
                    SalesHead.RESET;
                    SalesHead.SETRANGE("No.","<CdDoc>");
                    IF SalesHead.FINDFIRST THEN BEGIN
                      SalesLine.RESET;
                      SalesLine.SETRANGE("Document No.",SalesHead."No.");
                      IF SalesLine.FINDLAST THEN
                        LineNo := SalesLine."Line No." + 10000
                      ELSE
                        LineNo := 1000;
                    END;
                    R_SL.INIT;
                    R_SL."Document Type" := SalesHead."Document Type"::"Credit Memo";
                    R_SL."Document No.":="<CdDoc>";
                    R_SL."Line No." := LineNo;
                    R_SL.INSERT(TRUE);
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.VALIDATE("No.",'99-99-999999');
                    //R_SL."No." := '99-99-999999';
                    R_SL.Description:="<TxtDesc>";
                    R_SL."Unit Price" :=VarUnitPrice;
                    R_SL."Item Description" :="<txtitemDesc>";
                    R_SL."Other Detail 1" :="<OtherDetail1>";
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
                    //R_SL.INSERT(TRUE);
                    R_SL.MODIFY;//2021
                     */

                end;

                trigger OnBeforeModifyRecord()
                begin

                    Evaluate(VarUnitPrice, "<UnitPrice>");
                    Evaluate(VarSupportingBillDate, "<SupportingBillDate>");
                    Evaluate(VarDateofExpense, "<DateofExpense>");
                    Evaluate(VarServiceTaxApplicable, "<ServiceTaxApplicable>");
                    Evaluate(VardecQuantity, "<decQuantity>");
                    Evaluate(VarLineAmount, "<LineAmount>");

                    SalesHead.Reset;
                    SalesHead.SetRange("No.", "<CdDoc>");
                    if SalesHead.FindFirst then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document No.", SalesHead."No.");
                        if SalesLine.FindLast then
                            LineNo := SalesLine."Line No." + 10000
                        else
                            LineNo := 1000;
                    end;
                    R_SL.Init;
                    R_SL."Document Type" := SalesHead."Document Type"::"Credit Memo";
                    R_SL."Document No." := "<CdDoc>";
                    R_SL."Line No." := LineNo;
                    R_SL.Insert(true);
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.Validate("No.", '99-99-999999');
                    //R_SL."No." := '99-99-999999';
                    R_SL.Description := "<TxtDesc>";
                    R_SL."Unit Price" := VarUnitPrice;
                    R_SL."Item Description" := "<txtitemDesc>";
                    R_SL."Other Detail 1" := "<OtherDetail1>";
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
                    "Sales Line".Type := 1;
                    "Sales Line"."No." := '';
                    "Sales Line"."Line No." := LineNo;
                    "Sales Line".VALIDATE("Sales Line"."Sell-to Customer No.",SalesHead."Bill-to Customer No.");
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
        R_SL: Record "Sales Line";
        cdDoc: Code[20];
        txtDesc: Text[50];
        txtitemDesc: Text[100];
        uom: Code[50];
        decQuantity: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        OtherDetail1: Text[250];
        SupportingBillNo: Text[50];
        SupportingBillDate: Date;
        DateofExpense: Date;
        ServiceTaxApplicable: Boolean;
        VarUnitPrice: Decimal;
        VarSupportingBillDate: Date;
        VarDateofExpense: Date;
        VarServiceTaxApplicable: Boolean;
        VardecQuantity: Decimal;
        VarLineAmount: Decimal;
}

