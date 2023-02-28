pageextension 50088 pageextension50088 extends "Apply Customer Entries"
{
    layout
    {
        addafter("CalcApplnRemainingAmount(""Remaining Pmt. Disc. Possible"")")
        {
            field("Nature of Invoice"; rec."Nature of Invoice")
            {
                ApplicationArea = All;
            }
        }
        //#122
        modify(Description)
        {
            Visible = false;
        }

        addafter("Customer No.")
        {
            field("Description 3"; Rec."Description 3")
            {
                Caption = 'Description';
                ApplicationArea = all;
            }
        }
        //#122
    }
    actions
    {
        addafter("&Navigate")
        {
            action("<Action37>")
            {
                ApplicationArea = All;
                Caption = '&Invoice';

                trigger OnAction()
                begin

                    SalesInv.SetRange(SalesInv."Posting Date", rec."Posting Date");
                    SalesInv.SetRange(SalesInv."No.", rec."Document No.");
                    if SalesInv.Find('-') then
                        REPORT.Run(50009, true, false, SalesInv);
                end;
            }
        }
    }

    var
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        SalesInv: Record "Sales Invoice Header";

    //Unsupported feature: Variable Insertion (Variable: TempEntryNo) (VariableCollection) on "PostDirectApplication(PROCEDURE 15)".



    //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CalcType = CalcType::Direct then begin
      if ApplyingCustLedgEntry."Entry No." <> 0 then begin
        Rec := ApplyingCustLedgEntry;
        ApplicationDate := CustEntryApplyPostedEntries.GetApplicationDate(Rec);

    #6..33
            Error(Text013,FieldCaption("Posting Date"),TableCaption);
        end else
          Error(Text019);

        if PreviewMode then
          CustEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
        else
    #41..48
        Error(Text002);
    end else
      Error(Text003);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if CalcType = CalcType::Direct then begin
      if ApplyingCustLedgEntry."Entry No." <> 0 then begin
        TempEntryNo := "Entry No.";  //6700
    #3..36
        CustEntryApplyPostedEntries.SetApplyEntryNo(TempEntryNo); //6700
    #38..51
    */
    //end;
}

