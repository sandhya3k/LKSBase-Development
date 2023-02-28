pageextension 50037 pageextension50037 extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter(Amount)
        {
            field("Pre-Assigned No."; Rec."Pre-Assigned No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Amount Including VAT")
        {
            //TBD
            /*
            field("Amount to Customer"; Rec."Amount to Customer")
            {ApplicationArea = All;
            }
            */
            field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bill-to Customer No.")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Taxable(Action 1500004).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::Taxable);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::Taxable);
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill of Supply"(Action 1500002).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::"Bill of Supply");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::"Bill of Supply");
        */
        //end;


        //Unsupported feature: Code Modification on "Export(Action 1500003).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::Export);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::Export);
        */
        //end;


        //Unsupported feature: Code Modification on "Supplementary(Action 1500001).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::Supplementary);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::Supplementary);
        */
        //end;


        //Unsupported feature: Code Modification on ""Debit Note"(Action 1500000).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::"Debit Note");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::"Debit Note");
        */
        //end;


        //Unsupported feature: Code Modification on ""Non GST"(Action 1500005).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::"Non-GST");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type1"::"Non-GST");
        */
        //end;
    }


    //Unsupported feature: Code Modification on "ShowInvoiceTypeDoc(PROCEDURE 1500000)".

    //procedure ShowInvoiceTypeDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetRange("Invoice Type",InvoiceType);
    if FindSet then
      PAGE.Run(PAGE::"Posted Sales Credit Memos",Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetRange("Invoice Type1",InvoiceType);
    if FindSet then
      PAGE.Run(PAGE::"Posted Sales Credit Memos",Rec);
    */
    //end;
}

