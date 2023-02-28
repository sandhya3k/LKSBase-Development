report 50032 "DepositSlip HDFC<>HDFC"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/DepositSlipHDFCHDFC.rdlc';

    dataset
    {
        dataitem("Collection Detail"; "Collection Detail")
        {
            DataItemTableView = WHERE("Client Bank Name" = FILTER(<> '*HDFC*'), "On Submit Receipt No." = FILTER(<> ''));
            RequestFilterFields = "Deposit Date", "Deposit Bank", "Company Head";
            column(ReceiptNo_CollectionDetail; "Collection Detail"."Receipt No.")
            {
            }
            column(CreationDate_CollectionDetail; Format("Creation Date"))
            {
            }
            column(ClientName_CollectionDetail; "Collection Detail"."Client Name")
            {
            }
            column(NewClientName_CollectionDetail; "Collection Detail"."New Client Name")
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
            column(Client_Bank_name; IssuedBank)
            {
            }
            column(DepositBank_CollectionDetail; "Collection Detail"."Deposit Bank")
            {
            }
            column(Name_of_Bank; BankName)
            {
            }
            column(Acc_No_Bank; BankAccNo)
            {
            }
            column(Deposit_date_collection_detail; Format("Deposit Date"))
            {
            }
            column(company_head_collection_detail; "Collection Detail"."Company Head")
            {
            }
            column(amt_wrds; words[1])
            {
            }
            column(Total_coll_detail; "Collection Detail".Total)
            {
            }
            column(CityName1; CityName1)
            {
            }
            column(bank_acc_no; "Collection Detail"."Bank Account Name")
            {
            }
            column(Deposit_Coll_2; "Collection Detail"."Deposit Date")
            {
            }
            column(GETFILTERS; GetFilters)
            {
            }
            column(showdetails; showdetails)
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
                /*
                BankAccount.RESET;
                BankAccount.SETCURRENTKEY("No.");
                BankAccount.SETRANGE(BankAccount."No.","Collection Detail"."Deposit Bank");
                IF BankAccount.FINDFIRST THEN BEGIN
                   BankName := BankAccount.Name;
                   BankAccNo := BankAccount."Bank Account No.";
                END
                ELSE
                */
                CommonMaster.Reset;
                CommonMaster.SetRange(CommonMaster."Company Head", "Collection Detail"."Company Head");
                CommonMaster.SetRange(CommonMaster."Master Type", CommonMaster."Master Type"::Bank);
                CommonMaster.SetRange(CommonMaster."Master ID", "Collection Detail"."Deposit Bank");
                if CommonMaster.Find('-') then
                    BankName := CommonMaster."Master Description";
                BankAccNo := CommonMaster.Remarks;
                //   END;

                //MESSAGE('%1',BankAccNo);

                amount1 += "Collection Detail"."Cheque Amount";

                check.InitTextVariable;
                check.FormatNoText(words, amount1, '');

                CityName.Reset;
                CityName.SetRange(CityName."Master ID", "Collection Detail"."Client Bank City");
                if CityName.Find('-') then
                    CityName1 := CityName."Master Description";

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(showdetails; showdetails)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        showdetails := true;
    end;

    var
        IssuedBank: Label 'Client_Bank_Name';
        BankAccount: Record "Bank Account";
        BankName: Text[50];
        BankAccNo: Code[20];
        check: Report Check;
        amount1: Decimal;
        words: array[2] of Text[250];
        CityName: Record "Common Master";
        CityName1: Text[250];
        CommonMaster: Record "Common Master";
        showdetails: Boolean;
}

