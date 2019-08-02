unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SendKeys;
    procedure Start;
    procedure Stop;
  private
    { Private declarations }
    ProgState:integer; //0: не назначена клавиша, 1 - ожидает назначения, 2 - назначена
    CurrentKey:Word;
    KeyPressed:Char;
    Started:Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{$REGION 'FormProcs'}

  procedure TForm1.FormShow(Sender: TObject);
  begin
      ProgState:=0;
      Started:=False;
  end;

  function KeycodesToBtnName (keycode: integer): string;
  begin
  case keycode of
      8: Result:='BackSpace';
      9: Result:='Tab';
      13: Result:='Enter';
      20: Result:='CapsLock';
      27: Result:='Esc';
      32: Result:='пробел';
      33: Result:='PageUp';
      34: Result:='PageDown';
      35: Result:='End';
      36: Result:='Home';
      37: Result:='←';
      38: Result:='↑';
      39: Result:='→';
      40: Result:='↓';
      44: Result:='PrintScreen';
      45: Result:='Insert';
      46: Result:='Delete';
      48: Result:='0';
      49: Result:='1';
      50: Result:='2';
      51: Result:='3';
      52: Result:='4';
      53: Result:='5';
      54: Result:='6';
      55: Result:='7';
      56: Result:='8';
      57: Result:='9';
      65: Result:='A';
      66: Result:='B';
      67: Result:='C';
      68: Result:='D';
      69: Result:='E';
      70: Result:='F';
      71: Result:='G';
      72: Result:='H';
      73: Result:='I';
      74: Result:='J';
      75: Result:='K';
      76: Result:='L';
      77: Result:='M';
      78: Result:='N';
      79: Result:='O';
      80: Result:='P';
      81: Result:='Q';
      82: Result:='R';
      83: Result:='S';
      84: Result:='T';
      85: Result:='U';
      86: Result:='V';
      87: Result:='W';
      88: Result:='X';
      89: Result:='Y';
      90: Result:='Z';
      91: Result:='Win(Л)';
      92: Result:='Win(П)';
      96: Result:='Num 0';
      97: Result:='Num 1';
      98: Result:='Num 2';
      99: Result:='Num 3';
      100: Result:='Num 4';
      101: Result:='Num 5';
      102: Result:='Num 6';
      103: Result:='Num 7';
      104: Result:='Num 8';
      105: Result:='Num 9';
      106: Result:='Num *';
      107: Result:='Num +';
      109: Result:='Num -';
      110: Result:='Num ,';
      111: Result:='Num /';
      112: Result:='F1';
      113: Result:='F2';
      114: Result:='F3';
      115: Result:='F4';
      116: Result:='F5';
      117: Result:='F6';
      118: Result:='F7';
      119: Result:='F8';
      120: Result:='F9';
      121: Result:='F10';
      122: Result:='F11';
      123: Result:='F12';
      124: Result:='F13';
      125: Result:='F14';
      126: Result:='F15';
      127: Result:='F16';
      128: Result:='F17';
      129: Result:='F18';
      130: Result:='F19';
      131: Result:='F20';
      132: Result:='F21';
      133: Result:='F22';
      134: Result:='F23';
      135: Result:='F24';
      144: Result:='Numlock';
      166: Result:='Назад';
      167: Result:='Вперед';
      168: Result:='Обновить';
      169: Result:='Стоп';
      170: Result:='Поиск';
      171: Result:='Избранное';
      172: Result:='Дом. страница';
      173: Result:='Гр. выкл';
      174: Result:='Гр. ниже';
      175: Result:='Гр. выше';
      176: Result:='След.';
      177: Result:='Пред.';
      178: Result:='Остановить проигрывание';
      179: Result:='Пауза';
      180: Result:='Почта';
      181: Result:='Выбор медиа';
      182: Result:='Прил. 1';
      183: Result:='Прил. 2';
  end;
  end;

  procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    var buttontext: String;
  begin
      if (ProgState =1)
      then begin
          buttontext:='';
          CurrentKey:=key;
          buttontext:=IntToStr(key)+' ('+KeycodesToBtnName(key)+')';
          Button2.Caption:=buttontext;
          KeyPressed:=chr(0);
          ProgState:=2;
          Button1.Enabled:=true;
          if Edit1.Text='0'
          then Button1.Enabled:=false;
          Label1.Visible:=true;
          Label2.Visible:=true;
          Edit1.Visible:=true;
          Label3.Visible:=true;
      end;

  end;

{$ENDREGION}

procedure TForm1.Start;
begin
    if (not started) and (Timer1.Interval>0)
    then begin
        Timer1.Enabled:=True;
        Button1.Caption:='Завершить';
        Started:=true;
    end;
end;

procedure TForm1.Stop;
begin
    if started
    then begin
        Timer1.Enabled:=False;
        Button1.Caption:='Начать';
        Started:=false;
        Timer1.Enabled:=False;
    end;
end;

procedure TForm1.SendKeys;
var
  Inp: TInput;
  I: Integer;
begin
    Inp.Itype := INPUT_KEYBOARD;
    Inp.ki.wVk := CurrentKey;
    Inp.ki.dwFlags := 0;
    SendInput(1, Inp, SizeOf(Inp));
    Inp.Itype := INPUT_KEYBOARD;
    Inp.ki.wVk := CurrentKey;
    Inp.ki.dwFlags := KEYEVENTF_KEYUP;
    SendInput(1, Inp, SizeOf(Inp));
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
    if Edit1.Text='' then Edit1.Text:='0';
    if Edit1.Text='0' then Stop;
    Timer1.Interval:= strtoint(Edit1.Text)*1000;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not started then
  begin
      Start;
  end
  else begin
      Stop;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if (ProgState =0 ) or (ProgState =2 )
    then begin
        ProgState :=1;
        Label1.Visible:=false;
        Label2.Visible:=false;
        Edit1.Visible:=false;
        Label3.Visible:=false;
        Button2.Caption:='Нажмите';
        Button1.Enabled:=false;
    end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    SendKeys;
end;

end.
