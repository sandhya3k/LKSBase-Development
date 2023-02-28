xmlport 50042 Employee_LCMS
{
    Direction = Import;
    //TBD //FieldDelimiter = '<None>';
    //TBD //FieldSeparator = '~';
    Format = Xml;

    schema
    {
        textelement(ArrayOfAdvocate)
        {
            tableelement(Employee; Employee)
            {
                AutoUpdate = true;
                XmlName = 'Advocate';
                fieldelement(employee_id; Employee."No.")
                {
                }
                fieldelement(employee_name; Employee."Full Name")
                {
                }
                fieldelement(reporting_to; Employee."Reporting To")
                {
                }
                fieldelement(role; Employee."Employee Role")
                {
                }
                fieldelement(job_title; Employee."Job Title")
                {
                }
                fieldelement(company_email; Employee."Company E-Mail")
                {
                }
                fieldelement(region_id; Employee."Region ID")
                {
                }
                textelement(Branch)
                {
                }
                fieldelement(group_id; Employee."Group ID")
                {
                }
                fieldelement(solution; Employee.Solution)
                {
                }
                fieldelement(category; Employee.Practice)
                {
                }
                fieldelement(sub_category; Employee."Area")
                {
                }
                fieldelement(domain; Employee.Domain)
                {
                }
                fieldelement(designation; Employee.Designation)
                {
                }
                fieldelement(hrcode; Employee."HR Code")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    Employee.Validate("Global Dimension 1 Code", Branch);
                    if StrLen(Employee."Full Name") > 50 then
                        Employee."First Name" := CopyStr(Employee."Full Name", 1, 50)
                    else
                        Employee."First Name" := Employee."Full Name";

                end;

                trigger OnAfterModifyRecord()
                begin
                    Employee.Validate("Global Dimension 1 Code", Branch);
                    if StrLen(Employee."Full Name") > 50 then
                        Employee."First Name" := CopyStr(Employee."Full Name", 1, 50)
                    else
                        Employee."First Name" := Employee."Full Name";


                    Owner1DimVal.Reset;
                    Owner1DimVal.SetRange("Dimension Code", 'OWNER1');
                    Owner1DimVal.SetRange(Code, Employee."No.");
                    if Owner1DimVal.FindFirst then begin
                        Owner1DimVal.Name := Employee."First Name";
                        Owner1DimVal."Job Title" := Employee."Job Title";
                        Owner1DimVal."Employee Role" := Employee."Employee Role";
                        Owner1DimVal.Designation := Employee.Designation;
                        Owner1DimVal."Reporting To" := Employee."Reporting To";
                        Owner1DimVal."Case-Branch" := Employee."Global Dimension 1 Code";
                        Owner1DimVal."Group-Head" := Employee."Group ID";
                        Owner1DimVal."Region ID" := Employee."Region ID";
                        Owner1DimVal."Company E-Mail" := Employee."Company E-Mail";
                        Owner1DimVal."HR Code" := Employee."HR Code";
                        Owner1DimVal."Full Name" := Employee."Full Name";
                        Owner1DimVal.Modify;
                    end;


                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'OWNER2');
                    Owner2DimVal.SetRange(Code, Employee."No.");
                    if Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Name := Employee."First Name";
                        Owner2DimVal."Job Title" := Employee."Job Title";
                        Owner2DimVal."Employee Role" := Employee."Employee Role";
                        Owner2DimVal.Designation := Employee.Designation;
                        Owner2DimVal."Reporting To" := Employee."Reporting To";
                        Owner2DimVal."Case-Branch" := Employee."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Employee."Group ID";
                        Owner2DimVal."Region ID" := Employee."Region ID";
                        Owner2DimVal."Company E-Mail" := Employee."Company E-Mail";
                        Owner2DimVal."HR Code" := Employee."HR Code";
                        Owner2DimVal."Full Name" := Employee."Full Name";
                        Owner2DimVal.Modify;
                    end;


                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'ASSOCIATES');
                    Owner2DimVal.SetRange(Code, Employee."No.");
                    if Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Name := Employee."First Name";
                        Owner2DimVal."Job Title" := Employee."Job Title";
                        Owner2DimVal."Employee Role" := Employee."Employee Role";
                        Owner2DimVal.Designation := Employee.Designation;
                        Owner2DimVal."Reporting To" := Employee."Reporting To";
                        Owner2DimVal."Case-Branch" := Employee."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Employee."Group ID";
                        Owner2DimVal."Region ID" := Employee."Region ID";
                        Owner2DimVal."Company E-Mail" := Employee."Company E-Mail";
                        Owner2DimVal."HR Code" := Employee."HR Code";
                        Owner2DimVal."Full Name" := Employee."Full Name";
                        Owner2DimVal.Modify;
                    end;

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
        Owner2DimVal: Record "Dimension Value";
        Owner1DimVal: Record "Dimension Value";
        OwnerDimVal: Record "Dimension Value";
}

