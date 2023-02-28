report 50198 "Collection - Top 10 List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CollectionTop10List.rdlc';
    Caption = 'Customer - Top 10 List';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Customer Posting Group", "Currency Code", "Date Filter";

            trigger OnAfterGetRecord()
            begin
                Window.Update(1, "No.");

                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue.Code, GroupHead);
                DimensionValue.SetFilter(DimensionValue."Dimension Code", '%1', 'GROUPHEAD');
                if DimensionValue.FindFirst then begin
                    GroupCode := DimensionValue.Name;
                end else
                    if not DimensionValue.FindFirst then
                        Error('GroupHead does not contain this value');

                PrevAmount := 0;
                CLE.Reset;
                CLE.SetRange("Document Type", CLE."Document Type"::Payment);
                CLE.SetRange(CLE."Customer No.", "No.");
                CLE.SetFilter(CLE."Group Heade", '%1', GroupHead);
                CLE.SetFilter(CLE."Posting Date", '%1..%2', PreStartDate, PreEndDate);
                if CLE.FindSet then begin
                    repeat
                        CLE.CalcFields("Original Amount");
                        PrevAmount += CLE."Original Amount";
                    until CLE.Next = 0;
                end;
                //MESSAGE('%1',PrevAmount);

                CurrAmount := 0;
                CLE.Reset;
                CLE.SetRange("Document Type", CLE."Document Type"::Payment);
                CLE.SetRange(CLE."Customer No.", "No.");
                CLE.SetFilter(CLE."Group Heade", '%1', GroupHead);
                CLE.SetRange(CLE."Posting Date", GetRangeMin("Date Filter"), GetRangeMax("Date Filter"));
                if CLE.FindSet then begin
                    repeat
                        CLE.CalcFields("Original Amount");
                        CurrAmount += CLE."Original Amount";
                    until CLE.Next = 0;
                end;
                //MESSAGE('%1Curr',CurrAmount);

                CalcFields("Sales (LCY)", "Balance (LCY)");
                //IF (("Sales (LCY)" = 0) AND ("Balance (LCY)" = 0)) THEN
                if ((PrevAmount = 0) and (CurrAmount = 0)) or (CurrAmount = 0)
                  then
                    CurrReport.Skip;
                CustAmount.Init;
                CustAmount."Customer No." := "No.";
                if ShowType = ShowType::"Collection (LCY)" then begin
                    CustAmount."Amount (LCY)" := -CurrAmount;
                    CustAmount."Amount 2 (LCY)" := -PrevAmount;
                end else begin
                    if ShowType = ShowType::"Sales (LCY)" then begin
                        CustAmount."Amount (LCY)" := -"Sales (LCY)";
                        CustAmount."Amount 2 (LCY)" := -"Balance (LCY)";
                    end else begin
                        CustAmount."Amount (LCY)" := -"Balance (LCY)";
                        CustAmount."Amount 2 (LCY)" := -"Sales (LCY)";
                    end;
                end;

                CustAmount.Insert;
                if (NoOfRecordsToPrint = 0) or (i < NoOfRecordsToPrint) then
                    i := i + 1
                else begin
                    CustAmount.Find('+');
                    CustAmount.Delete;
                end;

                if ShowType = ShowType::"Collection (LCY)" then begin
                    TotalSales += CurrAmount;
                    TotalBalance += PrevAmount;
                end;

                if ShowType <> ShowType::"Collection (LCY)" then begin
                    TotalSales += "Sales (LCY)";
                    TotalBalance += "Balance (LCY)";
                end;

                ChartTypeNo := ChartType;
                ShowTypeNo := ShowType;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open(Text000);
                i := 0;
                CustAmount.DeleteAll;
                CurrReport.CreateTotals("Sales (LCY)", "Balance (LCY)");

                if GetRangeMin("Date Filter") <> 0D then
                    PreStartDate := CalcDate('<-1Y>', GetRangeMin("Date Filter"));

                if GetRangeMax("Date Filter") <> 0D then
                    PreEndDate := CalcDate('<-1Y>', GetRangeMax("Date Filter"));
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(PrevAmount; PrevAmount)
            {
            }
            column(CurrAmount; CurrAmount)
            {
            }
            column(SortingCustomersCustDateFilter; StrSubstNo(Text001, CustDateFilter))
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(RankedAccordingShowType; StrSubstNo(Text002, SelectStr(ShowType + 1, Text004)))
            {
            }
            column(ShowTypeNo; ShowTypeNo)
            {
            }
            column(ChartTypeNo; ChartTypeNo)
            {
            }
            column(CustFilter_Customer; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(No_Customer; Customer."No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Customer.Name)
            {
                IncludeCaption = true;
            }
            column(SalesLCY_Customer; Customer."Sales (LCY)")
            {
                IncludeCaption = true;
            }
            column(BalanceLCY_Customer; Customer."Balance (LCY)")
            {
                IncludeCaption = true;
            }
            column(TotalSales; TotalSales)
            {
            }
            column(TotalBalance; TotalBalance)
            {
            }
            column(CustomerTop10ListCaption; CustomerTop10ListCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(TotalSalesCaption; TotalSalesCaptionLbl)
            {
            }
            column(PercentofTotalSalesCaption; PercentofTotalSalesCaptionLbl)
            {
            }
            column(ShowType; ShowType)
            {
            }
            column(Head_Name; GroupCode)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then begin
                    if not CustAmount.Find('-') then
                        CurrReport.Break;
                end else
                    if CustAmount.Next = 0 then
                        CurrReport.Break;
                CustAmount."Amount (LCY)" := -CustAmount."Amount (LCY)";
                Customer.Get(CustAmount."Customer No.");
                Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
                if MaxAmount = 0 then
                    MaxAmount := CustAmount."Amount (LCY)";
                if (MaxAmount > 0) and (CustAmount."Amount (LCY)" > 0) then
                    BarText := PadStr('', Round(CustAmount."Amount (LCY)" / MaxAmount * 45, 1), '*')
                else
                    BarText := '';
                CustAmount."Amount (LCY)" := -CustAmount."Amount (LCY)";

                CurrAmount := CustAmount."Amount (LCY)";
                PrevAmount := CustAmount."Amount 2 (LCY)";
            end;

            trigger OnPreDataItem()
            begin

                if ShowType = ShowType::"Collection (LCY)" then begin
                    CustSalesLCY := CurrAmount;
                    CustBalanceLCY := PrevAmount;
                end else

                    if ShowType <> ShowType::"Collection (LCY)" then begin
                        CustSalesLCY := Customer."Sales (LCY)";
                        CustBalanceLCY := Customer."Balance (LCY)";
                    end;

                Window.Close;
                CurrReport.CreateTotals(Customer."Sales (LCY)", Customer."Balance (LCY)", PrevAmount, CurrAmount);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Show; ShowType)
                    {
                        ApplicationArea = All;
                        Caption = 'Show';
                        OptionCaption = 'Sales (LCY),Balance (LCY),Collection (LCY)';
                    }
                    field(ChartType; ChartType)
                    {
                        ApplicationArea = All;
                        Caption = 'Chart Type';
                        OptionCaption = 'Bar chart,Pie chart';
                        Visible = ChartTypeVisible;
                    }
                    field("Group Head"; GroupHead)
                    {
                        ApplicationArea = All;
                        Caption = 'Group Head';
                        TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('GROUPHEAD'));
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            ChartTypeVisible := true;
        end;

        trigger OnOpenPage()
        begin
            // IF NoOfRecordsToPrint = 0 THEN
            //  NoOfRecordsToPrint := 10;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CustFilter := Customer.GetFilters;
        //CustDateFilter := Customer.GETFILTER("Date Filter");
    end;

    var
        Text000: Label 'Sorting customers    #1##########';
        Text001: Label 'Period: %1';
        Text002: Label 'Ranked according to %1';
        Window: Dialog;
        CustAmount: Record "Customer Amount" temporary;
        CustFilter: Text;
        CustDateFilter: Text[30];
        ShowType: Option "Sales (LCY)","Balance (LCY)","Collection (LCY)";
        NoOfRecordsToPrint: Integer;
        CustSalesLCY: Decimal;
        CustBalanceLCY: Decimal;
        MaxAmount: Decimal;
        BarText: Text[50];
        i: Integer;
        TotalSales: Decimal;
        Text004: Label 'Sales (LCY),Balance (LCY),Collection (LCY)';
        TotalBalance: Decimal;
        ChartType: Option "Bar chart","Pie chart";
        ChartTypeNo: Integer;
        ShowTypeNo: Integer;
        [InDataSet]
        ChartTypeVisible: Boolean;
        CustomerTop10ListCaptionLbl: Label 'Customer - Top 10 List';
        CurrReportPageNoCaptionLbl: Label 'Page';
        TotalCaptionLbl: Label 'Total';
        TotalSalesCaptionLbl: Label 'Total Sales';
        PercentofTotalSalesCaptionLbl: Label '% of Total Sales';
        PrevAmount: Decimal;
        CLE: Record "Cust. Ledger Entry";
        PreStartDate: Date;
        PreEndDate: Date;
        CurrAmount: Decimal;
        GroupHead: Code[20];
        DimensionValue: Record "Dimension Value";
        GroupCode: Code[40];


    procedure InitializeRequest(SetChartType: Option; SetShowType: Option; NoOfRecords: Integer)
    begin
        ChartType := SetChartType;
        ShowType := SetShowType;
        NoOfRecordsToPrint := NoOfRecords;
    end;
}

