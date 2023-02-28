page 50114 "Collection Detail Card-Develop"
//PANDU Changed id from 60002 50114
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
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                }
                field(Location; Rec.Location)
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = "Cheque No.Enable";
                    Visible = false;
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
                    Enabled = "Cheque No.Enable";
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
                        if (Rec."Client ID" = '') then
                            Error('Select Client ID');

                        if (Rec."Client Bank ID" = '') then
                            Error('Select Client Bank ID');

                        if (Rec."Client Bank City" = '') then
                            Error('Select Client Bank City');

                        if (Rec."Deposit Bank" = '') then
                            Error('Select Deposit Bank');

                        if (Rec."Cheque Date" = 0D) then
                            Error('Select Cheque Date');

                        if (Rec."Cheque Amount" = 0) then
                            Error('Please select the Cheque Amount');

                        if Rec.Total <> Rec."Bank Charges" + Rec."TDS Amount" + Rec."Cheque Amount" then
                            Error('Please check the total again');

                        if Rec."Mode of Payment" = Rec."Mode of Payment"::Cheque then begin
                            if StrLen(Rec."Cheque No.") <> 7 then
                                Error('Cheque No should be 7 character long');
                        end;

                        if Rec."Mode of Payment" = Rec."Mode of Payment"::DD then begin
                            if StrLen(Rec."Cheque No.") <> 7 then
                                Error('Cheque No should be 7 character long');
                        end;

                        if (Rec."Client ID" = 'C00040') and (Rec."New Client Name" = '') then
                            Error('Enter New Client Name');

                        "Sales&Receivable".Get;
                        Rec.Submitted := true;
                        //"On Submit Receipt No." := "Receipt No.";
                        if Rec."Company Head" = Rec."Company Head"::LKS then
                            //SubmitCollRecptNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."LKS Collection No.",0D,TRUE);
                             Rec."No. Series Division" := Rec."No. Series Division"::RLKS;
                        if Rec."Company Head" = Rec."Company Head"::VLK then
                            //SubmitCollRecptNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VLK Collection No.",0D,TRUE);
                            Rec."No. Series Division" := Rec."No. Series Division"::RVLK;
                        if Rec."Company Head" = Rec."Company Head"::VSH then
                            //SubmitCollRecptNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VSH Collection No.",0D,TRUE);
                            Rec."No. Series Division" := Rec."No. Series Division"::RVSH;
                        SubmitCollRecptNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."Collection No. Series", 0D, true);
                        Rec."On Submit Receipt No." := SubmitCollRecptNo;
                        Rec.Modify;

                        /*
                        Submitted := TRUE;
                        "On Submit Receipt No." := "Receipt No.";
                        MODIFY;
                        */

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


    procedure EnableDisableFields()
    begin
        /*
        IF Submitted = TRUE THEN
          "Amount.Enable" := FALSE
        ELSE
          "Amount.Enable" := TRUE;
        */
        if Rec.Submitted = true then
            "Cheque No.Enable" := false
        else
            "Cheque No.Enable" := true;

    end;


    procedure NameEnabled()
    begin
        if Rec."Unknown Client Name" = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

