page 50074 "Expense Detail Card"
{
    PageType = Card;
    SourceTable = "Expense Detail";

    layout
    {
        area(content)
        {
            group("Expense Entry")
            {
                field("Expense Voucher No."; Rec."Expense Voucher No.")
                {
                    ApplicationArea = All;
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
                field("Voucher Date"; Rec."Voucher Date")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("External Document Date"; Rec."External Document Date")
                {
                    ApplicationArea = All;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                }
                field("Expense Account"; Rec."Expense Account")
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Expense Account 1"; Rec."Expense Account 1")
                {
                    ApplicationArea = All;
                }
                field("Exp Account Name1"; Rec."Exp Account Name1")
                {
                    ApplicationArea = All;
                }
                field("Expense Amount 1"; Rec."Expense Amount 1")
                {
                    ApplicationArea = All;
                }
                field("Exp Account Name2"; Rec."Exp Account Name2")
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
                field("Exp Account Name3"; Rec."Exp Account Name3")
                {
                    ApplicationArea = All;
                }
                field("Expense Amount 3"; Rec."Expense Amount 3")
                {
                    ApplicationArea = All;
                }
                field("TDS Account No"; Rec."TDS Account No")
                {
                    ApplicationArea = All;
                }
                field("TDS Account Name"; Rec."TDS Account Name")
                {
                    ApplicationArea = All;
                }
                field("TDS Amount"; Rec."TDS Amount")
                {
                    ApplicationArea = All;
                }
                field("Party Type"; Rec."Party Type")
                {
                    ApplicationArea = All;
                }
                field("Amount Debit"; Rec."Amount Debit")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Balance Account No."; Rec."Balance Account No.")
                {
                    ApplicationArea = All;
                }
                field("Balance Account Type"; Rec."Balance Account Type")
                {
                    ApplicationArea = All;
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                    ApplicationArea = All;
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
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
                field("Case id No."; Rec."Case id No.")
                {
                    ApplicationArea = All;
                }
                field("Entity Code"; Rec."Entity Code")
                {
                    ApplicationArea = All;
                }
                field("Entity Name"; Rec."Entity Name")
                {
                    ApplicationArea = All;
                }
                field(Posted; rec.Posted)
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Bal. Acc. Description"; Rec."Bal. Acc. Description")
                {
                    ApplicationArea = All;
                }
                field(Submitted; rec.Submitted)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(Naration; rec.Naration)
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Party Code"; Rec."Party Code")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Code';
                }
                field("On Submit Expense No"; Rec."On Submit Expense No")
                {
                    ApplicationArea = All;
                }
            }
            part(ExpenseDetail; "Expense Comment Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Voucher No." = FIELD("Expense Voucher No."),
                              "Company Head" = FIELD("Company Head"),
                              Division = FIELD(Division);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Action1000000053)
            {
                Caption = 'Submit';
                action(Submit)
                {
                    ApplicationArea = All;
                    Caption = 'Submit';
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Expamt := rec."Expense Amount" + rec."Expense Amount 1" + rec."Expense Amount 2" + rec."Expense Amount 3" + rec."Service Tax Amount";
                        TDSAmt := rec."TDS Amount" + rec."Amount (LCY)";

                        if Expamt <> TDSAmt then
                            Error('please check the amount');
                        if rec."Expense Account" = '' then
                            Error('Expense Account cannot be blank');
                        /*
                        If "Party Type" <> "Party Type" :: ""Then
                           Error('Party type cannot be blank');
                        
                        If "TDS Account No" = '' Then
                           Error('TDS Account No cannot be blank');
                        
                        IF "TDS Account No" = '' THEN
                           ERROR('TDS Account No. cannot be blank');
                        */
                        if rec."Balance Account No." = '' then
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
                        if rec."Voucher Date" = 0D then
                            Error('Please Enter Voucher Date');
                        //IF "Case id No." = '' THEN
                        //   ERROR('Case id Cannot be blank');

                        if rec."Mode of Payment" = rec."Mode of Payment"::Cheque then begin
                            if StrLen(rec."Cheque No.") <> 7 then
                                Error('Cheque No should be 7 character long');
                        end;
                        /*
                        REPEAT
                        Submitted := TRUE;
                        MODIFY;
                        UNTIL NEXT=0;
                        */
                        /*
                        "Sales&Receivable".GET;
                        Submitted := TRUE;
                        //"On Submit Receipt No." := "Receipt No.";
                          IF "Company Head" = "Company Head"::LKS THEN
                            //CollRecptNo := 'RLKS-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."LKS Expense No.",0D,TRUE);
                          IF "Company Head" = "Company Head"::VLK THEN
                            //CollRecptNo := 'RVLK-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VLK Expense No.",0D,TRUE);
                          IF "Company Head" = "Company Head"::VSH THEN
                            //CollRecptNo := 'RVSH-1213-00001';
                            SubmitExpenseNo := NoSeriesMgt.GetNextNo("Sales&Receivable"."VSH Expense No.",0D,TRUE);
                        "On Submit Expense No." := SubmitExpenseNo;
                        */
                        rec.Modify;

                    end;
                }
                action("Comment Line")
                {
                    ApplicationArea = All;
                    Caption = 'Comment Line';
                    Visible = false;
                }
                action("Calculate Amount")
                {
                    ApplicationArea = All;
                    Image = "Action";
                    Promoted = true;

                    trigger OnAction()
                    begin
                        rec.Amount := (rec."Amount Debit" + rec."Expense Amount 1" + rec."Expense Amount 2" + rec."Expense Amount 3") - rec."TDS Amount";
                    end;
                }
                separator(Action1000000050)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EnableDisableFields;
    end;

    trigger OnInit()
    begin
        "Amount.Enable" := true;
    end;

    var
        "Amount.Enable": Boolean;
        Expamt: Decimal;
        TDSAmt: Decimal;
        SubmitExpenseNo: Code[20];
        "Sales&Receivable": Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure EnableDisableFields()
    begin
        if rec.Submitted = true then
            "Amount.Enable" := false
        else
            "Amount.Enable" := true;
    end;
}

