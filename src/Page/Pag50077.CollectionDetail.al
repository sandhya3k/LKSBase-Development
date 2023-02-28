page 50077 "Collection Detail"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Collection Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Division; rec.Division)
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Client Bank ID"; Rec."Client Bank ID")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Client Bank City"; Rec."Client Bank City")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Deposit Bank"; Rec."Deposit Bank")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Cheque Amount"; Rec."Cheque Amount")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field(Currency; rec.Currency)
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Cheque Amount LCY"; Rec."Cheque Amount LCY")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("TDS Amount"; Rec."TDS Amount")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("TDS %"; Rec."TDS %")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Deposit Date"; Rec."Deposit Date")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Dishonour Date"; Rec."Dishonour Date")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
                field("Client TAN"; Rec."Client TAN")
                {
                    ApplicationArea = All;
                    Editable = "Cheque No.Enable";
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Action129)
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
                        repeat
                            rec.Submitted := true;
                            rec.Modify;
                        until rec.Next = 0;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        EnableDisableFields;
    end;

    var
        "Cheque No.Enable": Boolean;


    procedure EnableDisableFields()
    begin
        if rec.Submitted = true then
            "Cheque No.Enable" := false
        else
            "Cheque No.Enable" := true;
    end;
}

