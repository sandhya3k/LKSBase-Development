codeunit 50000 test
{

    trigger OnRun()
    begin
        CheckAmountText := Format(135000, 0, 0) +
                    // COPYSTR(FORMAT(0.01),2,1) ;
                    PadStr('', StrLen(Format(0.01)) - 2, '0');
        /*
                              CheckAmountText := FORMAT(5190,0,0) +
                    PADSTR('',STRLEN(FORMAT(0.01))-STRLEN(FORMAT(0.0)),'0');
                    */
        //CheckAmountText := FORMAT(5190.0,0,0);
        Message(CheckAmountText);

    end;

    var
        CheckAmountText: Text[30];
}

