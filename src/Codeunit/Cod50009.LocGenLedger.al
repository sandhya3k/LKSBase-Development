codeunit 50009 "LocGenLedger"
{
    Permissions = tabledata "G/L Account" = r,
           tabledata "G/L Entry" = rimd,
           tabledata "Bank Account Ledger Entry" = rimd;
    TableNo = "Gen. Journal Line";

    EventSubscriberInstance = StaticAutomatic;
    Subtype = Normal;

    [EventSubscriber(ObjectType::table, database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure PassingTheLocation(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")

    begin
        GLEntry."Location Code" := GenJournalLine."Location Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
    local procedure PassingTheLocBankAccLed(var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")

    begin
        BankAccountLedgerEntry."Location Code" := GenJournalLine."Location Code";
    end;

}
