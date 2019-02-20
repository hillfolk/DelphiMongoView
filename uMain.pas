unit uMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzCmboBx, RzEdit,
    Vcl.WinXCtrls, Vcl.Mask, Vcl.ExtCtrls, RzPanel,
    Vcl.Grids, RzGrids, Grijjy.MongoDB, RzButton, Grijjy.Bson,
    Grijjy.MongoDB.Queries, System.DateUtils, System.Threading;

type
    TfxMongoDBView = class(TForm)
        RzPanel1 : TRzPanel;
        edtAddr : TRzEdit;
        ToggleSwitch1 : TToggleSwitch;
        nedtPort : TRzNumericEdit;
        cbDatabase : TRzComboBox;
        mLog : TRzMemo;
        edtCollections : TRzEdit;
        btnSearch : TRzButton;
        cbLoop : TCheckBox;
        tmrLoop : TTimer;
        neCount : TRzNumericEdit;
        Label1 : TLabel;
        procedure ToggleSwitch1Click(Sender : TObject);
        procedure btnSearchClick(Sender : TObject);
        procedure cbDatabaseChange(Sender : TObject);
        procedure cbLoopClick(Sender : TObject);
        procedure tmrLoopTimer(Sender : TObject);
    private
        { Private declarations }
        FLock      : Integer;
        Client     : IgoMongoClient;
        Database   : IgoMongoDatabase;
        Collection : IgoMongoCollection;
        procedure Log(ALog : string);
    public
        { Public declarations }
        procedure SearchDocument;
    end;

var
    fxMongoDBView : TfxMongoDBView;

implementation

{$R *.dfm}

procedure TfxMongoDBView.btnSearchClick(Sender : TObject);
begin
    SearchDocument;
end;

procedure TfxMongoDBView.cbDatabaseChange(Sender : TObject);
begin
    Database := Client.GetDatabase(cbDatabase.Text);
end;

procedure TfxMongoDBView.SearchDocument;
var
    Doc        : TgoBsonDocument;
    LDoc       : TgoBsonType;
    Collection : IgoMongoCollection;
    LTask      : ITask;
begin
    if FLock = 0 then begin

        if not Assigned(Database) then begin
            ShowMessage('Please Database Connection');
            exit;
        end;

        LTask := TTask.Create(
            Procedure()
            var
                Doc : TgoBsonDocument;
                Count : Integer;
            begin
                Inc(FLock);
                Collection := Database.GetCollection(edtCollections.Text);
                Count := 0;

                for Doc in Collection.Find() do begin
                    Inc(Count);
                    Log(Doc.ToJson);
                    neCount.Value := Count;
                    Sleep(10);
                end;
                Dec(FLock);
            end);
        LTask.Start;

    end;
end;

procedure TfxMongoDBView.tmrLoopTimer(Sender : TObject);
begin
    SearchDocument;
end;

procedure TfxMongoDBView.cbLoopClick(Sender : TObject);
begin
    tmrLoop.Enabled := cbLoop.Checked;
end;

procedure TfxMongoDBView.Log(ALog : string);
begin
    if Length(ALog) > 0 then begin
        if mLog.Lines.Count > 5000 then begin
            mLog.Clear;
        end;
        mLog.Lines.BeginUpdate;
        mLog.Lines.Insert(0, ALog);
        mLog.Lines.EndUpdate;
    end;
end;

procedure TfxMongoDBView.ToggleSwitch1Click(Sender : TObject);
var
    LDatabases : TArray< TgoBsonDocument >;
    LBsonType  : TgoBsonValue;
    i          : Integer;
begin
    if ToggleSwitch1.State = tssOn then begin
        Client := TgoMongoClient.Create(edtAddr.Text);

        LDatabases := Client.ListDatabases;
        if Length(LDatabases) > 0 then begin
            for i := 0 to Length(LDatabases) - 1 do begin
                cbDatabase.Add(LDatabases[i].Get('name', LBsonType).ToString());
            end;
            cbDatabase.ItemIndex := 0;
            Database             := Client.GetDatabase(cbDatabase.Text);

        end;

    end;
end;

end.
