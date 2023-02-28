tableextension 50075 "LKSBusinessChartBufferExt" extends "Business Chart Buffer"
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Error(Text002,TableCaption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ERROR(Text002,TABLECAPTION);
    */
    //end;


    //Unsupported feature: Code Modification on "Initialize(PROCEDURE 2)".

    //procedure Initialize();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not IsInitialized then begin
      dotNetDataTable := dotNetDataTable.DataTable('DataTable');
      dotNetCultureInfo := dotNetCultureInfo.CultureInfo(WindowsLanguage);
      dotNetDataTable.Locale := dotNetCultureInfo.InvariantCulture;

      dotNetChartData := dotNetChartData.BusinessChartData;
      IsInitialized := true;
    end;
    dotNetDataTable.Clear;
    dotNetDataTable.Columns.Clear;
    dotNetChartData.ClearMeasures;
    ClearMap(TempBusChartMapToColumn);
    ClearMap(TempBusChartMapToMeasure);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT IsInitialized THEN BEGIN
      dotNetDataTable := dotNetDataTable.DataTable('DataTable');
      dotNetCultureInfo := dotNetCultureInfo.CultureInfo(WINDOWSLANGUAGE);
    #4..6
      IsInitialized := TRUE;
    END;
    #9..13
    */
    //end;


    //Unsupported feature: Code Modification on "ClearMap(PROCEDURE 16)".

    //procedure ClearMap();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    BusChartMap.Reset;
    BusChartMap.DeleteAll;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    BusChartMap.RESET;
    BusChartMap.DELETEALL;
    */
    //end;


    //Unsupported feature: Code Modification on "SetPeriodXAxis(PROCEDURE 38)".

    //procedure SetPeriodXAxis();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Period Length" = "Period Length"::Day then
      DataType := "Data Type"::DateTime
    else
      DataType := "Data Type"::String;
    SetXAxis(Format("Period Length"),DataType);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "Period Length" = "Period Length"::Day THEN
      DataType := "Data Type"::DateTime
    ELSE
      DataType := "Data Type"::String;
    SetXAxis(FORMAT("Period Length"),DataType);
    */
    //end;


    //Unsupported feature: Code Modification on "GetXCaption(PROCEDURE 35)".

    //procedure GetXCaption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(dotNetChartData.XDimension);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(dotNetChartData.XDimension);
    */
    //end;


    //Unsupported feature: Code Modification on "AddMeasure(PROCEDURE 4)".

    //procedure AddMeasure();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Data Type" := ValueType;
    if not ("Data Type" in ["Data Type"::Integer,"Data Type"::Decimal]) then
      Error(Text001,Caption);
    AddDataColumn(Caption,ValueType);
    DotNetChartType := ChartType;
    dotNetChartData.AddMeasure(Caption,DotNetChartType);
    TempBusChartMapToMeasure.Add(
      CopyStr(Caption,1,MaxStrLen(TempBusChartMapToMeasure.Name)),Value);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Data Type" := ValueType;
    IF NOT ("Data Type" IN ["Data Type"::Integer,"Data Type"::Decimal]) THEN
      ERROR(Text001,Caption);
    #4..7
      COPYSTR(Caption,1,MAXSTRLEN(TempBusChartMapToMeasure.Name)),Value);
    */
    //end;


    //Unsupported feature: Code Modification on "GetMaxNumberOfMeasures(PROCEDURE 40)".

    //procedure GetMaxNumberOfMeasures();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MaximumNumberOfColoursInChart := 6;
    exit(MaximumNumberOfColoursInChart);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    MaximumNumberOfColoursInChart := 6;
    EXIT(MaximumNumberOfColoursInChart);
    */
    //end;


    //Unsupported feature: Code Modification on "RaiseErrorMaxNumberOfMeasuresExceeded(PROCEDURE 42)".

    //procedure RaiseErrorMaxNumberOfMeasuresExceeded();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Error(Text003,GetMaxNumberOfMeasures);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ERROR(Text003,GetMaxNumberOfMeasures);
    */
    //end;


    //Unsupported feature: Code Modification on "AddColumn(PROCEDURE 9)".

    //procedure AddColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ConvertDateToDateTime(Value);
    Caption := Format(Value,0,9);
    AddColumnWithCaption(Value,Caption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ConvertDateToDateTime(Value);
    Caption := FORMAT(Value,0,9);
    AddColumnWithCaption(Value,Caption);
    */
    //end;


    //Unsupported feature: Code Modification on "AddPeriods(PROCEDURE 32)".

    //procedure AddPeriods();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    NumberOfPeriods := CalcNumberOfPeriods(FromDate,ToDate);
    for ColumnNo := 1 to NumberOfPeriods do begin
      ToDate := CalcToDate(FromDate);
      AddPeriodColumn(ToDate);
      FromDate := CalcDate('<1D>',ToDate);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    NumberOfPeriods := CalcNumberOfPeriods(FromDate,ToDate);
    FOR ColumnNo := 1 TO NumberOfPeriods DO BEGIN
      ToDate := CalcToDate(FromDate);
      AddPeriodColumn(ToDate);
      FromDate := CALCDATE('<1D>',ToDate);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "AddPeriodColumn(PROCEDURE 34)".

    //procedure AddPeriodColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ConvertDateToDateTime(Value);
    Caption := GetPeriodCaption(Value);
    if "Period Length" = "Period Length"::Day then
      AddColumnWithCaption(Value,Format(Value,0,9))
    else
      AddColumnWithCaption(Value,Caption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ConvertDateToDateTime(Value);
    Caption := GetPeriodCaption(Value);
    IF "Period Length" = "Period Length"::Day THEN
      AddColumnWithCaption(Value,FORMAT(Value,0,9))
    ELSE
      AddColumnWithCaption(Value,Caption);
    */
    //end;


    //Unsupported feature: Code Modification on "ConvertDateToDateTime(PROCEDURE 36)".

    //procedure ConvertDateToDateTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsXAxisDateTime and Value.IsDate then
      Value := CreateDateTime(Value,120000T);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF IsXAxisDateTime AND Value.ISDATE THEN
      Value := CREATEDATETIME(Value,120000T);
    */
    //end;


    //Unsupported feature: Code Modification on "GetSystemTypeName(PROCEDURE 6)".

    //procedure GetSystemTypeName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case Type of
      "Data Type"::String:
        exit('System.String');
      "Data Type"::Integer:
        exit('System.Int32');
      "Data Type"::Decimal:
        exit('System.Decimal');
      "Data Type"::DateTime:
        exit('System.DateTime');
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE Type OF
      "Data Type"::String:
        EXIT('System.String');
      "Data Type"::Integer:
        EXIT('System.Int32');
      "Data Type"::Decimal:
        EXIT('System.Decimal');
      "Data Type"::DateTime:
        EXIT('System.DateTime');
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstMeasure(PROCEDURE 23)".

    //procedure FindFirstMeasure();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempBusChartMapToMeasure.Reset;
    Result := TempBusChartMapToMeasure.FindSet;
    BusChartMap := TempBusChartMapToMeasure;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempBusChartMapToMeasure.RESET;
    Result := TempBusChartMapToMeasure.FINDSET;
    BusChartMap := TempBusChartMapToMeasure;
    */
    //end;


    //Unsupported feature: Code Modification on "NextMeasure(PROCEDURE 24)".

    //procedure NextMeasure();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Result := TempBusChartMapToMeasure.Next <> 0;
    BusChartMap := TempBusChartMapToMeasure;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Result := TempBusChartMapToMeasure.NEXT <> 0;
    BusChartMap := TempBusChartMapToMeasure;
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstColumn(PROCEDURE 21)".

    //procedure FindFirstColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempBusChartMapToColumn.Reset;
    Result := TempBusChartMapToColumn.FindSet;
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempBusChartMapToColumn.RESET;
    Result := TempBusChartMapToColumn.FINDSET;
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;


    //Unsupported feature: Code Modification on "FindMidColumn(PROCEDURE 29)".

    //procedure FindMidColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempBusChartMapToColumn.Reset;
    TempBusChartMapToColumn.FindLast;
    MidColumnIndex := -Round(TempBusChartMapToColumn.Count div 2);
    Result := MidColumnIndex = TempBusChartMapToColumn.Next(MidColumnIndex);
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempBusChartMapToColumn.RESET;
    TempBusChartMapToColumn.FINDLAST;
    MidColumnIndex := -ROUND(TempBusChartMapToColumn.COUNT DIV 2);
    Result := MidColumnIndex = TempBusChartMapToColumn.NEXT(MidColumnIndex);
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;


    //Unsupported feature: Code Modification on "NextColumn(PROCEDURE 22)".

    //procedure NextColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Result := TempBusChartMapToColumn.Next <> 0;
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Result := TempBusChartMapToColumn.NEXT <> 0;
    BusChartMap := TempBusChartMapToColumn;
    */
    //end;


    //Unsupported feature: Code Modification on "GetXValueAsDate(PROCEDURE 19)".

    //procedure GetXValueAsDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsXAxisDateTime then begin
      GetXValue(XIndex,Value);
      exit(Variant2Date(Value));
    end;
    TempBusChartMapToColumn.Get(XIndex);
    exit(TempBusChartMapToColumn.GetValueAsDate);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF IsXAxisDateTime THEN BEGIN
      GetXValue(XIndex,Value);
      EXIT(VARIANT2DATE(Value));
    END;
    TempBusChartMapToColumn.GET(XIndex);
    EXIT(TempBusChartMapToColumn.GetValueAsDate);
    */
    //end;


    //Unsupported feature: Code Modification on "GetMeasureValueString(PROCEDURE 8)".

    //procedure GetMeasureValueString();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(TempBusChartMapToMeasure.GetValueString(MeasureIndex));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(TempBusChartMapToMeasure.GetValueString(MeasureIndex));
    */
    //end;


    //Unsupported feature: Code Modification on "GetMeasureName(PROCEDURE 41)".

    //procedure GetMeasureName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(TempBusChartMapToMeasure.GetName(MeasureIndex));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(TempBusChartMapToMeasure.GetName(MeasureIndex));
    */
    //end;


    //Unsupported feature: Code Modification on "GetCurrMeasureValueString(PROCEDURE 12)".

    //procedure GetCurrMeasureValueString();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(TempBusChartMapToMeasure.GetValueString("Drill-Down Measure Index"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(TempBusChartMapToMeasure.GetValueString("Drill-Down Measure Index"));
    */
    //end;


    //Unsupported feature: Code Modification on "SetDrillDownIndexes(PROCEDURE 1)".

    //procedure SetDrillDownIndexes();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MeasureName := dotNetPoint.Measures.GetValue(0);
    "Drill-Down Measure Index" := TempBusChartMapToMeasure.GetIndex(MeasureName);

    XValueString := dotNetPoint.XValueString;
    if IsXAxisDateTime then
      XValueString := GetDateString(XValueString);
    "Drill-Down X Index" := TempBusChartMapToColumn.GetIndex(XValueString);

    if Evaluate(YValue,Format(dotNetPoint.YValues.GetValue(0))) then
      "Drill-Down Y Value" := YValue;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    IF IsXAxisDateTime THEN
    #6..8
    IF EVALUATE(YValue,FORMAT(dotNetPoint.YValues.GetValue(0))) THEN
      "Drill-Down Y Value" := YValue;
    */
    //end;


    //Unsupported feature: Code Modification on "GetDateString(PROCEDURE 17)".

    //procedure GetDateString();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Evaluate(Days,XValueString,9) then begin
      DateTime := CreateDateTime(DMY2Date(30,12,1899) + Round(Days,1,'<'),120000T);
      exit(Format(DateTime,0,9));
    end;
    exit(XValueString);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF EVALUATE(Days,XValueString,9) THEN BEGIN
      DateTime := CREATEDATETIME(DMY2DATE(30,12,1899) + ROUND(Days,1,'<'),120000T);
      EXIT(FORMAT(DateTime,0,9));
    END;
    EXIT(XValueString);
    */
    //end;


    //Unsupported feature: Code Modification on "IsXAxisDateTime(PROCEDURE 26)".

    //procedure IsXAxisDateTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(Format(dotNetDataTable.Columns.Item(0).DataType) = 'System.DateTime')
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(FORMAT(dotNetDataTable.Columns.Item(0).DataType) = 'System.DateTime')
    */
    //end;


    //Unsupported feature: Code Modification on "WriteToXML(PROCEDURE 48)".

    //procedure WriteToXML();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    XML.CreateOutStream(OutStream);
    dotNetDataTable.WriteXml(OutStream);
    XML.CreateInStream(InStream);
    while not InStream.EOS do begin
      InStream.ReadText(XMLLine);
      XMLText := XMLText + XMLLine;
    end;
    XMLElement := XMLDoc.CreateElement('DataTable','test','');
    XMLElement.InnerXml(XMLText);
    XMLDoc.AppendChild(XMLElement);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    XML.CREATEOUTSTREAM(OutStream);
    dotNetDataTable.WriteXml(OutStream);
    XML.CREATEINSTREAM(InStream);
    WHILE NOT InStream.EOS DO BEGIN
      InStream.READTEXT(XMLLine);
      XMLText := XMLText + XMLLine;
    END;
    #8..10
    */
    //end;


    //Unsupported feature: Code Modification on "CalcFromDate(PROCEDURE 18)".

    //procedure CalcFromDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(CalcPeriodDate(Date,true));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(CalcPeriodDate(Date,TRUE));
    */
    //end;


    //Unsupported feature: Code Modification on "CalcToDate(PROCEDURE 13)".

    //procedure CalcToDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(CalcPeriodDate(Date,false));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(CalcPeriodDate(Date,FALSE));
    */
    //end;


    //Unsupported feature: Code Modification on "CalcPeriodDate(PROCEDURE 39)".

    //procedure CalcPeriodDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Date = 0D then
      exit(Date);

    case "Period Length" of
      "Period Length"::Day:
        exit(Date);
      "Period Length"::Week,
      "Period Length"::Month,
      "Period Length"::Quarter,
      "Period Length"::Year:
        begin
          if CalcStartDate then
            Modificator := '-';
          exit(CalcDate(StrSubstNo('<%1C%2>',Modificator,GetPeriodLength),Date));
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF Date = 0D THEN
      EXIT(Date);

    CASE "Period Length" OF
      "Period Length"::Day:
        EXIT(Date);
    #7..10
        BEGIN
          IF CalcStartDate THEN
            Modificator := '-';
          EXIT(CALCDATE(STRSUBSTNO('<%1C%2>',Modificator,GetPeriodLength),Date));
        END;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "CalcNumberOfPeriods(PROCEDURE 28)".

    //procedure CalcNumberOfPeriods();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FromDate = ToDate then
      exit(1);
    if ToDate < FromDate then
      SwapDates(FromDate,ToDate);

    case "Period Length" of
      "Period Length"::Day:
        NumberOfPeriods := ToDate - FromDate;
      "Period Length"::Week:
        NumberOfPeriods := (CalcDate('<-CW>',ToDate) - CalcDate('<-CW>',FromDate)) div 7;
      "Period Length"::Month:
        NumberOfPeriods := Date2DMY(ToDate,2) - Date2DMY(FromDate,2) + GetNumberOfYears(FromDate,ToDate) * 12;
      "Period Length"::Quarter:
        NumberOfPeriods := GetQuarterIndex(ToDate) - GetQuarterIndex(FromDate) + GetNumberOfYears(FromDate,ToDate) * 4;
      "Period Length"::Year:
        NumberOfPeriods := GetNumberOfYears(FromDate,ToDate);
    end;
    exit(NumberOfPeriods + 1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FromDate = ToDate THEN
      EXIT(1);
    IF ToDate < FromDate THEN
      SwapDates(FromDate,ToDate);

    CASE "Period Length" OF
    #7..9
        NumberOfPeriods := (CALCDATE('<-CW>',ToDate) - CALCDATE('<-CW>',FromDate)) DIV 7;
      "Period Length"::Month:
        NumberOfPeriods := DATE2DMY(ToDate,2) - DATE2DMY(FromDate,2) + GetNumberOfYears(FromDate,ToDate) * 12;
    #13..16
    END;
    EXIT(NumberOfPeriods + 1);
    */
    //end;


    //Unsupported feature: Code Modification on "GetNumberOfYears(PROCEDURE 25)".

    //procedure GetNumberOfYears();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(Date2DMY(ToDate,3) - Date2DMY(FromDate,3));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT(DATE2DMY(ToDate,3) - DATE2DMY(FromDate,3));
    */
    //end;


    //Unsupported feature: Code Modification on "GetQuarterIndex(PROCEDURE 20)".

    //procedure GetQuarterIndex();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit((Date2DMY(Date,2) - 1) div 3 + 1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EXIT((DATE2DMY(Date,2) - 1) DIV 3 + 1);
    */
    //end;


    //Unsupported feature: Code Modification on "GetPeriodLength(PROCEDURE 31)".

    //procedure GetPeriodLength();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case "Period Length" of
      "Period Length"::Day:
        exit('D');
      "Period Length"::Week:
        exit('W');
      "Period Length"::Month:
        exit('M');
      "Period Length"::Quarter:
        exit('Q');
      "Period Length"::Year:
        exit('Y');
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE "Period Length" OF
      "Period Length"::Day:
        EXIT('D');
      "Period Length"::Week:
        EXIT('W');
      "Period Length"::Month:
        EXIT('M');
      "Period Length"::Quarter:
        EXIT('Q');
      "Period Length"::Year:
        EXIT('Y');
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "GetPeriodCaption(PROCEDURE 33)".

    //procedure GetPeriodCaption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Date.IsDateTime or Date.IsDate then
      exit(PeriodFormManagement.CreatePeriodFormat("Period Length",Date));
    exit(Format(Date,0,9));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF Date.ISDATETIME OR Date.ISDATE THEN
      EXIT(PeriodFormManagement.CreatePeriodFormat("Period Length",Date));
    EXIT(FORMAT(Date,0,9));
    */
    //end;


    //Unsupported feature: Code Modification on "RecalculatePeriodFilter(PROCEDURE 44)".

    //procedure RecalculatePeriodFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if StartDate <> 0D then begin
      Calendar.SetFilter("Period Start",'%1..%2',StartDate,EndDate);
      if not PeriodFormMgt.FindDate('+',Calendar,"Period Length") then
        PeriodFormMgt.FindDate('+',Calendar,Calendar."Period Type"::Date);
      Calendar.SetRange("Period Start");
    end;

    case MovePeriod of
      MovePeriod::Next:
        SearchText := '>=';
      MovePeriod::Previous:
        SearchText := '<=';
      else
        SearchText := '';
    end;

    PeriodFormMgt.FindDate(SearchText,Calendar,"Period Length");

    StartDate := Calendar."Period Start";
    EndDate := Calendar."Period End";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF StartDate <> 0D THEN BEGIN
      Calendar.SETFILTER("Period Start",'%1..%2',StartDate,EndDate);
      IF NOT PeriodFormMgt.FindDate('+',Calendar,"Period Length") THEN
        PeriodFormMgt.FindDate('+',Calendar,Calendar."Period Type"::Date);
      Calendar.SETRANGE("Period Start");
    END;

    CASE MovePeriod OF
    #9..12
      ELSE
        SearchText := '';
    END;
    #16..20
    */
    //end;
}

