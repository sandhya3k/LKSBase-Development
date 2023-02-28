codeunit 50006 "Send Pending Invoice"
{

    trigger OnRun()
    begin
        //   SalesInvoiceHeader.GET('LKS01-2021-00001');
        //   InvDoc := SalesInvoiceHeader.PostedInvoiceLink('LKS01-2021-00001');
        //   LKS := LKS.LKSFunctions();
        //   IF SalesInvoiceHeader."Currency Factor" <> 0 THEN
        //    ExchangRate := 1/SalesInvoiceHeader."Currency Factor"
        //   ELSE
        //    ExchangRate := 1;
        //
        //   MESSAGE(FORMAT(LKS.RTBUpdate('0000155340','BL',SalesInvoiceHeader."No.",FORMAT(CURRENTDATETIME,0,'<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>')
        //   ,FORMAT(ExchangRate),InvDoc)));

        SalesHeader.Reset;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Credit Memo");
        SalesHeader.SetRange(Cancelled, false);
        //SalesHeader.SETRANGE("Posting No. Series",'');
        if SalesHeader.FindSet then
            repeat
                //SalesHeader.VALIDATE("Location Code");
                SalesHeader.Validate("Bill-to Contact No.");
                // SalesInvoiceHeader.GET(SalesHeader."Applies-to Doc. No.");
                // SalesHeader."Shortcut Dimension 1 Code" := SalesInvoiceHeader."Shortcut Dimension 1 Code";
                // SalesHeader."Shortcut Dimension 2 Code" := SalesInvoiceHeader."Shortcut Dimension 2 Code";
                // SalesHeader."Dimension Set ID" := SalesInvoiceHeader."Dimension Set ID";
                SalesHeader.Modify;
            //
            // SalesLine.RESET;
            // SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Credit Memo");
            // SalesLine.SETRANGE("Document No.",SalesHeader."No.");
            // SalesLine.SETFILTER(Type,'<>%1',SalesLine.Type::" ");
            // REPEAT
            //  SalesLine."Shortcut Dimension 1 Code" := SalesHeader."Shortcut Dimension 1 Code";
            //  SalesLine."Shortcut Dimension 2 Code" := SalesHeader."Shortcut Dimension 2 Code";
            //  SalesLine."Dimension Set ID" := SalesInvoiceHeader."Dimension Set ID";
            //  SalesLine.MODIFY;
            // UNTIL SalesLine.NEXT = 0;
            // SalesHeader."Shortcut Dimension 10 Code"
            // SalesHeader."Shortcut Dimension 11 Code"
            // SalesHeader."Shortcut Dimension 12 Code"
            // SalesHeader."Shortcut Dimension 9 Code"
            // SalesHeader."Shortcut Dimension 13 Code"
            // SalesHeader."Shortcut Dimension 14 Code"
            // SalesHeader."Shortcut Dimension 15 Code"
            // SalesHeader."Shortcut Dimension 16 Code"
            until SalesHeader.Next = 0;
    end;

    var
        ExchangRate: Decimal;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        InvDoc: Text;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
}

