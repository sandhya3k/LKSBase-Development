pageextension 50073 pageextension50073 extends "Bank Payment Voucher"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'Creation Date';
        }

        //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Location Code"(Control 1500080)".


        //Unsupported feature: Property Modification (Name) on ""Cheque No."(Control 1500010)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No."(Control 1500010)".


        //Unsupported feature: Property Modification (Name) on ""Cheque Date"(Control 1500111)".

        modify("Check Printed")
        {
            Visible = true;
            ApplicationArea = all;
        }

        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No.2"(Control 1500048)".

        modify("TCS Nature of Collection")
        {
            Visible = false;
        }
        //TBD
        /*
        modify("TDS/TCS %")
        {
            Visible = false;
        }
        modify("TDS/TCS Base Amount")
        {
            Visible = false;
        }
        modify("TDS/TCS Amount")
        {
            Visible = false;
        }
        modify("Surcharge %")
        {
            Visible = false;
        }
        modify("Surcharge Amount")
        {
            Visible = false;
        }
        modify("eCESS %")
        {
            Visible = false;
        }
        modify("eCESS on TDS/TCS Amount")
        {
            Visible = false;
        }
        modify("SHE Cess % on TDS/TCS")
        {
            Visible = false;
        }
        modify("SHE Cess on TDS/TCS Amount")
        {
            Visible = false;
        }
        modify("Total TDS/TCS Incl. SHE CESS")
        {
            Visible = false;
        }
        modify("Work Tax Nature Of Deduction")
        {
            Visible = false;
        }
        modify("Work Tax Base Amount")
        {
            Visible = false;
        }
        modify("Work Tax %")
        {
            Visible = false;
        }
        modify("Work Tax Amount")
        {
            Visible = false;
        }
        */
        modify("VAT Amount")
        {
            Visible = false;
        }
        modify("VAT Difference")
        {
            Visible = false;
        }
        modify("Amount Excl. GST")
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
        //TBD
        //#122
        // modify(Description)
        // {
        //     Visible = false;
        //     // trigger OnAfterValidate()
        //     // var
        //     //     GenJnlRec: Record "Gen. Journal Line";

        //     // begin
        //     //     // rec.Validate("Description 3 ",de);
        //     //     GenJnlRec.Validate("Description 3 ", Rec.Description);



        //     // end;

        // }

        addafter("Currency Code")
        {
            // field("Description 3"; Rec."Description 3 ")
            // {
            //     Caption = 'Description';
            //     ApplicationArea = all;
            // }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = all;
            }
            field("Inc. GST in TDS Base"; Rec."Inc. GST in TDS Base")
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
            field("GST TDS/TCS Base Amount (LCY)"; Rec."GST TDS/TCS Base Amount (LCY)")
            {
                ApplicationArea = all;
            }
            field("GST TDS/TCS Amount (LCY)"; Rec."GST TDS/TCS Amount (LCY)")
            {
                ApplicationArea = all;
            }
            field("POS Out Of India"; Rec."POS Out Of India")
            {
                ApplicationArea = all;
            }
            // field("Bank Payment Type";Rec."Bank Payment Type")
            // {
            //     ApplicationArea = all;

            // }
            // field("Check Printed";Rec."Check Printed")

        }
        //#122
        /*
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
        */
        modify("Location State Code")
        {
            Visible = false;
        }
        //TBD
        /*
        modify("GST Customer Type")
        {
            Visible = false;
        }
        */
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
        //>>#94
        modify("Cheque No.")
        {
            Visible = false;
        }
        addafter("Location Code")
        {
            field("Cheque No. 2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = All;
            }

        }
        //<<#94
        addafter("Document No.")
        {
            field("Party Type"; Rec."Party Type")
            {
                ApplicationArea = All;
            }
            field("Party Code"; Rec."Party Code")
            {
                ApplicationArea = All;
            }
            field("Check Type"; Rec."Check Type")
            {
                ApplicationArea = all;
            }
            field("External Doc. Date"; Rec."External Doc. Date")
            {
                ApplicationArea = all;
            }

            field("Collection No."; Rec."Collection No.")
            {
                Caption = 'Exp.Doc. No.';

                trigger OnLookup(var Text: Text): Boolean
                begin
                    if CompanyName = 'Lakshmi Kumaran & Sridharan' then
                        CoHead := 0;
                    if CompanyName = 'V.Lakshmikumaran' then
                        CoHead := 1;
                    if CompanyName = 'V.Sridharan' then
                        CoHead := 2;
                    ExpanceDetail.Reset;
                    ExpanceDetail.SetRange(ExpanceDetail."Company Head", CoHead);
                    ExpanceDetail.SetRange(ExpanceDetail."Mode of Payment", 1);
                    if PAGE.RunModal(50071, ExpanceDetail) = ACTION::LookupOK then
                        rec.Validate("Collection No.", ExpanceDetail."Expense Voucher No.");
                    rec.Validate("Account Type", 0);
                    rec.Validate("Account No.", ExpanceDetail."Expense Account");
                    rec.Validate(Amount, ExpanceDetail.Amount);
                    rec.Validate("Shortcut Dimension 2 Code", ExpanceDetail."Case id No.");
                    rec.Validate("External Doc. Date", ExpanceDetail."External Document Date");
                    rec.Validate("External Document No.", ExpanceDetail."External Document No.");
                    rec.Validate("Credit Amount", ExpanceDetail."Amount Credit");
                    //rec.Validate("Cheque No.", ExpanceDetail."Cheque No.");
                    //#122
                    // rec.Validate("Description 3 ", ExpanceDetail.Description);
                    //#122
                    rec.Validate("Cheque No. 2", ExpanceDetail."Cheque No."); //#94
                    rec.Validate("Cheque Date", ExpanceDetail."Cheque Date");
                    rec.Validate("Document Date", ExpanceDetail."Creation Date");
                    rec.Validate(Remarks, ExpanceDetail.Naration);
                    rec.Validate("Collection No.");
                end;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Source Code"; Rec."Source Code")
            {
                ApplicationArea = all;
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;

            }
            field("Income Account"; Rec."Income Account")
            {
                ApplicationArea = all;
            }
            field("Group Head"; Rec."Group Head")
            {
            }
            // field("Check Type"; Rec."Check Type")
            // {
            //     ApplicationArea = all;
            // }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Dimensions(Action 58).OnAction".

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


        //Unsupported feature: Code Modification on ""Print Check"(Action 1500042).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlLine.Reset;
        GenJnlLine.Copy(Rec);
        GenJnlLine.SetRange("Journal Template Name","Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name","Journal Batch Name");
        if GenJnlLine.FindFirst then begin
          GenJnlLine.CalcTDS("Document No.");
          Commit;
        end;
        DocPrint.PrintCheck(GenJnlLine);
        CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..4
        GenJnlLine.SetRange("Document No.","Document No.");
        GenJnlLine.SetRange("Line No.","Line No.");
        if GenJnlLine.FindSet(false,false) then
          if (GenJnlLine."Account No."<>'') and (GenJnlLine."Bal. Account No."='BANK-001') then begin
              REPORT.RunModal(50017,true,false,GenJnlLine)
              end
              else
          if (GenJnlLine."Line No." > 10000) and (GenJnlLine."Account No."='BANK-001') then begin
              REPORT.RunModal(50131,true,false,GenJnlLine)
              end;
        CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        {

        GenJnlLine.RESET;
        GenJnlLine.COPY(Rec);
        GenJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
        GenJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
        GenJnlLine.SETRANGE("Document No.","Document No.");
        GenJnlLine.SETRANGE("Line No.","Line No.");
        IF GenJnlLine.FINDSET(FALSE,FALSE) THEN
          IF (GenJnlLine."Account No."<>'') AND (GenJnlLine."Bal. Account No."='BANK-001') THEN BEGIN
              REPORT.RUNMODAL(50017,TRUE,FALSE,GenJnlLine)
              END
              ELSE
          IF (GenJnlLine."Line No." > 10000) AND (GenJnlLine."Account No."='BANK-001') THEN BEGIN
              REPORT.RUNMODAL(50131,TRUE,FALSE,GenJnlLine)
              END;
        CODEUNIT.RUN(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        }
        */
        //end;
        addfirst("&Payments")
        {
            action("Import Salary")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    BankPaymentAdvice: XMLport "Bank Payment Advice";
                begin
                    Clear(BankPaymentAdvice);
                    BankPaymentAdvice.SetTemplateBatch(rec."Journal Template Name", rec."Journal Batch Name");
                    BankPaymentAdvice.Run;
                end;
            }
        }
        addafter("Void Check")
        {
            action("<Action1500045>")
            {
                Caption = 'HDFC Check';
                Image = Check;
                Visible = false;

                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");
                    //       DocPrint.PrintCheck(GenJnlLine);
                    REPORT.RunModal(50017, true, false, GenJnlLine);
                    CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance", Rec);
                end;
            }
            action(HDFC_New_M)
            {
                Visible = false;

                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");
                    GenJnlLine.SetRange("Line No.", rec."Line No.");
                    if GenJnlLine.FindSet(false, false) then
                        REPORT.RunModal(50131, true, false, GenJnlLine);
                    CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance", Rec);
                end;
            }
            action("<Action1500046>")
            {
                ApplicationArea = All;
                Caption = 'HDFC Check Multi Line';
                Image = Check;

                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");

                    /*
                    IF TotalBalance <>0
                       THEN
                       ERROR(Text5000,"Document No.")
                       ELSE
                    */
                    REPORT.RunModal(50031, true, false, GenJnlLine);

                end;
            }
        }
        addafter(Preview)
        {
            action("<Action48>")
            {
                Caption = 'Test Voucher';
                Image = Voucher;

                trigger OnAction()
                begin

                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");
                    REPORT.RunModal(50013, true, false, GenJnlLine);
                end;
            }
        }
        // >> #92
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
                        rec."Dimension Set ID", STRSUBSTNO('%1 %2 %3', rec."Journal Template Name", rec."Journal Batch Name", rec."Line No."),
                        rec."Shortcut Dimension 1 Code", rec."Shortcut Dimension 2 Code");
                    GenJournalRec.GET(rec."Journal Template Name", rec."Journal Batch Name", rec."Line No.");
                    GenJournalRec."Dimension Set ID" := TempDim;
                    GenJournalRec.MODIFY;
                end;
            }
        }
        modify("Print Check")
        {
            Visible = false;
        }
        addafter("P&review Check")
        {
            action("Print CheckCopy")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Check';
                ToolTip = 'Select this option to Print computer check, if the Bank Payment Type field on the Payment Journal window is set to Computer Check, the checks must be printed before posting the journal.';
                Ellipsis = true;
                Image = PrintCheck;
                trigger OnAction()
                begin
                    GenJnlLine.RESET;
                    GenJnlLine.COPY(Rec);
                    GenJnlLine.SETRANGE("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SETRANGE("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SETRANGE("Document No.", rec."Document No.");
                    GenJnlLine.SETRANGE("Line No.", rec."Line No.");
                    IF GenJnlLine.FINDSET(FALSE, FALSE) THEN
                        IF (GenJnlLine."Account No." <> '') AND (GenJnlLine."Bal. Account No." = 'BANK-001') THEN BEGIN
                            REPORT.RUNMODAL(50017, TRUE, FALSE, GenJnlLine)
                        END
                        ELSE
                            IF (GenJnlLine."Line No." > 10000) AND (GenJnlLine."Account No." = 'BANK-001') THEN BEGIN
                                REPORT.RUNMODAL(50131, TRUE, FALSE, GenJnlLine)
                            END;
                    CODEUNIT.RUN(CODEUNIT::"Adjust Gen. Journal Balance", Rec);
                end;

            }
        }
        // << #92
    }

    var
        ExpanceDetail: Record "Expense Detail";
        CoHead: Option;
        "--509--": Integer;
        DimSetEntry: Record "Dimension Set Entry";
        DimVal: Record "Dimension Value";
        "--2021--": Integer;
        GenJnlLine3: Record "Gen. Journal Line";
        GenJnlLine: Record "Gen. Journal Line";
        GDimSetID: Integer;
        GDimName: Text[250];
        TempDim: Integer;
        DimMgt: Codeunit DimensionManagement;
        GenJournalRec: Record "Gen. Journal Line";
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        GJL: Record "Gen. Journal Line";
}

