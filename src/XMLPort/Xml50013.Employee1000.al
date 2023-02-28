xmlport 50013 "Employee  1000"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '~';
    FileName = 'C:\1000\Employee.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Employee; Employee)
            {
                AutoUpdate = true;
                XmlName = 'Employee';
                fieldelement(No; Employee."No.")
                {
                }
                fieldelement(Full_Name; Employee."Full Name")
                {
                }
                fieldelement(Reporting_To; Employee."Reporting To")
                {
                }
                fieldelement(Employee_Role; Employee."Employee Role")
                {
                }
                fieldelement(Job_Title; Employee."Job Title")
                {
                }
                fieldelement("Company_E-mail"; Employee."Company E-Mail")
                {
                }
                fieldelement(Region_ID; Employee."Region ID")
                {
                }
                fieldelement(Global_1_Dimension_Code; Employee."Global Dimension 1 Code")
                {
                }
                fieldelement(Group_ID; Employee."Group ID")
                {
                }
                fieldelement(Solution; Employee.Solution)
                {
                }
                fieldelement(Practice; Employee.Practice)
                {
                }
                fieldelement("Area"; Employee."Area")
                {
                }
                fieldelement(Domain; Employee.Domain)
                {
                }
                fieldelement(Designation; Employee.Designation)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    if StrLen(Employee."Full Name") > 50 then
                        Employee."First Name" := CopyStr(Employee."Full Name", 1, 50)
                    else
                        Employee."First Name" := Employee."Full Name";
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

