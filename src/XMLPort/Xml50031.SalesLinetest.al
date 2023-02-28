xmlport 50031 "Sales Line test"
{
    Format = VariableText;

    schema
    {
        textelement(SaleLineText)
        {
            tableelement("Sales Line"; "Sales Line")
            {
                AutoUpdate = true;
                XmlName = 'Sales_Line';
                fieldelement(CdDoc; "Sales Line"."Document No.")
                {
                }

                trigger OnBeforeModifyRecord()
                begin
                    LineNo := 0;
                    SalesHead.Reset;
                    SalesHead.SetRange(SalesHead."No.", "Sales Line"."Document No.");
                    if SalesHead.FindFirst then begin

                        SalesLine.Reset;
                        SalesLine.SetRange(SalesLine."Document No.", SalesHead."No.");
                        if SalesLine.Find('+') then
                            LineNo := SalesLine."Line No.";
                    end;

                    Clear(SalesLine);
                    SalesLine.Init;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine."Document No." := SalesHead."No.";
                    SalesLine."Line No." := LineNo + 1000;
                    SalesLine.Insert;
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
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
}

