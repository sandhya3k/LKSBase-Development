report 50086 "Periodical collection-Bang"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/PeriodicalcollectionBang.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE(Location = FILTER('AHMEDABAD'), "On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Company Head", "Creation Date";
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(CompanyHead_CollectionDetail; "Collection Detail"."Company Head")
            {
                OptionCaption = 'LKS,VLK,VSH';
            }
            column(Division_CollectionDetail; "Collection Detail".Division)
            {
            }
            column(CreationDate_CollectionDetail; Format("Creation Date"))
            {
            }
            column(ClientName_CollectionDetail; "Collection Detail"."Client Name")
            {
            }
            column(DepositBank_CollectionDetail; "Collection Detail"."Deposit Bank")
            {
            }
            column(DepositDate_CollectionDetail; Format("Deposit Date"))
            {
            }
            column(Location_CollectionDetail; "Collection Detail".Location)
            {
            }
            column(NewClientName_CollectionDetail; "Collection Detail"."New Client Name")
            {
            }
            column(ChequeAmount_CollectionDetail; "Collection Detail"."Cheque Amount")
            {
            }
            column(ChequeAmountLCY_CollectionDetail; "Collection Detail"."Cheque Amount LCY")
            {
            }
            column(BankAccountName_CollectionDetail; "Collection Detail"."Bank Account Name")
            {
            }
            column(ExchangeRate_CollectionDetail; "Collection Detail"."Exchange Rate")
            {
            }
            column(ChequeNo_CollectionDetail; "Collection Detail"."Cheque No.")
            {
            }
            column(OnSubmitReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
            {
            }
            column(NoSeriesDivision_CollectionDetail; "Collection Detail"."No. Series Division")
            {
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

    labels
    {
    }
}

