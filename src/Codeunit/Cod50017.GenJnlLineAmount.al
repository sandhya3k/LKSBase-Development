codeunit 50017 "GenJnlLineAmount"
{

    [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnFindFirstCustLedgEntryWithAppliesToDocNoOnAfterSetFilters', '', false, false)]

    local procedure OnFindFirstCustLedgEntryWithAppliesToIDOnAfterSetFilters(var GenJournalLine: Record "Gen. Journal Line"; AccNo: Code[20]; var CustLedgEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgEntry.Reset();
        // CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Payment);
        CustLedgEntry.SetRange("Document No.", GenJournalLine."Applies-to Doc. No.");
        if CustLedgEntry.FindFirst() then begin
            GenJournalLine.validate(Amount, CustLedgEntry."Amount to Apply");
            // GenJournalLine.validate("Dimension Set ID", CustLedgEntry."Dimension Set ID");
            //Commit();

        end;




    end;

}