tableextension 50002 "LKSSalesShipmentLineExt" extends "Sales Shipment Line"
{
    fields
    {
        field(50001; "Other Detail 1"; Text[250])
        {
        }
        field(50002; "Other Detail 2"; Text[250])
        {
        }
        field(50003; "Supporting Bill No."; Text[50])
        {
        }
        field(50004; "Supporting Bill Dt."; Date)
        {
        }
        field(50005; "Date of Expense"; Date)
        {
        }
    }

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "InsertInvLineFromShptLine(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "InsertInvLineFromShptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromShptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetRange("Document No.","Document No.");

    TempSalesLine := SalesLine;
    #4..110
        SalesLine.Validate("Line Discount Amount",SalesOrderLine."Line Discount Amount");
        SalesLine."Line Discount %" := SalesOrderLine."Line Discount %";
        SalesLine.UpdatePrePaymentAmounts;
        if SalesOrderLine.Quantity = 0 then
          SalesLine.Validate("Inv. Discount Amount",0)
        else
    #117..141
      SalesOrderHeader."Get Shipment Used" := true;
      SalesOrderHeader.Modify;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..113
        //8112
        SalesSetup.Get;
        if not SalesSetup."Calc. Inv. Discount" then
        //8112
    #114..144
    */
    //end;
}

