report 50043 "DailyCollectionMISto MP"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/DailyCollectionMIStoMP.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Creation Date", Location, "Mode of Payment";
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(Division_CollectionDetail; "Collection Detail".Division)
            {
            }
            column(CreationDate_CollectionDetail; Format("Creation Date"))
            {
            }
            column(CompanyHead_CollectionDetail; "Collection Detail"."Company Head")
            {
                OptionCaption = 'LKS,VLK,VSH';
            }
            column(ChequeAmount_CollectionDetail; "Collection Detail"."Cheque Amount")
            {
            }
            column(Currency_CollectionDetail; "Collection Detail".Currency)
            {
            }
            column(ChequeAmountLCY_CollectionDetail; "Collection Detail"."Cheque Amount LCY")
            {
            }
            column(Location_CollectionDetail; "Collection Detail".Location)
            {
            }
            column(ExchangeRate_CollectionDetail; "Collection Detail"."Exchange Rate")
            {
            }
            column(Category_CollectionDetail; "Collection Detail".Category)
            {
            }
            column(ModeofPayment_CollectionDetail; "Collection Detail"."Mode of Payment")
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

