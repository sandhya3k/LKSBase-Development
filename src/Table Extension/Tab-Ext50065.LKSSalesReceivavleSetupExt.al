tableextension 50065 "LKSSalesReceivavleSetupExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "Journal Template Name"; Code[20])
        {
            Description = '1426-TDS';
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50002; "Journal Batch Name"; Code[20])
        {
            Description = '1426-TDS';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(50003; "Journal Batch No. Series"; Code[20])
        {
            Description = '1426-TDS';
            TableRelation = "No. Series";
        }
        field(50004; "TDS Account"; Code[20])
        {
            Description = '1426-TDS';
            TableRelation = "G/L Account"."No.";
        }
        field(50005; "Collection No."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50006; "LKS Collection No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007; "VLK Collection No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50008; "VSH Collection No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50009; "LKS Expense No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50010; "VLK Expense No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50011; "VSH Expense No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50012; "Collection No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
}

