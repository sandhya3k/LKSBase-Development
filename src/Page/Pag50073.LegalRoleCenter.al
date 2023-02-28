page 50073 "Legal Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(InvoiceZ)
            {
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = All;
                RunObject = Page "Chart of Accounts";
            }
            action("Customer ")
            {
                ApplicationArea = All;
                RunObject = Page "Customer List";
            }
            action("Bank Receipt Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    //TBD //"Sub Type" = CONST ("Bank Receipt Voucher"),
                                    Recurring = CONST(false));
            }
            action("Contra Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    //TBD //"Sub Type" = CONST ("Contra Voucher"),
                                    Recurring = CONST(false));
            }
            action("Journal Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    //TBD //"Sub Type" = CONST ("Journal Voucher"),
                                    Recurring = CONST(false));
            }
            action("Cash Payment Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    //TBD //"Sub Type" = CONST ("Cash Payment Voucher"),
                                    Recurring = CONST(false));
            }
            action("Bank Payment Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(General),
                                    //TBD //"Sub Type" = CONST ("Bank Payment Voucher"),
                                    Recurring = CONST(false));
            }
            action("Cash Receipt Voucher")
            {
                ApplicationArea = All;
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST("Cash Receipts"),
                                    Recurring = CONST(false));
            }
            action("Page RTB Ahmedabad List")
            {
                ApplicationArea = All;
                Caption = 'RTB Ahmedabad';
                RunObject = Page "RTB Ahmedabad List";
            }
            action("Page RTB Hyderabad List")
            {
                ApplicationArea = All;
                Caption = 'RTB Hyderabad';
                RunObject = Page "RTB Hyderabad List";
            }
            action("Page RTB Bangalore List")
            {
                ApplicationArea = All;
                Caption = 'RTB Bangalore';
                RunObject = Page "RTB Bangalore List";
            }
            action("Page RTB Delhi List")
            {
                ApplicationArea = All;
                Caption = 'RTB Delhi';
                RunObject = Page "RTB Delhi List";
            }
            action("Page RTB Mumbai List")
            {
                ApplicationArea = All;
                Caption = 'RTB Mumbai';
                RunObject = Page "RTB Mumbai List";
            }
            action("Page RTB Chennai List")
            {
                ApplicationArea = All;
                Caption = 'RTB Chennai';
                RunObject = Page "RTB Chennai List";
            }
            action("Page RTB Kolkata List")
            {
                ApplicationArea = All;
                Caption = 'RTB Kolkata';
                RunObject = Page "RTB Kolkata List";
            }
            action("Page Cancelled RTB")
            {
                ApplicationArea = All;
                Caption = 'Cancelled RTB';
                RunObject = Page "Sales Invoice List-TRUE";
            }
            action("Page Cancelled CRTB")
            {
                ApplicationArea = All;
                Caption = 'Cancelled CRTB';
                RunObject = Page "Sales Credit Memos-TRUE";
            }
            action("Page Ship-to Address List")
            {
                ApplicationArea = All;
                Caption = 'Ship-to Address List';
                RunObject = Page "Ship-to Address List";
            }
            action("Page Contact List")
            {
                ApplicationArea = All;
                Caption = 'Contact List';
                RunObject = Page "Contact List";
            }
        }
    }
}

