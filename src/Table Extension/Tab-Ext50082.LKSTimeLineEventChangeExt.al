tableextension 50082 "LKSTimeLineEventChangeExt" extends "Timeline Event Change"
{

    //Unsupported feature: Code Modification on "TransferFromTransactionChangeTable(PROCEDURE 18)".

    //procedure TransferFromTransactionChangeTable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TimelineEventChange.Reset;
    TimelineEventChange.DeleteAll;

    rowEnum := changeTable.GetEnumerator;
    Id := 1;

    while rowEnum.MoveNext do begin
      changeRow := rowEnum.Current;
      InsertTransactionRow(TimelineEventChange,changeRow,Id);
      Id += 1;
    end;

    TimelineEventChange.SetCurrentKey("Due Date"); // Restore key to Due Date
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TimelineEventChange.RESET;
    TimelineEventChange.DELETEALL;
    #3..6
    WHILE rowEnum.MoveNext DO BEGIN
    #8..10
    END;

    TimelineEventChange.SETCURRENTKEY("Due Date"); // Restore key to Due Date
    */
    //end;


    //Unsupported feature: Code Modification on "InsertTransactionRow(PROCEDURE 1)".

    //procedure InsertTransactionRow();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TimelineEventChange.Init;
    TimelineEventChange.ID := Id;
    TimelineEventChange."Reference No." := changeRow.RefNo;

    if not changeRow.IsNewDateNull then
      TimelineEventChange."Due Date" := DT2Date(changeRow.NewDate);

    if not changeRow.IsOriginalDateNull then
      TimelineEventChange."Original Due Date" := DT2Date(changeRow.OriginalDate);

    if not changeRow.IsNewQuantityNull then
      TimelineEventChange.Quantity := changeRow.NewQuantity;

    if not changeRow.IsOriginalQuantityNull then
      TimelineEventChange."Original Quantity" := changeRow.OriginalQuantity;

    TimelineEventChange.Changes := changeRow.Changes;
    TimelineEventChange.ChangeRefNo := changeRow.ChangeRefNo;
    TimelineEventChange.Insert;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TimelineEventChange.INIT;
    #2..4
    IF NOT changeRow.IsNewDateNull THEN
      TimelineEventChange."Due Date" := DT2DATE(changeRow.NewDate);

    IF NOT changeRow.IsOriginalDateNull THEN
      TimelineEventChange."Original Due Date" := DT2DATE(changeRow.OriginalDate);

    IF NOT changeRow.IsNewQuantityNull THEN
      TimelineEventChange.Quantity := changeRow.NewQuantity;

    IF NOT changeRow.IsOriginalQuantityNull THEN
    #15..18
    TimelineEventChange.INSERT;
    */
    //end;


    //Unsupported feature: Code Modification on "ActionMessage(PROCEDURE 7)".

    //procedure ActionMessage();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Original Due Date" = 0D) and ("Original Quantity" = 0) then
      exit(ActionMsg::New);

    if Quantity = 0 then
      exit(ActionMsg::Cancel);

    if ("Due Date" <> "Original Due Date") and (Quantity <> "Original Quantity") then
      exit(ActionMsg::"Resched. & Chg. Qty.");

    if "Due Date" <> "Original Due Date" then
      exit(ActionMsg::Reschedule);

    if Quantity <> "Original Quantity" then
      exit(ActionMsg::"Change Qty.");

    exit(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ("Original Due Date" = 0D) AND ("Original Quantity" = 0) THEN
      EXIT(ActionMsg::New);

    IF Quantity = 0 THEN
      EXIT(ActionMsg::Cancel);

    IF ("Due Date" <> "Original Due Date") AND (Quantity <> "Original Quantity") THEN
      EXIT(ActionMsg::"Resched. & Chg. Qty.");

    IF "Due Date" <> "Original Due Date" THEN
      EXIT(ActionMsg::Reschedule);

    IF Quantity <> "Original Quantity" THEN
      EXIT(ActionMsg::"Change Qty.");

    EXIT(0);
    */
    //end;


    //Unsupported feature: Code Modification on "NewSupply(PROCEDURE 1203)".

    //procedure NewSupply();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit((Changes = 1) and (ChangeRefNo = ''));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT((Changes = 1) AND (ChangeRefNo = ''));
    */
    //end;
}

