page 50048 "RTB Mumbai"
{
    Caption = 'RTB Mumbai';
    PageType = Card;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Invoice));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Entity ID';
                    Editable = false;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("RTB Type"; Rec."RTB Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date");
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Prof. Chrg. Amt."; Rec."Prof. Chrg. Amt.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Reimbursable Exp. Amt."; Rec."Reimbursable Exp. Amt.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Adjust Against Adv."; Rec."Adjust Against Adv.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Confirmation Reference"; Rec."Confirmation Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    Caption = 'Remarks';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Cancelled; rec.Cancelled)
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(SalesLines; "RTB Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                Editable = true;
                field("Bill Description"; Rec."Bill Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to Name 2"; Rec."Ship-to Name 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("State Name"; Rec."State Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ship-to Contact."; Rec."Ship-to Contact")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                //TBD
                /*
                field(ReturnOrderNo; Rec."Return Re-Dispatch Rcpt. No.")
                {ApplicationArea =All;
                    Caption = 'Return Order No.';
                    Visible = ReturnOrderNoVisible;
                }
                */
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Visible = false;
                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Item Charge &Assignment")
                {
                    ApplicationArea = All;
                    Caption = 'Item Charge &Assignment';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //CurrPage.SalesLines.PAGE.ItemChargeAssgnt;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //CurrPage.SalesLines.PAGE.OpenItemTrackingLines;
                    end;
                }
            }
            group("&Invoice")
            {
                Caption = '&Invoice';
                action(Statistics)
                {
                    ApplicationArea = All;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    trigger OnAction()
                    var
                        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
                    begin
                        rec.CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Sales Statistics", Rec);
                        SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
                        //TBD //CurrPage.SalesLines.PAGE.ForceTotalsCalculation;                       
                    end;
                }
                action(Card)
                {
                    ApplicationArea = All;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Sell-to Customer No.");
                    ShortCutKey = 'Shift+Ctrl+C';
                    Visible = false;
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    Visible = false;
                }
                action(Action116)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Image = Dimensions;

                    trigger OnAction()
                    begin
                        rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Sales Header","Document Type","No.");
                        //ApprovalEntries.RUN;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = true;
                action("Calculate &Invoice Discount")
                {
                    ApplicationArea = All;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    Visible = false;

                    trigger OnAction()
                    var
                        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
                    begin
                        ApproveCalcInvDisc;
                        SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action("Get &Price")
                {
                    ApplicationArea = All;
                    Caption = 'Get &Price';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.ShowPrices
                    end;
                }
                action("Get Li&ne Discount")
                {
                    ApplicationArea = All;
                    Caption = 'Get Li&ne Discount';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.ShowLineDisc
                    end;
                }
                separator(Action142)
                {
                }
                action("E&xplode BOM")
                {
                    ApplicationArea = All;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.ExplodeBOM;
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    ApplicationArea = All;
                    Caption = 'Insert &Ext. Texts';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.InsertExtendedText(true);
                    end;
                }
                separator(Action135)
                {
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    ApplicationArea = All;
                    Caption = 'Get St&d. Cust. Sales Codes';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        StdCustSalesCode: Record "Standard Customer Sales Code";
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                action("Get &Shipment Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Get &Shipment Lines';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CurrPage.SalesLines.PAGE.GetShipment;
                    end;
                }
                separator(Action139)
                {
                }
                action("Copy Document")
                {
                    ApplicationArea = All;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;

                    trigger OnAction()
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RunModal;
                        Clear(CopySalesDoc);
                    end;
                }
                action("Move Negative Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Move Negative Lines';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Clear(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RunModal;
                        MoveNegSalesLines.ShowDocument;
                    end;
                }
                separator(Action141)
                {
                }
                separator(Action161)
                {
                }
                action("Re&lease")
                {
                    ApplicationArea = All;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Shift+Ctrl+R';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = All;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1500035)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("Branch Draft Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Branch Draft Invoice';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        //Team::7814
                        if rec."Shortcut Dimension 1 Code" = '1' then
                            Error('Please select Tax Invoice.');

                        SalesHeader.Reset;
                        SalesHeader.SetRange("Document Type", rec."Document Type");
                        SalesHeader.SetRange("No.", rec."No.");
                        if SalesHeader.Find('-') then
                            REPORT.Run(50150, true, true, SalesHeader);
                        //REPORT.RUN(50157,TRUE,TRUE,SalesHeader);
                        //Team::7814
                    end;
                }
                action("Test Report")
                {
                    ApplicationArea = All;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    ApplicationArea = All;
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        rec."Posting Date" := WorkDate;
                        rec."Document Date" := WorkDate;
                        rec.Modify;
                        CODEUNIT.Run(CODEUNIT::"Sales-Post (Yes/No)", Rec);
                        //   DATAPORT.RUN(50081,FALSE);
                        //   PDFCreator.PDFConvert("No.","No.");
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = All;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = false;

                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        CODEUNIT.Run(CODEUNIT::"Sales-Post + Print", Rec);
                    end;
                }
                action("Post &Batch")
                {
                    ApplicationArea = All;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    Visible = false;

                    trigger OnAction()
                    begin
                        REPORT.RunModal(REPORT::"Batch Post Sales Invoices", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Test Sale Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Test Sale Invoice';

                    trigger OnAction()
                    begin
                        SalesHeader.Reset;
                        SalesHeader.SetRange("No.", rec."No.");
                        REPORT.RunModal(REPORT::"PendingExpensePosting-HYD", true, true, SalesHeader);
                    end;
                }
            }
            action(SalesHistoryBtn)
            {
                Caption = 'Sales Histo&ry';
                Promoted = true;
                PromotedCategory = Process;
                Visible = SalesHistoryBtnVisible;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //SalesInfoPaneMgt.LookupCustSalesHistory(Rec,"Bill-to Customer No.",TRUE);
                end;
            }
            action("&Avail. Credit")
            {
                Caption = '&Avail. Credit';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Cust: Record "Customer";
                begin
                    //SalesInfoPaneMgt.LookupAvailCredit(rec."Bill-to Customer No.");
                    Cust.RESET;
                    Cust.SETRANGE("No.", rec."Bill-to Customer No.");
                    PAGE.RUNMODAL(PAGE::"Available Credit", Cust);
                end;
            }
            action(SalesHistoryStn)
            {
                Caption = 'Sales Histor&y';
                Promoted = true;
                PromotedCategory = Process;
                Visible = SalesHistoryStnVisible;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //SalesInfoPaneMgt.LookupCustSalesHistory(Rec,"Sell-to Customer No.",FALSE);
                end;
            }
            action("&Contacts")
            {
                Caption = '&Contacts';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //SalesInfoPaneMgt.LookupContacts(Rec);
                end;
            }
            action("Ship&-to Addresses")
            {
                Caption = 'Ship&-to Addresses';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //SalesInfoPaneMgt.LookupShipToAddr(Rec);
                end;
            }
        }
    }

    //TBD
    /*
    trigger OnAfterGetRecord()
    begin
        if "Re-Dispatch" then
            ReturnOrderNoVisible := true
        else
            ReturnOrderNoVisible := false;
    end;
    */

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(rec.ConfirmDeletion);
    end;

    trigger OnInit()
    begin
        SalesHistoryStnVisible := true;
        BillToCommentBtnVisible := true;
        BillToCommentPictVisible := true;
        SalesHistoryBtnVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Responsibility Center" := UserMgt.GetSalesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetSalesFilter <> '' then begin
            rec.FilterGroup(2);
            rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter);
            rec.FilterGroup(0);

        end;

        rec.SetRange("Location Code", 'MUMBAI');
        rec.SetRange(Cancelled, false);
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CopySalesDoc: Report "Copy Sales Document";
        MoveNegSalesLines: Report "Move Negative Sales Lines";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        SalesLine: Record "Sales Line";
        Text16500: Label 'To calculate invoice discount, check Cal. Inv. Discount on header when Price Inclusive of Tax = Yes.\This option cannot be used to calculate invoice discount when Price Inclusive Tax = Yes.';

        SalesHeader: Record "Sales Header";
        [InDataSet]
        ReturnOrderNoVisible: Boolean;
        [InDataSet]
        SalesHistoryBtnVisible: Boolean;
        [InDataSet]
        BillToCommentPictVisible: Boolean;
        [InDataSet]
        BillToCommentBtnVisible: Boolean;
        [InDataSet]
        SalesHistoryStnVisible: Boolean;
        Text16501: Label 'Sell-to Customer';
        Text16502: Label 'Bill-to Customer';
        ChangeExchangeRate: Page "Change Exchange Rate";

    local procedure UpdateInfoPanel()
    var
        DifferSellToBillTo: Boolean;
    begin
        DifferSellToBillTo := rec."Sell-to Customer No." <> rec."Bill-to Customer No.";
        SalesHistoryBtnVisible := DifferSellToBillTo;
        BillToCommentPictVisible := DifferSellToBillTo;
        BillToCommentBtnVisible := DifferSellToBillTo;
    end;

    local procedure ApproveCalcInvDisc()
    begin
        //CurrPage.SalesLines.Form.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterValidate()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterValidate()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;
}

