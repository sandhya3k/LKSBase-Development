tableextension 50059 "LKSItemExt" extends Item
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Sub. Comp. Location"(Field 16361)".


        //Unsupported feature: Code Modification on ""Price/Profit Calculation"(Field 19).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        case "Price/Profit Calculation" of
          "Price/Profit Calculation"::"Profit=Price-Cost":
            if "Unit Price" <> 0 then
        #4..19
                  GLSetup."Unit-Amount Rounding Precision");
            end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //8112
        if "Price Includes VAT" and
           ("Price/Profit Calculation" < "Price/Profit Calculation"::"No Relationship")
        then begin
          VATPostingSetup.Get("VAT Bus. Posting Gr. (Price)","VAT Prod. Posting Group");
          case VATPostingSetup."VAT Calculation Type" of
            VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT":
              VATPostingSetup."VAT %" := 0;
            VATPostingSetup."VAT Calculation Type"::"Sales Tax":
              Error(
                Text006,
                VATPostingSetup.FieldCaption("VAT Calculation Type"),
                VATPostingSetup."VAT Calculation Type");
          end;
        end else
          Clear(VATPostingSetup);
        //8112
        #1..22
        */
        //end;
        modify("Price/Profit Calculation")
        {
            trigger OnBeforeValidate()
            var
                VATPostingSetup: Record "VAT Posting Setup";
                Text006: Label 'Prices including VAT cannot be calculated when %1 is %2.';
            begin
                //8112
                IF "Price Includes VAT" AND
                   ("Price/Profit Calculation" < "Price/Profit Calculation"::"No Relationship")
                THEN BEGIN
                    VATPostingSetup.GET("VAT Bus. Posting Gr. (Price)", "VAT Prod. Posting Group");
                    CASE VATPostingSetup."VAT Calculation Type" OF
                        VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT":
                            VATPostingSetup."VAT %" := 0;
                        VATPostingSetup."VAT Calculation Type"::"Sales Tax":
                            ERROR(
                              Text006,
                              VATPostingSetup.FIELDCAPTION("VAT Calculation Type"),
                              VATPostingSetup."VAT Calculation Type");
                    END;
                END ELSE
                    CLEAR(VATPostingSetup);
                //8112
            end;
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: StdCostWksh)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckJournalsAndWorksheets(0);
    CheckDocuments(0);

    MoveEntries.MoveItemEntries(Rec);

    ServiceItem.Reset;
    ServiceItem.SetRange("Item No.","No.");
    if ServiceItem.Find('-') then
      repeat
        ServiceItem.Validate("Item No.",'');
        ServiceItem.Modify(true);
      until ServiceItem.Next = 0;

    ItemBudgetEntry.SetCurrentKey("Analysis Area","Budget Name","Item No.");
    ItemBudgetEntry.SetRange("Item No.","No.");
    #16..112
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Item,"No.");
      SocialListeningSearchTopic.DeleteAll;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //8112
    BOMComp.Reset;
                  BOMComp.SetCurrentKey(Type,"No.");
                  BOMComp.SetRange(Type,BOMComp.Type::Item);
                  BOMComp.SetRange("No.","No.");

    if not BOMComp.IsEmpty then
                     Error(Text023,TableCaption,"No.",BOMComp.TableCaption);

                   ItemJnlLine.SetRange("Item No.","No.");
                   if not ItemJnlLine.IsEmpty then
                     Error(Text023,TableCaption,"No.",ItemJnlLine.TableCaption);

                   StdCostWksh.Reset;
                   StdCostWksh.SetRange(Type,StdCostWksh.Type::Item);
                   StdCostWksh.SetRange("No.","No.");
                   if not StdCostWksh.IsEmpty then
                     Error(Text023,TableCaption,"No.",StdCostWksh.TableCaption);

                   RequisitionLine.SetCurrentKey(Type,"No.");
                   RequisitionLine.SetRange(Type,RequisitionLine.Type::Item);
                   RequisitionLine.SetRange("No.","No.");
                   if not RequisitionLine.IsEmpty then
                     Error(Text023,TableCaption,"No.",RequisitionLine.TableCaption);

                   PurchOrderLine.SetCurrentKey(Type,"No.");
                   PurchOrderLine.SetRange(Type,PurchOrderLine.Type::Item);
                   PurchOrderLine.SetRange("No.","No.");
                   if not PurchOrderLine.IsEmpty then
                     Error(Text000,TableCaption,"No.",PurchOrderLine."Document Type");

                   SalesOrderLine.SetCurrentKey(Type,"No.");
                   SalesOrderLine.SetRange(Type,SalesOrderLine.Type::Item);
                   SalesOrderLine.SetRange("No.","No.");
                   if not SalesOrderLine.IsEmpty then
                     Error(Text001,TableCaption,"No.",SalesOrderLine."Document Type");

                   if ProdOrderExist then
                     Error(Text002,TableCaption,"No.");

                   ProdOrderComp.SetCurrentKey(Status,"Item No.");
                   ProdOrderComp.SetFilter(Status,'..%1',ProdOrderComp.Status::Released);
                   ProdOrderComp.SetRange("Item No.","No.");
                   if not ProdOrderComp.IsEmpty then
                     Error(Text014,TableCaption,"No.");

                   TransLine.SetCurrentKey("Item No.");
                   TransLine.SetRange("Item No.","No.");
                   if not TransLine.IsEmpty then
                     Error(Text016,TableCaption,"No.");

                   ServInvLine.Reset;
                   ServInvLine.SetCurrentKey(Type,"No.");
                   ServInvLine.SetRange(Type,ServInvLine.Type::Item);
                   ServInvLine.SetRange("No.","No.");
                   if not ServInvLine.IsEmpty then
                     Error(Text017,TableCaption,"No.",ServInvLine."Document Type");

                   ProdBOMLine.Reset;
                   ProdBOMLine.SetCurrentKey(Type,"No.");
                   ProdBOMLine.SetRange(Type,ProdBOMLine.Type::Item);
                   ProdBOMLine.SetRange("No.","No.");
                   if ProdBOMLine.Find('-') then
                     repeat
                       if ProdBOMHeader.Get(ProdBOMLine."Production BOM No.") and
                          (ProdBOMHeader.Status = ProdBOMHeader.Status::Certified)
                       then
                         Error(Text004,TableCaption,"No.");
                     until ProdBOMLine.Next = 0;

                   ServiceContractLine.Reset;
                   ServiceContractLine.SetRange("Item No.","No.");
                   if not ServiceContractLine.IsEmpty then
                     Error(Text023,TableCaption,"No.",ServiceContractLine.TableCaption);

    //8112
    #6..12
    //8112
    AssemblyHeader.SetCurrentKey("Document Type","Item No.");
                   AssemblyHeader.SetRange("Item No.","No.");
                   if not AssemblyHeader.IsEmpty then
                     Error(Text023,TableCaption,"No.",AssemblyHeader.TableCaption);
    #13..115
    */
    //end;

    procedure PlanningTransferShptQty() "Sum": Decimal
    var
        ReqLine: Record "Requisition Line";
    begin
        ReqLine.SetCurrentKey(Type, "No.", "Variant Code", "Transfer-from Code", "Transfer Shipment Date");
        ReqLine.SetRange("Replenishment System", ReqLine."Replenishment System"::Transfer);
        ReqLine.SetRange(Type, ReqLine.Type::Item);
        ReqLine.SetRange("No.", "No.");
        CopyFilter("Variant Filter", ReqLine."Variant Code");
        CopyFilter("Location Filter", ReqLine."Transfer-from Code");
        CopyFilter("Date Filter", ReqLine."Transfer Shipment Date");
        if ReqLine.IsEmpty then
            exit;

        if ReqLine.FindSet then
            repeat
                Sum += ReqLine."Quantity (Base)";
            until ReqLine.Next = 0;
    end;

    procedure PlanningReleaseQty() "Sum": Decimal
    var
        ReqLine: Record "Requisition Line";
    begin
        ReqLine.SetCurrentKey(Type, "No.", "Variant Code", "Location Code");
        ReqLine.SetRange(Type, ReqLine.Type::Item);
        ReqLine.SetRange("No.", "No.");
        CopyFilter("Variant Filter", ReqLine."Variant Code");
        CopyFilter("Location Filter", ReqLine."Location Code");
        CopyFilter("Date Filter", ReqLine."Starting Date");
        CopyFilter("Global Dimension 1 Filter", ReqLine."Shortcut Dimension 1 Code");
        CopyFilter("Global Dimension 2 Filter", ReqLine."Shortcut Dimension 2 Code");
        if ReqLine.IsEmpty then
            exit;

        if ReqLine.FindSet then
            repeat
                Sum += ReqLine."Quantity (Base)";
            until ReqLine.Next = 0;
    end;

    var
        StdCostWksh: Record "Standard Cost Worksheet";
        AssemblyHeader: Record "Assembly Header";

    var
        PurchOrderLine: Record "Purchase Line";
        SalesOrderLine: Record "Sales Line";
}

