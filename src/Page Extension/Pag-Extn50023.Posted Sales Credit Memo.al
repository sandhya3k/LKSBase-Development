pageextension 50023 pageextension50023 extends "Posted Sales Credit Memo"
{
    layout
    {
        //TBD
        /*
        modify("Cancel Reason")
        {
            Visible = false;
        }
        */
        addafter("Tax Info")
        {
            part("E-Invoice"; "E-Invoicing Information")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
    actions
    {
        addfirst("&Cr. Memo")
        {
            action("API Authentication Test")
            {
                ApplicationArea = All;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    EInvoiceCreate: Codeunit "E-Invoice Generation";
                begin
                    EInvoiceCreate.AuthenticateCredentials('07AAAFL1585H1ZD');
                    Message('The Authentication validation completed');
                end;

            }
            action("Reset IRN")
            {
                ApplicationArea = All;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesInvExtended: Record "Posted Sales Extended";
                begin
                    SalesInvExtended.Reset();
                    if SalesInvExtended.get(SalesInvExtended."Posted Document Type"::"Credit-Memo", rec."No.") then begin
                        SalesInvExtended."IRN No." := '';
                        SalesInvExtended."Ack No." := '';
                        clear(SalesInvExtended."Ack Date");
                        Clear(SalesInvExtended."QR Code");
                        SalesInvExtended.Modify(true);
                    end;
                    Message('IRN has been cleared for document %1 and IRN No: %2', SalesInvExtended."No.", SalesInvExtended."IRN No.");

                end;

            }
            action("Create IRN")
            {
                ApplicationArea = All;
                Ellipsis = true;
                Enabled = CreateIRN;
                Image = CreateElectronicReminder;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    RespQueue: Record "LCMS Response Queue";
                    EInvoiceGeneration: Codeunit "E-Invoice Generation";
                begin
                    if Ship2Add.Get(rec."Sell-to Customer No.", rec."Ship-to Code") then;
                    if (rec."Posting Date" >= 20210101D) and not (Ship2Add."Transaction Type" in [Ship2Add."Transaction Type"::B2C]) then begin
                        if Confirm('Do you want to create IRN No.?') then begin
                            Clear(EInvoiceGeneration);
                            Clear(LocR);
                            if LocR.Get(rec."Location Code") then;
                            SalesCrMemoHdrExtend.Reset;
                            SalesCrMemoHdrExtend.SetRange("No.", rec."No.");
                            if SalesCrMemoHdrExtend.FindFirst then;
                            if SalesCrMemoHdrExtend."IRN No." = '' then begin
                                EInvoiceGeneration.AuthenticateCredentials(LocR."GST Registration No.");
                                EInvoiceGeneration.CreditNoteIRNNumberNew(Rec);
                            end;
                            SalesCrMemoHdrExtend.Reset;
                            SalesCrMemoHdrExtend.SetRange("No.", rec."No.");
                            if SalesCrMemoHdrExtend.FindFirst then;
                            if (SalesCrMemoHdrExtend."IRN No." <> '') then begin
                                //InvDoc := rec.PostedCRLink(rec."No.");
                                RespQueue.CreateQueue(Rec."Pre-Assigned No.");
                                rec.PostedCRLink(rec."No.", RespQueue);
                                //LKS := LKS.LKSFunctions();
                                if rec."Currency Factor" <> 0 then
                                    ExchangRate := 1 / rec."Currency Factor"
                                else
                                    ExchangRate := 1;
                                Clear(InvGenDate);
                                InvGenDate := CreateDateTime(rec."Posting Date", Time);
                                //MESSAGE(FORMAT(LKS.CRTBUpdate("Pre-Assigned No.",'CC',"No.",FORMAT(InvGenDate,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'),InvDoc,'')));
                                RespQueue.CRTBPayload('CC', Rec."No.", FORMAT(InvGenDate, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), '');
                                RespQueue.Insert(true);
                            end;
                        end else
                            Message('IRN No. %1 already generated.', SalesCrMemoHdrExtend."IRN No.");
                    end else begin
                        Message('IRN is not needed for unregistered customer type');
                        //InvDoc := rec.PostedCRLink(rec."No.");
                        RespQueue.CreateQueue(Rec."Pre-Assigned No.");
                        rec.PostedCRLink(rec."No.", RespQueue);
                        //LKS := LKS.LKSFunctions();
                        if rec."Currency Factor" <> 0 then
                            ExchangRate := 1 / rec."Currency Factor"
                        else
                            ExchangRate := 1;
                        Clear(InvGenDate);
                        InvGenDate := CreateDateTime(rec."Posting Date", Time);
                        //MESSAGE(FORMAT(LKS.CRTBUpdate("Pre-Assigned No.",'CC',"No.",FORMAT(InvGenDate,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'),InvDoc,'')));
                        RespQueue.CRTBPayload('CC', Rec."No.", FORMAT(InvGenDate, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), '');
                        RespQueue.Insert(true);
                    end;

                end;
            }
        }
        addafter(Print)
        {
            action("Credit Note GST")
            {
                ApplicationArea = All;
                Caption = 'Credit Note GST';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesCrMemoHeader1: Record "Sales Cr.Memo Header";
                begin
                    //Team::7814
                    if rec."Shortcut Dimension 1 Code" <> '1' then
                        Error('Please select Branch Invoice.');
                    if Ship2Add.Get(rec."Sell-to Customer No.", rec."Ship-to Code") then;
                    if (rec."Posting Date" > 20201231D) and not (Ship2Add."Transaction Type" in [Ship2Add."Transaction Type"::B2C]) then begin
                        PostedSalesExt.Reset;
                        PostedSalesExt.SetRange("No.", rec."No.");
                        if PostedSalesExt.FindFirst then;
                        PostedSalesExt.TestField("IRN No.");
                        SalesCrMemoHeader1.Reset;
                        SalesCrMemoHeader1.SetRange("No.", rec."No.");
                        if SalesCrMemoHeader1.Find('-') then
                            REPORT.Run(50147, true, false, SalesCrMemoHeader1);
                        //Team::7814
                    end else begin
                        SalesCrMemoHeader1.Reset;
                        SalesCrMemoHeader1.SetRange("No.", rec."No.");
                        if SalesCrMemoHeader1.Find('-') then
                            REPORT.Run(50147, true, false, SalesCrMemoHeader1);
                    end;
                end;
            }
            action("Print Credit Note GST Branch")
            {
                ApplicationArea = All;
                Caption = 'Print Credit Note GST Branch';
                Image = PrintVAT;

                trigger OnAction()
                var
                    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                begin
                    if rec."Shortcut Dimension 1 Code" = '1' then
                        Error('Please select Tax Credit-Note.');

                    SalesCrMemoHeader.Reset;
                    SalesCrMemoHeader.SetRange("No.", rec."No.");
                    REPORT.RunModal(50174, true, true, SalesCrMemoHeader);
                end;
            }
            action("Print Credit Note GST  Branch Logo")
            {
                ApplicationArea = All;
                Caption = 'Print Credit Note GST  Branch Logo';
                Image = Print;

                trigger OnAction()
                var
                    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                begin
                    if rec."Shortcut Dimension 1 Code" = '1' then
                        Error('Please select Tax Credit-Note.');
                    SalesCrMemoHeader.Reset;
                    SalesCrMemoHeader.SetRange("No.", rec."No.");
                    REPORT.RunModal(50175, true, true, SalesCrMemoHeader);
                end;
            }
            action("Print Credit Note GST  Logo")
            {
                ApplicationArea = All;
                Caption = 'Print Credit Note GST  Logo';
                Image = PrintVAT;

                trigger OnAction()
                var
                    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                begin
                    if rec."Shortcut Dimension 1 Code" <> '1' then
                        Error('Please select Branch Invoice.');
                    SalesCrMemoHeader.Reset;
                    SalesCrMemoHeader.SetRange("No.", rec."No.");
                    REPORT.RunModal(50176, true, true, SalesCrMemoHeader);
                end;
            }
            action("Credit IBL Note GST")
            {
                ApplicationArea = All;
                Caption = 'Credit IBL Note GST';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesCrMemoHeader1: Record "Sales Cr.Memo Header";
                begin
                    if CompanyName <> 'INSTITUTE OF BUSINESS LAWS' then
                        Error('This report is for IBL');

                    //Team::7814
                    SalesCrMemoHeader1.Reset;
                    SalesCrMemoHeader1.SetRange("No.", rec."No.");
                    if SalesCrMemoHeader1.Find('-') then
                        REPORT.Run(50143, true, false, SalesCrMemoHeader1);
                    //Team::7814
                end;
            }
        }
    }

    var
        LocR: Record Location;
        RTBNo: Code[20];
        RTBState: Text[20];
        InvoiceNo: Text[20];
        InvGenDate: DateTime;
        InvDoc: Text[100];
        Rejreason: Text[250];
        InvConvRate: Text[20];
        CrtbStatus: Text[20];
        CreditNoteDoc: Code[20];
        CreditNoteDate: DateTime;
        RejreasonCrtb: Text[250];
        Crtb_No: Code[20];
        ExchangRate: Decimal;
        PostedSalesExt: Record "Posted Sales Extended";
        CreateIRN: Boolean;
        SalesCrMemoHdrExtend: Record "Posted Sales Extended";
        Ship2Add: Record "Ship-to Address";


    //Unsupported feature: Code Insertion on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //begin
    /*
    CreateIRN:=false;
    */
    //end;

    trigger OnOpenPage()
    begin
        if rec."Shortcut Dimension 1 Code" = '1' then
            CreateIRN := true
        else
            CreateIRN := false;
    end;
}

