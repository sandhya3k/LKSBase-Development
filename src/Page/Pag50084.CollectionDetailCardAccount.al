page 50084 "Collection Detail Card-Account"
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
                field("On Submit Receipt No."; Rec."On Submit Receipt No.")
                {
                    ApplicationArea = All;
                    Caption = 'Receipt No.';
                    Editable = false;
                }
                field(Division; Rec.Division)
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
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(Address; Rec.Address)
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
                field(City; Rec.City)
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
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                }
                field("Cheque Amount"; Rec."Cheque Amount")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Cheque Amount LCY"; Rec."Cheque Amount LCY")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Enabled = "Cheque No.Enable";
                    Visible = true;
                }
                field("Posted No."; Rec."Posted No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
                }
                field(Submitted; Rec.Submitted)
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
                    Enabled = "Cheque No.Enable";
                }
                field("Bank Charges"; Rec."Bank Charges")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
                }
                field(Total; Rec.Total)
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
                    begin
                        if Confirm(Text0001) then begin
                            if Rec.Submitted = false then
                                Rec.Submitted := true;
                            Rec.Modify;

                            Error('');
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //EnableDisableFields;
        //NameEnabled;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        Error('You cannot delete the records');
    end;

    trigger OnInit()
    begin
        //"Deposit Bank.Enable" :=TRUE;
        "Cheque No.Enable" := true;
        "Amount.Enable" := true;
    end;

    var
        "Amount.Enable": Boolean;
        "Cheque No.Enable": Boolean;
        CollDetail: Record "Collection Detail";
        SubmitCollRecptNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CollDetailNew: Record "Collection Detail";
        CollectionDetail: Record "Collection Detail";
        Text0001: Label 'Do you want to submit?';


    procedure EnableDisableFields()
    begin
        /*
        IF Submitted = TRUE THEN
          "Amount.Enable" := FALSE
        ELSE
          "Amount.Enable" := TRUE;
        
        IF Submitted = TRUE THEN
          "Cheque No.Enable" := FALSE
        ELSE
          "Cheque No.Enable" := TRUE;
         */

    end;


    procedure NameEnabled()
    begin
        if Rec."Unknown Client Name" = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

