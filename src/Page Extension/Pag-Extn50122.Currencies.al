pageextension 50122 pageextension50122 extends Currencies
{
    layout
    {
        addafter("Conv. LCY Rndg. Credit Acc.")
        {
            field("Currency Code for E Invoicing"; Rec."Currency Code for E Invoicing")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Conv. LCY Rndg. Credit Acc."; "VAT Rounding Type")
    }
}

