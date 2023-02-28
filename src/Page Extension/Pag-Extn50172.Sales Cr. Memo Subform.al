pageextension 50172 pageextension50172 extends "Sales Cr. Memo Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (ImplicitType) on ""Unit of Measure"(Control 10)".

        //TBD
        /*
        addafter("Service Tax Registration No.")
        {
            field("Service Tax Group"; Rec."Service Tax Group")
            {ApplicationArea = All;
            }
        }
        */
        addafter("No.")
        {
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            //TBD
            /*
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {ApplicationArea = All;
            }
            */
        }
        addafter(Description)
        {
            field("Item Description"; Rec."Item Description")
            {
                ApplicationArea = All;
            }
            field("Other Detail 1"; Rec."Other Detail 1")
            {
                ApplicationArea = All;
            }
            field("Other Detail 2"; Rec."Other Detail 2")
            {
                ApplicationArea = All;
            }
        }
    }

    var
        UpdateAllowedVar: Boolean;
        Text000: Label 'Unable to execute this function while in view only mode.';


    //Unsupported feature: Code Modification on ""_ShowDetailedTaxEntryBuffer"(PROCEDURE 19048955)".

    //procedure "_ShowDetailedTaxEntryBuffer"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DetailedTaxEntryBuffer.Reset;
    DetailedTaxEntryBuffer.SetCurrentKey("Transaction Type","Document Type","Document No.","Line No.");
    DetailedTaxEntryBuffer.SetRange("Transaction Type",DetailedTaxEntryBuffer."Transaction Type"::Sale);
    DetailedTaxEntryBuffer.SetRange("Document Type","Document Type");
    DetailedTaxEntryBuffer.SetRange("Document No.","Document No.");
    DetailedTaxEntryBuffer.SetRange("Line No.","Line No.");
    PAGE.RunModal(PAGE::"Sale Detailed Tax",DetailedTaxEntryBuffer);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // PS36451.begin
    DetailedTaxEntryBuffer.Reset;
    DetailedTaxEntryBuffer.SetCurrentKey(DetailedTaxEntryBuffer."Transaction Type","Document Type","Document No.","Line No.");
    DetailedTaxEntryBuffer.SetRange(DetailedTaxEntryBuffer."Transaction Type",DetailedTaxEntryBuffer."Transaction Type"::Sale);
    #4..7

    // PS36451.end
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDetailedTaxEntryBuffer(PROCEDURE 1500004)".

    //procedure ShowDetailedTaxEntryBuffer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DetailedTaxEntryBuffer.Reset;
    DetailedTaxEntryBuffer.SetCurrentKey("Transaction Type","Document Type","Document No.","Line No.");
    DetailedTaxEntryBuffer.SetRange("Transaction Type",DetailedTaxEntryBuffer."Transaction Type"::Sale);
    DetailedTaxEntryBuffer.SetRange("Document Type","Document Type");
    DetailedTaxEntryBuffer.SetRange("Document No.","Document No.");
    DetailedTaxEntryBuffer.SetRange("Line No.","Line No.");
    PAGE.RunModal(PAGE::"Sale Detailed Tax",DetailedTaxEntryBuffer);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // PS36451.begin
    DetailedTaxEntryBuffer.Reset;
    DetailedTaxEntryBuffer.SetCurrentKey(DetailedTaxEntryBuffer."Transaction Type","Document Type","Document No.","Line No.");
    DetailedTaxEntryBuffer.SetRange(DetailedTaxEntryBuffer."Transaction Type",DetailedTaxEntryBuffer."Transaction Type"::Sale);
    #4..7
    // PS36451.end
    */
    //end;

    procedure CalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Calc. Discount", Rec);
    end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        Rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SaveRecord;
    end;

    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;

    procedure UpdateAllowed(): Boolean
    begin
        if UpdateAllowedVar = false then begin
            Message(Text000);
            exit(false);
        end;
        exit(true);
    end;

    procedure ShowLineComments()
    begin
        ShowLineComments;
    end;

    local procedure NoOnAfterValidate()
    var
        TransferExtendedText: codeunit "Transfer Extended Text";
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec, false) THEN BEGIN
            CurrPage.SAVERECORD;
            COMMIT;
            TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    var
        TransferExtendedText: codeunit "Transfer Extended Text";
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec, false) THEN BEGIN
            CurrPage.SAVERECORD;
            COMMIT;
            TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);

    end;

    local procedure ReserveOnAfterValidate()
    begin
        if (Rec.Reserve = Rec.Reserve::Always) and (Rec."Outstanding Qty. (Base)" <> 0) then begin
            CurrPage.SaveRecord;
            Rec.AutoReserve;
        end;
    end;

    local procedure QuantityOnAfterValidate()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord;
            Rec.AutoReserve;
        end;
    end;

    local procedure UnitofMeasureCodeOnAfterValida()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord;
            Rec.AutoReserve;
        end;
    end;
}

