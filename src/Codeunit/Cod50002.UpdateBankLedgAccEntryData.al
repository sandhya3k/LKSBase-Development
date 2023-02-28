codeunit 50002 UpdateBankLedgAccEntryData
{

    trigger OnRun()
    begin
        CustLedgerEntry.Reset;
        CustLedgerEntry.SetFilter("Currency Code", '<>%1', '');
        if CustLedgerEntry.FindFirst then begin
            repeat
                BankAccountLedgerEntry.Reset;
                BankAccountLedgerEntry.SetRange("Document No.", CustLedgerEntry."Document No.");
                if BankAccountLedgerEntry.FindFirst then begin
                    CustLedgerEntry.CalcFields(Amount);
                    BankAccountLedgerEntry."Currency Amount" := CustLedgerEntry.Amount;
                    BankAccountLedgerEntry."Currency Code 1" := CustLedgerEntry."Currency Code";
                    BankAccountLedgerEntry.Modify;
                end;
            until CustLedgerEntry.Next = 0;
        end;
        Message('Updated');
    end;

    var
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
}

