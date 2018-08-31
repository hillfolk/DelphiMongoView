unit uMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzCmboBx, RzEdit,
    Vcl.WinXCtrls, Vcl.Mask, Vcl.ExtCtrls, RzPanel,
    Vcl.Grids, RzGrids, Grijjy.MongoDB, RzButton, Grijjy.Bson,
    Grijjy.MongoDB.Queries, System.DateUtils;

type
    TfxMongoDBView = class(TForm)
        RzPanel1: TRzPanel;
        edtAddr: TRzEdit;
        ToggleSwitch1: TToggleSwitch;
        nedtPort: TRzNumericEdit;
        cbDocument: TRzComboBox;
        mLog: TRzMemo;
        edtObjectId: TRzEdit;
        btnSearch: TRzButton;
        procedure ToggleSwitch1Click(Sender: TObject);
        procedure btnSearchClick(Sender: TObject);
        procedure cbDocumentChange(Sender: TObject);
    private
        { Private declarations }
        Client: IgoMongoClient;
        Database: IgoMongoDatabase;
        Collection: IgoMongoCollection;
        procedure Log(ALog: string);
    public
        { Public declarations }
        procedure InsertADoucment;
    end;

var
    fxMongoDBView: TfxMongoDBView;

implementation

{$R *.dfm}

procedure TfxMongoDBView.btnSearchClick(Sender: TObject);
begin
    InsertADoucment;
end;

procedure TfxMongoDBView.cbDocumentChange(Sender: TObject);
begin
    Database := Client.GetDatabase(cbDocument.Text);
end;

procedure TfxMongoDBView.InsertADoucment;
var
    Doc: TgoBsonDocument;
    LDoc: TgoBsonType;
    Collection: IgoMongoCollection;
    Count: Integer;
begin

    Collection := Database.GetCollection('restaurants');
    Count := 0;

    for Doc in Collection.Find() do
    begin
        Inc(Count);
        Log(Doc.ToJson);
    end;

end;

procedure TfxMongoDBView.Log(ALog: string);
begin
    if Length(ALog) > 0 then
    begin
        mLog.Lines.BeginUpdate;
        mLog.Lines.Add(ALog);
        mLog.Lines.EndUpdate;
    end;
end;

procedure TfxMongoDBView.ToggleSwitch1Click(Sender: TObject);
var
    LDatabases: TArray<TgoBsonDocument>;
    LBsonType: TgoBsonValue;
    i: Integer;
begin
    if ToggleSwitch1.State = tssOn then
    begin
        Client := TgoMongoClient.Create(edtAddr.Text);

        LDatabases := Client.ListDatabases;
        if Length(LDatabases) > 0 then
        begin
            for i := 0 to Length(LDatabases) - 1 do
            begin
                cbDocument.Add(LDatabases[i].Get('name', LBsonType).ToString());
            end;
            cbDocument.ItemIndex := 0;
            Database := Client.GetDatabase(cbDocument.Text);

        end;

    end;
end;

end.
