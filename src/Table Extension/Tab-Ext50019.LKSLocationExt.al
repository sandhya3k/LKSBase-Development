tableextension 50019 "LKSLocationExt" extends Location
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Country/Region Code"(Field 5720)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112
        if ("Country/Region Code" <> xRec."Country/Region Code") and ("Country/Region Code" <> '') then
          Postcode.ClearFields(City,"Post Code",County);
        //8112
        */
        //end;
        field(50000; "Journal Template Name"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50001; "Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(50002; "GST Reg No."; Code[16])
        {
            Description = 'Team::7814';
        }
    }
}

