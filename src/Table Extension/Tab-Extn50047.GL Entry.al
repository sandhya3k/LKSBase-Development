tableextension 50047 tableextension50047 extends "G/L Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".

        field(50008; "Information No."; Code[20])
        {
        }
        field(50009; "Cheque No."; Code[35])
        {
            Description = '//TEAM::1426';
        }
        field(50010; "Cheque Date"; Date)
        {
            Description = '//TEAM::1426';
        }
        field(50011; "Applies-to Doc. No."; Code[20])
        {
            Description = '//TEAM::1426';
        }
        field(50012; "Issuing Bank Name"; Text[100])
        {
            Description = '//TEAM::1426';
        }
        field(50013; "Payment Made By"; Text[100])
        {
            Description = '//TEAM::1426';
        }
        field(50014; "Collection No."; Code[20])
        {
            Description = '//TEAM::1426::NF';

            trigger OnValidate()
            begin
                //2021
                CollectionDetail.Reset;
                CollectionDetail.SetFilter(CollectionDetail.Division, 'TAX|IPR');
                CollectionDetail.SetRange(CollectionDetail."On Submit Receipt No.", "Collection No.");
                if CollectionDetail.FindFirst then begin
                    CollectionDetail.Posted := true;
                    CollectionDetail."Posted No." := "Document No.";
                    CollectionDetail.Modify;
                end;
                //MESSAGE('%1-%2',CollectionDetail."Posted No.",CollectionDetail.Posted);
                //2021
            end;
        }
        field(50015; "External Doc. Date"; Date)
        {
        }
        field(50016; "Group Head"; Text[20])
        {
            Description = '//TEAM::1426';
        }
        field(50017; "Location Code"; code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        //#112
        // field(50018; "Description 3"; Text[100])
        // {
        //     Caption = 'Description';
        // }
        //#112
    }

    var
        "--2021--": Integer;
        CollectionDetail: Record "Collection Detail";
}

