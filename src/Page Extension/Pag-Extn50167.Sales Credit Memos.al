pageextension 50167 pageextension50167 extends "Sales Credit Memos"
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Sales Credit Memos"(Page 9302)".

    layout
    {
        addafter("External Document No.")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Remove From Job Queue")
        {
            action("Batch Job For Credit Memo")
            {
                ApplicationArea = All;
                //Image = "Batch Job";//TBD
                RunObject = Report "Batch Job for Credit Memo";
            }
        }
    }

    var
        SalesHead: Record "Sales Header";
        Dimvalue: Record "Dimension Value";
        Postedsalesinv: Record "Sales Invoice Header";


    trigger OnOpenPage()

    begin
        rec.SetRange(Cancelled, false);

        //8112

        SalesHead.Reset;
        SalesHead.SetRange("Document Type", SalesHead."Document Type"::"Credit Memo");
        if SalesHead.FindFirst then begin
            repeat
                Dimvalue.Reset;
                Dimvalue.SetRange(Dimvalue."Dimension Code", 'BRANCH');
                Dimvalue.SetRange(Dimvalue.Code, SalesHead."Shortcut Dimension 1 Code");
                if Dimvalue.FindFirst then begin
                    SalesHead."Location Code" := Dimvalue.Name;
                    SalesHead.Modify;
                end;

                Postedsalesinv.Reset;
                Postedsalesinv.SetRange(Postedsalesinv."No.", SalesHead."Applies-to Doc. No.");
                if Postedsalesinv.FindFirst then begin
                    SalesHead."Bill-to Contact No." := Postedsalesinv."Bill-to Contact No.";
                    SalesHead."Bill-to Name" := Postedsalesinv."Ship-to Name";
                    SalesHead."Bill-to Name 2" := Postedsalesinv."Ship-to Name 2";
                    SalesHead."Bill-to Address" := Postedsalesinv."Ship-to Address";
                    SalesHead."Bill-to Address 2" := Postedsalesinv."Ship-to Address 2";
                    SalesHead."Bill-to City" := Postedsalesinv."Ship-to City";
                    SalesHead.Modify;
                end;
            until SalesHead.Next = 0
        end;

        //MESSAGE('ok');
        //8112

    end;
}

