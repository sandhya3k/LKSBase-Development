// pageextension 50017 pageextension50017 extends "Posted Sales Invoice"
// {
//     layout
//     {//TBD
//      /*
//      modify("Free Supply")
//      {
//          Visible = false;
//      }
//      modify("Cancel Reason")
//      {
//          Visible = false;
//      }
//      addafter("Salesperson Code")
//      {
//          field("Invoice Type"; Rec."Invoice Type")
//          {ApplicationArea = All;
//          }
//      }
//      */
//      //TBD

//         addafter("Tax Info")
//         {
//             // field("Cancel Reason"; Rec."Cancel Reason")
//             // {
//             //     ApplicationArea = All;
//             // }
//             part("E-Invoice"; "E-Invoicing Information")
//             {
//                 ApplicationArea = All;
//                 SubPageLink = "No." = FIELD("No.");
//             }

//         }

//     }
//     actions
//     {

//         addfirst("&Invoice")
//         {
//             action("API Authentication Test")
//             {
//                 ApplicationArea = All;
//                 Ellipsis = true;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 PromotedIsBig = true;
//                 trigger OnAction()
//                 var
//                     EInvoiceCreate: Codeunit "E-Invoice Generation";
//                 begin
//                     EInvoiceCreate.AuthenticateCredentials('07AAAFL1585H1ZD');
//                     Message('The Authentication validation completed');
//                 end;

//             }
//             action("Reset IRN")
//             {
//                 ApplicationArea = All;
//                 Ellipsis = true;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 PromotedIsBig = true;
//                 trigger OnAction()
//                 var
//                     SalesInvExtended: Record "Posted Sales Extended";
//                 begin
//                     SalesInvExtended.Reset();
//                     if SalesInvExtended.get(SalesInvExtended."Posted Document Type"::Invoice, rec."No.") then begin
//                         SalesInvExtended."IRN No." := '';
//                         SalesInvExtended.Modify(true);
//                     end;
//                     Message('IRN has been cleared for document %1 and IRN No: %2', SalesInvExtended."No.", SalesInvExtended."IRN No.");

//                 end;

//             }

//             action("Create IRN")
//             {
//                 ApplicationArea = All;
//                 Ellipsis = true;
//                 Enabled = CreateIRN;
//                 Image = CreateElectronicReminder;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     RespQueue: Record "LCMS Response Queue";
//                     EInvoiceGeneration: Codeunit "E-Invoice Generation";
//                 begin
//                     //TBD
//                     if Ship2Add.Get(rec."Sell-to Customer No.", rec."Ship-to Code") then;
//                     if (rec."Posting Date" >= 20210101D) and not (Ship2Add."Transaction Type" in [Ship2Add."Transaction Type"::B2C]) then begin
//                         if Confirm('Do you want to create IRN No.?') then begin
//                             Clear(EInvoiceGeneration);
//                             Clear(LocR);
//                             if LocR.Get(rec."Location Code") then;
//                             SalesInvoiceHdrExtend.Reset;
//                             SalesInvoiceHdrExtend.SetRange("No.", rec."No.");
//                             if SalesInvoiceHdrExtend.FindFirst then;
//                             if SalesInvoiceHdrExtend."IRN No." = '' then begin
//                                 EInvoiceGeneration.AuthenticateCredentials(LocR."GST Registration No.");
//                                 EInvoiceGeneration.GenerateInvoiceIRNNumberUpdated(Rec);

//                                 SalesInvoiceHdrExtend.Reset;
//                                 SalesInvoiceHdrExtend.SetRange("No.", rec."No.");
//                                 if SalesInvoiceHdrExtend.FindFirst then;
//                                 if SalesInvoiceHdrExtend."IRN No." <> '' then begin
//                                     //InvDoc := rec.PostedInvoiceLink(rec."No.");
//                                     RespQueue.CreateQueue(Rec."Pre-Assigned No.");
//                                     Rec.PostedInvoiceLink(Rec."No.", RespQueue);
//                                     //LKS := LKS.LKSFunctions();
//                                     if rec."Currency Factor" <> 0 then
//                                         ExchangRate := 1 / rec."Currency Factor"
//                                     else
//                                         ExchangRate := 1;
//                                     InvoiceDateTime := CreateDateTime(rec."Posting Date", Time);
//                                     //MESSAGE(FORMAT(LKS.RTBUpdate("Pre-Assigned No.",'BL',"No.",FORMAT(InvoiceDateTime,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
//                                     //,FORMAT(ExchangRate),InvDoc,'')));
//                                     RespQueue.RTBPayload(Rec."Pre-Assigned No.", 'BL', Rec."No.", FORMAT(InvoiceDateTime, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
//                                     , FORMAT(ExchangRate), '', '');
//                                     RespQueue.Insert(true);
//                                 end else
//                                     Message('IRN No. %1 already generated.', SalesInvoiceHdrExtend."IRN No.");
//                             end;
//                         end;
//                         exit;
//                     end else begin
//                         Message('IRN is not needed for B2C customer type');
//                         //InvDoc := rec.PostedInvoiceLink(rec."No.");
//                         RespQueue.CreateQueue(Rec."Pre-Assigned No.");
//                         rec.PostedInvoiceLink(rec."No.", RespQueue);
//                         //LKS := LKS.LKSFunctions();
//                         if rec."Currency Factor" <> 0 then
//                             ExchangRate := 1 / rec."Currency Factor"
//                         else
//                             ExchangRate := 1;
//                         InvoiceDateTime := CreateDateTime(rec."Posting Date", Time);//TEAM::1426
//                                                                                     //MESSAGE(FORMAT(LKS.RTBUpdate("Pre-Assigned No.",'BL',"No.",FORMAT(InvoiceDateTime,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
//                                                                                     //MESSAGE(FORMAT(LKS.RTBUpdate("Pre-Assigned No.",'BL',"No.",FORMAT("Posting Date",0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
//                                                                                     //,FORMAT(ExchangRate),InvDoc,'')));
//                         RespQueue.RTBPayload(Rec."Pre-Assigned No.", 'BL', Rec."No.", FORMAT(InvoiceDateTime, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), FORMAT(ExchangRate), '', '');
//                         RespQueue.Insert(true);
//                     end;

//                 end;
//             }
//         }
//         addafter("Email")
//         {

//             action("Print Tax Invoice")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Tax Invoice';
//                 Image = "Report";

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::"MEMO OF FEES VS-NewS", true, true, SalesInvHeader);
//                 end;
//             }
//             action("Print Tax Invoice GST")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Tax Invoice GST';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     if rec."Shortcut Dimension 1 Code" <> '1' then
//                         Error('Please select Branch Invoice.');
//                     if Ship2Add.Get(rec."Sell-to Customer No.", rec."Ship-to Code") then;
//                     if (rec."Posting Date" >= 20210101D) and not (Ship2Add."Transaction Type" in [Ship2Add."Transaction Type"::B2C]) then begin
//                         SalesInvoiceHdrExtend.Reset;
//                         SalesInvoiceHdrExtend.SetRange("No.", rec."No.");
//                         if SalesInvoiceHdrExtend.FindFirst then;
//                         SalesInvoiceHdrExtend.TestField("IRN No.");
//                         SalesInvHeader.Reset;
//                         SalesInvHeader.SetRange("No.", rec."No.");
//                         REPORT.RunModal(REPORT::"Tax Invoice GST", true, true, SalesInvHeader);
//                     end else begin
//                         SalesInvHeader.Reset;
//                         SalesInvHeader.SetRange("No.", rec."No.");
//                         REPORT.RunModal(REPORT::"Tax Invoice GST", true, true, SalesInvHeader);
//                     end;
//                 end;
//             }
//             action("IBL Tax Invoice GST")
//             {
//                 ApplicationArea = All;
//                 Caption = 'IBL Tax Invoice GST';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::"IBL Tax Invoice GST", true, true, SalesInvHeader);
//                 end;
//             }
//             action("VLK Tax Invoice GST")
//             {
//                 ApplicationArea = All;
//                 Caption = 'VLK Tax Invoice GST';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::"VLK Tax Invoice GST", true, true, SalesInvHeader);
//                 end;
//             }
//             action("VSH Tax Invoice GST")
//             {
//                 ApplicationArea = All;
//                 Caption = 'VSH Tax Invoice GST';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::"VSH Tax Invoice GST", true, true, SalesInvHeader);
//                 end;
//             }
//             action("Print Branch Invoice GST")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Branch Invoice GST';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     if rec."Shortcut Dimension 1 Code" = '1' then
//                         Error('Please select Tax Invoice.');

//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::"Branch Tax Invoice GST", true, true, SalesInvHeader);
//                 end;
//             }
//             action("Print Branch Invoice GST Copy")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Branch Invoice GST Copy';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     if rec."Shortcut Dimension 1 Code" = '1' then
//                         Error('Please select Tax Invoice.');

//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(80000, true, true, SalesInvHeader);
//                 end;
//             }
//             action("<Action1500033>")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Inv. IBL';
//                 Image = Print;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::INVOICE_IBL_FINAL, true, true, SalesInvHeader);
//                 end;
//             }
//             action("<Action1500034>")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Memo of Fee VS';
//                 Image = Print;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::INVOICE_VS, true, true, SalesInvHeader);
//                 end;
//             }
//             action("<Action1500035>")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Memo of Fee VLK';
//                 Image = Print;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(REPORT::INVOICE_VLK, true, true, SalesInvHeader);
//                 end;
//             }
//             action("Print Tax Invoice Logo")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Tax Invoice Logo';
//                 Image = Print;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(50170, true, true, SalesInvHeader);
//                 end;
//             }
//             action("Print Branch Tax Invoice Logo")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Branch Tax Invoice Logo';
//                 Image = PrintVAT;

//                 trigger OnAction()
//                 var
//                     SalesInvHeader: Record "Sales Invoice Header";
//                 begin
//                     SalesInvHeader.Reset;
//                     SalesInvHeader.SetRange("No.", rec."No.");
//                     REPORT.RunModal(50171, true, true, SalesInvHeader);
//                 end;
//             }
//         }
//         //TBD
//         /*
//         addafter(IncomingDocAttachFile)
//         {
//             action(Temp)
//             {ApplicationArea = All;

//                 trigger OnAction()
//                 var
//                     FileRec: Record File;
//                     NameT: Text[30];
//                 begin
//                     FileRec.Reset;
//                     FileRec.SetRange(Path, 'C:\SalesInvoices_CreditNote\');
//                     //FileRec.SETFILTER(Name,"No."+'.pdf');
//                     FileRec.SetRange("Is a file", true);
//                     Message('%1', FileRec.Count);
//                     if FileRec.FindFirst then;

//                     NameT := FileRec.Name;
//                     NameT := ConvertStr(NameT, '.', ',');
//                     NameT := SelectStr(1, NameT);
//                     Message(NameT);
//                 end;
//             }
//         }
//         */
//     }

//     var
//         SalesInvoiceHdrExtend: Record "Posted Sales Extended";
//         LocR: Record Location;
//         RTBNo: Code[20];
//         RTBState: Text[20];
//         InvoiceNo: Text[20];
//         InvGenDate: DateTime;
//         InvDoc: Text[100];
//         Rejreason: Text[250];
//         InvConvRate: Text[20];
//         ExchangRate: Decimal;
//         PostedSalesExt: Record "Posted Sales Extended";
//         InvoiceDateTime: DateTime;
//         CreateIRN: Boolean;
//         Ship2Add: Record "Ship-to Address";


//     //Unsupported feature: Code Insertion on "OnInit".

//     //trigger OnInit()
//     //Parameters and return type have not been exported.
//     //begin
//     /*
//     CreateIRN:=false;
//     */
//     //end;

//     trigger OnOpenPage()
//     begin
//         if rec."Shortcut Dimension 1 Code" = '1' then
//             CreateIRN := true
//         else
//             CreateIRN := false;
//     end;
// }

