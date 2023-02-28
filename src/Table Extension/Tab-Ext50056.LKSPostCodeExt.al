tableextension 50056 "LKSPostCodeExt" extends "Post Code"
{
    procedure ClearFields(var City: Text[30]; var PostCode: Code[20]; var County: Text[30])
    begin
        City := '';
        PostCode := '';
        County := '';
    end;
}

