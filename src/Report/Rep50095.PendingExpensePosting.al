report 50095 PendingExpensePosting
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/PendingExpensePosting.rdlc';

    dataset
    {
        dataitem("Expense Detail"; "Expense Detail")
        {
            RequestFilterFields = "Company Head", Division, Location, "Creation Date", Posted;
            column(ExpenseVoucherNo_ExpenseDetail; "Expense Detail"."Expense Voucher No.")
            {
            }
            column(CreationDate_ExpenseDetail; Format("Creation Date"))
            {
            }
            column(VoucherDate_ExpenseDetail; Format("Voucher Date"))
            {
            }
            column(ExternalDocumentNo_ExpenseDetail; "Expense Detail"."External Document No.")
            {
            }
            column(ExternalDocumentDate_ExpenseDetail; Format("External Document Date"))
            {
            }
            column(ExpenseAccount_ExpenseDetail; "Expense Detail"."Expense Account")
            {
            }
            column(Description_ExpenseDetail; "Expense Detail".Description)
            {
            }
            column(AmountDebit_ExpenseDetail; "Expense Detail"."Amount Debit")
            {
            }
            column(AmountCredit_ExpenseDetail; "Expense Detail"."Amount Credit")
            {
            }
            column(CurrencyCode_ExpenseDetail; "Expense Detail"."Currency Code")
            {
            }
            column(AmountLCY_ExpenseDetail; "Expense Detail"."Amount (LCY)")
            {
            }
            column(BalanceAccountNo_ExpenseDetail; "Expense Detail"."Balance Account No.")
            {
            }
            column(BalanceAccountType_ExpenseDetail; "Expense Detail"."Balance Account Type")
            {
            }
            column(ModeofPayment_ExpenseDetail; "Expense Detail"."Mode of Payment")
            {
            }
            column(ChequeNo_ExpenseDetail; "Expense Detail"."Cheque No.")
            {
            }
            column(BankPaymentType_ExpenseDetail; "Expense Detail"."Bank Payment Type")
            {
            }
            column(ChequeDate_ExpenseDetail; Format("Cheque Date"))
            {
            }
            column(CaseidNo_ExpenseDetail; "Expense Detail"."Case id No.")
            {
            }
            column(EntityCode_ExpenseDetail; "Expense Detail"."Entity Code")
            {
            }
            column(EntityName_ExpenseDetail; "Expense Detail"."Entity Name")
            {
            }
            column(Naration_ExpenseDetail; "Expense Detail".Naration)
            {
            }
            column(s_no_; sno)
            {
            }
            column(Location_ExpenseDetail; "Expense Detail".Location)
            {
            }
            column(Posted_ExpenseDetail; "Expense Detail".Posted)
            {
            }

            trigger OnAfterGetRecord()
            begin
                sno := sno + 1;
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
        sno: Integer;
}

