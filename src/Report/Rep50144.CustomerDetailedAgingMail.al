report 50144 "Customer Detailed Aging Mail"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustomerDetailedAgingMail.rdlc';
    Caption = 'Customer Detailed Aging';

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Customer Posting Group", "Currency Filter", "Payment Terms Code", "Global Dimension 1 Filter";
            column(Cap1; 'O/s Amt. in Billing Curr.')
            {
            }
            column(Cap2; 'O/s Amt. in INR')
            {
            }
            column(DateCapton; DateCapton)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_FORMAT_EndDate__; StrSubstNo(Text000, Format(StartDate)))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Compinfo_Picture; Compinfo.Picture)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Phone_No__; "Phone No.")
            {
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
            }
            column(StartBalanceLCY1; StartBalanceLCY1)
            {
            }
            column(Opening_Balance_As_on______FORMAT_StartDate_; 'Opening Balance As on' + ' ' + Format(StartDate))
            {
            }
            column(Customer_Detailed_AgingCaption; Customer_Detailed_AgingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_Caption; Cust__Ledger_Entry__Posting_Date_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; Cust__Ledger_Entry__Document_No__CaptionLbl)
            {
            }
            column(OverDueMonthsCaption; OverDueMonthsCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amount_Caption; Cust__Ledger_Entry__Remaining_Amount_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Currency_Code_Caption; Cust__Ledger_Entry__Currency_Code_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Remaining_Amt___LCY__Caption; Cust__Ledger_Entry__Remaining_Amt___LCY__CaptionLbl)
            {
            }
            column(ATTORNEY_2Caption; ATTORNEY_2CaptionLbl)
            {
            }
            column(Branch_CodeCaption; Branch_CodeCaptionLbl)
            {
            }
            column(Case_IDCaption; Case_IDCaptionLbl)
            {
            }
            column(Amount_in_Billing_Curr_Caption; Amount_in_Billing_Curr_CaptionLbl)
            {
            }
            column(Amount_in_INRCaption; Amount_in_INRCaptionLbl)
            {
            }
            column(Contact_PersonCaption; Contact_PersonCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Cheque_No__Caption; "Cust. Ledger Entry".FieldCaption("Cheque No."))
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(Customer__Phone_No__Caption; FieldCaption("Phone No."))
            {
            }
            column(Cust__Ledger_Entry__Due_Date_Caption; Cust__Ledger_Entry__Due_Date_CaptionLbl)
            {
            }
            column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Customer_Currency_Filter; "Currency Filter")
            {
            }
            column(Customer_Date_Filter; "Date Filter")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No."), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Currency Code" = FIELD("Currency Filter"), "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date", "Currency Code") ORDER(Ascending);
                RequestFilterFields = "Document Type";
                column(DateFilter; DateFilter)
                {
                }
                column(Cust__Ledger_Entry__Posting_Date_; Format("Posting Date"))
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(OverDueMonths; OWNER_1)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Remaining_Amount_; "Remaining Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Currency_Code_; CurrCode)
                {
                }
                column(Cust__Ledger_Entry__Remaining_Amt___LCY__; "Remaining Amt. (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Owner2; OWNER_2)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Global_Dimension_1_Code_; "Global Dimension 1 Code")
                {
                }
                column(Cust__Ledger_Entry__Global_Dimension_2_Code_; "Global Dimension 2 Code")
                {
                }
                column(Cust__Ledger_Entry_Amount; Amount)
                {
                }
                column(Cust__Ledger_Entry__Original_Amt___LCY__; "Original Amt. (LCY)")
                {
                }
                column(ContactPerson; ContactPerson)
                {
                }
                column(ContactEmail; ContactEmail)
                {
                }
                column(ContactPhoneNumber; ContactPhoneNumber)
                {
                }
                column(Cust__Ledger_Entry__Cheque_No__; "Cheque No.")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Cheque_Date_; "Cust. Ledger Entry"."Cheque Date")
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }
                column(Cust__Ledger_Entry_Currency_Code; "Currency Code")
                {
                }
                column(Cust__Ledger_Entry_Date_Filter; "Date Filter")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "Due Date" = 0D then
                        OverDueMonths := 0
                    else begin
                        OverDueMonths :=
                          (Date2DMY(EndDate, 3) - Date2DMY("Due Date", 3)) * 12 +
                          Date2DMY(EndDate, 2) - Date2DMY("Due Date", 2);
                        if Date2DMY(EndDate, 1) < Date2DMY("Due Date", 1) then
                            OverDueMonths := OverDueMonths - 1;
                    end;
                    SetRange("Date Filter", 0D, EndDate);
                    CalcFields("Remaining Amount", "Remaining Amt. (LCY)");
                    if "Remaining Amount" = 0 then
                        CurrReport.Skip;
                    CurrencyTotalBuffer.UpdateTotal(
                      "Currency Code", "Remaining Amount", "Remaining Amt. (LCY)", Counter);

                    if "Cust. Ledger Entry"."Currency Code" = '' then
                        CurrCode := 'INR'
                    else
                        CurrCode := "Cust. Ledger Entry"."Currency Code";


                    /*
                    
                    //Blocked By TEAM::4217
                    Owner1 :='';
                    PostedDocDim.SETRANGE(PostedDocDim."Document No.","Cust. Ledger Entry"."Document No.");
                    PostedDocDim.SETFILTER(PostedDocDim."Dimension Code",'OWNER1');
                    IF PostedDocDim.FINDFIRST THEN
                       Owner1 := PostedDocDim."Dimension Value Code"
                    ELSE
                       Owner1 :='';
                    
                    Owner2 :='';
                    PostedDocDim.SETRANGE(PostedDocDim."Document No.","Cust. Ledger Entry"."Document No.");
                    PostedDocDim.SETFILTER(PostedDocDim."Dimension Code",'OWNER2');
                    IF PostedDocDim.FINDFIRST THEN
                       Owner2 := PostedDocDim."Dimension Value Code"
                    ELSE
                       Owner2 :='';
                     */

                    OWNER_1 := '';
                    OWNER_2 := '';
                    /*DimVal.SETRANGE(DimVal."Dimension Code",'CASE');
                    DimVal.SETRANGE(DimVal.Code,"Cust. Ledger Entry"."Global Dimension 2 Code");
                    IF DimVal.FIND('-') THEN BEGIN
                    OWNER1:=DimVal."Case-Owner1";
                    OWNER2:=DimVal."Case-Owner2";
                    END ;
                    */
                    OWNER_1 := "Cust. Ledger Entry".OWNER1;
                    OWNER_2 := "Cust. Ledger Entry".OWNER2;

                    if DimVal.Get('OWNER2', "Cust. Ledger Entry".OWNER2) then
                        OWNER2 := DimVal.Name;

                    MOF := '';
                    ContactPerson := '';
                    Clear(ContactEmail);
                    Clear(ContactPhoneNumber);
                    InvoiceHeader.SetRange(InvoiceHeader."No.", "Cust. Ledger Entry"."Document No.");
                    //InvoiceHeader.SETFILTER();
                    if InvoiceHeader.FindFirst then begin
                        ContactPerson := InvoiceHeader."Ship-to Contact";
                        if ContactRec.Get(InvoiceHeader."Bill-to Contact No.") then begin
                            ContactEmail := ContactRec."E-Mail";
                            ContactPhoneNumber := ContactRec."Mobile Phone No.";
                        end;
                        MOF := InvoiceHeader."Bill Description";
                    end;
                    Clear(DateFilter);
                    if "Cust. Ledger Entry"."Posting Date" < CalcDate('<-CY+3M>', "Cust. Ledger Entry"."Posting Date") then
                        DateFilter := '   ' + Format(Date2DMY(CalcDate('<-CY-1Y+3M>', "Cust. Ledger Entry"."Posting Date"), 3)) + '-' + Format(Date2DMY("Cust. Ledger Entry"."Posting Date", 3))
                    else
                        DateFilter := '   ' + Format(Date2DMY("Cust. Ledger Entry"."Posting Date", 3)) + '-' + Format(Date2DMY(CalcDate('<-CY+1Y+3M>', "Cust. Ledger Entry"."Posting Date"), 3));

                    "Cust. Ledger Entry".CalcFields("Remaining Amount");
                    RemAmtTot += "Cust. Ledger Entry"."Remaining Amount";

                end;

                trigger OnPreDataItem()
                begin
                    if OnlyOpen then begin
                        SetRange(Open, true);
                        SetRange("Posting Date", StartDate, EndDate);
                        // SETRANGE("Due Date",0D,EndDate);
                    end else
                        SetRange("Posting Date", StartDate, EndDate);
                    // SETRANGE("Due Date",0D,EndDate);
                    SetRange("Ship-to Contact", GlobalContact);
                    CurrReport.CreateTotals("Remaining Amount", "Remaining Amt. (LCY)", Amount, "Cust. Ledger Entry"."Amount (LCY)");
                    Counter := 0;
                    Clear(RemAmtTot);
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                column(CurrencyTotalBuffer__Total_Amount_; EndingBal1)
                {
                    AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                    AutoFormatType = 1;
                }
                column(CurrencyTotalBuffer__Currency_Code_; CurrencyTotalBuffer."Currency Code")
                {
                }
                column(CurrencyTotalBuffer__Total_Amount__LCY__; EndingBal)
                {
                    AutoFormatType = 1;
                }
                column(Closing__Balance_As_on______FORMAT_EndDate_; 'Closing  Balance As on' + ' ' + Format(EndDate))
                {
                }
                column(Customer_Name_Control1000000003; Customer.Name)
                {
                }
                column(Cust__Ledger_Entry___Remaining_Amt___LCY__; "Cust. Ledger Entry"."Remaining Amt. (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        OK := CurrencyTotalBuffer.Find('-')
                    else
                        OK := CurrencyTotalBuffer.Next <> 0;
                    if not OK then
                        CurrReport.Break;
                    CurrencyTotalBuffer2.UpdateTotal(
                      CurrencyTotalBuffer."Currency Code",
                      CurrencyTotalBuffer."Total Amount",
                      CurrencyTotalBuffer."Total Amount (LCY)", Counter1);
                end;

                trigger OnPostDataItem()
                begin
                    CurrencyTotalBuffer.DeleteAll;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DateCapton := 'Fiscal Year';
                StartBalanceLCY := 0;
                StartBalanceLCY1 := 0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetFilter(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', 0D, StartDate - 1);
                if CustLedgerEntry.FindFirst then begin
                    repeat
                        CustLedgerEntry.CalcFields(CustLedgerEntry."Remaining Amt. (LCY)");
                        StartBalanceLCY := StartBalanceLCY + CustLedgerEntry."Remaining Amt. (LCY)"
                     until
                      CustLedgerEntry.Next = 0;
                end;

                StartBalanceLCY1 := 0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetFilter(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', 0D, StartDate - 1);
                if CustLedgerEntry.FindFirst then begin
                    repeat
                        CustLedgerEntry.CalcFields(CustLedgerEntry."Remaining Amount");
                        StartBalanceLCY1 := StartBalanceLCY1 + (CustLedgerEntry."Remaining Amount");
                    until
                      CustLedgerEntry.Next = 0;
                end;

                ClosingBalance := 0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetFilter(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', StartDate, EndDate);
                if CustLedgerEntry.FindFirst then
                    repeat
                        CustLedgerEntry.CalcFields(CustLedgerEntry."Remaining Amt. (LCY)");
                        ClosingBalance := ClosingBalance + CustLedgerEntry."Remaining Amt. (LCY)";
                    until
                       CustLedgerEntry.Next = 0;

                ClosingBalance1 := 0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetFilter(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', StartDate, EndDate);
                if CustLedgerEntry.FindFirst then
                    repeat
                        CustLedgerEntry.CalcFields(CustLedgerEntry."Remaining Amount");
                        ClosingBalance1 := ClosingBalance1 + CustLedgerEntry."Remaining Amount";
                    until
                       CustLedgerEntry.Next = 0;

                EndingBal := StartBalanceLCY + ClosingBalance;
                //    MESSAGE('%1', EndingBal) ;
                EndingBal1 := StartBalanceLCY1 + ClosingBalance1;
                //    MESSAGE('%1', EndingBal1);

                GrandTotal += StartBalanceLCY + ClosingBalance;
                GrandTotal1 += StartBalanceLCY1 + ClosingBalance1;
                //MESSAGE('%1',GrandTotal);
            end;

            trigger OnPostDataItem()
            var
                SingleIns: Codeunit "Single Instance";
            begin
                SingleIns.SetRemAmt(RemAmtTot);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Cust. Ledger Entry"."Remaining Amt. (LCY)");
                SetRange("No.", GlobalCustomer);
            end;
        }
        dataitem(Integer2; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(CurrencyTotalBuffer2__Currency_Code_; CurrencyTotalBuffer2."Currency Code")
            {
            }
            column(CurrencyTotalBuffer2__Total_Amount_; CurrencyTotalBuffer2."Total Amount")
            {
                AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                AutoFormatType = 1;
            }
            column(CurrencyTotalBuffer2__Total_Amount__LCY__; CurrencyTotalBuffer2."Total Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(Cust__Ledger_Entry___Remaining_Amt___LCY___Control22; GrandTotal)
            {
                AutoFormatType = 1;
            }
            column(GrandTotal1; GrandTotal1)
            {
                AutoFormatType = 1;
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Closing_Balance_Grand_TotalCaption; Closing_Balance_Grand_TotalCaptionLbl)
            {
            }
            column(Ledger_Memo1; Ledger_Note)
            {
            }
            column(Note__Caption; Note__CaptionLbl)
            {
            }
            column(Integer2_Number; Number)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then
                    OK := CurrencyTotalBuffer2.Find('-')
                else
                    OK := CurrencyTotalBuffer2.Next <> 0;
                if not OK then
                    CurrReport.Break;
            end;

            trigger OnPostDataItem()
            begin
                CurrencyTotalBuffer2.DeleteAll;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Ending Date"; EndDate)
                    {
                        Caption = 'Ending Date';
                        ApplicationArea = All;
                    }
                    field(OnlyOpen; OnlyOpen)
                    {
                        Caption = 'Show Open Entries Only';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if EndDate = 0D then
                EndDate := WorkDate;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        Compinfo.Get;
        Compinfo.CalcFields(Picture);
        //CompanyInfo.CALCFIELDS(Picture);
    end;

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        CustFilter := Customer.GetFilters;
        if PrintToExcel then
            MakeExcelInfo;

        StartDate := GlobalStDate;
        EndDate := GlobalEnDate;
        OnlyOpen := GlobalOpen;
    end;

    var
        Text000: Label 'Statement for the period from %1 To';
        CurrencyTotalBuffer: Record "Currency Total Buffer" temporary;
        CurrencyTotalBuffer2: Record "Currency Total Buffer" temporary;
        EndDate: Date;
        CustFilter: Text[250];
        OverDueMonths: Integer;
        OK: Boolean;
        Counter: Integer;
        Counter1: Integer;
        OnlyOpen: Boolean;
        StartDate: Date;
        ExcelBuf: Record "Excel Buffer" temporary;
        Compinfo: Record "Company Information";
        PrintToExcel: Boolean;
        Owner1: Code[50];
        Owner2: Code[50];
        ContactPerson: Text[100];
        InvoiceHeader: Record "Sales Invoice Header";
        "Client Name": Text[100];
        MOF: Text[250];
        DimVal: Record "Dimension Value";
        CurrCode: Code[20];
        StartBalanceLCY: Decimal;
        EndingBal: Decimal;
        ClosingBalance: Decimal;
        R_DetCustledg: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        StartBalanceLCY1: Decimal;
        GrandTotal: Decimal;
        ClosingBalance1: Decimal;
        GrandTotal1: Decimal;
        EndingBal1: Decimal;
        Text001: Label 'Statement As on %1 ';
        Customer_Detailed_AgingCaptionLbl: Label 'Customer Detailed Aging';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Cust__Ledger_Entry__Posting_Date_CaptionLbl: Label 'Memo Date';
        Cust__Ledger_Entry__Document_No__CaptionLbl: Label 'Memo No.';
        OverDueMonthsCaptionLbl: Label 'ATTORNEY-1';
        Cust__Ledger_Entry__Remaining_Amount_CaptionLbl: Label 'Remg. Amt. in Billing Curr.';
        Cust__Ledger_Entry__Currency_Code_CaptionLbl: Label 'Billing Currency';
        Cust__Ledger_Entry__Remaining_Amt___LCY__CaptionLbl: Label 'Remg. Amount in INR';
        ATTORNEY_2CaptionLbl: Label 'ATTORNEY-2';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Case_IDCaptionLbl: Label 'Case ID';
        Amount_in_Billing_Curr_CaptionLbl: Label 'Amount in Billing Curr.';
        Amount_in_INRCaptionLbl: Label 'Amount in INR';
        Contact_PersonCaptionLbl: Label 'Contact Person';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Cust__Ledger_Entry__Due_Date_CaptionLbl: Label 'Label12';
        TotalCaptionLbl: Label 'Total';
        Closing_Balance_Grand_TotalCaptionLbl: Label 'Closing Balance Grand Total';
        Note__CaptionLbl: Label 'Note:-';
        Ledger_Note: Label ' ';
        ContactEmail: Text[100];
        ContactPhoneNumber: Text[20];
        ContactRec: Record Contact;
        DateFilter: Text[50];
        DateCapton: Text[30];
        GlobalContact: Text[50];
        GlobalStDate: Date;
        GlobalEnDate: Date;
        GlobalOpen: Boolean;
        GlobalCustomer: Code[20];
        Ledger_NoteBack: Label 'Negative figure shown under the column " Remaining Amount" indicates that the receipt of the payment has not been adjusted against any Memo of Fees (MOF) for lack of MOF particulars and client may please provide the same';
        RemAmtTot: Decimal;
        OWNER_1: Code[30];
        OWNER_2: Code[20];


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn('Company Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(Compinfo.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('User ID',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(STRSUBSTNO(Text001,FORMAT(EndDate)),FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn('Report',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('Customer Detailed Aging',FALSE,'',FALSE,FALSE,FALSE,'');
        //ExcelBuf.NewRow;
         */

    end;

    local procedure MakeExcelDataHeader()
    begin
    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('Customer Detalied Aging','',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure CLEH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Client Name',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Posting Date',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Document No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Branch Code',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Case Id',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner1',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Owner2',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('MOF',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Billing Currency',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Amount(Billling Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Original Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Remaining Amount(Billling Currency)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Remaining Amount(INR)',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Cheque No.',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('CONTACT PERSON',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure CH()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.",FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Opening Balance As On',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(StartDate,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(StartBalanceLCY1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(StartBalanceLCY,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure CB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Posting Date",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Document No.",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 1 Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Global Dimension 2 Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner1,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(Owner2,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(MOF,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(CurrCode,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry".Amount,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Original Amt. (LCY)",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amount",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Remaining Amt. (LCY)",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("Cust. Ledger Entry"."Cheque No.",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(ContactPerson,FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure CLB()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('Closing Balance As On',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(EndDate,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(EndingBal,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
         */

    end;


    procedure CLBF()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('TOTAL',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(GrandTotal1,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(GrandTotal,FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'');
         */

    end;


    procedure SetContact(LocalContact: Text[50]; StDate: Date; EnDate: Date; LocalOpen: Boolean; LocalCustomer: Code[20])
    begin
        GlobalContact := LocalContact;
        GlobalStDate := StDate;
        GlobalEnDate := EnDate;
        GlobalOpen := LocalOpen;
        GlobalCustomer := LocalCustomer;
    end;
}

