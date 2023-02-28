tableextension 50070 "LKSPurchaseHdrExt" extends "Purchase Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "State(Field 13761)".


        //Unsupported feature: Code Insertion on ""Pay-to Country/Region Code"(Field 87)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //8112

        if ("Pay-to Country/Region Code" <> xRec."Pay-to Country/Region Code") and (xRec."Pay-to Country/Region Code" <> '') then
          PostCode.ClearFields("Pay-to City","Pay-to Post Code","Pay-to County");
        //8112
        */
        //end;


        //Unsupported feature: Code Modification on "PoT(Field 16524).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Input Service Distribution" then
          Error(Text16502);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //8112
        // IN0002.begin
        GetVend("Buy-from Vendor No.");


        //8112
        if "Input Service Distribution" then
          Error(Text16502);
        */
        //end;
        field(50000; Close; Boolean)
        {
            Description = '//For Closing Purchase Order 2021';
        }
        field(50001; ShortClose; Boolean)
        {
            Description = '//Where Quantity <> Qty. Received 2021';
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not UserSetupMgt.CheckRespCenter(1,"Responsibility Center") then
      Error(
        Text023,
    #4..59
       (PurchCrMemoHeaderPrepmt."No." <> '')
    then
      Message(PostedDocsToPrintCreatedMsg);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..62
    //8112

      Delete;
      Commit;

      if PurchRcptHeader."No." <> '' then
        if Confirm(
            Text000,true,
            PurchRcptHeader."No.")
        then begin
          PurchRcptHeader.SetRecFilter;
          PurchRcptHeader.PrintRecords(true);
        end;

      if PurchInvHeader."No." <> '' then
        if Confirm(
            Text001,true,
            PurchInvHeader."No.")
        then begin
          PurchInvHeader.SetRecFilter;
          PurchInvHeader.PrintRecords(true);
        end;

      if PurchCrMemoHeader."No." <> '' then
        if Confirm(
            Text002,true,
            PurchCrMemoHeader."No.")
        then begin
          PurchCrMemoHeader.SetRecFilter;
          PurchCrMemoHeader.PrintRecords(true);
        end;

      if ReturnShptHeader."No." <> '' then
        if Confirm(
            Text024,true,
            ReturnShptHeader."No.")
        then begin
          ReturnShptHeader.SetRecFilter;
          ReturnShptHeader.PrintRecords(true);
        end;

      if PurchInvHeaderPrepmt."No." <> '' then
        if Confirm(
            Text042,true,
            PurchInvHeader."No.")
        then begin
          PurchInvHeaderPrepmt.SetRecFilter;
          PurchInvHeaderPrepmt.PrintRecords(true);
        end;

      if PurchCrMemoHeaderPrepmt."No." <> '' then
        if Confirm(
            Text043,true,
            PurchCrMemoHeaderPrepmt."No.")
        then begin
          PurchCrMemoHeaderPrepmt.SetRecFilter;
          PurchCrMemoHeaderPrepmt.PrintRecords(true);
        end;
    // VSTF208159.begin
    // DetailRG23D.RESET;
    // DetailRG23D.SETRANGE("Document Type","Document Type");
    // DetailRG23D.SETRANGE("Order No.","No.");
    // DetailRG23D.SETRANGE("Document No.",'');
    // DetailRG23D.DELETEALL;
    // VSTF208159.end
    //8112
    */
    //end;

    var
        Text000: Label 'Do you want to print receipt %1?';
        Text001: Label 'Do you want to print invoice %1?';
        Text002: Label 'Do you want to print credit memo %1?';

    var
        Text024: Label 'Do you want to print return shipment %1?';

    var
        Text043: Label 'Do you want to print prepayment invoice %1?';

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ArchiveManagement: Codeunit ArchiveManagement;

}

