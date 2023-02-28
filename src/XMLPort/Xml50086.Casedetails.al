xmlport 50086 "Case details"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                XmlName = 'DimensionValue';
                SourceTableView = WHERE ("Dimension Code" = CONST ('CASE'));
                fieldelement(DimensionCode; "Dimension Value"."Dimension Code")
                {
                }
                fieldelement(Code; "Dimension Value".Code)
                {
                }
                fieldelement(Name; "Dimension Value".Name)
                {
                }
                fieldelement(CaseOfficeID; "Dimension Value"."Case-Office ID")
                {
                }
                fieldelement(CaseClientID; "Dimension Value"."Case-Client ID")
                {
                }
                fieldelement(CaseProcess; "Dimension Value"."Case-Process")
                {
                }
                fieldelement(CaseDocumentName; "Dimension Value"."Case-Document Name")
                {
                }
                fieldelement(CaseActivityType; "Dimension Value"."Case-Activity Type")
                {
                }
                fieldelement(CaseSolution; "Dimension Value"."Case-Solution")
                {
                }
                fieldelement(CaseBranch; "Dimension Value"."Case-Branch")
                {
                }
                fieldelement(CasePractice; "Dimension Value"."Case-Practice")
                {
                }
                fieldelement(CaseArea; "Dimension Value"."Case-Area")
                {
                }
                fieldelement(CaseRainMaker; "Dimension Value"."Case-Rain Maker")
                {
                }
                fieldelement(CaseRainGiver; "Dimension Value"."Case-Rain Giver")
                {
                }
                fieldelement(CaseForum; "Dimension Value"."Case-Forum")
                {
                }
                fieldelement(CaseSubForum; "Dimension Value"."Case-Sub Forum")
                {
                }
                fieldelement(CaseCreationDate; "Dimension Value"."Case-Creation Date")
                {
                }
                fieldelement(CaseReferanceType; "Dimension Value"."Case-Referance Type")
                {
                }
                fieldelement(CaseForumCity; "Dimension Value"."Case-Forum City")
                {
                }
                fieldelement(CaseTargetForum; "Dimension Value"."Case-Target Forum")
                {
                }
                fieldelement(CaseTargetSubForum; "Dimension Value"."Case-Target Sub Forum")
                {
                }
                fieldelement(CaseTargetForumCity; "Dimension Value"."Case-Target Forum City")
                {
                }
                fieldelement(CaseOwner1; "Dimension Value"."Case-Owner1")
                {
                }
                fieldelement(CaseOwner2; "Dimension Value"."Case-Owner2")
                {
                }
                fieldelement(RegionHead; "Dimension Value"."Region-Head")
                {
                }
                fieldelement(BranchHead; "Dimension Value"."Branch-Head")
                {
                }
                fieldelement(BranchRegionID; "Dimension Value"."Branch-Region ID")
                {
                }
                fieldelement(GroupHead; "Dimension Value"."Group-Head")
                {
                }
                fieldelement(GroupBranchID; "Dimension Value"."Group-Branch ID")
                {
                }
                fieldelement(GroupRegionID; "Dimension Value"."Group-Region ID")
                {
                }
                fieldelement(CaseReferanceNo; "Dimension Value"."Case-Referance No")
                {
                }
                fieldelement(LocationCode; "Dimension Value"."Location Code")
                {
                }
                fieldelement(Correspondence_Contact_ID; "Dimension Value".Correspondence_Contact_ID)
                {
                }
                fieldelement(Billing_Contact_ID; "Dimension Value".Billing_Contact_ID)
                {
                }
                fieldelement(Owner2Email; "Dimension Value".Owner_2Email)
                {
                }
                fieldelement(GroupHeadEmail; "Dimension Value"."Group_Head Email")
                {
                }
                fieldelement(Owner2EmailOut; "Dimension Value"."Owner_2Email_Outs.")
                {
                }
                fieldelement(SubOwner2; "Dimension Value"."Sub Group Owner 2")
                {
                }
            }
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
}

