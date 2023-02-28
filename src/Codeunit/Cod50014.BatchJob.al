codeunit 50014 "Batch Job"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        case Rec."Parameter String" of
            'UploadFileToAzure':
                UploadFileToAzure('');

        end;
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
}