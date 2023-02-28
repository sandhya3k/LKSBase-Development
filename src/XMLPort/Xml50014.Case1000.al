xmlport 50014 "Case 1000"
{
    Direction = Import;
    FieldSeparator = '~';
    FileName = 'C:\1000\Case.Csv';
    Format = VariableText;
    Permissions = TableData "Dimension Value" = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'DimValue';
                fieldelement(Code; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'CASE';
                        "Dimension Value".Name := "Dimension Value".Code;
                        "Dimension Value"."Global Dimension No." := 2;
                        "Dimension Value".Validate("Dimension Value"."Global Dimension No.", 2);
                    end;
                }
                fieldelement(CaseOfficeID; "Dimension Value"."Case-Office ID")
                {
                }
                fieldelement(CaseClientID; "Dimension Value"."Case-Client ID")
                {
                }
                fieldelement(CaseProcess; "Dimension Value"."Case-Process")
                {

                    trigger OnBeforePassField()
                    begin
                        "Dimension Value".Validate("Dimension Value".Code);
                    end;
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
                fieldelement(CaseReferanceNo; "Dimension Value"."Case-Referance No")
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
                fieldelement(CorrespondenceContactID; "Dimension Value".Correspondence_Contact_ID)
                {
                }
                fieldelement(BillingContactID; "Dimension Value".Billing_Contact_ID)
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    /*
                    "Dimension Value"."Dimension Code" := 'CASE';
                    "Dimension Value".Name := "Dimension Value".Code;
                    "Dimension Value"."Global Dimension No." :=2;
                    "Dimension Value".VALIDATE ("Dimension Value"."Global Dimension No.",2);
                    */

                end;

                trigger OnBeforeModifyRecord()
                begin
                    /*
                    "Dimension Value"."Dimension Code" := 'CASE';
                    "Dimension Value".Name := "Dimension Value".Code;
                    "Dimension Value"."Global Dimension No." :=2;
                    "Dimension Value".VALIDATE ("Dimension Value"."Global Dimension No.",2);
                    */

                end;
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

