codeunit 50005 ContactDataExchanger
{

    trigger OnRun()
    begin
    end;

    var
        //3k-UPG tempRec: Record TempBlob temporary;
        tempRec: Codeunit "Temp Blob";
        XMLInStream: InStream;
        Text0001: Label 'Successfully inserted Contact No.';
        XMLOutStream: OutStream;
        Text0002: Label 'Succesfully Dispatched';
        ContractNoG: Code[20];
        Text0003: Label 'Contact No. doesn''t exists';
        Text0004: Label 'Contact No. successfully modified';
        Test: Boolean;
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        PPPDocNo: Code[20];
        Test11: Boolean;
        Text0005: Label 'Successfully inserted Case No.';
        Text0006: Label 'Successfully inserted Branch No';
        Text0007: Label 'Successfully inserted Advocate No';
        Text0008: Label 'Successfully inserted Customer No';
        Text0009: Label 'Successfully inserted Forum';
        Text0010: Label 'Successfully inserted Office No';
        SalesInvHdrP: Record "Sales Invoice Header";
        SalesCrHdrP2: Record "Sales Header";
        SalesInvLineP: Record "Sales Invoice Line";
        SalesCrLineP2: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        CopyDocMgt: Codeunit "Copy Document Mgt.";
        DocType: Option Quote,"Blanket Order","Order",Invoice,"Return Order","Credit Memo","Posted Shipment","Posted Invoice","Posted Return Receipt","Posted Credit Memo";
        SalesHeader: Record "Sales Header";
        test1: Boolean;

        CancelComm: Text;
        Stat: Boolean;


    procedure CommonFunction(CaseDetailP: BigText; BranchDetailP: BigText; ContactDetailP: BigText; AdvocateDetailP: BigText; ClientDetailP: BigText; ForumDetailP: BigText; OfficeDetailP: BigText; PracticeDetailP: BigText; RegionP: BigText; GroupP: BigText; ProcessP: BigText; SolutionP: BigText; var StatusP: Boolean; var MessageP: Text[1024])
    begin
        Clear(MessageP);
        Clear(StatusP);

        tempRec.CreateOutStream(XMLOutStream);
        ClientDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if ClientDetailP.Length <> 0 then
            XMLPORT.Import(50043, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        OfficeDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if OfficeDetailP.Length <> 0 then
            XMLPORT.Import(50045, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        ContactDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if ContactDetailP.Length <> 0 then
            XMLPORT.Import(50041, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        BranchDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if BranchDetailP.Length <> 0 then
            XMLPORT.Import(50040, XMLInStream);


        tempRec.CreateOutStream(XMLOutStream);
        CaseDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if CaseDetailP.Length <> 0 then
            XMLPORT.Import(50039, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        AdvocateDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if AdvocateDetailP.Length <> 0 then
            XMLPORT.Import(50042, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        ForumDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if ForumDetailP.Length <> 0 then
            XMLPORT.Import(50044, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        OfficeDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if OfficeDetailP.Length <> 0 then
            XMLPORT.Import(50045, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        PracticeDetailP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if PracticeDetailP.Length <> 0 then
            XMLPORT.Import(50046, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        RegionP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if RegionP.Length <> 0 then
            XMLPORT.Import(50049, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        GroupP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if GroupP.Length <> 0 then
            XMLPORT.Import(50050, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        ProcessP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if ProcessP.Length <> 0 then
            XMLPORT.Import(50051, XMLInStream);

        tempRec.CreateOutStream(XMLOutStream);
        SolutionP.Write(XMLOutStream);
        tempRec.CreateInStream(XMLInStream);
        if SolutionP.Length <> 0 then
            XMLPORT.Import(50052, XMLInStream);

        GenPracticeDim;
        GenForumDim;
        GenOwnerDim;
        GenCustDim;
        UpdateCustPosting;

        StatusP := true;
    end;


    procedure CreateRTB(RTBHdrP: BigText; RTBLineP: BigText; var StatusP: Boolean; var MessageP: Text[1024])
    begin

        tempRec.CreateOutStream(XMLOutStream);
        RTBHdrP.Write(XMLOutStream);


        tempRec.CreateInStream(XMLInStream);
        if RTBHdrP.Length <> 0 then
            XMLPORT.Import(50047, XMLInStream);



        tempRec.CreateOutStream(XMLOutStream);
        RTBLineP.Write(XMLOutStream);


        tempRec.CreateInStream(XMLInStream);
        if RTBLineP.Length <> 0 then
            XMLPORT.Import(50048, XMLInStream);
        StatusP := true;
        UpdateDimOnRTB;
    end;

    procedure CreateRTB(XMLInStream: InStream; var StatusP: Boolean; var MessageP: Text[1024])
    begin

        // tempRec.CreateOutStream(XMLOutStream);
        // RTBHdrP.Write(XMLOutStream);


        // tempRec.CreateInStream(XMLInStream);
        // if RTBHdrP.Length <> 0 then
        XMLPORT.Import(50047, XMLInStream);



        // tempRec.CreateOutStream(XMLOutStream);
        // RTBLineP.Write(XMLOutStream);


        // tempRec.CreateInStream(XMLInStream);
        // if RTBLineP.Length <> 0 then
        //     XMLPORT.Import(50048, XMLInStream);
        StatusP := true;
        UpdateDimOnRTB;
    end;


    procedure CancelRTB(var StatusP: Boolean; RTBNo: Code[20]; InvoiceNo: Code[20]; CRTBNo: Code[20]; CRTBReason: Text[250])
    var
        SalesLine: Record "Sales Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        if not (InvoiceNo = '') and not (CRTBNo = '') then begin
            Clear(StatusP);
            Clear(SalesHeader);
            SalesInvoiceHeader.Get(InvoiceNo);
            SalesHeader.Init;
            SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
            SalesHeader."No." := CRTBNo;
            SalesHeader.Insert(true);
            SalesSetup.Get;
            Clear(CopyDocMgt);
            CopyDocMgt.SetProperties(
             true, false, false, false, false, SalesSetup."Exact Cost Reversing Mandatory", false);
            CopyDocMgt.CopySalesDoc(DocType::"Posted Invoice", InvoiceNo, SalesHeader);
            SalesHeader."Applies-to Doc. Type" := SalesHeader."Applies-to Doc. Type"::Invoice;
            SalesHeader.Validate("Applies-to Doc. No.", InvoiceNo);
            SalesHeader."Posting Date" := Today;
            if SalesHeader."Location Code" <> '' then
                SalesHeader.Validate("Location Code");
            if SalesHeader."Bill-to Contact No." <> '' then
                SalesHeader.Validate("Bill-to Contact No.");
            SalesHeader."Bill Description" := CRTBReason;
            SalesHeader.Modify(true);

            SalesLine.Reset;
            SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Credit Memo");
            SalesLine.SetRange("Document No.", CRTBNo);
            StatusP := true;
            REPORT.Run(50103);
        end;
    end;


    procedure WriteOffAmount(AmountToWrtOff: Decimal; InvoiceNo: Code[20]; RTBNo: Code[20]; var StatusP: Boolean)
    var
        LineNo: Integer;
        DocNo: Code[20];
        NoSeriesLine: Record "No. Series Line";
        GenJournalBatch: Record "Gen. Journal Batch";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        GenJournalLine: Record "Gen. Journal Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        Clear(LineNo);
        Clear(DocNo);
        Clear(NoSeriesManagement);

        GenJournalBatch.Get('JOURNAL VO', 'JVWRITEOFF');

        // NoSeriesLine.RESET;
        // NoSeriesLine.SETRANGE("Series Code",GenJournalBatch."No. Series");
        // IF NoSeriesLine.FINDFIRST THEN;
        // IF NoSeriesLine."Last No. Used" <> '' THEN
        //  DocNo := NoSeriesLine."Last No. Used"
        // ELSE
        //  DocNo := NoSeriesLine."Starting No.";

        DocNo := NoSeriesManagement.GetNextNo(GenJournalBatch."No. Series", Today, true);
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("No.", InvoiceNo);
        SalesInvoiceHeader.FindFirst;

        //DocNo := INCSTR(DocNo);

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if GenJournalLine.FindLast then
            LineNo += GenJournalLine."Line No." + 10000
        else
            LineNo := 10000;

        Clear(GenJournalLine);
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := GenJournalBatch."Journal Template Name";
        GenJournalLine."Journal Batch Name" := GenJournalBatch.Name;
        GenJournalLine."Document No." := DocNo;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::" ");
        GenJournalLine.Validate("Posting Date", Today);
        GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::Customer);
        GenJournalLine.Validate("Account No.", SalesInvoiceHeader."Sell-to Customer No.");
        GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
        GenJournalLine.Validate("Bal. Account No.", '99-99-999999');
        GenJournalLine.Validate("Credit Amount", AmountToWrtOff);
        GenJournalLine.Validate("Posting No. Series", GenJournalBatch."Posting No. Series");
        GenJournalLine.Validate("Applies-to Doc. Type", GenJournalLine."Applies-to Doc. Type"::Invoice);
        GenJournalLine.Validate("Applies-to Doc. No.", InvoiceNo);
        GenJournalLine."Shortcut Dimension 1 Code" := SalesInvoiceHeader."Shortcut Dimension 1 Code";
        GenJournalLine."Shortcut Dimension 2 Code" := SalesInvoiceHeader."Shortcut Dimension 2 Code";
        GenJournalLine.Insert;
        StatusP := true;
    end;


    procedure GenPracticeDim()
    var
        Practice: Record "Practice/Area/Deliverables";
        PracticeDimVal: Record "Dimension Value";
        AreaDimVal: Record "Dimension Value";
        DocDimVal: Record "Dimension Value";
        ActivityDimVal: Record "Dimension Value";
        PracticeNo: Code[20];
        AreaNo: Code[20];
        DocumentNo: Code[20];
        ActivityNo: Code[20];
    begin
        Practice.Reset;
        if Practice.FindSet then
            repeat
                PracticeDimVal.Reset;
                PracticeDimVal.SetRange("Dimension Code", 'PRACTICE');
                if PracticeDimVal.FindLast then
                    PracticeNo := IncStr(PracticeDimVal.Code)
                else
                    PracticeNo := 'P00001';

                PracticeDimVal.Reset;
                PracticeDimVal.SetRange("Dimension Code", 'PRACTICE');
                PracticeDimVal.SetRange(Name, Practice."Practice Name");
                if not PracticeDimVal.FindFirst then begin
                    PracticeDimVal.Init;
                    PracticeDimVal."Dimension Code" := 'PRACTICE';
                    PracticeDimVal.Code := PracticeNo;
                    PracticeDimVal.Name := Practice."Practice Name";
                    PracticeDimVal.Insert;
                end;

                AreaDimVal.Reset;
                AreaDimVal.SetRange("Dimension Code", 'AREA');
                if AreaDimVal.FindLast then
                    AreaNo := IncStr(AreaDimVal.Code)
                else
                    AreaNo := 'A00001';

                AreaDimVal.Reset;
                AreaDimVal.SetRange("Dimension Code", 'AREA');
                AreaDimVal.SetRange(Name, Practice."Area Name");
                if not AreaDimVal.FindFirst then begin
                    AreaDimVal.Init;
                    AreaDimVal."Dimension Code" := 'AREA';
                    AreaDimVal.Code := AreaNo;
                    AreaDimVal.Name := Practice."Area Name";
                    AreaDimVal.Insert;
                end;

                DocDimVal.Reset;
                DocDimVal.SetRange("Dimension Code", 'DOCUMENT');
                if DocDimVal.FindLast then
                    DocumentNo := IncStr(DocDimVal.Code)
                else
                    DocumentNo := 'D00001';

                DocDimVal.Reset;
                DocDimVal.SetRange("Dimension Code", 'DOCUMENT');
                DocDimVal.SetRange(Name, Practice."Document Name");
                if not DocDimVal.FindFirst then begin
                    DocDimVal.Init;
                    DocDimVal."Dimension Code" := 'DOCUMENT';
                    DocDimVal.Code := DocumentNo;
                    DocDimVal.Name := Practice."Document Name";
                    DocDimVal.Insert;
                end;

                ActivityDimVal.Reset;
                ActivityDimVal.SetRange("Dimension Code", 'ACTIVITY');
                if ActivityDimVal.FindLast then
                    ActivityNo := IncStr(ActivityDimVal.Code)
                else
                    ActivityNo := 'A00001';

                ActivityDimVal.Reset;
                ActivityDimVal.SetRange("Dimension Code", 'ACTIVITY');
                ActivityDimVal.SetRange(Name, Practice."Type of Activity");
                if not ActivityDimVal.FindFirst then begin
                    ActivityDimVal.Init;
                    ActivityDimVal."Dimension Code" := 'ACTIVITY';
                    ActivityDimVal.Code := ActivityNo;
                    ActivityDimVal.Name := Practice."Type of Activity";
                    ActivityDimVal.Insert;
                end;

            until Practice.Next = 0;
    end;


    procedure GenForumDim()
    var
        ForumInfo: Record "Forum Info";
        ForumDimVal: Record "Dimension Value";
        SForumDimVal: Record "Dimension Value";
        FCityDimVal: Record "Dimension Value";
        ForumNo: Code[20];
        SForumNo: Code[20];
        FCityNo: Code[20];
    begin
        ForumInfo.Reset;
        ForumInfo.FindFirst;
        repeat
            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code", 'FORUM');
            if ForumDimVal.FindLast then
                ForumNo := IncStr(ForumDimVal.Code)
            else
                ForumNo := 'F00001';

            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code", 'FORUM');
            ForumDimVal.SetRange(Name, ForumInfo."Forum Name");
            if not ForumDimVal.FindFirst then begin
                ForumDimVal.Init;
                ForumDimVal."Dimension Code" := 'FORUM';
                ForumDimVal.Code := ForumNo;
                ForumDimVal.Name := ForumInfo."Forum Name";
                ForumDimVal.Insert;
            end;

            SForumDimVal.Reset;
            SForumDimVal.SetRange("Dimension Code", 'SUBFORUM');
            if SForumDimVal.FindLast then
                SForumNo := IncStr(SForumDimVal.Code)
            else
                SForumNo := 'SF00001';

            SForumDimVal.Reset;
            SForumDimVal.SetRange("Dimension Code", 'SUBFORUM');
            SForumDimVal.SetRange(Name, ForumInfo."Sub Forum");
            if not SForumDimVal.FindFirst then begin
                SForumDimVal.Init;
                SForumDimVal."Dimension Code" := 'SUBFORUM';
                SForumDimVal.Code := SForumNo;
                SForumDimVal.Name := ForumInfo."Sub Forum";
                SForumDimVal.Insert;
            end;

            FCityDimVal.Reset;
            FCityDimVal.SetRange("Dimension Code", 'FORUMCITY');
            if FCityDimVal.FindLast then
                FCityNo := IncStr(FCityDimVal.Code)
            else
                FCityNo := 'FC00001';

            FCityDimVal.Reset;
            FCityDimVal.SetRange("Dimension Code", 'FORUMCITY');
            FCityDimVal.SetRange(Name, ForumInfo."Forum City");
            if not FCityDimVal.FindFirst then begin
                FCityDimVal.Init;
                FCityDimVal."Dimension Code" := 'FORUMCITY';
                FCityDimVal.Code := FCityNo;
                FCityDimVal.Name := ForumInfo."Forum City";
                FCityDimVal.Insert;
            end;
        until ForumInfo.Next = 0;
    end;


    procedure UpdateDimOnRTB()
    var
        SHeader: Record "Sales Header";
        CaseDimVal: Record "Dimension Value";
        BrnDimVal: Record "Dimension Value";
        ProcessDimVal: Record "Dimension Value";
        DocDimVal: Record "Dimension Value";
        ActivityDimVal: Record "Dimension Value";
        SolutionDimVal: Record "Dimension Value";
        PracticeDimVal: Record "Dimension Value";
        AreaDimVal: Record "Dimension Value";
        ForumDimVal: Record "Dimension Value";
        SForumDimVal: Record "Dimension Value";
        FCityDimVal: Record "Dimension Value";
        Owner1DimVal: Record "Dimension Value";
        Owner2DimVal: Record "Dimension Value";
        TableID: Integer;
        Employee: Record Employee;
    begin
        SHeader.Reset;
        SHeader.SetFilter(SHeader."Document Type", '1|2');
        SHeader.SetFilter("Shortcut Dimension 1 Code", '');
        SHeader.SetFilter("Shortcut Dimension 2 Code", '<>%1', '');
        if SHeader.FindFirst then begin
            repeat
                CaseDimVal.Reset;
                CaseDimVal.SetRange("Dimension Code", 'CASE');
                CaseDimVal.SetRange(Code, SHeader."Shortcut Dimension 2 Code");
                if CaseDimVal.FindFirst then begin
                    //Branch Dimension
                    BrnDimVal.Reset;
                    BrnDimVal.SetRange("Dimension Code", 'BRANCH');
                    BrnDimVal.SetRange(Name, CaseDimVal."Case-Branch");
                    if BrnDimVal.FindFirst then begin
                        SHeader.Validate("Shortcut Dimension 1 Code", BrnDimVal.Code);
                        SHeader.Modify;
                    end;
                end;
            until SHeader.Next = 0;
        end;
    end;


    procedure GenOwnerDim()
    var
        Emp: Record Employee;
        Owner1DimVal: Record "Dimension Value";
        Owner2DimVal: Record "Dimension Value";
    begin
        Emp.Reset;
        if Emp.FindSet then
            repeat
                if Emp."Employee Role" in ['Owner1', 'Owner2'] then begin
                    Owner1DimVal.Reset;
                    Owner1DimVal.SetRange("Dimension Code", 'OWNER1');
                    Owner1DimVal.SetRange(Code, Emp."No.");
                    if not Owner1DimVal.FindFirst then begin
                        Owner1DimVal.Init;
                        Owner1DimVal."Dimension Code" := 'OWNER1';
                        Owner1DimVal.Code := Emp."No.";
                        Owner1DimVal.Name := Emp."First Name";
                        Owner1DimVal."Job Title" := Emp."Job Title";
                        Owner1DimVal."Employee Role" := Emp."Employee Role";
                        Owner1DimVal.Designation := Emp.Designation;
                        Owner1DimVal."Reporting To" := Emp."Reporting To";
                        Owner1DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner1DimVal."Group-Head" := Emp."Group ID";
                        Owner1DimVal."Region ID" := Emp."Region ID";
                        Owner1DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner1DimVal."HR Code" := Emp."HR Code";
                        Owner1DimVal."Full Name" := Emp."Full Name";
                        Owner1DimVal.Insert(true);
                    end;
                end;
                if Emp."Employee Role" in ['Owner2'] then begin
                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'OWNER2');
                    Owner2DimVal.SetRange(Code, Emp."No.");
                    if not Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Init;
                        Owner2DimVal."Dimension Code" := 'OWNER2';
                        Owner2DimVal.Code := Emp."No.";
                        Owner2DimVal.Name := Emp."First Name";
                        Owner2DimVal."Job Title" := Emp."Job Title";
                        Owner2DimVal."Employee Role" := Emp."Employee Role";
                        Owner2DimVal.Designation := Emp.Designation;
                        Owner2DimVal."Reporting To" := Emp."Reporting To";
                        Owner2DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Emp."Group ID";
                        Owner2DimVal."Region ID" := Emp."Region ID";
                        Owner2DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner2DimVal."HR Code" := Emp."HR Code";
                        Owner2DimVal."Full Name" := Emp."Full Name";
                        Owner2DimVal.Insert(true);
                    end;
                end;
                if Emp."Employee Role" = 'Associate' then begin
                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'ASSOCIATES');
                    Owner2DimVal.SetRange(Code, Emp."No.");
                    if not Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Init;
                        Owner2DimVal."Dimension Code" := 'ASSOCIATES';
                        Owner2DimVal.Code := Emp."No.";
                        Owner2DimVal.Name := Emp."First Name";
                        Owner2DimVal."Job Title" := Emp."Job Title";
                        Owner2DimVal."Employee Role" := Emp."Employee Role";
                        Owner2DimVal.Designation := Emp.Designation;
                        Owner2DimVal."Reporting To" := Emp."Reporting To";
                        Owner2DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Emp."Group ID";
                        Owner2DimVal."Region ID" := Emp."Region ID";
                        Owner2DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner2DimVal."HR Code" := Emp."HR Code";
                        Owner2DimVal."Full Name" := Emp."Full Name";
                        Owner2DimVal.Insert(true);
                    end;
                end;
            until Emp.Next = 0;
    end;


    procedure UpdateCustPosting()
    var
        Cust: Record Customer;
        CustTemplate: Record "Customer Template";
    begin
        Cust.Reset;
        Cust.SetFilter("Gen. Bus. Posting Group", '');
        if Cust.FindFirst then
            repeat
                CustTemplate.Reset;
                CustTemplate.SetRange(Default, true);
                if CustTemplate.FindFirst then begin
                    if Cust."Gen. Bus. Posting Group" = '' then
                        Cust."Gen. Bus. Posting Group" := CustTemplate."Gen. Bus. Posting Group";
                    if Cust."VAT Bus. Posting Group" = '' then
                        Cust."VAT Bus. Posting Group" := CustTemplate."VAT Bus. Posting Group";
                    if Cust."Customer Posting Group" = '' then
                        Cust."Customer Posting Group" := CustTemplate."Customer Posting Group";
                    Cust.Modify;
                end;
            until Cust.Next = 0;
    end;


    procedure PDFConvert(FileName: Text[100]; SONo: Code[20])
    var
        FileDirectory: Text[100];
        ReportID: Integer;
        DefaultPrinter: Text[200];
        Window: Dialog;
        WindowisOpen: Boolean;
        SalesInv: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        SalesCrHeader: Record "Sales Cr.Memo Header";
    begin
        /*
        IF ISCLEAR(PDFCreator) THEN
          CREATE(PDFCreator);
        
        IF ISCLEAR(PDFCreatorError) THEN
          CREATE(PDFCreatorError);
        
            ReportID :=REPORT::"MEMO FEES S.T.";
        IF Object.GET(Object.Type::Report,'',ReportID) THEN;
            FileDirectory := 'X:\';
        
        PDFCreatorError := PDFCreator.cError;
        IF PDFCreator.cStart('/NoProcessingAtStartup',TRUE) = FALSE THEN
          ERROR('Status: Error[' + FORMAT(PDFCreatorError.Number) + ']: ' + PDFCreatorError.Description);
        
        IF FileName = '' THEN
          ERROR('File name is not specified');
        
        Object.GET(Object.Type::Report,'',ReportID);
        
        PDFCreatorOption :=  PDFCreator.cOptions;
        
        PDFCreatorOption.UseAutosave := 1;
        PDFCreatorOption.UseAutosaveDirectory := 1;
        PDFCreatorOption.AutosaveDirectory := FileDirectory;
        PDFCreatorOption.AutosaveFormat := 0; //PDF file, you can also save in other formats
        PDFCreatorOption.AutosaveFilename := FileName;
        
        PDFCreator.cOptions := PDFCreatorOption;
        PDFCreator.cClearCache();
        DefaultPrinter := PDFCreator.cDefaultPrinter;
        PDFCreator.cDefaultPrinter := 'PDFCreator';
        PDFCreator.cPrinterStop := FALSE;
        
        SalesInv.SETRANGE(SalesInv."Pre-Assigned No.",SONo);
        //REPORT.RUNMODAL(ReportID,FALSE,TRUE,SalesInv);
        XMLPORT.RUNMODAL(50081,FALSE,SalesInv); //TEAM::1426->For Data auto export
         */

    end;


    procedure GenVenDim()
    var
        VenDim: Record "Dimension Value";
        Ven: Record Vendor;
    begin
        Ven.Reset;
        Ven.FindFirst;
        repeat
            VenDim.Reset;
            VenDim.SetRange("Dimension Code", 'ENTITY');
            VenDim.SetRange(VenDim.Code, Ven."No.");
            if not VenDim.FindFirst then begin
                VenDim.Init;
                VenDim."Dimension Code" := 'ENTITY';
                VenDim.Code := Ven."No.";
                VenDim.Name := Ven.Name;
                VenDim.Insert(true);
            end;
        until Ven.Next = 0;
    end;


    procedure GenCustDim()
    var
        Cust: Record Customer;
        CustDim: Record "Dimension Value";
    begin
        Cust.Reset;
        Cust.FindFirst;
        repeat
            CustDim.Reset;
            CustDim.SetRange("Dimension Code", 'ENTITY');
            CustDim.SetRange(CustDim.Code, Cust."No.");
            if not CustDim.FindFirst then begin
                CustDim.Init;
                CustDim."Dimension Code" := 'ENTITY';
                CustDim.Code := Cust."No.";
                CustDim.Name := Cust.Name;
                CustDim.Insert(true);
            end;

        until Cust.Next = 0;
    end;
}

