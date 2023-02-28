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
            column(CheckDateText; Format("Posting Date"))
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


                repCheck.InitTextVariable();
                Amount := Round(Amount, 0.001);
                //repCheck.FormatNoText(txtAmnt1,Amount,'');
                repCheck.FormatNoText(txtAmnt1, Amnt4, '');

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
}

