pageextension 50069 pageextension50069 extends "Contra Voucher"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'Creation Date';
        }

        //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No."(Control 1500004)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Cheque No.2"(Control 1500045)".
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
        addafter("Bal. Account No.")
        {
            field("Check Type"; rec."Check Type")
            {
            }
        }
        //#122
        // modify(Description)
        // {
        //     Visible = false;
        // }

        addafter("Currency Code")
        {
            // field("Description 3"; Rec."Description 3 ")
            // {
            //     Caption = 'Description';
            //     ApplicationArea = all;
            // }
            field("GST Bill-to/BuyFrom State Code"; Rec."GST Bill-to/BuyFrom State Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Bill-to/BuyFrom State Code field.';
            }
            field("GST Ship-to State Code"; Rec."GST Ship-to State Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Ship-to State Code field.';
            }
            field("GST on Advance Payment"; Rec."GST on Advance Payment")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if GST is required to be calculated on Advance Payment.';
            }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies this Ship-to-Code for the customer related transactions';
            }


        }
        //#122
    }
    actions
    {


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
        DocPrint.PrintCheck(GenJnlLine);
        CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        GenJnlLine.RESET;
        GenJnlLine.COPY(Rec);
        GenJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
        GenJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
        DocPrint.PrintCheck(GenJnlLine);
        CODEUNIT.RUN(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        }

        #1..4
        GenJnlLine.SetRange("Document No.","Document No.");
        GenJnlLine.SetRange("Line No.","Line No.");
        if GenJnlLine.FindSet(false,false) then
          if (GenJnlLine."Account No."<>'') and (GenJnlLine."Bal. Account No."='BANK-001') then begin
              REPORT.RunModal(50017,true,false,GenJnlLine)
              end
              else
          if (GenJnlLine."Line No." > 10000) and (GenJnlLine."Account No."='BANK-001') then begin
              //REPORT.RUNMODAL(51014,TRUE,FALSE,GenJnlLine)
              REPORT.RunModal(50131,true,false,GenJnlLine)                //Team::7814
              end;
        CODEUNIT.Run(CODEUNIT::"Adjust Gen. Journal Balance",Rec);
        */
        //end;
        addafter("Print Check")
        {
            action("<Action1500046>")
            {
                Caption = 'HDFC Multi Line';
                Image = Check;

                trigger OnAction()
                var
                    GenJnlLine: Record "Gen. Journal Line";
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");
                    REPORT.RunModal(50031, true, false, GenJnlLine);
                end;
            }
            action("<Action1500045>")
            {
                Caption = 'HDFC Check';
                Image = Check;
                Visible = false;

                trigger OnAction()
                var
                    GenJnlLine: Record "Gen. Journal Line";
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.Copy(Rec);
                    GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    GenJnlLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    GenJnlLine.SetRange("Document No.", rec."Document No.");
                    //       DocPrint.PrintCheck(GenJnlLine);
                    REPORT.RunModal(50017, true, false, GenJnlLine);
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
                var
                    GenJnlLine: Record "Gen. Journal Line";
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
        // >>#92
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
                var
                    GenJnlLine: Record "Gen. Journal Line";
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
                                //REPORT.RUNMODAL(51014,TRUE,FALSE,GenJnlLine)
                                REPORT.RUNMODAL(50131, TRUE, FALSE, GenJnlLine)                //Team::7814
                            END;
                    CODEUNIT.RUN(CODEUNIT::"Adjust Gen. Journal Balance", Rec);
                end;
            }
        }
        // <<#92

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
    }
    var
        DimSetEntry: Record "Dimension Set Entry";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        GenJournalRec: Record "Gen. Journal Line";
        TempDim: Integer;

}

