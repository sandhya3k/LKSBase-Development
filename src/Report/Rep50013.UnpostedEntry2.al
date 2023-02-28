report 50013 "Unposted Entry2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/UnpostedEntry2.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING("Primary Key");
            column(Company_Information_Name; Name)
            {
            }
            column(Company_Information_Adderss; Address + ' ' + "Address 2" + ' ' + City)
            {
            }
            column(Company_Information_Adderss2; "Address 2")
            {
            }
            column(Company_Information_City; City)
            {
            }
            column(Gen__Journal_Line___Cheque_No__; "Company Information"."Address 2")
            {
            }
            column(Company_Information_Primary_Key; "Primary Key")
            {
            }
            column(Document_no; "Gen. Journal Line"."Document No.")
            {
            }
            column(Posting_Date; "Gen. Journal Line"."Posting Date")
            {
            }

            trigger OnPreDataItem()
            begin
                //docNo1 :="Gen. Journal Line"."Document No.";
            end;
        }
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            RequestFilterFields = "Document No.";
            column(Doc_No; docNo1)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(TodayDate; Format(Today, 10))
            {
            }
            column(TIME; Time)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(Gen__Journal_Line__Bal_Acc_no; "Gen. Journal Line"."Bal. Account No.")
            {
            }
            column(PostingDate; "Gen. Journal Line"."Posting Date")
            {
            }
            column(sd____Voucher__; sd)
            {
            }
            column(Gen__Journal_Line__Journal_Batch_Name_; "Journal Batch Name")
            {
            }
            column(datefilter; datefilter)
            {
            }
            column(Gen__Journal_Line__Posting_Date_; Format("Posting Date"))
            {
            }
            column(Gen__Journal_Line__Credit_Amount_; "Credit Amount")
            {
            }
            column(Gen__Journal_Line__Debit_Amount_; "Debit Amount")
            {
            }
            column(glaccname; glaccname)
            {
            }
            column(glAccount; glAccount)
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Cheque_No__; "Gen. Journal Line"."Cheque No. 2")
            {
            }
            column(CrText; CrText)
            {
            }
            column(DrText; DrText)
            {
            }
            column(Dimtext; Dimtext)
            {
            }
            column(Posted_Narration; 'NARRATION:-' + ' ' + Narration)
            {
            }
            column(BalGlAccount; BalGlAccount)
            {
            }
            column(accnamebal; accnamebal)
            {
            }
            column(glaccname_Control1000000079; glaccname)
            {
            }
            column(glAccount_Control1000000083; glAccount)
            {
            }
            column(crAmt; crAmt)
            {
            }
            column(DbAmt; DbAmt)
            {
            }
            column(balCrAmt; balCrAmt)
            {
            }
            column(balDbAmt; balDbAmt)
            {
            }
            column(DrText_Control1000000057; DrText)
            {
            }
            column(To_; 'To')
            {
            }
            column(CrText_Control1000000101; CrText)
            {
            }
            column(Dimtext_Control1000000018; Dimtext)
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Cheque_No___Control1000000032; "Gen. Journal Line"."Cheque No. 2")
            {
            }
            column(NARRATION________Narration_Control1000000038; 'NARRATION' + ' - ' + Narration)
            {
            }
            column(tdsGlName; tdsGlName)
            {
            }
            column(CrText_Control1000000059; CrText)
            {
            }
            column(ABS_tdsDbAmt_; Abs(tdsDbAmt))
            {
            }
            column(ABS_tdsCrAmt_; Abs(tdsCrAmt))
            {
            }
            column(crAmt_Control1000000067; crAmt)
            {
            }
            column(balCrAmt_Control1000000070; balCrAmt)
            {
            }
            column(DbAmt_Control1000000071; DbAmt)
            {
            }
            column(balDbAmt_Control1000000075; balDbAmt)
            {
            }
            column(accnamebal_Control1000000090; accnamebal)
            {
            }
            column(DrText_Control1000000091; DrText)
            {
            }
            column(glaccname_Control1000000092; glaccname)
            {
            }
            column(CrText_Control1000000093; CrText)
            {
            }
            column(BalGlAccount_Control1000000094; BalGlAccount)
            {
            }
            column(glAccount_Control1000000095; glAccount)
            {
            }
            column(CrText_Control1000000103; CrText)
            {
            }
            column(SerTaxPaid; SerTaxPaid)
            {
            }
            column(Sertax; Sertax)
            {
            }
            column(Dimtext_Control1000000022; Dimtext)
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Cheque_No___Control1000000036; "Gen. Journal Line"."Cheque No. 2")
            {
            }
            column(NARRATION________Narration_Control1000000042; 'NARRATION' + ' - ' + Narration)
            {
            }
            column(gtotdr; gtotdr)
            {
            }
            column(gtotcr; gtotcr)
            {
            }
            column(ParticularsCaption; ParticularsCaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(Cheque_No_Caption; Cheque_No_CaptionLbl)
            {
            }
            column(Voucher_No_Caption; Voucher_No_CaptionLbl)
            {
            }
            column(Prepared_by_Caption; Prepared_by_CaptionLbl)
            {
            }
            column(Checked_by_Caption; Checked_by_CaptionLbl)
            {
            }
            column(Received_By_Caption; Received_By_CaptionLbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
            }
            column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Line_No_; "Line No.")
            {
            }
            column(Addr1Var; Addr1Var)
            {
            }
            column(Addr2Var; Addr2Var)
            {
            }
            dataitem(UnpostedNarration; "Gen. Journal Narration")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Document No.", "Gen. Journal Line No.", "Line No.") ORDER(Ascending);
            }

            trigger OnAfterGetRecord()
            begin
                tdsCrAmt := 0;
                Dimtext := ' ';
                Narration := '';

                docNo1 := "Gen. Journal Line"."Document No.";


                getGlCode;
                getGlAcName("Gen. Journal Line"."Journal Template Name", "Gen. Journal Line"."Journal Batch Name",
                                         "Gen. Journal Line"."Document No.", "Gen. Journal Line"."Line No.");

                GetBalGlCode;
                getbalaccName("Gen. Journal Line"."Journal Template Name", "Gen. Journal Line"."Journal Batch Name",
                                         "Gen. Journal Line"."Document No.", "Gen. Journal Line"."Line No.");

                //TBD
                /*if "Gen. Journal Line"."Service Tax Base Amount (LCY)" <> 0 then begin
                    Sertax := "Gen. Journal Line"."Service Tax Amount" + "Gen. Journal Line"."Service Tax eCess Amount"
                    + "Gen. Journal Line"."Service Tax SHE Cess Amount";
                    balCrAmt := DbAmt + Sertax - tdsCrAmt;
                end;
                */
                balCrAmt := DbAmt + Sertax - tdsCrAmt; //3K-UPG

                if Amount < 0 then begin
                    CrText := 'To';
                    DrText := '';
                end else begin
                    CrText := '';
                    DrText := 'Dr';
                end;
                if GenJnlLine."Bal. Account No." = '' then begin
                    if (Amount < 0) then begin
                        crAmt := Abs("Gen. Journal Line".Amount) + Abs(Sertax); //TBD //- Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
                        DbAmt := 0;
                        balCrAmt := 0;
                        CrText := 'To';
                        DrText := '';
                        balDbAmt := Abs("Gen. Journal Line".Amount);
                    end else begin
                        crAmt := 0;
                        DbAmt := "Gen. Journal Line".Amount;
                        balCrAmt := Abs("Gen. Journal Line".Amount);//TBD //- Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
                        balDbAmt := 0;
                        CrText := '';
                        DrText := 'Dr';
                    end;
                end;

                if GenJnlLine."Bal. Account No." <> '' then begin     //6130
                    crAmt := Abs("Gen. Journal Line".Amount) + Abs(Sertax);//TBD //- Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
                    balCrAmt := 0;
                    CrText := ' ';
                    balDbAmt := Abs("Gen. Journal Line".Amount);
                    DbAmt := "Gen. Journal Line".Amount;
                    balCrAmt := Abs("Gen. Journal Line".Amount);//TBD //- Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
                    balDbAmt := 0;
                    DrText := ' ';
                    if Rec_Bank.Get("Gen. Journal Line"."Bal. Account No.") then
                        glaccname := glaccname + ' ' + '(' + Rec_Bank.Name + ')';
                end;

                SourceDesc := '';
                if GenJnlLine."Source Code" <> '' then begin
                    SourceCode.Get("Source Code");
                    SourceDesc := SourceCode.Description;
                    if StrLen(SourceDesc) > 8 then begin
                        i := StrLen(SourceDesc) - 8;
                        sd := CopyStr(SourceDesc, 1, i);
                    end;
                end;

                if SourceDesc = 'Payment Journal' then
                    sd := 'Bank Receipts';

                if SourceDesc = 'Contra' then
                    sd := 'Contra';


                //GenLineNarration.RESET;
                if GenJnlLine."Bal. Account No." = '' then begin
                    GenLineNarration.SetRange(GenLineNarration."Journal Template Name", "Journal Template Name");
                    GenLineNarration.SetRange(GenLineNarration."Journal Batch Name", "Journal Batch Name");
                    GenLineNarration.SetRange(GenLineNarration."Document No.", "Document No.");
                    GenLineNarration.SetRange(GenLineNarration."Gen. Journal Line No.", "Line No.");
                    if GenLineNarration.FindSet(true, true) then begin
                        repeat
                            Narration := Narration + ' ' + GenLineNarration.Narration;
                        until
                        GenLineNarration.Next = 0;
                    end;
                end;

                if GenJnlLine."Bal. Account No." <> '' then begin
                    GenLineNarration.SetRange(GenLineNarration."Journal Template Name", "Journal Template Name");
                    GenLineNarration.SetRange(GenLineNarration."Journal Batch Name", "Journal Batch Name");
                    GenLineNarration.SetRange(GenLineNarration."Document No.", "Document No.");
                    //GenLineNarration.SETRANGE(GenLineNarration."Gen. Journal Line No.","Line No.");
                    if GenLineNarration.FindSet(true, true) then begin
                        repeat
                            Narration := Narration + ' ' + GenLineNarration.Narration;
                        until
                        GenLineNarration.Next = 0;
                    end;
                end;
                //MESSAGE('%1',Narration);
                /*
                Dim.SETRANGE(Dim."Journal Template Name","Gen. Journal Line"."Journal Template Name");
                Dim.SETRANGE(Dim."Journal Batch Name","Gen. Journal Line"."Journal Batch Name");
                Dim.SETRANGE(Dim."Journal Line No.","Gen. Journal Line"."Line No.");
                IF Dim.FIND('-') THEN BEGIN
                  REPEAT
                    IF Dimtext<>'' THEN BEGIN
                      Dimvalue3.SETRANGE(Dimvalue3."Dimension Code",Dim."Dimension Code");
                      Dimvalue3.SETRANGE(Dimvalue3.Code,Dim."Dimension Value Code");
                        IF Dimvalue3.FIND('-') THEN
                          Dimtext:=Dimtext+', '+Dim."Dimension Code"+'-'+Dimvalue3.Name
                          END ELSE BEGIN
                        Dimvalue3.SETRANGE(Dimvalue3."Dimension Code",Dim."Dimension Code");
                        Dimvalue3.SETRANGE(Dimvalue3.Code,Dim."Dimension Value Code");
                      IF Dimvalue3.FIND('-') THEN
                      Dimtext:=Dim."Dimension Code"+'-'+Dimvalue3.Name;
                    END;
                  UNTIL Dim.NEXT=0;
                END;
                */
                DimeSet.Reset;
                DimeSet.SetRange(DimeSet."Dimension Set ID", "Gen. Journal Line"."Dimension Set ID");
                if DimeSet.Find('-') then
                    repeat
                        if Dimtext <> '' then begin
                            Dimvalue3.SetRange(Dimvalue3."Dimension Value ID", DimeSet."Dimension Value ID");
                            if Dimvalue3.Find('-') then
                                //TBD //Dimtext := Dimtext + ', ' + Dim."Dimension Code" + '-' + Dimvalue3.Name
                                Dimtext := Dimtext + ', ' + Dimvalue3."Dimension Code" + '-' + Dimvalue3.Name
                        end
                    until DimeSet.Next = 0;


                //TBD
                /*
                if "Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS" <> 0 then
                    getTds;
                */

                if "Gen. Journal Line"."Location Code" <> '' then begin
                    LocationRec.Reset;
                    LocationRec.SetRange(Code, GenJnlLine."Location Code");
                    if LocationRec.FindFirst then begin
                        Addr1Var := LocationRec.Address;
                        Addr2Var := LocationRec."Address 2" + ' ' + LocationRec.City + ' ' + LocationRec."Post Code" + ' ' + LocationRec."State Code";
                    end
                end;

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(totdr);
                CurrReport.CreateTotals(totcr);
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
        CrText: Text[30];
        DrText: Text[30];
        Dimtext: Text[400];
        Dimtext2: Text[200];
        source: Record "Source Code";
        SourceDisc: Text[50];
        CompInfo: Record "Company Information";
        comp: Text[100];
        i: Integer;
        sd: Text[60];
        SalesH: Record "Sales Header";
        OrdDate: Date;
        Dimtext3: Text[200];
        Dimvalue: Record "Dimension Value";
        Dimvalue2: Record "Dimension Value";
        Dimvalue3: Record "Dimension Value";
        GenJnlLine: Record "Gen. Journal Line";
        GlAcct: Record "G/L Account";
        glaccname: Text[200];
        bankAcct: Record "Bank Account";
        accnamebal: Text[200];
        glAccount: Text[100];
        BankAcc: Record "Bank Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        tdsamountt: Decimal;
        tdsGlAcc: Code[30];
        tdsGlName: Text[200];
        tdsCrAmt: Decimal;
        tdsDbAmt: Decimal;
        crAmt: Decimal;
        DbAmt: Decimal;
        balCrAmt: Decimal;
        balDbAmt: Decimal;
        new: Text[60];
        Sertax: Decimal;
        jnDim: Record "Dimension Value";
        BranchName: Text[60];
        dimBranch: Text[30];
        dimCase: Text[30];
        dimEmp: Text[30];
        dimDeptt: Text[30];
        BalGlAccount: Code[20];
        bankPostinGrp: Record "Bank Account Posting Group";
        vendt: Record Vendor;
        vendPostingGrp: Record "Vendor Posting Group";
        custt: Record Customer;
        CustPostingGrp: Record "Customer Posting Group";
        docNo: Code[10];
        docNo1: Code[20];
        year: Code[30];
        SourceDesc: Text[30];
        SourceCode: Record "Source Code";
        totdr: Decimal;
        totcr: Decimal;
        gtotdr: Decimal;
        gtotcr: Decimal;
        SerTaxPaid: Text[30];
        dimVend: Text[100];
        dimRef: Text[100];
        waste: Text[30];
        datefilter: Text[100];
        GenLineNarration: Record "Gen. Journal Narration";
        dimEntity: Text[100];
        dimBiltele: Text[100];
        DimTele: Text[100];
        dimElec: Text[100];
        dimVen: Text[100];
        Narration: Text[500];
        dimBook: Text[50];
        DimVehicle: Text[30];
        DimTeleCat: Text[30];
        DimQty: Text[50];
        DimFT: Text[100];
        DimEL: Text[30];
        DimEO: Text[50];
        DimDon: Text[30];
        DimPep: Text[30];
        ParticularsCaptionLbl: Label 'Particulars';
        Debit_AmountCaptionLbl: Label 'Debit Amount';
        Credit_AmountCaptionLbl: Label 'Credit Amount';
        DateCaptionLbl: Label 'Date';
        Account_No_CaptionLbl: Label 'Account No.';
        Cheque_No_CaptionLbl: Label 'Cheque No.';
        Voucher_No_CaptionLbl: Label 'Voucher No.';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        Checked_by_CaptionLbl: Label 'Checked by:';
        Received_By_CaptionLbl: Label 'Received By:';
        Total_AmountCaptionLbl: Label 'Total Amount';
        DimeSet: Record "Dimension Set Entry";
        Rec_Bank: Record "Bank Account";
        LocationRec: Record Location;
        Addr1Var: Text[100];
        Addr2Var: Text[100];


    procedure getTds()
    begin
        if "Gen. Journal Line".Amount < 0 then begin
            //TBD //tdsCrAmt := Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
            tdsDbAmt := 0;
        end;
        if "Gen. Journal Line".Amount > 0 then begin
            //TBD //tdsCrAmt := Abs("Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS");
            tdsDbAmt := 0;
        end;



        //TBD 
        /*
        tdsamountt := "Gen. Journal Line"."Total TDS/TCS Incl. SHE CESS";
        tdsGrp.SetRange(tdsGrp."TDS Group", "Gen. Journal Line"."TDS Group");
        if tdsGrp.Find('-') then begin
            GlAcct.Reset;
            GlAcct.SetRange(GlAcct."No.", tdsGrp."TDS Account");
            if GlAcct.Find('-') then begin
                tdsGlAcc := tdsGrp."TDS Account";
                tdsGlName := GlAcct.Name;
            end;
        end;
        */
    end;


    procedure getGlAcName(TemplateNo: Code[30]; BatchName: Code[30]; DocNo: Code[30]; LineNo: Integer)
    begin
        glaccname := ' ';
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", TemplateNo);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", BatchName);
        GenJnlLine.SetRange(GenJnlLine."Document No.", DocNo);
        GenJnlLine.SetRange(GenJnlLine."Line No.", LineNo);
        if GenJnlLine.Find('-') then begin
            if GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account" then begin
                GlAcct.Reset;
                GlAcct.SetRange(GlAcct."No.", GenJnlLine."Account No.");
                if GlAcct.Find('-') then
                    glaccname := GlAcct.Name;
            end
            else
                if GenJnlLine."Account Type" = GenJnlLine."Account Type"::"Bank Account" then begin
                    bankAcct.Reset;
                    bankAcct.SetRange(bankAcct."No.", GenJnlLine."Account No.");
                    if bankAcct.Find('-') then
                        glaccname := bankAcct.Name;
                end
                else
                    if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Vendor then begin
                        vendt.Reset;
                        vendt.SetRange(vendt."No.", GenJnlLine."Account No.");
                        if vendt.Find('-') then begin
                            vendPostingGrp.Reset;
                            vendPostingGrp.SetRange(vendPostingGrp.Code, vendt."Vendor Posting Group");
                            if vendPostingGrp.Find('-') then begin
                                GlAcct.Reset;
                                GlAcct.SetRange(GlAcct."No.", vendPostingGrp."Payables Account");
                                if GlAcct.Find('-') then
                                    glaccname := GlAcct.Name + '( ' + vendt.Name + ' )';
                            end;
                        end;
                    end
                    else
                        if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then begin
                            custt.Reset;
                            custt.SetRange(custt."No.", "Gen. Journal Line"."Account No.");
                            if custt.Find('-') then
                                CustPostingGrp.SetRange(CustPostingGrp.Code, custt."Customer Posting Group");
                            if CustPostingGrp.Find('-') then begin
                                GlAcct.Reset;
                                GlAcct.SetRange(GlAcct."No.", CustPostingGrp."Receivables Account");
                                if GlAcct.Find('-') then begin
                                    glaccname := GlAcct.Name + ' ( ' + custt.Name + ' ) ';
                                end;
                            end;
                        end;
        end;
    end;


    procedure getbalaccName(TemplateNo: Code[30]; BatchName: Code[30]; DocNo: Code[30]; LineNo: Integer)
    begin
        accnamebal := ' ';
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", TemplateNo);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", BatchName);
        GenJnlLine.SetRange(GenJnlLine."Document No.", DocNo);
        GenJnlLine.SetRange(GenJnlLine."Line No.", LineNo);
        if GenJnlLine.Find('-') then begin
            if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::"G/L Account" then begin
                GlAcct.Reset;
                GlAcct.SetRange(GlAcct."No.", GenJnlLine."Bal. Account No.");
                if GlAcct.Find('-') then
                    accnamebal := GlAcct.Name;
            end
            else
                if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::"Bank Account" then begin
                    bankAcct.Reset;
                    bankAcct.SetRange(bankAcct."No.", GenJnlLine."Bal. Account No.");
                    if bankAcct.Find('-') then
                        accnamebal := bankAcct.Name;
                end
                else
                    if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Vendor then begin
                        vendt.Reset;
                        vendt.SetRange(vendt."No.", GenJnlLine."Bal. Account No.");
                        if vendt.Find('-') then begin
                            vendPostingGrp.Reset;
                            vendPostingGrp.SetRange(vendPostingGrp.Code, vendt."Vendor Posting Group");
                            if vendPostingGrp.Find('-') then begin
                                GlAcct.Reset;
                                GlAcct.SetRange(GlAcct."No.", vendPostingGrp."Payables Account");
                                if GlAcct.Find('-') then
                                    accnamebal := GlAcct.Name + '( ' + vendt.Name + ' )';
                            end;
                        end;
                    end
                    else
                        if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer then begin
                            custt.Reset;
                            custt.SetRange(custt."No.", "Gen. Journal Line"."Bal. Account No.");
                            if custt.Find('-') then
                                CustPostingGrp.SetRange(CustPostingGrp.Code, custt."Customer Posting Group");
                            if CustPostingGrp.Find('-') then begin
                                GlAcct.Reset;
                                GlAcct.SetRange(GlAcct."No.", CustPostingGrp."Receivables Account");
                                if GlAcct.Find('-') then begin
                                    accnamebal := GlAcct.Name + ' ( ' + custt.Name + ' ) ';
                                end;
                            end;
                        end;
        end;
    end;


    procedure GetBalGlCode()
    begin
        BalGlAccount := '';
        if "Gen. Journal Line"."Bal. Account Type" = "Gen. Journal Line"."Bal. Account Type"::"G/L Account" then
            BalGlAccount := "Gen. Journal Line"."Bal. Account No."
        else
            if "Gen. Journal Line"."Bal. Account Type" = "Gen. Journal Line"."Bal. Account Type"::"Bank Account" then begin
                BankAcc.Reset;
                BankAcc.SetRange(BankAcc."No.", "Gen. Journal Line"."Bal. Account No.");
                if BankAcc.Find('-') then
                    bankPostinGrp.SetRange(bankPostinGrp.Code, BankAcc."Bank Acc. Posting Group");
                if bankPostinGrp.Find('-') then
                    BalGlAccount := bankPostinGrp."G/L Account No.";
            end
            else
                if "Gen. Journal Line"."Bal. Account Type" = "Gen. Journal Line"."Bal. Account Type"::Vendor then begin
                    vendt.Reset;
                    vendt.SetRange(vendt."No.", "Gen. Journal Line"."Bal. Account No.");
                    if vendt.Find('-') then
                        vendPostingGrp.SetRange(vendPostingGrp.Code, vendt."Vendor Posting Group");
                    if vendPostingGrp.Find('-') then
                        BalGlAccount := vendPostingGrp."Payables Account";
                end
                else
                    if "Gen. Journal Line"."Bal. Account Type" = "Gen. Journal Line"."Bal. Account Type"::Customer then begin
                        custt.Reset;
                        custt.SetRange(custt."No.", "Gen. Journal Line"."Bal. Account No.");
                        if custt.Find('-') then
                            CustPostingGrp.SetRange(CustPostingGrp.Code, custt."Customer Posting Group");
                        if CustPostingGrp.Find('-') then
                            BalGlAccount := CustPostingGrp."Receivables Account";
                    end;
    end;


    procedure getGlCode()
    begin
        glAccount := '';

        if "Gen. Journal Line"."Account Type" = "Gen. Journal Line"."Account Type"::"G/L Account" then
            glAccount := "Gen. Journal Line"."Account No."
        else
            if "Gen. Journal Line"."Account Type" = "Gen. Journal Line"."Account Type"::"Bank Account" then begin
                BankAcc.Reset;
                BankAcc.SetRange(BankAcc."No.", "Gen. Journal Line"."Account No.");
                if BankAcc.Find('-') then
                    bankPostinGrp.SetRange(bankPostinGrp.Code, BankAcc."Bank Acc. Posting Group");
                if bankPostinGrp.Find('-') then
                    glAccount := bankPostinGrp."G/L Account No.";
            end
            else
                if "Gen. Journal Line"."Account Type" = "Gen. Journal Line"."Account Type"::Vendor then begin
                    vendt.Reset;
                    vendt.SetRange(vendt."No.", "Gen. Journal Line"."Account No.");
                    if vendt.Find('-') then
                        vendPostingGrp.SetRange(vendPostingGrp.Code, vendt."Vendor Posting Group");
                    if vendPostingGrp.Find('-') then
                        glAccount := vendPostingGrp."Payables Account";
                end
                else
                    if "Gen. Journal Line"."Account Type" = "Gen. Journal Line"."Account Type"::Customer then begin
                        custt.Reset;
                        custt.SetRange(custt."No.", "Gen. Journal Line"."Account No.");
                        if custt.Find('-') then
                            CustPostingGrp.SetRange(CustPostingGrp.Code, custt."Customer Posting Group");
                        if CustPostingGrp.Find('-') then
                            glAccount := CustPostingGrp."Receivables Account";
                    end;
    end;
}

