pageextension 50114 pageextension50114 extends "Sales Invoice"
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Sales Invoice"(Page 43)".

    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
            {
                ApplicationArea = All;
            }
        }
        //TBD
        /*
        addafter("Sell-to City")
        {
            field("Invoice Type"; Rec."Invoice Type")
            {ApplicationArea = All;
            }
        }
        */
        addafter("Sell-to Contact")
        {
            field(Remarks; Rec."Posting Description")
            {
                ApplicationArea = All;
                Caption = 'Remarks';
            }
            field(Cancelled; rec.Cancelled)
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            field("Prof. Chrg. Amt."; Rec."Prof. Chrg. Amt.")
            {
                ApplicationArea = All;
            }
            field("Reimbursable Exp. Amt."; Rec."Reimbursable Exp. Amt.")
            {
                ApplicationArea = All;
            }
            field("Adjust Against Adv."; Rec."Adjust Against Adv.")
            {
                ApplicationArea = All;
            }
            field("Confirmation Reference"; rec."Confirmation Reference")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("Shortcut Dimension 9 Code"; rec."Shortcut Dimension 9 Code")
            {
                ApplicationArea = All;
                Caption = 'Forum';
                Visible = false;
            }
            field("Shortcut Dimension 10 Code"; rec."Shortcut Dimension 10 Code")
            {
                ApplicationArea = All;
                Caption = 'Forum City';
                Visible = false;
            }
            field("Shortcut Dimension 11 Code"; rec."Shortcut Dimension 11 Code")
            {
                ApplicationArea = All;
                Caption = 'Group';
                Visible = false;
            }
            field("Shortcut Dimension 12 Code"; Rec."Shortcut Dimension 12 Code")
            {
                ApplicationArea = All;
                Caption = 'Owner 1';
                Visible = false;
            }
            field("Shortcut Dimension 13 Code"; Rec."Shortcut Dimension 13 Code")
            {
                ApplicationArea = All;
                Caption = 'Owner 2';
                Visible = false;
            }
            field("Shortcut Dimension 14 Code"; Rec."Shortcut Dimension 14 Code")
            {
                ApplicationArea = All;
                Caption = 'Process';
                Visible = false;
            }
            field("Shortcut Dimension 15 Code"; Rec."Shortcut Dimension 15 Code")
            {
                ApplicationArea = All;
                Caption = 'Solution';
                Visible = false;
            }
            field("Shortcut Dimension 16 Code"; Rec."Shortcut Dimension 16 Code")
            {
                ApplicationArea = All;
                Caption = 'Sub Forum';
                Visible = false;
            }
        }
        addafter("Ship-to Name")
        {
            field("Ship-to Name 2"; Rec."Ship-to Name 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Ship-to City")
        {
            field("Ship to State"; rec.ShipToStateName)
            {
                ApplicationArea = All;
            }
            field("State Name"; Rec."State Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Location Code")
        {
            field("Posting No."; Rec."Posting No.")
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
        addfirst("P&osting")
        {
            action("Draft Invoice")
            {
                ApplicationArea = All;
                Caption = 'Draft Invoice';
                Ellipsis = true;
                Image = Print;

                trigger OnAction()
                begin
                    //Team::7814
                    if UpperCase(CompanyName) = 'V.SRIDHARAN' then begin
                        if rec."Shortcut Dimension 1 Code" <> '2' then
                            Error('Please select Branch Invoice.');
                    end else begin
                        if rec."Shortcut Dimension 1 Code" <> '1' then
                            Error('Please select Branch Invoice.');
                    end;

                    SalesHeader.Reset;
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.", rec."No.");
                    if SalesHeader.Find('-') then
                        REPORT.Run(50148, true, true, SalesHeader);
                    //Team::7814
                end;
            }
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
                    //Team::7814
                end;
            }
            action("Draft Invoice GST")
            {
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                begin
                    if UpperCase(CompanyName) = 'V.SRIDHARAN' then begin
                        if rec."Shortcut Dimension 1 Code" <> '2' then
                            Error('Please select Branch Invoice.');
                    end else begin
                        if rec."Shortcut Dimension 1 Code" <> '1' then
                            Error('Please select Branch Invoice.');
                    end;

                    SalesHeader.Reset;
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.", rec."No.");
                    if SalesHeader.Find('-') then
                        REPORT.Run(50156, true, true, SalesHeader);
                    //Team::7814
                end;
            }
            action("Branch Draft Invoice GST")
            {
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                begin

                    SalesHeader.Reset;
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.", rec."No.");
                    if SalesHeader.Find('-') then
                        REPORT.Run(50157, true, true, SalesHeader);
                end;
            }
            action("IBL Draft GST")
            {
                ApplicationArea = All;
                Image = PRINT;

                trigger OnAction()
                begin
                    SalesHeader.Reset;
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.", rec."No.");
                    if SalesHeader.Find('-') then
                        REPORT.Run(50161, true, true, SalesHeader);
                end;
            }
        }
        addafter(Preview)
        {
            action(Temp)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CustLedEntry: Record "Cust. Ledger Entry";
                    Cont: Record Contact;
                    SIH: Record "Sales Invoice Header";
                begin
                    CustLedEntry.Reset;
                    CustLedEntry.SetRange("Ship-to Contact", '');
                    CustLedEntry.SetRange("Document Type", CustLedEntry."Document Type"::Invoice);
                    if CustLedEntry.FindFirst then
                        repeat
                            if SIH.Get(CustLedEntry."Document No.") then
                                if Cont.Get(SIH."Bill-to Contact No.") then begin
                                    CustLedEntry."Ship-to Contact" := Cont.Initials + ' ' + Cont."F Name" + ' ' + Cont."M Name" + ' ' + Cont."L Name";
                                    CustLedEntry.Modify;
                                end;
                        until
                        CustLedEntry.Next = 0;
                end;
            }
        }
    }

    var
        [InDataSet]
        JobQueueVisible: Boolean;
        SalesHeader: Record "Sales Header";

    trigger OnOpenPage()
    begin
        rec.SetRange(Cancelled, false);
    end;
}

