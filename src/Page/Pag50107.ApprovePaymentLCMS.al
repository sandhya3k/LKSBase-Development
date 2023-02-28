page 50107 "Approve Payment LCMS"
{
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Approval For the LCMS";
    SourceTableView = WHERE(Status = CONST(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Rtb No"; Rec."Rtb No")
                {
                    ApplicationArea = All;
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = All;
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = All;
                }
                field("Payment Amount LCY"; Rec."Payment Amount LCY")
                {
                    ApplicationArea = All;
                }
                field("Payment Date time"; Rec."Payment Date time")
                {
                    ApplicationArea = All;
                }
                field("Payment Location"; Rec."Payment Location")
                {
                    ApplicationArea = All;
                }
                field(Unapply; Rec.Unapply)
                {
                    ApplicationArea = All;
                }
                field(Writeoff; Rec.Writeoff)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(Reversal; Rec.Reversal)
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("Applies Remaining Amount"; Rec."Applies Remaining Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Applied Amount';
                }
                field("Applies Remaining Amount LCY"; Rec."Applies Remaining Amount LCY")
                {
                    ApplicationArea = All;
                    Caption = 'Applied Amount LCY';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Creation Date-Time"; Rec."Creation Date-Time")
                {
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                }
                field("Aproved Date-Time"; Rec."Aproved Date-Time")
                {
                    ApplicationArea = All;
                }
                field("Unapplied By"; Rec."Unapplied By")
                {
                    ApplicationArea = All;
                }
                field("Unapplied Date-Time"; Rec."Unapplied Date-Time")
                {
                    ApplicationArea = All;
                }
                field("API status"; Rec."API status")
                {
                    ApplicationArea = All;
                }
                field("API Exception"; Rec."API Exception")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Approve Payment")
            {
                ApplicationArea = All;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    RespQueue: Record "LCMS Response Queue";
                    qwe: Page 9001;
                begin
                    CurrPage.SETSELECTIONFILTER(ApprovalFortheLCMS);
                    ApprovalFortheLCMS.MARKEDONLY(TRUE);
                    IF ApprovalFortheLCMS.FINDSET THEN
                        REPEAT
                            CLEAR(APIResponse);
                            //TBD // Var LKS: DotNet LKSFunctions;
                            //TBD 
                            /*
                            LKS := LKS.LKSFunctions();
                            IF ApprovalFortheLCMS.Writeoff THEN
                                APIResponse := FORMAT(LKS.PaidAmount(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", FALSE, TRUE))
                            ELSE
                                IF ApprovalFortheLCMS.Unapply THEN
                                    APIResponse := FORMAT(LKS.PaidAmount(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                    FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", TRUE, FALSE))
                                ELSE BEGIN
                                    APIResponse := FORMAT(LKS.PaidAmount(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                    FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", FALSE, FALSE));
                                END;
                            */
                            RespQueue.CreateQueue(ApprovalFortheLCMS."Rtb No");
                            IF ApprovalFortheLCMS.Writeoff THEN
                                RespQueue.PaymentPayload(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                    FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", FALSE, TRUE)
                            else
                                IF ApprovalFortheLCMS.Unapply THEN
                                    RespQueue.PaymentPayload(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                           FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", TRUE, FALSE)
                                else
                                    RespQueue.PaymentPayload(ApprovalFortheLCMS."Rtb No", ApprovalFortheLCMS."Applies Remaining Amount", ApprovalFortheLCMS."Applies Remaining Amount LCY",
                                            FORMAT(ApprovalFortheLCMS."Payment Date time", 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>'), ApprovalFortheLCMS."Payment Location", FALSE, FALSE);
                            RespQueue.Insert(true);
                            // TBD
                            /*
                                                        IF ApprovalFortheLCMS.Writeoff THEN
                                                            IF UPPERCASE(APIResponse) = 'SUCCESS' THEN BEGIN
                                                                ApprovalFortheLCMS."API status" := ApprovalFortheLCMS."API status"::Success;
                                                                ApprovalFortheLCMS."Approved By" := USERID;
                                                                ApprovalFortheLCMS."Aproved Date-Time" := CURRENTDATETIME;
                                                                ApprovalFortheLCMS.Status := ApprovalFortheLCMS.Status::Approved;
                                                            END ELSE BEGIN
                                                                ApprovalFortheLCMS."Approved By" := USERID;
                                                                ApprovalFortheLCMS."Aproved Date-Time" := CURRENTDATETIME;
                                                                ApprovalFortheLCMS."API status" := ApprovalFortheLCMS."API status"::Failed;
                                                                ApprovalFortheLCMS."API Exception" := COPYSTR(APIResponse, 1, 250);
                                                            END;
                                                            */
                            ApprovalFortheLCMS.MODIFY;
                        UNTIL ApprovalFortheLCMS.NEXT = 0;
                end;
            }
        }
    }

    var
        ApprovalFortheLCMS: Record "Approval For the LCMS";
        APIResponse: Text;
}

