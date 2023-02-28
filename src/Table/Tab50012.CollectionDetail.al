table 50012 "Collection Detail"
{
    // //TCPL::6904 31/07/2017 Validation for cheque amount to be greater than 0

    DataPerCompany = false;

    fields
    {
        field(1; "Receipt No."; Code[20])
        {
        }
        field(2; "Company Head"; Option)
        {
            OptionCaption = 'Lakshmi Kumaran & Sridharan,V.Lakshmikumaran,V.Sridharan';
            OptionMembers = LKS,VLK,VSH;

            trigger OnValidate()
            begin
                //TCPL_509-This Piece of code only for reference, not used in logic --- Start
                if CompanyName = 'Lakshmi Kumaran & Sridharan' then begin
                    CompInfo := CompInfo::LKS;
                    "No. Series Division" := "No. Series Division"::RLKS;
                end;
                if CompanyName = 'V.Lakshmikumaran' then begin
                    CompInfo := CompInfo::VLK;
                    "No. Series Division" := "No. Series Division"::RVLK;
                end;
                if CompanyName = 'V.Sridharan' then begin
                    CompInfo := CompInfo::VSH;
                    "No. Series Division" := "No. Series Division"::RVSH;
                end;
                //TCPL_509-This Piece of code only for reference, not used in logic --- END

                //Setting Reciept No based on current record company info --- Start
                CollDetail.Reset;
                CollDetail.SetRange("Company Head", "Company Head");
                if CollDetail.FindLast then
                    CollRecptNo := IncStr(CollDetail."Receipt No.")
                else begin
                    if "Company Head" = "Company Head"::LKS then
                        //CollRecptNo := 'RLKS-1213-00001';
                        CollRecptNo := 'RLKS-00001';
                    if "Company Head" = "Company Head"::VLK then
                        //CollRecptNo := 'RVLK-1213-00001';
                        CollRecptNo := 'RLKS-00001';
                    if "Company Head" = "Company Head"::VSH then
                        //CollRecptNo := 'RVSH-1213-00001';
                        CollRecptNo := 'RLKS-00001';
                end;
                "Receipt No." := CollRecptNo;
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

            trigger OnValidate()
            begin
                //Field Validation --- Start
                if "Company Head" = "Company Head"::LKS then begin
                    if Division = Division::VLK then
                        Error('Division must be TAX or IPR');
                    if Division = Division::VSH then
                        Error('Division must be TAX or IPR');
                end;
                if "Company Head" = "Company Head"::VLK then
                    // IF Division <> Division::VLK THEN
                    if Division = Division::VLK then
                        Error('Division must be VLK or IPR');
                if "Company Head" = "Company Head"::VSH then
                    if Division <> Division::VSH then
                        Error('Division must be VSH');
                //Field Validation --- End
            end;
        }
        field(4; "Creation Date"; Date)
        {

            trigger OnValidate()
            begin
                "Deposit Date" := "Creation Date" + 1;
            end;
        }
        field(5; "Client ID"; Code[20])
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
                //TEAM 2021 Selection of Client Name--Start--
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Client);
                CommonMaster.SetRange(CommonMaster."Master ID", "Client ID");
                CommonMaster.SetRange(CommonMaster."Division Type", Division);
                if CommonMaster.FindFirst then begin
                    "Client Name" := CommonMaster."Master Description";
                    "New Client Name" := CommonMaster."Master Description";
                    Address := CommonMaster.Address;
                    "Address 2" := CommonMaster."Address 2";
                    City := CommonMaster.City;
                end
                else begin
                    "Client Name" := '';
                    "New Client Name" := '';
                    Address := '';
                    "Address 2" := '';
                    City := '';
                end;

                //DuplicateChequeNo;

                if "Client ID" = 'C00040' then
                    "New Client Name" := '';

                //TEAM 2021 Selection of Client Name--End--

                //Git#83_MAC_31012023++
                UsersetupLoc.Reset();
                UsersetupLoc.SetRange(UsersetupLoc."User ID", UserId);
                if UsersetupLoc.FindFirst then begin
                    Location := UsersetupLoc.Location;
                end;
                //Git#83_MAC_31012023--
            end;
        }
        field(6; "Client Name"; Text[100])
        {
        }
        field(7; "Client Bank ID"; Code[20])
        {
            TableRelation = "Common Master"."Master ID" WHERE("Master Type" = FILTER(ClientBank));

            trigger OnValidate()
            begin
                //TEAM 2021 Selection of Client Bank ID--Start--
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                //CommonMaster.SETRANGE(CommonMaster."Company Head","Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::ClientBank);
                CommonMaster.SetRange(CommonMaster."Master ID", "Client Bank ID");
                //CommonMaster.SETRANGE(CommonMaster."Division Type",Division);
                if CommonMaster.FindFirst then
                    "Client Bank Name" := CommonMaster."Master Description"
                else
                    "Client Bank Name" := '';
                //TEAM 2021 Selection of Client Bank ID--End--

                //DuplicateChequeNo;
            end;
        }
        field(8; "Client Bank Name"; Text[50])
        {
        }
        field(9; "Client Bank City"; Code[20])
        {
            TableRelation = "Common Master"."Master ID" WHERE("Master Type" = FILTER(BankCity));

            trigger OnValidate()
            begin
                //2021 Selection of Client Bank City--Begin--
                CommonMaster.Reset;
                CommonMaster.SetCurrentKey("Company Head", "Master Type", "Master ID");
                CommonMaster.SetRange(CommonMaster."Company Head", "Company Head");
                CommonMaster.SetFilter(CommonMaster."Master Type", 'BankCity');
                CommonMaster.SetRange(CommonMaster."Master ID", "Client Bank City");
                if CommonMaster.FindFirst then begin
                    "Client Bank City Name" := CommonMaster."Master Description";
                end
                else begin
                    "Client Bank City Name" := '';
                end;

                //2021 Selection of Client Bank City--End--
            end;
        }
        field(10; "Deposit Bank"; Code[20])
        {
            TableRelation = "Common Master"."Master ID" WHERE("Master Type" = FILTER(Bank));

            trigger OnValidate()
            begin
                //TEAM 2021 Selection of Client Name--Start--
                CommonMaster.Reset;
                //CommonMaster.SETCURRENTKEY("Company Head","Master Type","Master ID");
                //CommonMaster.SETRANGE(CommonMaster."Company Head","Company Head");
                CommonMaster.SetRange(CommonMaster."Master ID", "Deposit Bank");
                if CommonMaster.FindFirst then
                    "Bank Account Name" := CommonMaster."Master Description"
                else
                    "Bank Account Name" := '';

                //TEAM 2021 Selection of Client Name--End--
            end;
        }
        field(11; "Bank Account Name"; Text[30])
        {
        }
        field(12; "Mode of Payment"; Option)
        {
            OptionCaption = 'Cheque,DD,WireTransfer';
            OptionMembers = Cheque,DD,WireTransfer;

            trigger OnValidate()
            begin
                if "Cheque No." <> '' then
                    Validate("Cheque No.");
            end;
        }
        field(13; "Cheque No."; Code[30])
        {

            trigger OnValidate()
            begin
                if "Mode of Payment" = "Mode of Payment"::Cheque then begin
                    if StrLen("Cheque No.") <> 7 then
                        Error('Cheque No should be 7 character long');
                end;

                if "Mode of Payment" = "Mode of Payment"::DD then begin
                    if StrLen("Cheque No.") <> 7 then
                        Error('Cheque No should be 7 character long');
                end;

                //CollectionDetail.SETFILTER(CollectionDetail."Mode of Payment",'<>%1',2);
                //IF "Mode of Payment" <> "Mode of Payment"::WireTransfer THEN
                if "Mode of Payment" = "Mode of Payment"::Cheque then
                    DuplicateChequeNo;

                if Submitted = true then
                    if "Cheque No." = '' then
                        Error('Cheque No Cannot be changed');
            end;
        }
        field(14; "Cheque Date"; Date)
        {

            trigger OnValidate()
            begin
                //IF (USERID <>'LSLAW\VISWANATHAN') OR (USERID <>'LSLAW\KUMAR.S')THEN
                //IF Submitted = TRUE THEN
                // IF "Cheque Date" <> 0D THEN
                //    ERROR('Cheque Date Cant be changed');
            end;
        }
        field(15; "Cheque Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Cheque Amount" <= 0 then
                    Error('Cheque Amount Cannot be 0'); //TCPL::6904 31/07/2017

                "Cheque Amount LCY" := "Cheque Amount";
                Total := "Cheque Amount";
                UpdateChequAmt();
            end;
        }
        field(16; Currency; Code[10])
        {
            InitValue = 'INR';
            TableRelation = Currency.Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                UpdateChequAmtLCY();
                UpdateChequAmt();


            end;
        }
        field(17; "Cheque Amount LCY"; Decimal)
        {
            trigger OnValidate()
            var

            begin
                UpdateChequAmtLCY();
            end;
        }
        field(18; "TDS Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Cheque Amount");
                Total := "Cheque Amount" + "TDS Amount";
                //"TDS %" := "TDS Amount"/"Cheque Amount"*100;
                "TDS %" := ("TDS Amount" / Total) * 100;
            end;
        }
        field(19; "TDS %"; Decimal)
        {
        }
        field(20; "Deposit Date"; Date)
        {
        }
        field(21; Location; Code[20])
        {
        }
        field(22; "Exchange Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Cheque Amount");
                if "Exchange Rate" > 0 then
                    "Cheque Amount LCY" := "Cheque Amount" * "Exchange Rate"
                else
                    "Cheque Amount LCY" := "Cheque Amount" * 1;
            end;
        }
        field(23; "Entry Type"; Option)
        {
            OptionCaption = ' ,Dishonour,Duplicate,NPI';
            OptionMembers = " ",Dishonour,Duplicate,NPI;
        }
        field(24; "Dishonour Date"; Date)
        {
        }
        field(25; "Client TAN"; Code[10])
        {
        }
        field(29; Posted; Boolean)
        {
        }
        field(30; "Posted No."; Code[20])
        {
        }
        field(31; Submitted; Boolean)
        {
        }
        field(32; "Document Type"; Option)
        {
            OptionCaption = 'Collection';
            OptionMembers = Collection;
        }
        field(33; "New Client Name"; Text[100])
        {

            trigger OnValidate()
            begin
                /*
                SETFILTER("Client ID", '<>%1|<>%2','C00040','C00040.');
                IF FIND('-') THEN
                //IF "Client ID" <> ('C00040' OR 'C00040.') THEN
                   ERROR('Client Name cannot be changed');
                */

            end;
        }
        field(34; Remarks; Text[250])
        {
        }
        field(35; "Voucher No. of Navision"; Code[20])
        {
        }
        field(36; Category; Text[50])
        {
        }
        field(37; Unposted; Boolean)
        {
        }
        field(38; "Unposted No."; Code[20])
        {
        }
        field(39; Total; Decimal)
        {
        }
        field(40; "On Submit Receipt No."; Code[20])
        {
            Description = 'This number is used as no series for LKS not receipt no';
        }
        field(41; "Client Bank City Name"; Text[50])
        {
        }
        field(42; "Bank Charges"; Decimal)
        {

            trigger OnValidate()
            begin
                Total := "Cheque Amount" + "TDS Amount" + "Bank Charges";
            end;
        }
        field(43; "Unknown Client Name"; Boolean)
        {
        }
        field(44; Address; Text[100])
        {
        }
        field(45; "Address 2"; Text[100])
        {
        }
        field(46; City; Code[20])
        {
        }
        field(47; "User Name"; Code[50])
        {
            Editable = false;
        }
        field(48; "No. Series Division"; Option)
        {
            OptionCaption = 'RLKS,RVLK,RVSH';
            OptionMembers = RLKS,RVLK,RVSH;
        }
        field(49; Cancel; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Receipt No.", "Company Head", "User Name")
        {
            Clustered = true;
        }
        key(Key2; "Deposit Bank")
        {
        }
        key(Key3; "On Submit Receipt No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        "Creation Date" := WorkDate;
        //"Creation Date" := TODAY;
        //"Deposit Date" := "Creation Date" + 1;
        "User Name" := UserId;

        j := Date2DMY("Creation Date", 1);
        k := Date2DMY("Creation Date", 2);
        l := Date2DMY("Creation Date", 3);

        if (j = 25) and (k = 1) and (l = 2014) then
            "Deposit Date" := "Creation Date" + 2
        else
            "Deposit Date" := "Creation Date" + 1;

        if (j = 14) and (k = 8) and (l = 2013) then
            "Deposit Date" := "Creation Date" + 2
        else
            "Deposit Date" := "Creation Date" + 1;

        if (j = 1) and (k = 10) and (l = 2013) then
            "Deposit Date" := "Creation Date" + 2
        else
            "Deposit Date" := "Creation Date" + 1;

        i := Date2DWY("Creation Date", 1);
        if i = 6 then
            "Deposit Date" := "Creation Date" + 2
        else
            "Deposit Date" := "Creation Date" + 1;

        //TBD
        /*UserLoc.Reset;
        UserLoc.SetRange(UserLoc."User Name", UserId);
        if UserLoc.FindFirst then begin
            Location := UserLoc.Location;
        end;
        */
        //Git#83_MAC_31012023++
        UsersetupLoc.Reset();
        UsersetupLoc.SetRange(UsersetupLoc."User ID", UserId);
        if UsersetupLoc.FindFirst then begin
            Location := UsersetupLoc.Location;
        end;
        //Git#83_MAC_31012023--

        //TCPL_509-This Piece of code only for reference, not used in logic --- Start
        if CompanyName = 'Lakshmi Kumaran & Sridharan' then
            CompInfo := CompInfo::LKS;
        if CompanyName = 'V.Lakshmikumaran' then
            CompInfo := CompInfo::VLK;
        if CompanyName = 'V.Sridharan' then
            CompInfo := CompInfo::VSH;
        //TCPL_509-This Piece of code only for reference, not used in logic --- END

        //Setting Reciept No based on current record company info --- Start
        // CollDetail.RESET;
        // CollDetail.SETRANGE("Company Head","Company Head");
        // IF CollDetail.FINDLAST THEN BEGIN
        // IF CollRecptNo = 'RLKS-100000' THEN
        //    CollRecptNo := 'RLKS-100001'
        // ELSE IF CollRecptNo = 'RVLK-100000' THEN
        //    CollRecptNo := 'RVLK-100001'
        // ELSE IF CollRecptNo = 'RVSH-100000' THEN
        //    CollRecptNo := 'RVSH-100001'
        // ELSE
        //  CollRecptNo := INCSTR(CollDetail."Receipt No.");
        // END ELSE
        // BEGIN
        //  IF "Company Head" = "Company Head"::LKS THEN
        //    //CollRecptNo := 'RLKS-1213-00001';
        //    CollRecptNo := 'RLKS-00001';
        //  IF "Company Head" = "Company Head"::VLK THEN
        //    //CollRecptNo := 'RVLK-1213-00001';
        //     CollRecptNo := 'RVLK-00001';
        //  IF "Company Head" = "Company Head"::VSH THEN
        //    //CollRecptNo := 'RVSH-1213-00001';
        //    CollRecptNo := 'RVSH-00001';
        // END;
        if "Company Head" = "Company Head"::LKS then
            CollRecptNo := NoSeriesManagement.GetNextNo('COLLECTION', Today, true);
        if "Company Head" = "Company Head"::VLK then
            CollRecptNo := NoSeriesManagement.GetNextNo('COLLECT-VL', Today, true);
        if "Company Head" = "Company Head"::VSH then
            CollRecptNo := NoSeriesManagement.GetNextNo('COLLECT-VS', Today, true);
        //END;
        "Receipt No." := CollRecptNo;
        //Setting Reciept No based on current record company info --- End
    end;

    var
        CollDetail: Record "Collection Detail";
        CollRecptNo: Code[20];
        CompInfo: Option LKS,VLK,VSH;
        CommonMaster: Record "Common Master";
        PostCode: Record "Post Code";
        CityCode: Text[100];
        UserLoc: Record User;
        UsersetupLoc: Record "User Setup";
        CollectionDetail: Record "Collection Detail";
        i: Integer;
        j: Integer;
        k: Integer;
        l: Integer;


    procedure DuplicateChequeNo()
    begin
        //IF "On Submit Receipt No." <> '' THEN BEGIN
        /*CollectionDetail.RESET;
        CollectionDetail.SETRANGE(CollectionDetail."Client ID","Client ID");
        CollectionDetail.SETRANGE(CollectionDetail."Client Bank ID","Client Bank ID");
        CollectionDetail.SETRANGE(CollectionDetail."Cheque No.","Cheque No.");
        //CollectionDetail.SETFILTER(CollectionDetail."Mode of Payment",'%1..%2',0,1);
        IF CollectionDetail.FINDFIRST THEN BEGIN
        REPEAT
          ERROR('Please check the cheque no');
        //MESSAGE('%1',"Mode of Payment");//PurchLine4.SETFILTER(Type,'<>%1',0);
        UNTIL CollectionDetail.NEXT=0;
        END;*/ //Validation has been tranfer to the submit button 6700

        //END;

    end;

    procedure UpdateChequAmtLCY()
    var
        CurrencyRec: Record Currency;
        CurrencyEXcRateRec: Record "Currency Exchange Rate";
    begin
        CurrencyEXcRateRec.Reset();
        CurrencyEXcRateRec.SetRange("Currency Code", rec.Currency);
        if CurrencyEXcRateRec.FindLast() then begin
            "Exchange Rate" := CurrencyEXcRateRec."Relational Exch. Rate Amount";
            "Cheque Amount" := ("Cheque Amount LCY" / CurrencyEXcRateRec."Relational Exch. Rate Amount");

        end;
    END;

    procedure UpdateChequAmt()
    var
        CurrencyRec: Record Currency;
        CurrencyEXcRateRec: Record "Currency Exchange Rate";
    begin
        CurrencyEXcRateRec.Reset();
        CurrencyEXcRateRec.SetRange("Currency Code", rec.Currency);
        if CurrencyEXcRateRec.FindLast() then begin
            "Exchange Rate" := CurrencyEXcRateRec."Relational Exch. Rate Amount";
            "Cheque Amount LCY" := ("Cheque Amount" * CurrencyEXcRateRec."Relational Exch. Rate Amount");

        end;


    end;

}

