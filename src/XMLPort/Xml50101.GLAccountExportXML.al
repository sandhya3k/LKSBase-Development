xmlport 50101 "G/L Account Export XML"
//PAN UPG Rename from 90000 to 50101
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Xml;

    schema
    {
        textelement(Root)
        {
            tableelement("G/L Account 3"; "G/L Account 3")
            {
                CalcFields = "Balance at Date", "Net Change";
                XmlName = 'GLAccount';
                SourceTableView = SORTING("No.") WHERE("Account Type" = FILTER(Posting | "End-Total"));
                fieldelement(No; "G/L Account 3"."No.")
                {
                }
                fieldelement(Name; "G/L Account 3".Name)
                {
                }
                fieldelement(BalanceAtDate; "G/L Account 3"."Balance at Date")
                {
                }
                fieldelement(NetChange; "G/L Account 3"."Net Change")
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

