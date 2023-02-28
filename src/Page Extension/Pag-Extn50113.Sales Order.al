pageextension 50113 pageextension50113 extends "Sales Order"
{
    layout
    {
        modify("Sell-to Customer Name")
        {
            Importance = Additional;
        }

        //Unsupported feature: Property Modification (ImplicitType) on ""Bill-to Name"(Control 18)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Bill-to Address"(Control 20)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Bill-to Address 2"(Control 22)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to Name"(Control 38)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to Address"(Control 40)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to Address 2"(Control 42)".

        addafter("Ship-to City")
        {
            field("Ship to State"; rec.ShipToStateName)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst("&Print")
        {
            action("Order Confirmation")
            {
                ApplicationArea = All;
                Caption = 'Order Confirmation';
                Ellipsis = true;
                Image = Print;

                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                begin
                    DocPrint.PrintSalesOrder(Rec, 0); //0--> Order Confirmation
                end;
            }
        }

        //TBD
        /*
        addafter("Print Confirmation")
        {
            action(Temp)
            {ApplicationArea = All;

                trigger OnAction()
                var
                    SCM: Record "Sales Cr.Memo Header";
                    CLE: Record "Cust. Ledger Entry";
                    SIH: Record "Sales Invoice Header";
                    DimSetEntry: Record "Dimension Set Entry";
                    DimSetEntryTem: Record "Dimension Set Entry" temporary;
                    DimMGT: Codeunit DimensionManagement;
                    DimValue: Record "Dimension Value";
                    SCH: Record "Sales Cr.Memo Header";
                    SearchDirectory: Text[50];
                    FileRec: Record File;
                begin
                    FileRec.Reset;
                    FileRec.SetRange(Path, 'C:\SalesInvoices_CreditNote\');
                    FileRec.SetFilter(Name, rec."No.");
                    FileRec.SetRange("Is a file", true);
                    if FileRec.FindFirst then
                        Message(Format(FileRec.Date));

                end;
            }
        }
        */
    }

    var
        Text000: Label 'Unable to execute this function while in view only mode.';

    procedure UpdateAllowed(): Boolean
    begin
        if CurrPage.Editable = false then
            Error(Text000);
        exit(true);
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;
}

