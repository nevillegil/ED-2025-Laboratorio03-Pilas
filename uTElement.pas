unit uTElement;

interface

type
    TElement = record
        data1: integer;
        data2: string[50];
    end;

function toString(e: TElement): string;

implementation

uses sysutils;

function toString(e: TElement): string;
begin
    toString := '(' + IntToStr(e.data1) + ', ' + e.data2 + ')';
end;

end.