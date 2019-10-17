table 80000 "HTML Blob RED"
{
    DataClassification = ToBeClassified;
    Caption = 'HTML Blob';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }
        field(10; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(20; HTML; Blob)
        {
            Caption = 'HTML';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure GetHTML() Result: Text
    var
        StreamIn: InStream;
    begin
        CalcFields(HTML);
        HTML.CreateInStream(StreamIn);
        StreamIn.ReadText(Result);
    end;

    procedure SaveHTML(NewHTML: Text)
    var
        StreamOut: OutStream;
    begin
        Clear(HTML);
        HTML.CreateOutStream(StreamOut);
        StreamOut.WriteText(NewHTML);
        Modify();
    end;
}