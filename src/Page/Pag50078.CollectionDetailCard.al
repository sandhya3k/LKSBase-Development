page 50078 "Collection Detail Card"
{
    PageType = Card;
    SourceTable = "Collection Detail";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("No. Series Division"; Rec."No. Series Division")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("On Submit Receipt No."; Rec."On Submit Receipt No.")
                {
                    ApplicationArea = All;
                    Caption = 'Receipt No.';
                    Editable = false;
                }
                field(Division; rec.Division)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";

                    trigger OnValidate()
                    begin
                        if (rec."Client ID" = 'C00040') or (rec."Client ID" = 'C00040.') then
                            "CtrlNewClient.Editable" := true
                        else
                            "CtrlNewClient.Editable" := false;
                    end;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(City; rec.City)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field("Client Bank ID"; Rec."Client Bank ID")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field("Client Bank City"; Rec."Client Bank City")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Client Bank City Name"; Rec."Client Bank City Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field("Deposit Bank"; Rec."Deposit Bank")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Cheque Amount"; Rec."Cheque Amount")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field(Currency; rec.Currency)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";

                    trigger OnValidate()
                    begin
                        /*
                        IF (Currency ='INR') THEN
                          "CtrlNewClient.Editable" := TRUE
                        ELSE
                          "CtrlNewClient.Editable" := FALSE;
                         */

                    end;
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Cheque Amount LCY"; Rec."Cheque Amount LCY")
                {
                    ApplicationArea = All;
                    //3ktsandhya16022023
                    //Editable = false;


                }
                field("TDS Amount"; Rec."TDS Amount")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("TDS %"; Rec."TDS %")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Deposit Date"; Rec."Deposit Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field("Dishonour Date"; Rec."Dishonour Date")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Client TAN"; Rec."Client TAN")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(Posted; rec.Posted)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if rec.Division <> rec.Division::IPR then
                            Error('Client is not IPR');

                        if rec.Posted = false then begin
                            Error('You cannot uncheck again');
                        end;
                    end;
                }
                field("Posted No."; Rec."Posted No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
                }
                field(Submitted; rec.Submitted)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
                }
                field("New Client Name"; Rec."New Client Name")
                {
                    ApplicationArea = All;
                    Editable = "CtrlNewClient.Editable";
                    Enabled = "Cheque No.Enable";
                }
                field("Bank Charges"; Rec."Bank Charges")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
                }
                field(Total; rec.Total)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
            }
            part(CollectionDetai; "Coll.Exp. Comment Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Voucher No." = FIELD("Receipt No."),
                              "Company Head" = FIELD("Company Head"),
                              Division = FIELD(Division);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Action1000000034)
            {
                Caption = 'Submit';
                action(Submit)
                {
                    ApplicationArea = All;
                    Ellipsis = true;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CollectionDetail: Record "Collection Detail";
                    begin
                        Rec.LockTable;
                        if Rec."Mode of Payment" in [rec."Mode of Payment"::Cheque, rec."Mode of Payment"::DD] then begin
                            CollectionDetail.Reset;
                            CollectionDetail.SetFilter("Receipt No.", '<>%1', rec."Receipt No.");
                            CollectionDetail.SetRange("Cheque No.", rec."Cheque No.");
                            CollectionDetail.SetFilter("Client ID", rec."Client ID");
                            CollectionDetail.SetFilter("Client Bank ID", rec."Client Bank ID");
                            CollectionDetail.SetRange("Cheque Date", rec."Cheque Date");
                            CollectionDetail.SetRange("Cheque Amount", rec."Cheque Amount");
                            if CollectionDetail.FindFirst then
                                Error('Please check the cheque no., as it can not be duplicated');
                        end;

                        if Rec."On Submit Receipt No." <> '' then
                            Error('Record already submitted');

                        if (Rec."Client ID" = '') then
                            Error('Select Client ID');

                        if (rec."Client Bank ID" = '') then
                            Error('Select Client Bank ID');

                        if (rec."Client Bank City" = '') then
                            Error('Select Client Bank City');

                        if (rec."Deposit Bank" = '') then
                            Error('Select Deposit Bank');

                        if (rec."Cheque Date" = 0D) then
                            Error('Select Cheque Date');

                        if (rec."Cheque Amount" = 0) then
                            Error('Please select the Cheque Amount');

                        if rec.Total <> rec."Bank Charges" + rec."TDS Amount" + rec."Cheque Amount" then
                            Error('Please check the total again');

                        if rec."Mode of Payment" = rec."Mode of Payment"::Cheque then begin
                            if StrLen(rec."Cheque No.") <> 7 then
                                Error('Cheque No should be 7 character long');
                        end;

                        if rec."Mode of Payment" = rec."Mode of Payment"::WireTransfer then begin
                            if rec."Cheque No." = '' then
                                Error('Please Insert Wire Transfer Reff. No.');
                        end;

                        if rec."Mode of Payment" = rec."Mode of Payment"::DD then begin
                            if StrLen(rec."Cheque No.") <> 7 then
                                Error('DD No should be 7 character long');
                        end;

                        if (rec."Client ID" = 'C00040') and (rec."New Client Name" = '') then
                            Error('Enter New Client Name');

                        if rec.Cancel = true then
                            Error('You cannot submit the record.As the record is already been cancelled.');

                        "Sales&Receivable".Get;
                        if rec."Company Head" = rec."Company Head"::LKS then
                            rec."No. Series Division" := rec."No. Series Division"::RLKS;
                        if rec."Company Head" = rec."Company Head"::VLK then
                            rec."No. Series Division" := rec."No. Series Division"::RVLK;
                        if rec."Company Head" = rec."Company Head"::VSH then
                            rec."No. Series Division" := rec."No. Series Division"::RVSH;
                        SubmitCollRecptNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."Collection No. Series", 0D, true);
                        rec."On Submit Receipt No." := SubmitCollRecptNo;
                        rec.Submitted := true;
                        rec.Modify;
                        //Submitted := TRUE;
                    end;
                }
                action(Cancel)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if rec.Submitted = true then
                            Error('You cannot cancel the records, As record is already submitted');

                        rec.Cancel := true;
                        rec.Modify;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EnableDisableFields;
        //NameEnabled;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        Error('You cannot delete records');
    end;

    trigger OnInit()
    begin
        "Cheque No.Enable" := true;
        //"Amount.Enable" := TRUE;
    end;

    var
        "Amount.Enable": Boolean;
        "Cheque No.Enable": Boolean;
        CollDetail: Record "Collection Detail";
        SubmitCollRecptNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CollDetailNew: Record "Collection Detail";
        CollectionDetail: Record "Collection Detail";
        "Sales&Receivable": Record "Sales & Receivables Setup";
        "CtrlFld.Editable": Boolean;
        "CtrlNewClient.Editable": Boolean;


    procedure EnableDisableFields()
    begin
        /*
        IF Submitted = TRUE THEN
          "Amount.Enable" := FALSE
        ELSE
          "Amount.Enable" := TRUE;
        */
        if rec.Submitted = true then
            "Cheque No.Enable" := false
        else
            "Cheque No.Enable" := true;

    end;


    procedure NameEnabled()
    begin
        if rec."Unknown Client Name" = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

