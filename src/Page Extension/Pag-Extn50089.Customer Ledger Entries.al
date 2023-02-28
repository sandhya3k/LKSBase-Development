pageextension 50089 pageextension50089 extends "Customer Ledger Entries"
{

    //Unsupported feature: Property Insertion (Permissions) on ""Customer Ledger Entries"(Page 25)".

    layout
    {
        addfirst(Control1)
        {
            field("<Group Head>"; rec."Group Heade")
            {
                ApplicationArea = All;
                Caption = '<Group Head>';
            }
        }
        addafter("Document No.")
        {
            field("Document Date"; rec."Document Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter(Description)
        {
            field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Ship-to Contact"; rec."Ship-to Contact")
            {
                ApplicationArea = All;
            }
            field("Applied Date"; rec."Applied Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Sub Group Owner 2"; rec."Sub Group Owner 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field(OWNER2; rec.OWNER2)
            {
                ApplicationArea = All;
            }
            field(OWNER1; rec.OWNER1)
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field("Cheque No."; rec."Cheque No.")
            {
                ApplicationArea = All;
            }
            field("Cheque Date"; rec."Cheque Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Remaining Amount")
        {
            field("RTBNo."; rec."RTBNo.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Account Type")
        {
            field("Nature of Invoice"; rec."Nature of Invoice")
            {
                ApplicationArea = All;
            }
        }
        addafter("Direct Debit Mandate ID")
        {
            field(Updated; rec.Updated)
            {
                ApplicationArea = All;
            }
            field("Applied Document"; rec."Applied Document")
            {
                ApplicationArea = All;
            }
            field("Applied Document (Invoice)"; rec."Applied Document (Invoice)")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("ShowDocumentAttachment")
        {
            action(Temp)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CLE: Record "Cust. Ledger Entry";
                    SIH: Record "Sales Invoice Header";
                    SCH: Record "Sales Cr.Memo Header";
                    DImSetEntry: Record "Dimension Set Entry";
                begin
                    CLE.Reset;
                    CLE.SetRange(Open, true);
                    CLE.SetFilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
                    if CLE.FindFirst then
                        repeat
                            if CLE."Document Type" = CLE."Document Type"::Invoice then begin
                                SIH.Get(CLE."Document No.");
                                Clear(DImSetEntry);
                                DImSetEntry.SetRange("Dimension Set ID", SIH."Dimension Set ID");
                                DImSetEntry.SetRange("Dimension Code", 'OWNER1');
                                if DImSetEntry.FindFirst then begin
                                    CLE.OWNER1 := DImSetEntry."Dimension Value Code";
                                    CLE.Modify;
                                end;
                            end;
                            if CLE."Document Type" = CLE."Document Type"::"Credit Memo" then begin
                                SCH.Get(CLE."Document No.");
                                Clear(DImSetEntry);
                                DImSetEntry.SetRange("Dimension Set ID", SCH."Dimension Set ID");
                                DImSetEntry.SetRange("Dimension Code", 'OWNER1');
                                if DImSetEntry.FindFirst then begin
                                    CLE.OWNER1 := DImSetEntry."Dimension Value Code";
                                    CLE.Modify;
                                end;
                            end;
                        until
                        CLE.Next = 0;
                end;
            }
        }
    }
}

