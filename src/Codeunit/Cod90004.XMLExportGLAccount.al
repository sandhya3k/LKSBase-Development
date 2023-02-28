codeunit 50015 "XML Export - G/L Account"
// PC ID was 90000 renamed to 50015 
{

    trigger OnRun()
    begin
        /*
        TestFile.CREATE('D:\GLExport1.csv');
        TestFile.CREATEOUTSTREAM(TestStream);
        XMLPORT.EXPORT(XMLPORT::"G/L Account Export XML",TestStream);
        TestFile.CLOSE;
        MESSAGE('G/L Account Export XML completed!');
        */
        //TBD
        /*
        TestFile.Open('D:\GLExport1.CSV');
        TestFile.CreateInStream(TestStream);
        XMLPORT.Import(XMLPORT::"G/L Account Export XML", TestStream);
        TestFile.Close;
        */
        Message('Information Restored');

    end;

    var
        TestFile: File;
        TestStream: InStream;
}

