xmlport 50048 "RTB Line_LCMS"
{
    Direction = Import;
    //TBD //FieldDelimiter = '<None>';
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfInstallments)
        {
            tableelement("Sales Line"; "Sales Line")
            {
                AutoUpdate = true;
                XmlName = 'Installments';
                textelement(rtb_number)
                {
                }
                textelement(installment_types)
                {
                }
                textelement(description)
                {
                }
                fieldelement(UOM; "Sales Line"."Unit of Measure")
                {
                }
                textelement(count)
                {
                }
                textelement(professional_rates)
                {
                }
                textelement(amount)
                {
                }
                textelement(Other_Detail1)
                {
                }
                textelement(Other_Detail2)
                {
                }
                textelement(Supporting_Bill_No)
                {
                }
                textelement(Supporting_Bill_Date)
                {
                }
                textelement(Date_of_Expense)
                {
                }
                textelement(Service_Tax_Applicable)
                {
                }

                trigger OnBeforeModifyRecord()
                begin
                    if professional_rates = '' then
                        VarUnitPrice := 0
                    else
                        Evaluate(VarUnitPrice, professional_rates);

                    if Supporting_Bill_Date = '' then
                        VarSupportingBillDate := 0D
                    else begin
                        Evaluate(Year, CopyStr(Supporting_Bill_Date, 1, 4));
                        Evaluate(Month, CopyStr(Supporting_Bill_Date, 6, 2));
                        Evaluate(Day, CopyStr(Supporting_Bill_Date, 9, 2));
                        VarSupportingBillDate := DMY2Date(Day, Month, Year);
                    end;

                    if Date_of_Expense = '' then
                        VarDateofExpense := 0D
                    else begin
                        Evaluate(Year, CopyStr(Date_of_Expense, 1, 4));
                        Evaluate(Month, CopyStr(Date_of_Expense, 6, 2));
                        Evaluate(Day, CopyStr(Date_of_Expense, 9, 2));
                        VarDateofExpense := DMY2Date(Day, Month, Year);
                    end;

                    if Service_Tax_Applicable = '' then
                        VarServiceTaxApplicable := false
                    else
                        Evaluate(VarServiceTaxApplicable, Service_Tax_Applicable);

                    if count = '' then
                        VardecQuantity := 0
                    else
                        Evaluate(VardecQuantity, count);

                    if amount = '' then
                        VarLineAmount := 0
                    else
                        Evaluate(VarLineAmount, amount);

                    SalesHead.Reset;
                    SalesHead.SetRange("No.", rtb_number);
                    if SalesHead.FindFirst then begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document No.", SalesHead."No.");
                        if SalesLine.FindLast then
                            LineNo := SalesLine."Line No." + 10000
                        else
                            LineNo := 10000;
                    end;

                    R_SL.Init;
                    R_SL."Document Type" := R_SL."Document Type"::Invoice;
                    R_SL."Document No." := rtb_number;
                    R_SL."Line No." := LineNo;
                    R_SL."Shortcut Dimension 1 Code" := SalesHead."Shortcut Dimension 1 Code";
                    R_SL."Shortcut Dimension 2 Code" := SalesHead."Shortcut Dimension 2 Code";
                    R_SL.Type := "Sales Line".Type::"G/L Account";
                    R_SL.Validate("No.", '99-99-999999');
                    R_SL.Description := installment_types;
                    R_SL."Unit Price" := VarUnitPrice;
                    R_SL."Item Description" := description;
                    R_SL."Other Detail 1" := Other_Detail1;
                    R_SL."Other Detail 2" := Other_Detail2;
                    R_SL."Supporting Bill No." := Supporting_Bill_No;
                    R_SL."Supporting Bill Dt." := VarSupportingBillDate;
                    R_SL."Date of Expense" := VarDateofExpense;
                    R_SL."Service Tax Applicable" := VarServiceTaxApplicable;
                    R_SL.Validate(Quantity, VardecQuantity);
                    R_SL.Validate("Unit Price", VarUnitPrice);
                    if R_SL."Unit Price" = 0 then begin
                        R_SL."Unit Price" := VarLineAmount;
                    end;
                    R_SL."Item Description" := description;
                    R_SL.Validate("Line Amount", VarLineAmount);
                    R_SL.Insert(true);
                    R_SL.Modify;//2021

                    rtb_number := '';
                    installment_types := '';
                    description := '';
                    count := '';
                    professional_rates := '';
                    amount := '';
                    Other_Detail1 := '';
                    Other_Detail2 := '';
                    Supporting_Bill_No := '';
                    Supporting_Bill_Date := '';
                    Date_of_Expense := '';
                    Service_Tax_Applicable := '';
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
        Day: Integer;
        Month: Integer;
        Year: Integer;
}

