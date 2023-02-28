report 50186 "PendingCollectionPostin01"
//PAN UPG Rename from 80001 to 50186
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/PendingCollectionPostin01.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Company Head", "Creation Date", Location, Division, Posted;
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(OnSubmitReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
            {
            }
            column(NoSeriesDivision_CollectionDetail; "Collection Detail"."No. Series Division")
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
            column(ClientName_CollectionDetail; "Collection Detail"."New Client Name")
            {
            }
            column(DepositBank_CollectionDetail; "Collection Detail"."Deposit Bank")
            {
            }
            column(BankAccName_CollectionDetail; "Collection Detail"."Bank Account Name")
            {
            }
            column(DepositDate_CollectionDetail; Format("Deposit Date"))
            {
            }
            column(Location_CollectionDetail; "Collection Detail".Location)
            {
            }
            column(ChequeNo_CollectionDetail; "Collection Detail"."Cheque No.")
            {
            }
            column(ModeofPayment_CollectionDetail; "Collection Detail"."Mode of Payment")
            {
            }
            column(ChequeDate_CollectionDetail; Format("Cheque Date"))
            {
            }
            column(PostedNo_CollectionDetail; "Collection Detail"."Posted No.")
            {
            }
            column(UnpostedNo_CollectionDetail; "Collection Detail"."Unposted No.")
            {
            }
            column(Posted_CollectionDetail; "Collection Detail".Posted)
            {
            }
            column(Currancy_Code; "Collection Detail".Currency)
            {
            }
            column(Exchange_Rage; "Collection Detail"."Exchange Rate")
            {
            }
            column(Cheque_Amount; "Collection Detail"."Cheque Amount")
            {
            }
            column(Cheque_Amount_Lcy; "Collection Detail"."Cheque Amount LCY")
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

