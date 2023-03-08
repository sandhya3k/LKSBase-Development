codeunit 50014 "Batch Job"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        case Rec."Parameter String" of
            'UploadFileToAzure':
                UploadFileToAzure('');

        end;
        case rec."Parameter String" of
            'SendCustomerEmail':
                begin
                    // if ResponseQueueRec."Invoice No." <> '' then begin
                    ResponseQueueRec.Reset();
                    IF ResponseQueueRec.FindSet() then begin
                        repeat
                            SendCustomerEmail(ResponseQueueRec."Invoice No.");
                        // SendCustomerEmail('');
                        until ResponseQueueRec.Next() = 0;
                    end;
                end;

        end;


    end;
    // END;

    procedure SendCustomerEmail(InvNo: Text)
    var

        SalesInvHdr: Record "Sales Invoice Header";
        SalesCrdHdr: Record "Sales Cr.Memo Header";
        Customer: Record Customer;
        Environment: Codeunit "Environment Information";
        ToAddress: List of [Text];
        CcAddress: List of [Text];
        BccAddress: List of [Text];



    begin
        //Clear(InvNo);
        ResponseQueue.Reset();
        ResponseQueue.SetFilter(Method, '%1|%2', 'RTB', 'CRTB');
        ResponseQueue.SetFilter("Invoice Doc", '<>%1', '');

        if InvNo <> '' then 
            ResponseQueue.SetRange("Invoice No.", InvNo);
        if ResponseQueue.FindSet() then begin
            repeat
                IF SalesInvHdr.Get(InvNo) then begin
                    if Customer.get(SalesInvHdr."Sell-to Customer No.") then begin
                        if Environment.IsProduction() then
                            ToAddress.Add(Customer."E-Mail")
                        else
                            if Environment.IsSandbox() then
                                ToAddress.add('sandhya.m@3ktechnologies.com');
                    end;
                end else
                    if SalesCrdHdr.get(InvNo) then begin
                        if Customer.get(SalesCrdHdr."Sell-to Customer No.") then begin
                            if Environment.IsProduction() then
                                ToAddress.add(Customer."E-Mail")
                            else
                                if Environment.IsSandbox() then
                                    ToAddress.add('sandhya.m@3ktechnologies.com');
                        end;
                    end;
                BlobtoAzure(InvNo, ToAddress);

            until ResponseQueue.Next() = 0;
        end;
       // end;
    end;

    procedure BlobtoAzure(InvNo: Text;
            ToAddress: List of [Text])
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
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        SubjectLbl: Label 'Sales Invoice %1';
        CCAddress: List of [Text];
    begin
        ContainerName := 'lcmsd365uat';
        StorageAccount := 'lcmsd365storage';
        SharedKey := 'dmc1K8VS/RnNBRkfTTDg9+A66O/ky/ceK0ls2bhSzZeiO4n1Z/MberAD767KS7J9D+ovl2mBdzqx+AStdvAZqA==';
        Authorization := StorageServiceAuth.CreateSharedKey(SharedKey);
        BlobClient.Initialize(StorageAccount, ContainerName, Authorization);
        BlobClient.ListBlobs(ContainerContent);
        ContainerContent.SetFilter(Name, '@*' + InvNo + '*');
        ContainerContent.FindFirst();
        TempBlob.CreateInStream(Instrm);
        BlobClient.GetBlobAsStream(ContainerContent.Name, Instrm);

        EmailMessage.Create(ToAddress, StrSubstNo(SubjectLbl, InvNo), '', true, CcAddress, CCAddress);
        // if TempBlob.Length() > 0 then
        EmailMessage.AddAttachment(StrSubstNo(InvNo, CurrentDateTime) + '.pdf', 'pdf', Instrm);
        if EmailMessage.Attachments_First() then
            if Email.Send(EmailMessage) then;

    end;






    procedure UploadFileToAzure(InvNo: Text)
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
        ResponseQueue: Record "LCMS Response Queue";
    begin
        ResponseQueue.SetFilter(Method, '%1|%2', 'RTB', 'CRTB');
        if InvNo > '' then
            ResponseQueue.SetRange("Invoice No.", InvNo)
        else
            ResponseQueue.SetFilter("Invoice Doc", '%1', '');
        if ResponseQueue.FindSet() then begin
            ContainerName := 'lcmsd365uat';
            StorageAccount := 'lcmsd365storage';
            SharedKey := 'dmc1K8VS/RnNBRkfTTDg9+A66O/ky/ceK0ls2bhSzZeiO4n1Z/MberAD767KS7J9D+ovl2mBdzqx+AStdvAZqA==';
            Authorization := StorageServiceAuth.CreateSharedKey(SharedKey);
            BlobClient.Initialize(StorageAccount, ContainerName, Authorization);
            repeat
                TempBlob.CreateOutStream(OutStreamL);
                ResponseQueue.Document.ExportStream(OutStreamL);
                TempBlob.CreateInStream(Instrm);
                Response := BlobClient.PutBlobBlockBlobStream(ResponseQueue."Invoice No." + '.pdf', Instrm);
                if not Response.IsSuccessful() then
                    Error(Response.GetError());
                Path := 'https://lcmsd365storage.blob.core.windows.net/lcmsd365uat/' + ResponseQueue."Invoice No." + '.pdf';
                ResponseQueue."Invoice Doc" := Path;
                ResponseQueue.Modify(true);
            until ResponseQueue.Next() = 0;
        end;
    end;

    var
        myInt: Integer;
        ResponseQueueRec: Record "LCMS Response Queue";
        ResponseQueue: Record "LCMS Response Queue";
}