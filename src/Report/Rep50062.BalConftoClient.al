report 50062 "Bal. Conf. to Client"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BalConftoClient.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = ORDER(Ascending) WHERE("Document Type" = FILTER(Invoice), Open = FILTER(true));
            column(Cust_Name; Cust_Name)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Currency_Code_; "Cust. Ledger Entry"."Currency Code")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry__Amount; "Cust. Ledger Entry".Amount)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount_; "Cust. Ledger Entry"."Remaining Amount")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amt___LCY__; "Cust. Ledger Entry"."Remaining Amt. (LCY)")
            {
            }
            column(Cont_Person; Cont_Person)
            {
            }
            column(MOF_____MOF1; MOF + ' ' + MOF1)
            {
            }
            column(Owner2; OWNER2)
            {
            }
            column(Owner1; OWNER1)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Global_Dimension_2_Code_; "Cust. Ledger Entry"."Global Dimension 2 Code")
            {
            }
            column(Dim_Name; Dim_Name)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Posting_Date_; "Cust. Ledger Entry"."Posting Date")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Document_No__; "Cust. Ledger Entry"."Document No.")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry__Amount_Control1000000026; "Cust. Ledger Entry".Amount)
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount__Control1000000027; "Cust. Ledger Entry"."Remaining Amount")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amt___LCY___Control1000000028; "Cust. Ledger Entry"."Remaining Amt. (LCY)")
            {
            }
            column(Client_NameCaption; Client_NameCaptionLbl)
            {
            }
            column(Memo_NoCaption; Memo_NoCaptionLbl)
            {
            }
            column(Memo_DateCaption; Memo_DateCaptionLbl)
            {
            }
            column(Memo_Branch_CodeCaption; Memo_Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Owner_1Caption; Owner_1CaptionLbl)
            {
            }
            column(Owner2Caption; Owner2CaptionLbl)
            {
            }
            column(MOF_DescriptionCaption; MOF_DescriptionCaptionLbl)
            {
            }
            column(Curr__CodeCaption; Curr__CodeCaptionLbl)
            {
            }
            column(Invoice_Orignal_Amount_in_Billing_currencyCaption; Invoice_Orignal_Amount_in_Billing_currencyCaptionLbl)
            {
            }
            column(Remaining_Invoice__Outstanding_Amount_in_Billing_currencyCaption; Remaining_Invoice__Outstanding_Amount_in_Billing_currencyCaptionLbl)
            {
            }
            column(Remaining_Invoice_Outstanding_Amount__INR_Caption; Remaining_Invoice_Outstanding_Amount__INR_CaptionLbl)
            {
            }
            column(Billing_contact_NameCaption; Billing_contact_NameCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                OWNER1 := '';
                OWNER2 := '';
                DimVal.SetRange(DimVal."Dimension Code", 'CASE');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 2 Code");
                if DimVal.Find('-') then begin
                    OWNER1 := DimVal."Case-Owner1";
                    OWNER2 := DimVal."Case-Owner2";
                end;
                Dim_Name := '';
                DimVal.SetRange(DimVal."Dimension Code", 'BRANCH');
                DimVal.SetRange(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                if DimVal.Find('-') then begin
                    Dim_Name := DimVal.Name;
                end;

                Cust.Reset;
                Cust.SetRange(Cust."No.", "Cust. Ledger Entry"."Customer No.");
                if Cust.Find('-') then begin
                    Cust_Name := Cust."Client Name";
                    ;
                end;

                Sales_Inv_Header.Reset;
                Sales_Inv_Header.SetFilter(Sales_Inv_Header."No.", "Cust. Ledger Entry"."Document No.");
                if Sales_Inv_Header.Find('-') then
                    Cont_Person := Sales_Inv_Header."Ship-to Contact";

                Sales_Inv_Line.Reset;
                Sales_Inv_Line.SetFilter(Sales_Inv_Line."Document No.", "Cust. Ledger Entry"."Document No.");
                if Sales_Inv_Line.Find('-') then
                    MOF := Sales_Inv_Line."Other Detail 1";
                MOF1 := Sales_Inv_Line."Other Detail 2";
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Amount, "Remaining Amount", "Remaining Amt. (LCY)");
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
        Owner1: Text[50];
        Owner2: Text[50];
        DimVal: Record "Dimension Value";
        Cont: Record Contact;
        Cust: Record Customer;
        Cust_Name: Text[60];
        Dim_Name: Text[50];
        Sales_Inv_Header: Record "Sales Invoice Header";
        Cont_Person: Text[100];
        MOF: Text[250];
        MOF1: Text[250];
        Sales_Inv_Line: Record "Sales Invoice Line";
        Client_NameCaptionLbl: Label 'Client Name';
        Memo_NoCaptionLbl: Label 'Memo No';
        Memo_DateCaptionLbl: Label 'Memo Date';
        Memo_Branch_CodeCaptionLbl: Label 'Memo Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Owner_1CaptionLbl: Label 'Owner 1';
        Owner2CaptionLbl: Label 'Owner2';
        MOF_DescriptionCaptionLbl: Label 'MOF Description';
        Curr__CodeCaptionLbl: Label 'Curr. Code';
        Invoice_Orignal_Amount_in_Billing_currencyCaptionLbl: Label 'Invoice Orignal Amount in Billing currency';
        Remaining_Invoice__Outstanding_Amount_in_Billing_currencyCaptionLbl: Label ' Remaining Invoice /Outstanding Amount in Billing currency';
        Remaining_Invoice_Outstanding_Amount__INR_CaptionLbl: Label ' Remaining Invoice/Outstanding Amount (INR)';
        Billing_contact_NameCaptionLbl: Label 'Billing contact Name';
}

