tableextension 50003 "LKSSalesInvoiceHdrExt" extends "Sales Invoice Header"
{
    // LCMS Integration
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Bill-to Name"(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Name 2"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Name"(Field 13)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Name 2"(Field 14)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address"(Field 15)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address 2"(Field 16)".


        //Unsupported feature: Property Modification (Data type) on ""Posting Description"(Field 22)".


        //Unsupported feature: Property Modification (Data type) on ""Sell-to Customer Name"(Field 79)".


        //Unsupported feature: Property Modification (Data type) on ""Sell-to Customer Name 2"(Field 80)".


        //Unsupported feature: Property Modification (Data type) on "State(Field 13752)".


        //Unsupported feature: Property Insertion (Enabled) on ""LR/RR No."(Field 16511)".


        //Unsupported feature: Property Insertion (Enabled) on ""LR/RR Date"(Field 16512)".


        //Unsupported feature: Property Insertion (Enabled) on ""Vehicle No."(Field 16513)".


        //Unsupported feature: Property Insertion (Enabled) on ""Mode of Transport"(Field 16514)".


        //Unsupported feature: Property Deletion (Editable) on ""No. Printed"(Field 47)".

        field(50000; "Bill Description"; Text[50])
        {
        }
        field(50001; "Service Tax Applicable"; Boolean)
        {
        }
        field(50002; "Prof. Chrg. Amt."; Decimal)
        {
        }
        field(50003; "Reimbursable Exp. Amt."; Decimal)
        {
        }
        field(50004; "Adjust Against Adv."; Decimal)
        {
        }
        field(50005; "Confirmation Reference"; Text[50])
        {
        }
        field(50006; "RTB Type"; Text[30])
        {
        }
        field(50008; InvoiceType; Option)
        {
            OptionCaption = ',TAXABLE,NON-TAXABLE,MIXED';
            OptionMembers = ,TAXABLE,"NON-TAXABLE",MIXED;
        }
        field(50009; "State Name"; Text[40])
        {
            Description = '30->40';
        }
        field(50010; "Post Office"; Text[60])
        {
        }
        field(50011; District; Text[60])
        {
        }
        field(50012; Country; Text[30])
        {
        }
        field(50013; "Amount LCY"; Decimal)
        {
        }
        field(50022; ShipToStateName; Text[40])
        {
            Description = '30->40';
        }
        field(50050; "Owner 2"; Code[30])
        {
        }
        field(50051; "Group Code"; Code[30])
        {
        }
        field(50052; "Sub Group Code"; Code[20])
        {
        }
        field(50053; "Owner 1"; Code[30])
        {
        }
    }
    keys
    {
        //TBD
        /*
        key(Key1; "Location Code")
        {
        }
        key(Key2; "Shortcut Dimension 1 Code")
        {
        }
        key(Key3; "Shortcut Dimension 2 Code")
        {
        }
        */
    }

    procedure PostedInvoiceLink(PostedDoc: Code[20]; var RespQueue: Record "LCMS Response Queue")
    var
        TempBlob: Codeunit "Temp Blob";
        Instrm: InStream;
        Outstrm: OutStream;
    begin
        //LCMS Integration-
        SIHRep.Reset;
        SIHRep.SetRange("No.", PostedDoc);
        if SIHRep.FindFirst then;
        Clear(TaxInvR);
        if SIHRep."Shortcut Dimension 1 Code" = '1' then begin
            TaxInvR.SetTableView(SIHRep);
            Clear(FileName);
            FileName := SIHRep."No." + Format(Today) + Format(CurrentDateTime);
            FileName := DelChr(FileName, '=', '/');
            FileName := DelChr(FileName, '=', 'PM');
            FileName := DelChr(FileName, '=', ':');
            FileName := DelChr(FileName, '=');
            //TBDTaxInvR.SaveAsPdf('C:\Invoice Report\' + FileName + '.pdf');
            //exit('C:\Invoice Report\' + FileName + '.pdf');
            TempBlob.CreateOutStream(Outstrm);
            TaxInvR.SaveAs('', ReportFormat::Pdf, Outstrm);
            TempBlob.CreateInStream(Instrm);
            RespQueue.Document.ImportStream(Instrm, FileName + '.pdf');
        end else begin
            TaxInvR_NonDelhi.SetTableView(SIHRep);
            Clear(FileName);
            FileName := SIHRep."No." + Format(Today) + Format(CurrentDateTime);
            FileName := DelChr(FileName, '=', '/');
            FileName := DelChr(FileName, '=', 'PM');
            FileName := DelChr(FileName, '=', ':');
            FileName := DelChr(FileName, '=');
            //TBD TaxInvR_NonDelhi.SaveAsPdf('C:\Invoice Report\' + FileName + '.pdf');
            //exit('C:\Invoice Report\' + FileName + '.pdf');
            TempBlob.CreateOutStream(Outstrm);
            TaxInvR_NonDelhi.SaveAs('', ReportFormat::Pdf, Outstrm);
            TempBlob.CreateInStream(Instrm);
            RespQueue.Document.ImportStream(Instrm, FileName + '.pdf');
        end;
    end;

    var
        SalesInvHeader: Record "Sales Invoice Header";

    var
        TaxInvR: Report "Tax Invoice GST";
        FileName: Text[50];
        SIHRep: Record "Sales Invoice Header";
        TaxInvR_NonDelhi: Report "Branch Tax Invoice GST";
}

