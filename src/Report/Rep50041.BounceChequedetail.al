report 50041 "Bounce Cheque detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BounceChequedetail.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("Dishonour Date" = FILTER(<> 0D), "On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Company Head", "Client ID", "Deposit Date";
            column(NewClientName_CollectionDetail; "Collection Detail"."New Client Name")
            {
            }
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(CreationDate_CollectionDetail; Format("Creation Date"))
            {
            }
            column(ClientName_CollectionDetail; "Collection Detail"."Client Name")
            {
            }
            column(ChequeAmount_CollectionDetail; "Collection Detail"."Cheque Amount")
            {
            }
            column(TDSAmount_CollectionDetail; "Collection Detail"."TDS Amount")
            {
            }
            column(DepositDate_CollectionDetail; Format("Deposit Date"))
            {
            }
            column(DishonourDate_CollectionDetail; Format("Dishonour Date"))
            {
            }
            column(CompanyHead_CollectionDetail; "Collection Detail"."Company Head")
            {
            }
            column(ChequeNo_CollectionDetail; "Collection Detail"."Cheque No.")
            {
            }
            column(ChequeDate_CollectionDetail; Format("Cheque Date"))
            {
            }
            column(Currency_CollectionDetail; "Collection Detail".Currency)
            {
            }
            column(VoucherNoofNavision_CollectionDetailv; "Collection Detail"."Voucher No. of Navision")
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

