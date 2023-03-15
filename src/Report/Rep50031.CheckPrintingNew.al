report 50031 "Check Printing New"
{
    // //NDALLE Changes Done to store Document No. in Place of Cheque No. in Check Ledger Entry Table.
    // //ALLE SR
    DefaultLayout = RDLC;
    RDLCLayout = './res/CheckPrintingNew.rdlc';

    Caption = 'Check';

    dataset
    {
        dataitem(GenJnlLine; "Gen. Journal Line")
        {
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.";
            column(CheckDateText; Format("Posting Date", 0, '<day,2>-<month,2>-<year4>'))
            {
            }
            column(DescriptionLine_1_; txtAmnt1[1])
            {
            }
            column(CheckAmountText; Abs(Amnt4))
            {
            }
            column(CheckToAddr_1_; Address[8])
            {
            }
            column(a; a)
            {
            }
            column(c; b)
            {
            }
            column(GenJnlLine_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(GenJnlLine_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(GenJnlLine_Line_No_; "Line No.")
            {
            }
            column(SELFCHECK; Self)
            {
            }

            trigger OnAfterGetRecord()
            begin
                VenLedEntry.SetRange(VenLedEntry."Document No.", GenJnlLine."Applies-to Doc. No.");

                if VenLedEntry.Find('-') then
                    repeat
                        //  MESSAGE('%1',VenLedEntry."Original Amt. (LCY)");
                        InvAmt := InvAmt + VenLedEntry.Amount;
                    //MESSAGE(FORMAT(InvAmt));
                    // MESSAGE(FORMAT(tdsamt));
                    until VenLedEntry.Next = 0;



                //TEAM::4217
                VendLedgEntry2.Reset;
                VendLedgEntry2.SetRange(VendLedgEntry2."Document No.", "Applies-to Doc. No.");
                if VendLedgEntry2.Find('-') then begin
                    VendDocDate := VendLedgEntry2."Document Date";
                    VendTds := VendLedgEntry2."Total TDS Including SHE CESS";

                end;
                //TEAM::4217
                //TEAN::1426

                if Location.Get(GenJnlLine."Shortcut Dimension 1 Code") then;
                if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Vendor then
                    if Vend.Get(GenJnlLine."Account No.") then begin
                        Address[1] := Vend.Address;
                        Address[2] := Vend."Address 2";
                        Address[3] := Vend.City;
                        Address[4] := Vend."Post Code";
                        Address[5] := Vend."No.";
                        Address[6] := Vend.Name + '  ' + Vend."Name 2";
                    end;
                if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then
                    if Cust.Get(GenJnlLine."Account No.") then begin
                        Address[1] := Cust.Address;
                        Address[2] := Cust."Address 2";
                        Address[3] := Cust.City;
                        Address[4] := Cust."Post Code";
                        Address[5] := Cust."No.";
                        Address[6] := Cust.Name;
                    end;
                if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account") or
                  (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Vendor) then
                    if GLAcc.Get(GenJnlLine."Account No.") or
                       Vend.Get(Vend."No.") then begin
                        //Address[8] := Description;
                        Address[8] := "Description 3 ";//#122
                        Address[7] := GLAcc.Name;
                        Address[5] := GLAcc."No.";
                        GenJoualNarration.SetRange(GenJoualNarration."Journal Template Name", GenJnlLine."Journal Template Name");
                        GenJoualNarration.SetRange(GenJoualNarration."Journal Batch Name", GenJnlLine."Journal Batch Name");
                    end;
                //   IF GenJoualNarration.FIND('-') THEN REPEAT
                //      GenJoualNarration1:=GenJoualNarration1+GenJoualNarration.Narration;
                //      UNTIL GenJoualNarration.NEXT=0;
                //      END
                //     ELSE

                //IF (GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor) OR
                if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer)
                //   (GenJnlLine."Account Type"=GenJnlLine."Account Type"::"Bank Account")
                   then begin
                    Doc1 := GenJnlLine."Applies-to Doc. No.";
                    Amunt := Format(GenJnlLine.Amount);
                    Amnt2 := (GenJnlLine."Debit Amount") + VendTds;
                    ExtDoc := GenJnlLine."External Document No.";
                    //TBD //tdsamt := Format(GenJnlLine."TDS/TCS Amount");
                    InvDate := Format(GenJnlLine."Document Date");
                    Branch := GenJnlLine."Shortcut Dimension 1 Code";
                    //   Amnt3:=GenJnlLine."Debit Amount"-GenJnlLine."Total TDS/TCS Incl. SHE CESS";
                    //   MESSAGE('%1',Amnt3);

                end

                else begin
                    // Doc1 := GenJnlLine.Description + '   ' + GenJnlLine."Mode of Payment";
                    Doc1 := GenJnlLine."Description 3 " + '   ' + GenJnlLine."Mode of Payment";//#112

                    Amunt := Format(GenJnlLine.Amount);
                    //Amnt2:='';
                    // Amnt3:=0;
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Account Type", GenJnlLine."Account Type"::"Bank Account");
                    GenJnlLine.SetFilter(GenJnlLine."Document No.", GenJnlLine."Document No.");
                    if GenJnlLine.Find('+') then
                        //IF  GenJnlLine."Account Type" = GenJnlLine."Account Type"::"Bank Account" THEN
                        //  Amnt3:=GenJnlLine.Amount-GenJnlLine."Total TDS/TCS Incl. SHE CESS";
                        //TBD //Amnt4 := GenJnlLine."Credit Amount" - GenJnlLine."Total TDS/TCS Incl. SHE CESS";
                        Amnt4 := GenJnlLine."Credit Amount";//3k-UPG
                    //  MESSAGE('%1',Amnt4);
                    //  MESSAGE(GenJnlLine."Document No.");
                    if GLAcc.Get(GenJnlLine."Account No.") then;
                    //Address[9]:=GLAcc.Name;
                    //Address[8] := GenJnlLine.Description;
                    Address[8] := GenJnlLine."Description 3 ";//#122
                    ExtDoc := '';
                    InvDate := '';
                    Branch := GenJnlLine."Shortcut Dimension 1 Code";
                end;

                if Location.Get(GenJnlLine."Shortcut Dimension 1 Code") then;
                //        Address[7]:='';


                //repCheck. InitTextVariable();
                InitTextVariable();
                //Amount := Round(Amount, 0.001);
                //repCheck.FormatNoText(txtAmnt1,Amount,'');
                // repCheck. FormatNoText(txtAmnt1, Amnt4, '');
                FormatNoText(txtAmnt1, Amnt4, '');
                //Format(GenJnlLine."Posting Date", 0, '<day,2> <month,2> <year4>');

                //TEAM::1426
                if Self = false then begin
                    a := '___________';
                    b := 'A/C Payee';
                end
                //TEAM::1426
            end;

            trigger OnPostDataItem()
            begin
                /*
                BankAcc2.RESET;
                BankAcc2.SETRANGE(BankAcc2."No.",GenJnlLine."Bal. Account No.");
                IF BankAcc2.FINDFIRST THEN
                   BankAcc2."Last Check No." := "Cheque No.";
                   BankAcc2.MODIFY;
                */

            end;

            trigger OnPreDataItem()
            begin
                Amnt1 := GenJnlLine.Amount;
                CurrReport.CreateTotals(Amount);
                CurrReport.CreateTotals(Amnt3);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Self; Self)
                {
                    Caption = 'Self Check';
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        GenJnlLine1: Record "Gen. Journal Line";
        Amnt: Decimal;
        Amnt3: Decimal;
        Location: Record Location;
        InvAmt: Decimal;
        VenLedEntry: Record "Vendor Ledger Entry";
        CustLedEntry: Record "Cust. Ledger Entry";
        Address: array[15] of Text[120];
        repCheck: Report Check;
        Amnt1: Decimal;
        txtAmnt1: array[2] of Text[200];
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        GenJnlLine2: Record "Gen. Journal Line";
        GenJnlLine3: Record "Gen. Journal Line";
        Cust: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        Vend: Record Vendor;
        VendLedgEntry: Record "Vendor Ledger Entry";
        DocNo: Text[30];
        Doc1: Text[70];
        Amunt: Text[15];
        ExtDoc: Text[18];
        InvDate: Text[8];
        Branch: Text[4];
        GLAcc: Record "G/L Account";
        Amnt2: Decimal;
        DocNo2: Text[18];
        "Vend Inv": Text[18];
        InvDate1: Text[18];
        AmtPaid: Text[18];
        InvAmt1: Text[18];
        Branch1: Text[18];
        GenJoualNarration: Record "Gen. Journal Narration";
        GenJoualNarration1: Text[200];
        GenJoualNarration2: Text[200];
        tdsamt: Text[30];
        TDSPaid: Text[30];
        VendLedgEntry2: Record "Vendor Ledger Entry";
        VendDocDate: Date;
        VendTds: Decimal;
        LineTDS: Decimal;
        Self: Boolean;
        a: Text[30];
        b: Text[30];
        BankAcc2: Record "Bank Account";
        Amnt4: Decimal;
        ZeroLbl: Label 'ZERO';
        OnlyLbl: Label 'ONLY';
        DrLbl: Label 'Dr';
        ToLbl: Label 'To';
        RupeesLbl: Label 'RUPEES';
        PaisaOnlyLbl: Label ' PAISA ONLY';
        DatedLbl: Label '  Dated: ';
        RsLbl: Label 'Rs. ';
        ChequeNoLbl: Label 'Cheque No: ';
        DateLbl: Label 'Date: ';
        HundreadLbl: Label 'HUNDRED';
        AndLbl: Label 'AND';
        ExceededStringErr: Label '%1 results in a written number that is too long.', Comment = '%1= AddText';
        OneLbl: Label 'ONE';
        TwoLbl: Label 'TWO';
        ThreeLbl: Label 'THREE';
        FourLbl: Label 'FOUR';
        FiveLbl: Label 'FIVE';
        SixLbl: Label 'SIX';
        SevenLbl: Label 'SEVEN';
        EightLbl: Label 'EIGHT';
        NineLbl: Label 'NINE';
        TenLbl: Label 'TEN';
        ElevenLbl: Label 'ELEVEN';
        TwelveLbl: Label 'TWELVE';
        ThireentLbl: Label 'THIRTEEN';
        FourteenLbl: Label 'FOURTEEN';
        FifteenLbl: Label 'FIFTEEN';
        SixteenLbl: Label 'SIXTEEN';
        SeventeenLbl: Label 'SEVENTEEN';
        EighteenLbl: Label 'EIGHTEEN';
        NinteenLbl: Label 'NINETEEN';
        TwentyLbl: Label 'TWENTY';
        ThirtyLbl: Label 'THIRTY';
        FortyLbl: Label 'FORTY';
        FiftyLbl: Label 'FIFTY';
        SixtyLbl: Label 'SIXTY';
        SeventyLbl: Label 'SEVENTY';
        EightyLbl: Label 'EIGHTY';
        NinetyLbl: Label 'NINETY';
        ThousandLbl: Label 'THOUSAND';
        LakhLbl: Label 'LAKH';
        CroreLbl: Label 'CRORE';
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        OnesText: array[20] of Text[30];


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        Currency: Record Currency;
        PrintExponent: Boolean;
        NoTextIndex: Integer;
        TensDec: Integer;
        OnesDec: Integer;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, ZeroLbl)
        else
            for Exponent := 4 DOWNTO 1 do begin
                PrintExponent := false;
                if No > 99999 then begin
                    Ones := No DIV (Power(100, Exponent - 1) * 10);
                    Hundreds := 0;
                end else begin
                    Ones := No DIV Power(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                end;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, HundreadLbl);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                if No > 99999 then
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(100, Exponent - 1) * 10
                else
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;

        if CurrencyCode <> '' then begin
            Currency.Get(CurrencyCode);
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ');
        end else
            AddToNoText(NoText, NoTextIndex, PrintExponent, RupeesLbl);

        AddToNoText(NoText, NoTextIndex, PrintExponent, AndLbl);

        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := (No * 100) MOD 10;
        if TensDec >= 2 then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
            if OnesDec > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
        end else
            if (TensDec * 10 + OnesDec) > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, ZeroLbl);
        if (CurrencyCode <> '') then
            AddToNoText(NoText, NoTextIndex, PrintExponent, OnlyLbl)
        else
            AddToNoText(NoText, NoTextIndex, PrintExponent, PaisaOnlyLbl);
    end;

    procedure InitTextVariable()
    begin
        OnesText[1] := OneLbl;
        OnesText[2] := TwoLbl;
        OnesText[3] := ThreeLbl;
        OnesText[4] := FourLbl;
        OnesText[5] := FiveLbl;
        OnesText[6] := SixLbl;
        OnesText[7] := SevenLbl;
        OnesText[8] := EightLbl;
        OnesText[9] := NineLbl;
        OnesText[10] := TenLbl;
        OnesText[11] := ElevenLbl;
        OnesText[12] := TwelveLbl;
        OnesText[13] := ThireentLbl;
        OnesText[14] := FourteenLbl;
        OnesText[15] := FifteenLbl;
        OnesText[16] := SixteenLbl;
        OnesText[17] := SeventeenLbl;
        OnesText[18] := EighteenLbl;
        OnesText[19] := NinteenLbl;

        TensText[1] := '';
        TensText[2] := TwentyLbl;
        TensText[3] := ThirtyLbl;
        TensText[4] := FortyLbl;
        TensText[5] := FiftyLbl;
        TensText[6] := SixtyLbl;
        TensText[7] := SeventyLbl;
        TensText[8] := EightyLbl;
        TensText[9] := NinetyLbl;

        ExponentText[1] := '';
        ExponentText[2] := ThousandLbl;
        ExponentText[3] := LakhLbl;
        ExponentText[4] := CroreLbl;
    end;

    local procedure AddToNoText(
        var NoText: array[2] of Text[80];
        var NoTextIndex: Integer;
        var PrintExponent: Boolean;
        AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(exceededStringErr, AddText);
        end;
        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

}

