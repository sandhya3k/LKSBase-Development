pageextension 50038 pageextension50038 extends "Chart of Accounts"
{
    layout
    {
        addafter("Balance at Date")
        {
            field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
    }
}

