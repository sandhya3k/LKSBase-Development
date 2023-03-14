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

        addafter("Currency Code")
        {
            field("Description 3"; Rec."Description 3 ")
            {
                Caption = 'Description';
                ApplicationArea = all;
            }
            field("GST Component Code"; Rec."GST Component Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the GST component code for which the entry is being posted.';
            }
            field("Sales Invoice Type"; Rec."Sales Invoice Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Type of Sales Invoice.';
            }
            field("Excl. GST in TCS Base"; Rec."Excl. GST in TCS Base")
            {
                ApplicationArea = All;
                ToolTip = 'Select this field to exclude GST value in the TCS Base.';
            }
            field("Amount Excl. GST"; Rec."Amount Excl. GST")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Amount Excluding GST for the journal line.';
            }
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
            field("Location State Code"; Rec."Location State Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the sate code mentioned in location used in the transaction.';
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
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remarks field.';
            }
            field("POS Out Of India"; Rec."POS Out Of India")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the place of supply of invoice is out of India.';
            }
            field("GST Inv. Rounding Precision"; Rec."GST Inv. Rounding Precision")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Inv. Rounding Precision field.';
            }
            field("GST Inv. Rounding Type"; Rec."GST Inv. Rounding Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Inv. Rounding Type field.';
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

