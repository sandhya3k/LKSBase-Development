xmlport 50094 "RTB Header VLK"
{
    Direction = Import;
    FieldDelimiter = '<">';
    FieldSeparator = '~';
    FileName = 'C:\1000\RTBHeader_V. Lakshmikumaran.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Header"; "Sales Header")
            {
                AutoUpdate = true;
                XmlName = 'Sales_Header';
                textattribute("<cdselltocust>")
                {
                    XmlName = 'cdSelltoCust1';
                }
                textattribute("<cdshortkut>")
                {
                    XmlName = 'cdShortkut1';
                }
                textattribute("<cdno>")
                {
                    XmlName = 'cdNo1';
                }
                textattribute("<rtbtype>")
                {
                    XmlName = 'RTBtype1';
                }
                textattribute("<billdisc>")
                {
                    XmlName = 'BillDisc1';
                }
                textattribute("<currycode>")
                {
                    XmlName = 'CurryCode1';
                }
                textattribute("<invtype>")
                {
                    XmlName = 'InvType1';
                }
                textattribute("<adjustagnstadv>")
                {
                    XmlName = 'AdjustagnstADv1';
                }
                textattribute("<profchrgamt>")
                {
                    XmlName = 'ProfChrgAmt1';
                }
                textattribute("<reimbursableexpamt>")
                {
                    XmlName = 'ReimbursableExpAmt1';
                }
                textattribute("<confirmationreference>")
                {
                    XmlName = 'ConfirmationReference1';
                }
                textattribute("<invno>")
                {
                    XmlName = 'InvNo1';
                }
                textattribute("<postingdate>")
                {
                    XmlName = 'PostingDate1';
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE('Hi5');
                end;

                trigger OnPreXmlItem()
                begin
                    //MESSAGE('Hi4');
                end;

                trigger OnAfterInitRecord()
                begin
                    //No;
                    //MESSAGE('Hi6');
                    //MESSAGE('Hi 6%1',"<cdNo>");
                end;

                trigger OnAfterInsertRecord()
                begin
                    /*
                    R_SH.RESET;
                    R_SH.INIT;
                    IF RTBtype='Advance' THEN
                     R_SH."Document Type":=R_SH."Document Type"::Order
                    ELSE
                     R_SH."Document Type":=R_SH."Document Type"::Invoice;
                     R_SH."No.":="<cdNo>";
                     R_SH."Posting Date":=WORKDATE;
                       R_SH."Document Date":=WORKDATE;
                     R_SH."Due Date":=WORKDATE;
                     R_SH.VALIDATE("Sell-to Customer No.","<cdSelltoCust>");
                    //EVALUATE(VarInvType,"<InvType>");
                    
                    IF "<AdjustagnstADv>" = '' THEN
                       VarAdjustagnstADv := 0
                    ELSE
                       EVALUATE(VarAdjustagnstADv,"<AdjustagnstADv>");
                    
                    IF "<ProfChrgAmt>" = '' THEN
                       VarProfChrgAmt := 0
                    ELSE
                      EVALUATE(VarProfChrgAmt,"<ProfChrgAmt>");
                    
                    IF "<ReimbursableExpAmt>" = '' THEN
                        VarReimbursableExpAmt := 0
                    ELSE
                       EVALUATE(VarReimbursableExpAmt,"<ReimbursableExpAmt>");
                    
                    EVALUATE(VarPostingDate,"<PostingDate>");
                    
                      R_SH."RTB Type":="<RTBtype>";
                    // R_SH.VALIDATE("Invoice Type","<InvType>");
                      R_SH.VALIDATE("Invoice Type",VarInvType);
                      IF (VarInvType = 1) OR (VarInvType = 3 )THEN
                        R_SH.Structure := 'ST';
                        R_SH.VALIDATE(R_SH.Structure);
                        R_SH."Posting No. Series" :='INV';
                      IF "<CurryCode>"<>'INR' THEN
                        R_SH.VALIDATE("Currency Code","<CurryCode>");
                        R_SH."Adjust Against Adv.":=VarAdjustagnstADv;
                        R_SH."Bill Description":=  "<BillDisc>";
                        R_SH."Prof. Chrg. Amt.":=  VarProfChrgAmt;
                      IF VarReimbursableExpAmt = 0 THEN
                         R_SH."Reimbursable Exp. Amt.":= 0
                      ELSE
                         R_SH."Reimbursable Exp. Amt.":=VarReimbursableExpAmt;
                    
                        R_SH."Confirmation Reference":="<ConfirmationReference>";
                        R_SH."Posting Date" := VarPostingDate;
                        R_SH."Posting No." := "<InvNo>";
                    
                      IF NOT R_SH.INSERT(TRUE) THEN
                             R_SH.MODIFY;
                    
                      R_SH1.COPY(R_SH);
                      R_SH1.VALIDATE("Shortcut Dimension 2 Code","<cdShortkut>");
                      R_SH1.MODIFY(TRUE);
                      */
                    /*
                    //TEAM::4217++
                    R_SHHistory.RESET;
                    R_SHHistory.INIT;
                    R_SHHistory.TRANSFERFIELDS(R_SH);
                    R_SHHistory.INSERT(TRUE);
                    R_SHHistory.TRANSFERFIELDS(R_SH1);
                    R_SHHistory.MODIFY;
                    */
                    //TEAM::4217--

                end;

                trigger OnAfterModifyRecord()
                begin
                    //No;
                    //MESSAGE('Hi3');
                    //MESSAGE('Hi 3%1...',"<cdNo>");
                    R_SH.Reset;
                    R_SH.Init;
                    if RTBtype = 'Advance' then
                        R_SH."Document Type" := R_SH."Document Type"::Order
                    else
                        R_SH."Document Type" := R_SH."Document Type"::Invoice;
                    R_SH."No." := "<cdNo>";
                    R_SH."Posting Date" := WorkDate;
                    R_SH."Document Date" := WorkDate;
                    R_SH."Due Date" := WorkDate;
                    R_SH.Validate("Sell-to Customer No.", "<cdSelltoCust>");
                    //EVALUATE(VarInvType,"<InvType>");

                    if "<AdjustagnstADv>" = '' then
                        VarAdjustagnstADv := 0
                    else
                        Evaluate(VarAdjustagnstADv, "<AdjustagnstADv>");

                    if "<ProfChrgAmt>" = '' then
                        VarProfChrgAmt := 0
                    else
                        Evaluate(VarProfChrgAmt, "<ProfChrgAmt>");

                    if "<ReimbursableExpAmt>" = '' then
                        VarReimbursableExpAmt := 0
                    else
                        Evaluate(VarReimbursableExpAmt, "<ReimbursableExpAmt>");

                    Evaluate(VarPostingDate, "<PostingDate>");

                    R_SH."RTB Type" := "<RTBtype>";
                    // R_SH.VALIDATE("Invoice Type","<InvType>");
                    R_SH.Validate(InvoiceType, VarInvType);
                    if (VarInvType = 1) or (VarInvType = 3) then
                        R_SH."Posting No. Series" := 'INV';
                    if "<CurryCode>" <> 'INR' then
                        R_SH.Validate("Currency Code", "<CurryCode>");
                    R_SH."Adjust Against Adv." := VarAdjustagnstADv;
                    R_SH."Bill Description" := "<BillDisc>";
                    R_SH."Prof. Chrg. Amt." := VarProfChrgAmt;
                    if VarReimbursableExpAmt = 0 then
                        R_SH."Reimbursable Exp. Amt." := 0
                    else
                        R_SH."Reimbursable Exp. Amt." := VarReimbursableExpAmt;

                    R_SH."Confirmation Reference" := "<ConfirmationReference>";
                    R_SH."Posting Date" := VarPostingDate;
                    R_SH."Posting No." := "<InvNo>";
                    R_SH.InvoiceType := R_SH.InvoiceType::"NON-TAXABLE";
                    if not R_SH.Insert(true) then
                        R_SH.Modify;

                    R_SH1.Copy(R_SH);
                    R_SH1.Validate("Shortcut Dimension 2 Code", "<cdShortkut>");
                    R_SH1.Modify(true);
                end;

                trigger OnBeforeModifyRecord()
                begin
                    //No;
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
}

