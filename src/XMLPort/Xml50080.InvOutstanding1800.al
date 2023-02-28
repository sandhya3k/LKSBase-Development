xmlport 50080 "Inv. Outstanding1800"
{
    Direction = Export;
    FieldSeparator = '~';
    FileName = 'C:\InvOS.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                AutoUpdate = true;
                XmlName = 'Cust_Ledg_Entry';
                SourceTableView = WHERE ("Document Type" = CONST (Invoice), Processed = CONST (false), Updated = CONST (true));
                fieldelement(Doc_No; "Cust. Ledger Entry"."Document No.")
                {
                }
                fieldelement(DocNo; "Cust. Ledger Entry"."Document No.")
                {
                }
                fieldelement(Remaining_Amt; "Cust. Ledger Entry"."Remaining Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    if "Cust. Ledger Entry".Open = false then begin
                        "Cust. Ledger Entry".Processed := true;
                        "Cust. Ledger Entry".Modify;
                    end;

                    if "Cust. Ledger Entry".Updated = true then begin
                        "Cust. Ledger Entry".Updated := false;
                        "Cust. Ledger Entry".Modify;
                    end;
                end;

                trigger OnBeforeInsertRecord()
                begin

                    SalesInvHeader.Reset;
                    SalesInvHeader.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                    if SalesInvHeader.FindFirst then
                        Description := SalesInvHeader."Order No."
                    else
                        Description := '';
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        SalesInvHeader: Record "Sales Invoice Header";
        RTBNo: Code[20];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Description: Text[500];
}

