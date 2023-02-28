report 50000 "Test Sales Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/TestSalesInvoice.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE("Document Type" = FILTER(<> Quote));
            RequestFilterFields = "Document Type", "No.";
            RequestFilterHeading = 'Sales Test Document';
            column(Sales_Header__Sales_Header___No__; "Sales Header"."No.")
            {
            }
            column(Sales_Header___Sell_to_Customer_Name______Sales_Header___Sell_to_Customer_Name_2_; "Sales Header"."Sell-to Customer Name" + '' + "Sales Header"."Sell-to Customer Name 2")
            {
            }
            column(FORMAT__Sales_Header___Posting_Date__0_4_; Format("Sales Header"."Posting Date", 0, 4))
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Address_; "Sales Header"."Ship-to Address")
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Address_2_; "Sales Header"."Ship-to Address 2")
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Contact_; "Sales Header"."Ship-to Contact")
            {
            }
            column(Sales_Header__District______Sales_Header___State_Name_; "Sales Header".District + ' ' + "Sales Header"."State Name")
            {
            }
            column(Sales_Header__Sales_Header___Shortcut_Dimension_1_Code_; "Sales Header"."Shortcut Dimension 1 Code")
            {
            }
            column(Sales_Header__Sales_Header___Shortcut_Dimension_2_Code_; "Sales Header"."Shortcut Dimension 2 Code")
            {
            }
            column(Post_Office_______Ship_to_City________Ship_to_Post_Code_; "Post Office" + ',' + "Ship-to City" + ', ' + "Ship-to Post Code")
            {
            }
            column(Sales_Header__Sales_Header__country; "Sales Header".country)
            {
            }
            column(STCategory; STCategory)
            {
            }
            column(MEMO_OF_FEESCaption; MEMO_OF_FEESCaptionLbl)
            {
            }
            column(Category_Of_Service__Caption; Category_Of_Service__CaptionLbl)
            {
            }
            column(Service_Tax_Code_Caption; Service_Tax_Code_CaptionLbl)
            {
            }
            column(Kind_Attn_Caption; Kind_Attn_CaptionLbl)
            {
            }
            column(Legal_Consultancy_ServiceCaption; Legal_Consultancy_ServiceCaptionLbl)
            {
            }
            column(RTB_No_Caption; RTB_No_CaptionLbl)
            {
            }
            column(BRANCH_CODE_Caption; BRANCH_CODE_CaptionLbl)
            {
            }
            column(CASE_ID_Caption; CASE_ID_CaptionLbl)
            {
            }
            column(Contact_Name; ContactName)
            {
            }
            column(Ship_Address; ShipAddress)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Header";
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(Sales_Line___Other_Detail_1_______Sales_Line___Other_Detail_2_; "Sales Line"."Other Detail 1" + ' ' + "Sales Line"."Other Detail 2")
                {
                }
                column(Sales_Line__Sales_Line___Line_Amount_; "Sales Line"."Line Amount")
                {
                }
                column(Sales_Line__Service_Tax_Amount_; 0)
                {
                }
                column(Sales_Line__Service_Tax_SHE_Cess_Amount_; 0)
                {
                }
                column(Sales_Line__Service_Tax_eCess_Amount_; 0)
                {
                }
                column(ROUND__Sales_Line___Amount_To_Customer__1_; 0)
                {
                }
                column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
                {
                }
                column(AMOUNTCaption; AMOUNTCaptionLbl)
                {
                }
                column(Sales_Line__Service_Tax_Amount_Caption; 'Service Tax Amount')
                {
                }
                column(Service_Tax_SHE_Cess_AmountCaption; Service_Tax_SHE_Cess_AmountCaptionLbl)
                {
                }
                column(Service_Tax_eCess_AmountCaption; Service_Tax_eCess_AmountCaptionLbl)
                {
                }
                column(TOTALCaption; TOTALCaptionLbl)
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Sales Line".SetRange("Sales Line"."Document No.", "Sales Line"."Document No.");
                    /*
                    SILine.RESET;
                    //SILine.SETFILTER(SILine."Document Type",'Order');
                    SILine.SETRANGE(SILine."Document No.","Sales Header"."No.");
                    IF SILine.FIND('-') THEN
                       STGroup := SILine."Service Tax Group";
                       MESSAGE(STGroup);
                       STCode.RESET;
                       STCode.SETRANGE(STCode.Code,STGroup);
                      IF STCode.FIND('-') THEN
                         STCategory := STCode.Description;
                         MESSAGE(STCategory);
                    */

                end;

                trigger OnPreDataItem()
                begin
                    //TBD
                    /*
                    CurrReport.CreateTotals("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount",
                    "Line Discount Amount", "Inv. Discount Amount", "Amount Including Excise",
                    "Amount Including Tax", "Excise Amount", "Tax Base Amount");
                    CurrReport.CreateTotals(LineAmt);
                    // NAVIN
                    CurrReport.CreateTotals("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount", "Excise Amount", "Tax Amount",
                      "Service Tax Amount", "Service Tax eCess Amount", "Amount To Customer");
                    CurrReport.CreateTotals("Service Tax SHE Cess Amount");
                    */
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //2021
                //IF "Sales Header"."Document Type" = "Sales Header"."Document Type"::"Credit Memo" THEN BEGIN
                RecContact.SetRange(RecContact."No.", "Sales Header"."Bill-to Contact No.");
                if RecContact.FindFirst then begin
                    ContactName := RecContact."F Name" + ' ' + RecContact."M Name" + ' ' + RecContact."L Name";
                    //END;
                end;
                RecShiptoAddress.SetRange(RecShiptoAddress."Customer No.", "Sales Header"."Bill-to Customer No.");
                RecShiptoAddress.SetRange(RecShiptoAddress.Code, "Sales Header"."Ship-to Code");
                if RecShiptoAddress.FindFirst then begin
                    ShipAddress := RecShiptoAddress."Client Address 1" + '' + RecShiptoAddress."Client Address 2" + ' ' +
                                   RecShiptoAddress.District + ' ' + RecShiptoAddress."Post Code" + ' ' + RecShiptoAddress."State Name" + ' ' + RecShiptoAddress."E-Mail";
                end;
                //2021
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Sales Line".Amount);
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
        /*
        SILine.RESET;
        SILine.SETFILTER(SILine."Document Type",'Order');
        SILine.SETRANGE(SILine."Document No.","Sales Header"."No.");
        IF SILine.FIND('-') THEN
           STGroup := SILine."Service Tax Group";
           MESSAGE(STGroup);
        */

    end;

    var
        CompanyInfo: Record "Company Information";
        LineAmt: Decimal;
        Inwords: Text[500];
        shiptoaddress: Record "Ship-to Address";
        Shipsddress1: Text[60];
        Shipsddress2: Text[60];
        STCategory: Text[100];
        SILine: Record "Sales Line";
        STGroup: Text[100];
        MEMO_OF_FEESCaptionLbl: Label 'MEMO OF FEES';
        Category_Of_Service__CaptionLbl: Label 'Category Of Service :';
        Service_Tax_Code_CaptionLbl: Label 'Service Tax Code:';
        Kind_Attn_CaptionLbl: Label 'Kind Attn:';
        Legal_Consultancy_ServiceCaptionLbl: Label 'Legal Consultancy Service';
        RTB_No_CaptionLbl: Label 'RTB No.';
        BRANCH_CODE_CaptionLbl: Label 'BRANCH CODE:';
        CASE_ID_CaptionLbl: Label 'CASE ID:';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        Service_Tax_SHE_Cess_AmountCaptionLbl: Label 'Service Tax SHE Cess Amount';
        Service_Tax_eCess_AmountCaptionLbl: Label 'Service Tax eCess Amount';
        TOTALCaptionLbl: Label 'TOTAL';
        "--2021--": Integer;
        RecContact: Record Contact;
        ContactName: Text[200];
        RecShiptoAddress: Record "Ship-to Address";
        ShiptoName: Text[100];
        ShipAddress: Text[1000];
        TxtCountry: Text[50];
        TxtDistrict: Text[50];
}

