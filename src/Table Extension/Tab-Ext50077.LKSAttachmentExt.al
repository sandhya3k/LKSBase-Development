tableextension 50077 "LKSAttachmentExt" extends Attachment
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := Today;
    "Last Time Modified" := Time;

    Attachment2.LockTable;
    if Attachment2.FindLast then
      "NextAttachmentNo." := Attachment2."No." + 1
    else
      "NextAttachmentNo." := 1;

    "No." := "NextAttachmentNo.";

    RMSetup.Get;
    "Storage Type" := RMSetup."Attachment Storage Type";
    if "Storage Type" = "Storage Type"::"Disk File" then begin
      RMSetup.TestField("Attachment Storage Location");
      "Storage Pointer" := RMSetup."Attachment Storage Location";
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;
    "Last Time Modified" := TIME;

    Attachment2.LOCKTABLE;
    IF Attachment2.FINDLAST THEN
      "NextAttachmentNo." := Attachment2."No." + 1
    ELSE
    #8..11
    RMSetup.GET;
    "Storage Type" := RMSetup."Attachment Storage Type";
    IF "Storage Type" = "Storage Type"::"Disk File" THEN BEGIN
      RMSetup.TESTFIELD("Attachment Storage Location");
      "Storage Pointer" := RMSetup."Attachment Storage Location";
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := Today;
    "Last Time Modified" := Time;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;
    "Last Time Modified" := TIME;
    */
    //end;


    //Unsupported feature: Code Modification on "OpenAttachment(PROCEDURE 1)".

    //procedure OpenAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Storage Type" = "Storage Type"::Embedded then begin
      CalcFields(Attachment);
      if not Attachment.HasValue then
        Error(Text002);
    end;

    if CurrentClientType in [CLIENTTYPE::Web,CLIENTTYPE::Tablet,CLIENTTYPE::Phone] then
      ProcessWebAttachment(Caption + '.' + "File Extension")
    else begin
      FileName := ConstFilename;
      if not DeleteFile(FileName) then
        Error(Text003);
      ExportAttachmentToClientFile(FileName);
      if WordManagement.IsWordDocumentExtension("File Extension") then
        WordManagement.OpenWordAttachment(Rec,FileName,Caption,IsTemporary,LanguageCode)
      else begin
        HyperLink(FileName);
        if not "Read Only" then begin
          if Confirm(Text004,true) then
            ImportAttachmentFromClientFile(FileName,IsTemporary,false);
          DeleteFile(FileName);
        end else
          if Confirm(Text016,true) then
            DeleteFile(FileName);
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "Storage Type" = "Storage Type"::Embedded THEN BEGIN
      CALCFIELDS(Attachment);
      IF NOT Attachment.HASVALUE THEN
        ERROR(Text002);
    END;

    IF CURRENTCLIENTTYPE IN [CLIENTTYPE::Web,CLIENTTYPE::Tablet,CLIENTTYPE::Phone] THEN
      ProcessWebAttachment(Caption + '.' + "File Extension")
    ELSE BEGIN
      FileName := ConstFilename;
      IF NOT DeleteFile(FileName) THEN
        ERROR(Text003);
      ExportAttachmentToClientFile(FileName);
      IF WordManagement.IsWordDocumentExtension("File Extension") THEN
        WordManagement.OpenWordAttachment(Rec,FileName,Caption,IsTemporary,LanguageCode)
      ELSE BEGIN
        HYPERLINK(FileName);
        IF NOT "Read Only" THEN BEGIN
          IF CONFIRM(Text004,TRUE) THEN
            ImportAttachmentFromClientFile(FileName,IsTemporary,FALSE);
          DeleteFile(FileName);
        END ELSE
          IF CONFIRM(Text016,TRUE) THEN
            DeleteFile(FileName);
      END;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "ShowAttachment(PROCEDURE 6)".

    //procedure ShowAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RunAttachment(SegLine,WordCaption,IsTemporary,true,Handler);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    RunAttachment(SegLine,WordCaption,IsTemporary,TRUE,Handler);
    */
    //end;


    //Unsupported feature: Code Modification on "RunAttachment(PROCEDURE 24)".

    //procedure RunAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Storage Type" = "Storage Type"::Embedded then
      CalcFields(Attachment);

    if CurrentClientType in [CLIENTTYPE::Web,CLIENTTYPE::Tablet,CLIENTTYPE::Phone] then
      ProcessWebAttachment(WordCaption + '.' + "File Extension")
    else
      if WordManagement.IsWordDocumentExtension("File Extension") then
        WordManagement.RunMergedDocument(SegLine,Rec,WordCaption,IsTemporary,IsVisible,Handler)
      else begin
        FileName := ConstFilename;
        ExportAttachmentToClientFile(FileName);
        HyperLink(FileName);
        if not "Read Only" then begin
          if Confirm(Text004,true) then
            ImportAttachmentFromClientFile(FileName,IsTemporary,false);
          DeleteFile(FileName);
        end else
          if Confirm(Text016,true) then
            DeleteFile(FileName);
      end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "Storage Type" = "Storage Type"::Embedded THEN
      CALCFIELDS(Attachment);

    IF CURRENTCLIENTTYPE IN [CLIENTTYPE::Web,CLIENTTYPE::Tablet,CLIENTTYPE::Phone] THEN
      ProcessWebAttachment(WordCaption + '.' + "File Extension")
    ELSE
      IF WordManagement.IsWordDocumentExtension("File Extension") THEN
        WordManagement.RunMergedDocument(SegLine,Rec,WordCaption,IsTemporary,IsVisible,Handler)
      ELSE BEGIN
        FileName := ConstFilename;
        ExportAttachmentToClientFile(FileName);
        HYPERLINK(FileName);
        IF NOT "Read Only" THEN BEGIN
          IF CONFIRM(Text004,TRUE) THEN
            ImportAttachmentFromClientFile(FileName,IsTemporary,FALSE);
          DeleteFile(FileName);
        END ELSE
          IF CONFIRM(Text016,TRUE) THEN
            DeleteFile(FileName);
      END;
    */
    //end;


    //Unsupported feature: Code Modification on "ExportAttachmentToClientFile(PROCEDURE 2)".

    //procedure ExportAttachmentToClientFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RMSetup.Get;
    if RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" then
      RMSetup.TestField("Attachment Storage Location");

    ServerFileName := FileMgt.ServerTempFileName("File Extension");
    ExportAttachmentToServerFile(ServerFileName);

    Path := FileMgt.Magicpath;
    if ExportToFile = '' then begin
      ExportToFile := FileMgt.GetFileName(FileMgt.ClientTempFileName("File Extension"));
      Path := '';
    end;

    FileFilter := UpperCase("File Extension") + ' (*.' + "File Extension" + ')|*.' + "File Extension";
    Success := Download(ServerFileName,Text005,Path,FileFilter,ExportToFile);
    FileMgt.DeleteServerFile(ServerFileName);
    exit(Success);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    RMSetup.GET;
    IF RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" THEN
      RMSetup.TESTFIELD("Attachment Storage Location");
    #4..8
    IF ExportToFile = '' THEN BEGIN
      ExportToFile := FileMgt.GetFileName(FileMgt.ClientTempFileName("File Extension"));
      Path := '';
    END;

    FileFilter := UPPERCASE("File Extension") + ' (*.' + "File Extension" + ')|*.' + "File Extension";
    Success := DOWNLOAD(ServerFileName,Text005,Path,FileFilter,ExportToFile);
    FileMgt.DeleteServerFile(ServerFileName);
    EXIT(Success);
    */
    //end;


    //Unsupported feature: Code Modification on "ImportAttachmentFromClientFile(PROCEDURE 5)".

    //procedure ImportAttachmentFromClientFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ClearLastError;
    if IsTemporary then
      exit(ImportTemporaryAttachmentFromClientFile(ImportFromFile));

    TestField("Read Only",false);
    RMSetup.Get;
    if RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" then
      RMSetup.TestField("Attachment Storage Location");

    if IsInherited then begin
      NewAttachmentNo := AttachmentMgt.InsertAttachment("No.");
      Get(NewAttachmentNo);
    end else
      if "No." = 0 then
        NewAttachmentNo := AttachmentMgt.InsertAttachment(0)
      else
        NewAttachmentNo := "No.";
    Get(NewAttachmentNo);

    // passing to UPLOAD function when only server path is specified, not ALSO the file name,
    // then function updates the server file path with the actual client name
    ServerFileName := TemporaryPath;
    FileName := ImportFromFile;
    if not Upload(Text006,'',Text007,FileName,ServerFileName) then begin
      if GetLastErrorText <> '' then
        Error(Text008,GetLastErrorText);
      exit(false);
    end;

    exit(ImportAttachmentFromServerFile(ServerFileName,false,true));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CLEARLASTERROR;
    IF IsTemporary THEN
      EXIT(ImportTemporaryAttachmentFromClientFile(ImportFromFile));

    TESTFIELD("Read Only",FALSE);
    RMSetup.GET;
    IF RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" THEN
      RMSetup.TESTFIELD("Attachment Storage Location");

    IF IsInherited THEN BEGIN
      NewAttachmentNo := AttachmentMgt.InsertAttachment("No.");
      GET(NewAttachmentNo);
    END ELSE
      IF "No." = 0 THEN
        NewAttachmentNo := AttachmentMgt.InsertAttachment(0)
      ELSE
        NewAttachmentNo := "No.";
    GET(NewAttachmentNo);
    #19..21
    ServerFileName := TEMPORARYPATH;
    FileName := ImportFromFile;
    IF NOT UPLOAD(Text006,'',Text007,FileName,ServerFileName) THEN BEGIN
      IF GETLASTERRORTEXT <> '' THEN
        ERROR(Text008,GETLASTERRORTEXT);
      EXIT(FALSE);
    END;

    EXIT(ImportAttachmentFromServerFile(ServerFileName,FALSE,TRUE));
    */
    //end;


    //Unsupported feature: Code Modification on "ImportTemporaryAttachmentFromClientFile(PROCEDURE 21)".

    //procedure ImportTemporaryAttachmentFromClientFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FileName := FileMgt.BLOBImport(TempBlob,ImportFromFile);

    if FileName <> '' then begin
      Attachment := TempBlob.Blob;
      "Storage Type" := "Storage Type"::Embedded;
      "Storage Pointer" := '';
      "File Extension" := CopyStr(UpperCase(FileMgt.GetExtension(FileName)),1,250);
      exit(true);
    end;

    exit(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FileName := FileMgt.BLOBImport(TempBlob,ImportFromFile);

    IF FileName <> '' THEN BEGIN
    #4..6
      "File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(FileName)),1,250);
      EXIT(TRUE);
    END;

    EXIT(FALSE);
    */
    //end;


    //Unsupported feature: Code Modification on "ExportAttachmentToServerFile(PROCEDURE 20)".

    //procedure ExportAttachmentToServerFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // This function assumes that CALCFIELDS on the attachment field has been called before
    RMSetup.Get;
    if RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" then
      RMSetup.TestField("Attachment Storage Location");

    case "Storage Type" of
      "Storage Type"::Embedded:
        begin
          if Attachment.HasValue then begin
            TempBlob.Blob := Attachment;
            if ExportToFile = '' then
              ExportToFile := FileMgt.ServerTempFileName("File Extension");
            FileMgt.BLOBExportToServerFile(TempBlob,ExportToFile); // export BLOB to file on server (UNC location also)
            exit(true);
          end;
          exit(false);
        end;
      "Storage Type"::"Disk File":
        begin
          if ExportToFile = '' then
            ExportToFile := TemporaryPath + FileMgt.GetFileName(ConstDiskFileName);
          FileMgt.CopyServerFile(ConstDiskFileName,ExportToFile,false); // Copy from server location to another location (UNC location also)
          exit(true);
        end;
    end;

    exit(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // This function assumes that CALCFIELDS on the attachment field has been called before
    RMSetup.GET;
    IF RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" THEN
      RMSetup.TESTFIELD("Attachment Storage Location");

    CASE "Storage Type" OF
      "Storage Type"::Embedded:
        BEGIN
          IF Attachment.HASVALUE THEN BEGIN
            TempBlob.Blob := Attachment;
            IF ExportToFile = '' THEN
              ExportToFile := FileMgt.ServerTempFileName("File Extension");
            FileMgt.BLOBExportToServerFile(TempBlob,ExportToFile); // export BLOB to file on server (UNC location also)
            EXIT(TRUE);
          END;
          EXIT(FALSE);
        END;
      "Storage Type"::"Disk File":
        BEGIN
          IF ExportToFile = '' THEN
            ExportToFile := TEMPORARYPATH + FileMgt.GetFileName(ConstDiskFileName);
          FileMgt.CopyServerFile(ConstDiskFileName,ExportToFile,FALSE); // Copy from server location to another location (UNC location also)
          EXIT(TRUE);
        END;
    END;

    EXIT(FALSE);
    */
    //end;


    //Unsupported feature: Code Modification on "ImportAttachmentFromServerFile(PROCEDURE 19)".

    //procedure ImportAttachmentFromServerFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsTemporary then begin
      ImportTemporaryAttachmentFromServerFile(ImportFromFile);
      exit(true);
    end;

    if not Overwrite then
      TestField("Read Only",false);

    RMSetup.Get;
    if RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" then
      RMSetup.TestField("Attachment Storage Location");

    case RMSetup."Attachment Storage Type" of
      RMSetup."Attachment Storage Type"::Embedded:
        begin
          Clear(TempBlob);
          FileMgt.BLOBImportFromServerFile(TempBlob,ImportFromFile); // Copy from file on server (UNC location also)

          Attachment := TempBlob.Blob;
          "Storage Type" := "Storage Type"::Embedded;
          "Storage Pointer" := '';
          "File Extension" := CopyStr(FileMgt.GetExtension(ImportFromFile),1,250);
          Modify(true);
          exit(true);
        end;
      "Storage Type"::"Disk File":
        begin
          "Storage Type" := "Storage Type"::"Disk File";
          "Storage Pointer" := RMSetup."Attachment Storage Location";
          "File Extension" := CopyStr(FileMgt.GetExtension(ImportFromFile),1,250);
          FileMgt.CopyServerFile(ImportFromFile,ConstDiskFileName,Overwrite); // Copy from UNC location to another UNC location
          Modify(true);
          exit(true);
        end;
    end;

    exit(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF IsTemporary THEN BEGIN
      ImportTemporaryAttachmentFromServerFile(ImportFromFile);
      EXIT(TRUE);
    END;

    IF NOT Overwrite THEN
      TESTFIELD("Read Only",FALSE);

    RMSetup.GET;
    IF RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" THEN
      RMSetup.TESTFIELD("Attachment Storage Location");

    CASE RMSetup."Attachment Storage Type" OF
      RMSetup."Attachment Storage Type"::Embedded:
        BEGIN
          CLEAR(TempBlob);
    #17..21
          "File Extension" := COPYSTR(FileMgt.GetExtension(ImportFromFile),1,250);
          MODIFY(TRUE);
          EXIT(TRUE);
        END;
      "Storage Type"::"Disk File":
        BEGIN
          "Storage Type" := "Storage Type"::"Disk File";
          "Storage Pointer" := RMSetup."Attachment Storage Location";
          "File Extension" := COPYSTR(FileMgt.GetExtension(ImportFromFile),1,250);
          FileMgt.CopyServerFile(ImportFromFile,ConstDiskFileName,Overwrite); // Copy from UNC location to another UNC location
          MODIFY(TRUE);
          EXIT(TRUE);
        END;
    END;

    EXIT(FALSE);
    */
    //end;


    //Unsupported feature: Code Modification on "ImportTemporaryAttachmentFromServerFile(PROCEDURE 22)".

    //procedure ImportTemporaryAttachmentFromServerFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FileMgt.BLOBImportFromServerFile(TempBlob,ImportFromFile);
    Attachment := TempBlob.Blob;
    "Storage Type" := "Storage Type"::Embedded;
    "Storage Pointer" := '';
    "File Extension" := CopyStr(UpperCase(FileMgt.GetExtension(ImportFromFile)),1,250);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    "File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(ImportFromFile)),1,250);
    */
    //end;


    //Unsupported feature: Code Modification on "RemoveAttachment(PROCEDURE 7)".

    //procedure RemoveAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DeleteOK := false;
    DeleteYesNo := true;
    if Prompt then
      if not Confirm(
           Text009,false,TableCaption)
      then
        DeleteYesNo := false;

    if DeleteYesNo then begin
      if "Storage Type" = "Storage Type"::"Disk File" then
        if not FileMgt.DeleteServerFile(ConstDiskFileName) then
          Message(Text010);
      Delete(true);
      DeleteOK := true;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DeleteOK := FALSE;
    DeleteYesNo := TRUE;
    IF Prompt THEN
      IF NOT CONFIRM(
           Text009,FALSE,TABLECAPTION)
      THEN
        DeleteYesNo := FALSE;

    IF DeleteYesNo THEN BEGIN
      IF "Storage Type" = "Storage Type"::"Disk File" THEN
        IF NOT FileMgt.DeleteServerFile(ConstDiskFileName) THEN
          MESSAGE(Text010);
      DELETE(TRUE);
      DeleteOK := TRUE;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "WizEmbeddAttachment(PROCEDURE 4)".

    //procedure WizEmbeddAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Rec := FromAttachment;
    "No." := 0;
    "Storage Type" := "Storage Type"::Embedded;
    FromAttachment.TestField("No.");
    case FromAttachment."Storage Type" of
      FromAttachment."Storage Type"::"Disk File":
        ImportAttachmentFromServerFile(FromAttachment.ConstDiskFileName,true,false);
      FromAttachment."Storage Type"::Embedded:
        begin
          FromAttachment.CalcFields(Attachment);
          if FromAttachment.Attachment.HasValue then
            Attachment := FromAttachment.Attachment;
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    FromAttachment.TESTFIELD("No.");
    CASE FromAttachment."Storage Type" OF
      FromAttachment."Storage Type"::"Disk File":
        ImportAttachmentFromServerFile(FromAttachment.ConstDiskFileName,TRUE,FALSE);
      FromAttachment."Storage Type"::Embedded:
        BEGIN
          FromAttachment.CALCFIELDS(Attachment);
          IF FromAttachment.Attachment.HASVALUE THEN
            Attachment := FromAttachment.Attachment;
        END;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "WizSaveAttachment(PROCEDURE 8)".

    //procedure WizSaveAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    with RMSetup do begin
      Get;
      if "Attachment Storage Type" = "Attachment Storage Type"::Embedded then begin
        "Storage Pointer" := '';
        exit;
      end;
    end;

    "Storage Pointer" := RMSetup."Attachment Storage Location";

    with Attachment2 do begin
      "No." := Rec."No.";
      "Storage Type" := "Storage Type"::"Disk File";
      "Storage Pointer" := RMSetup."Attachment Storage Location";
      "File Extension" := Rec."File Extension";
      "Read Only" := Rec."Read Only";
      "Last Date Modified" := Rec."Last Date Modified";
      "Last Time Modified" := Rec."Last Time Modified";
    end;
    Clear(Rec);
    Rec := Attachment2;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH RMSetup DO BEGIN
      GET;
      IF "Attachment Storage Type" = "Attachment Storage Type"::Embedded THEN BEGIN
        "Storage Pointer" := '';
        EXIT;
      END;
    END;
    #8..10
    WITH Attachment2 DO BEGIN
    #12..18
    END;
    CLEAR(Rec);
    Rec := Attachment2;
    */
    //end;


    //Unsupported feature: Code Modification on "DeleteFile(PROCEDURE 10)".

    //procedure DeleteFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FileName = '' then
      exit(false);

    if not FileMgt.ClientFileExists(FileName) then
      exit(true);

    repeat
      Sleep(250);
      I := I + 1;
    until FileMgt.DeleteClientFile(FileName) or (I = 25);
    exit(not FileMgt.ClientFileExists(FileName));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF FileName = '' THEN
      EXIT(FALSE);

    IF NOT FileMgt.ClientFileExists(FileName) THEN
      EXIT(TRUE);

    REPEAT
      SLEEP(250);
      I := I + 1;
    UNTIL FileMgt.DeleteClientFile(FileName) OR (I = 25);
    EXIT(NOT FileMgt.ClientFileExists(FileName));
    */
    //end;


    //Unsupported feature: Code Modification on "ConstDiskFileName(PROCEDURE 3)".

    //procedure ConstDiskFileName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DiskFileName := "Storage Pointer" + '\' + Format("No.") + '.' + "File Extension";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DiskFileName := "Storage Pointer" + '\' + FORMAT("No.") + '.' + "File Extension";
    */
    //end;


    //Unsupported feature: Code Modification on "CheckCorrespondenceType(PROCEDURE 11)".

    //procedure CheckCorrespondenceType();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case CorrespondenceType of
      CorrespondenceType::"Hard Copy":
        if (UpperCase("File Extension") <> 'DOC') and (UpperCase("File Extension") <> 'DOCX') then
          exit(Text013);
      CorrespondenceType::Fax:
        if (UpperCase("File Extension") <> 'DOC') and (UpperCase("File Extension") <> 'DOCX') then
          exit(Text014);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE CorrespondenceType OF
      CorrespondenceType::"Hard Copy":
        IF (UPPERCASE("File Extension") <> 'DOC') AND (UPPERCASE("File Extension") <> 'DOCX') THEN
          EXIT(Text013);
      CorrespondenceType::Fax:
        IF (UPPERCASE("File Extension") <> 'DOC') AND (UPPERCASE("File Extension") <> 'DOCX') THEN
          EXIT(Text014);
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "LinkToMessage(PROCEDURE 12)".

    //procedure LinkToMessage();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Storage Type" := "Storage Type"::"Exchange Storage";
    "Read Only" := true;

    SetMessageID(MessageID);
    SetEntryID(EntryID);

    Modify(RunTrigger);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Storage Type" := "Storage Type"::"Exchange Storage";
    "Read Only" := TRUE;
    #3..6
    MODIFY(RunTrigger);
    */
    //end;


    //Unsupported feature: Code Modification on "DisplayInOutlook(PROCEDURE 13)".

    //procedure DisplayInOutlook();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Status := OutlookHelper.DisplayMailFromPublicFolder(GetEntryID);

    if Status.Equals(Status.CouldNotActivateOutlook) then
      Error(CouldNotActivateOutlookErr);

    if Status.Equals(Status.ModalDialogOpened) then
      Error(Text020);

    if Status.Equals(Status.ItemNotFound) then
      Error(Text015);

    // If the Exchange Entry Id requires patching to be used in Outlook
    // then we update the entry id.
    if Status.Equals(Status.OkAfterExchange2013Patch) then begin
      SetMessageID(OutlookHelper.PatchExchange2013WebServicesPublicFolderItemEntryId(GetEntryID));
      Modify(true);
    end else
      if not Status.Equals(Status.Ok) then
        Error(UnspecifiedOutlookErr);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Status := OutlookHelper.DisplayMailFromPublicFolder(GetEntryID);

    IF Status.Equals(Status.CouldNotActivateOutlook) THEN
      ERROR(CouldNotActivateOutlookErr);

    IF Status.Equals(Status.ModalDialogOpened) THEN
      ERROR(Text020);

    IF Status.Equals(Status.ItemNotFound) THEN
      ERROR(Text015);
    #11..13
    IF Status.Equals(Status.OkAfterExchange2013Patch) THEN BEGIN
      SetMessageID(OutlookHelper.PatchExchange2013WebServicesPublicFolderItemEntryId(GetEntryID));
      MODIFY(TRUE);
    END ELSE
      IF NOT Status.Equals(Status.Ok) THEN
        ERROR(UnspecifiedOutlookErr);
    */
    //end;


    //Unsupported feature: Code Modification on "Checksum(PROCEDURE 14)".

    //procedure Checksum();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Randomize(1);
    MaxInteger := 2147483647;

    for CharNo := 1 to StrLen(MessageID) do
      DecValue := (DecValue + (((MessageID[CharNo] mod 43) + 1) * Random((MaxInteger div 44)))) mod MaxInteger;
    ChecksumValue := DecValue;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    RANDOMIZE(1);
    MaxInteger := 2147483647;

    FOR CharNo := 1 TO STRLEN(MessageID) DO
      DecValue := (DecValue + (((MessageID[CharNo] MOD 43) + 1) * RANDOM((MaxInteger DIV 44)))) MOD MaxInteger;
    ChecksumValue := DecValue;
    */
    //end;


    //Unsupported feature: Code Modification on "GetMessageID(PROCEDURE 15)".

    //procedure GetMessageID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalcFields("Email Message ID");
    "Email Message ID".CreateInStream(Stream);
    Stream.ReadText(Return);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS("Email Message ID");
    "Email Message ID".CREATEINSTREAM(Stream);
    Stream.READTEXT(Return);
    */
    //end;


    //Unsupported feature: Code Modification on "SetMessageID(PROCEDURE 16)".

    //procedure SetMessageID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Email Message ID".CreateOutStream(Stream);
    Stream.WriteText(MessageID);
    "Email Message Checksum" := Checksum(MessageID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Email Message ID".CREATEOUTSTREAM(Stream);
    Stream.WRITETEXT(MessageID);
    "Email Message Checksum" := Checksum(MessageID);
    */
    //end;


    //Unsupported feature: Code Modification on "GetEntryID(PROCEDURE 17)".

    //procedure GetEntryID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalcFields("Email Entry ID");
    "Email Entry ID".CreateInStream(Stream);
    Stream.ReadText(Return);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS("Email Entry ID");
    "Email Entry ID".CREATEINSTREAM(Stream);
    Stream.READTEXT(Return);
    */
    //end;


    //Unsupported feature: Code Modification on "SetEntryID(PROCEDURE 18)".

    //procedure SetEntryID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Email Entry ID".CreateOutStream(Stream);
    Stream.WriteText(EntryID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Email Entry ID".CREATEOUTSTREAM(Stream);
    Stream.WRITETEXT(EntryID);
    */
    //end;


    //Unsupported feature: Code Modification on "ProcessWebAttachment(PROCEDURE 27)".

    //procedure ProcessWebAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Confirm(AttachmentExportQst,true) then begin
      TempBlob.Blob := Attachment;
      FileMgt.BLOBExport(TempBlob,FileName,true);
      if not "Read Only" then
        if Confirm(AttachmentImportQst,true) then
          ImportAttachmentFromClientFile('',IsTemporary,false);
    end
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF CONFIRM(AttachmentExportQst,TRUE) THEN BEGIN
      TempBlob.Blob := Attachment;
      FileMgt.BLOBExport(TempBlob,FileName,TRUE);
      IF NOT "Read Only" THEN
        IF CONFIRM(AttachmentImportQst,TRUE) THEN
          ImportAttachmentFromClientFile('',ISTEMPORARY,FALSE);
    END
    */
    //end;
}

