page 50081 "Collection Detail List-2"
{
    CardPageID = "Cancelled RTB";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Collection Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = All;
                }
                field(Division; rec.Division)
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                }
                field("Client Bank ID"; Rec."Client Bank ID")
                {
                    ApplicationArea = All;
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Error('You cannot delete the records');
    end;
}

