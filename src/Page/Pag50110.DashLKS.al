page 50110 Dash_LKS
{
    Caption = 'Approval For RTB CRTB';
    PageType = CardPart;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            cuegroup(Control1000000001)
            {
                ShowCaption = false;
                field(RTB; NoOfRTB)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Clear(RTBList);
                        SalesH.Reset;
                        SalesH.SetFilter("Document Type", '%1', SalesH."Document Type"::Invoice);
                        RTBList.LookupMode(true);
                        RTBList.SetTableView(SalesH);
                        if RTBList.RunModal = ACTION::LookupOK then begin
                            RTBList.GetRecord(SalesH);
                        end;
                    end;
                }
                field("Cancelled RTB"; Cancelled_RTB)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Clear(CancelledP);
                        SalesH.Reset;
                        SalesH.SetFilter("Document Type", '%1', SalesH."Document Type"::Invoice);
                        CancelledP.LookupMode(true);
                        CancelledP.SetTableView(SalesH);
                        if CancelledP.RunModal = ACTION::LookupOK then begin
                            CancelledP.GetRecord(SalesH);
                        end;
                    end;
                }
                field(CRTB; NoOfCRTB)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Clear(CRTBList);
                        SalesH.Reset;
                        SalesH.SetFilter("Document Type", '%1', SalesH."Document Type"::"Credit Memo");
                        CRTBList.LookupMode(true);
                        CRTBList.SetTableView(SalesH);
                        if CRTBList.RunModal = ACTION::LookupOK then begin
                            CRTBList.GetRecord(SalesH);
                        end;
                    end;
                }
                field("Cancelled CRTB"; Cancelled_CRTB)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Clear(Cancelled_CRList);
                        SalesH.Reset;
                        SalesH.SetFilter("Document Type", '%1', SalesH."Document Type"::"Credit Memo");
                        Cancelled_CRList.LookupMode(true);
                        Cancelled_CRList.SetTableView(SalesH);
                        if Cancelled_CRList.RunModal = ACTION::LookupOK then begin
                            Cancelled_CRList.GetRecord(SalesH);
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        NoOfRTB := RTBCount;
        Cancelled_RTB := CancelledRTBCount;
        NoOfCRTB := CrtbCount;
        Cancelled_CRTB := CancelledCRTBCount;
    end;

    var
        NoOfRTB: Integer;
        Cancelled_RTB: Integer;
        CancelledP: Page "Sales Invoice List-TRUE";
        RTBList: Page "Sales Invoice List";
        SalesH: Record "Sales Header";
        NoOfCRTB: Integer;
        Cancelled_CRTB: Integer;
        CRTBList: Page "Sales Credit Memos";
        Cancelled_CRList: Page "Sales Credit Memos-TRUE";


    procedure RTBCount(): Integer
    var
        SalesHdr_RTB: Record "Sales Header";
    begin
        with SalesHdr_RTB do begin
            SetFilter("Document Type", '%1', SalesHdr_RTB."Document Type"::Invoice);
            SetFilter(Cancelled, '%1', false);
            exit(SalesHdr_RTB.Count);
        end;
    end;


    procedure CancelledRTBCount(): Integer
    var
        SalesHdr_CRTB: Record "Sales Header";
    begin
        with SalesHdr_CRTB do begin
            SetFilter("Document Type", '%1', SalesHdr_CRTB."Document Type"::Invoice);
            SetFilter(Cancelled, '%1', true);
            exit(SalesHdr_CRTB.Count);
        end;
    end;


    procedure CrtbCount(): Integer
    var
        SalesH_Cr: Record "Sales Header";
    begin
        with SalesH_Cr do begin
            SetFilter("Document Type", '%1', SalesH_Cr."Document Type"::"Credit Memo");
            SetFilter(Cancelled, '%1', false);
            exit(SalesH_Cr.Count);
        end;
    end;


    procedure CancelledCRTBCount(): Integer
    var
        SalesHdr_CCr: Record "Sales Header";
    begin
        with SalesHdr_CCr do begin
            SetFilter("Document Type", '%1', SalesHdr_CCr."Document Type"::"Credit Memo");
            SetFilter(Cancelled, '%1', true);
            exit(SalesHdr_CCr.Count);
        end;
    end;
}

