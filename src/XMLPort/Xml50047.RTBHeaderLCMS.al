xmlport 50047 "RTB Header_LCMS"
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        // textelement(root)
        // {
        tableelement("Sales Header"; "Sales Header")
        {
            AutoUpdate = true;
            XmlName = 'Rtb';
            textelement(client_id)
            {
            }
            textelement(case_id)
            {
            }
            textelement(rtb_number)
            {
            }
            textelement(rtb_type)
            {
            }
            textelement(bill_description)
            {
            }
            textelement(currency)
            {
            }
            textelement(invoice_type)
            {
            }
            textelement(adjust_against_adv)
            {
            }
            textelement(professional_fees)
            {
            }
            textelement(reference_amount)
            {
            }
            textelement(confirmation_reference)
            {
            }
            textelement(posting_no)
            {
            }
            textelement(rtb_date)
            {
            }
            textelement(billed_by)
            {
            }

            trigger OnAfterInsertRecord()
            begin

                R_SH.Reset;
                R_SH.Init;
                if RTBtype = 'Advance' then
                    R_SH."Document Type" := R_SH."Document Type"::Order
                else
                    R_SH."Document Type" := R_SH."Document Type"::Invoice;
                R_SH."No." := rtb_number;
                R_SH."Posting Date" := WorkDate;
                R_SH."Document Date" := WorkDate;
                R_SH."Due Date" := WorkDate;
                R_SH.Validate("Sell-to Customer No.", client_id);
                //EVALUATE(VarInvType,"<InvType>");

                if adjust_against_adv = '' then
                    VarAdjustagnstADv := 0
                else
                    Evaluate(VarAdjustagnstADv, adjust_against_adv);

                if professional_fees = '' then
                    VarProfChrgAmt := 0
                else
                    Evaluate(VarProfChrgAmt, professional_fees);

                if reference_amount = '' then
                    VarReimbursableExpAmt := 0
                else
                    Evaluate(VarReimbursableExpAmt, reference_amount);
                if rtb_date <> '' then begin
                    Evaluate(Year, CopyStr(rtb_date, 1, 4));
                    Evaluate(Month, CopyStr(rtb_date, 6, 2));
                    Evaluate(Day, CopyStr(rtb_date, 9, 2));
                    VarPostingDate := DMY2Date(Day, Month, Year);
                end;
                R_SH."RTB Type" := rtb_type;
                R_SH.Validate("Invoice Type", VarInvType);
                //R_SH."Posting No. Series" :='INV';
                if currency <> 'INR' then
                    R_SH.Validate("Currency Code", currency);
                R_SH."Adjust Against Adv." := VarAdjustagnstADv;
                R_SH."Bill Description" := bill_description;
                R_SH."Prof. Chrg. Amt." := VarProfChrgAmt;
                if VarReimbursableExpAmt = 0 then
                    R_SH."Reimbursable Exp. Amt." := 0
                else
                    R_SH."Reimbursable Exp. Amt." := VarReimbursableExpAmt;

                R_SH."Confirmation Reference" := confirmation_reference;
                R_SH."Posting Date" := VarPostingDate;
                R_SH."Posting No." := posting_no;
                if not R_SH.Insert(true) then
                    R_SH.Modify(true);

                R_SH1.Copy(R_SH);
                R_SH1.Validate("Shortcut Dimension 2 Code", case_id);
                R_SH1.Modify(true);
            end;

            trigger OnAfterModifyRecord()
            begin

                Clear(R_SH);
                R_SH.Reset;
                R_SH.Init;
                if RTBtype = 'Advance' then
                    R_SH."Document Type" := R_SH."Document Type"::Order
                else
                    R_SH."Document Type" := R_SH."Document Type"::Invoice;
                R_SH."No." := rtb_number;
                R_SH."Posting Date" := WorkDate;
                R_SH."Document Date" := WorkDate;
                R_SH."Due Date" := WorkDate;
                R_SH.Validate("Sell-to Customer No.", client_id);

                if adjust_against_adv = '' then
                    VarAdjustagnstADv := 0
                else
                    Evaluate(VarAdjustagnstADv, adjust_against_adv);

                if professional_fees = '' then
                    VarProfChrgAmt := 0
                else
                    Evaluate(VarProfChrgAmt, professional_fees);

                if reference_amount = '' then
                    VarReimbursableExpAmt := 0
                else
                    Evaluate(VarReimbursableExpAmt, reference_amount);

                if rtb_date <> '' then begin
                    Evaluate(Year, CopyStr(rtb_date, 1, 4));
                    Evaluate(Month, CopyStr(rtb_date, 6, 2));
                    Evaluate(Day, CopyStr(rtb_date, 9, 2));
                    VarPostingDate := DMY2Date(Day, Month, Year);
                end;

                R_SH."RTB Type" := rtb_type;
                R_SH.Validate("Invoice Type", VarInvType);
                R_SH."Posting No. Series" := 'INV';
                if currency <> 'INR' then
                    R_SH.Validate("Currency Code", currency);
                R_SH."Adjust Against Adv." := VarAdjustagnstADv;
                R_SH."Bill Description" := bill_description;
                R_SH."Prof. Chrg. Amt." := VarProfChrgAmt;
                if VarReimbursableExpAmt = 0 then
                    R_SH."Reimbursable Exp. Amt." := 0
                else
                    R_SH."Reimbursable Exp. Amt." := VarReimbursableExpAmt;

                R_SH."Confirmation Reference" := confirmation_reference;
                R_SH."Posting Date" := VarPostingDate;
                R_SH."Posting No." := posting_no;
                if not R_SH.Insert(true) then
                    R_SH.Modify;

                R_SH1.Copy(R_SH);
                R_SH1.Validate("Shortcut Dimension 2 Code", case_id);
                R_SH1.Modify(true);
            end;
        }
        //}
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
        CLE: Record "Cust. Ledger Entry";
        CompanyInfo: Record "Company Information";
        Cust: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        ShipToAddr: Record "Ship-to Address";
        cdSelltoCust: Code[20];
        cdShortkut: Code[20];
        cdNo: Code[20];
        RTBtype: Text[50];
        BillDisc: Text[250];
        CurryCode: Code[10];
        InvType: Option ,TAXABLE,"NON-TAXABLE",MIXED;
        AdjustagnstADv: Decimal;
        ProfChrgAmt: Decimal;
        ReimbursableExpAmt: Decimal;
        ConfirmationReference: Text[250];
        R_SH: Record "Sales Header";
        R_SH1: Record "Sales Header";
        R_SHHistory: Record "Sales Header History";
        PostingDate: Date;
        InvNo: Code[30];
        VarInvType: Option;
        VarAdjustagnstADv: Decimal;
        VarProfChrgAmt: Decimal;
        VarReimbursableExpAmt: Decimal;
        VarPostingDate: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;
}

