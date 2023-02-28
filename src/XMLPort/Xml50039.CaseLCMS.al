xmlport 50039 Case_LCMS
{
    Direction = Import;
    //TBD //FieldSeparator = '~';
    Format = Xml;
    Permissions = TableData "Dimension Value" = rimd;

    schema
    {
        textelement(ArrayOfCase)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                AutoUpdate = true;
                XmlName = 'Case';
                fieldelement(case_id; "Dimension Value".Code)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Dimension Value"."Dimension Code" := 'CASE';
                        "Dimension Value".Name := "Dimension Value".Code;
                        "Dimension Value"."Global Dimension No." := 2;
                        "Dimension Value".Validate("Dimension Value"."Global Dimension No.", 2);
                    end;
                }
                fieldelement(office_id; "Dimension Value"."Case-Office ID")
                {
                }
                fieldelement(client_id; "Dimension Value"."Case-Client ID")
                {
                }
                fieldelement(matter_type; "Dimension Value"."Case-Process")
                {

                    trigger OnBeforePassField()
                    begin
                        "Dimension Value".Validate("Dimension Value".Code);
                    end;
                }
                fieldelement(Case_Document_Name; "Dimension Value"."Case-Document Name")
                {
                }
                fieldelement(case_activity_type; "Dimension Value"."Case-Activity Type")
                {
                }
                fieldelement(matter_sub_type; "Dimension Value"."Case-Solution")
                {
                }
                fieldelement(case_branch; "Dimension Value"."Case-Branch")
                {
                }
                fieldelement(category; "Dimension Value"."Case-Practice")
                {
                }
                fieldelement(sub_category; "Dimension Value"."Case-Area")
                {
                }
                fieldelement(case_rain_maker; "Dimension Value"."Case-Rain Maker")
                {
                }
                fieldelement(case_rain_giver; "Dimension Value"."Case-Rain Giver")
                {
                }
                fieldelement(case_forum; "Dimension Value"."Case-Forum")
                {
                }
                fieldelement(case_subforum; "Dimension Value"."Case-Sub Forum")
                {
                }
                textelement(case_creation_date)
                {

                    trigger OnAfterAssignVariable()
                    begin
                        if case_creation_date <> '' then begin
                            Evaluate(Year, CopyStr(case_creation_date, 1, 4));
                            Evaluate(Month, CopyStr(case_creation_date, 6, 2));
                            Evaluate(Day, CopyStr(case_creation_date, 9, 2));
                            "Dimension Value"."Case-Creation Date" := DMY2Date(Day, Month, Year);
                        end;
                    end;
                }
                fieldelement(Case_Referance_Type; "Dimension Value"."Case-Referance Type")
                {
                }
                fieldelement(case_number; "Dimension Value"."Case-Referance No")
                {
                }
                fieldelement(case_forum_city; "Dimension Value"."Case-Forum City")
                {
                }
                fieldelement(case_target_forum; "Dimension Value"."Case-Target Forum")
                {
                }
                fieldelement(case_target_subforum; "Dimension Value"."Case-Target Sub Forum")
                {
                }
                fieldelement(case_target_forum_city; "Dimension Value"."Case-Target Forum City")
                {
                }
                fieldelement(case_manager; "Dimension Value"."Case-Owner1")
                {
                }
                fieldelement(case_partner; "Dimension Value"."Case-Owner2")
                {
                }
                fieldelement(correspondance_contact_id; "Dimension Value".Correspondence_Contact_ID)
                {
                }
                fieldelement(billing_contact_id; "Dimension Value".Billing_Contact_ID)
                {
                }
                fieldelement(group_code; "Dimension Value"."Group-Head")
                {
                }
                fieldelement(practice_code; "Dimension Value"."Practice-Head")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    "Dimension Value"."Dimension Code" := 'CASE';
                    "Dimension Value".Name := "Dimension Value".Code;
                    "Dimension Value"."Global Dimension No." := 2;
                    "Dimension Value".Validate("Dimension Value"."Global Dimension No.", 2);
                end;

                trigger OnBeforeModifyRecord()
                begin
                    "Dimension Value"."Dimension Code" := 'CASE';
                    "Dimension Value".Name := "Dimension Value".Code;
                    "Dimension Value"."Global Dimension No." := 2;
                    "Dimension Value".Validate("Dimension Value"."Global Dimension No.", 2);
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

    var
        Day: Integer;
        Month: Integer;
        Year: Integer;
}

