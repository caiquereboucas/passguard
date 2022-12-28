unit MainForm;

// TODO: AUTO-BACKUP EVERY START REPLACING OLD BACKUPS
// TODO: VERSION CONTROL

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.AppEvnts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Generics.Collections;

type
  TInfo = class
  private
    FId: Integer;
    FApp: String;
    FContent: String;
  public
    property Id: Integer read FId;
    property App: String read FApp;
    property Content: String read FContent;

    constructor Create(Id: Integer; App, Content: string);
    procedure Save(Conn: TFDConnection);

    class procedure Delete(Conn: TFDConnection; Id: Integer);
    class function FindById(Conn: TFDConnection; Id: Integer): TInfo;
    class function FindByApp(Conn: TFDConnection; App: string): TObjectList<TInfo>;
  end;


  TFrmMain = class(TForm)
    BtnClose: TButton;
    MemoContent: TMemo;
    PopupMenu1: TPopupMenu;
    ShowForm: TMenuItem;
    Close1: TMenuItem;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Shape1: TShape;
    Connection: TFDConnection;
    BtnSave: TButton;
    BtnDelete: TButton;
    EdtApp: TEdit;
    BtnClear: TButton;
    ListBox: TListBox;
    procedure EventExitClick(Sender: TObject);
    procedure EventMinimize(Sender: TObject);
    procedure EventShow(Sender: TObject);
    procedure EventFormCreate(Sender: TObject);
    procedure EventSaveClick(Sender: TObject);
    procedure EventDeleteClick(Sender: TObject);
    procedure EventClearClick(Sender: TObject);
    procedure EdtAppChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EventListBoxDblClick(Sender: TObject);
    procedure EventAppKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EventListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EventDefaultKeyPress(Sender: TObject; var Key: Char);
  private
    FSelectedId: Integer;

    procedure CreateDatabase;
    procedure LoadListBox(Filter: string = '');
    procedure LoadSelectListBox;
    procedure Validate(Condition: Boolean; Msg: String; Control: TWinControl);
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.EventFormCreate(Sender: TObject);
begin
  CreateDatabase;
  LoadListBox;
end;

procedure TFrmMain.EventMinimize(Sender: TObject);
begin
  Hide;
  WindowState := wsMinimized;
  TrayIcon1.Visible := True;
end;

procedure TFrmMain.EventShow(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show;
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TFrmMain.Validate(Condition: Boolean; Msg: String;
  Control: TWinControl);
begin
  if Condition then
  begin
    Application.MessageBox(PChar(Msg), 'Warning!', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if Control.CanFocus then
    begin
      Control.SetFocus;
      SendMessage(Handle, EM_SETSEL, 0, -1); // SELECT_ALL
    end;
  end;
end;

procedure TFrmMain.EventExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.EventSaveClick(Sender: TObject);
begin
  Validate(Trim(EdtApp.Text).IsEmpty, 'App is empty!', EdtApp);
  Validate(Trim(MemoContent.Text).IsEmpty, 'Content is empty!', MemoContent);

  with TInfo.Create(FSelectedId, Trim(EdtApp.Text), Trim(MemoContent.Text)) do
    Save(Connection);

  BtnClear.Click;
  LoadListBox;
end;

procedure TFrmMain.EdtAppChange(Sender: TObject);
begin
  LoadListBox(EdtApp.Text);
end;

procedure TFrmMain.EventDefaultKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
  end
  else if Key = #27 then
  begin
    Key := #0;
    BtnClear.Click;
  end;
end;

procedure TFrmMain.EventAppKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if ListBox.Count > 0 then
    begin
      ListBox.ItemIndex := 0;
      LoadSelectListBox;
    end;
    MemoContent.SetFocus;
  end;
end;

procedure TFrmMain.EventDeleteClick(Sender: TObject);
begin
  Validate(FSelectedId = 0, 'Nothing is selected!', EdtApp);
  TInfo.Delete(Connection, FSelectedId);
  BtnClear.Click;
  LoadListBox;
end;

procedure TFrmMain.EventClearClick(Sender: TObject);
begin
  FSelectedId := 0;
  EdtApp.Clear;
  MemoContent.Clear;
  EdtApp.SetFocus;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  BtnClear.Click;
end;

procedure TFrmMain.EventListBoxDblClick(Sender: TObject);
begin
  LoadSelectListBox;
end;

procedure TFrmMain.EventListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN]) and (ListBox.ItemIndex >= 0) then
    LoadSelectListBox;
end;

procedure TFrmMain.LoadListBox(Filter: string);
var
  Info: TInfo;
  Infos: TObjectList<TInfo>;
begin
  Infos := TInfo.FindByApp(Connection, Filter);
  with ListBox.Items do
    try
      BeginUpdate;
      Clear;
      for Info in Infos do
        AddPair(IntToStr(Info.FId), Info.FApp);
    finally
      EndUpdate;
      Infos.Free;
    end;
end;

procedure TFrmMain.LoadSelectListBox;
var
  Info: TInfo;
  I: Integer;
begin
  I := ListBox.ItemIndex;
  if I < 0 then
    Exit;

  FSelectedId := StrToIntDef(ListBox.Items.Names[I], 0);

  Info := TInfo.FindById(Connection, FSelectedId);
  try
    EdtApp.Text := Info.FApp;
    MemoContent.Text := Info.FContent;
  finally
    Info.Free;
  end;
end;

procedure TFrmMain.CreateDatabase;
begin
  Connection.DriverName := 'SQLITE';
  Connection.Params.Values['Database'] := 'data.db';
  Connection.Open;

  if not FileExists('data.db') then
    with TFDQuery.Create(nil) do
      try
        Connection := Self.Connection;
        SQL.Add(
          'CREATE TABLE UTIL ('+
            'ID      INTEGER PRIMARY KEY AUTOINCREMENT,'+
            'APP     TEXT    NOT NULL,'+
            'CONTENT TEXT    NOT NULL'+
          ');');
        ExecSQL;
      finally
        Free;
      end;
end;

{ TInfo }

constructor TInfo.Create(Id: Integer; App, Content: string);
begin
  FId := Id;
  FApp := App;
  FContent := Content;
end;

class procedure TInfo.Delete(Conn: TFDConnection; Id: Integer);
begin
  with TFDQuery.Create(nil) do
    try
      Connection := Conn;
      SQL.Add('DELETE FROM UTIL WHERE ID = :ID');
      ParamByName('ID').AsInteger := Id;
      ExecSQL;
    finally
      Free;
    end;
end;

class function TInfo.FindByApp(Conn: TFDConnection; App: string): TObjectList<TInfo>;
begin
  with TFDQuery.Create(nil) do
    try
      Result := TObjectList<TInfo>.Create;
      try
        Connection := Conn;
        if App.IsEmpty then
        begin
          SQL.Add('SELECT * FROM UTIL ORDER BY APP');
        end
        else
        begin
          SQL.Add('SELECT * FROM UTIL WHERE APP LIKE ''%''||:APP||''%'' ORDER BY APP');
          ParamByName('APP').AsString := App;
        end;

        Open;

        if Eof then
          Exit;

        while not Eof do
        begin
          Result.Add(TInfo.Create(
            FieldByName('ID').AsInteger,
            FieldByName('APP').AsString,
            FieldByName('CONTENT').AsString));
          Next;
        end;
      except
        FreeAndNil(Result);
        raise;
      end;
    finally
      Free;
    end;
end;


class function TInfo.FindById(Conn: TFDConnection; Id: Integer): TInfo;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := Conn;
      SQL.Add('SELECT * FROM UTIL WHERE ID = :ID');
      ParamByName('ID').AsInteger := Id;
      Open;

      if Eof then
        Exit(nil);

      Result := TInfo.Create(
          FieldByName('ID').AsInteger,
          FieldByName('APP').AsString,
          FieldByName('CONTENT').AsString);
    finally
      Free;
    end;
end;

procedure TInfo.Save(Conn: TFDConnection);
begin
  with TFDQuery.Create(nil) do
    try
      Connection := Conn;
      if Id = 0 then
      begin
        SQL.Add('INSERT INTO UTIL(APP, CONTENT) VALUES(:APP, :CONTENT)');
        ParamByName('APP').AsString := App;
        ParamByName('CONTENT').AsString := Content;
        ExecSQL;

        SQL.Clear;
        SQL.Add('SELECT LAST_INSERT_ROWID()');
        Open;
        FId := Fields[0].AsInteger;
      end
      else
      begin
        SQL.Add('UPDATE UTIL SET APP = :APP, CONTENT = :CONTENT WHERE ID = :ID');
        ParamByName('APP').AsString := App;
        ParamByName('CONTENT').AsString := Content;
        ParamByName('ID').AsInteger := Id;
        ExecSQL;
      end;
    finally
      Free;
    end;
end;

end.
