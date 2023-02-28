codeunit 50008 "Static Unit"
{
    SingleInstance = true;
    procedure SetBool(BoolP: Boolean)
    begin
        BoolG := BoolP;
    end;

    procedure GetBool(): Boolean
    begin
        exit(BoolG);
    end;

    var
        BoolG: Boolean;
}