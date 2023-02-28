report 50047 "Cancelled Credit Memo-XML"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE(Cancelled = FILTER(true), "Document Type" = FILTER("Credit Memo"));
            RequestFilterFields = "Posting Date";

            trigger OnAfterGetRecord()
            begin
                Counter1 := Counter1 + 1;
                Counter2 := Counter2 + 1;
                if Counter2 >= CounterBreak then begin
                    Counter2 := 0;
                    Window.Update(1, Round(Counter1 / CounterTotal * 10000, 1));
                end;


                VarRec.Reset;
                VarRec.SetRange(VarRec."No.", "Sales Header"."No.");
                //CustXmlFile.CREATE('C:\Data\'+"Sales Invoice Header"."Pre-Assigned No."+'.csv');
                //CustXmlFile.CREATE('D:\CancelledCRTB'+"Sales Header"."No."+'.csv');
                //TBD
                /*
                CustXmlFile.Create('C:\' + "Sales Header"."No." + '.csv');
                CustXmlFile.CreateOutStream(XmlStream);
                XMLPORT.Export(50084, XmlStream, VarRec);
                CustXmlFile.Close;
                */
            end;

            trigger OnPreDataItem()
            begin
                Window.Open(Text000);
                CounterTotal := Count;
                Counter1 := 0;
                Counter2 := 0;
                CounterBreak := Round(CounterTotal / 100, 1, '>');
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
        VarRec: Record "Sales Header";
        CustXmlFile: File;
        XmlStream: OutStream;
        Window: Dialog;
        Text000: Label '@1@@@@@';
        CounterTotal: Integer;
        Counter1: Integer;
        Counter2: Integer;
        CounterBreak: Integer;
}

