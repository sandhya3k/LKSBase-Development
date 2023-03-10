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
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies this Ship-to-Code for the customer related transactions';
            }
            field("Order Address Code"; Rec."Order Address Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order Address Code field.';
            }
            field("Vendor GST Reg. No."; Rec."Vendor GST Reg. No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the GST registration number of the Vendor specified on the journal line.';
            }
            field("Bill to-Location(POS)"; Rec."Bill to-Location(POS)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill to-Location(POS) field.';
            }
            field("GST TDS/TCS Amount (LCY)"; Rec."GST TDS/TCS Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST TDS/TCS Amount (LCY) field.';
            }
            field("GST TDS/TCS Base Amount (LCY)"; Rec."GST TDS/TCS Base Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST TDS/TCS Base Amount (LCY) field.';
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