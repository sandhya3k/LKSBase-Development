tableextension 50093 "LKSGenLedgerSetupExt" extends "General Ledger Setup"
{
    fields
    {
        field(50000; "Shortcut Dimension 9 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 9 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 9 Code", 9, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50001; "Shortcut Dimension 10 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 10 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 10 Code", 10, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50002; "Shortcut Dimension 11 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 11 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 11 Code", 11, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50003; "Shortcut Dimension 12 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 12 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 12 Code", 12, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50004; "Shortcut Dimension 13 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 13 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 13 Code", 13, '', '', 0) then
                    //2021  ERROR(Text023,Dim.GetCheckDimErr);
                    Modify;
            end;
        }
        field(50005; "Shortcut Dimension 14 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 14 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 14 Code", 14, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50006; "Shortcut Dimension 15 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 15 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 15 Code", 15, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50007; "Shortcut Dimension 16 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 16 Code';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                if Dim.CheckIfDimUsed("Shortcut Dimension 16 Code", 16, '', '', 0) then
                    Error(Text023, Dim.GetCheckDimErr);
                Modify;
            end;
        }
        field(50008; "Customer Aging Email User ID"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
    }

    var
        Dim: Record Dimension;
        Text023: Label '%1\You cannot use the same dimension twice in the same setup.';
        Text024: Label 'You cannot change the contents of the %1 field because the %2 is activated.';
}

