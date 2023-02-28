report 50197 "Customer Payment Track"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/CustomerPaymentTrack.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo_CustLedgerEntry; Customer."No.")
            {
            }
            column(OriginalAmount_CustLedgerEntry; OrgPayment)
            {
            }
            column(GroupHeade_CustLedgerEntry; GroupCode)
            {
            }
            column(Last_Year_Payment; LastPayment)
            {
            }
            column(Customer_Name; Customer.Name)
            {
            }
            column(Group_Name; GroupName)
            {
            }
            column(Comp_Name; CompInfo.Name)
            {
            }
            column(Comp_Pic; CompInfo.Picture)
            {
            }
            column(filters; filters)
            {
            }

            trigger OnAfterGetRecord()
            begin

                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue.Code, GroupHead);
                DimensionValue.SetFilter(DimensionValue."Dimension Code", '%1', 'GROUPHEAD');
                if DimensionValue.FindFirst then begin
                    //GroupCode := DimensionValue."Group-Head";
                    GroupName := DimensionValue.Name;
                end else
                    if not DimensionValue.FindFirst then
                        Error('GroupHead does not contain any value');

                OrgPayment := 0;
                LastPayment := 0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Payment);
                CustLedgerEntry.SetRange(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Group Heade", GroupHead);
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', PreFromDate, PreToDate);
                if CustLedgerEntry.FindSet then
                    repeat
                        CustLedgerEntry.CalcFields("Original Amount");
                        LastPayment += CustLedgerEntry."Original Amount";
                    until CustLedgerEntry.Next = 0;

                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Payment);
                CustLedgerEntry.SetRange(CustLedgerEntry."Customer No.", "No.");
                CustLedgerEntry.SetFilter(CustLedgerEntry."Group Heade", GroupCode);
                CustLedgerEntry.SetFilter(CustLedgerEntry."Posting Date", '%1..%2', FromDate, ToDate);
                if CustLedgerEntry.FindSet then
                    repeat
                        CustLedgerEntry.CalcFields("Original Amount");
                        OrgPayment += CustLedgerEntry."Original Amount";
                    until CustLedgerEntry.Next = 0;

                if (OrgPayment = 0) and (LastPayment = 0) then
                    CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("Date Filter", FromDate, ToDate);

                if FromDate <> 0D then
                    PreFromDate := CalcDate('<-1Y>', FromDate);

                if ToDate <> 0D then
                    PreToDate := CalcDate('<-1Y>', ToDate);
                //MESSAGE('%1',PreFromDate);
                filters := Customer.GetFilters;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field("From Date"; FromDate)
                    {
                        ApplicationArea = All;
                    }
                    field("To Date"; ToDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Group Head"; GroupHead)
                    {
                        ApplicationArea = All;
                        Caption = 'Group Head';
                        TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('OWNER2'));
                    }
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

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;

    var
        FromDate: Date;
        ToDate: Date;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        OrgPayment: Decimal;
        PreFromDate: Date;
        PreToDate: Date;
        filters: Text[200];
        CustName: Text[250];
        GroupName: Text[100];
        CompInfo: Record "Company Information";
        GroupHead: Code[20];
        GroupCode: Code[20];
        DimensionValue: Record "Dimension Value";
        LastPayment: Decimal;
}

