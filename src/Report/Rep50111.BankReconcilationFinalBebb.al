report 50111 "Bank Reconcilation Final Bebb"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/BankReconcilationFinalBebb.rdlc';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(No; "Bank Account"."No.")
            {
            }
            column(Name; "Bank Account".Name)
            {
            }
            column(dtRecoDate; Format(dtRecoDate))
            {
            }
            column(decAmount; decAmount)
            {
            }
            column(BankAccNo; "Bank Account"."Bank Account No.")
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date") ORDER(Ascending);
                column(EntryNo; "Bank Account Ledger Entry"."Entry No.")
                {
                }
                column(BnkLedDocNo; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(DocDesc; DocDesc)
                {
                }
                column(ChqNo; "Bank Account Ledger Entry"."Cheque No.")
                {
                }
                column(ChqDate; "Bank Account Ledger Entry"."Cheque Date")
                {
                }
                column(DebitAmt; "Bank Account Ledger Entry"."Debit Amount")
                {
                }
                column(CredAmt; "Bank Account Ledger Entry"."Credit Amount")
                {
                }
                column(Amt; "Bank Account Ledger Entry".Amount)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    //IF "Bank Account Ledger Entry".Open = FALSE THEN BEGIN
                    BankAccStmtLine.Reset;
                    BankAccStmtLine.SetRange(BankAccStmtLine."Bank Account No.", "Bank Account"."No.");
                    BankAccStmtLine.SetRange("Statement No.", "Bank Account Ledger Entry"."Statement No.");
                    BankAccStmtLine.SetRange("Statement Line No.", "Bank Account Ledger Entry"."Statement Line No.");
                    BankAccStmtLine.Find('-');
                    if BankAccStmtLine."Value Date" <= dtRecoDate then
                        CurrReport.Skip;
                    //END;

                    CustLedEntry.Reset;
                    CustLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                    if CustLedEntry.Find('-') then begin
                        Cust.Get(CustLedEntry."Customer No.");
                        DocDesc := Cust.Name;
                    end else begin
                        VendLedEntry.Reset;
                        VendLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                        if VendLedEntry.Find('-') then begin
                            Vend.Get(VendLedEntry."Vendor No.");
                            DocDesc := Vend.Name;
                        end else begin
                            FALedEntry.Reset;
                            FALedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                            if FALedEntry.Find('-') then begin
                                FA.Get(FALedEntry."FA No.");
                                DocDesc := FA.Description;
                            end else begin
                                BankLedEntry.Reset;
                                BankLedEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                                BankLedEntry.SetFilter("Entry No.", '<>%1', "Bank Account Ledger Entry"."Entry No.");
                                if BankLedEntry.Find('-') then begin
                                    BankMaster.Get(BankLedEntry."Bank Account No.");
                                    DocDesc := BankMaster.Name;
                                end else begin
                                    GLEntry.Reset;
                                    GLEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                                    GLEntry.SetFilter("Entry No.", '<>%1', "Bank Account Ledger Entry"."Entry No.");
                                    if GLEntry.Find('-') then begin
                                        recGLAccount.Get(GLEntry."G/L Account No.");
                                        DocDesc := recGLAccount.Name;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Entry".SetFilter("Posting Date", '<=%1', dtRecoDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                if dtRecoDate = 0D then
                    Error('Please enter the Reconciliation Date.');

                decAmount := 0;
                BankAccStmtLine.Reset;
                BankAccStmtLine.SetCurrentKey("Bank Account No.", "Value Date");
                BankAccStmtLine.SetRange("Bank Account No.", "Bank Account"."No.");
                BankAccStmtLine.SetFilter("Value Date", '..%1', dtRecoDate);
                if BankAccStmtLine.Find('-') then begin
                    BankAccStmtLine.CalcSums("Statement Amount");
                    decAmount := BankAccStmtLine."Statement Amount";
                end;
            end;

            trigger OnPreDataItem()
            begin

                Compinfo.Get;
                Compinfo.CalcFields(Compinfo.Picture)
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Bank Reco Date"; dtRecoDate)
                {
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
        dtRecoDate: Date;
        Amt: Decimal;
        BankAccStmtLine: Record "Bank Account Statement Line";
        BankStmtEntryNo: Integer;
        sno: Integer;
        decAmount: Decimal;
        Excelbuf1: Record "Excel Buffer";
        Compinfo: Record "Company Information";
        PrintToExcel: Boolean;
        CustLedEntry: Record "Cust. Ledger Entry";
        VendLedEntry: Record "Vendor Ledger Entry";
        FALedEntry: Record "FA Ledger Entry";
        BankLedEntry: Record "Bank Account Ledger Entry";
        DocDesc: Text[80];
        BankMaster: Record "Bank Account";
        GLEntry: Record "G/L Entry";
        Vend: Record Vendor;
        Cust: Record Customer;
        FA: Record "Fixed Asset";
        recGLAccount: Record "G/L Account";
}

