table 50028 "LCMS Response Queue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(21; "RTB No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(22; Method; Text[10])
        {
            DataClassification = CustomerContent;
        }
        field(23; "RTB State"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(24; "Invoice Doc"; Text[1000])
        {
            DataClassification = CustomerContent;
        }
        field(25; "Invoice Date"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(26; "Conversion Rate"; Text[10])
        {
            DataClassification = CustomerContent;
        }
        field(27; "Rejected Reason"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(28; "Invoice No."; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(29; "Bill Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(30; "Local Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(31; "Payment Date"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(32; "Collection Location"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(33; "Is Unapplied"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(34; "Is Writeoff"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(35; "Document"; Media)
        {
            DataClassification = CustomerContent;
        }
        field(36; "Payload"; Media)
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure CreateQueue(RTBNo: Text[50])
    begin
        Rec.Init();
        Rec."RTB No." := RTBNo;
        //Rec.Insert(true);
    end;

    procedure RTBPayload(RTBNo: Text[50]; RTBState: Text[50]; InvNo: Text[20]; InvDate: Text[50]; ConversionRate: Text[10]; RejReason: Text[50]; InvDoc: Text)
    begin
        Rec."RTB State" := RTBState;
        Rec."Invoice Doc" := InvDoc;
        Rec."Invoice No." := InvNo;
        Rec."Invoice Date" := InvDate;
        Rec."Conversion Rate" := ConversionRate;
        Rec."Rejected Reason" := RejReason;
        Rec.Method := 'RTB';
        //Rec.Modify(true);
        // JsonWriter.WriteStartObject('');
        // JsonWriter.WriteStringProperty('rtb_state', RTBState);
        // JsonWriter.WriteStringProperty('invoice_doc', '');
        // JsonWriter.WriteStringProperty('invoice_number', InvNo);
        // JsonWriter.WriteStringProperty('invoice_generation_date', InvDate);
        // JsonWriter.WriteStringProperty('invoice_conversion_rate', ConversionRate);
        // JsonWriter.WriteStringProperty('rejected_reason_accounts', RejReason);
        // JsonWriter.WriteEndObject();
        // JsonString := JsonWriter.GetJSonAsText();
        // ImportPayload();
    end;

    procedure CRTBPayload(crtb_status: Text[50]; credit_note: Text[20]; credit_note_date: Text[100]; rejected_reason_accounts: Text[100])
    begin
        Rec.Method := 'CRTB';
        Rec."RTB State" := crtb_status;
        Rec."Invoice No." := credit_note;
        Rec."Invoice Date" := credit_note_date;
        Rec."Rejected Reason" := rejected_reason_accounts;
        //Rec.Modify(true);
        // JsonWriter.WriteStartObject('');
        // JsonWriter.WriteStringProperty('crtb_status', crtb_status);
        // JsonWriter.WriteStringProperty('credit_note', credit_note);
        // JsonWriter.WriteStringProperty('credit_note_date', credit_note_date);
        // JsonWriter.WriteStringProperty('rejected_reason_accounts', rejected_reason_accounts);
        // JsonWriter.WriteEndObject();
        // JsonString := JsonWriter.GetJSonAsText();
        // ImportPayload()
    end;

    procedure WriteOffPayload()
    begin
        Rec.Method := 'WriteOff';
        Rec."RTB State" := '';
        //Rec.Modify(true);
        // JsonWriter.WriteStartObject('');
        // JsonWriter.WriteStringProperty('wrt_status', '');
        // JsonWriter.WriteEndObject();
        // JsonString := JsonWriter.GetJSonAsText();
        // ImportPayload();
    end;

    procedure PaymentPayload(rtb_num: Text[50]; bill_payment_amount: Decimal; local_payment_amount: Decimal; payment_date: Text[50]; collection_location: Text[20]; is_unapplied: Boolean; is_writeoff: Boolean)
    begin
        Rec.Method := 'Payment';
        Rec."RTB No." := rtb_num;
        Rec."Bill Amount" := bill_payment_amount;
        Rec."Local Amount" := local_payment_amount;
        Rec."Payment Date" := payment_date;
        Rec."Collection Location" := collection_location;
        Rec."Is Unapplied" := is_unapplied;
        Rec."Is Writeoff" := is_writeoff;
        //Rec.Modify(true);
        // JsonWriter.WriteStartObject('');
        // JsonWriter.WriteStringProperty('rtb_num', rtb_num);
        // JsonWriter.WriteNumberProperty('bill_payment_amount', bill_payment_amount);
        // JsonWriter.WriteNumberProperty('local_payment_amount', local_payment_amount);
        // JsonWriter.WriteStringProperty('payment_date', payment_date);
        // JsonWriter.WriteStringProperty('collection_location', collection_location);
        // JsonWriter.WriteBooleanProperty('is_unapplied', is_unapplied);
        // JsonWriter.WriteBooleanProperty('is_writeoff', is_writeoff);
        // JsonWriter.WriteEndObject();
        // ImportPayload();
    end;

    // procedure ImportPayload()
    // begin
    //     JsonString := JsonWriter.GetJSonAsText();
    //     TempBlob.CreateOutStream(OutStrm, TextEncoding::UTF8);
    //     OutStrm.WriteText(JsonString);
    //     TempBlob.CreateInStream(InStrm, TextEncoding::UTF8);
    //     Rec.Payload.ImportStream(InStrm, Rec."RTB No.");
    //     Rec.Modify(true);
    // end;

    procedure WriteBlobInAzure()
    var
        BatchJob: Codeunit "Batch Job";
    // ContainerClient: Codeunit "ABS Container Client";
    // StorageAccount: Text;
    // Authorization: Interface "Storage Service Authorization";
    // ContainerName: Text;
    // Response: Codeunit "ABS Operation Response";
    // StorageServiceAuth: Codeunit "Storage Service Authorization";
    // SharedKey: Text;
    // BlobClient: Codeunit "ABS Blob Client";
    // TempBlob: Codeunit "Temp Blob";
    // OutStreamL: OutStream;
    // Instrm: InStream;
    // ContainerContent: Record "ABS Container Content";
    // Path: Text;
    begin
        BatchJob.UploadFileToAzure("Invoice No.");

        // ContainerName := 'lcmsd365uat';
        // StorageAccount := 'lcmsd365storage';
        // SharedKey := 'dmc1K8VS/RnNBRkfTTDg9+A66O/ky/ceK0ls2bhSzZeiO4n1Z/MberAD767KS7J9D+ovl2mBdzqx+AStdvAZqA==';
        // Authorization := StorageServiceAuth.CreateSharedKey(SharedKey);
        // BlobClient.Initialize(StorageAccount, ContainerName, Authorization);
        // TempBlob.CreateOutStream(OutStreamL);
        // //Rec.Document.ExportStream(OutStreamL);
        // TempBlob.CreateInStream(Instrm);
        // Response := BlobClient.PutBlobBlockBlobStream(Rec."RTB No." + '.pdf', Instrm);
        // if not Response.IsSuccessful() then
        //     Error(Response.GetError());
        // BlobClient.ListBlobs(ContainerContent);
        // ContainerContent.FindFirst();
        // repeat
        //     Path := ContainerContent."Parent Directory" + '/' + ContainerContent."Full Name"

        // until ContainerContent.Next() = 0;
    end;

    procedure ListBlobInAzure()
    var
        ContainerClient: Codeunit "ABS Container Client";
        StorageAccount: Text;
        Authorization: Interface "Storage Service Authorization";
        ContainerName: Text;
        Response: Codeunit "ABS Operation Response";
        StorageServiceAuth: Codeunit "Storage Service Authorization";
        SharedKey: Text;
        BlobClient: Codeunit "ABS Blob Client";
        TempBlob: Codeunit "Temp Blob";
        OutStreamL: OutStream;
        Instrm: InStream;
        ContainerContent: Record "ABS Container Content";
        Path: Text;
    begin
        ContainerName := 'lcmsd365uat';
        StorageAccount := 'lcmsd365storage';
        SharedKey := 'dmc1K8VS/RnNBRkfTTDg9+A66O/ky/ceK0ls2bhSzZeiO4n1Z/MberAD767KS7J9D+ovl2mBdzqx+AStdvAZqA==';
        Authorization := StorageServiceAuth.CreateSharedKey(SharedKey);
        BlobClient.Initialize(StorageAccount, ContainerName, Authorization);
        BlobClient.ListBlobs(ContainerContent);
        ContainerContent.SetFilter(Name, '@*' + "Invoice No." + '*');
        ContainerContent.FindFirst();
        //repeat
        BlobClient.GetBlobAsFile(ContainerContent.Name);
        // Path := ContainerContent."Parent Directory" + '/' + ContainerContent."Full Name";
        // Message(Path);
        //until ContainerContent.Next() = 0;
    end;

    var
        JsonWriter: Codeunit "Json Text Reader/Writer";
        TempBlob: Codeunit "Temp Blob";
        OutStrm: OutStream;
        InStrm: InStream;
        JsonString: Text;
        qwe: Record 18;

}