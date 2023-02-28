page 50117 "LCMS Interface Response"
{
    APIGroup = 'lCMS';
    APIPublisher = 'erp';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityName = 'lcmsInterfaceResponse';
    EntitySetName = 'lcmsInterfaceResponses';
    Caption = 'lcmsInterfaces', Locked = true;
    PageType = api;
    SourceTable = "LCMS Response Queue";
    ODataKeyFields = SystemId;
    Extensible = false;
    // ApplicationArea = All;
    // UsageCategory = Lists;
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
}