report 50051 PendingCollectionPostingDetail
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/PendingCollectionPostingDetail.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Company Head", "Creation Date", Location, Division, Posted;
            column(PostedNo_CollectionDetail; postedno)
            {
            }
            column(ReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
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

            trigger OnAfterGetRecord()
            begin
                postedno := '';
                if "Collection Detail".Division <> "Collection Detail".Division::IPR then begin
                    postedno := "Collection Detail"."Posted No.";
                end;
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
        postedno: Code[20];
}

