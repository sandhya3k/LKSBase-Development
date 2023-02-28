tableextension 50060 "LKSBankAccntExt" extends "Bank Account"
{
    fields
    {
        field(50000; "Journal Template Name"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50001; "Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
    }
}

