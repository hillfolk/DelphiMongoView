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
        RzEdit1: TRzEdit;
        btnSearch: TRzButton;
        procedure ToggleSwitch1Click(Sender: TObject);
        procedure btnSearchClick(Sender: TObject);
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
begin
    if ToggleSwitch1.State = tssOn then
    begin
        Client := TgoMongoClient.Create('localhost');

        Database := Client.GetDatabase('QG3');
        Log('Connected:' + Database.Name);

        Collection := Database.GetCollection('restaurants');
        Log('Collection:' + Collection.Name);

    end;
end;

end.
