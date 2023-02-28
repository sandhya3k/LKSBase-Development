xmlport 50018 "Cr Memo Header 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\CRTBHeader_Lakshmi kumaran & Sridharan.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Sales Header"; "Sales Header")
            {
                AutoUpdate = true;
                XmlName = 'Sales_Header';
                textelement("<cdselltocust>")
                {
                    XmlName = 'cdSelltoCust.';
                }
                textelement("<cdshortkut>")
                {
                    XmlName = 'cdShortkut.';
                }
                fieldelement(No; "Sales Header"."No.")
                {
                }
                fieldelement(Applies_to_Doc_No; "Sales Header"."Applies-to Doc. No.")
                {
                }
                fieldelement(Bill_Description; "Sales Header"."Bill Description")
                {
                }
                fieldelement(Curr_Code; "Sales Header"."Currency Code")
                {
                }
                fieldelement(Inv_Type; "Sales Header".InvoiceType)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    Evaluate(VarcdSelltoCust, "<cdSelltoCust>");
                    Evaluate(VarcdShortkut, "<cdShortkut>");

                    SIH.Reset;
                    SIH.SetRange(SIH."No.", "Sales Header"."Applies-to Doc. No.");
                    if SIH.FindFirst then begin
                        SIH.Init;
                        "Sales Header"."Document Type" := "Sales Header"."Document Type"::"Credit Memo";
                        "Sales Header".Validate("Sales Header"."Sell-to Customer No.", VarcdSelltoCust);
                        "Sales Header"."Bill-to Customer No." := "Sales Header"."Sell-to Customer No.";
                        if not "Sales Header".Insert(true) then
                            "Sales Header".Modify;
                        "Sales Header"."Applies-to Doc. Type" := "Sales Header"."Applies-to Doc. Type"::Invoice;
                        "Sales Header"."Posting Date" := Today;
                        "Sales Header"."Document Date" := Today;
                        "Sales Header"."Due Date" := Today;
                        //   "Sales Header"."Sell-to Customer No.":= VarcdSelltoCust;
                        //   "Sales Header".VALIDATE("Sales Header"."Sell-to Customer No.","<cdSelltoCust>");
                        "Sales Header"."Shortcut Dimension 2 Code" := cdShortkut;
                        "Sales Header".Validate("Sales Header"."Shortcut Dimension 2 Code", VarcdShortkut);
                        //   "Sales Header"."Bill-to Customer No.":=SIH."Bill-to Customer No.";
                        "Sales Header"."Bill-to Name" := SIH."Bill-to Name";
                        "Sales Header"."Bill-to Name 2" := SIH."Bill-to Name 2";
                        "Sales Header"."Bill-to Address" := SIH."Ship-to Address";
                        "Sales Header"."Bill-to Address 2" := SIH."Ship-to Address 2";
                        "Sales Header"."Bill-to City" := SIH."Ship-to City";
                        "Sales Header"."Bill-to Post Code" := SIH."Ship-to Post Code";
                        "Sales Header"."State Name" := SIH."State Name";
                        "Sales Header"."Location Code" := SIH."Location Code";
                        "Sales Header"."Bill-to Contact" := SIH."Ship-to Contact";
                        // "Sales Header"."Bill Description":=SIH."Bill Description";
                        "Sales Header"."Ship-to Code" := SIH."Ship-to Code";
                        "Sales Header"."Ship-to Address" := SIH."Ship-to Address";
                        "Sales Header"."Ship-to Address 2" := SIH."Ship-to Address 2";
                        "Sales Header"."Ship-to City" := SIH."Ship-to City";
                        "Sales Header"."Ship-to Contact" := SIH."Ship-to Contact";
                        "Sales Header"."Ship-to Country/Region Code" := SIH."Ship-to Country/Region Code";
                        "Sales Header"."Ship-to County" := SIH."Ship-to County";
                        "Sales Header"."Ship-to Name" := SIH."Ship-to Name";
                        "Sales Header"."Ship-to Name 2" := SIH."Ship-to Name 2";
                        "Sales Header"."Ship-to Post Code" := SIH."Ship-to Post Code";
                        "Sales Header"."Document Type" := "Sales Header"."Document Type"::"Credit Memo";
                        //"Sales Header"."Posting No. Series" :='PCRTB';
                        "Sales Header".Modify;
                    end;

                    if "Sales Header"."Currency Code" = 'INR' then
                        "Sales Header"."Currency Code" := '';

                    REPORT.Run(50103);//team::1426
                end;

                trigger OnAfterModifyRecord()
                begin
                    /*
                    EVALUATE(VarcdSelltoCust,"<cdSelltoCust>");
                    EVALUATE(VarcdShortkut,"<cdShortkut>");
                    
                    SIH.RESET;
                    SIH.SETRANGE(SIH."No.","Sales Header"."Applies-to Doc. No.");
                    IF SIH.FINDFIRST THEN  BEGIN
                       SIH.INIT;
                       "Sales Header"."Document Type":="Sales Header"."Document Type"::"Credit Memo";
                       "Sales Header".VALIDATE("Sales Header"."Sell-to Customer No.",VarcdSelltoCust);
                       "Sales Header"."Bill-to Customer No.":="Sales Header"."Sell-to Customer No.";
                       IF NOT "Sales Header".INSERT(TRUE) THEN
                              "Sales Header".MODIFY;
                       "Sales Header"."Applies-to Doc. Type" := "Sales Header"."Applies-to Doc. Type"::Invoice;
                       "Sales Header"."Posting Date" :=TODAY;
                       "Sales Header"."Document Date" :=TODAY;
                       "Sales Header"."Due Date" :=TODAY;
                    //   "Sales Header"."Sell-to Customer No.":= VarcdSelltoCust;
                    //   "Sales Header".VALIDATE("Sales Header"."Sell-to Customer No.","<cdSelltoCust>");
                    //   "Sales Header"."Shortcut Dimension 2 Code" := cdShortkut;
                       "Sales Header".VALIDATE("Sales Header"."Shortcut Dimension 2 Code",VarcdShortkut);
                       "Sales Header"."Bill-to Customer No.":=SIH."Bill-to Customer No.";
                       "Sales Header"."Bill-to Name":=SIH."Bill-to Name";
                       "Sales Header"."Bill-to Name 2":=SIH."Bill-to Name 2";
                       "Sales Header"."Bill-to Address":=SIH."Ship-to Address";
                       "Sales Header"."Bill-to Address 2":=SIH."Ship-to Address 2";
                       "Sales Header"."Bill-to City":=SIH."Ship-to City";
                       "Sales Header"."Bill-to Post Code":=SIH."Ship-to Post Code";
                       "Sales Header"."State Name":=SIH."State Name";
                     //  "Sales Header"."Location Code":=SIH."Location Code";
                       "Sales Header"."Bill-to Contact":=SIH."Ship-to Contact";
                    // "Sales Header"."Bill Description":=SIH."Bill Description";
                       "Sales Header".Structure:=SIH.Structure;
                       "Sales Header".VALIDATE("Sales Header".Structure);
                       "Sales Header"."Document Type":="Sales Header"."Document Type"::"Credit Memo";
                       "Sales Header"."Posting No. Series" :='PCRTB';
                       "Sales Header".MODIFY;
                    END;
                    
                    IF "Sales Header"."Currency Code" = 'INR' THEN
                      "Sales Header"."Currency Code" := '';
                     */

                end;
            }
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

    var
        CLE: Record "Cust. Ledger Entry";
        CRTBNo: Code[10];
        cdSelltoCust: Code[10];
        cdShortkut: Code[10];
        R_SH: Record "Sales Header";
        R_SH1: Record "Sales Header";
        ApplyDocNo: Code[20];
        BillDisc: Text[100];
        CurryCode: Code[10];
        InvType: Option ,TAXABLE,"NON-TAXABLE",MIXED;
        SIH: Record "Sales Invoice Header";
        Structure: Code[10];
        VarcdSelltoCust: Code[10];
        VarcdShortkut: Code[10];
}

