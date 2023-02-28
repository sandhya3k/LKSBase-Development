tableextension 50092 "LKSCustReportLayoutExt" extends "Custom Report Layout"
{
    LookupPageID = "Custom Report Layouts";
    DrillDownPageID = "Custom Report Layouts";
    fields
    {
        modify("Report ID")
        {
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(Report));
        }

        //Unsupported feature: Property Modification (CalcFormula) on ""Report Name"(Field 3)".

    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Report ID");
    SetUpdated;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD("Report ID");
    SetUpdated;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Report ID");
    SetUpdated;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD("Report ID");
    SetUpdated;
    */
    //end;


    //Unsupported feature: Code Modification on "SetUpdated(PROCEDURE 2)".

    //procedure SetUpdated();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified" := RoundDateTime(CurrentDateTime);
    "Last Modified by User" := UserId;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Last Modified" := ROUNDDATETIME(CURRENTDATETIME);
    "Last Modified by User" := USERID;
    */
    //end;


    //Unsupported feature: Code Modification on "InitBuiltInLayout(PROCEDURE 11)".

    //procedure InitBuiltInLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ReportID = 0 then
      exit;
    CustomReportLayout.Init;
    CustomReportLayout."Report ID" := ReportID;
    CustomReportLayout.Type := LayoutType;
    CustomReportLayout.Description := CopyStr(StrSubstNo(CopyOfTxt,BuiltInTxt),1,MaxStrLen(Description));

    case LayoutType of
      CustomReportLayout.Type::Word:
        begin
          CustomReportLayout.Layout.CreateOutStream(OutStr);
          if not REPORT.WordLayout(ReportID,InStr) then begin
            DocumentReportMgt.NewWordLayout(ReportID,OutStr);
            CustomReportLayout.Description := CopyStr(NewLayoutTxt,1,MaxStrLen(Description));
          end else
            CopyStream(OutStr,InStr);
        end;
      CustomReportLayout.Type::RDLC:
        begin
          CustomReportLayout.Layout.CreateOutStream(OutStr);
          if REPORT.RdlcLayout(ReportID,InStr) then
            CopyStream(OutStr,InStr);
        end;
    end;

    InsertCustomXmlPart(CustomReportLayout);

    CustomReportLayout.ID := 0;
    CustomReportLayout.Insert(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ReportID = 0 THEN
      EXIT;
    CustomReportLayout.INIT;
    CustomReportLayout."Report ID" := ReportID;
    CustomReportLayout.Type := LayoutType;
    CustomReportLayout.Description := COPYSTR(STRSUBSTNO(CopyOfTxt,BuiltInTxt),1,MAXSTRLEN(Description));

    CASE LayoutType OF
      CustomReportLayout.Type::Word:
        BEGIN
          CustomReportLayout.Layout.CREATEOUTSTREAM(OutStr);
          IF NOT REPORT.WORDLAYOUT(ReportID,InStr) THEN BEGIN
            DocumentReportMgt.NewWordLayout(ReportID,OutStr);
            CustomReportLayout.Description := COPYSTR(NewLayoutTxt,1,MAXSTRLEN(Description));
          END ELSE
            COPYSTREAM(OutStr,InStr);
        END;
      CustomReportLayout.Type::RDLC:
        BEGIN
          CustomReportLayout.Layout.CREATEOUTSTREAM(OutStr);
          IF REPORT.RDLCLAYOUT(ReportID,InStr) THEN
            COPYSTREAM(OutStr,InStr);
        END;
    END;
    #25..28
    CustomReportLayout.INSERT(TRUE);
    */
    //end;


    //Unsupported feature: Code Modification on "InsertBuiltInLayout(PROCEDURE 13)".

    //procedure InsertBuiltInLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FilterGroup(4);
    if GetFilter("Report ID") = '' then
      FilterGroup(0);
    if GetFilter("Report ID") <> '' then
      if Evaluate(ReportID,GetFilter("Report ID")) then
        ReportLayoutLookup.SetReportID(ReportID);
    FilterGroup(0);
    if ReportLayoutLookup.RunModal = ACTION::OK then begin
      if ReportLayoutLookup.SelectedAddWordLayot then
        InitBuiltInLayout(ReportLayoutLookup.SelectedReportID,Type::Word);
      if ReportLayoutLookup.SelectedAddRdlcLayot then
        InitBuiltInLayout(ReportLayoutLookup.SelectedReportID,Type::RDLC);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FILTERGROUP(4);
    IF GETFILTER("Report ID") = '' THEN
      FILTERGROUP(0);
    IF GETFILTER("Report ID") <> '' THEN
      IF EVALUATE(ReportID,GETFILTER("Report ID")) THEN
        ReportLayoutLookup.SetReportID(ReportID);
    FILTERGROUP(0);
    IF ReportLayoutLookup.RUNMODAL = ACTION::OK THEN BEGIN
      IF ReportLayoutLookup.SelectedAddWordLayot THEN
        InitBuiltInLayout(ReportLayoutLookup.SelectedReportID,Type::Word);
      IF ReportLayoutLookup.SelectedAddRdlcLayot THEN
        InitBuiltInLayout(ReportLayoutLookup.SelectedReportID,Type::RDLC);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "GetCustomRdlc(PROCEDURE 10)".

    //procedure GetCustomRdlc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Temporarily selected layout for Design-time report execution?
    if ReportLayoutSelection.GetTempLayoutSelected <> 0 then
      CustomLayoutID := ReportLayoutSelection.GetTempLayoutSelected
    else  // Normal selection
      if ReportLayoutSelection.HasCustomLayout(ReportID) = 1 then
        CustomLayoutID := ReportLayoutSelection."Custom Report Layout ID";

    if (CustomLayoutID <> 0) and Get(CustomLayoutID) then begin
      TestField(Type,Type::RDLC);
      if UpdateLayout(true,false) then
        Commit; // Save the updated layout
      CalcFields(Layout);
      Layout.CreateInStream(InStream,TEXTENCODING::UTF8);
    end else
      REPORT.RdlcLayout(ReportID,InStream);
    InStream.Read(RdlcTxt);

    exit(RdlcTxt);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // Temporarily selected layout for Design-time report execution?
    IF ReportLayoutSelection.GetTempLayoutSelected <> 0 THEN
      CustomLayoutID := ReportLayoutSelection.GetTempLayoutSelected
    ELSE  // Normal selection
      IF ReportLayoutSelection.HasCustomLayout(ReportID) = 1 THEN
        CustomLayoutID := ReportLayoutSelection."Custom Report Layout ID";

    IF (CustomLayoutID <> 0) AND GET(CustomLayoutID) THEN BEGIN
      TESTFIELD(Type,Type::RDLC);
      IF UpdateLayout(TRUE,FALSE) THEN
        COMMIT; // Save the updated layout
      CALCFIELDS(Layout);
      Layout.CREATEINSTREAM(InStream,TEXTENCODING::UTF8);
    END ELSE
      REPORT.RDLCLAYOUT(ReportID,InStream);
    InStream.READ(RdlcTxt);

    EXIT(RdlcTxt);
    */
    //end;


    //Unsupported feature: Code Modification on "CopyRecord(PROCEDURE 7)".

    //procedure CopyRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsEmpty then
      Error(NoRecordsErr);
    CalcFields(Layout);
    Description := CopyStr(StrSubstNo(CopyOfTxt,Description),1,MaxStrLen(Description));
    ID := 0;
    CalcFields("Custom XML Part");
    if not "Custom XML Part".HasValue then
      InsertCustomXmlPart(Rec);

    Insert(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ISEMPTY THEN
      ERROR(NoRecordsErr);
    CALCFIELDS(Layout);
    Description := COPYSTR(STRSUBSTNO(CopyOfTxt,Description),1,MAXSTRLEN(Description));
    ID := 0;
    CALCFIELDS("Custom XML Part");
    IF NOT "Custom XML Part".HASVALUE THEN
      InsertCustomXmlPart(Rec);

    INSERT(TRUE);
    */
    //end;


    //Unsupported feature: Code Modification on "ImportLayout(PROCEDURE 6)".

    //procedure ImportLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsEmpty then
      Error(NoRecordsErr);
    case Type of
      Type::Word:
        begin
          ImportTxt := ImportWordTxt;
          FileFilterTxt := FileFilterWordTxt;
        end;
      Type::RDLC:
        begin
          ImportTxt := ImportRdlcTxt;
          FileFilterTxt := FileFilterRdlcTxt;
        end;
    end;
    FileName := FileMgt.BLOBImportWithFilter(TempBlob,ImportTxt,DefaultFileName,FileFilterTxt,FileFilterTxt);
    if FileName = '' then
      exit;

    ImportLayoutBlob(TempBlob,UpperCase(FileMgt.GetExtension(FileName)));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ISEMPTY THEN
      ERROR(NoRecordsErr);
    CASE Type OF
      Type::Word:
        BEGIN
          ImportTxt := ImportWordTxt;
          FileFilterTxt := FileFilterWordTxt;
        END;
      Type::RDLC:
        BEGIN
          ImportTxt := ImportRdlcTxt;
          FileFilterTxt := FileFilterRdlcTxt;
        END;
    END;
    FileName := FileMgt.BLOBImportWithFilter(TempBlob,ImportTxt,DefaultFileName,FileFilterTxt,FileFilterTxt);
    IF FileName = '' THEN
      EXIT;

    ImportLayoutBlob(TempBlob,UPPERCASE(FileMgt.GetExtension(FileName)));
    */
    //end;


    //Unsupported feature: Code Modification on "ImportLayoutBlob(PROCEDURE 17)".

    //procedure ImportLayoutBlob();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Layout is stored in the DocumentInStream (RDLC requires UTF8 encoding for which reason is stream is created in the case block.
    // Result is stored in the DocumentOutStream (..)
    TestField("Report ID");
    OutputTempBlob.Blob.CreateOutStream(DocumentOutStream);
    XmlPart := REPORT.WordXmlPart("Report ID",true);

    case Type of
      Type::Word:
        begin
          // Run update
          TempBlob.Blob.CreateInStream(DocumentInStream);
          ErrorMessage := DocumentReportMgt.TryUpdateWordLayout(DocumentInStream,DocumentOutStream,'',XmlPart);
          // Validate the Word document layout against the layout of the current report
          if ErrorMessage = '' then begin
            CopyStream(DocumentOutStream,DocumentInStream);
            DocumentReportMgt.ValidateWordLayout("Report ID",DocumentInStream,true,true);
          end;
        end;
      Type::RDLC:
        begin
          // Update the Rdlc document layout against the layout of the current report
          TempBlob.Blob.CreateInStream(DocumentInStream,TEXTENCODING::UTF8);
          ErrorMessage := DocumentReportMgt.TryUpdateRdlcLayout("Report ID",DocumentInStream,DocumentOutStream,'',XmlPart,false);
        end;
    end;

    Clear(Layout);
    Layout := OutputTempBlob.Blob;

    if FileExtension <> '' then
      "File Extension" := FileExtension;
    InsertCustomXmlPart(Rec);
    Modify(true);
    Commit;

    if ErrorMessage <> '' then
      Message(ErrorMessage);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // Layout is stored in the DocumentInStream (RDLC requires UTF8 encoding for which reason is stream is created in the case block.
    // Result is stored in the DocumentOutStream (..)
    TESTFIELD("Report ID");
    OutputTempBlob.Blob.CREATEOUTSTREAM(DocumentOutStream);
    XmlPart := REPORT.WORDXMLPART("Report ID",TRUE);

    CASE Type OF
      Type::Word:
        BEGIN
          // Run update
          TempBlob.Blob.CREATEINSTREAM(DocumentInStream);
          ErrorMessage := DocumentReportMgt.TryUpdateWordLayout(DocumentInStream,DocumentOutStream,'',XmlPart);
          // Validate the Word document layout against the layout of the current report
          IF ErrorMessage = '' THEN BEGIN
            COPYSTREAM(DocumentOutStream,DocumentInStream);
            DocumentReportMgt.ValidateWordLayout("Report ID",DocumentInStream,TRUE,TRUE);
          END;
        END;
      Type::RDLC:
        BEGIN
          // Update the Rdlc document layout against the layout of the current report
          TempBlob.Blob.CREATEINSTREAM(DocumentInStream,TEXTENCODING::UTF8);
          ErrorMessage := DocumentReportMgt.TryUpdateRdlcLayout("Report ID",DocumentInStream,DocumentOutStream,'',XmlPart,FALSE);
        END;
    END;

    CLEAR(Layout);
    Layout := OutputTempBlob.Blob;

    IF FileExtension <> '' THEN
      "File Extension" := FileExtension;
    InsertCustomXmlPart(Rec);
    MODIFY(TRUE);
    COMMIT;

    IF ErrorMessage <> '' THEN
      MESSAGE(ErrorMessage);
    */
    //end;


    //Unsupported feature: Code Modification on "ExportLayout(PROCEDURE 1)".

    //procedure ExportLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateLayout(true,false); // Don't block on errors (return false) as we in all cases want to have an export file to edit.

    if not Layout.HasValue then
      exit;

    if DefaultFileName = '' then
      DefaultFileName := '*.' + GetFileExtension;

    TempBlob.Blob := Layout;
    exit(FileMgt.BLOBExport(TempBlob,DefaultFileName,ShowFileDialog));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateLayout(TRUE,FALSE); // Don't block on errors (return false) as we in all cases want to have an export file to edit.

    IF NOT Layout.HASVALUE THEN
      EXIT;

    IF DefaultFileName = '' THEN
    #7..9
    EXIT(FileMgt.BLOBExport(TempBlob,DefaultFileName,ShowFileDialog));
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateLayout(PROCEDURE 14)".

    //procedure ValidateLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Report ID");
    CalcFields(Layout);
    if not Layout.HasValue then
      exit;
    Layout.CreateInStream(DocumentInStream);

    case Type of
      Type::Word:
        exit(DocumentReportMgt.ValidateWordLayout("Report ID",DocumentInStream,useConfirm,UpdateContext));
      Type::RDLC:
        if not TryValidateRdlcReport(DocumentInStream) then begin
          if useConfirm then begin
            if not Confirm(TemplateValidationQst,false,GetLastErrorText) then
              Error(AbortWithValidationErr);
          end else begin
            ValidationErrorFormat := TemplateValidationErr;
            Error(ValidationErrorFormat,GetLastErrorText);
          end;
          exit(false);
        end;
    end;

    exit(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD("Report ID");
    CALCFIELDS(Layout);
    IF NOT Layout.HASVALUE THEN
      EXIT;
    Layout.CREATEINSTREAM(DocumentInStream);

    CASE Type OF
      Type::Word:
        EXIT(DocumentReportMgt.ValidateWordLayout("Report ID",DocumentInStream,useConfirm,UpdateContext));
      Type::RDLC:
        IF NOT TryValidateRdlcReport(DocumentInStream) THEN BEGIN
          IF useConfirm THEN BEGIN
            IF NOT CONFIRM(TemplateValidationQst,FALSE,GETLASTERRORTEXT) THEN
              ERROR(AbortWithValidationErr);
          END ELSE BEGIN
            ValidationErrorFormat := TemplateValidationErr;
            ERROR(ValidationErrorFormat,GETLASTERRORTEXT);
          END;
          EXIT(FALSE);
        END;
    END;

    EXIT(TRUE);
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateLayout(PROCEDURE 22)".

    //procedure UpdateLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ErrorMessage := TryUpdateLayout(IgnoreDelete);

    if ErrorMessage = '' then begin
      if Type = Type::Word then
        exit(ValidateLayout(true,true));
      exit(true); // We have no validate for RDLC
    end;

    ErrorMessage := StrSubstNo(ErrorInLayoutErr,Description,"Report ID",ErrorMessage);
    if ContinueOnError then begin
      Message(ErrorMessage);
      exit(true);
    end;

    Error(ErrorMessage);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ErrorMessage := TryUpdateLayout(IgnoreDelete);

    IF ErrorMessage = '' THEN BEGIN
      IF Type = Type::Word THEN
        EXIT(ValidateLayout(TRUE,TRUE));
      EXIT(TRUE); // We have no validate for RDLC
    END;

    ErrorMessage := STRSUBSTNO(ErrorInLayoutErr,Description,"Report ID",ErrorMessage);
    IF ContinueOnError THEN BEGIN
      MESSAGE(ErrorMessage);
      EXIT(TRUE);
    END;

    ERROR(ErrorMessage);
    */
    //end;


    //Unsupported feature: Code Modification on "TryUpdateLayout(PROCEDURE 16)".

    //procedure TryUpdateLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalcFields(Layout);
    if not Layout.HasValue then
      exit('');

    CalcFields("Custom XML Part");
    TestField("Custom XML Part");
    TestField("Report ID");

    WordXmlPart := REPORT.WordXmlPart("Report ID",true);

    case Type of
      Type::Word:
        begin
          Layout.CreateInStream(DocumentInStream);
          TempBlob.Blob.CreateOutStream(DocumentOutStream);
          ErrorMessage := DocumentReportMgt.TryUpdateWordLayout(DocumentInStream,DocumentOutStream,GetCustomXmlPart,WordXmlPart);
        end;
      Type::RDLC:
        begin
          Layout.CreateInStream(DocumentInStream,TEXTENCODING::UTF8);
          TempBlob.Blob.CreateOutStream(DocumentOutStream,TEXTENCODING::UTF8);
          ErrorMessage := DocumentReportMgt.TryUpdateRdlcLayout(
              "Report ID",DocumentInStream,DocumentOutStream,GetCustomXmlPart,WordXmlPart,IgnoreDelete);
        end;
    end;

    Clear("Custom XML Part");
    "Custom XML Part".CreateOutStream(PartStream,TEXTENCODING::UTF16);
    PartStream.Write(WordXmlPart);
    if TempBlob.Blob.HasValue then begin
      Clear(Layout);
      Layout := TempBlob.Blob;
    end;
    Modify;

    exit(ErrorMessage);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS(Layout);
    IF NOT Layout.HASVALUE THEN
      EXIT('');

    CALCFIELDS("Custom XML Part");
    TESTFIELD("Custom XML Part");
    TESTFIELD("Report ID");

    WordXmlPart := REPORT.WORDXMLPART("Report ID",TRUE);

    CASE Type OF
      Type::Word:
        BEGIN
          Layout.CREATEINSTREAM(DocumentInStream);
          TempBlob.Blob.CREATEOUTSTREAM(DocumentOutStream);
          ErrorMessage := DocumentReportMgt.TryUpdateWordLayout(DocumentInStream,DocumentOutStream,GetCustomXmlPart,WordXmlPart);
        END;
      Type::RDLC:
        BEGIN
          Layout.CREATEINSTREAM(DocumentInStream,TEXTENCODING::UTF8);
          TempBlob.Blob.CREATEOUTSTREAM(DocumentOutStream,TEXTENCODING::UTF8);
          ErrorMessage := DocumentReportMgt.TryUpdateRdlcLayout(
              "Report ID",DocumentInStream,DocumentOutStream,GetCustomXmlPart,WordXmlPart,IgnoreDelete);
        END;
    END;

    CLEAR("Custom XML Part");
    "Custom XML Part".CREATEOUTSTREAM(PartStream,TEXTENCODING::UTF16);
    PartStream.WRITE(WordXmlPart);
    IF TempBlob.Blob.HASVALUE THEN BEGIN
      CLEAR(Layout);
      Layout := TempBlob.Blob;
    END;
    MODIFY;

    EXIT(ErrorMessage);
    */
    //end;


    //Unsupported feature: Code Modification on "GetWordXML(PROCEDURE 8)".

    //procedure GetWordXML();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Report ID");
    TempBlob.Blob.CreateOutStream(OutStr,TEXTENCODING::UTF16);
    OutStr.WriteText(REPORT.WordXmlPart("Report ID"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD("Report ID");
    TempBlob.Blob.CREATEOUTSTREAM(OutStr,TEXTENCODING::UTF16);
    OutStr.WRITETEXT(REPORT.WORDXMLPART("Report ID"));
    */
    //end;


    //Unsupported feature: Code Modification on "ExportSchema(PROCEDURE 9)".

    //procedure ExportSchema();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField(Type,Type::Word);

    if DefaultFileName = '' then
      DefaultFileName := '*.xml';

    GetWordXML(TempBlob);
    if TempBlob.Blob.HasValue then
      exit(FileMgt.BLOBExport(TempBlob,DefaultFileName,ShowFileDialog));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Word);

    IF DefaultFileName = '' THEN
    #4..6
    IF TempBlob.Blob.HASVALUE THEN
      EXIT(FileMgt.BLOBExport(TempBlob,DefaultFileName,ShowFileDialog));
    */
    //end;


    //Unsupported feature: Code Modification on "EditLayout(PROCEDURE 4)".

    //procedure EditLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateLayout(true,true); // Don't block on errors (return false) as we in all cases want to have an export file to edit.

    case Type of
      Type::Word:
        CODEUNIT.Run(CODEUNIT::"Edit MS Word Report Layout",Rec);
      Type::RDLC:
        CODEUNIT.Run(CODEUNIT::"Edit RDLC Report Layout",Rec);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateLayout(TRUE,TRUE); // Don't block on errors (return false) as we in all cases want to have an export file to edit.

    CASE Type OF
      Type::Word:
        CODEUNIT.RUN(CODEUNIT::"Edit MS Word Report Layout",Rec);
      Type::RDLC:
        CODEUNIT.RUN(CODEUNIT::"Edit RDLC Report Layout",Rec);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "GetFileExtension(PROCEDURE 12)".

    //procedure GetFileExtension();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case Type of
      Type::Word:
        exit('docx');
      Type::RDLC:
        exit('rdl');
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE Type OF
      Type::Word:
        EXIT('docx');
      Type::RDLC:
        EXIT('rdl');
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "InsertCustomXmlPart(PROCEDURE 18)".

    //procedure InsertCustomXmlPart();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Store the current design as an extended WordXmlPart. This data is used for later updates / refactorings.
    CustomReportLayout."Custom XML Part".CreateOutStream(OutStr,TEXTENCODING::UTF16);
    WordXmlPart := REPORT.WordXmlPart(CustomReportLayout."Report ID",true);
    if WordXmlPart <> '' then
      OutStr.Write(WordXmlPart);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // Store the current design as an extended WordXmlPart. This data is used for later updates / refactorings.
    CustomReportLayout."Custom XML Part".CREATEOUTSTREAM(OutStr,TEXTENCODING::UTF16);
    WordXmlPart := REPORT.WORDXMLPART(CustomReportLayout."Report ID",TRUE);
    IF WordXmlPart <> '' THEN
      OutStr.WRITE(WordXmlPart);
    */
    //end;


    //Unsupported feature: Code Modification on "GetCustomXmlPart(PROCEDURE 19)".

    //procedure GetCustomXmlPart();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalcFields("Custom XML Part");
    if not "Custom XML Part".HasValue then
      exit;

    "Custom XML Part".CreateInStream(InStr,TEXTENCODING::UTF16);
    InStr.Read(XmlPart);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS("Custom XML Part");
    IF NOT "Custom XML Part".HASVALUE THEN
      EXIT;

    "Custom XML Part".CREATEINSTREAM(InStr,TEXTENCODING::UTF16);
    InStr.READ(XmlPart);
    */
    //end;


    //Unsupported feature: Code Modification on "RunCustomReport(PROCEDURE 3)".

    //procedure RunCustomReport();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Report ID" = 0 then
      exit;

    ReportLayoutSelection.SetTempLayoutSelected(ID);
    REPORT.RunModal("Report ID");
    ReportLayoutSelection.SetTempLayoutSelected(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "Report ID" = 0 THEN
      EXIT;

    ReportLayoutSelection.SetTempLayoutSelected(ID);
    REPORT.RUNMODAL("Report ID");
    ReportLayoutSelection.SetTempLayoutSelected(0);
    */
    //end;


    //Unsupported feature: Code Modification on "ApplyUpgrade(PROCEDURE 5)".

    //procedure ApplyUpgrade();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalcFields(Layout);
    if not Layout.HasValue then
      exit;

    if ReportUpgrade.ChangeCount() < 1 then
      exit;

    Clear(DataInStream);
    Clear(DataOutStream);
    if Type = Type::Word then begin
      Layout.CreateInStream(DataInStream);
      TempBlob.Blob.CreateOutStream(DataOutStream);
    end else begin
      Layout.CreateInStream(DataInStream,TEXTENCODING::UTF8);
      TempBlob.Blob.CreateOutStream(DataOutStream,TEXTENCODING::UTF8);
    end;

    TempReportChangeLogCollection := ReportUpgrade.Upgrade(Description,DataInStream,DataOutStream);

    if not testOnly then begin
      if TempReportChangeLogCollection.Failures = 0 then begin
        InsertCustomXmlPart(Rec);
        ModifyLayout := true;
      end;
      if TempBlob.Blob.HasValue then begin
        Clear(Layout);
        Layout := TempBlob.Blob;
        ModifyLayout := true;
      end;
      if ModifyLayout = true then begin
        Modify;
        Commit;
      end;
    end;

    if TempReportChangeLogCollection.Count > 0 then begin
      if IsNull(ReportChangeLogCollection) then
        ReportChangeLogCollection := TempReportChangeLogCollection
      else
        ReportChangeLogCollection.AddRange(TempReportChangeLogCollection);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS(Layout);
    IF NOT Layout.HASVALUE THEN
      EXIT;

    IF ReportUpgrade.ChangeCount() < 1 THEN
      EXIT;

    CLEAR(DataInStream);
    CLEAR(DataOutStream);
    IF Type = Type::Word THEN BEGIN
      Layout.CREATEINSTREAM(DataInStream);
      TempBlob.Blob.CREATEOUTSTREAM(DataOutStream);
    END ELSE BEGIN
      Layout.CREATEINSTREAM(DataInStream,TEXTENCODING::UTF8);
      TempBlob.Blob.CREATEOUTSTREAM(DataOutStream,TEXTENCODING::UTF8);
    END;
    #17..19
    IF NOT testOnly THEN BEGIN
      IF TempReportChangeLogCollection.Failures = 0 THEN BEGIN
        InsertCustomXmlPart(Rec);
        ModifyLayout := TRUE;
      END;
      IF TempBlob.Blob.HASVALUE THEN BEGIN
        CLEAR(Layout);
        Layout := TempBlob.Blob;
        ModifyLayout := TRUE;
      END;
      IF ModifyLayout = TRUE THEN BEGIN
        MODIFY;
        COMMIT;
      END;
    END;

    IF TempReportChangeLogCollection.Count > 0 THEN BEGIN
      IF ISNULL(ReportChangeLogCollection) THEN
        ReportChangeLogCollection := TempReportChangeLogCollection
      ELSE
        ReportChangeLogCollection.AddRange(TempReportChangeLogCollection);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "TryValidateRdlcReport(PROCEDURE 15)".

    //procedure TryValidateRdlcReport();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InStr.Read(RdlcString);
    RdlcReportManager.ValidateReport("Report ID",RdlcString);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    InStr.READ(RdlcString);
    RdlcReportManager.ValidateReport("Report ID",RdlcString);
    */
    //end;
}

