report 50042 "Duplication cheque details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/Duplicationchequedetails.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Deposit Bank", "Deposit Date";
            column(OnSubmitReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
            {
            }
            column(NoSeriesDivision_CollectionDetail; "Collection Detail"."No. Series Division")
            {
            }
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
            column(ChequeAmountLCY_CollectionDetail; "Collection Detail"."Cheque Amount LCY")
            {
            }
            column(Remarks_CollectionDetail; "Collection Detail".Remarks)
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

