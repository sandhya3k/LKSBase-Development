report 50014 "Cash Page Before posting"
{
    //  ----------3899----------
    DefaultLayout = RDLC;
    RDLCLayout = './res/CashPageBeforeposting.rdlc';


    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Posting Date", "Cheque No. 2") ORDER(Ascending);
            RequestFilterFields = "Location Code";
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME_______BranchName; CompanyName + ' , ' + BranchName)
            {
            }
            column(ForDate; ForDate)
            {
            }
            column(TotalOpenBal; TotalOpenBal)
            {
            }
            column(Gen__Journal_Line_Description; Description)
            {
            }
            // column(Description_3;"Description 3")
            column(Receipt; Receipt)
            {
            }
            column(Payment; Payment)
            {
            }
            column(Gen__Journal_Line__Mode_of_Payment_; "Mode of Payment")
            {
            }
            column(Gen__Journal_Line__Document_No__; "Document No.")
            {
            }
            column(A_cName_; "A/cName")
            {
            }
            column(ClosingBal; ClosingBal)
            {
            }
            column(Receipt_Control1000000028; Receipt)
            {
            }
            column(Payment_Control1000000029; Payment)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(CASH_PAGE_REPORTCaption; CASH_PAGE_REPORTCaptionLbl)
            {
            }
            column(Report_Date__Caption; Report_Date__CaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Dr_Amount_Caption; Dr_Amount_CaptionLbl)
            {
            }
            column(Cr_AmountCaption; Cr_AmountCaptionLbl)
            {
            }
            column(Description2Caption; Description2CaptionLbl)
            {
            }
            column(Gen__Journal_Line__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(A_c_NameCaption; A_c_NameCaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            {
            }
            column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(Gen__Journal_Line_Line_No_; "Line No.")
            {
            }

            trigger OnPreDataItem()
            begin
                BranchName := '';
                GenJenLineBalance := 0;
                TotalOpenBal := 0;
                OpeningBal := 0;
                CrAmount := 0;
                DrAmount := 0;

                GLEntry.Reset;
                GLEntry.SetCurrentKey("G/L Account No.", "Posting Date");
                GLEntry.SetRange(GLEntry."G/L Account No.", '21-02-115000');
                //TBD //GLEntry.SetRange(GLEntry."Location Code", "Gen. Journal Line".GetFilter("Gen. Journal Line"."Location Code"));
                GLEntry.SetRange(GLEntry."Posting Date", 0D, ForDate);//3899
                if GLEntry.FindFirst then begin
                    repeat
                        OpeningBal += GLEntry.Amount;

                    until GLEntry.Next = 0;
                end;

                //3899 std
                GenJenLine.Reset;
                //GenJenLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Cheque No.");
                GenJenLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Cheque No. 2"); //#94
                GenJenLine.SetRange(GenJenLine."Location Code",
                "Gen. Journal Line".GetFilter("Gen. Journal Line"."Location Code")); //3899
                GenJenLine.SetRange(GenJenLine."Posting Date", 0D, ForDate - 1);//3899


                GenJenLine.Reset;
                //GenJenLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Cheque No.");
                GenJenLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date", "Cheque No. 2"); //#94
                GenJenLine.SetRange(GenJenLine."Location Code",
                "Gen. Journal Line".GetFilter("Gen. Journal Line"."Location Code")); //3899
                GenJenLine.SetRange(GenJenLine."Posting Date", 0D, ForDate - 1);//3899


                if GenJenLine.Find('-') then
                    repeat
                        if (GenJenLine."Account No." = '21-02-115000') and (GenJenLine."Bal. Account No." <> '21-02-115000') then
                            DrAmount += GenJenLine.Amount
               until GenJenLine.Next = 0;

                GenJenLine1.Reset;
                GenJenLine1.SetRange(GenJenLine1."Location Code",
               "Gen. Journal Line".GetFilter("Gen. Journal Line"."Location Code")); //3899



                GenJenLine1.SetRange(GenJenLine1."Posting Date", 0D, (ForDate - 1));
                if GenJenLine1.Find('-') then
                    repeat
                        if (GenJenLine1."Account No." <> '21-02-115000') and (GenJenLine1."Bal. Account No." = '21-02-115000') then
                            CrAmount += GenJenLine1.Amount;
                    until GenJenLine1.Next = 0;


                GenJenLineBalance := DrAmount - CrAmount;

                TotalOpenBal := OpeningBal + GenJenLineBalance;

                CurrReport.CreateTotals(Payment, Receipt);

                "Gen. Journal Line".SetRange("Gen. Journal Line"."Posting Date", ForDate);

                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue.Code, "Gen. Journal Line".GetFilter("Gen. Journal Line"."Shortcut Dimension 1 Code"));
                if DimensionValue.FindFirst then
                    BranchName := DimensionValue.Name;
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
        Payment: Decimal;
        Receipt: Decimal;
        GLEntry: Record "G/L Entry";
        OpeningBal: Decimal;
        ClosingBal: Decimal;
        PostingDate: Date;
        ForDate: Date;
        GLAccount: Record "G/L Account";
        "A/cName": Text[50];
        GenJenLine: Record "Gen. Journal Line";
        GenJenLine1: Record "Gen. Journal Line";
        GenJenLineBalance: Decimal;
        TotalOpenBal: Decimal;
        CrAmount: Decimal;
        DrAmount: Decimal;
        BranchName: Text[100];
        DimensionValue: Record "Dimension Value";
        OpeningBal1: Decimal;
        OpeningBalTotal: Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CASH_PAGE_REPORTCaptionLbl: Label 'CASH PAGE REPORT';
        Report_Date__CaptionLbl: Label 'Report Date :';
        DescriptionCaptionLbl: Label 'Description';
        Dr_Amount_CaptionLbl: Label 'Dr Amount ';
        Cr_AmountCaptionLbl: Label 'Cr Amount';
        Description2CaptionLbl: Label 'Description2';
        A_c_NameCaptionLbl: Label 'A/c Name';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        Closing_BalanceCaptionLbl: Label 'Closing Balance';
}

