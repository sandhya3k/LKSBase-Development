pageextension 50070 pageextension50070 extends "Journal Voucher"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'Creation Date';
        }

        //Unsupported feature: Property Modification (ImplicitType) on ""Location Code"(Control 1500066)".


        //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".


        //Unsupported feature: Property Modification (Name) on ""Currency Code"(Control 67)".
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
        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
            }
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
            }
        }
        addbefore("Payment Terms Code")
        {
            field("Group Head"; Rec."Group Head")
            {
            }
        }
        addafter("Bank Payment Type")
        {
            field("Income Account"; Rec."Income Account")
            {
            }
            field("Case Id"; Rec."Case Id")
            {
            }
            field("Invoice No."; Rec."Invoice No.")
            {
            }
            //TBD
            /*
            field(Remarks; Remarks)
            {
            }
            */
            field("Check Type"; Rec."Check Type")
            {
            }
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
                Caption = 'Description';
                ApplicationArea = all;
            }
        }
        //#122

    }
    actions
    {


        //Unsupported feature: Code Modification on "Dimensions(Action 76).OnAction".

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
        // >>#92
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
        // <<#92
    }

    var
        TempDim: Integer;
        DimMgt: Codeunit DimensionManagement;
        GenJournalRec: Record "Gen. Journal Line";
}

