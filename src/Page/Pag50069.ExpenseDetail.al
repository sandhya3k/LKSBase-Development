page 50069 "Expense Detail"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Expense Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Voucher No."; Rec."Expense Voucher No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field(Division; rec.Division)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Voucher Date"; Rec."Voucher Date")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("External Document Date"; Rec."External Document Date")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Expense Account"; Rec."Expense Account")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Party Type"; Rec."Party Type")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Amount Debit"; Rec."Amount Debit")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Amount Credit"; Rec."Amount Credit")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Balance Account Type"; Rec."Balance Account Type")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Balance Account No."; Rec."Balance Account No.")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Bal. Acc. Description"; Rec."Bal. Acc. Description")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Case id No."; Rec."Case id No.")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Entity Code"; Rec."Entity Code")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Entity Name"; Rec."Entity Name")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("<Action1029>")
            {
                action(Submit)
                {
                    ApplicationArea = All;

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

    trigger OnInit()
    begin
        //"Amount.Enable" := TRUE;
    end;

    var
        "Amount.Enable": Boolean;


    procedure EnableDisableFields()
    begin
        if rec.Submitted = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

