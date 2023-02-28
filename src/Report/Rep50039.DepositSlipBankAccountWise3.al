report 50039 DepositSlipBankAccountWise3
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/DepositSlipBankAccountWise3.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("Deposit Bank" = FILTER('BANK-020' | 'BANK-021'), "On Submit Receipt No." = FILTER(<> ''));
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
            column(CompanyHead_CollectionDetail; "Collection Detail"."Company Head")
            {
            }
            column(Name_of_Bank; BankName)
            {
            }
            column(DepositDate_CollectionDetail; Format("Deposit Date"))
            {
            }
            column(Acc_no_bank; BankAccNo)
            {
            }
            column(words; words[1])
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
                amount += "Collection Detail"."Cheque Amount";
                check.InitTextVariable;
                check.FormatNoText(words, amount, '');
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
        IssuedBank: Label 'Client_Bank_Name';
        BankAccount: Record "Bank Account";
        BankName: Text[50];
        BankAccNo: Code[20];
        check: Report Check;
        amount: Decimal;
        words: array[2] of Text[500];
}

