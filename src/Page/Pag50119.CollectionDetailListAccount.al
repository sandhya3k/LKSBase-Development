page 50119 "Collection Detail List Account"
{
    CardPageID = "Collection Detail Card-Account";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Collection Detail";
    SourceTableView = SORTING("On Submit Receipt No.")
                      ORDER(Ascending) where(Submitted = filter(true));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Series Division"; Rec."No. Series Division")
                {
                    ApplicationArea = All;
                }
                field("On Submit Receipt No."; Rec."On Submit Receipt No.")
                {
                    ApplicationArea = All;
                    Caption = 'Receipt No.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                }
                field(Division; rec.Division)
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Deposit Date"; Rec."Deposit Date")
                {
                    ApplicationArea = All;
                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                }
                field("Voucher No. of Navision"; Rec."Voucher No. of Navision")
                {
                    ApplicationArea = All;
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
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = All;
                }
                field("Cheque Amount LCY"; Rec."Cheque Amount LCY")
                {
                    ApplicationArea = All;
                    Caption = 'Amount in INR';
                }
                field("New Client Name"; Rec."New Client Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Error('You cannot delete records');
    end;

    var
        "Amount.Enable": Boolean;
        Text00001: Label 'Do you want to approve %1 as duplicate?';
        Text00002: Label 'Do you want to clear %1 as from duplicate list?';
        UserPermission: Record "User Setup";


    procedure EnableDisableFields()
    begin
        if rec.Submitted = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}