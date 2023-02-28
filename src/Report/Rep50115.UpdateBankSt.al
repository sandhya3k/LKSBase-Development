report 50115 "UpdateBankSt."
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/UpdateBankSt.rdlc';

    dataset
    {
        dataitem("Bank Account Statement Line"; "Bank Account Statement Line")
        {
            RequestFilterFields = "Bank Account No.", "Document No.";

            trigger OnAfterGetRecord()
            begin
                BankLedger.Reset;
                BankLedger.SetFilter(BankLedger."Bank Account No.", "Bank Account No.");
                BankLedger.SetFilter(BankLedger."Document No.", "Bank Account Statement Line"."Document No.");
                if BankLedger.FindSet then
                    repeat
                        "Bank Account Statement Line".Reversed := BankLedger.Reversed;
                        "Bank Account Statement Line".Modify;
                    until
BankLedger.Next = 0;
            end;
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

    labels
    {
    }

    var
        BankLedger: Record "Bank Account Ledger Entry";
}

