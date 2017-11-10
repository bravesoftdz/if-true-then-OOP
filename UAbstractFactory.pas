unit UAbstractFactory;

interface

type

  AbstractButton = class
    function print: string; virtual; abstract;
  end;

  WinButton = class(AbstractButton)
    function print: string; override;
  end;

  MacButton = class(AbstractButton)
    function print: string; override;
  end;

  AbstractWindow = class
    function print: string; virtual; abstract;
  end;

  WinWindow = class(AbstractWindow)
    function print: string; override;
  end;

  MacWindow = class(AbstractWindow)
    function print: string; override;
  end;

  AbstractFactory = class
    function printButton(fAbstractButton: AbstractButton): string;
      virtual; abstract;
    function printWindow(fAbstractWindow: AbstractWindow): string;
      virtual; abstract;
  end;

  WinFactory = class(AbstractFactory)
    function printButton(fAbstractButton: AbstractButton): string; override;
    function printWindow(fAbstractWindow: AbstractWindow): string; override;
  end;

  MacFactory = class(AbstractFactory)
    function printButton(fAbstractButton: AbstractButton): string; override;
    function printWindow(fAbstractWindow: AbstractWindow): string; override;
  end;

implementation

{ WinFactory }

function WinFactory.printButton(fAbstractButton: AbstractButton): string;
begin
  fAbstractButton := WinButton.Create;
  result := fAbstractButton.print;
end;

function WinFactory.printWindow(fAbstractWindow: AbstractWindow): string;
begin
  fAbstractWindow := WinWindow.Create;
  result := fAbstractWindow.print;
end;

{ MacFactory }

function MacFactory.printButton(fAbstractButton: AbstractButton): string;
begin
  fAbstractButton := MacButton.Create;
  result := fAbstractButton.print;
end;

function MacFactory.printWindow(fAbstractWindow: AbstractWindow): string;
begin
  fAbstractWindow := MacWindow.Create;
  result := fAbstractWindow.print;
end;

{ WinButton }

function WinButton.print: string;
begin
  result := 'WinButton';
end;

{ MacButton }

function MacButton.print: string;
begin
  result := 'MacButton';
end;

{ WinWindow }

function WinWindow.print: string;
begin
  result := 'WinWindow';
end;

{ MacWindow }

function MacWindow.print: string;
begin
  result := 'MacWindow';
end;

end.
