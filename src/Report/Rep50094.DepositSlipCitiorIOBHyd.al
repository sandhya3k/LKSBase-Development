report 50094 "Deposit Slip CitiorIOB-Hyd"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/DepositSlipCitiorIOBHyd.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("Deposit Bank" = FILTER('BANK-006' | 'BANK-007' | 'BANK-008' | 'BANK-009'), Location = FILTER('HYDERABAD'), "On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Bank Account Name";
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(CreationDate_CollectionDetail; Format("Creation Date"))
            {
            }
            column(ClientName_CollectionDetail; "Collection Detail"."Client Name")
            {
            }
            column(Currency_CollectionDetail; "Collection Detail".Currency)
            {
            }
            column(ClientBankName_CollectionDetail; "Collection Detail"."Client Bank Name")
            {
            }
            column(ClientBankCity_CollectionDetail; "Collection Detail"."Client Bank City")
            {
            }
            column(ChequeNo_CollectionDetail; "Collection Detail"."Cheque No.")
            {
            }
            column(ChequeDate_CollectionDetail; Format("Cheque Date"))
            {
            }
            column(ChequeAmount_CollectionDetail; "Collection Detail"."Cheque Amount")
            {
            }
            column(DepositBank_CollectionDetail; "Collection Detail"."Deposit Bank")
            {
            }
            column(Name_of_Bank; BankName)
            {
            }
            column(Acc_no_bank; BankAccNo)
            {
            }
            column(DepositDate_CollectionDetail; Format("Deposit Date"))
            {
            }
            column(CompanyHead_CollectionDetail; "Collection Detail"."Company Head")
            {
            }
            column(words; words[1])
            {
            }
            column(Total_CollectionDetail; "Collection Detail".Total)
            {
            }
            column(OnSubmitReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
            {
            }
            column(NoSeriesDivision_CollectionDetail; "Collection Detail"."No. Series Division")
            {
            }

            trigger OnAfterGetRecord()
            begin
                BankAccount.Reset;
                BankAccount.SetCurrentKey("No.");
                BankAccount.SetRange(BankAccount."No.", "Collection Detail"."Deposit Bank");
                if BankAccount.FindFirst then begin
                    BankName := BankAccount.Name;
                    BankAccNo := BankAccount."Bank Account No.";
                end;

                amount1 += "Collection Detail"."Cheque Amount";

                check.InitTextVariable;
                check.FormatNoText(words, amount1, '')
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
        BankAccount: Record "Bank Account";
        BankName: Text[50];
        BankAccNo: Code[20];
        check: Report Check;
        amount1: Decimal;
        words: array[2] of Text[500];
}

