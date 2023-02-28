report 50004 "LKS Test Sales Invoice Report"
{
    ApplicationArea = All;
    Caption = 'LKS Test Sales Invoice Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './res/LKSTestSI.rdl';
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(No; "No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = SalesInvoiceHeader;
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
