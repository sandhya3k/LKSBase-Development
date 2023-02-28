tableextension 50069 "LKSExcelBufferExt" extends "Excel Buffer"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Row No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        xlRowID := '';
        if "Row No." <> 0 then
          xlRowID := Format("Row No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        xlRowID := '';
        IF "Row No." <> 0 THEN
          xlRowID := FORMAT("Row No.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Column No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        xlColID := '';
        x := "Column No.";
        while x > 26 do begin
          y := x mod 26;
          if y = 0 then
            y := 26;
          c := 64 + y;
          i := i + 1;
          t[i] := c;
          x := (x - y) div 26;
        end;
        if x > 0 then begin
          c := 64 + x;
          i := i + 1;
          t[i] := c;
        end;
        for x := 1 to i do
          xlColID[x] := t[1 + i - x];
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        xlColID := '';
        x := "Column No.";
        WHILE x > 26 DO BEGIN
          y := x MOD 26;
          IF y = 0 THEN
        #6..9
          x := (x - y) DIV 26;
        END;
        IF x > 0 THEN BEGIN
        #13..15
        END;
        FOR x := 1 TO i DO
          xlColID[x] := t[1 + i - x];
        */
        //end;
    }


    //Unsupported feature: Code Modification on "CreateBook(PROCEDURE 1)".

    //procedure CreateBook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SheetName = '' then
      Error(Text002);

    if FileName = '' then
      FileNameServer := FileManagement.ServerTempFileName('xlsx')
    else begin
      if Exists(FileName) then
        Erase(FileName);
      FileNameServer := FileName;
    end;

    XlWrkBkWriter := XlWrkBkWriter.Create(FileNameServer);
    if IsNull(XlWrkBkWriter) then
      Error(Text037);

    XlWrkShtWriter := XlWrkBkWriter.FirstWorksheet;
    if SheetName <> '' then begin
      XlWrkShtWriter.Name := SheetName;
      ActiveSheetName := SheetName;
    end
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF SheetName = '' THEN
      ERROR(Text002);

    IF FileName = '' THEN
      FileNameServer := FileManagement.ServerTempFileName('xlsx')
    ELSE BEGIN
      IF EXISTS(FileName) THEN
        ERASE(FileName);
      FileNameServer := FileName;
    END;

    XlWrkBkWriter := XlWrkBkWriter.Create(FileNameServer);
    IF ISNULL(XlWrkBkWriter) THEN
      ERROR(Text037);

    XlWrkShtWriter := XlWrkBkWriter.FirstWorksheet;
    IF SheetName <> '' THEN BEGIN
      XlWrkShtWriter.Name := SheetName;
      ActiveSheetName := SheetName;
    END
    */
    //end;


    //Unsupported feature: Code Modification on "OpenBook(PROCEDURE 2)".

    //procedure OpenBook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      Error(Text001);

    if SheetName = '' then
      Error(Text002);

    XlWrkBkReader := XlWrkBkReader.Open(FileName);
    if XlWrkBkReader.HasWorksheet(SheetName) then begin
      XlWrkShtReader := XlWrkBkReader.GetWorksheetByName(SheetName);
    end else begin
      QuitExcel;
      Error(Text004,SheetName);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      ERROR(Text001);

    IF SheetName = '' THEN
      ERROR(Text002);

    XlWrkBkReader := XlWrkBkReader.Open(FileName);
    IF XlWrkBkReader.HasWorksheet(SheetName) THEN BEGIN
      XlWrkShtReader := XlWrkBkReader.GetWorksheetByName(SheetName);
    END ELSE BEGIN
      QuitExcel;
      ERROR(Text004,SheetName);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "OpenBookStream(PROCEDURE 44)".

    //procedure OpenBookStream();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SheetName = '' then
      exit(Text002);

    if SheetName = 'G/L Account' then
      SheetName := 'GL Account';

    XlWrkBkReader := XlWrkBkReader.Open(FileStream);
    if XlWrkBkReader.HasWorksheet(SheetName) then
      XlWrkShtReader := XlWrkBkReader.GetWorksheetByName(SheetName)
    else begin
      QuitExcel;
      Error(Text004,SheetName);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF SheetName = '' THEN
      EXIT(Text002);

    IF SheetName = 'G/L Account' THEN
    #5..7
    IF XlWrkBkReader.HasWorksheet(SheetName) THEN
      XlWrkShtReader := XlWrkBkReader.GetWorksheetByName(SheetName)
    ELSE BEGIN
      QuitExcel;
      ERROR(Text004,SheetName);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateBook(PROCEDURE 5)".

    //procedure UpdateBook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      Error(Text001);

    if SheetName = '' then
      Error(Text002);

    FileNameServer := FileName;
    XlWrkBkWriter := XlWrkBkWriter.Open(FileNameServer);
    if XlWrkBkWriter.HasWorksheet(SheetName) then begin
      XlWrkShtWriter := XlWrkBkWriter.GetWorksheetByName(SheetName);
      ActiveSheetName := SheetName;
    end else begin
      QuitExcel;
      Error(Text004,SheetName);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      ERROR(Text001);

    IF SheetName = '' THEN
      ERROR(Text002);
    #6..8
    IF XlWrkBkWriter.HasWorksheet(SheetName) THEN BEGIN
      XlWrkShtWriter := XlWrkBkWriter.GetWorksheetByName(SheetName);
      ActiveSheetName := SheetName;
    END ELSE BEGIN
      QuitExcel;
      ERROR(Text004,SheetName);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "CloseBook(PROCEDURE 30)".

    //procedure CloseBook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not IsNull(XlWrkBkWriter) then begin
      XlWrkBkWriter.ClearFormulaCalculations;
      XlWrkBkWriter.ValidateDocument;
      XlWrkBkWriter.Close;
      Clear(XlWrkShtWriter);
      Clear(XlWrkBkWriter);
    end;

    if not IsNull(XlWrkBkReader) then begin
      Clear(XlWrkShtReader);
      Clear(XlWrkBkReader);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT ISNULL(XlWrkBkWriter) THEN BEGIN
    #2..4
      CLEAR(XlWrkShtWriter);
      CLEAR(XlWrkBkWriter);
    END;

    IF NOT ISNULL(XlWrkBkReader) THEN BEGIN
      CLEAR(XlWrkShtReader);
      CLEAR(XlWrkBkReader);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "WriteSheet(PROCEDURE 37)".

    //procedure WriteSheet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LastUpdate := CurrentDateTime;
    ExcelBufferDialogMgt.Open(Text005);

    CRLF := 10;
    RecNo := 1;
    TotalRecNo := Count + InfoExcelBuf.Count;
    RecNo := 0;

    if ExcelBookCreated then
      XlWrkShtWriter := XlWrkBkWriter.AddWorksheet(NewSheetName);

    XlWrkShtWriter.AddPageSetup(OrientationValues.Landscape,9); // 9 - default value for Paper Size - A4

    // commit is required because of the result boolean check of ExcelBufferDialogMgt.RUN
    Commit;

    if FindSet then
      repeat
        RecNo := RecNo + 1;
        if not UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,RecNo,TotalRecNo) then begin
          QuitExcel;
          Error(Text035)
        end;
        if Formula = '' then
          WriteCellValue(Rec)
        else
          WriteCellFormula(Rec)
      until Next = 0;

    if ReportHeader <> '' then
      XlWrkShtWriter.AddHeader(
        true,
        StrSubstNo('%1%2%1%3%4',GetExcelReference(1),ReportHeader,CRLF,CompanyName2));

    XlWrkShtWriter.AddHeader(
      false,
      StrSubstNo(Text006,GetExcelReference(2),GetExcelReference(3),CRLF,UserID2));

    if UseInfoSheet then
      if InfoExcelBuf.FindSet then begin
        XlWrkShtWriter := XlWrkBkWriter.AddWorksheet(Text023);
        repeat
          InfoRecNo := InfoRecNo + 1;
          if not UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,RecNo + InfoRecNo,TotalRecNo) then begin
            QuitExcel;
            Error(Text035)
          end;
          if InfoExcelBuf.Formula = '' then
            WriteCellValue(InfoExcelBuf)
          else
            WriteCellFormula(InfoExcelBuf)
        until InfoExcelBuf.Next = 0;
      end;

    ExcelBufferDialogMgt.Close;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    LastUpdate := CURRENTDATETIME;
    #2..5
    TotalRecNo := COUNT + InfoExcelBuf.COUNT;
    RecNo := 0;

    IF ExcelBookCreated THEN
    #10..14
    COMMIT;

    IF FINDSET THEN
      REPEAT
        RecNo := RecNo + 1;
        IF NOT UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,RecNo,TotalRecNo) THEN BEGIN
          QuitExcel;
          ERROR(Text035)
        END;
        IF Formula = '' THEN
          WriteCellValue(Rec)
        ELSE
          WriteCellFormula(Rec)
      UNTIL NEXT = 0;

    IF ReportHeader <> '' THEN
      XlWrkShtWriter.AddHeader(
        TRUE,
        STRSUBSTNO('%1%2%1%3%4',GetExcelReference(1),ReportHeader,CRLF,CompanyName2));

    XlWrkShtWriter.AddHeader(
      FALSE,
      STRSUBSTNO(Text006,GetExcelReference(2),GetExcelReference(3),CRLF,UserID2));

    IF UseInfoSheet THEN
      IF InfoExcelBuf.FINDSET THEN BEGIN
        XlWrkShtWriter := XlWrkBkWriter.AddWorksheet(Text023);
        REPEAT
          InfoRecNo := InfoRecNo + 1;
          IF NOT UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,RecNo + InfoRecNo,TotalRecNo) THEN BEGIN
            QuitExcel;
            ERROR(Text035)
          END;
          IF InfoExcelBuf.Formula = '' THEN
            WriteCellValue(InfoExcelBuf)
          ELSE
            WriteCellFormula(InfoExcelBuf)
        UNTIL InfoExcelBuf.NEXT = 0;
      END;

    ExcelBufferDialogMgt.Close;
    */
    //end;


    //Unsupported feature: Code Modification on "WriteCellValue(PROCEDURE 28)".

    //procedure WriteCellValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    with ExcelBuffer do begin
      GetCellDecorator(Bold,Italic,Underline,"Double Underline",Decorator);

      case "Cell Type" of
        "Cell Type"::Number:
          XlWrkShtWriter.SetCellValueNumber("Row No.",xlColID,"Cell Value as Text",NumberFormat,Decorator);
        "Cell Type"::Text:
          XlWrkShtWriter.SetCellValueText("Row No.",xlColID,"Cell Value as Text",Decorator);
        "Cell Type"::Date:
          XlWrkShtWriter.SetCellValueDate("Row No.",xlColID,"Cell Value as Text",NumberFormat,Decorator);
        "Cell Type"::Time:
          XlWrkShtWriter.SetCellValueTime("Row No.",xlColID,"Cell Value as Text",NumberFormat,Decorator);
        else
          Error(Text039)
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH ExcelBuffer DO BEGIN
      GetCellDecorator(Bold,Italic,Underline,"Double Underline",Decorator);

      CASE "Cell Type" OF
    #5..12
        ELSE
          ERROR(Text039)
      END;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "WriteCellFormula(PROCEDURE 38)".

    //procedure WriteCellFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    with ExcelBuffer do begin
      GetCellDecorator(Bold,Italic,Underline,"Double Underline",Decorator);

      XlWrkShtWriter.SetCellFormula("Row No.",xlColID,GetFormula,NumberFormat,Decorator);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH ExcelBuffer DO BEGIN
    #2..4
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "GetCellDecorator(PROCEDURE 33)".

    //procedure GetCellDecorator();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsBold and IsItalic then begin
      if IsDoubleUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultBoldItalicDoubleUnderlinedCellDecorator;
        exit;
      end;
      if IsUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
        exit;
      end;
    end;

    if IsBold and IsItalic then begin
      Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
      exit;
    end;

    if IsBold then begin
      if IsDoubleUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultBoldDoubleUnderlinedCellDecorator;
        exit;
      end;
      if IsUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
        exit;
      end;
    end;

    if IsBold then begin
      Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
      exit;
    end;

    if IsItalic then begin
      if IsDoubleUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultItalicDoubleUnderlinedCellDecorator;
        exit;
      end;
      if IsUnderlined then begin
        Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
        exit;
      end;
    end;

    if IsItalic then begin
      Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
      exit;
    end;

    if IsDoubleUnderlined then
      Decorator := XlWrkShtWriter.DefaultDoubleUnderlinedCellDecorator
    else begin
      if IsUnderlined then
        Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
      else
        Decorator := XlWrkShtWriter.DefaultCellDecorator;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF IsBold AND IsItalic THEN BEGIN
      IF IsDoubleUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultBoldItalicDoubleUnderlinedCellDecorator;
        EXIT;
      END;
      IF IsUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
        EXIT;
      END;
    END;

    IF IsBold AND IsItalic THEN BEGIN
      Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
      EXIT;
    END;

    IF IsBold THEN BEGIN
      IF IsDoubleUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultBoldDoubleUnderlinedCellDecorator;
        EXIT;
      END;
      IF IsUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
        EXIT;
      END;
    END;

    IF IsBold THEN BEGIN
      Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
      EXIT;
    END;

    IF IsItalic THEN BEGIN
      IF IsDoubleUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultItalicDoubleUnderlinedCellDecorator;
        EXIT;
      END;
      IF IsUnderlined THEN BEGIN
        Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
        EXIT;
      END;
    END;

    IF IsItalic THEN BEGIN
      Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
      EXIT;
    END;

    IF IsDoubleUnderlined THEN
      Decorator := XlWrkShtWriter.DefaultDoubleUnderlinedCellDecorator
    ELSE BEGIN
      IF IsUnderlined THEN
        Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
      ELSE
        Decorator := XlWrkShtWriter.DefaultCellDecorator;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "CreateRangeName(PROCEDURE 9)".

    //procedure CreateRangeName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetCurrentKey("Row No.","Column No.");
    if Find('+') then
      ToxlRowID := xlRowID;
    TempExcelBuf.Validate("Row No.",FromRowNo);
    TempExcelBuf.Validate("Column No.",FromColumnNo);

    XlWrkShtWriter.AddRange(
      RangeName,
      GetExcelReference(4) + TempExcelBuf.xlColID + GetExcelReference(4) + TempExcelBuf.xlRowID +
      ':' +
      GetExcelReference(4) + TempExcelBuf.xlColID + GetExcelReference(4) + ToxlRowID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SETCURRENTKEY("Row No.","Column No.");
    IF FIND('+') THEN
      ToxlRowID := xlRowID;
    TempExcelBuf.VALIDATE("Row No.",FromRowNo);
    TempExcelBuf.VALIDATE("Column No.",FromColumnNo);
    #6..11
    */
    //end;


    //Unsupported feature: Code Modification on "GiveUserControl(PROCEDURE 3)".

    //procedure GiveUserControl();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not IsNull(XlApp) then begin
      XlApp.Visible := true;
      XlApp.UserControl := true;
      Clear(XlApp);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT ISNULL(XlApp) THEN BEGIN
      XlApp.Visible := TRUE;
      XlApp.UserControl := TRUE;
      CLEAR(XlApp);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "ReadSheet(PROCEDURE 4)".

    //procedure ReadSheet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LastUpdate := CurrentDateTime;
    ExcelBufferDialogMgt.Open(Text007);
    DeleteAll;

    Enumerator := XlWrkShtReader.GetEnumerator;
    RowCount := XlWrkShtReader.RowCount;
    while Enumerator.MoveNext do begin
      CellData := Enumerator.Current;
      if CellData.HasValue then begin
        Validate("Row No.",CellData.RowNumber);
        Validate("Column No.",CellData.ColumnNumber);
        ParseCellValue(CellData.Value,CellData.Format);
        Insert;
      end;

      i := i + 1;
      Commit;
      if not UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,i,RowCount) then begin
        QuitExcel;
        Error(Text035)
      end;
    end;

    QuitExcel;
    ExcelBufferDialogMgt.Close;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    LastUpdate := CURRENTDATETIME;
    ExcelBufferDialogMgt.Open(Text007);
    DELETEALL;
    #4..6
    WHILE Enumerator.MoveNext DO BEGIN
      CellData := Enumerator.Current;
      IF CellData.HasValue THEN BEGIN
        VALIDATE("Row No.",CellData.RowNumber);
        VALIDATE("Column No.",CellData.ColumnNumber);
        ParseCellValue(CellData.Value,CellData.Format);
        INSERT;
      END;

      i := i + 1;
      COMMIT;
      IF NOT UpdateProgressDialog(ExcelBufferDialogMgt,LastUpdate,i,RowCount) THEN BEGIN
        QuitExcel;
        ERROR(Text035)
      END;
    END;
    #23..25
    */
    //end;


    //Unsupported feature: Code Modification on "ParseCellValue(PROCEDURE 40)".

    //procedure ParseCellValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // The format contains only en-US number separators, this is an OpenXML standard requirement
    // The algorithm sieves the data based on formatting as follows (the steps must run in this order)
    // 1. FormatString = '@' -> Text
    // 2. FormatString.Contains(':') -> Time
    // 3. FormatString.ContainsOneOf('y', 'm', 'd') && FormatString.DoesNotContain('Red') -> Date
    // 4. anything else -> Decimal

    NumberFormat := CopyStr(FormatString,1,30);

    if FormatString = '@' then begin
      "Cell Type" := "Cell Type"::Text;
      "Cell Value as Text" := Value;
      exit;
    end;

    Evaluate(Decimal,Value);

    if StrPos(FormatString,':') <> 0 then begin
      // Excel Time is stored in OADate format
      "Cell Type" := "Cell Type"::Time;
      "Cell Value as Text" := Format(DT2Time(ConvertDateTimeDecimalToDateTime(Decimal)));
      exit;
    end;

    if ((StrPos(FormatString,'y') <> 0) or
        (StrPos(FormatString,'m') <> 0) or
        (StrPos(FormatString,'d') <> 0)) and
       (StrPos(FormatString,'Red') = 0)
    then begin
      "Cell Type" := "Cell Type"::Date;
      "Cell Value as Text" := Format(DT2Date(ConvertDateTimeDecimalToDateTime(Decimal)));
      exit;
    end;

    "Cell Type" := "Cell Type"::Number;
    "Cell Value as Text" := Format(Round(Decimal,0.000001),0,1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    NumberFormat := COPYSTR(FormatString,1,30);

    IF FormatString = '@' THEN BEGIN
      "Cell Type" := "Cell Type"::Text;
      "Cell Value as Text" := Value;
      EXIT;
    END;

    EVALUATE(Decimal,Value);

    IF STRPOS(FormatString,':') <> 0 THEN BEGIN
      // Excel Time is stored in OADate format
      "Cell Type" := "Cell Type"::Time;
      "Cell Value as Text" := FORMAT(DT2TIME(ConvertDateTimeDecimalToDateTime(Decimal)));
      EXIT;
    END;

    IF ((STRPOS(FormatString,'y') <> 0) OR
        (STRPOS(FormatString,'m') <> 0) OR
        (STRPOS(FormatString,'d') <> 0)) AND
       (STRPOS(FormatString,'Red') = 0)
    THEN BEGIN
      "Cell Type" := "Cell Type"::Date;
      "Cell Value as Text" := FORMAT(DT2DATE(ConvertDateTimeDecimalToDateTime(Decimal)));
      EXIT;
    END;

    "Cell Type" := "Cell Type"::Number;
    "Cell Value as Text" := FORMAT(ROUND(Decimal,0.000001),0,1);
    */
    //end;


    //Unsupported feature: Code Modification on "SelectSheetsName(PROCEDURE 6)".

    //procedure SelectSheetsName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      Error(Text001);

    XlWrkBkReader := XlWrkBkReader.Open(FileName);

    SelectedSheetName := '';
    SheetNames := SheetNames.ArrayList(XlWrkBkReader.SheetNames);
    if not IsNull(SheetNames) then begin
      for i := 0 to SheetNames.Count - 1 do begin
        SheetName := SheetNames.Item(i);
        if SheetName <> '' then begin
          TempNameValueBuffer.Init;
          TempNameValueBuffer.ID := i;
          TempNameValueBuffer.Name := Format(i + 1);
          TempNameValueBuffer.Value := SheetName;
          TempNameValueBuffer.Insert;
        end;
      end;
      if not TempNameValueBuffer.IsEmpty then
        if TempNameValueBuffer.Count = 1 then
          SelectedSheetName := TempNameValueBuffer.Value
        else begin
          TempNameValueBuffer.FindFirst;
          if PAGE.RunModal(PAGE::"Name/Value Lookup",TempNameValueBuffer) = ACTION::LookupOK then
            SelectedSheetName := TempNameValueBuffer.Value;
        end;
    end;

    QuitExcel;
    exit(SelectedSheetName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      ERROR(Text001);
    #3..7
    IF NOT ISNULL(SheetNames) THEN BEGIN
      FOR i := 0 TO SheetNames.Count - 1 DO BEGIN
        SheetName := SheetNames.Item(i);
        IF SheetName <> '' THEN BEGIN
          TempNameValueBuffer.INIT;
          TempNameValueBuffer.ID := i;
          TempNameValueBuffer.Name := FORMAT(i + 1);
          TempNameValueBuffer.Value := SheetName;
          TempNameValueBuffer.INSERT;
        END;
      END;
      IF NOT TempNameValueBuffer.ISEMPTY THEN
        IF TempNameValueBuffer.COUNT = 1 THEN
          SelectedSheetName := TempNameValueBuffer.Value
        ELSE BEGIN
          TempNameValueBuffer.FINDFIRST;
          IF PAGE.RUNMODAL(PAGE::"Name/Value Lookup",TempNameValueBuffer) = ACTION::LookupOK THEN
            SelectedSheetName := TempNameValueBuffer.Value;
        END;
    END;

    QuitExcel;
    EXIT(SelectedSheetName);
    */
    //end;


    //Unsupported feature: Code Modification on "GetExcelReference(PROCEDURE 10)".

    //procedure GetExcelReference();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case Which of
      1:
        exit(Text013);
      // DO NOT TRANSLATE: &B is the Excel code to turn bold printing on or off for customized Header/Footer.
      2:
        exit(Text014);
      // DO NOT TRANSLATE: &D is the Excel code to print the current date in customized Header/Footer.
      3:
        exit(Text015);
      // DO NOT TRANSLATE: &P is the Excel code to print the page number in customized Header/Footer.
      4:
        exit('$');
      // DO NOT TRANSLATE: $ is the Excel code for absolute reference to cells.
      5:
        exit(Text016);
      // DO NOT TRANSLATE: A1 is the Excel reference of the first cell.
      6:
        exit(Text017);
      // DO NOT TRANSLATE: SUMIF is the name of the Excel function used to summarize values according to some conditions.
      7:
        exit(Text018);
      // DO NOT TRANSLATE: The #N/A Excel error value occurs when a value is not available to a function or formula.
      8:
        exit(Text019);
      // DO NOT TRANSLATE: GLAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
      9:
        exit(Text020);
      // DO NOT TRANSLATE: Period is used to define an Excel range name. You must refer to Excel rules to change this term.
      10:
        exit(Text021);
      // DO NOT TRANSLATE: Budget is used to define an Excel worksheet name. You must refer to Excel rules to change this term.
      11:
        exit(Text022);
      // DO NOT TRANSLATE: CostAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE Which OF
      1:
        EXIT(Text013);
      // DO NOT TRANSLATE: &B is the Excel code to turn bold printing on or off for customized Header/Footer.
      2:
        EXIT(Text014);
      // DO NOT TRANSLATE: &D is the Excel code to print the current date in customized Header/Footer.
      3:
        EXIT(Text015);
      // DO NOT TRANSLATE: &P is the Excel code to print the page number in customized Header/Footer.
      4:
        EXIT('$');
      // DO NOT TRANSLATE: $ is the Excel code for absolute reference to cells.
      5:
        EXIT(Text016);
      // DO NOT TRANSLATE: A1 is the Excel reference of the first cell.
      6:
        EXIT(Text017);
      // DO NOT TRANSLATE: SUMIF is the name of the Excel function used to summarize values according to some conditions.
      7:
        EXIT(Text018);
      // DO NOT TRANSLATE: The #N/A Excel error value occurs when a value is not available to a function or formula.
      8:
        EXIT(Text019);
      // DO NOT TRANSLATE: GLAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
      9:
        EXIT(Text020);
      // DO NOT TRANSLATE: Period is used to define an Excel range name. You must refer to Excel rules to change this term.
      10:
        EXIT(Text021);
      // DO NOT TRANSLATE: Budget is used to define an Excel worksheet name. You must refer to Excel rules to change this term.
      11:
        EXIT(Text022);
      // DO NOT TRANSLATE: CostAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "ExportBudgetFilterToFormula(PROCEDURE 11)".

    //procedure ExportBudgetFilterToFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ExcelBuf.SetFilter(Formula,'<>%1','');
    if ExcelBuf.FindSet then
      repeat
        ExcelBufFormula := ExcelBuf;
        ExcelBufFormula.Insert;
      until ExcelBuf.Next = 0;
    ExcelBuf.Reset;

    with ExcelBufFormula do
      if FindSet then
        repeat
          ThisCellHasFormulaError := false;
          ExcelBuf.SetRange("Column No.",1);
          ExcelBuf.SetFilter("Row No.",'<>%1',"Row No.");
          ExcelBuf.SetFilter("Cell Value as Text",Formula);
          ExcelBufFormula2 := ExcelBufFormula;
          if ExcelBuf.FindSet then
            repeat
              if not Get(ExcelBuf."Row No.","Column No.") then
                ExcelBuf.Mark(true);
            until ExcelBuf.Next = 0;
          ExcelBufFormula := ExcelBufFormula2;
          ClearFormula;
          ExcelBuf.SetRange("Cell Value as Text");
          ExcelBuf.SetRange("Row No.");
          if ExcelBuf.FindSet then
            repeat
              if ExcelBuf.Mark then begin
                LastRow := ExcelBuf."Row No.";
                if FirstRow = 0 then
                  FirstRow := LastRow;
              end else
                if FirstRow <> 0 then begin
                  if FirstRow = LastRow then
                    ThisCellHasFormulaError := AddToFormula(xlColID + Format(FirstRow))
                  else
                    ThisCellHasFormulaError :=
                      AddToFormula('SUM(' + xlColID + Format(FirstRow) + ':' + xlColID + Format(LastRow) + ')');
                  FirstRow := 0;
                  if ThisCellHasFormulaError then
                    SetFormula(ExcelBuf.GetExcelReference(7));
                end;
            until ThisCellHasFormulaError or (ExcelBuf.Next = 0);

          if not ThisCellHasFormulaError and (FirstRow <> 0) then begin
            if FirstRow = LastRow then
              ThisCellHasFormulaError := AddToFormula(xlColID + Format(FirstRow))
            else
              ThisCellHasFormulaError :=
                AddToFormula('SUM(' + xlColID + Format(FirstRow) + ':' + xlColID + Format(LastRow) + ')');
            FirstRow := 0;
            if ThisCellHasFormulaError then
              SetFormula(ExcelBuf.GetExcelReference(7));
          end;

          ExcelBuf.Reset;
          ExcelBuf.Get("Row No.","Column No.");
          ExcelBuf.SetFormula(GetFormula);
          ExcelBuf.Modify;
          HasFormulaError := HasFormulaError or ThisCellHasFormulaError;
        until Next = 0;

    exit(HasFormulaError);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ExcelBuf.SETFILTER(Formula,'<>%1','');
    IF ExcelBuf.FINDSET THEN
      REPEAT
        ExcelBufFormula := ExcelBuf;
        ExcelBufFormula.INSERT;
      UNTIL ExcelBuf.NEXT = 0;
    ExcelBuf.RESET;

    WITH ExcelBufFormula DO
      IF FINDSET THEN
        REPEAT
          ThisCellHasFormulaError := FALSE;
          ExcelBuf.SETRANGE("Column No.",1);
          ExcelBuf.SETFILTER("Row No.",'<>%1',"Row No.");
          ExcelBuf.SETFILTER("Cell Value as Text",Formula);
          ExcelBufFormula2 := ExcelBufFormula;
          IF ExcelBuf.FINDSET THEN
            REPEAT
              IF NOT GET(ExcelBuf."Row No.","Column No.") THEN
                ExcelBuf.MARK(TRUE);
            UNTIL ExcelBuf.NEXT = 0;
          ExcelBufFormula := ExcelBufFormula2;
          ClearFormula;
          ExcelBuf.SETRANGE("Cell Value as Text");
          ExcelBuf.SETRANGE("Row No.");
          IF ExcelBuf.FINDSET THEN
            REPEAT
              IF ExcelBuf.MARK THEN BEGIN
                LastRow := ExcelBuf."Row No.";
                IF FirstRow = 0 THEN
                  FirstRow := LastRow;
              END ELSE
                IF FirstRow <> 0 THEN BEGIN
                  IF FirstRow = LastRow THEN
                    ThisCellHasFormulaError := AddToFormula(xlColID + FORMAT(FirstRow))
                  ELSE
                    ThisCellHasFormulaError :=
                      AddToFormula('SUM(' + xlColID + FORMAT(FirstRow) + ':' + xlColID + FORMAT(LastRow) + ')');
                  FirstRow := 0;
                  IF ThisCellHasFormulaError THEN
                    SetFormula(ExcelBuf.GetExcelReference(7));
                END;
            UNTIL ThisCellHasFormulaError OR (ExcelBuf.NEXT = 0);

          IF NOT ThisCellHasFormulaError AND (FirstRow <> 0) THEN BEGIN
            IF FirstRow = LastRow THEN
              ThisCellHasFormulaError := AddToFormula(xlColID + FORMAT(FirstRow))
            ELSE
              ThisCellHasFormulaError :=
                AddToFormula('SUM(' + xlColID + FORMAT(FirstRow) + ':' + xlColID + FORMAT(LastRow) + ')');
            FirstRow := 0;
            IF ThisCellHasFormulaError THEN
              SetFormula(ExcelBuf.GetExcelReference(7));
          END;

          ExcelBuf.RESET;
          ExcelBuf.GET("Row No.","Column No.");
          ExcelBuf.SetFormula(GetFormula);
          ExcelBuf.MODIFY;
          HasFormulaError := HasFormulaError OR ThisCellHasFormulaError;
        UNTIL NEXT = 0;

    EXIT(HasFormulaError);
    */
    //end;


    //Unsupported feature: Code Modification on "AddToFormula(PROCEDURE 12)".

    //procedure AddToFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LongFormula := GetFormula;
    if LongFormula = '' then
      LongFormula := '=';
    if LongFormula <> '=' then
      if StrLen(LongFormula) + 1 > MaxStrLen(LongFormula) then
        Overflow := true
      else
        LongFormula := LongFormula + '+';
    if StrLen(LongFormula) + StrLen(Text) > MaxStrLen(LongFormula) then
      Overflow := true
    else
      SetFormula(LongFormula + Text);
    exit(Overflow);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    LongFormula := GetFormula;
    IF LongFormula = '' THEN
      LongFormula := '=';
    IF LongFormula <> '=' THEN
      IF STRLEN(LongFormula) + 1 > MAXSTRLEN(LongFormula) THEN
        Overflow := TRUE
      ELSE
        LongFormula := LongFormula + '+';
    IF STRLEN(LongFormula) + STRLEN(Text) > MAXSTRLEN(LongFormula) THEN
      Overflow := TRUE
    ELSE
      SetFormula(LongFormula + Text);
    EXIT(Overflow);
    */
    //end;


    //Unsupported feature: Code Modification on "GetFormula(PROCEDURE 13)".

    //procedure GetFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(Formula + Formula2 + Formula3 + Formula4);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(Formula + Formula2 + Formula3 + Formula4);
    */
    //end;


    //Unsupported feature: Code Modification on "SetFormula(PROCEDURE 22)".

    //procedure SetFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ClearFormula;
    if LongFormula = '' then
      exit;

    Formula := CopyStr(LongFormula,1,MaxStrLen(Formula));
    if StrLen(LongFormula) > MaxStrLen(Formula) then
      Formula2 := CopyStr(LongFormula,MaxStrLen(Formula) + 1,MaxStrLen(Formula2));
    if StrLen(LongFormula) > MaxStrLen(Formula) + MaxStrLen(Formula2) then
      Formula3 := CopyStr(LongFormula,MaxStrLen(Formula) + MaxStrLen(Formula2) + 1,MaxStrLen(Formula3));
    if StrLen(LongFormula) > MaxStrLen(Formula) + MaxStrLen(Formula2) + MaxStrLen(Formula3) then
      Formula4 := CopyStr(LongFormula,MaxStrLen(Formula) + MaxStrLen(Formula2) + MaxStrLen(Formula3) + 1,MaxStrLen(Formula4));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ClearFormula;
    IF LongFormula = '' THEN
      EXIT;

    Formula := COPYSTR(LongFormula,1,MAXSTRLEN(Formula));
    IF STRLEN(LongFormula) > MAXSTRLEN(Formula) THEN
      Formula2 := COPYSTR(LongFormula,MAXSTRLEN(Formula) + 1,MAXSTRLEN(Formula2));
    IF STRLEN(LongFormula) > MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) THEN
      Formula3 := COPYSTR(LongFormula,MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + 1,MAXSTRLEN(Formula3));
    IF STRLEN(LongFormula) > MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + MAXSTRLEN(Formula3) THEN
      Formula4 := COPYSTR(LongFormula,MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + MAXSTRLEN(Formula3) + 1,MAXSTRLEN(Formula4));
    */
    //end;


    //Unsupported feature: Code Modification on "AddColumn(PROCEDURE 16)".

    //procedure AddColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CurrentRow < 1 then
      NewRow;

    CurrentCol := CurrentCol + 1;
    Init;
    Validate("Row No.",CurrentRow);
    Validate("Column No.",CurrentCol);
    if IsFormula then
      SetFormula(Format(Value))
    else
      "Cell Value as Text" := Format(Value);
    Comment := CommentText;
    Bold := IsBold;
    Italic := IsItalics;
    Underline := IsUnderline;
    NumberFormat := NumFormat;
    "Cell Type" := CellType;
    Insert;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF CurrentRow < 1 THEN
    #2..4
    INIT;
    VALIDATE("Row No.",CurrentRow);
    VALIDATE("Column No.",CurrentCol);
    IF IsFormula THEN
      SetFormula(FORMAT(Value))
    ELSE
      "Cell Value as Text" := FORMAT(Value);
    #12..17
    INSERT;
    */
    //end;


    //Unsupported feature: Code Modification on "StartRange(PROCEDURE 19)".

    //procedure StartRange();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempExcelBuf.Validate("Row No.",CurrentRow);
    TempExcelBuf.Validate("Column No.",CurrentCol);

    RangeStartXlRow := TempExcelBuf.xlRowID;
    RangeStartXlCol := TempExcelBuf.xlColID;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempExcelBuf.VALIDATE("Row No.",CurrentRow);
    TempExcelBuf.VALIDATE("Column No.",CurrentCol);
    #3..5
    */
    //end;


    //Unsupported feature: Code Modification on "EndRange(PROCEDURE 23)".

    //procedure EndRange();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempExcelBuf.Validate("Row No.",CurrentRow);
    TempExcelBuf.Validate("Column No.",CurrentCol);

    RangeEndXlRow := TempExcelBuf.xlRowID;
    RangeEndXlCol := TempExcelBuf.xlColID;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempExcelBuf.VALIDATE("Row No.",CurrentRow);
    TempExcelBuf.VALIDATE("Column No.",CurrentCol);
    #3..5
    */
    //end;


    //Unsupported feature: Code Modification on "AutoFit(PROCEDURE 20)".

    //procedure AutoFit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not IsNull(XlWrkBk) then
      XlHelper.AutoFitRangeColumns(XlWrkBk,ActiveSheetName,RangeName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT ISNULL(XlWrkBk) THEN
      XlHelper.AutoFitRangeColumns(XlWrkBk,ActiveSheetName,RangeName);
    */
    //end;


    //Unsupported feature: Code Modification on "BorderAround(PROCEDURE 39)".

    //procedure BorderAround();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not IsNull(XlWrkBk) then
      XlHelper.BorderAroundRange(XlWrkBk,ActiveSheetName,RangeName,1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT ISNULL(XlWrkBk) THEN
      XlHelper.BorderAroundRange(XlWrkBk,ActiveSheetName,RangeName,1);
    */
    //end;


    //Unsupported feature: Code Modification on "SetUseInfoSheet(PROCEDURE 25)".

    //procedure SetUseInfoSheet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UseInfoSheet := true;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UseInfoSheet := TRUE;
    */
    //end;


    //Unsupported feature: Code Modification on "AddInfoColumn(PROCEDURE 24)".

    //procedure AddInfoColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CurrentRow < 1 then
      NewRow;

    CurrentCol := CurrentCol + 1;
    Init;
    InfoExcelBuf.Validate("Row No.",CurrentRow);
    InfoExcelBuf.Validate("Column No.",CurrentCol);
    if IsFormula then
      InfoExcelBuf.SetFormula(Format(Value))
    else
      InfoExcelBuf."Cell Value as Text" := Format(Value);
    InfoExcelBuf.Bold := IsBold;
    InfoExcelBuf.Italic := IsItalics;
    InfoExcelBuf.Underline := IsUnderline;
    InfoExcelBuf.NumberFormat := NumFormat;
    InfoExcelBuf."Cell Type" := CellType;
    InfoExcelBuf.Insert;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF CurrentRow < 1 THEN
    #2..4
    INIT;
    InfoExcelBuf.VALIDATE("Row No.",CurrentRow);
    InfoExcelBuf.VALIDATE("Column No.",CurrentCol);
    IF IsFormula THEN
      InfoExcelBuf.SetFormula(FORMAT(Value))
    ELSE
      InfoExcelBuf."Cell Value as Text" := FORMAT(Value);
    #12..16
    InfoExcelBuf.INSERT;
    */
    //end;


    //Unsupported feature: Code Modification on "UTgetGlobalValue(PROCEDURE 35)".

    //procedure UTgetGlobalValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case globalVariable of
      'CurrentRow':
        value := CurrentRow;
      'CurrentCol':
    #5..14
        value := XlWrkShtWriter;
      'ExcelFile':
        value := FileNameServer;
      else
        Error(Text038,globalVariable);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE globalVariable OF
    #2..17
      ELSE
        ERROR(Text038,globalVariable);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "QuitExcel(PROCEDURE 29)".

    //procedure QuitExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Close and clear the OpenXml book
    CloseBook;

    // Clear the worksheet automation
    if not IsNull(XlWrkSht) then
      Clear(XlWrkSht);

    // Clear the workbook automation
    if not IsNull(XlWrkBk) then
      Clear(XlWrkBk);

    // Clear and quit the Excel application automation
    if not IsNull(XlApp) then begin
      XlHelper.CallQuit(XlApp);
      Clear(XlApp);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    IF NOT ISNULL(XlWrkSht) THEN
      CLEAR(XlWrkSht);

    // Clear the workbook automation
    IF NOT ISNULL(XlWrkBk) THEN
      CLEAR(XlWrkBk);

    // Clear and quit the Excel application automation
    IF NOT ISNULL(XlApp) THEN BEGIN
      XlHelper.CallQuit(XlApp);
      CLEAR(XlApp);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "OpenExcel(PROCEDURE 31)".

    //procedure OpenExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if OpenUsingDocumentService('') then
      exit;

    if not PreOpenExcel then
      exit;

    // rename the Temporary filename into a more UI friendly name in a new subdirectory
    FileNameClient := FileManagement.DownloadTempFile(FileNameServer);
    FileNameClient := FileManagement.MoveAndRenameClientFile(FileNameClient,GetFriendlyFilename,Format(CreateGuid));

    XlWrkBk := XlHelper.CallOpen(XlApp,FileNameClient);

    PostOpenExcel;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF OpenUsingDocumentService('') THEN
      EXIT;

    IF NOT PreOpenExcel THEN
      EXIT;
    #6..8
    FileNameClient := FileManagement.MoveAndRenameClientFile(FileNameClient,GetFriendlyFilename,FORMAT(CREATEGUID));
    #10..13
    */
    //end;


    //Unsupported feature: Code Modification on "DownloadAndOpenExcel(PROCEDURE 34)".

    //procedure DownloadAndOpenExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ClientFilename := GetFriendlyFilename;

    if FileManagement.CanRunDotNetOnClient then begin
      ClientFilename := FileManagement.SaveFileDialog('Save file','',Text034);
      if ClientFilename = '' then
        exit;
      if FileManagement.GetExtension(ClientFilename) = '' then
        ClientFilename += ExcelFileExtensionTok;
    end;

    OverwriteAndOpenExistingExcel(ClientFilename);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ClientFilename := GetFriendlyFilename;

    IF FileManagement.CanRunDotNetOnClient THEN BEGIN
      ClientFilename := FileManagement.SaveFileDialog('Save file','',Text034);
      IF ClientFilename = '' THEN
        EXIT;
      IF FileManagement.GetExtension(ClientFilename) = '' THEN
        ClientFilename += ExcelFileExtensionTok;
    END;

    OverwriteAndOpenExistingExcel(ClientFilename);
    */
    //end;


    //Unsupported feature: Code Modification on "OverwriteAndOpenExistingExcel(PROCEDURE 15)".

    //procedure OverwriteAndOpenExistingExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      Error(Text001);

    if OpenUsingDocumentService(FileName) then
      exit;

    if not PreOpenExcel then
      exit;

    FileManagement.DownloadToFile(FileNameServer,FileName);
    XlWrkBk := XlHelper.CallOpen(XlApp,FileName);

    PostOpenExcel;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      ERROR(Text001);

    IF OpenUsingDocumentService(FileName) THEN
      EXIT;

    IF NOT PreOpenExcel THEN
      EXIT;
    #9..13
    */
    //end;


    //Unsupported feature: Code Modification on "OpenExcelWithName(PROCEDURE 99)".

    //procedure OpenExcelWithName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      Error(Text001);

    if OpenUsingDocumentService(FileName) then
      exit;

    FileManagement.DownloadHandler(FileNameServer,'','',Text034,FileName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      ERROR(Text001);

    IF OpenUsingDocumentService(FileName) THEN
      EXIT;

    FileManagement.DownloadHandler(FileNameServer,'','',Text034,FileName);
    */
    //end;


    //Unsupported feature: Code Modification on "OpenUsingDocumentService(PROCEDURE 21)".

    //procedure OpenUsingDocumentService();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not Exists(FileNameServer) then
      Error(Text003,FileNameServer);

    // if document service is configured we save the generated document to SharePoint and open it from there.
    if DocumentServiceMgt.IsConfigured then begin
      if FileName = '' then
        FileName := 'Book.' + PathHelper.ChangeExtension(PathHelper.GetRandomFileName,'xlsx')
      else begin
        // if file is not applicable for the service it can not be opened using the document service.
        if not DocumentServiceMgt.IsServiceUri(FileName) then
          exit(false);

        FileName := FileMgt.GetFileName(FileName);
      end;

      DialogWindow.Open(StrSubstNo(SavingDocumentMsg,FileName));
      DocumentUrl := DocumentServiceMgt.SaveFile(FileNameServer,FileName,true);
      DocumentServiceMgt.OpenDocument(DocumentUrl);
      DialogWindow.Close;
      exit(true);
    end;

    exit(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT EXISTS(FileNameServer) THEN
      ERROR(Text003,FileNameServer);

    // if document service is configured we save the generated document to SharePoint and open it from there.
    IF DocumentServiceMgt.IsConfigured THEN BEGIN
      IF FileName = '' THEN
        FileName := 'Book.' + PathHelper.ChangeExtension(PathHelper.GetRandomFileName,'xlsx')
      ELSE BEGIN
        // if file is not applicable for the service it can not be opened using the document service.
        IF NOT DocumentServiceMgt.IsServiceUri(FileName) THEN
          EXIT(FALSE);

        FileName := FileMgt.GetFileName(FileName);
      END;

      DialogWindow.OPEN(STRSUBSTNO(SavingDocumentMsg,FileName));
      DocumentUrl := DocumentServiceMgt.SaveFile(FileNameServer,FileName,TRUE);
      DocumentServiceMgt.OpenDocument(DocumentUrl);
      DialogWindow.CLOSE;
      EXIT(TRUE);
    END;

    EXIT(FALSE);
    */
    //end;


    //Unsupported feature: Code Modification on "PreOpenExcel(PROCEDURE 7)".

    //procedure PreOpenExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not Exists(FileNameServer) then
      Error(Text003,FileNameServer);

    // Download file, if none RTC it should return a filename, and use client automation instead.
    if not FileManagement.CanRunDotNetOnClient then begin
      if not FileManagement.DownloadHandler(FileNameServer,Text040,'',Text034,GetFriendlyFilename) then
        Error(Text001);
      exit(false);
    end;

    XlApp := XlApp.ApplicationClass;
    if IsNull(XlApp) then
      Error(Text000);

    exit(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT EXISTS(FileNameServer) THEN
      ERROR(Text003,FileNameServer);

    // Download file, if none RTC it should return a filename, and use client automation instead.
    IF NOT FileManagement.CanRunDotNetOnClient THEN BEGIN
      IF NOT FileManagement.DownloadHandler(FileNameServer,Text040,'',Text034,GetFriendlyFilename) THEN
        ERROR(Text001);
      EXIT(FALSE);
    END;

    XlApp := XlApp.ApplicationClass;
    IF ISNULL(XlApp) THEN
      ERROR(Text000);

    EXIT(TRUE);
    */
    //end;


    //Unsupported feature: Code Modification on "PostOpenExcel(PROCEDURE 8)".

    //procedure PostOpenExcel();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    XlWrkBk := XlApp.ActiveWorkbook;

    if IsNull(XlWrkBk) then
      Error(Text036);

    // autofit all columns on all worksheets
    XlHelper.AutoFitColumnsInAllWorksheets(XlWrkBk);

    // activate the previous saved sheet name in the workbook
    XlHelper.ActivateSheet(XlWrkBk,ActiveSheetName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    XlWrkBk := XlApp.ActiveWorkbook;

    IF ISNULL(XlWrkBk) THEN
      ERROR(Text036);
    #5..10
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateProgressDialog(PROCEDURE 36)".

    //procedure UpdateProgressDialog();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Refresh at 100%, and every second in between 0% to 100%
    // Duration is measured in miliseconds -> 1 sec = 1000 ms
    CurrentTime := CurrentDateTime;
    if (CurrentCount = TotalCount) or (CurrentTime - LastUpdate >= 1000) then begin
      LastUpdate := CurrentTime;
      ExcelBufferDialogManagement.SetProgress(Round(CurrentCount / TotalCount * 10000,1));
      if not ExcelBufferDialogManagement.Run then
        exit(false);
    end;

    exit(true)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // Refresh at 100%, and every second in between 0% to 100%
    // Duration is measured in miliseconds -> 1 sec = 1000 ms
    CurrentTime := CURRENTDATETIME;
    IF (CurrentCount = TotalCount) OR (CurrentTime - LastUpdate >= 1000) THEN BEGIN
      LastUpdate := CurrentTime;
      ExcelBufferDialogManagement.SetProgress(ROUND(CurrentCount / TotalCount * 10000,1));
      IF NOT ExcelBufferDialogManagement.RUN THEN
        EXIT(FALSE);
    END;

    EXIT(TRUE)
    */
    //end;


    //Unsupported feature: Code Modification on "GetFriendlyFilename(PROCEDURE 46)".

    //procedure GetFriendlyFilename();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FriendlyName = '' then
      exit('Book1' + ExcelFileExtensionTok);

    exit(FileManagement.StripNotsupportChrInFileName(FriendlyName) + ExcelFileExtensionTok);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FriendlyName = '' THEN
      EXIT('Book1' + ExcelFileExtensionTok);

    EXIT(FileManagement.StripNotsupportChrInFileName(FriendlyName) + ExcelFileExtensionTok);
    */
    //end;


    //Unsupported feature: Code Modification on "ConvertDateTimeDecimalToDateTime(PROCEDURE 43)".

    //procedure ConvertDateTimeDecimalToDateTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DotNetDateTime := DotNetDateTime.FromOADate(DateTimeAsOADate);
    DotNetDateTimeWithKind := DotNetDateTime.DateTime(DotNetDateTime.Ticks,DotNetDateTimeKind.Local);
    exit(DotNetDateTimeWithKind);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DotNetDateTime := DotNetDateTime.FromOADate(DateTimeAsOADate);
    DotNetDateTimeWithKind := DotNetDateTime.DateTime(DotNetDateTime.Ticks,DotNetDateTimeKind.Local);
    EXIT(DotNetDateTimeWithKind);
    */
    //end;


    //Unsupported feature: Code Modification on "OnlyCreateBook(PROCEDURE 1500203)".

    //procedure OnlyCreateBook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ExcelBookCreated := BookCreated;
    NewSheetName := SheetName;
    if not BookCreated then
      CreateBook('',SheetName);
    CurrentRow := 0;
    CurrentCol := 0;
    WriteSheet(ReportHeader,CompayName,UserID2);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ExcelBookCreated := BookCreated;
    NewSheetName := SheetName;
    IF NOT BookCreated THEN
    #4..7
    */
    //end;
}

