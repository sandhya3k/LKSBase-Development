codeunit 50001 "Single Instance"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    var
        RemaAmtGl: Decimal;
        AutoPdfText: Text[10];
        BoolG: Boolean;
        PreviewG: Boolean;
        CodeG: Code[20];
        EntryNoGlobal: Integer;
        RTBNoG: Code[20];
        RTBStateG: Text[20];
        InvoiceNoG: Text[20];
        InvGenDateG: DateTime;


    procedure SetRemAmt(RemAmt: Decimal)
    begin
        RemaAmtGl := RemAmt;
    end;


    procedure GetRemAmt(): Decimal
    begin
        exit(RemaAmtGl);
    end;


    procedure SetPdf()
    begin
        AutoPdfText := 'Auto';
    end;


    procedure GetPdf(): Text[10]
    begin
        exit(AutoPdfText);
    end;

    procedure SetBool(BoolP: Boolean)
    begin
        BoolG := BoolP;
    end;

    procedure GetBool(): Boolean
    begin
        exit(BoolG);
    end;

    procedure SetPreview(PreviewP: Boolean)
    begin
        PreviewG := PreviewP;
    end;

    procedure GetPreview(): Boolean
    begin
        exit(PreviewG);
    end;

    procedure SetShipTo(CodeP: Code[20])
    begin
        CodeG := CodeP;
    end;

    procedure GetShipTo(): Code[20]
    begin
        exit(CodeG);
    end;

    procedure SetApplyEntryNo(EntryNo: Integer)
    begin
        EntryNoGlobal := EntryNo;
    end;

    procedure GetApplyEntryNo(): Integer
    begin
        Exit(EntryNoGlobal);
    end;

    procedure SetRTBValues(RTB: Text; RTBState: Text; InvoiceNo: Text; InvDate: DateTime)
    begin
        RTBNoG := RTB;
        RTBStateG := RTBState;
        InvoiceNoG := InvoiceNo;
        InvGenDateG := InvDate;
    end;

    procedure GetRTBValues(var RTB: Code[50]; var RTBState: Text; var InvoiceNo: Code[50]; var InvGenDate: DateTime)
    begin
        RTB := RTBNoG;
        RTBState := RTBStateG;
        InvoiceNo := InvoiceNoG;
        InvGenDate := InvGenDateG;
    end;
}

