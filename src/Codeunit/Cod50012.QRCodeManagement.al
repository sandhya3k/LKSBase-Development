codeunit 50012 "QR Code Management"
{

    trigger OnRun()
    var
        CompanyInfo: Record Company;
        SalesHeader: Record "Sales Header";
        //3k-UPG TempBlob: Record TempBlob;
        tempRec: Codeunit "Temp Blob";
        QRCodeInput: Text[1024];
        QRCodeFileName: Text[1024];
        Cust: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceHeaderEx: Record "Posted Sales Extended";
    begin
        // SalesInvoiceHeader.GET('GST2021DL-13670');
        // SalesInvoiceHeaderEx.GET('GST2021DL-13670');
        //  CreateQRCodeforSalesInvoiceHeader(
        //  SalesInvoiceHeader,'eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ0NDQwNUM3ODFFNDgyNTA3MkIzNENBNEY4QkRDNjA2Qzg2QjU3MjAiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJS'
        //  + 'RVFGeDRIa2dsQnlzMHlrLUwzR0JzaHJWeUEifQ.eyJkYXRhIjoie1wiU2VsbGVyR3N0aW5cIjpcIjA3QUFBQ1QzNDc4SjFaMlwiLFwiQnV5ZXJHc3RpblwiOlwiMzZBQUF'
        //  + 'DRDg5MDZEMVpWXCIsXCJEb2NOb1wiOlwiR1NUMjAyMURMLTEzNjcwXCIsXCJEb2NUeXBcIjpcIklOVlwiLFwiRG9jRHRcIjpcIjEyLzEwLzIwMjBcIixcIlRvdEludlZhb'
        //  + 'FwiOjM3OTguMCxcIkl0ZW1DbnRcIjoxLFwiTWFpbkhzbkNvZGVcIjpcIjg1MDc4MDAwXCIsXCJJcm5cIjpcImI2Y2U1NmFkNjc5NWJiMTczNWI2YzhmYTc4MzJmMGYzNDZ'
        //  + 'jNTY1NGQ2YjJjMGYwZjQwOWIzZjkzZTRjY2Q4YmZcIixcIklybkR0XCI6XCIyMDIwLTEwLTEyIDEwOjIxOjAwXCJ9IiwiaXNzIjoiTklDIn0.co6aEGN0F7BF1iG1zGMi9'
        //  + 'rr-_xeDZXb_e6IATXtijo77e3tV37eM5BqY2bh9HnR6nPu7pIRPRj4brmrkruagQdhwjQWqMWNcI1B9PfmVltIw2hx4u1cF7oh6094kBa-SL54clbxln_1WX2eLvwJCOsf9'
        //  + 'gf1N7F_ftlRgLOYKFd5A6NgAHHWXzFKLRR8k9dE22S-K8t50JT9tE6aRKZ0Lro5jnZt88vrIjz83sCp_gCdvUl9y02CyzI8iGDH2pLX2RoYm5bCM_jrsSHXX-22J9pKc7Hm'
        //  + 'KIBOJVArrCZFzIaAQbvmj_45msTYMLrRJpYwY2qkQDszpuOTTj3MyXBcaNA');
        // SalesInvoiceHeaderEx."Ack No." := '172010012800945';
        // SalesInvoiceHeaderEx."Ack Date" := CREATEDATETIME(121020D,102100T);
        // SalesInvoiceHeaderEx."IRN No." := '4d567bc4a5d4d5bbb8d86eb998db1c57f39eac4fc80393b8e2f11ddddd912cf1';
        // SalesInvoiceHeaderEx.MODIFY;
        // SalesInvoiceHeaderEx.GET(SalesInvoiceHeaderEx."Posted Document Type"::Invoice,'LKS01-2021-00016');
        // SalesInvoiceHeaderEx.CALCFIELDS("QR Code");
        // MESSAGE(FORMAT(SalesInvoiceHeaderEx."QR Code"));
    end;

    var
        ThreeTierMgt: Codeunit "File Management";
        Rec_ResEntry: Record "Reservation Entry";
        QRCodeText: Text;


    procedure CreateQRCodeforSalesInvoiceHeader(SalesInvoiceHeader: Record "Sales Invoice Header"; QRText: Text)
    var
        CompanyInfo: Record Company;
        //3K-UPG TempBlob: Record TempBlob;
        TempBlob: Codeunit "Temp Blob";
        QRCodeInput: Text[1024];
        QRCodeFileName: Text[1024];
        Cust: Record Customer;
        SalesInvoiceHdrExtend: Record "Posted Sales Extended";
    begin
        WITH SalesInvoiceHeader DO BEGIN
            IF QRText <> '' THEN
                QRCodeText := QRText;

            QRCodeInput := QRCodeText;//CreateQRCodeInput(Cust.Name,Cust."Phone No.",Cust."E-Mail",Cust."Balance (LCY)");
            QRCodeFileName := GetQRCode(QRCodeInput);
            QRCodeFileName := MoveToMagicPath(QRCodeFileName); // To avoid confirmation dialogue on RTC
                                                               //  MESSAGE('Hello');
            CLEAR(TempBlob);
            ThreeTierMgt.BLOBImport(TempBlob, QRCodeFileName);
            IF TempBlob.HASVALUE THEN BEGIN
                //    SalesInvoiceHdrExtend.GET(SalesInvoiceHeader."No.");//0712
                SalesInvoiceHdrExtend.RESET;
                SalesInvoiceHdrExtend.SETRANGE("No.", SalesInvoiceHeader."No.");
                IF SalesInvoiceHdrExtend.FINDFIRST THEN;
                //TBD SalesInvoiceHdrExtend."QR Code" := TempBlob.Blob;
                SalesInvoiceHdrExtend.MODIFY;
            END;

            //TBD
            /*
            IF NOT ISSERVICETIER THEN
                IF EXISTS(QRCodeFileName) THEN
                    ERASE(QRCodeFileName);
            */
        END;
    end;

    local procedure GetQRCode(QRCodeInput: Text[1024]) QRCodeFileName: Text[1024]
    //TBD
    /*
    var
        [RunOnClient]
        IBarCodeProvider: DotNet IBarcodeProvider;
    */
    begin
        //TBD
        /*
        GetBarCodeProvider(IBarCodeProvider);
        QRCodeFileName := IBarCodeProvider.GetBarcode(QRCodeInput);
        */
    end;

    //TBD
    /*
    
    procedure GetBarCodeProvider(var IBarCodeProvider: DotNet IBarcodeProvider)
    var
        [RunOnClient]
        QRCodeProvider: DotNet QRCodeProvider;
        
    begin
        QRCodeProvider := QRCodeProvider.QRCodeProvider;
        IBarCodeProvider := QRCodeProvider;
    end;
    */


    procedure MoveToMagicPath(SourceFileName: Text[1024]) DestinationFileName: Text[1024]
    //TBD var
    //TBD    FileSystemObject: Automation;
    begin
        //TBD
        /*
        DestinationFileName := ThreeTierMgt.ClientTempFileName('');
        IF ISCLEAR(FileSystemObject) THEN
            CREATE(FileSystemObject, TRUE, TRUE);
        FileSystemObject.MoveFile(SourceFileName, DestinationFileName);
        */
    end;


    procedure CreateQRCodeforSalesCrMemoHeader(SalesCrMemoHeader: Record "Sales Cr.Memo Header"; QRText: Text)
    var
        CompanyInfo: Record Company;
        //3K-UPG TempBlob: Record TempBlob;
        TempBlob: Codeunit "Temp Blob";
        QRCodeInput: Text[1024];
        QRCodeFileName: Text[1024];
        Cust: Record Customer;
        SalesCrMemoHdrExtend: Record "Posted Sales Extended";
    begin
        WITH SalesCrMemoHeader DO BEGIN
            IF QRText <> '' THEN
                QRCodeText := QRText;

            QRCodeInput := QRCodeText;//CreateQRCodeInput(Cust.Name,Cust."Phone No.",Cust."E-Mail",Cust."Balance (LCY)");
            QRCodeFileName := GetQRCode(QRCodeInput);
            QRCodeFileName := MoveToMagicPath(QRCodeFileName); // To avoid confirmation dialogue on RTC

            CLEAR(TempBlob);
            ThreeTierMgt.BLOBImport(TempBlob, QRCodeFileName);
            IF TempBlob.HASVALUE THEN BEGIN
                //    SalesCrMemoHdrExtend.GET(SalesCrMemoHeader."No.");
                SalesCrMemoHdrExtend.RESET;
                SalesCrMemoHdrExtend.SETRANGE("No.", SalesCrMemoHeader."No.");
                IF SalesCrMemoHdrExtend.FINDFIRST THEN;
                //TBD SalesCrMemoHdrExtend."QR Code" := TempBlob.Blob;
                SalesCrMemoHdrExtend.MODIFY;
            END;

            //TBD
            /*
            IF NOT ISSERVICETIER THEN
                IF EXISTS(QRCodeFileName) THEN
                    ERASE(QRCodeFileName);
            */
        END;
    end;
}

