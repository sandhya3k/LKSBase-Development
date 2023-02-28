report 50195 "TDS Report New"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'TDS Report New';
    DefaultLayout = RDLC;
    RDLCLayout = './res/TDSReportNew.rdlc';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(AccountNo; "G/L Account"."No.")
            {
            }
            column(Bal; Abs("G/L Account"."Net Change"))
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                dataitem(GLEntry2; "G/L Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No.");
                    DataItemTableView = WHERE(Reversed = CONST(false));
                    column(GLAccNo; GLEntry2."G/L Account No.")
                    {
                    }
                    column(DocNo; GLEntry2."Document No.")
                    {
                    }
                    column(BranchCode; GLEntry2."Global Dimension 1 Code")
                    {
                    }
                    column(Des; Descr)
                    {
                    }
                    column(Groupby; Groupby)
                    {
                    }
                    column(DrAmt; DrAmt)
                    {
                    }
                    column(CrAmt; CrAmt)
                    {
                    }
                    column(VendName; VendName)
                    {
                    }
                    column(VendPAN; VendPAN)
                    {
                    }
                    column(PostingDate; Format(GLEntry2."Posting Date"))
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        BankAcc: Record "Bank Account";
                        DimSetEntry1: Record "Dimension Set Entry";
                        RecVendor: Record Vendor;
                    begin
                        if GLEntry2.Description = 'GST PAID' then
                            Groupby := 'GSTPAID'
                        else
                            Groupby := GLEntry2."Document No.";

                        Clear(DrAmt);
                        Clear(CrAmt);
                        if GLEntry2.Amount < 0 then
                            DrAmt := Abs(GLEntry2.Amount)
                        else
                            CrAmt := Abs(GLEntry2.Amount);

                        /*IF GLEntry2."Source Type" = GLEntry2."Source Type"::"Bank Account" THEN BEGIN
                          BankAcc.GET(GLEntry2."Source No.");
                          Descr := BankAcc.Name;
                        END ELSE*/
                        Descr := GLEntry2.Description;


                        Clear(VendorCode);
                        Clear(VendName);
                        Clear(VendPAN);
                        DimSetEntry1.Reset;
                        DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
                        DimSetEntry1.SetRange("Dimension Code", 'VENDOR');
                        if DimSetEntry1.FindSet then begin
                            VendorCode := DimSetEntry1."Dimension Value Code";
                            if RecVendor.Get(VendorCode) then begin
                                VendName := RecVendor.Name;
                                VendPAN := RecVendor."P.A.N. No.";
                            end;
                        end;

                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                "G/L Account".CalcFields("Net Change");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Groupby: Code[20];
        DrAmt: Decimal;
        CrAmt: Decimal;
        Descr: Text[100];
        VendorCode: Code[20];
        VendName: Text[100];
        VendPAN: Code[20];
}

