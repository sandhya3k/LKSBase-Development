table 50013 "Expense Detail"
{

    fields
    {
        field(1; "Expense Voucher No."; Code[20])
        {
        }
        field(2; "Company Head"; Option)
        {
            OptionCaption = 'Lakshmi Kumaran & Sridharan,V.Lakshmikumaran,V.Sridharan';
            OptionMembers = LKS,VLK,VSH;

            trigger OnValidate()
            begin
                //Setting Reciept No based on current record company info --- Start
                ExpenseDetail.Reset;
                ExpenseDetail.SetRange("Company Head", "Company Head");
                if ExpenseDetail.FindLast then
                    ExpRecptNo := IncStr(ExpenseDetail."Expense Voucher No.")
                else begin
                    if "Company Head" = "Company Head"::LKS then
                        //ExpRecptNo := 'RLKS-1213-00001';
                        ExpRecptNo := 'ELKS-1213-00001';
                    if "Company Head" = "Company Head"::VLK then
                        //ExpRecptNo := 'RVLK-1213-00001';
                        ExpRecptNo := 'EVLK-00001';
                    if "Company Head" = "Company Head"::VSH then
                        //ExpRecptNo := 'RVSH-1213-00001';
                        ExpRecptNo := 'EVSH-00001';
                end;
                "Expense Voucher No." := ExpRecptNo;
                //Setting Reciept No based on current record company info --- End

                //Field Validation --- Start
                if "Company Head" = "Company Head"::LKS then
                    Division := Division::TAX;
                if "Company Head" = "Company Head"::VLK then
                    Division := Division::VLK;
                if "Company Head" = "Company Head"::VSH then
                    Division := Division::VSH;
                //Field Validation --- End
            end;
        }
        field(3; Division; Option)
        {
            OptionCaption = 'TAX,IPR,VLK,VSH';
            OptionMembers = TAX,IPR,VLK,VSH;
        }
        field(4; "Creation Date"; Date)
        {
        }
        field(5; "Voucher Date"; Date)
        {
        }
        field(6; "External Document No."; Code[20])
        {
        }
        field(7; "External Document Date"; Date)
        {
        }
        field(8; "Expense Type"; Option)
        {
            OptionCaption = 'G/L Account,Vendor';
            OptionMembers = "G/L Account",Vendor;

            trigger OnValidate()
            begin
                "Expense Account" := '';
                Description := '';
                if "Expense Type" = "Expense Type"::"G/L Account" then
                    "Party Type" := "Party Type"::" "
                else
                    "Party Type" := "Party Type"::Vendor;
            end;
        }
        field(9; "Expense Account"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));

            trigger OnValidate()
            begin
                //TEAM 2021 Description based on Selection of Vendor and G/L Account--Start--
                case "Expense Type" of
                    "Expense Type"::"G/L Account":
                        begin
                            CommonMaster.Reset;
                            CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                            CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                            CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                            CommonMaster.SetRange(CommonMaster."Master ID", "Expense Account");
                            if CommonMaster.FindFirst then
                                Description := CommonMaster."Master Description";
                        end;
                    "Expense Type"::Vendor:
                        begin
                            CommonMaster.Reset;
                            CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                            CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                            CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Vendor);
                            CommonMaster.SetRange(CommonMaster."Master ID", "Expense Account");
                            if CommonMaster.FindFirst then
                                Description := CommonMaster."Master Description";
                        end;
                end;
                //TEAM 2021 Description based on Selection of Vendor and G/L Account--End--
            end;
        }
        field(10; "Party Type"; Option)
        {
            OptionCaption = ' ,Vendor';
            OptionMembers = " ",Vendor;
        }
        field(11; Description; Text[50])
        {
        }
        field(12; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                //Amount :=("Amount Debit"+"Expense Amount 1"+"Expense Amount 2"+"Expense Amount 3")- "TDS Amount";
            end;
        }
        field(13; "Amount Debit"; Decimal)
        {
        }
        field(14; "Amount Credit"; Decimal)
        {
        }
        field(15; "Currency Code"; Code[20])
        {
            InitValue = 'INR';
            TableRelation = Currency.Code;
        }
        field(16; "Exchange Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Amount);
                "Amount (LCY)" := Amount * "Exchange Rate";
            end;
        }
        field(17; "Amount (LCY)"; Decimal)
        {
        }
        field(18; "Balance Account No."; Text[50])
        {
            TableRelation = IF ("Balance Account Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                 "Division Type" = FIELD(Division),
                                                                                                                 "Petty Cash" = FILTER(true))
            ELSE
            IF ("Balance Account Type" = FILTER(BankAccount)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Bank),
                                                                                                                                                                                                         "Division Type" = FIELD(Division));

            trigger OnValidate()
            begin
                //TEAM 2021 Bal. Acc. Description based on Selection of Bank and G/L Account--Start--
                case "Balance Account Type" of
                    "Balance Account Type"::"G/L Account":
                        begin
                            CommonMaster.Reset;
                            CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                            CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                            CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                            CommonMaster.SetRange(CommonMaster."Master ID", "Balance Account No.");
                            if CommonMaster.FindFirst then
                                "Bal. Acc. Description" := CommonMaster."Master Description";
                        end;
                    "Balance Account Type"::BankAccount:
                        begin
                            CommonMaster.Reset;
                            CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                            CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                            CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Bank);
                            CommonMaster.SetRange(CommonMaster."Master ID", "Balance Account No.");
                            if CommonMaster.FindFirst then
                                "Bal. Acc. Description" := CommonMaster."Master Description";
                        end;
                end;
                //TEAM 2021 Description based on Selection of Vendor and G/L Account--End--
            end;
        }
        field(19; "Balance Account Type"; Option)
        {
            OptionCaption = 'G/L Account,BankAccount';
            OptionMembers = "G/L Account",BankAccount;

            trigger OnValidate()
            begin
                "Balance Account No." := '';
                "Bal. Acc. Description" := '';
            end;
        }
        field(20; "Mode of Payment"; Option)
        {
            OptionCaption = 'PettyCash,Cheque';
            OptionMembers = PettyCash,Cheque;
        }
        field(21; "Bank Payment Type"; Option)
        {
            OptionCaption = 'Manual,ComputerCheck';
            OptionMembers = Manual,ComputerCheck;
        }
        field(22; "Cheque No."; Code[30])
        {

            trigger OnValidate()
            begin
                if "Mode of Payment" = "Mode of Payment"::Cheque then begin
                    if StrLen("Cheque No.") <> 7 then
                        Error('Cheque No should be 7 character long');
                end;
            end;
        }
        field(23; "Cheque Date"; Date)
        {
        }
        field(24; "Case id No."; Text[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(25; "Entity Code"; Text[30])
        {
            TableRelation = IF ("Company Head" = FILTER(LKS)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Client),
                                                                                               "Company Head" = FIELD("Company Head"),
                                                                                               "Division Type" = FIELD(Division))
            ELSE
            IF ("Company Head" = FILTER(VLK)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Client),
                                                                                                                                                                       "Company Head" = FIELD("Company Head"),
                                                                                                                                                                       "Division Type" = FIELD(Division))
            ELSE
            IF ("Company Head" = FILTER(VSH)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Client),
                                                                                                                                                                                                                                               "Company Head" = FIELD("Company Head"),
                                                                                                                                                                                                                                               "Division Type" = FIELD(Division));

            trigger OnValidate()
            begin
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Client);
                CommonMaster.SetRange(CommonMaster."Master ID", "Entity Code");
                if CommonMaster.FindFirst then
                    "Entity Name" := CommonMaster."Master Description"
            end;
        }
        field(26; "Entity Name"; Text[50])
        {
        }
        field(27; Posted; Boolean)
        {
        }
        field(28; "Posting Date"; Date)
        {
        }
        field(29; "Bal. Acc. Description"; Text[50])
        {
        }
        field(30; Submitted; Boolean)
        {
        }
        field(31; "Document Type"; Option)
        {
            OptionCaption = 'Expense';
            OptionMembers = Expense;
        }
        field(32; Naration; Text[50])
        {
        }
        field(33; "Expense Account 1"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));

            trigger OnValidate()
            begin
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                CommonMaster.SetRange(CommonMaster."Master ID", "Expense Account 1");
                if CommonMaster.FindFirst then
                    "Exp Account Name1" := CommonMaster."Master Description";
            end;
        }
        field(34; "Expense Account 2"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));

            trigger OnValidate()
            begin
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                CommonMaster.SetRange(CommonMaster."Master ID", "Expense Account 2");
                if CommonMaster.FindFirst then
                    "Exp Account Name2" := CommonMaster."Master Description";
            end;
        }
        field(35; "Expense Account 3"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));

            trigger OnValidate()
            begin
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                CommonMaster.SetRange(CommonMaster."Master ID", "Expense Account 3");
                if CommonMaster.FindFirst then
                    "Exp Account Name3" := CommonMaster."Master Description";
            end;
        }
        field(36; "Expense Amount 1"; Decimal)
        {
        }
        field(37; "Expense Amount 2"; Decimal)
        {
        }
        field(38; "Expense Amount 3"; Decimal)
        {
        }
        field(39; "TDS Account No"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));

            trigger OnValidate()
            begin
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::"G/L Account");
                CommonMaster.SetRange(CommonMaster."Master ID", "TDS Account No");
                if CommonMaster.FindFirst then
                    "TDS Account Name" := CommonMaster."Master Description";
            end;
        }
        field(40; "TDS Amount"; Decimal)
        {
        }
        field(41; "Service Tax Account"; Code[20])
        {
            TableRelation = IF ("Expense Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                  "Division Type" = FIELD(Division))
            ELSE
            IF ("Expense Type" = FILTER("G/L Account")) "Common Master"."Master ID" WHERE("Master Type" = FILTER("G/L Account"),
                                                                                                                                                                                    "Division Type" = FIELD(Division),
                                                                                                                                                                                    "Petty Cash" = FILTER(false));
        }
        field(42; "Service Tax Amount"; Decimal)
        {
        }
        field(43; "User Name"; Code[50])
        {
        }
        field(44; Location; Code[20])
        {
        }
        field(45; "Party Code"; Code[20])
        {
            TableRelation = IF ("Party Type" = FILTER(Vendor)) "Common Master"."Master ID" WHERE("Master Type" = FILTER(Vendor),
                                                                                                "Division Type" = FIELD(Division));

            trigger OnValidate()
            begin
                Vend.SetRange(Vend."No.", "Party Code");
                if Vend.FindFirst then
                    Description := Vend.Name
                else
                    Description := ''
            end;
        }
        field(46; "Expense Amount"; Decimal)
        {
        }
        field(47; "On Submit Expense No"; Code[20])
        {
        }
        field(48; "Exp Account Name1"; Text[100])
        {
        }
        field(49; "Exp Account Name2"; Text[100])
        {
        }
        field(50; "Exp Account Name3"; Text[100])
        {
        }
        field(51; "TDS Account Name"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Expense Voucher No.", "Company Head", Division)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Creation Date" := Today;
        "User Name" := UserId;

        //TBD
        /*
        UserLoc.Reset;
        UserLoc.SetRange(UserLoc."User Name", UserId);
        if UserLoc.FindFirst then begin
            Location := UserLoc.Location;
        end;
        */

        //Setting Expense Voucher No based on current record company info --- Start
        ExpenseDetail.Reset;
        ExpenseDetail.SetRange("Company Head", "Company Head");
        if ExpenseDetail.FindLast then
            ExpRecptNo := IncStr(ExpenseDetail."Expense Voucher No.")
        else begin
            if "Company Head" = "Company Head"::LKS then
                //ExpRecptNo := 'ELKS-1213-00001';
                ExpRecptNo := 'ELKS-00001';
            if "Company Head" = "Company Head"::VLK then
                //ExpRecptNo := 'EVLK-1213-00001';
                ExpRecptNo := 'EVLK-00001';
            if "Company Head" = "Company Head"::VSH then
                // ExpRecptNo := 'EVSH-1213-00001';
                ExpRecptNo := 'EVSH-00001';
        end;
        "Expense Voucher No." := ExpRecptNo;
        //Setting Expense Voucher No based on current record company info --- End
    end;

    var
        ExpenseDetail: Record "Expense Detail";
        ExpRecptNo: Code[20];
        CommonMaster: Record "Common Master";
        UserLoc: Record User;
        Vend: Record Vendor;
        GLAccount: Record "G/L Account";
}

