codeunit 50016 "E-Invoice Generation"
{
    trigger OnRun()
    begin
        //AuthenticateCredentials('07AAAFL1585H1ZD');
    end;

    procedure AuthenticateCredentials(GSTIN: Code[16])
    var
        MessageID: Integer;
        Request: Text;
        JToken: JsonToken;
        JObject: JsonObject;
    begin
        InitPostRequest();
        if GSTRegistrationNos.Get(GSTIN) then;
        //URL_API := 'https://einvoicetpapi.gstrobo.com/V1/Authenticate';//For Produdction--Read
        URL_API := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/authenticate';//For UAT--Read
        Request := CreateLKSRequestAuth(GSTIN); //Add Body

        Content.GetHeaders(Header);
        Content.WriteFrom(Request);
        Header.Clear();
        // >>PANDU-UAT
        Header.Add('client_id', 'LKS258qualpRVCtpljh854QXgvKL');//For UAT--Read
        Header.Add('client_secret', 'LKS47TkipovzaklPRstupzkRO75Tj');//For UAT--Read
        Header.Add('IPAddress', '182.73.154.130');//For UAT--Read
        //Header.Add('client_id', 'LAKSHMIKS58qwerABVURT824JKLOP');//For UAT--Read
        //Header.Add('client_secret', 'LKS587QWERbv259jkzapoqtyLPRS');//For UAT--Read
        //Header.Add('IPAddress', '182.73.154.130');//For UAT--Read
        // <<PANDU-UAT

        Header.Add('Content-Type', 'application/json');
        //HttpWebRequestMgt.SetContentType('application/json');
        //HttpWebRequestMgt.SetReturnType('application/json'); 

        HttpRequest.GetHeaders(Header);
        HttpRequest.Content(Content);
        Client.Post(URL_API, Content, HttpResponse);

        HttpResponse.Content().ReadAs(Response);
        Message('The Authenticte Response: %1', Response);

        // Check Response status 
        if HttpResponse.HttpStatusCode() in [200, 201, 207] then begin
            // sucess response
            HttpResponse.Content().ReadAs(Response);
            JObject.ReadFrom(Response);
            JObject.Get('MessageId', JToken);
            MessageID := JToken.AsValue().AsInteger();
            if MessageID = 0 then begin
                JObject.Get('Message', JToken);
                Message(JToken.AsValue().AsText());
            end;

        end else begin
            // Failed Response
            MESSAGE(GETLASTERRORTEXT);
        end;

    end;

    procedure CreateLKSRequestAuth(GSTIN: Code[16]): Text
    var
        JsonWriter: Codeunit "Json Text Reader/Writer";
    Begin
        JsonWriter.WriteStartObject('');
        JsonWriter.WriteStringProperty('action', 'ACCESSTOKEN');
        JsonWriter.WriteStringProperty('UserName', 'LKS07');
        JsonWriter.WriteStringProperty('Password', 'Lks@2021');
        //JsonWriter.WriteStringProperty('UserName', GSTRegistrationNos."User Name");
        //JsonWriter.WriteStringProperty('Password', GSTRegistrationNos.Password);
        JsonWriter.WriteStringProperty('Gstin', GSTIN);
        JsonWriter.WriteEndObject();
        exit(JsonWriter.GetJSonAsText());
    End;

    procedure InitPostRequest()
    begin
        Clear(Response);
        Clear(Content);
        Clear(Client);
        Clear(Header);
        Clear(HttpResponse);
        Clear(HttpRequest);
    end;

    local procedure ReturnStr(Amt: Decimal): Text
    begin
        EXIT(DELCHR(FORMAT(Amt), '=', ','));
    end;

    local procedure DelString(StringToChange: Text): Text
    var
        CharToRemove: char;
        ASCIIVal: Integer;
        i: Integer;
        FinalString: Text;
    begin
        CLEAR(FinalString);
        StringToChange := DELCHR(StringToChange, '=', '\');
        StringToChange := DELCHR(StringToChange, '=', '–');
        StringToChange := DELCHR(StringToChange, '=', '"');
        StringToChange := DELCHR(StringToChange, '=', '^');
        StringToChange := DELCHR(StringToChange, '=', '”');
        StringToChange := DELCHR(StringToChange, '=', '"');
        StringToChange := DELCHR(StringToChange, '=', '’');
        StringToChange := DELCHR(StringToChange, '=', '’');
        FOR i := 1 TO STRLEN(StringToChange) DO BEGIN
            CharToRemove := StringToChange[i];
            ASCIIVal := CharToRemove;
            IF (STRPOS('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890 @%(),-./', FORMAT(StringToChange[i])) > 0) AND (ASCIIVal <> 160) THEN
                FinalString += FORMAT(StringToChange[i])
            ELSE
                FinalString += ' ';
        END;
        EXIT(FinalString);
    end;

    procedure GenerateInvoiceIRNNumberUpdated(VAR SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        Request: text;
        GSTRegistrationNos: Record "GST Registration Nos.";
        Location: Record "Location";
        MessageID: Integer;
        JToken: JsonToken;
        JObject: JsonObject;
        StringToRead: Text;
        SalesInvoiceHdrExtend: Record "Posted Sales Extended";
        AckNo: Code[20];
        AckDt: DateTime;
        SignedQRText: Text;
        ResultToken: JsonToken;
    begin
        Location.RESET;
        IF Location.GET(SalesInvoiceHeader."Location Code") THEN;
        GSTRegistrationNos.Get(Location."GST Registration No.");

        InitPostRequest();
        //URL_API := 'https://einvoicetpapi.gstrobo.com/V1/Authenticate';//For Produdction--Read
        PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/einvoice';//For UAT--Read
        //   PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/EInvoice';//For UAT--Read
        //PANDU LIVE PostUrl := 'https://einvoicetpapi.gstrobo.com/V1/EInvoice';//For Produdction--Read

        Request := CreateInvoiceIRNRequest(SalesInvoiceHeader); //Add Body

        Content.GetHeaders(Header);
        Content.WriteFrom(Request);
        Header.Clear();

        Header.Add('client_id', 'LKS258qualpRVCtpljh854QXgvKL');//For UAT--Read
        Header.Add('client_secret', 'LKS47TkipovzaklPRstupzkRO75Tj');//For UAT--Read

        Header.Add('IPAddress', '182.73.154.130');//For UAT--Read
        //Header.Add('client_id', 'LAKSHMIKS58qwerABVURT824JKLOP');//For LIVE
        //Header.Add('client_secret', 'LKS587QWERbv259jkzapoqtyLPRS');//For LIVE
        //Header.Add('IPAddress', '182.73.154.130');//For LIVE
        Header.Add('user_name', GSTRegistrationNos."User Name");
        Header.Add('Gstin', Location."GST Registration No.");
        Header.Add('Content-Type', 'application/json');
        //HttpWebRequestMgt.SetContentType('application/json');
        //HttpWebRequestMgt.SetReturnType('application/json');

        HttpRequest.GetHeaders(Header);
        HttpRequest.Content(Content);
        Client.Post(PostUrl, Content, HttpResponse);
        message('The Invoice Request is : %1', Request);


        // Check Response status
        if HttpResponse.HttpStatusCode() in [200, 201, 207] then begin
            // sucess response
            HttpResponse.Content().ReadAs(Response);
            JObject.ReadFrom(Response);
            JObject.Get('MessageId', JToken);
            MessageID := JToken.AsValue().AsInteger();
            if MessageID = 0 then begin
                JObject.Get('Message', JToken);
                Message(JToken.AsValue().AsText());
            end;
            if MessageID = 1 then begin
                SalesInvoiceHdrExtend.RESET;
                SalesInvoiceHdrExtend.SETRANGE("No.", SalesInvoiceHeader."No.");
                IF SalesInvoiceHdrExtend.FINDFIRST THEN;
                //JObject := JObject.GetValue('Data'); 
                Jobject.get('Data', JToken);
                Jtoken.SelectToken('Irn', ResultToken);
                StringToRead := ResultToken.AsValue().AsText();
                SalesInvoiceHdrExtend."IRN No." := StringToRead;
                Message('IRN %1 generated successfully.', StringToRead);

                //JObject.Get('Data.AckNo', JToken);
                Jtoken.SelectToken('AckNo', ResultToken);
                AckNo := ResultToken.AsValue().AsText();
                SalesInvoiceHdrExtend."Ack No." := AckNo;
                //JObject.Get('Data.AckDt', JToken);
                Jtoken.SelectToken('AckDt', ResultToken);
                AckDt := ResultToken.AsValue().AsDateTime();
                SalesInvoiceHdrExtend."Ack Date" := AckDt;
                //JObject.Get('Data.SignedQRCode', JToken);
                Jtoken.SelectToken('SignedQRCode', ResultToken);
                SignedQRText := ResultToken.AsValue().AsText();

                SalesInvoiceHdrExtend.Modify;
                QRCodeManagement.CreateQRCodeforSalesInvoiceHeader(SalesInvoiceHeader, SignedQRText);
                SalesInvoiceHdrExtend.CalcFields("QR Code");
                //MESSAGE('QR Code : %1',SalesInvoiceHdrExtend."QR Code");
            end;
        end else begin
            // Failed Response
            MESSAGE(GETLASTERRORTEXT);
        end;

        // TempBlob1.CreateInStream(Instr);
        // TempBlob1.CreateOutStream(Outstr);
        // Req.Write(Outstr);
        // Message('%1', Req);
        //TempBlob1.CalcFields(Blob);
        //HttpWebRequestMgt.AddBodyBlob(TempBlob1);


        // TempBlob.Init;
        // TempBlob.Blob.CreateInStream(Instr);

        //PANDU Response Read
        /*
        if HttpWebRequestMgt.GetResponse(Instr, HttpStatusCode, ResponseHeaders) then begin
            ApiResult := TempBlob.ReadAsText('', TEXTENCODING::UTF8);
            Message(ApiResult);
            JObject := JObject.Parse(ApiResult);
            //MESSAGE(ConvertString.ToString(JObject.GetValue('Message')));
            MessageID := ConvertString.ToInt32(JObject.GetValue('MessageId'));
            if MessageID = 0 then begin
                txtResponse := ConvertString.ToString(JObject.GetValue('Message'));
                Message(txtResponse);
            end;
            // IF txtResponse=' Duplicate IRN' THEN
            //   EXIT;
            if MessageID = 1 then begin
                JObject := JObject.GetValue('Data');
                StringToRead := ConvertString.ToString(JObject.GetValue('Irn'));
                SalesInvoiceHdrExtend."IRN No." := StringToRead;
                Message('IRN %1 generated successfully.', StringToRead);
                AckNo := ConvertString.ToString(JObject.GetValue('AckNo'));
                SalesInvoiceHdrExtend."Ack No." := AckNo;
                //MESSAGE('ACK No :'+AckNo);
                AckDt := ConvertString.ToDateTime(JObject.GetValue('AckDt'));
                //MESSAGE('ACK Date : %1',AckDt);
                SalesInvoiceHdrExtend."Ack Date" := AckDt;
                SignedQRText := ConvertString.ToString(JObject.GetValue('SignedQRCode'));

                SalesInvoiceHdrExtend.Modify;
                QRCodeManagement.CreateQRCodeforSalesInvoiceHeader(SalesInvoiceHeader, SignedQRText);
                SalesInvoiceHdrExtend.CalcFields("QR Code");
                //MESSAGE('QR Code : %1',SalesInvoiceHdrExtend."QR Code");
            end;
        end else
            Message(APIError);
        */
    end;

    procedure CreateInvoiceIRNRequest(VAR SalesInvoiceHeader: Record "Sales Invoice Header"): Text
    var
        txtResponse: Text;
        StringToRead: Text;
        CategoryCode: Text[5];
        ReverseCharge: Text[4];
        CompanyInformation: Record "Company Information";
        RecState: Record State;
        RecCustomer: Record Customer;
        BuyerGSTNo: Code[20];
        BuyerState: Record State;
        Location: Record Location;
        LocationState: Record State;
        ShiptoAddress: Record "Ship-to Address";
        ShipState: Record State;
        SalesInvoiceLine: Record "Sales Invoice Line";
        DGLEntry: Record "Detailed GST Ledger Entry";
        CGSTPer: Decimal;
        SGSTPer: Decimal;
        IGSTPer: Decimal;
        TotItemValue: Decimal;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SIL: Record "Sales Invoice Line";
        DetailedGSTEntry: Record "Detailed GST Ledger Entry";
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        IRNBody: Text;
        CompPhoneNo: Text[10];
        LocPhone: Text[10];
        CustPhone: Text[10];
        ShipPhone: Text[10];
        ItemUnitofMeasure: Record "Item Unit of Measure";
        UnitofMeasure: Record "Unit of Measure";
        UOM: Text[8];
        CompEmail: Text[100];
        LocEmail: Text[100];
        CustEmail: Text[100];
        ShipEmail: Text[100];
        AckNo: Code[20];
        AckDt: DateTime;
        TransType: Text[6];
        ExportCategory: Text[5];
        GSTPayment: Text[4];
        TotAmtinForCurr: Text;
        Country: Record "Country/Region";
        CountryCode: Text[4];
        CurrCode: Text[5];
        ExportDetails: Text;
        MessageID: Integer;
        ExportState: Text[50];
        ShipExpState: Code[5];
        ExportPinCode: Code[6];
        ShipExpPinCode: Code[6];
        ShipGSTNo: Text[20];
        ShippingDetails: Text;
        POS: Code[2];
        POSState: Record State;
        ShippingAgent: Record "Shipping Agent";
        ModeOfTransport: Integer;
        ShipmentMethod: Record "Transport Method";
        SILine: Record "Sales Invoice Line";
        SrNo: Integer;
        Service: Text[1];
        TransporterGSTIN: Text[15];
        TransporterName: Text[100];
        TransDocNo: Text[15];
        TransDocDate: Text;
        VehicleNo: Text[20];
        VehicleType: Text[4];
        QRCode: BigText;
        SignedQRText: Text;
        BillAddress2: Text;
        SalesInvoiceHdrExtend: Record "Posted Sales Extended";
        GSTPercen: Decimal;
        CompInfoName: Text;
        CompInfoName2: Text;
        CompInfoAdd: Text;
        CompInfoAdd2: Text;
        BillToName: Text;
        BillToName2: Text;
        BillToAdd: Text;
        BillToAdd2: Text;
        LocationName: Text;
        LocationName2: Text;
        LocationAdd: Text;
        LocationAdd2: Text;
        ShipToName: Text;
        ShipToName2: Text;
        ShipToAdd: Text;
        ShipToAdd2: Text;
        Itemdesc: Text;
        Itemdesc2: Text;
        GSTRegistrationNos: Record "GST Registration Nos.";
        CurrencyFactor: Decimal;
        GSTBaseAmtL: Decimal;
        HSNSAC: Code[10];
        Request: Text;
        JsonWriter: Codeunit "Json Text Reader/Writer";
        DetGSTLedgEntry1: Record "Detailed GST Ledger Entry";
        GSTBaseAmount1: Decimal;
        IGSTAmount1: Decimal;
        CGSTAmount1: Decimal;
        SGSTAmount1: Decimal;
        SIL2: Record "Sales Invoice Line";
    Begin

        if SalesInvoiceHeader."Currency Factor" <> 0 then
            CurrencyFactor := SalesInvoiceHeader."Currency Factor"
        else
            CurrencyFactor := 1;

        // SalesInvoiceHdrExtend.GET(SalesInvoiceHeader."No.");
        SalesInvoiceHdrExtend.Reset;
        SalesInvoiceHdrExtend.SetRange("No.", SalesInvoiceHeader."No.");
        if SalesInvoiceHdrExtend.FindFirst then;
        if SalesInvoiceHdrExtend."IRN No." <> '' then
            Error('IRN No. is already generated');
        Clear(ItemDetails);
        Clear(HttpWebRequestMgt);
        Clear(Req);

        // if not TempBlob1.IsEmpty then
        //     TempBlob1.Delete;
        // if not TempBlob.IsEmpty then
        //     TempBlob.Delete;

        TtlLength := 1;
        CompanyInformation.Get;
        ShiptoAddress.Reset;
        if ShiptoAddress.Get(SalesInvoiceHeader."Sell-to Customer No.", SalesInvoiceHeader."Ship-to Code") then;
        DetailedGSTLedgerEntry.Reset;
        DetailedGSTLedgerEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        if DetailedGSTLedgerEntry.FindFirst then;

        Location.Reset;
        if Location.Get(SalesInvoiceHeader."Location Code") then;
        LocationState.Reset;
        if LocationState.Get(Location."State Code") then;

        POSState.Reset;
        // IF POSState.GET(DetailedGSTLedgerEntry."Buyer/Seller State Code") THEN
        if POSState.Get(ShiptoAddress.State) then
            POS := POSState."State Code (GST Reg. No.)"
        else
            POS := '96';

        RecCustomer.Reset;
        if RecCustomer.Get(SalesInvoiceHeader."Sell-to Customer No.") then;
        BuyerState.Reset;
        // IF BuyerState.GET(SalesInvoiceHeader."GST Bill-to State Code") THEN;
        if BuyerState.Get(ShiptoAddress.State) then;


        // BuyerGSTNo:=SalesInvoiceHeader."Customer GST Reg. No.";//2212
        BuyerGSTNo := ShiptoAddress."GST Reg No.";
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Unregistered THEN
        //  BuyerGSTNo:='URP';

        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Registered THEN
        //  CategoryCode:='B2B';
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Export THEN
        //  CategoryCode:='Exp';

        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Export THEN
        //  ExportCategory:='"DIR"'
        // ELSE
        //  ExportCategory:='null';
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"Deemed Export" THEN
        //  ExportCategory:='"DEM"'
        // ELSE
        //  ExportCategory:='null';
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"7" THEN
        //  ExportCategory:='"SEZ"'
        // ELSE
        //  ExportCategory:='null';
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"6" THEN
        //  ExportCategory:='"SED"'
        // ELSE
        //  ExportCategory:='null';

        // ShiptoAddress.RESET;
        // IF ShiptoAddress.GET(SalesInvoiceHeader."Sell-to Customer No.",SalesInvoiceHeader."Ship-to Code") THEN;
        ShipState.Reset;
        // IF ShipState.GET(SalesInvoiceHeader."GST Ship-to State Code") THEN;
        if ShipState.Get(ShiptoAddress.State) then;

        if ShiptoAddress."GST Registration No." <> '' then
            ShipGSTNo := '"' + ShiptoAddress."GST Registration No." + '"'
        else
            ShipGSTNo := 'null';
        // IF DetailedGSTLedgerEntry."Reverse Charge" THEN
        //  ReverseCharge:='Y'
        // ELSE
        //  ReverseCharge:='N';
        if ShiptoAddress."Transaction Type" in [ShiptoAddress."Transaction Type"::EXPWOP, ShiptoAddress."Transaction Type"::EXPWOP] then
            ReverseCharge := 'N'
        else
            ReverseCharge := 'Y';
        if SalesInvoiceHeader."GST Without Payment of Duty" then
            GSTPayment := '"Y"'
        else
            GSTPayment := '"N"';

        // IF CompanyInformation."Phone No."<>'' THEN
        //  BEGIN
        //  IF STRLEN(CompanyInformation."Phone No.")=10 THEN
        //    CompPhoneNo:=CompanyInformation."Phone No."
        //  ELSE
        //    CompPhoneNo:='null';
        //  END
        // ELSE
        //  CompPhoneNo:='null';
        CompPhoneNo := 'null';
        // IF Location."Phone No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(Location."Phone No.")=10 THEN
        //      LocPhone:=Location."Phone No."
        //    ELSE
        //      LocPhone:='null';
        //  END
        // ELSE
        //  LocPhone:='null';
        LocPhone := 'null';
        // IF SalesInvoiceHeader."Bill-to Contact No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(SalesInvoiceHeader."Bill-to Contact No.")=10 THEN
        //      CustPhone:=SalesInvoiceHeader."Bill-to Contact No."
        //    ELSE
        //      CustPhone:='null';
        //  END
        // ELSE
        //  CustPhone:='null';
        CustPhone := 'null';
        // IF ShiptoAddress."Phone No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(ShiptoAddress."Phone No.")=10 THEN
        //      ShipPhone:=ShiptoAddress."Phone No."
        //    ELSE
        //      ShipPhone:='null';
        //  END
        // ELSE
        //  ShipPhone:='null';
        ShipPhone := 'null';

        // IF CompanyInformation."E-Mail"<>'' THEN
        //  CompEmail:='"'+CompanyInformation."E-Mail"+'"'
        // ELSE
        //  CompEmail:='null';
        CompEmail := 'null';
        // IF Location."E-Mail"<>'' THEN
        //  LocEmail:='"'+Location."E-Mail"+'"'
        // ELSE
        //  LocEmail:='null';
        LocEmail := 'null';

        // IF RecCustomer."E-Mail"<>'' THEN
        //  CustEmail:='"'+RecCustomer."E-Mail"+'"'
        // ELSE
        //  CustEmail:='null';
        CustEmail := 'null';
        // IF ShiptoAddress."E-Mail"<>'' THEN
        //  ShipEmail:='"'+ShiptoAddress."E-Mail"+'"'
        // ELSE
        //  ShipEmail:='null';
        ShipEmail := 'null';
        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then begin
            CurrCode := '"' + SalesInvoiceHeader."Currency Code" + '"';
            //PANDU TBD SalesInvoiceHeader.CalcFields("Amount to Customer");
            //PANDU TBD TotAmtinForCurr := ReturnStr(SalesInvoiceHeader."Amount to Customer");
            BuyerGSTNo := 'URP';
            ShipGSTNo := 'null';
            Country.Reset;
            if Country.Get(ShiptoAddress."Country/Region Code") then
                CountryCode := '"' + Country."Country Code for E Invoicing" + '"';
        end
        else begin
            TotAmtinForCurr := Format(0);
            GSTPayment := 'null';
            CountryCode := 'null';
            CurrCode := 'null';
        end;

        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then
            ExportDetails := '{"ShippingBillNo": null,' +
            '"ShippingBillDate": null,' +
            '"PortCode": null,' +
            '"ForeignCurrency": ' + CurrCode + ',' +
            '"CountryCode": ' + CountryCode + ',' +
            '"RefundClaim": null,' +
            '"ExportDuty": "0"},'
        else
            ExportDetails := 'null,';

        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then begin
            ExportState := '96';
            ExportPinCode := '999999'
        end else begin
            ExportState := '"' + BuyerState."State Code for E-Invoicing" + '"';
            //  ExportPinCode:=SalesInvoiceHeader."Bill-to Post Code";
            ExportPinCode := ShiptoAddress."Post Office";
        end;

        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP)
          and (ShiptoAddress.State = '') then begin
            ShipExpState := '96';
            ShipExpPinCode := '999999'
        end else begin
            ShipExpState := ShipState."State Code for E-Invoicing";
            ShipExpPinCode := SalesInvoiceHeader."Ship-to Post Code";
        end;


        //Calculate Transaction Type
        TransType := Format(ShiptoAddress."Transaction Type");
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Registered THEN
        //  TransType:='B2B';
        // IF ((SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"7") OR (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"6"))
        //  AND (NOT SalesInvoiceHeader."GST Without Payment of Duty") THEN
        //  TransType:='SEZWP';
        // IF ((SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"7" )OR (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"6"))
        //  AND (SalesInvoiceHeader."GST Without Payment of Duty") THEN
        //  TransType:='SEZWOP';
        // IF (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Export) AND (NOT SalesInvoiceHeader."GST Without Payment of Duty") THEN
        //  TransType:='EXPWP';
        // IF (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Export) AND (SalesInvoiceHeader."GST Without Payment of Duty") THEN
        //  TransType:='EXPWOP';
        // IF SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"Deemed Export" THEN
        //  TransType:='DEXP';
        //Calculate Transaction Type

        SIL.Reset;
        SIL.SetRange("Document No.", SalesInvoiceHeader."No.");
        SIL.SetFilter("No.", '<>%1', '54-950900');//Please change the rounding GL account no for respective Client//Read//Done
        //TBD SIL.CalcSums("GST Base Amount", "Amount To Customer", "Line Discount Amount", "Charges To Customer", "Bal. TDS/TCS Including SHECESS");
        SIL.CalcSums("Line Discount Amount");


        SILine.Reset;
        SILine.SetRange("Document No.", SalesInvoiceHeader."No.");
        SILine.SetRange(Type, SILine.Type::"G/L Account");
        SILine.SetRange("No.", '54-950900');//Please change the rounding GL account no for respective Client//Read
        if SILine.FindFirst then;

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'CGST');
        DetailedGSTEntry.CalcSums("GST Amount", "GST Base Amount");
        CGSTAmt := Abs(DetailedGSTEntry."GST Amount");
        GSTBaseAmtL := Abs(DetailedGSTEntry."GST Base Amount");

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'SGST');
        DetailedGSTEntry.CalcSums("GST Amount");
        SGSTAmt := Abs(DetailedGSTEntry."GST Amount");

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'IGST');
        DetailedGSTEntry.CalcSums("GST Amount", "GST Base Amount");
        IGSTAmt := Abs(DetailedGSTEntry."GST Amount");
        if GSTBaseAmtL = 0 then
            GSTBaseAmtL := Abs(DetailedGSTEntry."GST Base Amount");

        TotalAmtCust := 0;
        //3K TotalAmtCust := SIL."Amount To Customer";
        TotalAmtCust := SIL."Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt; //3K
        SIL2.Reset;
        SIL2.SetRange("Document No.", SalesInvoiceHeader."No.");
        SIL2.SetFilter("No.", '<>%1', '54-950900');//Please change the rounding GL account no for respective Client//Read//Done
        if SIL2.findset then
            repeat
                TotalAmtCustNew += SIL2."Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt; //3K
            until sil2.next = 0;
        //IF ((SalesInvoiceHeader."GST Customer Type" = SalesInvoiceHeader."GST Customer Type"::"7") OR (SalesInvoiceHeader."GST Customer Type" = SalesInvoiceHeader."GST Customer Type"::"6")) THEN
        //    TotalAmtCust := SIL."Amount To Customer" + CGSTAmt + SGSTAmt + IGSTAmt
        //ELSE
        //    TotalAmtCust := SIL."Amount To Customer";

        ShippingAgent.Reset;
        if ShippingAgent.Get(SalesInvoiceHeader."Shipping Agent Code") then;
        //2212
        // IF ShippingAgent."GST Registration No."<>'' THEN
        //  TransporterGSTIN:='"'+ShippingAgent."GST Registration No."+'"'
        // ELSE
        //  TransporterGSTIN:='null';
        TransporterGSTIN := 'null';
        if ShippingAgent.Name <> '' then
            TransporterName := '"' + ShippingAgent.Name + '"'
        else
            TransporterName := 'null';
        if SalesInvoiceHeader."LR/RR No." <> '' then
            TransDocNo := '"' + SalesInvoiceHeader."LR/RR No." + '"'
        else
            TransDocNo := 'null';
        if SalesInvoiceHeader."LR/RR Date" <> 0D then
            TransDocDate := '"' + Format(SalesInvoiceHeader."LR/RR Date", 0, '<Day,2>/<Month,2>/<Year4>') + '"'
        else
            TransDocDate := 'null';
        if SalesInvoiceHeader."Vehicle No." <> '' then
            VehicleNo := '"' + SalesInvoiceHeader."Vehicle No." + '"'
        else
            VehicleNo := 'null';
        //2212
        // IF SalesInvoiceHeader."Vehicle Type"=SalesInvoiceHeader."Vehicle Type"::"0" THEN
        //  VehicleType:='null';
        // IF SalesInvoiceHeader."Vehicle Type"=SalesInvoiceHeader."Vehicle Type"::"2" THEN
        //  VehicleType:='"O"';
        // IF SalesInvoiceHeader."Vehicle Type"=SalesInvoiceHeader."Vehicle Type"::"1" THEN
        //  VehicleType:='"R"';
        VehicleType := 'null';
        ShipmentMethod.Reset;
        // IF ShipmentMethod.GET(SalesInvoiceHeader."Shipment Method Code") THEN;
        if ShipmentMethod.Get(SalesInvoiceHeader."Transport Method") then;

        //2212
        // IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"0" THEN
        //  ModeOfTransport:=1
        // ELSE IF ShipmentMethod."Trans Mode" =ShipmentMethod."Trans Mode"::"1" THEN
        //  ModeOfTransport:=2
        // ELSE IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"2" THEN
        //  ModeOfTransport:=3
        // ELSE IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"3" THEN
        //  ModeOfTransport:=4;

        //
        CompInfoName := CompanyInformation.Name;
        CompInfoName2 := CompanyInformation."Name 2";
        CompInfoAdd := CompanyInformation.Address;

        CompInfoAdd2 := CompanyInformation."Address 2";
        if CompInfoAdd2 = '' then
            CompInfoAdd2 := '   ';



        BillToName := SalesInvoiceHeader."Bill-to Name";
        BillToName2 := SalesInvoiceHeader."Bill-to Name 2";
        // BillToAdd := SalesInvoiceHeader."Bill-to Address";
        // BillToAdd2 := SalesInvoiceHeader."Bill-to Address 2";
        // BillToName := ShiptoAddress.Name;
        // BillToName2 := ShiptoAddress."Name 2";
        BillToAdd := ShiptoAddress.Address;
        BillToAdd2 := ShiptoAddress."Address 2";
        if BillToAdd2 = '' then
            BillToAdd2 := '   ';

        ShipToName := SalesInvoiceHeader."Ship-to Name";
        ShipToName2 := SalesInvoiceHeader."Ship-to Name 2";
        ShipToAdd := SalesInvoiceHeader."Ship-to Address";
        ShipToAdd2 := SalesInvoiceHeader."Ship-to Address 2";
        if ShipToAdd2 = '' then
            ShipToAdd2 := '   ';

        LocationName := Location.Name;
        LocationName2 := Location."Name 2";
        LocationAdd := Location.Address;
        LocationAdd2 := Location."Address 2";
        if LocationAdd2 = '' then
            LocationAdd2 := '   ';

        //
        // IF SalesInvoiceHeader."Ship-to Code"<>'' THEN
        // ShippingDetails:='{"GstinNo": '+ShipGSTNo+','+
        //    '"LegalName": "'+DelString(ShipToName)+DelString(ShipToName2)+'",'+
        //    '"TrdName": "'+DelString(ShipToName)+DelString(ShipToName2)+'",'+
        //    '"Address1": "'+DelString(ShipToAdd)+'",'+
        //    '"Address2": "'+DelString(ShipToAdd2)+'",'+
        //    '"Location": "'+SalesInvoiceHeader."Ship-to City"+'",'+
        //    '"Pincode": '+ShipExpPinCode+','+
        //    '"StateCode": "'+ShipExpState+'"},'
        //  ELSE
        ShippingDetails := 'null,';
        //
        //   PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-Dev/EInvoice';//For UAT--Read
        //   PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/EInvoice';//For UAT--Read
        // PANDU Enable Later PostUrl := 'https://einvoicetpapi.gstrobo.com/V1/EInvoice';//For Produdction--Read
        //ServicePointManager.SecurityProtocol := SecurityProtocolType.Tls12;//For Produdction--Read
        IRNBody := '{"action": "INVOICE",' +
          '"Version": "1.1",' +
          '"Irn": "",' +
          '"TpApiTranDtls": {' +
            '"RevReverseCharge": "' + ReverseCharge + '",' +
            '"Typ": "' + TransType + '",' +
            '"TaxPayerType": "GST",' +
            '"EcomGstin": null,' +
            '"IgstOnIntra": null' +//7739
          '},' +
          '"TpApiDocDtls": {' +
            '"DocTyp": "INV",' +
            '"DocNo": "' + SalesInvoiceHeader."No." + '",' +
            '"DocDate": "' + Format(SalesInvoiceHeader."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '"' +
          //'"DocDate": "'+FORMAT(TODAY,0,'<Day,2>/<Month,2>/<Year4>')+'",'+
          //'"OrgInvNo": null'+//7739
          '},' +
          '"TpApiExpDtls":' + ExportDetails +
          '"TpApiSellerDtls": {' +
            '"GstinNo": "' + Location."GST Registration No." + '",' +//Please open when client go for the Produdction--Read
        //    '"GstinNo": "'+'29AAACB0652N000'+'",'+//Comment-when client go for the Produdction--Read
            '"LegalName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"TrdName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"Address1": "' + DelString(LocationAdd) + '",' +
            '"Address2": "' + DelString(LocationAdd2) + '",' +
            '"Location": "' + Location.City + '",' +
            '"Pincode": "' + Location."Post Code" + '",' +//Please open when client go for the Produdction--Read
            '"StateCode": "' + LocationState."State Code for E-Invoicing" + '",' +//Please open when client go for the Produdction--Read
        //    '"Pincode": "560063",'+//Comment-when client go for the Produdction--Read
        //    '"StateCode": "29",'+//Comment-when client go for the Produdction--Read
            '"MobileNo": ' + LocPhone + ',' +
            '"EmailId": ' + LocEmail +
          '},' +
          '"TpApiBuyerDtls": {' +
            '"GstinNo": "' + BuyerGSTNo + '",' +
            '"LegalName": "' + DelString(BillToName) + DelString(BillToName2) + '",' +
            '"TrdName": "' + DelString(BillToName) + DelString(BillToName2) + '",' +
            '"PlaceOfSupply": "' + POS + '",' +
            '"Address1": "' + DelString(BillToAdd) + '",' +
            '"Address2": "' + DelString(BillToAdd2) + '",' +
        //    '"Location": "'+SalesInvoiceHeader."Bill-to City"+'",'+
            '"Location": "' + ShiptoAddress.City + '",' +
            '"Pincode": ' + ExportPinCode + ',' +
            //'"Pincode": '+'""'+','+
            '"StateCode": ' + ExportState + ',' +
            '"MobileNo": ' + CustPhone + ',' +
            '"EmailId": ' + CustEmail +
          '},' +
          '"TpApiDispDtls": {' +
            '"CompName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"Address1": "' + DelString(LocationAdd) + '",' +
            '"Address2": "' + DelString(LocationAdd2) + '",' +
            '"Location": "' + Location.City + '",' +
            '"Pincode": ' + Location."Post Code" + ',' +
            '"StateCode": "' + LocationState."State Code for E-Invoicing" + '"' +
          '},' +
          '"TpApiShipDtls":' + ShippingDetails +

          '"TpApiValDtls": {' +
            //    '"TotalTaxableVal": '+ReturnStr(ROUND(GSTBaseAmtL,0.01,'='))+','+
            //'"TotalTaxableVal": ' + ReturnStr(Round(TotalAmtCust / CurrencyFactor, 0.01, '=')) + ',' +
            '"TotalTaxableVal": ' + ReturnStr(Round(TotalAmtCustNew / CurrencyFactor, 0.01, '=')) + ',' +
            '"TotalSgstVal": ' + ReturnStr(Round(SGSTAmt, 0.01, '=')) + ',' +
            '"TotalCgstVal": ' + ReturnStr(Round(CGSTAmt, 0.01, '=')) + ',' +
            '"TotalIgstVal": ' + ReturnStr(Round(IGSTAmt, 0.01, '=')) + ',' +
            '"TotalCesVal": 0,' +
            '"TotalStateCesVal": 0,' +
            //'"TotInvoiceVal": ' + ReturnStr(Round(TotalAmtCust / CurrencyFactor, 0.01, '=')) + ',' +//7739
            '"TotInvoiceVal": ' + ReturnStr(Round(TotalAmtCustNew / CurrencyFactor, 0.01, '=')) + ',' +//7739
                                                                                                       //'"TotInvoiceVal": '+ReturnStr(SIL."Amount To Customer"-(SGSTAmt+CGSTAmt+IGSTAmt))+','+
            '"RoundOfAmt": ' + ReturnStr(Round(SILine."Line Amount" / CurrencyFactor, 0.01, '=')) + ',' +
            //'"TotalInvValueFc": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
            '"TotalInvValueFc": ' + ReturnStr(Round(TotalAmtCustNew, 0.01, '=')) + ',' +
            '"Discount": ' + ReturnStr(Round(SIL."Line Discount Amount" / CurrencyFactor, 0.01, '=') * 0) + ',' +//7739//1112
                                                                                                                 //TBD '"OthCharge": ' + ReturnStr(Round(SIL."Charges To Customer" + SIL."Bal. TDS/TCS Including SHECESS", 0.01, '=')) +//7739
            '"OthCharge": ' + ReturnStr(0) +
          '},' +
          '"TpApiItemList": [';

        //Req.AddText(IRNBody, TtlLength);
        TempLength := StrLen(IRNBody);
        TtlLength += TempLength + 1;

        Clear(SrNo);
        Clear(Service);
        SalesInvoiceLine.Reset;
        SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");
        SalesInvoiceLine.SetFilter("No.", '<>%1', '54-950900');//Please change GL account for the rounding according to client--Read//Done
        SalesInvoiceLine.SetFilter(Quantity, '<>%1', 0);
        if SalesInvoiceLine.FindSet then
            repeat
                Clear(GSTPercen);
                Clear(CGSTPer);
                Clear(SGSTPer);
                Clear(IGSTPer);
                Clear(Itemdesc);
                Clear(Itemdesc2);
                Itemdesc := SalesInvoiceLine.Description;
                Itemdesc2 := SalesInvoiceLine."Description 2";
                //Team::6130::091220::ForItemChargesOnly::Start
                //PANDU START SIL GST
                // if SalesInvoiceLine.Type in [SalesInvoiceLine.Type::"Charge (Item)"] then begin
                //     if SalesInvoiceLine."GST Jurisdiction Type" in [SalesInvoiceLine."GST Jurisdiction Type"::Intrastate] then begin
                //         if not (SalesInvoiceLine."Total GST Amount" = 0) then begin
                //             CGSTPer := Abs(SalesInvoiceLine."Total GST Amount" / 2);
                //             SGSTPer := Abs(SalesInvoiceLine."Total GST Amount" / 2);
                //             GSTPercen := SalesInvoiceLine."GST %";
                //         end;
                //     end;
                //     if SalesInvoiceLine."GST Jurisdiction Type" in [SalesInvoiceLine."GST Jurisdiction Type"::Interstate] then begin
                //         if not (SalesInvoiceLine."Total GST Amount" = 0) then begin
                //             IGSTPer := Abs(SalesInvoiceLine."Total GST Amount");
                //             GSTPercen := SalesInvoiceLine."GST %";
                //         end;
                //     end;
                // end;
                //PANDU END SIL GST
                //Team::6130::091220::ForItemChargesOnly::End

                DGLEntry.Reset;
                DGLEntry.SetRange("Document No.", SalesInvoiceLine."Document No.");
                DGLEntry.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
                DGLEntry.SetRange("No.", SalesInvoiceLine."No.");
                if DGLEntry.FindSet then
                    repeat
                        if DGLEntry."GST Component Code" = 'CGST' then begin
                            if Abs(DGLEntry."GST Base Amount") <= 0.04 then begin
                                CGSTPer := 0.01;
                            end else begin
                                CGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                        if DGLEntry."GST Component Code" = 'SGST' then begin
                            if Abs(DGLEntry."GST Base Amount") <= 0.04 then begin
                                SGSTPer := 0.01;
                            end else begin
                                SGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                        if DGLEntry."GST Component Code" = 'IGST' then begin
                            if Abs(DGLEntry."GST Base Amount") <= 0.04 then begin
                                IGSTPer := 0.01;
                            end else begin
                                IGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                    until DGLEntry.Next = 0;

                UnitofMeasure.Reset;
                UnitofMeasure.SetRange(Code, SalesInvoiceLine."Unit of Measure Code");
                if UnitofMeasure.FindFirst then
                    UOM := '"' + UnitofMeasure."UOM For E Invoicing" + '"'
                else
                    UOM := 'null';
                SrNo += 1;
                // 11889 :: Service Boolean based on Item Category
                if SalesInvoiceLine.Type in [SalesInvoiceLine.Type::"G/L Account", SalesInvoiceLine.Type::Resource] then
                    Service := 'Y'
                else
                    Service := 'N';

                //TotalAmtCust := 0; //3K- 27.02.2023

                // >>3K
                DetGSTLedgEntry1.SetRange("Document No.", SalesInvoiceLine."Document No.");
                DetGSTLedgEntry1.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
                DetGSTLedgEntry1.setrange("GST Component Code", 'IGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    IGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;


                DetGSTLedgEntry1.setrange("GST Component Code", 'CGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    CGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;

                DetGSTLedgEntry1.setrange("GST Component Code", 'SGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    SGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;
                // <<3K

                // HSNSAC:='998599';
                HSNSAC := '998212';//Change::AsPerLKSMailOnDtd020421
                //TotalAmtCust := (SalesInvoiceLine."Amount To Customer" / CurrencyFactor - SalesInvoiceLine."Bal. TDS/TCS Including SHECESS");
                //TotalAmtCust := SalesInvoiceLine."Line Amount" + IGSTAmount1 + CGSTAmount1 + SGSTAmount1; //3K
                TotalAmtCust := SalesInvoiceLine."Line Amount" + IGSTAmount1 + CGSTAmount1 + SGSTAmount1; //3K                
                //  IF ((SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"7") OR (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::"6")) THEN
                //   TotalAmtCust := (SalesInvoiceLine."Amount To Customer"/CurrencyFactor-SalesInvoiceLine."Bal. TDS/TCS Including SHECESS") + CGSTPer+SGSTPer+IGSTPer
                //  ELSE
                //  TotalAmtCust := (SalesInvoiceLine."Amount To Customer"/CurrencyFactor-SalesInvoiceLine."Bal. TDS/TCS Including SHECESS");
                ValueEntry.Reset;
                ValueEntry.SetRange("Document Type", ValueEntry."Document Type"::"Sales Invoice");
                ValueEntry.SetRange("Document No.", SalesInvoiceLine."Document No.");
                ValueEntry.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
                if ValueEntry.FindFirst then begin
                    ItemLedgerEntry.Get(ValueEntry."Item Ledger Entry No.");
                end;
                if ItemDetails = '' then begin
                    ItemDetails := '{' +
                      '"SiNo": "' + Format(SrNo) + '",' +
                      '"ProductDesc": "' + DelString(Itemdesc) + DelString(Itemdesc2) + '",' +
                      '"IsService": "' + Service + '",' +
                      //      '"HsnCode": "'+SalesInvoiceLine."HSN/SAC Code"+'",'+
                      '"HsnCode": "' + HSNSAC + '",' +
                      '"BarCode": null,' +
                      '"Quantity": ' + ReturnStr(Round(SalesInvoiceLine.Quantity, 0.01, '=')) + ',' +
                      '"FreeQuantity": 0,' +
                      '"Unit": ' + UOM + ',' +
                      '"UnitPrice": ' + ReturnStr(Round(SalesInvoiceLine."Unit Price" / CurrencyFactor, 0.01, '=')) + ',' +
                      //      '"TotAmount": '+ReturnStr(ROUND(SalesInvoiceLine."Line Amount"/CurrencyFactor,0.01,'='))+','+
                      '"TotAmount": ' + ReturnStr(Round((SalesInvoiceLine.Quantity * SalesInvoiceLine."Unit Price") / CurrencyFactor, 0.01, '=')) + ',' +
                      '"Discount": ' + ReturnStr(Round(SalesInvoiceLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      //'"PreTaxableVal": ' + ReturnStr(Round(SalesInvoiceLine."GST Base Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"PreTaxableVal": ' + ReturnStr(Round(GSTBaseAmount1, 0.01, '=')) + ',' +
                      //'"OtherCharges": ' + ReturnStr(Round(SalesInvoiceLine."Charges To Customer" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"OtherCharges": ' + ReturnStr(0) + ',' +
                      //'"OtherCharges": '+ReturnStr(ROUND(SalesInvoiceLine."Charges To Customer"/CurrencyFactor+SalesInvoiceLine."Bal. TDS/TCS Including SHECESS",0.01,'='))+','+
                      //      '"AssAmount": '+ReturnStr(ROUND(SalesInvoiceLine."GST Base Amount"/CurrencyFactor,0.01,'='))+','+
                      '"AssAmount": ' + ReturnStr(Round((SalesInvoiceLine.Quantity * SalesInvoiceLine."Unit Price") / CurrencyFactor, 0.01, '=') - Round(SalesInvoiceLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"GstRate": ' + ReturnStr(Round(GSTPercen, 0.01, '=')) + ',' +
                      '"SgstAmt": ' + ReturnStr(Round(SGSTPer, 0.01, '=')) + ',' +
                      '"CgstAmt": ' + ReturnStr(Round(CGSTPer, 0.01, '=')) + ',' +
                      '"IgstAmt": ' + ReturnStr(Round(IGSTPer, 0.01, '=')) + ',' +
                      '"CesRate": 0,' +
                      '"CessAmt": 0,' +
                      '"CesNonAdvalAmt": 0,' +
                      '"StateCesRate": 0,' +
                      '"StateCesAmt": 0,' +
                      '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
                      '"OrderLineRef": null,' +
                      '"OriginCountry": null,' +
                      '"ProdSerialNo": null,' +
                      '"TpApiAttribDtls": null' +
                    '}'
                end else begin
                    ItemDetails := ',{' +
                      '"SiNo": "' + Format(SrNo) + '",' +
                      '"ProductDesc": "' + DelString(Itemdesc) + DelString(Itemdesc2) + '",' +
                      '"IsService": "' + Service + '",' +
                      //      '"HsnCode": "'+SalesInvoiceLine."HSN/SAC Code"+'",'+
                      '"HsnCode": "' + HSNSAC + '",' +
                      '"BarCode": null,' +
                      '"Quantity": ' + ReturnStr(Round(SalesInvoiceLine.Quantity, 0.01, '=')) + ',' +
                      '"FreeQuantity": 0,' +
                      '"Unit": ' + UOM + ',' +
                      '"UnitPrice": ' + ReturnStr(Round(SalesInvoiceLine."Unit Price" / CurrencyFactor, 0.01, '=')) + ',' +
                      //      '"TotAmount": '+ReturnStr(ROUND(SalesInvoiceLine."Line Amount"/CurrencyFactor,0.01,'='))+','+
                      '"TotAmount": ' + ReturnStr(Round((SalesInvoiceLine.Quantity * SalesInvoiceLine."Unit Price") / CurrencyFactor, 0.01, '=')) + ',' +
                      '"Discount": ' + ReturnStr(Round(SalesInvoiceLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      //'"PreTaxableVal": ' + ReturnStr(Round(SalesInvoiceLine."GST Base Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"PreTaxableVal": ' + ReturnStr(Round(GSTBaseAmount1, 0.01, '=')) + ',' +
                      //TBD '"OtherCharges": ' + ReturnStr(Round(SalesInvoiceLine."Charges To Customer" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"OtherCharges": ' + ReturnStr(0) + ',' +
                      //'"OtherCharges": '+ReturnStr(ROUND(SalesInvoiceLine."Charges To Customer"/CurrencyFactor+SalesInvoiceLine."Bal. TDS/TCS Including SHECESS",0.01,'='))+','+
                      //      '"AssAmount": '+ReturnStr(ROUND(SalesInvoiceLine."GST Base Amount"/CurrencyFactor,0.01,'='))+','+
                      '"AssAmount": ' + ReturnStr(Round((SalesInvoiceLine.Quantity * SalesInvoiceLine."Unit Price") / CurrencyFactor, 0.01, '=') - Round(SalesInvoiceLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"GstRate": ' + ReturnStr(Round(GSTPercen, 0.01, '=')) + ',' +
                      '"SgstAmt": ' + ReturnStr(Round(SGSTPer, 0.01, '=')) + ',' +
                      '"CgstAmt": ' + ReturnStr(Round(CGSTPer, 0.01, '=')) + ',' +
                      '"IgstAmt": ' + ReturnStr(Round(IGSTPer, 0.01, '=')) + ',' +
                      '"CesRate": 0,' +
                      '"CessAmt": 0,' +
                      '"CesNonAdvalAmt": 0,' +
                      '"StateCesRate": 0,' +
                      '"StateCesAmt": 0,' +
                      '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
                      '"OrderLineRef": null,' +
                      '"OriginCountry": null,' +
                      '"ProdSerialNo": null,' +
                      '"TpApiAttribDtls": null' +
                    '}';
                end;
                //Req.AddText(ItemDetails, TtlLength);
                IRNBody += ItemDetails;
                TempLength := StrLen(ItemDetails);
                TtlLength += TempLength + 1;
            until SalesInvoiceLine.Next = 0;

        ItemDetails := ']' + '}';
        IRNBody += ItemDetails;
        //Req.AddText(ItemDetails, TtlLength);
        TempLength := StrLen(ItemDetails);
        TtlLength += TempLength + 1;
        exit(IRNBody);
        //MESSAGE(IRNBody);
    end;

    procedure CreditNoteIRNNumberNew(VAR SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    var
        Request: text;
        GSTRegistrationNos: Record "GST Registration Nos.";
        Location: Record "Location";
        MessageID: Integer;
        JToken: JsonToken;
        JObject: JsonObject;
        StringToRead: Text;
        SalesCrMemoHdrExtend: Record "Posted Sales Extended";
        AckNo: Code[20];
        AckDt: DateTime;
        SignedQRText: Text;
        ResultToken: JsonToken;
    Begin
        Location.get(SalesCrMemoHeader."Location Code");
        GSTRegistrationNos.GET(Location."GST Registration No.");
        InitPostRequest();
        //URL_API := 'https://einvoicetpapi.gstrobo.com/V1/Authenticate';//For Produdction--Read
        PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/einvoice';//For UAT--Read
        //   PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/EInvoice';//For UAT--Read
        //PANDU LIVE PostUrl := 'https://einvoicetpapi.gstrobo.com/V1/EInvoice';//For Produdction--Read

        Request := CreateCrediMemoIRNRequest(SalesCrMemoHeader); //Add Body

        Content.GetHeaders(Header);
        Content.WriteFrom(Request);
        Header.Clear();

        Header.Add('client_id', 'LKS258qualpRVCtpljh854QXgvKL');//For UAT--Read
        Header.Add('client_secret', 'LKS47TkipovzaklPRstupzkRO75Tj');//For UAT--Read

        Header.Add('IPAddress', '182.73.154.130');//For UAT--Read
        //Header.Add('client_id', 'LAKSHMIKS58qwerABVURT824JKLOP');//For LIVE
        //Header.Add('client_secret', 'LKS587QWERbv259jkzapoqtyLPRS');//For LIVE
        //Header.Add('IPAddress', '182.73.154.130');//For LIVE
        Header.Add('user_name', GSTRegistrationNos."User Name");
        Header.Add('Gstin', Location."GST Registration No.");
        Header.Add('Content-Type', 'application/json');
        //HttpWebRequestMgt.SetContentType('application/json');
        //HttpWebRequestMgt.SetReturnType('application/json');

        HttpRequest.GetHeaders(Header);
        HttpRequest.Content(Content);
        Client.Post(PostUrl, Content, HttpResponse);

        // Check Response status
        if HttpResponse.HttpStatusCode() in [200, 201, 207] then begin
            // sucess response
            HttpResponse.Content().ReadAs(Response);
            JObject.ReadFrom(Response);
            JObject.Get('MessageId', JToken);
            MessageID := JToken.AsValue().AsInteger();
            if MessageID = 0 then begin
                JObject.Get('Message', JToken);
                Message(JToken.AsValue().AsText());
            end;
            if MessageID = 1 then begin
                SalesCrMemoHdrExtend.RESET;
                SalesCrMemoHdrExtend.SETRANGE("No.", SalesCrMemoHeader."No.");
                IF SalesCrMemoHdrExtend.FINDFIRST THEN;
                //JObject := JObject.GetValue('Data'); 
                Jobject.get('Data', JToken);
                Jtoken.SelectToken('Irn', ResultToken);
                StringToRead := ResultToken.AsValue().AsText();
                SalesCrMemoHdrExtend."IRN No." := StringToRead;
                Message('IRN %1 generated successfully.', StringToRead);

                //JObject.Get('Data.AckNo', JToken);
                Jtoken.SelectToken('AckNo', ResultToken);
                AckNo := ResultToken.AsValue().AsText();
                SalesCrMemoHdrExtend."Ack No." := AckNo;
                //JObject.Get('Data.AckDt', JToken);
                Jtoken.SelectToken('AckDt', ResultToken);
                AckDt := ResultToken.AsValue().AsDateTime();
                SalesCrMemoHdrExtend."Ack Date" := AckDt;
                //JObject.Get('Data.SignedQRCode', JToken);
                Jtoken.SelectToken('SignedQRCode', ResultToken);
                SignedQRText := ResultToken.AsValue().AsText();

                SalesCrMemoHdrExtend.Modify;
                QRCodeManagement.CreateQRCodeforSalesCrMemoHeader(SalesCrMemoHeader, SignedQRText);
                SalesCrMemoHdrExtend.CalcFields("QR Code");
                //MESSAGE('QR Code : %1',SalesInvoiceHdrExtend."QR Code");
            end;
        end else begin
            // Failed Response
            MESSAGE(GETLASTERRORTEXT);
        end;

        // TempBlob1.INIT;
        // TempBlob1.Blob.CREATEINSTREAM(Instr);
        // TempBlob1.INSERT;
        // TempBlob1.Blob.CREATEOUTSTREAM(Outstr);
        // Req.WRITE(Outstr);
        // MESSAGE('%1', Req);
        // TempBlob1.CALCFIELDS(Blob);
        // HttpWebRequestMgt.AddBodyBlob(TempBlob1);

        // TempBlob.INIT;
        // TempBlob.Blob.CREATEINSTREAM(Instr);
        //PANDU Response Read
        /*
        IF HttpWebRequestMgt.GetResponse(Instr, HttpStatusCode, ResponseHeaders) THEN BEGIN
            ApiResult := TempBlob.ReadAsText('', TEXTENCODING::UTF8);
            MESSAGE(ApiResult);
            JObject := JObject.Parse(ApiResult);

            MessageID := ConvertString.ToInt32(JObject.GetValue('MessageId'));
            IF MessageID = 0 THEN BEGIN
                txtResponse := ConvertString.ToString(JObject.GetValue('Message'));
                MESSAGE(txtResponse);
            END;

            IF MessageID = 1 THEN BEGIN
                JObject := JObject.GetValue('Data');
                StringToRead := ConvertString.ToString(JObject.GetValue('Irn'));
                SalesCrMemoHdrExtend."IRN No." := StringToRead;
                MESSAGE('IRN %1 generated successfully.', StringToRead);
                AckNo := ConvertString.ToString(JObject.GetValue('AckNo'));
                SalesCrMemoHdrExtend."Ack No." := AckNo;

                AckDt := ConvertString.ToDateTime(JObject.GetValue('AckDt'));
                SalesCrMemoHdrExtend."Ack Date" := AckDt;
                SignedQRText := ConvertString.ToString(JObject.GetValue('SignedQRCode'));
                SalesCrMemoHdrExtend.MODIFY;
                QRCodeManagement.CreateQRCodeforSalesCrMemoHeader(SalesCrMemoHeader, SignedQRText);
            END;
        END ELSE
            MESSAGE(APIError);
        */
    End;

    local procedure CreateCrediMemoIRNRequest(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"): Text
    var
        txtResponse: Text;
        StringToRead: Text;
        CategoryCode: Text[5];
        ReverseCharge: Text[4];
        CompanyInformation: Record "Company Information";
        RecState: Record State;
        RecCustomer: Record Customer;
        BuyerGSTNo: Code[20];
        BuyerState: Record State;
        Location: Record Location;
        LocationState: Record State;
        ShiptoAddress: Record "Ship-to Address";
        ShipState: Record State;
        SalesInvoiceLine: Record "Sales Invoice Line";
        DGLEntry: Record "Detailed GST Ledger Entry";
        CGSTPer: Decimal;
        SGSTPer: Decimal;
        IGSTPer: Decimal;
        TotItemValue: Decimal;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SIL: Record "Sales Invoice Line";
        DetailedGSTEntry: Record "Detailed GST Ledger Entry";
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        IRNBody: Text;
        CompPhoneNo: Text[10];
        LocPhone: Text[10];
        CustPhone: Text[10];
        ShipPhone: Text[10];
        ItemUnitofMeasure: Record "Item Unit of Measure";
        UnitofMeasure: Record "Unit of Measure";
        UOM: Text[5];
        CompEmail: Text[50];
        LocEmail: Text[50];
        CustEmail: Text[50];
        ShipEmail: Text[50];
        AckNo: Code[20];
        AckDt: DateTime;
        TransType: Text[6];
        ExportCategory: Text[5];
        GSTPayment: Text[4];
        TotAmtinForCurr: Text;
        Country: Record "Country/Region";
        CountryCode: Text[4];
        CurrCode: Text[5];
        ExportDetails: Text;
        MessageID: Integer;
        ExportState: Text[50];
        ShipExpState: Code[5];
        ExportPinCode: Code[6];
        ShipExpPinCode: Code[6];
        ShipGSTNo: Text[20];
        ShippingDetails: Text;
        POS: Code[2];
        POSState: Record State;
        ShippingAgent: Record "Shipping Agent";
        ModeOfTransport: Integer;
        ShipmentMethod: Record "Transport Method";
        SILine: Record "Sales Invoice Line";
        SrNo: Integer;
        Service: Text[1];
        TransporterGSTIN: Text[15];
        TransporterName: Text[100];
        TransDocNo: Text[15];
        TransDocDate: Text;
        VehicleNo: Text[20];
        VehicleType: Text[4];
        QRCode: BigText;
        SignedQRText: Text;
        BillAddress2: Text;
        SalesCrMemoHdrExtend: Record "Posted Sales Extended";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        SCMLine: Record "Sales Cr.Memo Line";
        SCML: Record "Sales Cr.Memo Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        GSTPercen: Decimal;
        CompInfoName: Text;
        CompInfoName2: Text;
        CompInfoAdd: Text;
        CompInfoAdd2: Text;
        BillToName: Text;
        BillToName2: Text;
        BillToAdd: Text;
        BillToAdd2: Text;
        LocationName: Text;
        LocationName2: Text;
        LocationAdd: Text;
        LocationAdd2: Text;
        ShipToName: Text;
        ShipToName2: Text;
        ShipToAdd: Text;
        ShipToAdd2: Text;
        Itemdesc: Text;
        Itemdesc2: Text;
        GSTRegistrationNos: Record "GST Registration Nos.";
        CurrencyFactor: Decimal;
        GSTBaseAmtL: Decimal;
        HSNSAC: Code[10];
        DetGSTLedgEntry1: Record "Detailed GST Ledger Entry";
        GSTBaseAmount1: Decimal;
        IGSTAmount1: Decimal;
        CGSTAmount1: Decimal;
        SGSTAmount1: Decimal;
        SCL2: Record "Sales Cr.Memo Line";
    begin
        if SalesCrMemoHeader."Currency Factor" <> 0 then
            CurrencyFactor := SalesCrMemoHeader."Currency Factor"
        else
            CurrencyFactor := 1;
        // SalesCrMemoHdrExtend.GET(SalesCrMemoHeader."No.");
        SalesCrMemoHdrExtend.Reset;
        SalesCrMemoHdrExtend.SetRange("No.", SalesCrMemoHeader."No.");
        if SalesCrMemoHdrExtend.FindFirst then;

        if SalesCrMemoHdrExtend."IRN No." <> '' then
            Error('IRN is already generated');

        Clear(ItemDetails);
        Clear(HttpWebRequestMgt);
        Clear(Req);
        ShiptoAddress.Reset;
        if ShiptoAddress.Get(SalesCrMemoHeader."Sell-to Customer No.", SalesCrMemoHeader."Ship-to Code") then;
        // if not TempBlob1.IsEmpty then
        //     TempBlob1.Delete;
        // if not TempBlob.IsEmpty then
        //     TempBlob.Delete;

        TtlLength := 1;
        CompanyInformation.Get;

        DetailedGSTLedgerEntry.Reset;
        DetailedGSTLedgerEntry.SetRange("Document No.", SalesCrMemoHeader."No.");
        if DetailedGSTLedgerEntry.FindFirst then;

        Location.Reset;
        if Location.Get(SalesCrMemoHeader."Location Code") then;
        LocationState.Reset;
        if LocationState.Get(Location."State Code") then;

        RecState.Reset;
        if RecState.Get(Location."State Code") then;

        POSState.Reset;
        // IF POSState.GET(DetailedGSTLedgerEntry."Buyer/Seller State Code") THEN
        if POSState.Get(ShiptoAddress.State) then
            POS := POSState."State Code (GST Reg. No.)"
        else
            POS := '96';

        RecCustomer.Reset;
        if RecCustomer.Get(SalesCrMemoHeader."Sell-to Customer No.") then;
        BuyerState.Reset;
        // IF BuyerState.GET(SalesCrMemoHeader."GST Bill-to State Code") THEN;
        if BuyerState.Get(ShiptoAddress.State) then;

        // BuyerGSTNo := SalesCrMemoHeader."Customer GST Reg. No.";//2212
        // BuyerGSTNo := RecCustomer."GST Registration No.";
        BuyerGSTNo := ShiptoAddress."GST Reg No.";
        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::Unregistered THEN
        //  BuyerGSTNo:='URP';


        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::Registered THEN
        //  CategoryCode:='B2B';
        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::Export THEN
        //  CategoryCode:='Exp';

        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::Export THEN
        //  ExportCategory:='"DIR"'
        // ELSE
        //  ExportCategory:='null';
        //
        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::"Deemed Export" THEN
        //  ExportCategory:='"DEM"'
        // ELSE
        //  ExportCategory:='null';
        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::"7" THEN
        //  ExportCategory:='"SEZ"'
        // ELSE
        //  ExportCategory:='null';
        // IF SalesCrMemoHeader."GST Customer Type" = SalesCrMemoHeader."GST Customer Type"::"6" THEN
        //  ExportCategory:='"SED"'
        // ELSE
        //  ExportCategory:='null';

        // ShiptoAddress.RESET;
        // IF ShiptoAddress.GET(SalesCrMemoHeader."Sell-to Customer No.",SalesCrMemoHeader."Ship-to Code") THEN;
        ShipState.Reset;
        // IF ShipState.GET(SalesCrMemoHeader."GST Ship-to State Code") THEN;
        if ShipState.Get(ShiptoAddress.State) then;
        if ShiptoAddress."GST Registration No." <> '' then
            ShipGSTNo := '"' + ShiptoAddress."GST Registration No." + '"'
        else
            ShipGSTNo := 'null';

        if ShiptoAddress."Transaction Type" in [ShiptoAddress."Transaction Type"::EXPWOP, ShiptoAddress."Transaction Type"::EXPWOP] then
            ReverseCharge := 'N'
        else
            ReverseCharge := 'Y';

        // IF DetailedGSTLedgerEntry."Reverse Charge" THEN
        //  ReverseCharge:='Y'
        // ELSE
        //  ReverseCharge:='N';

        if SalesCrMemoHeader."GST Without Payment of Duty" then
            GSTPayment := '"Y"'
        else
            GSTPayment := '"N"';

        // IF CompanyInformation."Phone No."<>'' THEN
        //  BEGIN
        //  IF STRLEN(CompanyInformation."Phone No.")=10 THEN
        //    CompPhoneNo:=CompanyInformation."Phone No."
        //  ELSE
        //    CompPhoneNo:='null';
        //  END
        // ELSE
        //  CompPhoneNo:='null';
        CompPhoneNo := 'null';
        // IF Location."Phone No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(Location."Phone No.")=10 THEN
        //      LocPhone:=Location."Phone No."
        //    ELSE
        //      LocPhone:='null';
        //  END
        // ELSE
        //  LocPhone:='null';
        LocPhone := 'null';
        // IF SalesCrMemoHeader."Bill-to Contact No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(SalesCrMemoHeader."Bill-to Contact No.")=10 THEN
        //      CustPhone := SalesCrMemoHeader."Bill-to Contact No."
        //    ELSE
        //      CustPhone:='null';
        //  END
        // ELSE
        //  CustPhone:='null';
        CustPhone := 'null';
        // IF ShiptoAddress."Phone No."<>'' THEN
        //  BEGIN
        //    IF STRLEN(ShiptoAddress."Phone No.")=10 THEN
        //      ShipPhone:=ShiptoAddress."Phone No."
        //    ELSE
        //      ShipPhone:='null';
        //  END
        // ELSE
        //  ShipPhone:='null';
        ShipPhone := 'null';
        // IF CompanyInformation."E-Mail"<>'' THEN
        //  CompEmail:='"'+CompanyInformation."E-Mail"+'"'
        // ELSE
        //  CompEmail:='null';
        CompEmail := 'null';
        // IF Location."E-Mail"<>'' THEN
        //  LocEmail:='"'+Location."E-Mail"+'"'
        // ELSE
        //  LocEmail:='null';
        LocEmail := 'null';
        // IF RecCustomer."E-Mail"<>'' THEN
        //  CustEmail:='"'+RecCustomer."E-Mail"+'"'
        // ELSE
        //  CustEmail:='null';
        CustEmail := 'null';
        // IF ShiptoAddress."E-Mail"<>'' THEN
        //  ShipEmail:='"'+ShiptoAddress."E-Mail"+'"'
        // ELSE
        //  ShipEmail:='null';
        ShipEmail := 'null';
        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then begin
            CurrCode := '"' + SalesCrMemoHeader."Currency Code" + '"';
            //PANDU TBD SalesCrMemoHeader.CalcFields("Amount to Customer");
            //PANDU TBD TotAmtinForCurr := ReturnStr(SalesCrMemoHeader."Amount to Customer");
            BuyerGSTNo := 'URP';
            ShipGSTNo := 'null';
            Country.Reset;
            if Country.Get(ShiptoAddress."Country/Region Code") then
                CountryCode := '"' + Country."Country Code for E Invoicing" + '"';
        end
        else begin
            TotAmtinForCurr := Format(0);
            GSTPayment := 'null';
            CountryCode := 'null';
            CurrCode := 'null';
        end;

        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then
            ExportDetails := '{"ShippingBillNo": null,' +
            '"ShippingBillDate": null,' +
            '"PortCode": null,' +
            '"ForeignCurrency": ' + CurrCode + ',' +
            '"CountryCode": ' + CountryCode + ',' +
            '"RefundClaim": null,' +
            '"ExportDuty": "0"},'
        else
            ExportDetails := 'null,';

        //IF (SalesInvoiceHeader."GST Customer Type"=SalesInvoiceHeader."GST Customer Type"::Export) AND (SalesInvoiceHeader."GST Bill-to State Code"='') THEN
        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP) then //7739
          begin
            //ExportState:='null';
            ExportState := '96';//7739
            ExportPinCode := '999999'
        end else begin
            ExportState := '"' + BuyerState."State Code for E-Invoicing" + '"';
            //  ExportPinCode:=SalesCrMemoHeader."Bill-to Post Code";
            ExportPinCode := ShiptoAddress."Post Office";
        end;

        if (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWOP) or (ShiptoAddress."Transaction Type" = ShiptoAddress."Transaction Type"::EXPWP)
          and (ShiptoAddress.State = '') then begin
            ShipExpState := '96';
            ShipExpPinCode := '999999'
        end else begin
            ShipExpState := ShipState."State Code for E-Invoicing";
            ShipExpPinCode := SalesCrMemoHeader."Ship-to Post Code";
        end;
        TransType := Format(ShiptoAddress."Transaction Type");
        // IF SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::Registered THEN
        //  TransType:='B2B';
        // IF ((SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"7")OR(SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"6"))
        //  AND (NOT SalesCrMemoHeader."GST Without Payment of Duty") THEN
        //  TransType:='SEZWP';
        // IF ((SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"7")OR(SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"6"))
        // AND (SalesCrMemoHeader."GST Without Payment of Duty") THEN
        //  TransType:='SEZWOP';
        // IF (SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::Export) AND (NOT SalesCrMemoHeader."GST Without Payment of Duty") THEN
        //  TransType:='EXPWP';
        // IF (SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::Export) AND (SalesCrMemoHeader."GST Without Payment of Duty") THEN
        //  TransType:='EXPWOP';
        // IF SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"Deemed Export" THEN
        //  TransType:='DEXP';
        //Calculate Transaction Type

        SCML.Reset;
        SCML.SetRange("Document No.", SalesCrMemoHeader."No.");
        SCML.SetFilter("No.", '<>%1', '54-950900');//Please change the rounding GL account no for respective Client--Read//Done
        //SCML.CalcSums("GST Base Amount", "Amount To Customer", "Line Discount Amount", "Charges To Customer", "Bal. TDS/TCS Including SHECESS");
        SCML.CalcSums("Line Discount Amount");

        SCMLine.Reset;
        SCMLine.SetRange("Document No.", SalesCrMemoHeader."No.");
        SCMLine.SetRange(Type, SCMLine.Type::"G/L Account");
        SCMLine.SetRange("No.", '54-950900');//Please change the rounding GL account no for respective Client--Read//Done
        if SCMLine.FindFirst then;

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesCrMemoHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'CGST');
        DetailedGSTEntry.CalcSums("GST Amount", "GST Base Amount");
        CGSTAmt := Abs(DetailedGSTEntry."GST Amount");
        GSTBaseAmtL := Abs(DetailedGSTEntry."GST Base Amount");

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesCrMemoHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'SGST');
        DetailedGSTEntry.CalcSums("GST Amount");
        SGSTAmt := Abs(DetailedGSTEntry."GST Amount");

        DetailedGSTEntry.Reset;
        DetailedGSTEntry.SetRange("Document No.", SalesCrMemoHeader."No.");
        DetailedGSTEntry.SetRange("GST Component Code", 'IGST');
        DetailedGSTEntry.CalcSums("GST Amount", "GST Base Amount");
        IGSTAmt := Abs(DetailedGSTEntry."GST Amount");
        if GSTBaseAmtL = 0 then
            GSTBaseAmtL := Abs(DetailedGSTEntry."GST Base Amount");


        TotalAmtCust := 0;
        //3K TotalAmtCust := SCML."Amount To Customer";
        TotalAmtCust := SCML."Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt; //3K
        SCL2.Reset;
        SCL2.SetRange("Document No.", SalesCrMemoHeader."No.");
        SCL2.SetFilter("No.", '<>%1', '54-950900');//Please change the rounding GL account no for respective Client//Read//Done
        if SCL2.findset then
            repeat
                TotalAmtCustNew += SCL2."Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt; //3K
            until SCl2.next = 0;
        // IF ((SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"7") OR (SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"6")) THEN
        //  TotalAmtCust := SCML."Amount To Customer" + CGSTAmt+SGSTAmt+IGSTAmt
        // ELSE
        //  TotalAmtCust := SCML."Amount To Customer";

        ShippingAgent.Reset;
        // IF ShippingAgent.GET(SalesCrMemoHeader."Shipping Agent Code") THEN;//2212
        //2212
        // IF ShippingAgent."GST Registration No."<>'' THEN
        //  TransporterGSTIN:='"'+ShippingAgent."GST Registration No."+'"'
        // ELSE
        //  TransporterGSTIN:='null';
        TransporterGSTIN := 'null';
        if ShippingAgent.Name <> '' then
            TransporterName := '"' + ShippingAgent.Name + '"'
        else
            TransporterName := 'null';

        TransDocNo := 'null';

        TransDocDate := 'null';
        //2212
        // IF SalesCrMemoHeader."Vehicle No."<>'' THEN
        //  VehicleNo:='"'+SalesCrMemoHeader."Vehicle No."+'"'
        // ELSE
        //  VehicleNo:='null';
        VehicleNo := 'null';
        //2212
        // IF SalesCrMemoHeader."Vehicle Type"=SalesCrMemoHeader."Vehicle Type"::"0" THEN
        //  VehicleType:='null';
        // IF SalesCrMemoHeader."Vehicle Type"=SalesCrMemoHeader."Vehicle Type"::"2" THEN
        //  VehicleType:='"O"';
        // IF SalesCrMemoHeader."Vehicle Type"=SalesCrMemoHeader."Vehicle Type"::"1" THEN
        //  VehicleType:='"R"';
        //  VehicleType:='null';
        ShipmentMethod.Reset;
        if ShipmentMethod.Get(SalesCrMemoHeader."Transport Method") then;

        //2212
        // IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"0" THEN
        //  ModeOfTransport := 1
        // ELSE IF ShipmentMethod."Trans Mode" =ShipmentMethod."Trans Mode"::"1" THEN
        //  ModeOfTransport := 2
        // ELSE IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"2" THEN
        //  ModeOfTransport := 3
        // ELSE IF ShipmentMethod."Trans Mode" = ShipmentMethod."Trans Mode"::"3" THEN
        //  ModeOfTransport := 4;

        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("No.", SalesCrMemoHeader."Applies-to Doc. No.");
        if SalesInvoiceHeader.FindFirst then;


        //
        CompInfoName := CompanyInformation.Name;
        CompInfoName2 := CompanyInformation."Name 2";
        CompInfoAdd := CompanyInformation.Address;
        CompInfoAdd2 := CompanyInformation."Address 2";
        if CompInfoAdd2 = '' then
            CompInfoAdd2 := '   ';

        BillToName := SalesCrMemoHeader."Bill-to Name";
        BillToName2 := SalesCrMemoHeader."Bill-to Name 2";
        // BillToAdd := SalesCrMemoHeader."Bill-to Address";
        // BillToAdd2 := SalesCrMemoHeader."Bill-to Address 2";
        // BillToName := ShiptoAddress.Name;
        // BillToName2 := ShiptoAddress."Name 2";
        BillToAdd := ShiptoAddress.Address;
        BillToAdd2 := ShiptoAddress."Address 2";
        if BillToAdd2 = '' then
            BillToAdd2 := '   ';
        ShipToName := SalesCrMemoHeader."Ship-to Name";
        ShipToName2 := SalesCrMemoHeader."Ship-to Name 2";
        ShipToAdd := SalesCrMemoHeader."Ship-to Address";
        ShipToAdd2 := SalesCrMemoHeader."Ship-to Address 2";
        if ShipToAdd2 = '' then
            ShipToAdd2 := '   ';

        LocationName := Location.Name;
        LocationName2 := Location."Name 2";
        LocationAdd := Location.Address;
        LocationAdd2 := Location."Address 2";
        if LocationAdd2 = '' then
            LocationAdd2 := '   ';
        //
        // IF SalesCrMemoHeader."Ship-to Code"<>'' THEN
        // ShippingDetails:='{"GstinNo": '+ShipGSTNo+','+
        //    '"LegalName": "'+DelString(ShipToName)+DelString(ShipToName2)+'",'+
        //    '"TrdName": "'+DelString(ShipToName)+DelString(ShipToName2)+'",'+
        //    '"Address1": "'+DelString(ShipToAdd)+'",'+
        //    '"Address2": "'+DelString(ShipToAdd2)+'",'+
        //    '"Location": "'+SalesCrMemoHeader."Ship-to City"+'",'+
        //    '"Pincode": '+ShipExpPinCode+','+
        //    '"StateCode": "'+ShipExpState+'"},'
        //  ELSE
        //  ShippingDetails:='null,';
        ShippingDetails := 'null,';
        //
        //  PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-Dev/EInvoice';//For UAT--Read
        //  PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/EInvoice';//For UAT--Read
        //PostUrl := 'https://einvoicetpapi.gstrobo.com/V1/EInvoice';//For Produdction--Read
        PostUrl := 'http://182.76.79.236:35001/EinvoiceTPApi-QA/einvoice';
        //3K ServicePointManager.SecurityProtocol := SecurityProtocolType.Tls12;//For Produdction--Read
        IRNBody := '{"action": "INVOICE",' +
          '"Version": "1.1",' +
          '"Irn": "",' +
          '"TpApiTranDtls": {' +
            '"RevReverseCharge": "' + ReverseCharge + '",' +
            '"Typ": "' + TransType + '",' +
            '"TaxPayerType": "GST",' +
            '"EcomGstin": null,' +
            '"IgstOnIntra": null' +//7739
          '},' +
          '"TpApiDocDtls": {' +
            '"DocTyp": "CRN",' +
            '"DocNo": "' + SalesCrMemoHeader."No." + '",' +
            '"DocDate": "' + Format(SalesCrMemoHeader."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '",' +
            '"OrgInvNo": "' + SalesCrMemoHeader."Applies-to Doc. No." + '"' +//7739
          '},' +
          '"TpApiExpDtls":' + ExportDetails +
          '"TpApiSellerDtls": {' +
        //  '"GstinNo": "'+'29AAACB0652N000'+'",'+//Comment-when client go for the Produdction--Read
          '"GstinNo": "' + Location."GST Registration No." + '",' +//Open-when client go for the Produdction--Read
            '"LegalName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"TrdName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"Address1": "' + DelString(LocationAdd) + '",' +
            '"Address2": "' + DelString(LocationAdd2) + '",' +
            '"Location": "' + Location.City + '",' +
            '"Pincode": "' + Location."Post Code" + '",' +//Open-when client go for the Produdction--Read
            '"StateCode": "' + LocationState."State Code for E-Invoicing" + '",' +//Open-when client go for the Produdction--Read
        //    '"Pincode": "560063",'+//Comment-when client go for the Produdction--Read
        //    '"StateCode": "29",'+//Comment-when client go for the Produdction--Read
            '"MobileNo": ' + LocPhone + ',' +
            '"EmailId": ' + LocEmail +
          '},' +
          '"TpApiBuyerDtls": {' +
            '"GstinNo": "' + BuyerGSTNo + '",' +
            '"LegalName": "' + DelString(BillToName) + DelString(BillToName2) + '",' +
            '"TrdName": "' + DelString(BillToName) + DelString(BillToName2) + '",' +
            '"PlaceOfSupply": "' + POS + '",' +
            '"Address1": "' + DelString(BillToAdd) + '",' +
            '"Address2": "' + DelString(BillToAdd2) + '",' +
        //    '"Location": "'+SalesCrMemoHeader."Bill-to City"+'",'+
            '"Location": "' + ShiptoAddress.City + '",' +
            '"Pincode": ' + ExportPinCode + ',' +
            '"StateCode": ' + ExportState + ',' +
            '"MobileNo": ' + CustPhone + ',' +
            '"EmailId": ' + CustEmail +
          '},' +
          '"TpApiDispDtls": {' +
            '"CompName": "' + DelString(LocationName) + DelString(LocationName2) + '",' +
            '"Address1": "' + DelString(LocationAdd) + '",' +
            '"Address2": "' + DelString(LocationAdd2) + '",' +
            '"Location": "' + Location.City + '",' +
            '"Pincode": ' + Location."Post Code" + ',' +
            '"StateCode": "' + LocationState."State Code for E-Invoicing" + '"' +
          '},' +
          '"TpApiShipDtls":' + ShippingDetails +

          '"TpApiValDtls": {' +
            //    '"TotalTaxableVal": '+ReturnStr(ROUND(GSTBaseAmtL,0.01,'='))+','+
            //'"TotalTaxableVal": ' + ReturnStr(Round(TotalAmtCust / CurrencyFactor, 0.01, '=')) + ',' +//Change
            '"TotalTaxableVal": ' + ReturnStr(Round(TotalAmtCustNew / CurrencyFactor, 0.01, '=')) + ',' + '"TotalSgstVal": ' + ReturnStr(Round(SGSTAmt, 0.01, '=')) + ',' +
            '"TotalCgstVal": ' + ReturnStr(Round(CGSTAmt, 0.01, '=')) + ',' +
            '"TotalIgstVal": ' + ReturnStr(Round(IGSTAmt, 0.01, '=')) + ',' +
            '"TotalCesVal": 0,' +
            '"TotalStateCesVal": 0,' +
            //'"TotInvoiceVal": ' + ReturnStr(Round(TotalAmtCust / CurrencyFactor, 0.01, '=')) + ',' +//7739
            '"TotInvoiceVal": ' + ReturnStr(Round(TotalAmtCustNew / CurrencyFactor, 0.01, '=')) + ',' +//7739
                                                                                                       //'"TotInvoiceVal": '+ReturnStr(SIL."Amount To Customer"-(SGSTAmt+CGSTAmt+IGSTAmt))+','+
            '"RoundOfAmt": ' + ReturnStr(Round(SCMLine."Line Amount" / CurrencyFactor, 0.01, '=')) + ',' +
            //'"TotalInvValueFc": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
            '"TotalInvValueFc": ' + ReturnStr(Round(TotalAmtCustNew, 0.01, '=')) + ',' +
            '"Discount": ' + ReturnStr(Round(SCML."Line Discount Amount" / CurrencyFactor, 0.01, '=') * 0) + ',' +//7739//1112
                                                                                                                  //3k '"OthCharge": ' + ReturnStr(Round(SCML."Charges To Customer" / CurrencyFactor + SCML."Bal. TDS/TCS Including SHECESS", 0.01, '=')) +//7739
            '"OthCharge": ' + ReturnStr(0) +
          '},' +
          '"TpApiItemList": [';

        //Req.AddText(IRNBody, TtlLength);
        TempLength := StrLen(IRNBody);
        TtlLength += TempLength + 1;

        Clear(SrNo);
        Clear(Service);
        SalesCrMemoLine.Reset;
        SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
        SalesCrMemoLine.SetFilter("No.", '<>%1', '54-950900');//Please change the rounding GL account no for respective Client--Read//Done
        SalesCrMemoLine.SetFilter(Type, '<>%1', SalesCrMemoLine.Type::" ");
        SalesCrMemoLine.SetFilter(Quantity, '<>%1', 0);
        if SalesCrMemoLine.FindSet then
            repeat
                Clear(GSTPercen);
                Clear(CGSTPer);
                Clear(SGSTPer);
                Clear(IGSTPer);
                Clear(Itemdesc);
                Clear(Itemdesc2);
                Itemdesc := SalesCrMemoLine.Description;
                Itemdesc2 := SalesCrMemoLine."Description 2";

                //Team::6130::091220::ForItemChargesOnly::Start
                // >>3K GST
                // if SalesCrMemoLine.Type in [SalesCrMemoLine.Type::"Charge (Item)"] then begin
                //     if SalesCrMemoLine."GST Jurisdiction Type" in [SalesCrMemoLine."GST Jurisdiction Type"::Intrastate] then begin
                //         if not (SalesCrMemoLine."Total GST Amount" = 0) then begin
                //             CGSTPer := Abs(SalesCrMemoLine."Total GST Amount" / 2);
                //             SGSTPer := Abs(SalesCrMemoLine."Total GST Amount" / 2);
                //             GSTPercen := SalesCrMemoLine."GST %";
                //         end;
                //     end;
                //     if SalesCrMemoLine."GST Jurisdiction Type" in [SalesCrMemoLine."GST Jurisdiction Type"::Interstate] then begin
                //         if not (SalesCrMemoLine."Total GST Amount" = 0) then begin
                //             IGSTPer := Abs(SalesCrMemoLine."Total GST Amount");
                //             GSTPercen := SalesCrMemoLine."GST %";
                //         end;
                //     end;
                // end;
                // <<3K GST
                //Team::6130::091220::ForItemChargesOnly::End

                DGLEntry.Reset;
                DGLEntry.SetRange("Document No.", SalesCrMemoLine."Document No.");
                DGLEntry.SetRange("Document Line No.", SalesCrMemoLine."Line No.");
                DGLEntry.SetRange("No.", SalesCrMemoLine."No.");
                if DGLEntry.FindSet then
                    repeat
                        if DGLEntry."GST Component Code" = 'CGST' then begin
                            if DGLEntry."GST Base Amount" <= 0.04 then begin
                                CGSTPer := 0.01;
                            end else begin
                                CGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                        if DGLEntry."GST Component Code" = 'SGST' then begin
                            if DGLEntry."GST Base Amount" <= 0.04 then begin
                                SGSTPer := 0.01;
                            end else begin
                                SGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                        if DGLEntry."GST Component Code" = 'IGST' then begin
                            if DGLEntry."GST Base Amount" <= 0.04 then begin
                                IGSTPer := 0.01;
                            end else begin
                                IGSTPer := Abs(DGLEntry."GST Amount");
                                GSTPercen += DGLEntry."GST %";
                            end;
                        end;
                    until DGLEntry.Next = 0;
                UnitofMeasure.Reset;
                UnitofMeasure.SetRange(Code, SalesCrMemoLine."Unit of Measure Code");
                if UnitofMeasure.FindFirst then
                    UOM := '"' + UnitofMeasure."UOM For E Invoicing" + '"'
                else
                    UOM := 'null';
                //END;
                SrNo += 1;
                if SalesCrMemoLine.Type in [SalesCrMemoLine.Type::"G/L Account", SalesCrMemoLine.Type::Resource] then
                    Service := 'Y'
                else
                    Service := 'N';
                // HSNSAC:='998599';//Change
                HSNSAC := '998212';//Change::AsPerLKSMailOnDtd020421
                TotalAmtCust := 0;
                // >>3K
                DetGSTLedgEntry1.SetRange("Document No.", SalesInvoiceLine."Document No.");
                DetGSTLedgEntry1.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
                DetGSTLedgEntry1.setrange("GST Component Code", 'IGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    IGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;


                DetGSTLedgEntry1.setrange("GST Component Code", 'CGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    CGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;

                DetGSTLedgEntry1.setrange("GST Component Code", 'SGST');
                if DetGSTLedgEntry1.FindFirst then begin
                    GSTBaseAmount1 := DetGSTLedgEntry1."GST Base Amount";
                    SGSTAmount1 := DetGSTLedgEntry1."GST Amount";
                end;
                // <<3K
                //3K TotalAmtCust := SalesCrMemoLine."Amount To Customer" / CurrencyFactor;
                TotalAmtCust := SalesCrMemoLine."Line Amount" + IGSTAmount1 + CGSTAmount1 + SGSTAmount1; //3K
                // IF ((SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"7") OR (SalesCrMemoHeader."GST Customer Type"=SalesCrMemoHeader."GST Customer Type"::"6")) THEN
                //  TotalAmtCust := (SalesCrMemoLine."Amount To Customer"/CurrencyFactor) + CGSTPer + SGSTPer + IGSTPer
                // ELSE
                //  TotalAmtCust := SalesCrMemoLine."Amount To Customer"/CurrencyFactor;

                if ItemDetails = '' then begin
                    ItemDetails := '{' +
                      '"SiNo": "' + Format(SrNo) + '",' +
                      '"ProductDesc": "' + DelString(Itemdesc) + DelString(Itemdesc2) + '",' +
                      '"IsService": "' + Service + '",' +
                      //      '"HsnCode": "'+SalesCrMemoLine."HSN/SAC Code"+'",'+
                      '"HsnCode": "' + HSNSAC + '",' +
                      '"BarCode": null,' +
                      '"Quantity": ' + ReturnStr(Round(SalesCrMemoLine.Quantity, 0.01, '=')) + ',' +
                      '"FreeQuantity": 0,' +
                      '"Unit": ' + UOM + ',' +
                      '"UnitPrice": ' + ReturnStr(Round(SalesCrMemoLine."Unit Price" / CurrencyFactor, 0.01, '=')) + ',' +
                      //      '"TotAmount": '+ReturnStr(ROUND(SalesCrMemoLine."Line Amount"/CurrencyFactor,0.01,'='))+','+
                      '"TotAmount": ' + ReturnStr(Round((SalesCrMemoLine.Quantity * SalesCrMemoLine."Unit Price") / CurrencyFactor, 0.01, '=')) + ',' +
                      '"Discount": ' + ReturnStr(Round(SalesCrMemoLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      //3K
                      //'"PreTaxableVal": ' + ReturnStr(Round(SalesCrMemoLine."GST Base Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"PreTaxableVal": ' + ReturnStr(Round(GSTBaseAmount1, 0.01, '=')) + ',' +
                      //'"OtherCharges": ' + ReturnStr(Round(SalesCrMemoLine."Charges To Customer" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"OtherCharges": ' + ReturnStr(0) + ',' +
                      // <<3K
                      //      '"AssAmount": '+ReturnStr(ROUND(SalesCrMemoLine."GST Base Amount"/CurrencyFactor,0.01,'='))+','+
                      '"AssAmount": ' + ReturnStr(Round((SalesCrMemoLine.Quantity * SalesCrMemoLine."Unit Price") / CurrencyFactor, 0.01, '=') - Round(SalesCrMemoLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +//Change
                      '"GstRate": ' + ReturnStr(Round(GSTPercen, 0.01, '=')) + ',' +
                      '"SgstAmt": ' + ReturnStr(Round(SGSTPer, 0.01, '=')) + ',' +
                      '"CgstAmt": ' + ReturnStr(Round(CGSTPer, 0.01, '=')) + ',' +
                      '"IgstAmt": ' + ReturnStr(Round(IGSTPer, 0.01, '=')) + ',' +
                      '"CesRate": 0,' +
                      '"CessAmt": 0,' +
                      '"CesNonAdvalAmt": 0,' +
                      '"StateCesRate": 0,' +
                      '"StateCesAmt": 0,' +
                      //3k '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust - SalesCrMemoLine."Bal. TDS/TCS Including SHECESS", 0.01, '=')) + ',' +
                      '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
                      '"OrderLineRef": null,' +
                      '"OriginCountry": null,' +
                      '"ProdSerialNo": null,' +
                      '"TpApiAttribDtls": null' +
                    '}'
                end else begin
                    ItemDetails := ',{' +
                      '"SiNo": "' + Format(SrNo) + '",' +
                      '"ProductDesc": "' + DelString(Itemdesc) + DelString(Itemdesc2) + '",' +
                      '"IsService": "' + Service + '",' +
                      //      '"HsnCode": "'+SalesCrMemoLine."HSN/SAC Code"+'",'+
                      '"HsnCode": "' + HSNSAC + '",' +//Change
                      '"BarCode": null,' +
                      '"Quantity": ' + ReturnStr(Round(SalesCrMemoLine.Quantity, 0.01, '=')) + ',' +
                      '"FreeQuantity": 0,' +
                      '"Unit": ' + UOM + ',' +
                      '"UnitPrice": ' + ReturnStr(Round(SalesCrMemoLine."Unit Price" / CurrencyFactor, 0.01, '=')) + ',' +
                      //      '"TotAmount": '+ReturnStr(ROUND(SalesCrMemoLine."Line Amount"/CurrencyFactor,0.01,'='))+','+
                      '"TotAmount": ' + ReturnStr(Round((SalesCrMemoLine.Quantity * SalesCrMemoLine."Unit Price") / CurrencyFactor, 0.01, '=')) + ',' +
                      '"Discount": ' + ReturnStr(Round(SalesCrMemoLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      // >>3K
                      //'"PreTaxableVal": ' + ReturnStr(Round(SalesCrMemoLine."GST Base Amount" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"PreTaxableVal": ' + ReturnStr(Round(GSTBaseAmount1, 0.01, '=')) + ',' +
                      //'"OtherCharges": ' + ReturnStr(Round(SalesCrMemoLine."Charges To Customer" / CurrencyFactor, 0.01, '=')) + ',' +
                      '"OtherCharges": ' + ReturnStr(0) + ',' +
                      // <<3K
                      //      '"AssAmount": '+ReturnStr(ROUND(SalesCrMemoLine."GST Base Amount"/CurrencyFactor,0.01,'='))+','+
                      '"AssAmount": ' + ReturnStr(Round((SalesCrMemoLine.Quantity * SalesCrMemoLine."Unit Price") / CurrencyFactor, 0.01, '=') - Round(SalesCrMemoLine."Line Discount Amount" / CurrencyFactor, 0.01, '=')) + ',' +//Change
                      '"GstRate": ' + ReturnStr(Round(GSTPercen, 0.01, '=')) + ',' +
                      '"SgstAmt": ' + ReturnStr(Round(SGSTPer, 0.01, '=')) + ',' +
                      '"CgstAmt": ' + ReturnStr(Round(CGSTPer, 0.01, '=')) + ',' +
                      '"IgstAmt": ' + ReturnStr(Round(IGSTPer, 0.01, '=')) + ',' +
                      '"CesRate": 0,' +
                      '"CessAmt": 0,' +
                      '"CesNonAdvalAmt": 0,' +
                      '"StateCesRate": 0,' +
                      '"StateCesAmt": 0,' +
                      //3K '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust - SalesCrMemoLine."Bal. TDS/TCS Including SHECESS", 0.01, '=')) + ',' +
                      '"TotItemVal": ' + ReturnStr(Round(TotalAmtCust, 0.01, '=')) + ',' +
                      '"OrderLineRef": null,' +
                      '"OriginCountry": null,' +
                      '"ProdSerialNo": null,' +
                      '"TpApiAttribDtls": null' +
                    '}';
                end;
                //Req.AddText(ItemDetails, TtlLength);
                IRNBody += ItemDetails;
                TempLength := StrLen(ItemDetails);
                TtlLength += TempLength + 1;
            until SalesCrMemoLine.Next = 0;

        ItemDetails := ']' + '}';
        IRNBody += ItemDetails;
        //Req.AddText(ItemDetails, TtlLength);
        TempLength := StrLen(ItemDetails);
        TtlLength += TempLength + 1;
        exit(IRNBody);
        //MESSAGE(IRNBody);       

    end;

    // procedure GetEInvoiceResponse(var RecRef: RecordRef; JsonString: text)
    // var
    //     JSONManagement: Codeunit "JSON Management";
    //     QRGenerator: Codeunit "QR Generator";
    //     TempBlob: Codeunit "Temp Blob";
    //     FieldRef: FieldRef;
    //     TempIRNTxt: Text;
    //     TempDateTime: DateTime;
    //     AcknowledgementDateTimeText: Text;
    //     AcknowledgementDate: Date;
    //     AcknowledgementTime: Time;
    // begin

    //     if (JsonString = '') or (JsonString = '[]') then
    //         exit;

    //     JSONManagement.InitializeObject(JsonString);
    //     if JSONManagement.GetValue(IRNTxt) <> '' then begin
    //         FieldRef := RecRef.Field(SalesInvoiceHeader.FieldNo("IRN Hash"));
    //         FieldRef.Value := JSONManagement.GetValue(IRNTxt);
    //         FieldRef := RecRef.Field(SalesInvoiceHeader.FieldNo("Acknowledgement No."));
    //         FieldRef.Value := JSONManagement.GetValue(AcknowledgementNoTxt);

    //         AcknowledgementDateTimeText := JSONManagement.GetValue(AcknowledgementDateTxt);
    //         Evaluate(AcknowledgementDate, CopyStr(AcknowledgementDateTimeText, 1, 10));
    //         Evaluate(AcknowledgementTime, CopyStr(AcknowledgementDateTimeText, 11, 8));
    //         TempDateTime := CreateDateTime(AcknowledgementDate, AcknowledgementTime);
    //         FieldRef := RecRef.Field(SalesInvoiceHeader.FieldNo("Acknowledgement Date"));

    //         FieldRef.Value := TempDateTime;
    //         FieldRef := RecRef.Field(SalesInvoiceHeader.FieldNo(IsJSONImported));
    //         FieldRef.Value := true;
    //         QRGenerator.GenerateQRCodeImage(JSONManagement.GetValue(SignedQRCodeTxt), TempBlob);
    //         FieldRef := RecRef.Field(SalesInvoiceHeader.FieldNo("QR Code"));
    //         TempBlob.ToRecordRef(RecRef, SalesInvoiceHeader.FieldNo("QR Code"));
    //         RecRef.Modify();
    //     end else
    //         Error(IRNHashErr, TempIRNTxt);
    // end;

    var
        Response: Text;
        URL_API: Text;
        Content: HttpContent;
        Client: HttpClient;
        Header: HttpHeaders;
        HttpResponse: HttpResponseMessage;
        HttpRequest: HttpRequestMessage;
        GSTRegistrationNos: Record "GST Registration Nos.";
        //Pandu
        PostUrl: Text;
        HttpWebRequestMgt: Codeunit "Http Web Request Mgt.";
        body: Text;
        //TempBlob: Record TempBlob temporary;
        TempBlob: Codeunit "Temp Blob";
        Instr: InStream;
        ApiResult: Text;
        APIError: Label 'Error When Contacting API';
        ItemDetails: Text;
        Req: BigText;
        SIHdr: Record "Sales Invoice Header";
        TempLength: Integer;
        TtlLength: Integer;
        Outstr: OutStream;
        TempBlob1: Codeunit "Temp Blob";
        SHdr: Record "Sales Header";
        QRCodeManagement: Codeunit "QR Code Management";
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalAmtCust: Decimal;
        TotalAmtCustNew: Decimal;
}