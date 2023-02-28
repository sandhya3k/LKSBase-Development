report 50044 "Periodical collectionReport"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/PeriodicalcollectionReport.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("On Submit Receipt No." = FILTER(<> ''), "Entry Type" = FILTER(<> Duplicate));
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
            column(Currency_Code; "Collection Detail".Currency)
            {
            }
            column(ExchangeRate_CollectionDetail; "Collection Detail"."Exchange Rate")
            {
            }
            column(ChequeNo_CollectionDetail; "Collection Detail"."Cheque No.")
            {
            }
            column(Cheque_Date; Format("Collection Detail"."Cheque Date"))
            {
            }
            column(OnSubmitReceiptNo_CollectionDetail; "Collection Detail"."On Submit Receipt No.")
            {
            }
            column(NoSeriesDivision_CollectionDetail; "Collection Detail"."No. Series Division")
            {
            }
            column(Mode_Of_Payment; "Collection Detail"."Mode of Payment")
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                Remarks :='';
                CollComment.RESET;
                CollComment.SETRANGE(CollComment."Company Head","Collection Detail"."Company Head");
                CollComment.SETRANGE(CollComment.Division,"Collection Detail".Division);
                CollComment.SETFILTER(CollComment."Voucher No.","Collection Detail"."Receipt No.");
                IF CollComment.FINDFIRST THEN
                   REPEAT
                   Remarks:=Remarks + CollComment.Comment;
                   UNTIL
                   CollComment.NEXT =0;
                 */

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
        Remarks: Text[500];
        CollComment: Record "Coll.Exp.Comment Line";
}

