tableextension 50081 "LKSTimeLineEventExt" extends "Timeline Event"
{

    //Unsupported feature: Code Modification on "TransferToTransactionTable(PROCEDURE 19)".

    //procedure TransferToTransactionTable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    transactionTable := transactionTable.TransactionDataTable;
    TimelineEvent.Reset;
    if TimelineEvent.Find('-') then
      repeat
        transactionRow := transactionTable.NewRow;
        transactionRow.RefNo := Format(TimelineEvent.ID);
        transactionRow.ChangeRefNo := TimelineEvent.ChangeRefNo;
        transactionRow.TransactionType := TimelineEvent."Transaction Type";
        transactionRow.Description := TimelineEvent.Description;
        transactionRow.OriginalDate := CreateDateTime(TimelineEvent."Original Date",DefaultTime);
        transactionRow.NewDate := CreateDateTime(TimelineEvent."New Date",DefaultTime);
        transactionRow.OriginalQuantity := TimelineEvent."Original Quantity";
        transactionRow.NewQuantity := TimelineEvent."New Quantity";
        transactionTable.Rows.Add(transactionRow);
      until (TimelineEvent.Next = 0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    transactionTable := transactionTable.TransactionDataTable;
    TimelineEvent.RESET;
    IF TimelineEvent.FIND('-') THEN
      REPEAT
        transactionRow := transactionTable.NewRow;
        transactionRow.RefNo := FORMAT(TimelineEvent.ID);
    #7..9
        transactionRow.OriginalDate := CREATEDATETIME(TimelineEvent."Original Date",DefaultTime);
        transactionRow.NewDate := CREATEDATETIME(TimelineEvent."New Date",DefaultTime);
    #12..14
      UNTIL (TimelineEvent.NEXT = 0);
    */
    //end;


    //Unsupported feature: Code Modification on "DefaultTime(PROCEDURE 1)".

    //procedure DefaultTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(0T);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(0T);
    */
    //end;
}

