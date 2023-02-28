pageextension 50121 pageextension50121 extends "Edit Dimension Set Entries"
{
    layout
    {
        modify(DimensionValueCode)
        {
            trigger OnBeforeValidate()
            begin
                //8112
                //TEAM::1426//Code added for Dimension will print on Check
                GGNLINE.SetRange(GGNLINE."Dimension Set ID", rec."Dimension Set ID");
                if GGNLINE.Find('-') then begin
                    code := rec."Dimension Value ID";
                    DIMVAL.SetRange(DIMVAL."Dimension Value ID", code);
                    if DIMVAL.Find('+') then begin
                        GGNLINE.Description := DIMVAL.Name;
                        //  MESSAGE(GGNLINE.Description);
                        GGNLINE.Modify(true);
                        //8112
                    end
                end;
            end;
        }
        addfirst(Control1)
        {
            field("Dimension Set ID"; rec."Dimension Set ID")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
        addafter("Dimension Value Name")
        {
            field("Case-Document Name"; rec."Case-Document Name")
            {
                ApplicationArea = All;
            }
            field("Dimension Value ID"; rec."Dimension Value ID")
            {
                ApplicationArea = All;
            }
        }
        // //#122
        // modify(Description)
        // {
        //     Visible = false;
        // }

        // addafter(d)
        // {
        //     field("Description 3"; Rec."Description 3")
        //     {
        //         Caption = 'Description';
        //         ApplicationArea = all;
        //     }
        // }
        // //#122
    }
    actions
    {

        addfirst(creation)
        {
            action("Update Dimension")
            {
                ApplicationArea = All;
                Caption = 'Update Dimension';
                Image = ApplyEntries;
            }
        }
    }

    var
        GGNLINE: Record "Gen. Journal Line";
        DIMVAL: Record "Dimension Value";
        "code": Integer;
        GGNLINE1: Record "Gen. Journal Line";
        "--2021--": Integer;

}

