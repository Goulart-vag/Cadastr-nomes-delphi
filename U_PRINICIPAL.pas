unit U_PRINICIPAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TFRM_PRINCIPAL = class(TForm)
    LBL_NAME: TLabel;
    EDT_NAME: TEdit;
    BTN_NAME: TButton;
    GRD_NAME: TStringGrid;
    BTN_EDITAR: TButton;
    BTN_EXCLUIR: TButton;
    procedure BTN_NAMEClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GRD_NAMESelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BTN_EDITARClick(Sender: TObject);
    procedure BTN_EXCLUIRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_PRINCIPAL: TFRM_PRINCIPAL;
  data:array of string;
  selectedCell:integer;

implementation

{$R *.dfm}


procedure DeleteArrayElement(var list: array of string; index: Integer);
var
  i:integer;
begin
  if (index >= 0) and (index < Length(list)) then
  begin
    for i := index to High(list) - 1 do
    begin
      list[i] := list[i + 1];
    end;
    list[High(list)] := '';

  end;
end;

procedure mapGrid(list:array of string; grid:TStringGrid);
var
  i:integer;
begin
  for i := 0 to Length(list) - 1 do
  begin
    grid.Cells[0, i +1] := list[i];
  end;
end;

procedure clearGrid(grid:TStringGrid);
var
  i:integer;
begin
  for i := 0 to grid.RowCount - 1 do
  begin
    grid.Cells[0, i +1] := '';
  end;
end;

procedure TFRM_PRINCIPAL.BTN_NAMEClick(Sender: TObject);
var
  name:string;


begin
  name := EDT_NAME.Text;
  setLength(data, length(data) + 1);
  data[High(data)] := name;
  mapGrid(data, GRD_NAME);
  EDT_NAME.Clear;
  EDT_NAME.SetFocus;
  GRD_NAME.RowCount := length(data)+2;

end;



procedure TFRM_PRINCIPAL.FormActivate(Sender: TObject);
begin
  GRD_NAME.RowCount := 5;
  GRD_NAME.Cells[0,0] := 'Nomes';
end;

procedure TFRM_PRINCIPAL.GRD_NAMESelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  EDT_NAME.Text := GRD_NAME.Cells[ACol, ARow];
  selectedCell := ARow - 1;
end;

procedure TFRM_PRINCIPAL.BTN_EDITARClick(Sender: TObject);
var
      name:string;
begin
      name := EDT_NAME.Text;
      data[selectedCell] := name;
      mapGrid(data, GRD_NAME);
      EDT_NAME.Clear;
      EDT_NAME.SetFocus;
end;

procedure TFRM_PRINCIPAL.BTN_EXCLUIRClick(Sender: TObject);
begin
  DeleteArrayElement(data, selectedCell);
  clearGrid(GRD_NAME);
  mapGrid(data, GRD_NAME);
  EDT_NAME.Clear;
end;

end.
