xmlport 50053 "Bank Payment Advice"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                XmlName = 'Payment';
                fieldelement(PostingDate; "Gen. Journal Line"."Posting Date")
                {
                }
                fieldelement(CheckType; "Gen. Journal Line"."Check Type")
                {
                }
                fieldelement(DocType; "Gen. Journal Line"."Document Type")
                {
                }
                fieldelement(DocNo; "Gen. Journal Line"."Document No.")
                {
                }
                fieldelement(AccountType; "Gen. Journal Line"."Account Type")
                {
                }
                fieldelement(AccountNo; "Gen. Journal Line"."Account No.")
                {
                }
                fieldelement(Description; "Gen. Journal Line".Description)
                {
                }
                fieldelement(Amount; "Gen. Journal Line".Amount)
                {
                }
                fieldelement(ChequeNo; "Gen. Journal Line"."Cheque No.")
                {
                }
                fieldelement(ChequeDate; "Gen. Journal Line"."Cheque Date")
                {
                }
                fieldelement(Branch; "Gen. Journal Line"."Shortcut Dimension 1 Code")
                {
                }
                textelement(employee)
                {
                    XmlName = 'Employee';
                }
                textelement(grouphead)
                {
                    XmlName = 'GroupHead';
                }
                textelement(entity)
                {
                    XmlName = 'Entity';
                }
                textelement(narration)
                {
                    XmlName = 'Narration';
                }
                fieldelement(ApplyDocType; "Gen. Journal Line"."Applies-to Doc. Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ApplyDocNo; "Gen. Journal Line"."Applies-to Doc. No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(GroulHead_1; "Gen. Journal Line"."Group Head")
                {
                }

                trigger OnAfterInitRecord()
                begin
                    "Gen. Journal Line".Validate("Journal Template Name", GnlTemp);
                    "Gen. Journal Line".Validate("Journal Batch Name", GnlBatch);
                end;

                trigger OnAfterInsertRecord()
                begin
                    Emp := Employee;
                    EntityVar := Entity;
                    GroupHeadVar := GroupHead;
                    //TBD
                    /*
                    DimensionManagement.ValidateShortcutDimValuesAdd('EMPLOYEE', Emp, "Gen. Journal Line"."Dimension Set ID");
                    DimensionManagement.ValidateShortcutDimValuesAdd('GROUPHEAD', GroupHeadVar, "Gen. Journal Line"."Dimension Set ID");
                    DimensionManagement.ValidateShortcutDimValuesAdd('ENTITY', EntityVar, "Gen. Journal Line"."Dimension Set ID");
                    */
                    "Gen. Journal Line".Modify;
                    Narrat := Narration;
                    while StrLen(Narrat) > 0 do begin
                        LineNo += 10000;
                        Clear(GenJournalNarration);
                        GenJournalNarration.Init;
                        GenJournalNarration."Journal Template Name" := "Gen. Journal Line"."Journal Template Name";
                        GenJournalNarration."Journal Batch Name" := "Gen. Journal Line"."Journal Batch Name";
                        GenJournalNarration."Document No." := "Gen. Journal Line"."Document No.";
                        GenJournalNarration."Gen. Journal Line No." := "Gen. Journal Line"."Line No.";
                        GenJournalNarration."Line No." := LineNo;
                        if StrLen(Narrat) > 50 then begin
                            GenJournalNarration.Narration := CopyStr(Narrat, 1, 50);
                            Narrat := DelStr(Narrat, 1, 50);
                        end else begin
                            GenJournalNarration.Narration := Narrat;
                            Narrat := DelStr(Narrat, 1, StrLen(Narrat));
                        end;
                        GenJournalNarration.Insert;
                    end;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    GenLineNo += 10000;
                    "Gen. Journal Line"."Line No." := GenLineNo;
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
        DimensionManagement: Codeunit DimensionManagement;
        Emp: Code[20];
        EntityVar: Code[20];
        GroupHeadVar: Code[20];
        GnlTemp: Code[20];
        GnlBatch: Code[20];
        GenJournalNarration: Record "Gen. Journal Narration";
        Narrat: Text;
        LineNo: Integer;
        GenLineNo: Integer;


    procedure SetTemplateBatch(GenJnlTemplate: Code[20]; GenJnlBatch: Code[20])
    begin
        GnlTemp := GenJnlTemplate;
        GnlBatch := GenJnlBatch;
    end;
}

