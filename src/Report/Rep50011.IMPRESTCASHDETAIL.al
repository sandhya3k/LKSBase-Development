report 50011 "IMPREST -CASH DETAIL"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/IMPRESTCASHDETAIL.rdlc';
    Caption = 'Cash Book';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Account Type" = FILTER(Posting));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Date Filter", "No.", "Global Dimension 1 Code";
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(IMPREST___CASH_DETAIL_Account_______GLFilter; 'IMPREST - CASH DETAIL Account ' + ' ' + GLFilter)
            {
            }
            column(Locdes; Locdes)
            {
            }
            column(CompInfo_Name_Control1500017; CompInfo.Name)
            {
            }
            column(Locdes_Control1500023; Locdes)
            {
            }
            column(CurrReport_PAGENO_Control1000000013; CurrReport.PageNo)
            {
            }
            column(IMPREST___CASH_DETAIL_Account______GETFILTERS; 'IMPREST - CASH DETAIL Account' + ' ' + GetFilters)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 1))
            {
            }
            column(USERID; UserId)
            {
            }
            column(Opening_Balance_As_On_______FORMAT_GETRANGEMIN__Date_Filter___; 'Opening Balance As On' + ' ' + Format(GetRangeMin("Date Filter")))
            {
            }
            column(OpeningDRBal; OpeningDRBal)
            {
            }
            column(OpeningCRBal; OpeningCRBal)
            {
            }
            column(OpeningCRBal__G_L_Entry___Credit_Amount_; OpeningCRBal + "G/L Entry"."Credit Amount")
            {
            }
            column(DrCrTextBalance__________FORMAT__OpeningDRBal__G_L_Entry___Debit_Amount____OpeningCRBal__G_L_Entry___Credit_Amount___; DrCrTextBalance + '  ' + Format((OpeningDRBal + "G/L Entry"."Debit Amount") - (OpeningCRBal + "G/L Entry"."Credit Amount")))
            {
            }
            column(OpeningDRBal__G_L_Entry___Debit_Amount_; OpeningDRBal + "G/L Entry"."Debit Amount")
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Branch_NameCaption; Branch_NameCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(ReceiptCaption; ReceiptCaptionLbl)
            {
            }
            column(PaymentCaption; PaymentCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Posting_DateCaption_Control1500048; Posting_DateCaption_Control1500048Lbl)
            {
            }
            column(ReceiptCaption_Control1500051; ReceiptCaption_Control1500051Lbl)
            {
            }
            column(PaymentCaption_Control1500052; PaymentCaption_Control1500052Lbl)
            {
            }
            column(NameCaption_Control1000000000; NameCaption_Control1000000000Lbl)
            {
            }
            column(Branch_NameCaption_Control1000000005; Branch_NameCaption_Control1000000005Lbl)
            {
            }
            column(CurrReport_PAGENO_Control1000000013Caption; CurrReport_PAGENO_Control1000000013CaptionLbl)
            {
            }
            column(DescriptionCaption_Control1000000010; DescriptionCaption_Control1000000010Lbl)
            {
            }
            column(Transaction_DateCaption; Transaction_DateCaptionLbl)
            {
            }
            column(Cash_in_handCaption; Cash_in_handCaptionLbl)
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }
            column(G_L_Account_Date_Filter; "Date Filter")
            {
            }
            column(G_L_Account_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(G_L_Account_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                DataItemTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("Posting Date" = FILTER(<> 0D));
                PrintOnlyIfDetail = false;
                column(FORMAT__Posting_Date___0____Closing__Day_2___Month_2___Year___; Format("Posting Date", 0, '<Closing><Day,2>-<Month,2>-<Year>'))
                {
                }
                column(G_L_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(G_L_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(GLEntry_Description; GLEntry.Description)
                {
                }
                column(Posted_Narration__Narration; "Posted Narration".Narration)
                {
                }
                column(G_L_Entry__Document_Date_; "Document Date")
                {
                }
                column(G_L_Entry_Entry_No_; "Entry No.")
                {
                }
                column(G_L_Entry_G_L_Account_No_; "G/L Account No.")
                {
                }
                column(G_L_Entry_Posting_Date; "Posting Date")
                {
                }
                column(G_L_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(G_L_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(G_L_Entry_Transaction_No_; "Transaction No.")
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(GLEntry__Posting_Date_; GLEntry."Posting Date")
                    {
                    }
                    column(G_L_Entry___Debit_Amount_; "G/L Entry"."Debit Amount")
                    {
                    }
                    column(G_L_Entry___Credit_Amount_; "G/L Entry"."Credit Amount")
                    {
                    }
                    column(ABS_DetailAmt_; Abs(DetailAmt))
                    {
                    }
                    column(DrCrText; DrCrText)
                    {
                    }
                    column(GLEntry_Description_Control1000000002; GLEntry.Description)
                    {
                    }
                    column(Posted_Narration__Narration_Control1000000014; "Posted Narration".Narration)
                    {
                    }
                    column(ABS_GLEntry_Amount_; Abs(GLEntry.Amount))
                    {
                    }
                    column(DrCrText_Control1500056; DrCrText)
                    {
                    }
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        DrCrText := '';
                        if Number > 1 then begin
                            FirstRecord := false;
                            GLEntry.Next;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, GLEntry.Count);
                        FirstRecord := true;

                        if GLEntry.Count = 1 then
                            CurrReport.Break;
                    end;
                }
                dataitem("Posted Narration"; "Posted Narration")
                {
                    DataItemLink = "Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.") ORDER(Ascending);
                    column(Posted_Narration_Narration; Narration)
                    {
                    }
                    column(Posted_Narration_Entry_No_; "Entry No.")
                    {
                    }
                    column(Posted_Narration_Transaction_No_; "Transaction No.")
                    {
                    }
                    column(Posted_Narration_Line_No_; "Line No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not PrintLineNarration then
                            CurrReport.Break;
                    end;
                }
                dataitem(PostedNarration1; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.") WHERE("Entry No." = FILTER(0));
                    column(PostedNarration1_Narration; Narration)
                    {
                    }
                    column(PostedNarration1_Entry_No_; "Entry No.")
                    {
                    }
                    column(PostedNarration1_Transaction_No_; "Transaction No.")
                    {
                    }
                    column(PostedNarration1_Line_No_; "Line No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not PrintVchNarration then
                            CurrReport.Break;

                        GLEntry2.Reset;
                        GLEntry2.SetCurrentKey("Posting Date", "Source Code", "Transaction No.");
                        GLEntry2.SetRange("Posting Date", "G/L Entry"."Posting Date");
                        GLEntry2.SetRange("Source Code", "G/L Entry"."Source Code");
                        GLEntry2.SetRange("Transaction No.", "G/L Entry"."Transaction No.");
                        GLEntry2.SetRange("G/L Account No.", "G/L Account"."No.");
                        GLEntry2.FindLast;
                        if not (GLEntry2."Entry No." = "G/L Entry"."Entry No.") then
                            CurrReport.Break;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    GLEntry.SetRange("Transaction No.", "Transaction No.");
                    GLEntry.SetFilter("Entry No.", '<>%1', "Entry No.");
                    if GLEntry.FindFirst then;

                    DrCrText := '';
                    OneEntryRecord := true;
                    if GLEntry.Count > 1 then
                        OneEntryRecord := false;

                    if Amount > 0 then
                        TransDebits := TransDebits + Amount;
                    if Amount < 0 then
                        TransCredits := TransCredits - Amount;

                    SourceDesc := '';
                    if "Source Code" <> '' then begin
                        SourceCode.Get("Source Code");
                        SourceDesc := SourceCode.Description;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    //TBD
                    /*
                    if LocationCode <> '' then
                        SetFilter("Location Code", LocationCode);
                    */
                    GLEntry.Reset;
                    GLEntry.SetCurrentKey("Transaction No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //TBD
                /*
                VoucherAccount.SetRange("Account No.", "No.");
                if not VoucherAccount.FindFirst then
                    CurrReport.Skip;
                */

                if Location.Get(LocationCode) then
                    Locdes := Location.Name + '    ' + Location.Code;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(TransDebits, TransCredits, "G/L Entry"."Debit Amount", "G/L Entry"."Credit Amount");
                if LocationCode <> '' then begin
                    //TBD //VoucherAccount.SetRange("Location code", LocationCode);
                    LocationFilter := 'Location Code: ' + LocationCode;
                end;
                //TBD 
                /*
                VoucherAccount.SetFilter("Sub Type", '%1|%2', VoucherAccount."Sub Type"::"Cash Payment Voucher",
                VoucherAccount."Sub Type"::"Cash Receipt Voucher");
                VoucherAccount.SetRange("Account Type", VoucherAccount."Account Type"::"G/L Account");
                */
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

    trigger OnPreReport()
    begin
        CompInfo.Get;
        GLFilter := "G/L Account".GetFilters;
        //TRI
        //IF "Cash Page No."='' THEN
        //ERROR('%1',Text001);
    end;

    var
        CompInfo: Record "Company Information";
        GLEntry2: Record "G/L Entry";
        SourceCode: Record "Source Code";
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        TransDebits: Decimal;
        TransCredits: Decimal;
        OneEntryRecord: Boolean;
        FirstRecord: Boolean;
        PrintDetail: Boolean;
        PrintLineNarration: Boolean;
        PrintVchNarration: Boolean;
        DetailAmt: Decimal;
        AccountName: Text[100];
        SourceDesc: Text[50];
        DrCrText: Text[2];
        DrCrTextBalance: Text[2];
        LocationCode: Code[10];
        LocationFilter: Text[100];
        Text16500: Label 'As per Details';
        AccountChanged: Boolean;
        Location: Record Location;
        Locdes: Text[50];
        NetTotal: Decimal;
        "Cash Page No.": Code[10];
        Text001: Label 'Enter Cash Pge No.';
        GLEntry: Record "G/L Entry";
        DimenssionValue: Record "Dimension Value";
        GLFilter: Text[50];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Branch_NameCaptionLbl: Label 'Branch Name';
        Posting_DateCaptionLbl: Label 'Posting Date';
        ReceiptCaptionLbl: Label 'Receipt';
        PaymentCaptionLbl: Label 'Payment';
        NameCaptionLbl: Label 'Name';
        DescriptionCaptionLbl: Label 'Description';
        Posting_DateCaption_Control1500048Lbl: Label 'Posting Date';
        ReceiptCaption_Control1500051Lbl: Label 'Receipt';
        PaymentCaption_Control1500052Lbl: Label 'Payment';
        NameCaption_Control1000000000Lbl: Label 'Name';
        Branch_NameCaption_Control1000000005Lbl: Label 'Branch Name';
        CurrReport_PAGENO_Control1000000013CaptionLbl: Label 'Page';
        DescriptionCaption_Control1000000010Lbl: Label 'Description';
        Transaction_DateCaptionLbl: Label 'Transaction Date';
        Cash_in_handCaptionLbl: Label 'Cash in hand';
}

