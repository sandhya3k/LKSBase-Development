pageextension 50115 pageextension50115 extends "Sales Credit Memo"
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Sales Credit Memo"(Page 44)".

    layout
    {
        addafter("Sell-to Contact")
        {
            field(Cancelled; rec.Cancelled)
            {
                ApplicationArea = All;
            }
            //TBD
            /*
            field("Invoice Type"; Rec."Invoice Type")
            {ApplicationArea = All;
            }
            */

            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Return Receipt No. Series"; Rec."Return Receipt No. Series")
            {
                ApplicationArea = All;
            }
            field("Bill Description"; Rec."Bill Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("Post Office"; Rec."Post Office")
            {
                ApplicationArea = All;
            }
            field(District; Rec.District)
            {
                ApplicationArea = All;
            }
            field(country; Rec.country)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(Post)

        {
            trigger OnBeforeAction()
            var
                myInt: Integer;
            begin
                rec."Posting Date" := WorkDate;
                rec."Document Date" := WorkDate;
            end;
        }
        addafter(GetPostedDocumentLinesToReverse)
        {
            action("Get St&d. Cust. Sales Codes")
            {
                ApplicationArea = All;
                Caption = 'Get St&d. Cust. Sales Codes';
                Ellipsis = true;
                Image = CustomerCode;

                trigger OnAction()
                var
                    StdCustSalesCode: Record "Standard Customer Sales Code";
                begin
                    StdCustSalesCode.InsertSalesLines(Rec);
                end;
            }

            action("Copy Document")
            {
                ApplicationArea = All;
                Caption = 'Copy Document';
                Ellipsis = true;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CopySalesDoc: Report "Copy Sales Document";
                begin
                    CopySalesDoc.SetSalesHeader(Rec);
                    CopySalesDoc.RUNMODAL;
                    CLEAR(CopySalesDoc);
                    IF rec.GET(rec."Document Type", rec."No.") THEN;
                end;
            }
        }
        addafter(Post)
        {
            action("Draft Credit Note")
            {
                ApplicationArea = All;
                Caption = 'Draft Credit Note';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    //Team::7814
                    NewSalesHeader.Reset;
                    NewSalesHeader.SetRange("Document Type", rec."Document Type");
                    NewSalesHeader.SetRange("No.", rec."No.");
                    if NewSalesHeader.Find('-') then
                        REPORT.Run(50152, true, false, NewSalesHeader);
                    //Team::7814
                end;
            }
            action("Draft IBL Credit Memo")
            {
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                begin
                    NewSalesHeader.Reset;
                    NewSalesHeader.SetRange("Document Type", rec."Document Type");
                    NewSalesHeader.SetRange("No.", rec."No.");
                    if NewSalesHeader.Find('-') then
                        REPORT.Run(50161, true, false, NewSalesHeader);
                end;
            }
        }
        moveafter(Reopen; GetPostedDocumentLinesToReverse)
    }

    var
        NewSalesHeader: Record "Sales Header";

    trigger OnOpenPage()
    begin
        rec.SetRange(Cancelled, false);
    end;
}

