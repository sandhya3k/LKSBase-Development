pageextension 50072 pageextension50072 extends "Cash Payment Voucher"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'Creation Date';
        }

        //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".
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
        }
        addafter("Document No.")
        {
            field("Expence No."; Rec."Expence No.")
            {

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
                        rec.Validate("Expence No.", ExpanceDetail."Expense Voucher No.");
                    rec.Validate("Account Type", 0);
                    rec.Validate("Account No.", ExpanceDetail."Expense Account");
                    rec.Validate(Amount, ExpanceDetail.Amount);
                    rec.Validate("Shortcut Dimension 2 Code", ExpanceDetail."Case id No.");
                    rec.Validate("External Doc. Date", ExpanceDetail."External Document Date");
                    rec.Validate("External Document No.", ExpanceDetail."External Document No.");
                    rec.Validate("Credit Amount", ExpanceDetail."Amount Credit");
                    rec.Validate("Cheque No. 2", ExpanceDetail."Cheque No.");
                    //#122
                    rec.Validate("Description 3 ", ExpanceDetail.Description);
                    //#122
                    rec.Validate("Cheque Date", ExpanceDetail."Cheque Date");
                    rec.Validate("Document Date", ExpanceDetail."Creation Date");
                    rec.Validate(Remarks, ExpanceDetail.Naration);
                    rec.Validate("Expence No.");
                end;
            }
        }
        addafter("External Document No.")
        {
            field("External Doc. Date"; Rec."External Doc. Date")
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
        }
        //#122

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
        {
        ShowDimensions;
        COMMIT;
        CurrPage.SAVERECORD;
        }
        TempDim :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        GenJournalRec.Get("Journal Template Name","Journal Batch Name","Line No.");
        GenJournalRec."Dimension Set ID" := TempDim;
        GenJournalRec.Modify;
        */
        //end;
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
        // >>#92
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
        // << #92
    }

    var
        CoHead: Option;
        ExpanceDetail: Record "Expense Detail";
        GenJnlLine: Record "Gen. Journal Line";
        TempDim: Integer;
        DimMgt: Codeunit DimensionManagement;
        GenJournalRec: Record "Gen. Journal Line";
}

