pageextension 50110 pageextension50110 extends "General Journal"
{
    layout
    {
        //#122
        // modify(Description)
        // {
        //     Visible = false;
        // }

        addafter("Document No.")
        {
            // field("Description 3"; Rec."Description 3 ")
            // {
            //     Caption = 'Description';
            //     ApplicationArea = all;
            // }
        }
        //#122
        modify("Cheque No.")
        {
            Visible = false;
        }
        addbefore("Cheque Date")
        {
            field("Cheque No. 2"; Rec."Cheque No. 2")
            {
                Caption = 'Cheque No.';
                ApplicationArea = all;
            }

        }
        addafter("ShortcutDimCode8")
        {
            field("Group Head"; Rec."Group Head")
            {
                ApplicationArea = All;
            }
            field("Check Type"; Rec."Check Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Check Type field.';
            }
            field("External Doc. Date"; Rec."External Doc. Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External Doc. Date field.';
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
            field("Income Account"; Rec."Income Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Income Account field.';
            }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies this Ship-to-Code for the customer related transactions';
            }
            field("Inc. GST in TDS Base"; Rec."Inc. GST in TDS Base")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inc. GST in TDS Base field.';
            }
            field("Bank Charge"; Rec."Bank Charge")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether the entry is related to bank charges or not.';
            }
            field("Order Address State Code"; Rec."Order Address State Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order Address State Code field.';
            }
            field("Bill to-Location(POS)"; Rec."Bill to-Location(POS)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill to-Location(POS) field.';
            }
            field("GST TDS/TCS Base Amount (LCY)"; Rec."GST TDS/TCS Base Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST TDS/TCS Base Amount (LCY) field.';
            }
            field("GST TDS/TCS Amount (LCY)"; Rec."GST TDS/TCS Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST TDS/TCS Amount (LCY) field.';
            }
            field("POS Out Of India"; Rec."POS Out Of India")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the place of supply of invoice is out of India.';
            }

        }
    }
    actions
    {
        addfirst("F&unctions")
        {
            action("Import Salary")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(BankPaymentAdvice);
                    BankPaymentAdvice.SetTemplateBatch(Rec."Journal Template Name", Rec."Journal Batch Name");
                    BankPaymentAdvice.Run;
                end;
            }
        }
    }

    var
        BankPaymentAdvice: XMLport "Bank Payment Advice";
}

