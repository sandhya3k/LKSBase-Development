tableextension 50054 "LKSShipToAddressExt" extends "Ship-to Address"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on ""Shipment Method Code"(Field 30)".


        //Unsupported feature: Property Modification (Data type) on ""Shipping Agent Code"(Field 31)".


        //Unsupported feature: Property Modification (Data type) on ""Country/Region Code"(Field 35)".

        field(50000; "Office Type"; Text[100])
        {
        }
        field(50001; "Client Address 1"; Text[100])
        {

            trigger OnValidate()
            begin
                if StrLen("Client Address 1") > 50 then
                    Address := CopyStr("Client Address 1", 1, 50)
                else
                    Address := "Client Address 1";
            end;
        }
        field(50002; "Client Address 2"; Text[100])
        {

            trigger OnValidate()
            begin
                if StrLen("Client Address 2") > 50 then
                    "Address 2" := CopyStr("Client Address 2", 1, 50)
                else
                    "Address 2" := "Client Address 2";
            end;
        }
        field(50003; "Post Office"; Text[100])
        {

            trigger OnValidate()
            var
                CharToCheck: Text;
                i: Integer;
            begin
                if UpperCase(Country) = 'INDIA' then begin
                    if StrLen("Post Office") <> 6 then
                        Error(PostOfficeLenErr);
                    i := 1;
                    while i <= 6 do begin
                        CharToCheck := CopyStr("Post Office", i, 1);
                        if not (CharToCheck in ['0' .. '9']) then
                            Error(PostOfficeDataErr);
                        i += 1;
                    end;
                end
            end;
        }
        field(50004; "City Town"; Text[100])
        {
        }
        field(50005; District; Text[100])
        {
        }
        field(50006; "State Name"; Text[100])
        {
        }
        field(50007; Country; Text[100])
        {
        }
        field(50008; ISD; Text[20])
        {
        }
        field(50009; STD; Text[20])
        {
        }
        field(50010; "GST Reg No."; Code[16])
        {
            Description = 'Team::7814';

            trigger OnValidate()
            var
                CharToCheck: Text;
                i: Integer;
            begin
                Clear(CharToCheck);
                if ((StrLen("GST Reg No.") <> 15) and (not (UpperCase("GST Reg No.") = 'UNREGISTERED'))) then
                    Error(GSTLenError);

                i := 1;
                while i <= StrLen("GST Reg No.") do begin
                    CharToCheck := CopyStr("GST Reg No.", i, 1);
                    if not ((CharToCheck in ['0' .. '9']) or (CharToCheck in ['A' .. 'Z'])) then
                        Error(GSTRegDataErr);
                    i += 1;
                end;
            end;
        }
        field(50011; "Transaction Type"; Option)
        {
            Description = 'E-Invoicing';
            OptionCaption = ' ,B2B,SEZWP,SEZWOP,EXPWP,EXPWOP,DEXP,B2C';
            OptionMembers = " ",B2B,SEZWP,SEZWOP,EXPWP,EXPWOP,DEXP,B2C;
        }
    }

    var
        GSTLenError: Label 'The length of GSTIN must be 15. ';
        PostOfficeLenErr: Label 'The length of Postal code must be of 6.';
        PostOfficeDataErr: Label 'The postal code must be only in numbers only.';
        GSTRegDataErr: Label 'The GST Registration must be only in alphanumeric only.';
}

