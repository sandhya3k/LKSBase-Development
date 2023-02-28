xmlport 50020 "Inv. Outstanding1000"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\Outstanding.csv';
    Format = VariableText;
    Permissions = TableData "Cust. Ledger Entry" = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                AutoUpdate = true;
                XmlName = 'Cust_Ledg_Entry';
                SourceTableView = WHERE("Document Type" = FILTER(Invoice), Updated = FILTER(true), "Source Code" = FILTER(<> 'JOURNALV'));
                fieldelement(RTBNo; "Cust. Ledger Entry"."RTBNo.")
                {
                }
                fieldelement(Doc_No; "Cust. Ledger Entry"."Document No.")
                {
                }
                fieldelement(Remaining_Amt; "Cust. Ledger Entry"."Remaining Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //ApplMngt.CLE("Cust. Ledger Entry"."Entry No.");
                    "Cust. Ledger Entry".Updated := false;
                    "Cust. Ledger Entry".Modify;
                end;

                trigger OnAfterInsertRecord()
                begin

                    //ApplMngt.CLE("Cust. Ledger Entry"."Entry No.");
                    //"Cust. Ledger Entry".Updated :=FALSE;
                    //"Cust. Ledger Entry".MODIFY;
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

    trigger OnPreXmlPort()
    begin
        if (UserId = 'LSLAW\K.VISWANATHAN') or (UserId = 'LSLAW\KUMAR.S') or (UserId = 'LSLAW\k.viswanathan') or (UserId = 'LSLAW\kumar.s') or (UserId = 'LSLAW\FERIN.FRANCIS') or (UserId = 'LSLAW\NEHA.GUPTA') then
            Test := 1
        else
            Error('You Dont Have Permission to Run the Report');
    end;

    var
        SalesInvHeader: Record "Sales Invoice Header";
        RTBNo: Code[20];
        Test: Integer;
}

