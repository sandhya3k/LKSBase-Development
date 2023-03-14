pageextension 50068 pageextension50068 extends "Bank Receipt Voucher"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'Creation Date';
        }
        //>>#94
        modify("Cheque No.")
        {
            Visible = false;
        }
        //#122
        modify(Description)
        {
            Visible = false;
        }

        addafter("Account Name")
        {
            field("Description 3"; Rec."Description 3 ")
            {
                ApplicationArea = all;
                caption = 'Description';
            }
            field("GST Customer Type"; Rec."GST Customer Type")
            {
                ApplicationArea = all;
            }
            field("Check Type"; Rec."Check Type")
            {
                ApplicationArea = all;
            }
            field("POS Out Of India"; Rec."POS Out Of India")
            {
                ApplicationArea = all;
            }
            field("GST TDS/TCS Amount (LCY)"; Rec."GST TDS/TCS Amount (LCY)")
            {
                ApplicationArea = all;
            }
            field("GST TDS/TCS Base Amount (LCY)"; Rec."GST TDS/TCS Base Amount (LCY)")
            {
                ApplicationArea = all;
            }
            field("Order Address Code"; Rec."Order Address Code")
            {
                ApplicationArea = all;
            }
            field("Bill to-Location(POS)"; Rec."Bill to-Location(POS)")
            {
                ApplicationArea = all;
            }
            field(OWNER2; Rec.OWNER2)
            {
                ApplicationArea = all;
            }
            field("Case Id"; Rec."Case Id")
            {
                ApplicationArea = all;

            }
            field("Group Head"; Rec."Group Head")
            {
                ApplicationArea = all;
            }

        }
        //#122

        //<<#94
        //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Location Code"(Control 1500063)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No."(Control 1500033)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No.2"(Control 1500016)".


        //Unsupported feature: Code Insertion on ""Posting Date"(Control 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        //2021
        if "Collection No." <> '' then begin
        CollDetail2.Reset;
        CollDetail2.SetRange(CollDetail2."On Submit Receipt No.","Collection No.");
        CollDetail2.SetRange(CollDetail2."Deposit Bank","Account No.");
        CollDetail2.SetRange(CollDetail2."Deposit Date","Posting Date");
        if "Account Type" = "Account Type"::"Bank Account" then
          Error('you cannot change deposit date');
        end;
        //2021
        //8112
        */
        //end;
        modify("Document Type")
        {
            Visible = false;
        }

        // >> #92
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //8112

                //2021
                IF rec."Collection No." <> '' THEN BEGIN
                    CollDetail2.RESET;
                    CollDetail2.SETRANGE(CollDetail2."On Submit Receipt No.", rec."Collection No.");
                    CollDetail2.SETRANGE(CollDetail2."Deposit Bank", rec."Account No.");
                    CollDetail2.SETRANGE(CollDetail2."Deposit Date", rec."Posting Date");
                    IF rec."Account Type" = rec."Account Type"::"Bank Account" THEN
                        ERROR('you cannot change deposit date');
                END;
                //2021
                //8112
            end;
        }
        modify("Account No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //8112
                //2021
                IF rec."Collection No." <> '' THEN BEGIN
                    CollDetail2.RESET;
                    CollDetail2.SETRANGE(CollDetail2."On Submit Receipt No.", rec."Collection No.");
                    CollDetail2.SETRANGE(CollDetail2."Deposit Bank", rec."Account No.");
                    IF rec."Account Type" = rec."Account Type"::"Bank Account" THEN
                        ERROR('you cannot change');
                END;
                //2021
                //8112  
            end;
        }
        modify("Debit Amount")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //8112

                //2021
                IF Rec."Collection No." <> '' THEN BEGIN
                    CollDetail2.RESET;
                    CollDetail2.SETRANGE(CollDetail2."On Submit Receipt No.", rec."Collection No.");
                    CollDetail2.SETRANGE(CollDetail2."Deposit Bank", rec."Account No.");
                    //CollDetail2.SETRANGE(CollDetail2."Cheque No.", rec."Cheque No.");
                    CollDetail2.SetRange(CollDetail2."Cheque No.", Rec."Cheque No. 2"); //#94
                    CollDetail2.SETRANGE(CollDetail2."Cheque Date", rec."Cheque Date");
                    CollDetail2.SETRANGE(CollDetail2."Cheque Amount", rec."Debit Amount");
                    IF rec."Account Type" = rec."Account Type"::"Bank Account" THEN
                        ERROR('you cannot change Cheque Amount');
                END;
                //2021

                //8112
            end;
        }
        modify("Cheque Date")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //8112
                //2021
                IF rec."Collection No." <> '' THEN BEGIN
                    CollDetail2.RESET;
                    CollDetail2.SETRANGE(CollDetail2."On Submit Receipt No.", rec."Collection No.");
                    CollDetail2.SETRANGE(CollDetail2."Deposit Bank", rec."Account No.");
                    //CollDetail2.SETRANGE(CollDetail2."Cheque No.", rec."Cheque No.");
                    CollDetail2.SETRANGE(CollDetail2."Cheque No.", rec."Cheque No. 2"); //#94
                    CollDetail2.SETRANGE(CollDetail2."Cheque Date", rec."Cheque Date");
                    IF rec."Account Type" = rec."Account Type"::"Bank Account" THEN
                        ERROR('you cannot change Cheque date');
                END;
                //2021
                //8112
            end;
        }
        // << #92

        //Unsupported feature: Code Modification on ""Account No."(Control 10).OnValidate".

        //trigger "(Control 10)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        //8112
        //2021
        if "Collection No." <> '' then begin
        CollDetail2.Reset;
        CollDetail2.SetRange(CollDetail2."On Submit Receipt No.","Collection No.");
        CollDetail2.SetRange(CollDetail2."Deposit Bank","Account No.");
        if "Account Type" = "Account Type"::"Bank Account" then
          Error('you cannot change');
        end;
        //2021
        //8112
        */
        //end;


        //Unsupported feature: Code Insertion on ""Debit Amount"(Control 1500023)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        //2021
        if "Collection No." <> '' then begin
        CollDetail2.Reset;
        CollDetail2.SetRange(CollDetail2."On Submit Receipt No.","Collection No.");
        CollDetail2.SetRange(CollDetail2."Deposit Bank","Account No.");
        CollDetail2.SetRange(CollDetail2."Cheque No.","Cheque No.");
        CollDetail2.SetRange(CollDetail2."Cheque Date","Cheque Date");
        CollDetail2.SetRange(CollDetail2."Cheque Amount","Debit Amount");
        if "Account Type" = "Account Type"::"Bank Account" then
          Error('you cannot change Cheque Amount');
        end;
        //2021

        //8112
        */
        //end;
        //TBD
        /*
        modify("Nature of Supply")
        {
            Visible = false;
        }
        modify("GST Group Code")
        {
            Visible = false;
        }
        modify("GST Group Type")
        {
            Visible = false;
        }
        modify("GST Base Amount")
        {
            Visible = false;
        }
        modify("Total GST Amount")
        {
            Visible = false;
        }
        modify("GST Place of Supply")
        {
            Visible = false;
        }
        modify("GST Bill-to/BuyFrom State Code")
        {
            Visible = false;
        }
        modify("GST Ship-to State Code")
        {
            Visible = false;
        }
        modify("Location State Code")
        {
            Visible = false;
        }
        modify("GST Customer Type")
        {
            Visible = false;
        }
        modify("GST Vendor Type")
        {
            Visible = false;
        }
        modify("HSN/SAC Code")
        {
            Visible = false;
        }
        modify("GST on Advance Payment")
        {
            Visible = false;
        }
        /*


        //Unsupported feature: Code Insertion on ""Cheque Date"(Control 1500073)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112
        //2021
        if "Collection No." <> '' then begin
        CollDetail2.Reset;
        CollDetail2.SetRange(CollDetail2."On Submit Receipt No.","Collection No.");
        CollDetail2.SetRange(CollDetail2."Deposit Bank","Account No.");
        CollDetail2.SetRange(CollDetail2."Cheque No.","Cheque No.");
        CollDetail2.SetRange(CollDetail2."Cheque Date","Cheque Date");
        if "Account Type" = "Account Type"::"Bank Account" then
          Error('you cannot change Cheque date');
        end;
        //2021
        //8112
        */
        //end;


        //Unsupported feature: Code Insertion on ""Applies-to Doc. No."(Control 20)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //CustLedgerEntry2: Record "Cust. Ledger Entry";
        //GJL: Record "Gen. Journal Line";
        //begin
        /*
        */
        //end;
        addafter("Document Type")
        {
            field("Collection No."; rec."Collection No.")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CoHead: Option;
                    CollectionDetail: Record "Collection Detail";
                begin
                    /*
                    IF COMPANYNAME = 'Lakshmi Kumaran & Sridharan' THEN
                      CoHead := 0;
                     IF COMPANYNAME = 'V.Lakshmikumaran' THEN
                        CoHead :=1;
                     IF COMPANYNAME = 'V.Sridharan' THEN
                        CoHead :=2;
                        CollectionDetail.RESET;
                        CollectionDetail.SETRANGE(CollectionDetail.Posted,FALSE);
                        CollectionDetail.SETRANGE(CollectionDetail.Submitted,TRUE);
                        CollectionDetail.SETRANGE(CollectionDetail."Company Head",CoHead);
                        CollectionDetail.SETRANGE(CollectionDetail.Location, "Location Code");
                        IF PAGE.RUNMODAL(50070,CollectionDetail)=ACTION::LookupOK THEN
                           VALIDATE("Collection No.",CollectionDetail."On Submit Receipt No.");
                           VALIDATE("Account Type","Account Type"::Customer);
                           //VALIDATE("Account No.",CollectionDetail."Client ID");
                           "Account No." := CollectionDetail."Client ID";
                           //Description := CollectionDetail."Client Name";
                           Description := CollectionDetail."New Client Name";
                           VALIDATE("Credit Amount",CollectionDetail."Cheque Amount");
                           VALIDATE("Cheque No.",CollectionDetail."Cheque No.");
                           VALIDATE("Cheque Date",CollectionDetail."Cheque Date");
                           VALIDATE("Document Date",CollectionDetail."Creation Date");
                           "Issuing Bank Name":= CollectionDetail."Client Bank Name";
                           "Bal. Account Type" := 3;
                           "Bal. Account No." := CollectionDetail."Deposit Bank";
                           //"Posting Date" := CollectionDetail."Deposit Date";
                           "Document Date" := CollectionDetail."Creation Date";
                           //VALIDATE("Collection No.");
                    */
                    if CompanyName = 'Lakshmi Kumaran & Sridharan' then
                        CoHead := 0;
                    if CompanyName = 'V.Lakshmikumaran' then
                        CoHead := 1;
                    if CompanyName = 'V.Sridharan' then
                        CoHead := 2;
                    CollectionDetail.Reset;
                    CollectionDetail.SetRange(CollectionDetail.Posted, false);
                    CollectionDetail.SetRange(CollectionDetail.Submitted, true);
                    CollectionDetail.SetRange(CollectionDetail."Company Head", CoHead);
                    CollectionDetail.SetRange(CollectionDetail.Location, rec."Location Code");
                    if PAGE.RunModal(50070, CollectionDetail) = ACTION::LookupOK then
                        rec.Validate(rec."Collection No.", CollectionDetail."On Submit Receipt No.");
                    //VALIDATE("Account Type","Account Type"::Customer);
                    //VALIDATE("Account No.",CollectionDetail."Client ID");
                    //"Account No." := CollectionDetail."Client ID";
                    //Description := CollectionDetail."Client Name";
                    //VALIDATE("Credit Amount",CollectionDetail."Cheque Amount");
                    rec.Validate("Document Type", rec."Document Type"::Payment);//New Changes Added-2021
                    rec.Validate("Account Type", rec."Account Type"::"Bank Account"); //New Changes Added-2021
                    rec.Validate("Account No.", CollectionDetail."Deposit Bank"); //New Changes Added-2021
                    rec.Validate("Shortcut Dimension 1 Code", '1');//New Changes Added-2021
                                                                   // if MaxSTRLEN(CollectionDetail."Client Name") > 50 then
                                                                   //     rec."Description 3 " := COPYSTR(CollectionDetail."Client Name", 1, 60)
                                                                   //else
                                                                   // rec."Description 3 " := CollectionDetail."Client Name";
                    rec."Payment Made By" := CollectionDetail."New Client Name";//2021 New Changes Added 2021
                    rec.Validate("Debit Amount", CollectionDetail."Cheque Amount");
                    //rec.Validate("Cheque No.", CollectionDetail."Cheque No.");
                    //rec."Cheque No." := CopyStr(CollectionDetail."Cheque No.", 1, 10);
                    rec.Validate("Cheque No. 2", CollectionDetail."Cheque No.");
                    //#122
                    rec.Validate("Description 3 ", CollectionDetail."Client Name");
                    //#122
                    rec.Validate("Cheque Date", CollectionDetail."Cheque Date");
                    rec.Validate("Document Date", CollectionDetail."Creation Date");
                    rec."Issuing Bank Name" := CollectionDetail."Client Bank Name";
                    rec."Bal. Account Type" := 0;//New Changes Added-2021
                    rec."Document Date" := Today;
                    rec."Posting Date" := CollectionDetail."Deposit Date";//New Changes Added-2021
                    rec."Temp Customer No." := CollectionDetail."Client ID";//New Changes Added-2021
                    rec."Temp TDS Amount" := CollectionDetail."TDS Amount";//Ne Changes Added-2021
                                                                           //"Bal. Account No." := CollectionDetail."Deposit Bank";
                                                                           //VALIDATE("Collection No.");

                end;
            }
            field("Temp Customer No."; Rec."Temp Customer No.")
            {
                Editable = false;
            }
            field("Temp TDS Amount"; Rec."Temp TDS Amount")
            {
            }
        }
        addafter("Document No.")
        {
            field("Issuing Bank Name"; Rec."Issuing Bank Name")
            {
            }
        }
        //Git#83_MAC_30012023++
        addafter("Location Code")
        {
            field("Payment Made By"; Rec."Payment Made By")
            {
                ApplicationArea = All;
            }
            field("Income Account"; Rec."Income Account")
            {
                ApplicationArea = All;
            }
        }
        //Git#83_MAC_30012023--
        //>>#94
        addafter("Location Code")
        {
            field("Cheque No. 2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = All;
            }
        }
        //<<#94
        addafter("TCS Nature of Collection")
        {
            //TBD
            /*
            field("GST Group Code"; Rec."GST Group Code")
            {
            }
            field("GST Group Type"; Rec."GST Group Type")
            {
            }
            field("GST Base Amount"; Rec."GST Base Amount")
            {
            }
            field("GST on Advance Payment"; Rec."GST on Advance Payment")
            {
            }
            field("GST %"; Rec."GST %")
            {
            }
            field("Total GST Amount"; Rec."Total GST Amount")
            {
            }
            field("GST Place of Supply"; Rec."GST Place of Supply")
            {
            }
            /*
            field("GST Customer Type"; Rec."GST Customer Type")
            {
            }
            //TBD
            /*
            field("GST Vendor Type"; Rec."GST Vendor Type")
            {
            }
            field("HSN/SAC Code"; Rec."HSN/SAC Code")
            {
            }
            /*
        }
        addafter("VAT Prod. Posting Group")
        {
            field("Check Type"; Rec."Check Type")
            {
            }
        }
        addafter("Credit Amount")
        {
            field("Amount (LCY)"; Rec."Amount (LCY)")
            {
            }
            field("Income Account"; Rec."Income Account")
            {
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Group Head"; Rec."Group Head")
            {
            }
            field("Case Id"; Rec."Case Id")
            {
            }
            field(OWNER2; OWNER2)
            {
                Editable = false;
            }
        }
        addafter("Reason Code")
        {
            field("Payment Made By"; Rec."Payment Made By")
            {
            }
        }
    }
    a
    actions
    {


        //Unsupported feature: Code Modification on "Dimensions(Action 60).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowDimensions;
        CurrPage.SaveRecord;
        */
            //end;
            //>>>> MODIFIED CODE:
            //begin
            /*
            //ShowDimensions;
            //CurrPage.SAVERECORD;
            TempDim :=
              DimMgt.EditDimensionSet2(
                "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
                "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            GenJournalRec.Get("Journal Template Name","Journal Batch Name","Line No.");
            GenJournalRec."Dimension Set ID" := TempDim;
            GenJournalRec.Modify;
            */
            //end;


            //Unsupported feature: Code Insertion (VariableCollection) on ""P&ost"(Action 44).OnAction".

            //trigger (Variable: CustLedgerEntry2)()
            //Parameters and return type have not been exported.
            //begin
            /*
            */
            //end;


            //Unsupported feature: Code Modification on ""P&ost"(Action 44).OnAction".

            //trigger OnAction()
            //Parameters and return type have not been exported.
            //>>>> ORIGINAL CODE:
            //begin
            /*
            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post",Rec);
            CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
            CurrPage.Update(false);
            */
            //end;
            //>>>> MODIFIED CODE:
            //begin
            /*
            {CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);
            CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
            CurrPage.UPDATE(FALSE);
            }//Standard Code Commented
            //8112

            // Team-2655
            NewGnlLine.SetRange(NewGnlLine."Journal Template Name","Journal Template Name");
            NewGnlLine.SetRange(NewGnlLine."Journal Batch Name","Journal Batch Name");
            if NewGnlLine.FindFirst then begin
               repeat
               if (NewGnlLine."Account Type"=NewGnlLine."Account Type"::Customer) then begin
                  CustRec.SetRange(CustRec."No.",NewGnlLine."Account No.");
                  if CustRec.FindFirst then
                      if (CustRec."Customer Posting Group"='GENERAL') and
                         (NewGnlLine."Income Account"='') then
                         Error('Please Select Income Account');

            end
            else
            //TEAM::1426
            NewGnlLine.SetRange(NewGnlLine."Journal Template Name","Journal Template Name");
            NewGnlLine.SetRange(NewGnlLine."Journal Batch Name","Journal Batch Name");
            if (NewGnlLine."Bal. Account Type"=NewGnlLine."Bal. Account Type"::Customer) then begin
                CustRec.SetRange(CustRec."No.",NewGnlLine."Bal. Account No.");
                if CustRec.FindFirst then
                   if (CustRec."Customer Posting Group"='GENERAL') and (NewGnlLine."Income Account"='') then
                      Error('Please Select Income Account');
            end;
                  until NewGnlLine.Next=0;
            end;

            if ("Currency Code" <>'') and ("Applies-to Doc. No."<>'')then
               Error('Please Remove Applie Doc. No.');

            //TEAM::1426
            if ("Account Type"="Account Type"::"Bank Account") or
                ("Bal. Account Type"="Bal. Account Type"::"Bank Account") or
                 ("Account Type"="Account Type"::Customer) or
                  ("Bal. Account Type"="Bal. Account Type"::Customer)then begin
                   if ("Cheque No."='') or ("Cheque Date" =0D)then
                    Error('Please Fill Cheque No./Cheque Date');
            end;
            {
            //TEAM::1426
            IF (NewGnlLine."Bal. Account Type"=NewGnlLine."Bal. Account Type"::Customer) THEN BEGIN
                CustRec.SETRANGE(CustRec."No.",NewGnlLine."Bal. Account No.");
                IF CustRec.FINDFIRST THEN
                   IF (CustRec."Customer Posting Group"='GENERAL') AND (NewGnlLine."Income Account"='') THEN
                      ERROR('Please Select Income Account');
            END;
                  UNTIL NewGnlLine.NEXT=0;
            END;
            }
            if ("Document Type" = 0)then
               Error('Please Select Document Type.');

            //2021
            GenJnlNarr.SetRange(GenJnlNarr."Journal Template Name","Journal Template Name");
            GenJnlNarr.SetRange(GenJnlNarr."Journal Batch Name","Journal Batch Name");
            GenJnlNarr.SetRange(GenJnlNarr."Document No.","Document No.");
             if not GenJnlNarr.FindFirst then
               repeat
                Error('Please Insert Voucher Narration');
               until GenJnlNarr.Next = 0;
            //2021


            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post",Rec);
            //TEAM:;1426
            GLEntry.Reset;
            //GLEntry.SETRANGE(GLEntry."Collection No.", CollectionDetail."Receipt No.");       //Team::7814 Code Commented
            GLEntry.SetRange(GLEntry."Collection No.", CollectionDetail."On Submit Receipt No.");      //Team::7814
            if GLEntry.FindFirst then
               CollectionDetail.Posted := true;
               CollectionDetail."Posted No." := GLEntry."Document No.";
               CollectionDetail.Modify(true);
            //TEAM::1426
            CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
            CurrPage.Update(false);
            //8112
            */
            //end;
            //TBD
            //addfirst("Posting")
            //{
            //action("Import Salary")
            //{
            // Image = Import;
            //Promoted = true;
            //PromotedIsBig = true;

            //trigger OnAction()
            ///var
            //BankPaymentAdvice: XMLport "Bank Payment Advice";
            //begin
            //Clear(BankPaymentAdvice);
            //BankPaymentAdvice.SetTemplateBatch("Journal Template Name", "Journal Batch Name");
            //BankPaymentAdvice.Run;
            //end;
            //}
            //}

        }
    }
    actions
    {
        addafter("Test Report")
        {
            action("Import Salary")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(BankPaymentAdviceXml);
                    BankPaymentAdviceXml.SetTemplateBatch(rec."Journal Template Name", rec."Journal Batch Name");
                    BankPaymentAdviceXml.Run;
                end;
            }

        }
        // >> #92
        modify(Post)
        {
            //Visible = false;
            trigger OnBeforeAction()
            var
                myInt: Integer;
            begin
                // Team-2655
                NewGnlLine.SETRANGE(NewGnlLine."Journal Template Name", rec."Journal Template Name");
                NewGnlLine.SETRANGE(NewGnlLine."Journal Batch Name", rec."Journal Batch Name");
                IF NewGnlLine.FINDFIRST THEN BEGIN
                    REPEAT
                        IF (NewGnlLine."Account Type" = NewGnlLine."Account Type"::Customer) THEN BEGIN
                            CustRec.SETRANGE(CustRec."No.", NewGnlLine."Account No.");
                            IF CustRec.FINDFIRST THEN
                                IF (CustRec."Customer Posting Group" = 'GENERAL') AND
                                   (NewGnlLine."Income Account" = '') THEN
                                    ERROR('Please Select Income Account');

                        END ELSE
                            //TEAM::1426
                            NewGnlLine.SETRANGE(NewGnlLine."Journal Template Name", rec."Journal Template Name");
                        NewGnlLine.SETRANGE(NewGnlLine."Journal Batch Name", rec."Journal Batch Name");
                        IF (NewGnlLine."Bal. Account Type" = NewGnlLine."Bal. Account Type"::Customer) THEN BEGIN
                            CustRec.SETRANGE(CustRec."No.", NewGnlLine."Bal. Account No.");
                            IF CustRec.FINDFIRST THEN
                                IF (CustRec."Customer Posting Group" = 'GENERAL') AND (NewGnlLine."Income Account" = '') THEN
                                    ERROR('Please Select Income Account');
                        END;
                    UNTIL NewGnlLine.NEXT = 0;
                END;

                IF (rec."Currency Code" <> '') AND (rec."Applies-to Doc. No." <> '') THEN
                    ERROR('Please Remove Applie Doc. No.');
                //TEAM::1426
                IF (rec."Account Type" = rec."Account Type"::"Bank Account") OR
                    (rec."Bal. Account Type" = "Bal. Account Type"::"Bank Account") OR
                     (rec."Account Type" = rec."Account Type"::Customer) OR
                      (rec."Bal. Account Type" = rec."Bal. Account Type"::Customer) THEN BEGIN
                    //IF (rec."Cheque No." = '') OR (rec."Cheque Date" = 0D) THEN
                    if (rec."Cheque No. 2" = '') OR (rec."Cheque Date" = 0D) THEN //#94
                        ERROR('Please Fill Cheque No./Cheque Date');
                END;
                IF (rec."Document Type" = 0) THEN
                    ERROR('Please Select Document Type.');

                //2021
                GenJnlNarr.SETRANGE(GenJnlNarr."Journal Template Name", rec."Journal Template Name");
                GenJnlNarr.SETRANGE(GenJnlNarr."Journal Batch Name", rec."Journal Batch Name");
                GenJnlNarr.SETRANGE(GenJnlNarr."Document No.", rec."Document No.");
                IF NOT GenJnlNarr.FINDFIRST THEN
                    REPEAT
                        ERROR('Please Insert Voucher Narration');
                    UNTIL GenJnlNarr.NEXT = 0;
                //2021
            end;

            trigger OnAfterAction()
            var
                myInt: Integer;
            begin
                //TEAM:;1426
                GLEntry.RESET;
                //GLEntry.SETRANGE(GLEntry."Collection No.", CollectionDetail."Receipt No.");       //Team::7814 Code Commented
                GLEntry.SETRANGE(GLEntry."Collection No.", CollectionDetail."On Submit Receipt No.");      //Team::7814
                IF GLEntry.FINDFIRST THEN
                    CollectionDetail.Posted := TRUE;
                CollectionDetail."Posted No." := GLEntry."Document No.";
                CollectionDetail.MODIFY(TRUE);
                //TEAM::1426
            end;

        }
        // << #92
        modify(Dimensions)
        {
            Visible = false;
        }
        addbefore(Approvals)
        {
            action(DimensionsCopy)
            {
                PromotedOnly = true;
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category10;
                ShortCutKey = 'Alt+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                trigger OnAction()
                begin
                    //ShowDimensions();
                    // CurrPage.SaveRecord();
                    TempDim :=
                        DimMgt.EditDimensionSet(
                        Rec."Dimension Set ID", STRSUBSTNO('%1 %2 %3', Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Line No."),
                        Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code");
                    GenJournalRec.GET(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Line No.");
                    GenJournalRec."Dimension Set ID" := TempDim;
                    GenJournalRec.MODIFY;
                end;
            }
        }
    }

    var
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        DimMgt: Codeunit DimensionManagement;
        CoHead: Option;
        CollectionDetail: Record "Collection Detail";
        CollectionDetail1: Record "Collection Detail";
        GLEntry: Record "G/L Entry";
        "-Team---": Integer;
        GenJnlLine1: Record "Gen. Journal Line";
        NewGnlLine: Record "Gen. Journal Line";
        CustRec: Record Customer;
        GenJnlNarr: Record "Gen. Journal Narration";
        Customer: Record Customer;
        "--2021--": Integer;
        CollDetail2: Record "Collection Detail";
        TempDim: Integer;
        //TBD DimMgt: Codeunit DimensionManagement;
        GenJournalRec: Record "Gen. Journal Line";
        BankPaymentAdviceXml: XmlPort "Bank Payment Advice";
        CurrentJnlBatchName: Code[10];
}

