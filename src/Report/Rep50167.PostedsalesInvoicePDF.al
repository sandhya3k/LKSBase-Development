report 50167 "Posted sales Invoice PDF"
{
    //DefaultLayout = RDLC;
    //RDLCLayout = './res/PostedsalesInvoicePDF.rdlc';
    ProcessingOnly = true;
    UseRequestPage = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Posted sales Invoice PDF';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date", "No.", "Sell-to Customer No.";

            trigger OnAfterGetRecord()
            var
                SalesInvHeader: Record "Sales Invoice Header";
                TempBlob_lRec: Codeunit "Temp Blob";
                Out: OutStream;
                RecRef: RecordRef;
                FileManagement: Codeunit "File Management";
            begin
                if not OldReport then begin
                    if "Shortcut Dimension 1 Code" = '1' then begin
                        // SalesInvHeader.Reset;
                        // SalesInvHeader.SetRange("No.", "No.");
                        //REPORT.SaveAsPdf(50170, SearchDirectory + '\' + "Sales Invoice Header"."No." + '.pdf', SalesInvHeader);
                        StoreOutputAsPdf(50170, "No.", ReportType);
                    end;


                    if "Shortcut Dimension 1 Code" <> '1' then begin
                        // SalesInvHeader.Reset;
                        // SalesInvHeader.SetRange("No.", "No.");
                        //REPORT.SaveAsPdf(50171, SearchDirectory + '\' + "Sales Invoice Header"."No." + '.pdf', SalesInvHeader);
                        StoreOutputAsPdf(50171, "No.", ReportType);
                    end;
                end else begin
                    if "Shortcut Dimension 1 Code" = '1' then begin
                        //SalesInvHeader.Reset;
                        //SalesInvHeader.SetRange("No.", "No.");
                        //REPORT.SaveAsPdf(50146, SearchDirectory + '\' + "Sales Invoice Header"."No." + '.pdf', SalesInvHeader);
                        StoreOutputAsPdf(50146, "No.", ReportType);
                    end;


                    if "Shortcut Dimension 1 Code" <> '1' then begin
                        //SalesInvHeader.Reset;
                        //SalesInvHeader.SetRange("No.", "No.");
                        //REPORT.SaveAsPdf(50149, SearchDirectory + '\' + "Sales Invoice Header"."No." + '.pdf', SalesInvHeader);
                        StoreOutputAsPdf(50149, "No.", ReportType);
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if ReportType <> ReportType::Invoice then
                    CurrReport.Break;
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "Posting Date", "No.", "Sell-to Customer No.";

            trigger OnAfterGetRecord()
            var
                ScMemo: Record "Sales Cr.Memo Header";
                TempBlob_lRec: Codeunit "Temp Blob";
                Out: OutStream;
                RecRef: RecordRef;
                FileManagement: Codeunit "File Management";
            begin
                SingleIns.SetPdf;
                if OldReport then begin
                    if "Shortcut Dimension 1 Code" = '1' then begin
                        //ScMemo.Reset;
                        //ScMemo.SetRange("No.", "No.");
                        //TBD REPORT.SaveAsPdf(50147, SearchDirectory + '\' + "Sales Cr.Memo Header"."No." + '.pdf', ScMemo);
                        StoreOutputAsPdf(50147, "No.", ReportType);
                    end;
                    if "Shortcut Dimension 1 Code" <> '1' then begin
                        //ScMemo.Reset;
                        //ScMemo.SetRange("No.", "No.");
                        //TBD REPORT.SaveAsPdf(50174, SearchDirectory + '\' + "Sales Cr.Memo Header"."No." + '.pdf', ScMemo);
                        StoreOutputAsPdf(50174, "No.", ReportType);
                    end;
                end else begin
                    if "Shortcut Dimension 1 Code" = '1' then begin
                        //ScMemo.Reset;
                        //ScMemo.SetRange("No.", "No.");
                        //TBD REPORT.SaveAsPdf(50176, SearchDirectory + '\' + "Sales Cr.Memo Header"."No." + '.pdf', ScMemo);
                        StoreOutputAsPdf(50176, "No.", ReportType);
                    end;
                    if "Shortcut Dimension 1 Code" <> '1' then begin
                        //ScMemo.Reset;
                        //ScMemo.SetRange("No.", "No.");
                        //TBD REPORT.SaveAsPdf(50175, SearchDirectory + '\' + "Sales Cr.Memo Header"."No." + '.pdf', ScMemo);
                        StoreOutputAsPdf(50175, "No.", ReportType);
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if ReportType <> ReportType::"Credit Note" then
                    CurrReport.Break;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Report Type"; ReportType)
                {
                    ApplicationArea = All;
                }
                field("Change Folder"; DiffFolder)
                {
                    ApplicationArea = All;
                }
                field("Old Formats"; OldReport)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        // if DiffFolder then
        //     SearchDirectory := 'C:\Manual_SalesInvoices_CreditNote'
        // else
        //     SearchDirectory := 'C:\SalesInvoices_CreditNote';
        // if DiffFolder <> true then begin
        //     case UpperCase(UserId) of
        //         'LSLAW\BHUPENDER':
        //             SearchDirectory := 'C:\Bhupender_SIH_SCM';
        //         'LSLAW\KUMAR.S':
        //             SearchDirectory := 'C:\Kumar_SIH_SCM';
        //         'LSLAW\K.VISWANATHAN':
        //             SearchDirectory := 'C:\Viswanathan_SIH_SCM';
        //         else
        //             Error('You are not authorised to run this report');
        //     end;
        //end;
        //TBD
        /*
        Create(rtFileSystem, false, true);
        if not rtFileSystem.FolderExists(SearchDirectory) then
            rtFileSystem.CreateFolder(SearchDirectory);
        */
    end;

    local procedure StoreOutputAsPdf(ReportId: Integer; DocumentNo: Code[20]; PdfReportType: Option Invoice,"Credit Note")
    var
        TempBlob_lRec: Codeunit "Temp Blob";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrmemoHdr: Record "Sales Cr.Memo Header";
        Out: OutStream;
        RecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        testreport: Report 1306;
    begin
        Clear(TempBlob_lRec);
        Clear(FileManagement);
        TempBlob_lRec.CreateOutStream(Out, TEXTENCODING::UTF8);
        if PdfReportType = PdfReportType::Invoice then begin
            SalesInvHeader.Reset;
            SalesInvHeader.SetRange("No.", DocumentNo);
            if not SalesInvHeader.FindFirst() then
                exit;
            SalesInvHeader.SetRecFilter();
            RecRef.GetTable(SalesInvHeader);
        end else begin
            SalesCrmemoHdr.Reset;
            SalesCrmemoHdr.SetRange("No.", DocumentNo);
            if not SalesCrmemoHdr.FindFirst() then
                exit;
            SalesCrmemoHdr.SetRecFilter();
            RecRef.GetTable(SalesCrmemoHdr);
        end;
        // REPORT “SAVEAS” and BLOBExport
        REPORT.SAVEAS(ReportId, '', REPORTFORMAT::Pdf, Out, RecRef);
        FileManagement.BLOBExport(TempBlob_lRec, STRSUBSTNO('%1.Pdf', DocumentNo), TRUE);
    end;

    var
        SearchDirectory: Text[50];
        ReportType: Option Invoice,"Credit Note";
        DiffFolder: Boolean;
        SingleIns: Codeunit "Single Instance";
        OldReport: Boolean;
    // FileName: Text;
    // RepInstream: InStream;
    // RepOutStream: OutStream;
}

