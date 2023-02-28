report 50109 "Employee Ledger"
{
    DefaultLayout = RDLC;
    RDLCLayout = './res/EmployeeLedger.rdlc';

    dataset
    {
        dataitem("Emp Info Professional"; "Emp Info Professional")
        {
            DataItemTableView = SORTING("Employee ID", "Document No.");
            RequestFilterFields = "Employee ID";
            column(PageConst_________FORMAT_CurrReport_PAGENO_; PageConst + ' ' + Format(CurrReport.PageNo))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Emp_Info_Professional__Employee_ID_; "Employee ID")
            {
            }
            column(Emp_Info_Professional_Name; Name)
            {
            }
            column(Emp_Info_Professional__Employee_ID__Control1000000012; "Employee ID")
            {
            }
            column(Emp_Info_Professional__Date_of_Joining_; "Date of Joining")
            {
            }
            column(Emp_Info_Professional_Category; Category)
            {
            }
            column(Emp_Info_Professional_Classification; Classification)
            {
            }
            column(Emp_Info_Professional_Branch; Branch)
            {
            }
            column(Emp_Info_Professional_Wing; Wing)
            {
            }
            column(Emp_Info_Professional_Level; Level)
            {
            }
            column(Emp_Info_Professional_Month; Month)
            {
            }
            column(Emp_Info_Professional_Year; Year)
            {
            }
            column(Emp_Info_Professional__Payment_Typer_; "Payment Typer")
            {
            }
            column(Emp_Info_Professional__Annual__Compensation_; "Annual  Compensation")
            {
            }
            column(Emp_Info_Professional__Monthly_Compensation_; "Monthly Compensation")
            {
            }
            column(Emp_Info_Professional__Firm_Factor_; "Firm Factor")
            {
            }
            column(Emp_Info_Professional__Group_Factor_; "Group Factor")
            {
            }
            column(Emp_Info_Professional_Fixed; Fixed)
            {
            }
            column(Emp_Info_Professional__Firm_Varriable_; "Firm Varriable")
            {
            }
            column(Emp_Info_Professional__Group_Variable_; "Group Variable")
            {
            }
            column(Emp_Info_Professional_Total; Total)
            {
            }
            column(Emp_Info_Professional__Arrear_Gross_; "Arrear Gross")
            {
            }
            column(Emp_Info_Professional__TDS_Rates_; "TDS Rates")
            {
            }
            column(Emp_Info_Professional__Amount_Of_TDS_; "Amount Of TDS")
            {
            }
            column(Emp_Info_Professional__Net_Payable_; "Net Payable")
            {
            }
            column(Emp_Info_Professional_Telephone; Telephone)
            {
            }
            column(Emp_Info_Professional_Loan; Loan)
            {
            }
            column(Emp_Info_Professional__Other_Deduction_; "Other Deduction")
            {
            }
            column(Emp_Info_Professional__Net_Paid_; "Net Paid")
            {
            }
            column(Emp_Info_Professional__Payment_Mode_; "Payment Mode")
            {
            }
            column(Emp_Info_Professional_Remarks; Remarks)
            {
            }
            column(Emp_Info_ProfessionalCaption; Emp_Info_ProfessionalCaptionLbl)
            {
            }
            column(Emp_Info_Professional_NameCaption; FieldCaption(Name))
            {
            }
            column(Emp_Info_Professional__Employee_ID__Control1000000012Caption; FieldCaption("Employee ID"))
            {
            }
            column(Emp_Info_Professional__Date_of_Joining_Caption; FieldCaption("Date of Joining"))
            {
            }
            column(Emp_Info_Professional_CategoryCaption; FieldCaption(Category))
            {
            }
            column(Emp_Info_Professional_ClassificationCaption; FieldCaption(Classification))
            {
            }
            column(Emp_Info_Professional_BranchCaption; FieldCaption(Branch))
            {
            }
            column(Emp_Info_Professional_WingCaption; FieldCaption(Wing))
            {
            }
            column(Emp_Info_Professional_LevelCaption; FieldCaption(Level))
            {
            }
            column(Emp_Info_Professional_MonthCaption; FieldCaption(Month))
            {
            }
            column(Emp_Info_Professional_YearCaption; FieldCaption(Year))
            {
            }
            column(Emp_Info_Professional__Payment_Typer_Caption; FieldCaption("Payment Typer"))
            {
            }
            column(Emp_Info_Professional__Annual__Compensation_Caption; FieldCaption("Annual  Compensation"))
            {
            }
            column(Emp_Info_Professional__Monthly_Compensation_Caption; FieldCaption("Monthly Compensation"))
            {
            }
            column(Emp_Info_Professional__Firm_Factor_Caption; FieldCaption("Firm Factor"))
            {
            }
            column(Emp_Info_Professional__Group_Factor_Caption; FieldCaption("Group Factor"))
            {
            }
            column(Emp_Info_Professional_FixedCaption; FieldCaption(Fixed))
            {
            }
            column(Emp_Info_Professional__Firm_Varriable_Caption; FieldCaption("Firm Varriable"))
            {
            }
            column(Emp_Info_Professional__Group_Variable_Caption; FieldCaption("Group Variable"))
            {
            }
            column(Emp_Info_Professional_TotalCaption; FieldCaption(Total))
            {
            }
            column(Emp_Info_Professional__Arrear_Gross_Caption; FieldCaption("Arrear Gross"))
            {
            }
            column(Emp_Info_Professional__TDS_Rates_Caption; FieldCaption("TDS Rates"))
            {
            }
            column(Emp_Info_Professional__Amount_Of_TDS_Caption; FieldCaption("Amount Of TDS"))
            {
            }
            column(Emp_Info_Professional__Net_Payable_Caption; FieldCaption("Net Payable"))
            {
            }
            column(Emp_Info_Professional_TelephoneCaption; FieldCaption(Telephone))
            {
            }
            column(Emp_Info_Professional_LoanCaption; FieldCaption(Loan))
            {
            }
            column(Emp_Info_Professional__Other_Deduction_Caption; FieldCaption("Other Deduction"))
            {
            }
            column(Emp_Info_Professional__Net_Paid_Caption; FieldCaption("Net Paid"))
            {
            }
            column(Emp_Info_Professional__Payment_Mode_Caption; FieldCaption("Payment Mode"))
            {
            }
            column(Emp_Info_Professional_RemarksCaption; FieldCaption(Remarks))
            {
            }
            column(Emp_Info_Professional__Employee_ID_Caption; FieldCaption("Employee ID"))
            {
            }
            column(Emp_Info_Professional_Document_No_; "Document No.")
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
        PageConst: Label 'Page';
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Emp_Info_ProfessionalCaptionLbl: Label 'Emp Info Professional';
}

