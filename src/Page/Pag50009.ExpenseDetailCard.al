page 50009 "Expense Detail Card_"
{
    PageType = Card;
    SourceTable = "Expense Detail";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Expense Voucher No."; Rec."On Submit Expense No")
                {
                    ApplicationArea = All;
                }
                field("Expense Voucher"; Rec."Expense Voucher No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                field("Expense Amount"; Rec."Expense Amount")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Party Type"; Rec."Party Type")
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Party Code"; Rec."Party Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = "Amount.Enable";
                }
                field("Expense Account 1"; Rec."Expense Account 1")
                {
                    ApplicationArea = All;
                }
                field("Expense Amount 1"; Rec."Expense Amount 1")
                {
                    ApplicationArea = All;
                }
                field("Expense Account 2"; Rec."Expense Account 2")
                {
                    ApplicationArea = All;
                }
                field("Expense Amount 2"; Rec."Expense Amount 2")
                {
                    ApplicationArea = All;
                }
                field("Expense Account 3"; Rec."Expense Account 3")
                {
                    ApplicationArea = All;
                }
                field("Expense Amount 3"; Rec."Expense Amount 3")
                {
                    ApplicationArea = All;
                }
                field("Service Tax Account"; Rec."Service Tax Account")
                {
                    ApplicationArea = All;
                }
                field("Service Tax Amount"; Rec."Service Tax Amount")
                {
                    ApplicationArea = All;
                }
                field("TDS Account No"; Rec."TDS Account No")
                {
                    ApplicationArea = All;
                }
                field("TDS Amount"; Rec."TDS Amount")
                {
                    ApplicationArea = All;
                }
                field("Voucher Date"; Rec."Voucher Date")
                {
                    ApplicationArea = All;
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field(Naration; Rec.Naration)
                {
                    ApplicationArea = All;
                }
            }
            part(ExpenseDetail; "Expense Comment subform")
            {
                SubPageLink = "Voucher No." = FIELD("Expense Voucher No."),
                              "Company Head" = FIELD("Company Head"),
                              Division = FIELD(Division);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Action1000000030)
            {
                Caption = 'Submit';
                action(Submit)
                {
                    ApplicationArea = All;
                    Caption = 'Submit';

                    trigger OnAction()
                    begin
                        Expamt := Rec."Expense Amount" + Rec."Expense Amount 1" + Rec."Expense Amount 2" + Rec."Expense Amount 3" + Rec."Service Tax Amount";
                        TDSAmt := Rec."TDS Amount" + Rec.Amount;

                        if Expamt <> TDSAmt then
                            Error('please check the amount');
                        if Rec."Expense Account" = '' then
                            Error('Expense Account cannot be blank');
                        /*
                        If "Party Type" <> "Party Type" :: ""Then
                           Error('Party type cannot be blank');
                        
                        If "TDS Account No" = '' Then
                           Error('TDS Account No cannot be blank');
                        
                        IF "TDS Account No" = '' THEN
                           ERROR('TDS Account No. cannot be blank');
                        */
                        if Rec."Balance Account No." = '' then
                            Error('Balance Account No. cannot be blank');
                        /*
                        IF ("Balance Account Type"=1) AND ("Cheque No." <> '')THEN
                           ERROR('Please Remove Cheque No.');
                        
                        
                        IF ("Balance Account Type"=2) AND ("Cheque No." = '')THEN
                           ERROR('Enter Cheque No.');
                        
                        IF ("Balance Account Type"=2) AND
                         ("Cheque Date" = 0D ) THEN
                           ERROR('Cheque Date cannot be blank');
                        */
                        if Rec."Voucher Date" = 0D then
                            Error('Please Enter Voucher Date');
                        //IF "Case id No." = '' THEN
                        //   ERROR('Case id Cannot be blank');

                        if Rec."Mode of Payment" = Rec."Mode of Payment"::Cheque then begin
                            if StrLen(Rec."Cheque No.") <> 7 then
                                Error('Cheque No should be 7 character long');
                        end;

                        "Sales&Receivable".Get;
                        Rec.Submitted := true;
                        //"On Submit Receipt No." := "Receipt No.";
                        if Rec."Company Head" = Rec."Company Head"::LKS then
                            //CollRecptNo := 'RLKS-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."LKS Expense No.", 0D, true);
                        if Rec."Company Head" = Rec."Company Head"::VLK then
                            //CollRecptNo := 'RVLK-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VLK Expense No.", 0D, true);
                        if Rec."Company Head" = Rec."Company Head"::VSH then
                            //CollRecptNo := 'RVSH-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VSH Expense No.", 0D, true);
                        Rec."On Submit Expense No" := SubmitExpenseNo;
                        Rec.Modify;


                        repeat
                            Rec.Submitted := true;
                            Rec.Modify;
                        until Rec.Next = 0;

                    end;
                }
                action("Comment Line")
                {
                    ApplicationArea = All;
                    Caption = 'Comment Line';
                    Visible = false;
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
        Expamt: Decimal;
        TDSAmt: Decimal;
        "Sales&Receivable": Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SubmitExpenseNo: Code[20];


    procedure EnableDisableFields()
    begin
        if Rec.Submitted = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

