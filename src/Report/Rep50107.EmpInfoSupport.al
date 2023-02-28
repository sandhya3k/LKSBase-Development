report 50107 "Emp. Info Support"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/EmpInfoSupport.rdlc';

    dataset
    {
        dataitem("Emp Info Support"; "Emp Info Support")
        {
            DataItemTableView = SORTING("Employee ID", "Document No.");
            RequestFilterFields = "Employee ID";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Emp_Info_Support__Employee_ID_; "Employee ID")
            {
            }
            column(Emp_Info_Support_Name; Name)
            {
            }
            column(Emp_Info_Support__Employee_ID__Control1000000014; "Employee ID")
            {
            }
            column(Emp_Info_Support__Date_of_Joining_; "Date of Joining")
            {
            }
            column(Emp_Info_Support_Branch; Branch)
            {
            }
            column(Emp_Info_Support_Degisation; Degisation)
            {
            }
            column(Emp_Info_Support_Month; Month)
            {
            }
            column(Emp_Info_Support_Year; Year)
            {
            }
            column(Emp_Info_Support__Payment_Type_; "Payment Type")
            {
            }
            column(Emp_Info_Support__Basic_Pay_; "Basic Pay")
            {
            }
            column(Emp_Info_Support_HRA; HRA)
            {
            }
            column(Emp_Info_Support_Conveyance; Conveyance)
            {
            }
            column(Emp_Info_Support__Special_Allowance_; "Special Allowance")
            {
            }
            column(Emp_Info_Support__Gross_Pay_; "Gross Pay")
            {
            }
            column(Emp_Info_Support_Arears; Arears)
            {
            }
            column(Emp_Info_Support__Professional_Tax_; "Professional Tax")
            {
            }
            column(Emp_Info_Support__Loan_Recovery_; "Loan-Recovery")
            {
            }
            column(Emp_Info_Support_PF; PF)
            {
            }
            column(Emp_Info_Support_ESI; ESI)
            {
            }
            column(Emp_Info_Support__Other_Deduction_; "Other Deduction")
            {
            }
            column(Emp_Info_Support__Net_Pay_; "Net Pay")
            {
            }
            column(Emp_Info_Support__Payment_Mode_; "Payment Mode")
            {
            }
            column(Emp_Info_Support_Remark; Remark)
            {
            }
            column(Emp_Info_SupportCaption; Emp_Info_SupportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Emp_Info_Support_NameCaption; FieldCaption(Name))
            {
            }
            column(Emp_Info_Support__Employee_ID__Control1000000014Caption; FieldCaption("Employee ID"))
            {
            }
            column(Emp_Info_Support__Date_of_Joining_Caption; FieldCaption("Date of Joining"))
            {
            }
            column(Emp_Info_Support_BranchCaption; FieldCaption(Branch))
            {
            }
            column(Emp_Info_Support_DegisationCaption; FieldCaption(Degisation))
            {
            }
            column(Emp_Info_Support_MonthCaption; FieldCaption(Month))
            {
            }
            column(Emp_Info_Support_YearCaption; FieldCaption(Year))
            {
            }
            column(Emp_Info_Support__Payment_Type_Caption; FieldCaption("Payment Type"))
            {
            }
            column(Emp_Info_Support__Basic_Pay_Caption; FieldCaption("Basic Pay"))
            {
            }
            column(Emp_Info_Support_HRACaption; FieldCaption(HRA))
            {
            }
            column(Emp_Info_Support_ConveyanceCaption; FieldCaption(Conveyance))
            {
            }
            column(Emp_Info_Support__Special_Allowance_Caption; FieldCaption("Special Allowance"))
            {
            }
            column(Emp_Info_Support__Gross_Pay_Caption; FieldCaption("Gross Pay"))
            {
            }
            column(Emp_Info_Support_ArearsCaption; FieldCaption(Arears))
            {
            }
            column(Emp_Info_Support__Professional_Tax_Caption; FieldCaption("Professional Tax"))
            {
            }
            column(Emp_Info_Support__Loan_Recovery_Caption; FieldCaption("Loan-Recovery"))
            {
            }
            column(Emp_Info_Support_PFCaption; FieldCaption(PF))
            {
            }
            column(Emp_Info_Support_ESICaption; FieldCaption(ESI))
            {
            }
            column(Emp_Info_Support__Other_Deduction_Caption; FieldCaption("Other Deduction"))
            {
            }
            column(Emp_Info_Support__Net_Pay_Caption; FieldCaption("Net Pay"))
            {
            }
            column(Emp_Info_Support__Payment_Mode_Caption; FieldCaption("Payment Mode"))
            {
            }
            column(Emp_Info_Support_RemarkCaption; FieldCaption(Remark))
            {
            }
            column(Emp_Info_Support__Employee_ID_Caption; FieldCaption("Employee ID"))
            {
            }
            column(Emp_Info_Support_Document_No_; "Document No.")
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Employee ID");
            end;
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

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Emp_Info_SupportCaptionLbl: Label 'Emp Info Support';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

