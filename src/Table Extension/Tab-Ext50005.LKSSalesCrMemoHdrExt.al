tableextension 50005 "LKSSalesCrMemoHdrExt" extends "Sales Cr.Memo Header"
{
    // LCMS Integration-
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Bill-to Name"(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Address"(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Bill-to Address 2"(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address"(Field 15)".


        //Unsupported feature: Property Modification (Data type) on ""Ship-to Address 2"(Field 16)".


        //Unsupported feature: Property Modification (Data type) on ""Posting Description"(Field 22)".


        //Unsupported feature: Property Modification (Name) on ""Invoice Type"(Field 16605)".

        field(50000; "Bill Description"; Text[250])
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
        field(50005; "Confirmation Reference"; Text[250])
        {
        }
        field(50006; "RTB Type"; Text[30])
        {
        }
        //TBD
        /*
        field(50007; Cancelled; Boolean)
        {
        }
        field(50008; "Invoice Type"; Option)
        */
        field(50008; "LKS Invoice Type"; Option)//3K- Added Prefix LKS
        {
            OptionCaption = ',TAXABLE,NON-TAXABLE,MIXED';
            OptionMembers = ,TAXABLE,"NON-TAXABLE",MIXED;
        }
        field(50009; "State Name"; Text[30])
        {
        }
        field(50010; "Post Office"; Text[60])
        {
        }
        field(50011; District; Text[60])
        {
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
        key(Key1; "Shortcut Dimension 1 Code")
        {
        }
        */
    }

    procedure PostedCRLink(PostedDoc: Code[20]; var RespQueue: Record "LCMS Response Queue")
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        TempBlob: Codeunit "Temp Blob";
        Instrm: InStream;
        Outstrm: OutStream;
    begin
        //LCMS Integration
        SalesCrMemoHeader.Reset;
        SalesCrMemoHeader.SetRange("No.", PostedDoc);
        if SalesCrMemoHeader.FindFirst then;
        Clear(CreditMemoNew);
        CreditMemoNew.SetTableView(SalesCrMemoHeader);
        Clear(FileName);
        FileName := SalesCrMemoHeader."No." + Format(Today) + Format(CurrentDateTime);
        FileName := DelChr(FileName, '=', '/');
        FileName := DelChr(FileName, '=', 'PM');
        FileName := DelChr(FileName, '=', ':');
        FileName := DelChr(FileName, '=');
        //TBD CreditMemoNew.SaveAsPdf('C:\Credit Report\' + FileName + '.pdf');
        TempBlob.CreateOutStream(Outstrm);
        CreditMemoNew.SaveAs('', ReportFormat::Pdf, Outstrm);
        TempBlob.CreateInStream(Instrm);
        RespQueue.Document.ImportStream(Instrm, FileName + '.pdf');
        //exit('C:\Credit Report\' + FileName + '.pdf');
    end;

    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";

    var
        FileName: Text;
        CreditMemoNew: Report "Credit Note GST";
}

