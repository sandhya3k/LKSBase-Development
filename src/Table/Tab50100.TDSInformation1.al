table 50100 "TDS Information1"
{

    fields
    {
        field(1; "TDS ID"; Integer)
        {
        }
        field(2; "TDS ID Date"; Date)
        {
        }
        field(3; "Payment ID"; Code[20])
        {
        }
        field(4; "Payment ID Date"; Date)
        {
        }
        field(5; "Bill No."; Text[30])
        {
            TableRelation = "Sales Invoice Header"."No." WHERE("Bill-to Customer No." = FIELD("Client No."));

            trigger OnValidate()
            begin
                SalesInvHeader.Get("Bill No.");
                //TBD //"Amount Out Of TDS Deducted" := SalesInvHeader."Amount to Customer";
            end;
        }
        field(6; "TAN No."; Text[30])
        {
        }
        field(7; "Client No."; Code[20])
        {
            TableRelation = Customer."No." WHERE("No." = CONST(''));

            trigger OnValidate()
            begin
                Cust.Get("Client No.");
                "Client Name" := Cust.Name;
                Address := Cust.Address;
                City := Cust.City;
                State := Cust."State Code";
                "Pin Code" := Cust."Post Code";
                "TAN No." := Cust."P.A.N. No."
            end;
        }
        field(8; "Client Name"; Text[50])
        {
        }
        field(9; Address; Text[50])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; State; Text[30])
        {
        }
        field(13; "Amount Paid"; Decimal)
        {
        }
        field(14; "Date Of Payment"; Date)
        {
        }
        field(15; "Total TDS Deducted"; Decimal)
        {
        }
        field(16; "Amount Out Of TDS Deducted"; Decimal)
        {
        }
        field(17; "TDS Certificate Number"; Integer)
        {
        }
        field(18; "TDS Certificate Date"; Date)
        {
        }
        field(19; "Cheque No."; Text[30])
        {
        }
        field(20; Date; Date)
        {
        }
        field(21; "Line No."; Integer)
        {
        }
        field(22; "Journal Template Name"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(23; "Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(24; "Document No."; Code[20])
        {
        }
        field(25; "Posted Document No."; Code[20])
        {
        }
        field(26; "Pin Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Payment ID", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Cust: Record Customer;
        SalesInvHeader: Record "Sales Invoice Header";
}

