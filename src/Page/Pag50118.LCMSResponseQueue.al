page 50118 "LCMS Response Queue"
{
    PageType = List;
    SourceTable = "LCMS Response Queue";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }

                field(rtbNo; Rec."RTB No.")
                {
                    Caption = 'RTB No.';
                }
                field(billAmount; Rec."Bill Amount")
                {
                    Caption = 'Bill Amount';
                }
                field(collectionLocation; Rec."Collection Location")
                {
                    Caption = 'Collection Location';
                }
                field(conversionRate; Rec."Conversion Rate")
                {
                    Caption = 'Conversion Rate';
                }
                field(document; Rec.Document)
                {
                    Caption = 'Document';
                }
                field(invoiceDate; Rec."Invoice Date")
                {
                    Caption = 'Invoice Date';
                }
                field(invoiceDoc; Rec."Invoice Doc")
                {
                    Caption = 'Invoice Doc';
                }
                field(invoiceNo; Rec."Invoice No.")
                {
                    Caption = 'Invoice No.';
                }
                field(isUnapplied; Rec."Is Unapplied")
                {
                    Caption = 'Is Unapplied';
                }
                field(isWriteoff; Rec."Is Writeoff")
                {
                    Caption = 'Is Writeoff';
                }
                field(localAmount; Rec."Local Amount")
                {
                    Caption = 'Local Amount';
                }
                field(method; Rec.Method)
                {
                    Caption = 'Method';
                }
                field(paymentDate; Rec."Payment Date")
                {
                    Caption = 'Payment Date';
                }
                field(rtbState; Rec."RTB State")
                {
                    Caption = 'RTB State';
                }
                field(rejectedReason; Rec."Rejected Reason")
                {
                    Caption = 'Rejected Reason';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Files)
            {
                action("Push File")
                {
                    ApplicationArea = All;
                    Caption = 'Push File';
                    Image = "Download";

                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        FileMgt: Codeunit "File Management";
                        OutStreamL: OutStream;
                        NoDataErr: Label 'Entry No.: %1 doesn''t have any document.', Comment = '%1';
                        FileName: Text;
                    begin
                        //Rec.CalcFields(Document);
                        Rec.WriteBlobInAzure();
                    end;
                }
                action("Get File")
                {
                    ApplicationArea = All;
                    Image = "Download";

                    trigger OnAction()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        FileMgt: Codeunit "File Management";
                        OutStreamL: OutStream;
                        NoDataErr: Label 'Entry No.: %1 doesn''t have any document.', Comment = '%1';
                        FileName: Text;
                    begin
                        //Rec.CalcFields(Document);
                        Rec.ListBlobInAzure();
                    end;
                }
            }
        }
    }
}