xmlport 50017 "Bank Payment Recd. 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'c:\1000\Lakshmi Kumaran & Sridharan.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                AutoUpdate = true;
                XmlName = 'Gen_Jnl_Line';
                fieldelement(Ext_Doc_No; "Gen. Journal Line"."External Document No.")
                {
                }
                fieldelement(Account_No; "Gen. Journal Line"."Account No.")
                {
                }
                fieldelement(Cheque_Date; "Gen. Journal Line"."Cheque Date")
                {
                }
                fieldelement(Amount; "Gen. Journal Line".Amount)
                {
                }
                fieldelement(Mode_of_Payment; "Gen. Journal Line"."Mode of Payment")
                {
                }
                fieldelement(Cheque_No; "Gen. Journal Line"."Cheque No.")
                {
                }
                fieldelement(Ext_Doc_date; "Gen. Journal Line"."External Doc. Date")
                {
                }
                fieldelement(Bal_Account_No; "Gen. Journal Line"."Bal. Account No.")
                {
                }
                fieldelement(Payable_At; "Gen. Journal Line"."Payble At")
                {
                }
                fieldelement(Issue_Bank_Name; "Gen. Journal Line"."Issuing Bank Name")
                {
                }
                fieldelement(Case_ID; "Gen. Journal Line"."Case Id")
                {
                }
                fieldelement(Applies_to_Doc_No; "Gen. Journal Line"."Applies-to Doc. No.")
                {
                }
                fieldelement(Adv_Inv; "Gen. Journal Line"."Advance Invoice")
                {
                }
                fieldelement(Curr_Code; "Gen. Journal Line"."Currency Code")
                {
                }
                fieldelement(CaseID; "Gen. Journal Line"."Case Id")
                {
                }
                fieldelement(Inv_No; "Gen. Journal Line"."Invoice No.")
                {
                }
                fieldelement(Loc_Code; "Gen. Journal Line"."Location Code")
                {
                }
                fieldelement(Payment_Made_By; "Gen. Journal Line"."Payment Made By")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    "Gen. Journal Line"."Account Type" := 1;
                    "Gen. Journal Line"."Bal. Account Type" := 3;
                    "Gen. Journal Line"."Document Type" := 1;

                    //GenJnlBatch.RESET;
                    //GenJnlBatch.SETRANGE(GenJnlBatch."Location Code","Gen. Journal Line"."Location Code");
                    //IF GenJnlLine.FINDFIRST THEN
                    //   "Gen. Journal Line"."Journal Template Name" := GenJnlLine."Journal Template Name";
                    //   "Gen. Journal Line"."Journal Batch Name" := GenJnlLine."Journal Batch Name";

                    Location.Reset;
                    Location.SetRange(Location.Code, "Gen. Journal Line"."Location Code");
                    if Location.FindFirst then begin
                        "Gen. Journal Line"."Journal Template Name" := Location."Journal Template Name";
                        "Gen. Journal Line"."Journal Batch Name" := Location."Journal Batch Name";

                        /*
                        BankAcc.RESET;
                        BankAcc.SETRANGE("No.","Gen. Journal Line"."Bal. Account No.");
                        IF BankAcc.FINDFIRST THEN BEGIN
                          "Gen. Journal Line"."Journal Template Name" := BankAcc."Journal Template Name";
                          "Gen. Journal Line"."Journal Batch Name" := BankAcc."Journal Batch Name";
                        */
                        GenJnlTemplate.Reset;
                        GenJnlTemplate.SetRange(Name, Location."Journal Template Name");
                        if GenJnlTemplate.FindFirst then begin
                            "Gen. Journal Line"."Source Code" := GenJnlTemplate."Source Code";
                            /*
                                GenJnlBatch.RESET;
                                GenJnlBatch.SETRANGE("Journal Template Name",GenJnlTemplate.Name);
                                GenJnlBatch.SETRANGE(Name,Location."Journal Batch Name");
                                IF GenJnlBatch.FINDFIRST THEN
                            //      "Gen. Journal Line"."Location Code" := GenJnlBatch."Location Code";
                            */
                        end;

                        GenJnlLine.Reset;
                        GenJnlLine.SetRange("Journal Template Name", Location."Journal Template Name");
                        GenJnlLine.SetRange("Journal Batch Name", Location."Journal Batch Name");

                        if GenJnlLine.FindLast then
                            LineNo := GenJnlLine."Line No." + 10000
                        else
                            LineNo := 10000;
                        "Gen. Journal Line"."Line No." := LineNo;
                    end;
                    "Gen. Journal Line"."Posting Date" := Today;
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Account No.");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 2 Code" := Case_Id;
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Shortcut Dimension 2 Code", Case_Id);
                    /*
                    IF "Gen. Journal Line"."Advance Invoice" = TRUE THEN BEGIN
                      "Gen. Journal Line"."Adv. Invoice No" := "Gen. Journal Line"."Applies-to Doc. No.";
                      "Gen. Journal Line"."Applies-to Doc. Type" := 0;
                      "Gen. Journal Line"."Applies-to Doc. No." := '';
                    END;
                    */

                    /*
                        GenJnlBatch1.RESET;
                        GenJnlBatch1.SETRANGE("Journal Template Name","Gen. Journal Line"."Journal Template Name");
                        GenJnlBatch1.SETRANGE(Name,"Gen. Journal Line"."Journal Batch Name");
                        GenJnlBatch1.SETRANGE("Location Code","Gen. Journal Line"."Location Code");
                        IF GenJnlBatch1.FINDFIRST THEN  BEGIN
                            "Gen. Journal Line"."Journal Batch Name":= GenJnlBatch1.Name;
                      MESSAGE('hi');
                      END;
                    */

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        BankAcc: Record "Bank Account";
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        Doc_No: Code[20];
        Entity_Id: Code[20];
        Cheque_Date: Date;
        Amt: Decimal;
        Mode_Of_Pay: Text[30];
        Ref_No: Text[30];
        Depo_Date: Date;
        Bank_Id: Code[20];
        Payable_At: Text[50];
        Issue_Bank: Text[50];
        Case_Id: Code[20];
        Inv_No: Code[20];
        Adv_Inv: Boolean;
        Curr_Code: Code[20];
        Other_Case_Id: Text[200];
        Other_Inv_Id: Text[200];
        Scanning_Loc: Code[20];
        Remark: Text[200];
        GenJnlBatch1: Record "Gen. Journal Batch";
        GenJnlLine1: Record "Gen. Journal Line";
        Location: Record Location;
}

