pageextension 50173 "CashReceiptVou" extends "Cash Receipt Voucher"
{
    layout
    {
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