page 80000 "HTML Blobs"
{
    Caption = 'HTML Blobs';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "HTML Blob RED";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field(HTMLText; HTMLText)
                {
                    Caption = 'HTML';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SaveHTML(HTMLText);
                    end;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    trigger OnAfterGetRecord()
    begin
        HTMLText := GetHTML();
    end;

    var
        HTMLText: Text;
}