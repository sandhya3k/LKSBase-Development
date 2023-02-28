pageextension 50005 pageextension50005 extends "User Setup"
{
    layout
    {
        addafter("Service Resp. Ctr. Filter")
        {
            field("Uneditable Page"; rec."Uneditable Page")
            {
                ApplicationArea = All;
            }
            //Git#83_MAC_30012023++
            field(Location; Rec.Location)
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    LocRec: Record Location;
                begin
                    LocRec.Reset();
                    if Page.RunModal(Page::"Location List", LocRec) = Action::LookupOK then
                        Rec.Location := LocRec.Code;
                end;
            }
            //Git#83_MAC_30012023--
        }
    }
}

