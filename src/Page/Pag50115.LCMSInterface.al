page 50115 "LCMS Interface"
{
    APIGroup = 'lCMSReq';
    APIPublisher = 'erpReq';
    APIVersion = 'v1.0';
    DelayedInsert = true;
    EntityName = 'lcmsInterface';
    EntitySetName = 'lcmsInterfaces';
    PageType = API;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "API Transaction Log";
    SourceTableTemporary = true;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(api; Rec.API)
                {
                    ApplicationArea = All;
                    Caption = 'api', Locked = true;
                    ToolTip = 'api';
                }
                field("key"; JsonString)
                {
                    ApplicationArea = All;
                    Caption = 'key', Locked = true;
                    ToolTip = 'key';
                }
                field(method; Rec.Method)
                {
                    ApplicationArea = All;
                    Caption = 'method', Locked = true;
                    ToolTip = 'method';
                }
            }
        }
    }

    var
        JsonString: Text;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        APITransLog: Record "API Transaction Log";
        ErrorHandler: Codeunit "Error Handler";
        IsSuccess: Boolean;
        TempBlob: Codeunit "Temp Blob";
        OutStrm: OutStream;
        InStrm: InStream;
    begin
        ClearLastError();
        ErrorHandler.SetDef('HandleLCMSRequest', JsonString);
        IsSuccess := ErrorHandler.Run();
        APITransLog.Init();
        APITransLog.API := Rec.API;
        APITransLog.Method := ErrorHandler.GetMethod();
        APITransLog."Reference No." := ErrorHandler.GetReference();
        if IsSuccess then
            APITransLog.Message := 'Success'
        else
            APITransLog.Message := CopyStr(GetLastErrorText(), 1, MaxStrLen(APITransLog.Message));
        TempBlob.CreateOutStream(OutStrm, TextEncoding::UTF8);
        OutStrm.WriteText(JsonString);
        TempBlob.CreateInStream(InStrm, TextEncoding::UTF8);
        APITransLog.Payload.ImportStream(InStrm, APITransLog.API);
        APITransLog.Insert(true);
    end;


}