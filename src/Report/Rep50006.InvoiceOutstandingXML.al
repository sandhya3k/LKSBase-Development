report 50006 "Invoice Outstanding-XML"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
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
                VarRec.SetRange(VarRec."Pre-Assigned No.", "Sales Invoice Header"."Pre-Assigned No.");
                //CustXmlFile.CREATE('C:\Data\'+"Sales Invoice Header"."Pre-Assigned No."+'.csv');
                //TBD
                /*
                CustXmlFile.Create('C:\' + "Sales Invoice Header"."Pre-Assigned No." + '.csv');
                CustXmlFile.CreateOutStream(XmlStream);
                XMLPORT.Export(50081, XmlStream, VarRec);
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
        VarRec: Record "Sales Invoice Header";
        CustXmlFile: File;
        XmlStream: OutStream;
        Window: Dialog;
        Text000: Label '@1@@@@@';
        CounterTotal: Integer;
        Counter1: Integer;
        Counter2: Integer;
        CounterBreak: Integer;
}

