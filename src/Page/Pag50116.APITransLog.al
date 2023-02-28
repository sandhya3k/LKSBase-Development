page 50116 "API Trans Log"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "API Transaction Log";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(API; Rec.API)
                {
                    ToolTip = 'api';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field(Message; Rec.Message)
                {
                    ToolTip = 'Specifies the value of the Message field.';
                }
                field(Method; Rec.Method)
                {
                    ToolTip = 'method';
                }
                field(Payload; Rec.Payload)
                {
                    ToolTip = 'Specifies the value of the Payload field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Triggered By Us"; Rec."Triggered By Us")
                {
                    ToolTip = 'Specifies the value of the Triggered By Us field.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group(Entries)
            {
                action("Updates")
                {
                    ApplicationArea = All;
                    Caption = 'Updates';
                    Image = Entries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "LCMS Response Queue";
                    RunPageLink = "RTB No." = field("Reference No.");
                }

            }
        }
        area(Processing)
        {
            group(General)
            {
                action("Download Log")
                {
                    ApplicationArea = All;
                    Caption = 'Download Log';
                    Image = "Download";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        FileMgt: Codeunit "File Management";
                        OutStreamL: OutStream;
                        NoDataErr: Label 'Entry No.: %1 doesn''t have any document.', Comment = '%1';
                        FileName: Text;
                    begin
                        TempBlob.CreateOutStream(OutStreamL);
                        Rec.Payload.ExportStream(OutStreamL);
                        if not TempBlob.HasValue() then
                            Error(NoDataErr, Rec."Entry No.");
                        FileName := Rec."Reference No." + '-' + Format(Rec."Entry No.");
                        FileMgt.BLOBExportWithEncoding(TempBlob, FileName + '.json', true, TextEncoding::UTF8);
                    end;
                }
                action(Push)
                {
                    ApplicationArea = All;
                    Image = "Process";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        OutStreamL: OutStream;
                        Instrm: InStream;
                        NoDataErr: Label 'Entry No.: %1 doesn''t have any document.', Comment = '%1';
                        String: Text;
                        APITransLog: Record "API Transaction Log";
                        ErrorHandler: Codeunit "Error Handler";
                        IsSuccess: Boolean;
                    begin
                        TempBlob.CreateOutStream(OutStreamL);
                        Rec.Payload.ExportStream(OutStreamL);
                        if not TempBlob.HasValue() then
                            Error(NoDataErr, Rec."Entry No.");
                        TempBlob.CreateInStream(Instrm);
                        Instrm.ReadText(String);
                        ErrorHandler.SetDef('HandleLCMSRequest', String);
                        IsSuccess := ErrorHandler.Run();
                        Rec.Method := ErrorHandler.GetMethod();
                        Rec."Reference No." := ErrorHandler.GetReference();
                        if IsSuccess then
                            Rec.Message := 'Success'
                        else
                            Rec.Message := GetLastErrorText();
                        Rec.Modify(true);
                    end;
                }
            }
        }
    }
}