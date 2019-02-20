program MongoDBView;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fxMongoDBView},
  Grijjy.MongoDB in 'DelphiMongoDB\Grijjy.MongoDB.pas',
  Grijjy.MongoDB.Protocol in 'DelphiMongoDB\Grijjy.MongoDB.Protocol.pas',
  Grijjy.MongoDB.Queries in 'DelphiMongoDB\Grijjy.MongoDB.Queries.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfxMongoDBView, fxMongoDBView);
  Application.Run;
end.
