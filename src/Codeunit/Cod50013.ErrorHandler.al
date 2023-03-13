codeunit 50013 "Error Handler"
{
    trigger OnRun()
    begin
        case Method of
            'HandleLCMSRequest':
                begin
                    HandleLCMSRequest();
                end;
        end;
    end;

    procedure SetDef(MethodP: Text[50]; StringP: Text)
    begin
        Method := MethodP;
        String := StringP;
    end;

    procedure HandleLCMSRequest()
    var
        JToken: JsonToken;
        JToken2: JsonToken;
        HeaderToken: JsonToken;
        HeaderArray: JsonArray;
        i: Integer;
        Status: Boolean;
        WriteOff: Decimal;
    begin
        JToken.ReadFrom(String);
        case true of
            JToken.SelectToken('Rtb', HeaderToken):
                Proc := 'RTBCreate';
            GetValue('WriteOffAmount', JToken) > '':
                Proc := 'WriteOffAmount';
            GetValue('RTBNo', JToken) > '':
                Proc := 'CancelRTB';

            JToken.SelectToken('Branch', HeaderToken):
                Proc := 'SyncBranch';
            JToken.SelectToken('Group', HeaderToken):
                Proc := 'SyncGroup';
            JToken.SelectToken('Region', HeaderToken):
                Proc := 'SyncRegion';
            JToken.SelectToken('Forum', HeaderToken):
                Proc := 'SyncForum';
            JToken.SelectToken('Client', HeaderToken):
                Proc := 'SyncClient';
            JToken.SelectToken('Office', HeaderToken):
                Proc := 'SyncOffice';
            JToken.SelectToken('Contact', HeaderToken):
                Proc := 'SyncContact';
            JToken.SelectToken('Practice', HeaderToken):
                Proc := 'SyncPractice';
            JToken.SelectToken('Process', HeaderToken):
                Proc := 'SyncProcess';
            JToken.SelectToken('Solution', HeaderToken):
                Proc := 'SyncSolution';
            JToken.SelectToken('Case', HeaderToken):
                Proc := 'SyncCase';
            JToken.SelectToken('Advocate', HeaderToken):
                Proc := 'SyncAdvocate';
        end;
        case Proc of
            'SyncAdvocate':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Advocate', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            employee_id := GetValue('employee_id', HeaderToken);
                            employee_name := GetValue('employee_name', HeaderToken);
                            reporting_to := GetValue('reporting_to', HeaderToken);
                            role := GetValue('role', HeaderToken);
                            job_title := GetValue('job_title', HeaderToken);
                            company_email := GetValue('company_email', HeaderToken);
                            region_id := GetValue('region_id', HeaderToken);
                            branch := GetValue('branch', HeaderToken);
                            group_id := GetValue('group_id', HeaderToken);
                            solution := GetValue('solution', HeaderToken);
                            category := GetValue('category', HeaderToken);
                            sub_category := GetValue('sub_category', HeaderToken);
                            domain := GetValue('domain', HeaderToken);
                            designation := GetValue('designation', HeaderToken);
                            hrcode := GetValue('hrcode', HeaderToken);
                            SyncAdvocate();
                        end;
                    end;
                end;
            'SyncCase':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Case', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            case_id := GetValue('case_id', HeaderToken);
                            office_id := GetValue('office_id', HeaderToken);
                            client_id := GetValue('client_id', HeaderToken);
                            matter_type := GetValue('matter_type', HeaderToken);
                            case_Document_Name := GetValue('case_Document_Name', HeaderToken);
                            case_activity_type := GetValue('case_activity_type', HeaderToken);
                            matter_sub_type := GetValue('matter_sub_type', HeaderToken);
                            case_branch := GetValue('case_branch', HeaderToken);
                            category := GetValue('category', HeaderToken);
                            sub_category := GetValue('sub_category', HeaderToken);
                            case_rain_maker := GetValue('case_rain_maker', HeaderToken);
                            case_rain_giver := GetValue('case_rain_giver', HeaderToken);
                            case_forum := GetValue('case_forum', HeaderToken);
                            case_subforum := GetValue('case_subforum', HeaderToken);
                            case_creation_date := GetValue('case_creation_date', HeaderToken);
                            case_Referance_Type := GetValue('case_Referance_Type', HeaderToken);
                            case_number := GetValue('case_number', HeaderToken);
                            case_forum_city := GetValue('case_forum_city', HeaderToken);
                            case_target_forum := GetValue('case_target_forum', HeaderToken);
                            case_target_forum_city := GetValue('case_target_forum_city', HeaderToken);
                            case_target_subforum := GetValue('case_target_subforum', HeaderToken);
                            case_manager := GetValue('case_manager', HeaderToken);
                            case_partner := GetValue('case_partner', HeaderToken);
                            correspondance_contact_id := GetValue('correspondance_contact_id', HeaderToken);
                            billing_contact_id := GetValue('billing_contact_id', HeaderToken);
                            group_code := GetValue('group_code', HeaderToken);
                            practice_code := GetValue('practice_code', HeaderToken);
                            resource := GetValue('resource', HeaderToken);

                            SyncCase();
                        end;
                    end;
                end;
            'SyncSolution':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Solution', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            id := GetValue('id', HeaderToken);
                            name := GetValue('name', HeaderToken);
                            SyncSolution();
                        end;
                    end;
                end;
            'SyncProcess':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Process', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            id := GetValue('id', HeaderToken);
                            name := GetValue('name', HeaderToken);
                            SyncProcess();
                        end;
                    end;
                end;
            'SyncPractice':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Practice', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            category := GetValue('category', HeaderToken);
                            sub_category := GetValue('sub_category', HeaderToken);
                            document := GetValue('document', HeaderToken);
                            type_of_activity := GetValue('type_of_activity', HeaderToken);
                            SyncPractice();
                        end;
                    end;
                end;
            'SyncContact':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Contact', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            contact_id := GetValue('contact_id', HeaderToken);
                            office_id := GetValue('office_id', HeaderToken);
                            client_id := GetValue('client_id', HeaderToken);
                            department := GetValue('department', HeaderToken);
                            designation := GetValue('designation', HeaderToken);
                            initials := GetValue('initials', HeaderToken);
                            first_name := GetValue('first_name', HeaderToken);
                            middle_name := GetValue('middle_name', HeaderToken);
                            last_name := GetValue('last_name', HeaderToken);
                            phone_no := GetValue('phone_no', HeaderToken);
                            phone_no_2 := GetValue('phone_no_2', HeaderToken);
                            mobile_no := GetValue('mobile_no', HeaderToken);
                            mobile_no_2 := GetValue('mobile_no_2', HeaderToken);
                            email := GetValue('email', HeaderToken);
                            pref_way_of_comm := GetValue('pref_way_of_comm', HeaderToken);
                            time_slot := GetValue('time_slot', HeaderToken);
                            gstin := GetValue('gstin', HeaderToken);
                            SyncContact();
                        end;
                    end;
                end;
            'SyncOffice':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Office', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            office_id := GetValue('office_id', HeaderToken);
                            client_id := GetValue('client_id', HeaderToken);
                            office_type := GetValue('office_type', HeaderToken);
                            address1 := GetValue('address1', HeaderToken);
                            address2 := GetValue('address2', HeaderToken);
                            pin_code := GetValue('pin_code', HeaderToken);
                            city := GetValue('city', HeaderToken);
                            district := GetValue('district', HeaderToken);
                            state := GetValue('state', HeaderToken);
                            country := GetValue('country', HeaderToken);
                            email := GetValue('email', HeaderToken);
                            phone := GetValue('phone', HeaderToken);
                            telex_no := GetValue('telex_no', HeaderToken);
                            fax_no := GetValue('fax_no', HeaderToken);
                            isd := GetValue('isd', HeaderToken);
                            std := GetValue('std', HeaderToken);
                            gstin := GetValue('gstin', HeaderToken);
                            SyncOffice();
                        end;
                    end;
                end;
            'SyncClient':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Client', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            client_id := GetValue('client_id', HeaderToken);
                            client_name := GetValue('client_name', HeaderToken);
                            client_sector := GetValue('client_sector', HeaderToken);
                            client_old_name := GetValue('client_old_name', HeaderToken);
                            client_grp_name := GetValue('client_grp_name', HeaderToken);
                            classification := GetValue('classification', HeaderToken);
                            enrolment_year := GetValue('enrolment_year', HeaderToken);
                            enrolment_month := GetValue('enrolment_month', HeaderToken);
                            rain_maker := GetValue('rain_maker', HeaderToken);
                            rain_giver := GetValue('rain_giver', HeaderToken);
                            pan := GetValue('pan', HeaderToken);
                            stc_no := GetValue('stc_no', HeaderToken);
                            service_tax_no := GetValue('service_tax_no', HeaderToken);
                            central_excise_reg := GetValue('central_excise_reg', HeaderToken);
                            customer_reg_no := GetValue('customer_reg_no', HeaderToken);
                            import_export_no := GetValue('import_export_no', HeaderToken);
                            home_page := GetValue('home_page', HeaderToken);
                            email := GetValue('email', HeaderToken);
                            entity_status := GetValue('entity_status', HeaderToken);
                            client_for := GetValue('client_for', HeaderToken);
                            SyncClient();
                        end;
                    end;
                end;
            'SyncForum':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Forum', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            name := GetValue('name', HeaderToken);
                            sub_forum := GetValue('sub_forum', HeaderToken);
                            forum_city := GetValue('forum_city', HeaderToken);
                            SyncForum();
                        end;
                    end;
                end;
            'SyncGroup':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Group', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            group_id := GetValue('group_id', HeaderToken);
                            branch_id := GetValue('branch_id', HeaderToken);
                            region_id := GetValue('region_id', HeaderToken);
                            group_name := GetValue('group_name', HeaderToken);
                            group_head := GetValue('group_head', HeaderToken);
                            SyncGroup();
                        end;
                    end;
                end;
            'SyncRegion':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Region', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            region_id := GetValue('region_id', HeaderToken);
                            region_name := GetValue('region_name', HeaderToken);
                            region_head := GetValue('region_head', HeaderToken);
                            branch_name := GetValue('branch_name', HeaderToken);
                            SyncRegion();
                        end;
                    end;
                end;
            'RTBCreate':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Rtb', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            client_id := GetValue('client_id', HeaderToken);
                            case_id := GetValue('case_id', HeaderToken);
                            rtb_number := GetValue('rtb_number', HeaderToken);
                            rtb_type := GetValue('rtb_type', HeaderToken);
                            bill_description := GetValue('bill_description', HeaderToken);
                            currency := GetValue('currency', HeaderToken);
                            invoice_type := GetValue('invoice_type', HeaderToken);
                            adjust_against_adv := GetValue('adjust_against_adv', HeaderToken);
                            professional_fees := GetValue('professional_fees', HeaderToken);
                            reference_amount := GetValue('reference_amount', HeaderToken);
                            confirmation_reference := GetValue('confirmation_reference', HeaderToken);
                            posting_no := GetValue('posting_no', HeaderToken);
                            rtb_date := GetValue('rtb_date', HeaderToken);
                            billed_by := GetValue('billed_by', HeaderToken);
                            CreateRTBHdr();
                        end;
                    end;
                    JToken.SelectToken('Installments', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            rtb_number := GetValue('rtb_number', HeaderToken);
                            installment_types := GetValue('installment_types', HeaderToken);
                            description := GetValue('description', HeaderToken);
                            UOM := GetValue('UOM', HeaderToken);
                            count := GetValue('count', HeaderToken);
                            professional_rates := GetValue('professional_rates', HeaderToken);
                            amount := GetValue('amount', HeaderToken);
                            Other_Detail1 := GetValue('Other_Detail1', HeaderToken);
                            Other_Detail2 := GetValue('Other_Detail2', HeaderToken);
                            Supporting_Bill_No := GetValue('Supporting_Bill_No', HeaderToken);
                            Supporting_Bill_Date := GetValue('Supporting_Bill_Date', HeaderToken);
                            Date_of_Expense := GetValue('Date_of_Expense', HeaderToken);
                            Service_Tax_Applicable := GetValue('Service_Tax_Applicable', HeaderToken);
                            CreateRTBLine();
                        end
                    end;
                end;
            'CancelRTB':
                begin
                    JToken.ReadFrom(String);
                    RTBNo := GetValue('RTBNo', JToken);
                    InvoiceNo := GetValue('InvoiceNo', JToken);
                    CRTBNo := GetValue('cRTBNo', JToken);
                    CRTBReason := GetValue('RTBReason', JToken);
                    CancelRTBData();
                    // CancelRTB(Status, 
                    // , GetValue('InvoiceNo', JToken)
                    // //, GetValue('billed_by', HeaderToken)
                    // , GetValue('cRTBNo', JToken)
                    // , GetValue('RTBReason', JToken));
                end;
            'WriteOffAmount':
                begin
                    JToken.ReadFrom(String);
                    Evaluate(WriteOff, GetValue('WriteOffAmount', JToken));
                    WriteOffAmount(WriteOff
                    , GetValue('InvoiceNo', JToken)
                    //, GetValue('billed_by', HeaderToken)
                    , GetValue('RTBNo', JToken), Status);
                end;
            'SyncBranch':
                begin
                    JToken.ReadFrom(String);
                    JToken.SelectToken('Branch', HeaderToken);
                    HeaderArray := HeaderToken.AsArray();
                    for i := 0 To HeaderArray.Count - 1 do begin
                        if HeaderArray.Get(i, HeaderToken) then begin
                            branch_id := GetValue('branch_id', HeaderToken);
                            branch_region_id := GetValue('branch_region_id', HeaderToken);
                            branch_head := GetValue('branch_head', HeaderToken);
                            branch_name := GetValue('branch_name', HeaderToken);
                            SyncBranch();
                        end;
                    end;
                end;
            else
                Error('Invalid Request');
        end;
        GenPracticeDim;
        GenForumDim;
        GenOwnerDim;
        GenCustDim;
        UpdateCustPosting;
    end;

    procedure SyncAdvocate()
    var
        Employee: Record Employee;
        Owner2DimVal: Record "Dimension Value";
        Owner1DimVal: Record "Dimension Value";
        OwnerDimVal: Record "Dimension Value";
    begin
        RefNo := employee_id;
        if Employee.Get(employee_id) then begin
            AssignValuesToAdvocate(Employee);
            Employee.Modify(true);
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
        end else begin
            Employee.Init();
            AssignValuesToAdvocate(Employee);
            Employee.Insert(true);
            Employee.Validate("Global Dimension 1 Code", Branch);
            if StrLen(Employee."Full Name") > 50 then
                Employee."First Name" := CopyStr(Employee."Full Name", 1, 50)
            else
                Employee."First Name" := Employee."Full Name";
        end;
    end;

    procedure AssignValuesToAdvocate(var Employee: Record Employee)
    begin
        Employee."No." := employee_id;
        Employee."Full Name" := employee_name;
        Employee."Reporting To" := reporting_to;
        Employee."Employee Role" := role;
        Employee."Job Title" := job_title;
        Employee."Company E-Mail" := company_email;
        Employee."Region ID" := region_id;
        //textelement(Branch);
        Employee."Group ID" := group_id;
        Employee.Solution := solution;
        Employee.Practice := category;
        Employee."Area" := sub_category;
        Employee.Domain := domain;
        Employee.Designation := designation;
        Employee."HR Code" := hrcode;

    end;

    procedure SyncCase()
    var
        DimensionValue: Record "Dimension Value";
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        RefNo := case_id;
        if DimensionValue.Get('CASE', case_id) then begin
            AssignValuesToCase(DimensionValue);
            DimensionValue.Modify(true);
        end else begin
            DimensionValue.Init();
            AssignValuesToCase(DimensionValue);
            DimensionValue.Insert(true);
        end;
    end;

    procedure AssignValuesToCase(var DimensionValue: Record "Dimension Value")
    var
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        DimensionValue.Code := case_id;
        DimensionValue."Dimension Code" := 'CASE';
        DimensionValue.Name := DimensionValue.Code;
        DimensionValue."Global Dimension No." := 2;
        DimensionValue.Validate(DimensionValue."Global Dimension No.", 2);
        DimensionValue."Case-Office ID" := office_id;
        DimensionValue."Case-Client ID" := client_id;
        DimensionValue."Case-Process" := matter_type;
        DimensionValue.Validate(DimensionValue.Code);
        DimensionValue."Case-Document Name" := Case_Document_Name;
        DimensionValue."Case-Activity Type" := case_activity_type;
        DimensionValue."Case-Solution" := matter_sub_type;
        DimensionValue."Case-Branch" := case_branch;
        DimensionValue."Case-Practice" := category;
        DimensionValue."Case-Area" := sub_category;
        DimensionValue."Case-Rain Maker" := case_rain_maker;
        DimensionValue."Case-Rain Giver" := case_rain_giver;
        DimensionValue."Case-Forum" := case_forum;
        DimensionValue."Case-Sub Forum" := case_subforum;
        if case_creation_date <> '' then begin
            Evaluate(Year, CopyStr(case_creation_date, 1, 4));
            Evaluate(Month, CopyStr(case_creation_date, 6, 2));
            Evaluate(Day, CopyStr(case_creation_date, 9, 2));
            DimensionValue."Case-Creation Date" := DMY2Date(Day, Month, Year);
        end;
        DimensionValue."Case-Referance Type" := Case_Referance_Type;
        DimensionValue."Case-Referance No" := case_number;
        DimensionValue."Case-Forum City" := case_forum_city;
        DimensionValue."Case-Target Forum" := case_target_forum;
        DimensionValue."Case-Target Sub Forum" := case_target_subforum;
        DimensionValue."Case-Target Forum City" := case_target_forum_city;
        DimensionValue."Case-Owner1" := case_manager;
        DimensionValue."Case-Owner2" := case_partner;
        DimensionValue.Correspondence_Contact_ID := correspondance_contact_id;
        DimensionValue.Billing_Contact_ID := billing_contact_id;
        DimensionValue."Group-Head" := group_code;
        DimensionValue."Practice-Head" := practice_code;

    end;

    procedure SyncSolution()
    var
        DimensionValue: Record "Dimension Value";
    begin
        RefNo := id;
        if DimensionValue.Get('SOLUTION', id) then begin
            DimensionValue.Name := name;
            DimensionValue.Modify(true);
        end else begin
            DimensionValue."Dimension Code" := 'SOLUTION';
            DimensionValue.Code := id;
            DimensionValue.Name := name;
            DimensionValue.Insert(true);
        end;
    end;

    procedure SyncProcess()
    var
        DimensionValue: Record "Dimension Value";
    begin
        RefNo := id;
        if DimensionValue.Get('PROCESS', id) then begin
            DimensionValue.Name := name;
            DimensionValue.Modify(true);
        end else begin
            DimensionValue."Dimension Code" := 'PROCESS';
            DimensionValue.Code := id;
            DimensionValue.Name := name;
            DimensionValue.Insert(true);
        end;
    end;

    procedure SyncPractice()
    var
        "Practice/Area/Deliverables": Record "Practice/Area/Deliverables";
    begin
        RefNo := category + '-' + sub_category + '-' + document + '-' + type_of_activity;
        if not "Practice/Area/Deliverables".Get(category, sub_category, document, type_of_activity) then begin
            "Practice/Area/Deliverables".Init();
            "Practice/Area/Deliverables"."Practice Name" := category;
            "Practice/Area/Deliverables"."Area Name" := sub_category;
            "Practice/Area/Deliverables"."Document Name" := document;
            "Practice/Area/Deliverables"."Type of Activity" := type_of_activity;
            "Practice/Area/Deliverables".Insert();
        end;
    end;

    procedure SyncContact()
    var
        Contact: Record Contact;
    begin
        RefNo := contact_id;
        if Contact.Get(contact_id) then begin
            AssignValuesToContact(Contact);
            Contact.Modify(true);
        end else begin
            Contact.Init();
            AssignValuesToContact(Contact);
            Contact.Insert(true);
        end;
    end;

    procedure AssignValuesToContact(var Contact: Record Contact)
    begin
        Contact."No." := contact_id;
        Contact."Office ID" := office_id;
        Contact."Client ID" := client_id;
        Contact.Department := department;
        Contact.Designation := designation;
        Contact.Initials := initials;
        Contact."F Name" := first_name;
        Contact."M Name" := Middle_name;
        Contact."L Name" := last_name;
        Contact."Phone No." := phone_no;
        Contact."Phone 2" := Phone_no_2;
        Contact."Mobile Phone No." := mobile_no;
        Contact."Mobile 2" := mobile_no_2;
        Contact."E-Mail" := email;
        Contact."Pref Way of Comm" := pref_way_of_comm;
        Contact."Time Slot" := time_slot;
    end;

    procedure SyncOffice()
    var
        "Ship-to Address": Record "Ship-to Address";
    begin
        RefNo := client_id + '-' + office_id;
        if "Ship-to Address".Get(client_id, office_id) then begin
            AssignValuesToOffice("Ship-to Address");
            "Ship-to Address".Modify(true);
        end else begin
            "Ship-to Address".Init();
            AssignValuesToOffice("Ship-to Address");
            "Ship-to Address".Insert(true);
        end;
    end;

    procedure AssignValuesToOffice(var "Ship-to Address": Record "Ship-to Address")
    var
        Cust: Record Customer;
    begin
        "Ship-to Address".Code := office_id;
        "Ship-to Address"."Customer No." := client_id;
        "Ship-to Address"."Office Type" := office_type;
        "Ship-to Address"."Client Address 1" := address1;
        "Ship-to Address"."Client Address 2" := address2;
        "Ship-to Address"."Post Office" := pin_code;
        "Ship-to Address"."City Town" := city;
        "Ship-to Address".District := district;
        "Ship-to Address"."State Name" := state;
        "Ship-to Address".Country := country;
        "Ship-to Address"."E-Mail" := email;
        "Ship-to Address"."Phone No." := phone;
        "Ship-to Address"."Telex No." := telex_no;
        "Ship-to Address"."Fax No." := fax_no;
        "Ship-to Address".ISD := isd;
        "Ship-to Address".STD := std;
        "Ship-to Address"."GST Reg No." := gstin;
        Cust.Get("Ship-to Address"."Customer No.");
        "Ship-to Address".Name := Cust.Name;
        "Ship-to Address"."Name 2" := Cust."Name 2";

        if StrLen("Ship-to Address"."Client Address 1") > 50 then
            "Ship-to Address".Address := CopyStr("Ship-to Address"."Client Address 1", 1, 50)
        else
            "Ship-to Address".Address := "Ship-to Address"."Client Address 1";
        if StrLen("Ship-to Address"."Client Address 2") > 50 then
            "Ship-to Address"."Address 2" := CopyStr("Ship-to Address"."Client Address 2", 1, 50)
        else
            "Ship-to Address"."Address 2" := "Ship-to Address"."Client Address 2";
    end;

    procedure SyncClient()
    var
        Customer: Record Customer;
    begin
        RefNo := client_id;
        if not Customer.Get(client_id) then begin
            Customer.Init();
            Customer."No." := client_id;
            AssignValuesToCustomer(Customer);
            Customer.Insert(true);
        end else begin
            AssignValuesToCustomer(Customer);
            Customer.Modify(true);
        end;
    end;

    procedure AssignValuesToCustomer(var Customer: Record Customer)
    var
        Cust: Record Customer;
    begin

        Customer.Validate(Customer."Client Name", client_name);
        if StrLen(client_name) > 50 then begin
            Customer.Validate(Name, CopyStr(client_name, 1, 50));
            Customer.Validate("Name 2", CopyStr(client_name, 51, StrLen(client_name)));
        end
        else
            Customer.Name := client_name;
        Customer.Validate("Client Name", client_name);

        if Cust.Get(Customer."No.") then
            Customer.Modify(true);
        Customer."Client Sector" := client_sector;
        Customer."Client Old Name" := client_old_name;
        Customer."Client Group Name" := client_grp_name;
        Customer.Classification := classification;
        Customer."Enrolment Year" := enrolment_year;
        Customer."Enrolment Month" := Enrolment_month;
        Customer."Rain Maker" := rain_maker;
        Customer."Rain Giver" := rain_giver;
        Customer."P.A.N. No." := pan;
        Customer."STC No." := stc_no;
        Customer."Service Tax No." := service_tax_no;
        Customer."Central Excise Regn No." := central_excise_reg;
        Customer."Customer Regn No." := customer_reg_no;
        Customer."Importer Exporter No." := import_export_no;
        Customer."Home Page" := home_page;
        Customer."E-Mail" := email;
        Customer."Entity Status" := entity_status;
        Customer."Client For" := client_for;
        if Customer."Client For" = '' then
            Customer."Client For" := 'Tax';
    end;

    procedure SyncForum()
    var
        ForumInfo: Record "Forum Info";
    begin
        RefNo := name + '-' + sub_forum + '-' + forum_city;
        if not ForumInfo.Get(name, sub_forum, forum_city) then begin
            ForumInfo.Init();
            ForumInfo."Forum Name" := name;
            ForumInfo."Sub Forum" := sub_forum;
            ForumInfo."Forum City" := forum_city;
            ForumInfo.Insert(true);
        end;
    end;

    procedure SyncGroup()
    var
        DimValues: Record "Dimension Value";
    begin
        RefNo := group_id;
        if DimValues.Get('GROUPHEAD', group_id) then begin
            DimValues.Name := group_name;
            DimValues."Group-Branch ID" := branch_id;
            DimValues."Group-Region ID" := region_id;
            DimValues."Group-Head" := group_head;
            DimValues.Modify(true);
        end else begin
            DimValues."Dimension Code" := 'GROUPHEAD';
            DimValues.Code := group_id;
            DimValues.Name := group_name;
            DimValues."Group-Branch ID" := branch_id;
            DimValues."Group-Region ID" := region_id;
            DimValues."Group-Head" := group_head;
            DimValues.Insert(true);
        end;
    end;

    procedure SyncBranch()
    var
        DimValues: Record "Dimension Value";
    begin
        RefNo := branch_id;
        if DimValues.Get('BRANCH', branch_id) then begin
            DimValues."Branch-Region ID" := branch_region_id;
            DimValues."Branch-Head" := branch_head;
            DimValues.Name := branch_name;
            DimValues.Modify(true);
        end else begin
            DimValues."Dimension Code" := 'BRANCH';
            DimValues.Code := branch_id;
            DimValues."Branch-Region ID" := branch_region_id;
            DimValues."Branch-Head" := branch_head;
            DimValues.Name := branch_name;
            DimValues.Insert(true);
        end;
    end;

    procedure SyncRegion()
    var
        DimValues: Record "Dimension Value";
    begin
        RefNo := region_id;
        if DimValues.Get('REGION', region_id) then begin
            DimValues.Name := region_name;
            DimValues."Region-Head" := region_head;
            DimValues.Modify(true);
        end else begin
            DimValues."Dimension Code" := 'REGION';
            DimValues.Code := region_id;
            DimValues."Region-Head" := region_head;
            DimValues.Name := region_name;
            DimValues.Insert(true);
        end;
    end;

    procedure WriteOffAmount(AmountToWrtOff: Decimal; InvoiceNo: Code[20]; RTBNo: Code[20]; var StatusP: Boolean)
    var
        LineNo: Integer;
        DocNo: Code[20];
        NoSeriesLine: Record "No. Series Line";
        GenJournalBatch: Record "Gen. Journal Batch";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        GenJournalLine: Record "Gen. Journal Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        Clear(LineNo);
        Clear(DocNo);
        Clear(NoSeriesManagement);

        GenJournalBatch.Get('JOURNAL VO', 'JVWRITEOFF');

        // NoSeriesLine.RESET;
        // NoSeriesLine.SETRANGE("Series Code",GenJournalBatch."No. Series");
        // IF NoSeriesLine.FINDFIRST THEN;
        // IF NoSeriesLine."Last No. Used" <> '' THEN
        //  DocNo := NoSeriesLine."Last No. Used"
        // ELSE
        //  DocNo := NoSeriesLine."Starting No.";
        RefNo := InvoiceNo;
        DocNo := NoSeriesManagement.GetNextNo(GenJournalBatch."No. Series", Today, true);
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("No.", InvoiceNo);
        SalesInvoiceHeader.FindFirst;

        //DocNo := INCSTR(DocNo);

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if GenJournalLine.FindLast then
            LineNo += GenJournalLine."Line No." + 10000
        else
            LineNo := 10000;

        Clear(GenJournalLine);
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := GenJournalBatch."Journal Template Name";
        GenJournalLine."Journal Batch Name" := GenJournalBatch.Name;
        GenJournalLine."Document No." := DocNo;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::" ");
        GenJournalLine.Validate("Posting Date", Today);
        GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::Customer);
        GenJournalLine.Validate("Account No.", SalesInvoiceHeader."Sell-to Customer No.");
        GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
        GenJournalLine.Validate("Bal. Account No.", '99-99-999999');
        GenJournalLine.Validate("Credit Amount", AmountToWrtOff);
        GenJournalLine.Validate("Posting No. Series", GenJournalBatch."Posting No. Series");
        GenJournalLine.Validate("Applies-to Doc. Type", GenJournalLine."Applies-to Doc. Type"::Invoice);
        GenJournalLine.Validate("Applies-to Doc. No.", InvoiceNo);
        GenJournalLine."Shortcut Dimension 1 Code" := SalesInvoiceHeader."Shortcut Dimension 1 Code";
        GenJournalLine."Shortcut Dimension 2 Code" := SalesInvoiceHeader."Shortcut Dimension 2 Code";
        GenJournalLine.Insert;
        StatusP := true;
    end;

    procedure CancelRTBData()
    var
        SalesLine: Record "Sales Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        CopyDocMgt: Codeunit "Copy Document Mgt.";
        FromDocType: Enum "Sales Document Type From";
    begin
        RefNo := CRTBNo;
        if not (InvoiceNo = '') and not (CRTBNo = '') then begin
            Clear(SalesHeader);
            SalesInvoiceHeader.Get(InvoiceNo);
            SalesHeader.Init;
            SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
            SalesHeader."No." := CRTBNo;
            SalesHeader.Insert(true);
            SalesSetup.Get;
            Clear(CopyDocMgt);
            CopyDocMgt.SetProperties(
             true, false, false, false, false, SalesSetup."Exact Cost Reversing Mandatory", false);
            CopyDocMgt.CopySalesDoc(FromDocType::"Posted Invoice", InvoiceNo, SalesHeader);
            SalesHeader."Applies-to Doc. Type" := SalesHeader."Applies-to Doc. Type"::Invoice;
            SalesHeader.Validate("Applies-to Doc. No.", InvoiceNo);
            SalesHeader."Posting Date" := Today;
            if SalesHeader."Location Code" <> '' then
                SalesHeader.Validate("Location Code");
            if SalesHeader."Bill-to Contact No." <> '' then
                SalesHeader.Validate("Bill-to Contact No.");
            SalesHeader."Bill Description" := CRTBReason;
            SalesHeader.Modify(true);

            SalesLine.Reset;
            SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Credit Memo");
            SalesLine.SetRange("Document No.", CRTBNo);
            REPORT.Run(50103);
        end;
    end;

    procedure CreateRTBLine()
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        SavedFileName: Text[100];
        R_SL: Record "Sales Line";
        cdDoc: Code[20];
        txtDesc: Text[50];
        txtitemDesc: Text[100];
        uom: Code[10];
        decQuantity: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        OtherDetail1: Text[250];
        OtherDetail2: Text[250];
        SupportingBillNo: Text[50];
        SupportingBillDate: Date;
        DateofExpense: Date;
        ServiceTaxApplicable: Boolean;
        SalesLineHistory: Record "Sales Line History";
        VarUnitPrice: Decimal;
        VarSupportingBillDate: Date;
        VarDateofExpense: Date;
        VarServiceTaxApplicable: Boolean;
        VardecQuantity: Decimal;
        VarLineAmount: Decimal;
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        if professional_rates = '' then
            VarUnitPrice := 0
        else
            Evaluate(VarUnitPrice, professional_rates);

        if Supporting_Bill_Date = '' then
            VarSupportingBillDate := 0D
        else begin
            Evaluate(Year, CopyStr(Supporting_Bill_Date, 1, 4));
            Evaluate(Month, CopyStr(Supporting_Bill_Date, 6, 2));
            Evaluate(Day, CopyStr(Supporting_Bill_Date, 9, 2));
            VarSupportingBillDate := DMY2Date(Day, Month, Year);
        end;

        if Date_of_Expense = '' then
            VarDateofExpense := 0D
        else begin
            Evaluate(Year, CopyStr(Date_of_Expense, 1, 4));
            Evaluate(Month, CopyStr(Date_of_Expense, 6, 2));
            Evaluate(Day, CopyStr(Date_of_Expense, 9, 2));
            VarDateofExpense := DMY2Date(Day, Month, Year);
        end;

        if Service_Tax_Applicable = '' then
            VarServiceTaxApplicable := false
        else
            Evaluate(VarServiceTaxApplicable, Service_Tax_Applicable);

        if count = '' then
            VardecQuantity := 0
        else
            Evaluate(VardecQuantity, count);

        if amount = '' then
            VarLineAmount := 0
        else
            Evaluate(VarLineAmount, amount);

        SalesHead.Reset;
        SalesHead.SetRange("No.", rtb_number);
        if SalesHead.FindFirst then begin
            SalesLine.Reset;
            SalesLine.SetRange("Document No.", SalesHead."No.");
            if SalesLine.FindLast then
                LineNo := SalesLine."Line No." + 10000
            else
                LineNo := 10000;
        end;

        R_SL.Init;
        R_SL."Document Type" := R_SL."Document Type"::Invoice;
        R_SL."Document No." := rtb_number;
        R_SL."Line No." := LineNo;
        R_SL."Shortcut Dimension 1 Code" := SalesHead."Shortcut Dimension 1 Code";
        R_SL."Shortcut Dimension 2 Code" := SalesHead."Shortcut Dimension 2 Code";
        R_SL.Type := R_SL.Type::"G/L Account";
        R_SL.Validate("No.", '99-99-999999');
        R_SL.Description := installment_types;
        R_SL."Unit Price" := VarUnitPrice;
        R_SL."Item Description" := description;
        R_SL."Other Detail 1" := Other_Detail1;
        R_SL."Other Detail 2" := Other_Detail2;
        R_SL."Supporting Bill No." := Supporting_Bill_No;
        R_SL."Supporting Bill Dt." := VarSupportingBillDate;
        R_SL."Date of Expense" := VarDateofExpense;
        R_SL."Service Tax Applicable" := VarServiceTaxApplicable;
        R_SL.Validate(Quantity, VardecQuantity);
        R_SL.Validate("Unit Price", VarUnitPrice);
        if R_SL."Unit Price" = 0 then begin
            R_SL."Unit Price" := VarLineAmount;
        end;
        R_SL."Item Description" := description;
        R_SL.Validate("Line Amount", VarLineAmount);
        R_SL.Insert(true);
        R_SL.Modify;//2021

        rtb_number := '';
        installment_types := '';
        description := '';
        count := '';
        professional_rates := '';
        amount := '';
        Other_Detail1 := '';
        Other_Detail2 := '';
        Supporting_Bill_No := '';
        Supporting_Bill_Date := '';
        Date_of_Expense := '';
        Service_Tax_Applicable := '';
    end;

    procedure CreateRTBHdr()
    var
        CLE: Record "Cust. Ledger Entry";
        CompanyInfo: Record "Company Information";
        Cust: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        ShipToAddr: Record "Ship-to Address";
        cdSelltoCust: Code[20];
        cdShortkut: Code[20];
        cdNo: Code[20];
        RTBtype: Text[50];
        BillDisc: Text[250];
        CurryCode: Code[10];
        InvType: Option ,TAXABLE,"NON-TAXABLE",MIXED;
        AdjustagnstADv: Decimal;
        ProfChrgAmt: Decimal;
        ReimbursableExpAmt: Decimal;
        ConfirmationReference: Text[250];
        R_SH: Record "Sales Header";
        R_SH1: Record "Sales Header";
        R_SHHistory: Record "Sales Header History";
        PostingDate: Date;
        InvNo: Code[30];
        VarInvType: Option;
        VarAdjustagnstADv: Decimal;
        VarProfChrgAmt: Decimal;
        VarReimbursableExpAmt: Decimal;
        VarPostingDate: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        RefNo := rtb_number;
        Clear(R_SH);
        R_SH.Reset;
        R_SH.Init;
        if RTBtype = 'Advance' then
            R_SH."Document Type" := R_SH."Document Type"::Order
        else
            R_SH."Document Type" := R_SH."Document Type"::Invoice;
        R_SH."No." := rtb_number;
        R_SH."Posting Date" := WorkDate;
        R_SH."Document Date" := WorkDate;
        R_SH."Due Date" := WorkDate;
        R_SH.Validate("Sell-to Customer No.", client_id);

        if adjust_against_adv = '' then
            VarAdjustagnstADv := 0
        else
            Evaluate(VarAdjustagnstADv, adjust_against_adv);

        if professional_fees = '' then
            VarProfChrgAmt := 0
        else
            Evaluate(VarProfChrgAmt, professional_fees);

        if reference_amount = '' then
            VarReimbursableExpAmt := 0
        else
            Evaluate(VarReimbursableExpAmt, reference_amount);

        if rtb_date <> '' then begin
            Evaluate(Year, CopyStr(rtb_date, 1, 4));
            Evaluate(Month, CopyStr(rtb_date, 6, 2));
            Evaluate(Day, CopyStr(rtb_date, 9, 2));
            VarPostingDate := DMY2Date(Day, Month, Year);
        end;

        R_SH."RTB Type" := rtb_type;
        R_SH.Validate("Invoice Type", VarInvType);
        R_SH."Posting No. Series" := 'INV';
        if currency <> 'INR' then
            R_SH.Validate("Currency Code", currency);
        R_SH."Adjust Against Adv." := VarAdjustagnstADv;
        R_SH."Bill Description" := bill_description;
        R_SH."Prof. Chrg. Amt." := VarProfChrgAmt;
        if VarReimbursableExpAmt = 0 then
            R_SH."Reimbursable Exp. Amt." := 0
        else
            R_SH."Reimbursable Exp. Amt." := VarReimbursableExpAmt;

        R_SH."Confirmation Reference" := confirmation_reference;
        R_SH."Posting Date" := VarPostingDate;
        R_SH."Posting No." := posting_no;
        if not R_SH.Insert(true) then
            R_SH.Modify;

        R_SH1.Copy(R_SH);
        R_SH1.Validate("Shortcut Dimension 2 Code", case_id);
        R_SH1.Modify(true);
    end;

    procedure GetValue(Path: Text[100]; JTokenIn: JsonToken): Text[100]
    var
        JTokenOut: JsonToken;
    begin
        if not JTokenIn.SelectToken(Path, JTokenOut) then
            exit;
        JTokenIn.SelectToken(Path, JTokenOut);
        if JTokenOut.AsValue().IsNull then
            exit;
        exit(CopyStr(JTokenOut.AsValue().AsText(), 1, 100));
    end;

    procedure GetReference(): Text[100]
    begin
        exit(RefNo);
    end;

    procedure GetMethod(): Text[100]
    begin
        exit(Proc);
    end;

    procedure GenPracticeDim()
    var
        Practice: Record "Practice/Area/Deliverables";
        PracticeDimVal: Record "Dimension Value";
        AreaDimVal: Record "Dimension Value";
        DocDimVal: Record "Dimension Value";
        ActivityDimVal: Record "Dimension Value";
        PracticeNo: Code[20];
        AreaNo: Code[20];
        DocumentNo: Code[20];
        ActivityNo: Code[20];
    begin
        Practice.Reset;
        if Practice.FindSet then
            repeat
                PracticeDimVal.Reset;
                PracticeDimVal.SetRange("Dimension Code", 'PRACTICE');
                if PracticeDimVal.FindLast then
                    PracticeNo := IncStr(PracticeDimVal.Code)
                else
                    PracticeNo := 'P00001';

                PracticeDimVal.Reset;
                PracticeDimVal.SetRange("Dimension Code", 'PRACTICE');
                PracticeDimVal.SetRange(Name, Practice."Practice Name");
                if not PracticeDimVal.FindFirst then begin
                    PracticeDimVal.Init;
                    PracticeDimVal."Dimension Code" := 'PRACTICE';
                    PracticeDimVal.Code := PracticeNo;
                    PracticeDimVal.Name := Practice."Practice Name";
                    PracticeDimVal.Insert;
                end;

                AreaDimVal.Reset;
                AreaDimVal.SetRange("Dimension Code", 'AREA');
                if AreaDimVal.FindLast then
                    AreaNo := IncStr(AreaDimVal.Code)
                else
                    AreaNo := 'A00001';

                AreaDimVal.Reset;
                AreaDimVal.SetRange("Dimension Code", 'AREA');
                AreaDimVal.SetRange(Name, Practice."Area Name");
                if not AreaDimVal.FindFirst then begin
                    AreaDimVal.Init;
                    AreaDimVal."Dimension Code" := 'AREA';
                    AreaDimVal.Code := AreaNo;
                    AreaDimVal.Name := Practice."Area Name";
                    AreaDimVal.Insert;
                end;

                DocDimVal.Reset;
                DocDimVal.SetRange("Dimension Code", 'DOCUMENT');
                if DocDimVal.FindLast then
                    DocumentNo := IncStr(DocDimVal.Code)
                else
                    DocumentNo := 'D00001';

                DocDimVal.Reset;
                DocDimVal.SetRange("Dimension Code", 'DOCUMENT');
                DocDimVal.SetRange(Name, Practice."Document Name");
                if not DocDimVal.FindFirst then begin
                    DocDimVal.Init;
                    DocDimVal."Dimension Code" := 'DOCUMENT';
                    DocDimVal.Code := DocumentNo;
                    DocDimVal.Name := Practice."Document Name";
                    DocDimVal.Insert;
                end;

                ActivityDimVal.Reset;
                ActivityDimVal.SetRange("Dimension Code", 'ACTIVITY');
                if ActivityDimVal.FindLast then
                    ActivityNo := IncStr(ActivityDimVal.Code)
                else
                    ActivityNo := 'A00001';

                ActivityDimVal.Reset;
                ActivityDimVal.SetRange("Dimension Code", 'ACTIVITY');
                ActivityDimVal.SetRange(Name, Practice."Type of Activity");
                if not ActivityDimVal.FindFirst then begin
                    ActivityDimVal.Init;
                    ActivityDimVal."Dimension Code" := 'ACTIVITY';
                    ActivityDimVal.Code := ActivityNo;
                    ActivityDimVal.Name := Practice."Type of Activity";
                    ActivityDimVal.Insert;
                end;

            until Practice.Next = 0;
    end;


    procedure GenForumDim()
    var
        ForumInfo: Record "Forum Info";
        ForumDimVal: Record "Dimension Value";
        SForumDimVal: Record "Dimension Value";
        FCityDimVal: Record "Dimension Value";
        ForumNo: Code[20];
        SForumNo: Code[20];
        FCityNo: Code[20];
    begin
        ForumInfo.Reset;
        ForumInfo.FindFirst;
        repeat
            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code", 'FORUM');
            if ForumDimVal.FindLast then
                ForumNo := IncStr(ForumDimVal.Code)
            else
                ForumNo := 'F00001';

            ForumDimVal.Reset;
            ForumDimVal.SetRange("Dimension Code", 'FORUM');
            ForumDimVal.SetRange(Name, CopyStr(ForumInfo."Forum Name", 1, MaxStrLen(ForumDimVal.Name))); // 001
            if not ForumDimVal.FindFirst then begin
                ForumDimVal.Init;
                ForumDimVal."Dimension Code" := 'FORUM';
                ForumDimVal.Code := ForumNo;
                ForumDimVal.Name := ForumInfo."Forum Name";
                ForumDimVal.Insert;
            end;

            SForumDimVal.Reset;
            SForumDimVal.SetRange("Dimension Code", 'SUBFORUM');
            if SForumDimVal.FindLast then
                SForumNo := IncStr(SForumDimVal.Code)
            else
                SForumNo := 'SF00001';

            SForumDimVal.Reset;
            SForumDimVal.SetRange("Dimension Code", 'SUBFORUM');
            SForumDimVal.SetRange(Name, ForumInfo."Sub Forum");
            if not SForumDimVal.FindFirst then begin
                SForumDimVal.Init;
                SForumDimVal."Dimension Code" := 'SUBFORUM';
                SForumDimVal.Code := SForumNo;
                SForumDimVal.Name := ForumInfo."Sub Forum";
                SForumDimVal.Insert;
            end;

            FCityDimVal.Reset;
            FCityDimVal.SetRange("Dimension Code", 'FORUMCITY');
            if FCityDimVal.FindLast then
                FCityNo := IncStr(FCityDimVal.Code)
            else
                FCityNo := 'FC00001';

            FCityDimVal.Reset;
            FCityDimVal.SetRange("Dimension Code", 'FORUMCITY');
            FCityDimVal.SetRange(Name, ForumInfo."Forum City");
            if not FCityDimVal.FindFirst then begin
                FCityDimVal.Init;
                FCityDimVal."Dimension Code" := 'FORUMCITY';
                FCityDimVal.Code := FCityNo;
                FCityDimVal.Name := ForumInfo."Forum City";
                FCityDimVal.Insert;
            end;
        until ForumInfo.Next = 0;
    end;


    procedure UpdateDimOnRTB()
    var
        SHeader: Record "Sales Header";
        CaseDimVal: Record "Dimension Value";
        BrnDimVal: Record "Dimension Value";
        ProcessDimVal: Record "Dimension Value";
        DocDimVal: Record "Dimension Value";
        ActivityDimVal: Record "Dimension Value";
        SolutionDimVal: Record "Dimension Value";
        PracticeDimVal: Record "Dimension Value";
        AreaDimVal: Record "Dimension Value";
        ForumDimVal: Record "Dimension Value";
        SForumDimVal: Record "Dimension Value";
        FCityDimVal: Record "Dimension Value";
        Owner1DimVal: Record "Dimension Value";
        Owner2DimVal: Record "Dimension Value";
        TableID: Integer;
        Employee: Record Employee;
    begin
        SHeader.Reset;
        SHeader.SetFilter(SHeader."Document Type", '1|2');
        SHeader.SetFilter("Shortcut Dimension 1 Code", '');
        SHeader.SetFilter("Shortcut Dimension 2 Code", '<>%1', '');
        if SHeader.FindFirst then begin
            repeat
                CaseDimVal.Reset;
                CaseDimVal.SetRange("Dimension Code", 'CASE');
                CaseDimVal.SetRange(Code, SHeader."Shortcut Dimension 2 Code");
                if CaseDimVal.FindFirst then begin
                    //Branch Dimension
                    BrnDimVal.Reset;
                    BrnDimVal.SetRange("Dimension Code", 'BRANCH');
                    BrnDimVal.SetRange(Name, CaseDimVal."Case-Branch");
                    if BrnDimVal.FindFirst then begin
                        SHeader.Validate("Shortcut Dimension 1 Code", BrnDimVal.Code);
                        SHeader.Modify;
                    end;
                end;
            until SHeader.Next = 0;
        end;
    end;


    procedure GenOwnerDim()
    var
        Emp: Record Employee;
        Owner1DimVal: Record "Dimension Value";
        Owner2DimVal: Record "Dimension Value";
    begin
        Emp.Reset;
        if Emp.FindSet then
            repeat
                if Emp."Employee Role" in ['Owner1', 'Owner2'] then begin
                    Owner1DimVal.Reset;
                    Owner1DimVal.SetRange("Dimension Code", 'OWNER1');
                    Owner1DimVal.SetRange(Code, Emp."No.");
                    if not Owner1DimVal.FindFirst then begin
                        Owner1DimVal.Init;
                        Owner1DimVal."Dimension Code" := 'OWNER1';
                        Owner1DimVal.Code := Emp."No.";
                        Owner1DimVal.Name := Emp."First Name";
                        Owner1DimVal."Job Title" := Emp."Job Title";
                        Owner1DimVal."Employee Role" := Emp."Employee Role";
                        Owner1DimVal.Designation := Emp.Designation;
                        Owner1DimVal."Reporting To" := Emp."Reporting To";
                        Owner1DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner1DimVal."Group-Head" := Emp."Group ID";
                        Owner1DimVal."Region ID" := Emp."Region ID";
                        Owner1DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner1DimVal."HR Code" := Emp."HR Code";
                        Owner1DimVal."Full Name" := Emp."Full Name";
                        Owner1DimVal.Insert(true);
                    end;
                end;
                if Emp."Employee Role" in ['Owner2'] then begin
                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'OWNER2');
                    Owner2DimVal.SetRange(Code, Emp."No.");
                    if not Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Init;
                        Owner2DimVal."Dimension Code" := 'OWNER2';
                        Owner2DimVal.Code := Emp."No.";
                        Owner2DimVal.Name := Emp."First Name";
                        Owner2DimVal."Job Title" := Emp."Job Title";
                        Owner2DimVal."Employee Role" := Emp."Employee Role";
                        Owner2DimVal.Designation := Emp.Designation;
                        Owner2DimVal."Reporting To" := Emp."Reporting To";
                        Owner2DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Emp."Group ID";
                        Owner2DimVal."Region ID" := Emp."Region ID";
                        Owner2DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner2DimVal."HR Code" := Emp."HR Code";
                        Owner2DimVal."Full Name" := Emp."Full Name";
                        Owner2DimVal.Insert(true);
                    end;
                end;
                if Emp."Employee Role" = 'Associate' then begin
                    Owner2DimVal.Reset;
                    Owner2DimVal.SetRange("Dimension Code", 'ASSOCIATES');
                    Owner2DimVal.SetRange(Code, Emp."No.");
                    if not Owner2DimVal.FindFirst then begin
                        Owner2DimVal.Init;
                        Owner2DimVal."Dimension Code" := 'ASSOCIATES';
                        Owner2DimVal.Code := Emp."No.";
                        Owner2DimVal.Name := Emp."First Name";
                        Owner2DimVal."Job Title" := Emp."Job Title";
                        Owner2DimVal."Employee Role" := Emp."Employee Role";
                        Owner2DimVal.Designation := Emp.Designation;
                        Owner2DimVal."Reporting To" := Emp."Reporting To";
                        Owner2DimVal."Case-Branch" := Emp."Global Dimension 1 Code";
                        Owner2DimVal."Group-Head" := Emp."Group ID";
                        Owner2DimVal."Region ID" := Emp."Region ID";
                        Owner2DimVal."Company E-Mail" := Emp."Company E-Mail";
                        Owner2DimVal."HR Code" := Emp."HR Code";
                        Owner2DimVal."Full Name" := Emp."Full Name";
                        Owner2DimVal.Insert(true);
                    end;
                end;
            until Emp.Next = 0;
    end;


    procedure UpdateCustPosting()
    var
        Cust: Record Customer;
        CustTemplate: Record "Customer Templ.";
    begin
        Cust.Reset;
        Cust.SetFilter("Gen. Bus. Posting Group", '');
        if Cust.FindFirst then
            repeat
                CustTemplate.Reset;
                //CustTemplate.SetRange(, true);
                if CustTemplate.FindFirst then begin
                    if Cust."Gen. Bus. Posting Group" = '' then
                        Cust."Gen. Bus. Posting Group" := CustTemplate."Gen. Bus. Posting Group";
                    if Cust."VAT Bus. Posting Group" = '' then
                        Cust."VAT Bus. Posting Group" := CustTemplate."VAT Bus. Posting Group";
                    if Cust."Customer Posting Group" = '' then
                        Cust."Customer Posting Group" := CustTemplate."Customer Posting Group";
                    Cust.Modify;
                end;
            until Cust.Next = 0;
    end;

    procedure GenVenDim()
    var
        VenDim: Record "Dimension Value";
        Ven: Record Vendor;
    begin
        Ven.Reset;
        Ven.FindFirst;
        repeat
            VenDim.Reset;
            VenDim.SetRange("Dimension Code", 'ENTITY');
            VenDim.SetRange(VenDim.Code, Ven."No.");
            if not VenDim.FindFirst then begin
                VenDim.Init;
                VenDim."Dimension Code" := 'ENTITY';
                VenDim.Code := Ven."No.";
                VenDim.Name := Ven.Name;
                VenDim.Insert(true);
            end;
        until Ven.Next = 0;
    end;


    procedure GenCustDim()
    var
        Cust: Record Customer;
        CustDim: Record "Dimension Value";
    begin
        Cust.Reset;
        Cust.SetFilter("No.", '>%1', '');
        if Cust.FindFirst then
            repeat
                CustDim.Reset;
                CustDim.SetRange("Dimension Code", 'ENTITY');
                CustDim.SetRange(CustDim.Code, Cust."No.");
                if not CustDim.FindFirst then begin
                    CustDim.Init;
                    CustDim."Dimension Code" := 'ENTITY';
                    CustDim.Code := Cust."No.";
                    CustDim.Name := Cust.Name;
                    CustDim.Insert(true);
                end;
            until Cust.Next = 0;
    end;

    var
        RefNo: Text[50];
        Method: Text[50];
        String: Text;
        Proc: Text[20];
        client_id: Text;
        case_id: Text;
        rtb_number: Text;
        rtb_type: Text;
        bill_description: Text;
        currency: Text;
        invoice_type: Text;
        adjust_against_adv: Text;
        professional_fees: Text;
        reference_amount: Text;
        confirmation_reference: Text;
        posting_no: Text;
        rtb_date: Text;
        billed_by: Text;

        // >> Line
        rtb_number_line: Text;
        installment_types: Text;
        description: Text;
        UOM: Text;
        count: Text;
        professional_rates: Text;
        amount: Text;
        Other_Detail1: Text;
        Other_Detail2: Text;
        Supporting_Bill_No: Text;
        Supporting_Bill_Date: Text;
        Date_of_Expense: Text;
        Service_Tax_Applicable: Text;
        // >> Branch
        branch_id: Text;
        branch_region_id: Text;
        branch_name: Text;
        branch_head: Text;
        // Cancel RTB

        RTBNo: Text[20];
        InvoiceNo: Text[20];
        CRTBNo: Text[20];
        CRTBReason: Text[250];
        region_id: Text;
        region_name: Text;
        region_head: Text;
        group_id: Text;
        group_name: Text;
        group_head: Text;
        name: Text;
        sub_forum: Text;
        forum_city: Text;
        client_name: Text;
        client_sector: Text;
        client_old_name: Text;
        client_grp_name: Text;
        classification: Text;
        enrolment_year: Text;
        enrolment_month: Text;
        rain_maker: Text;
        rain_giver: Text;
        pan: Text;
        stc_no: Text;
        service_tax_no: Text;
        central_excise_reg: Text;
        customer_reg_no: Text;
        import_export_no: Text;
        home_page: Text;
        email: Text;
        entity_status: Text;
        client_for: Text;
        office_id: Text;
        office_type: Text;
        address1: Text;
        address2: Text;
        pin_code: Text;
        city: Text;
        district: Text;
        state: Text;
        country: Text;
        phone: Text;
        telex_no: Text;
        fax_no: Text;
        isd: Text;
        std: Text;
        gstin: Text;
        // Contact
        contact_id: Text;
        department: Text;
        designation: Text;
        initials: Text;
        first_name: Text;
        middle_name: Text;
        last_name: Text;
        phone_no: Text;
        phone_no_2: Text;
        mobile_no: Text;
        mobile_no_2: Text;
        pref_way_of_comm: Text;
        time_slot: Text;
        // Practice
        category: Text;
        sub_category: Text;
        document: Text;
        type_of_activity: Text;
        // Process
        id: Text;
        // Case

        matter_type: Text;
        case_Document_Name: Text;
        case_activity_type: Text;
        matter_sub_type: Text;
        case_branch: Text;

        case_rain_maker: Text;
        case_rain_giver: Text;
        case_forum: Text;
        case_subforum: Text;
        case_creation_date: Text;
        case_Referance_Type: Text;
        case_number: Text;
        case_forum_city: Text;
        case_target_forum: Text;
        case_target_forum_city: Text;
        case_target_subforum: Text;
        case_manager: Text;
        case_partner: Text;
        correspondance_contact_id: Text;
        billing_contact_id: Text;
        group_code: Text;
        practice_code: Text;
        resource: Text;
        //Advocate
        employee_id: Text;
        employee_name: Text;
        reporting_to: Text;
        role: Text;
        job_title: Text;
        company_email: Text;
        branch: Text;
        solution: Text;
        domain: Text;
        hrcode: Text;

}