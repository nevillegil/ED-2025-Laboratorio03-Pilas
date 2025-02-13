unit uPilaChar;

{ 1.1 
    Genera una unidad pila cuyos nodos almacenen un único carácter.
    Implementa las funciones básicas para la pila:
        - Inicializar la pila.
        - Verificar si la pila está vacía.
        - Apilar un carácter.
        - Desapilar un carácter.
        - Obtener el carácter en la cima de la pila sin desapilarlo.
}


interface

    uses
        sysutils;
    
    type
        tNodo = record
            info: char;
            ant: ^tNodo;
        end;

        tPilaEnteros= ^tNodo;

    { Inicializa la pila }
    procedure initialize(var p: tPilaEnteros);
    { Agrega un elemento a la pila }
    procedure push(var p: tPilaEnteros; x: char);
    { Elimina el elemento de la cima de la pila }
    procedure pop(var p: tPilaEnteros);
    { Devuelve el elemento de la cima de la pila }
    function peek(p: tPilaEnteros): char;
    { Devuelve true si la pila esta vacia }
    function isEmpty(p: tPilaEnteros): boolean;


    { Otros métodos }
    { Libera los recursos de la pila }
    procedure clear(var p: tPilaEnteros);
    { Imprime los elementos de la pila }
    function toString(p: tPilaEnteros): string;

    
implementation
    

    { Inicializa la pila }
    procedure initialize(var p: tPilaEnteros);
    begin
        p := nil; { Inicializa el cima de la pila a nil }
    end;

    { Devuelve true si la pila esta vacia }
    function isEmpty(p: tPilaEnteros): boolean;
    begin
        isEmpty := p = nil; { Devuelve true si la cima es nil }
    end;

    { Agrega un elemento a la pila }
    procedure push(var p: tPilaEnteros; x: char);
    var
        nuevo: ^tnodo;
    begin
        new(nuevo);        { Crea un nuevo nodo }
        nuevo^.info := x;  { Asigna el valor al nuevo nodo }
        nuevo^.ant := p; { Enlaza el nuevo nodo con la anterior cima }
        p := nuevo;   { Actualiza la cima de la pila }
    end;

    { Elimina el elemento del cima de la pila }
    procedure pop(var p: tPilaEnteros);
    var
        aux: ^tnodo;
    begin
        if not isEmpty(p) then
        begin
            aux := p;      { Guarda la cima de la pila en un nodo auxiliar }
            p := p^.ant; { Actualiza la cima de la pila }
            dispose(aux);        { Libera la memoria del nodo eliminado }
        end;
    end;

    { Devuelve el elemento la cima de la pila }
    function peek(p: tPilaEnteros): char;
    begin
        if not isEmpty(p) then
            peek := p^.info; { Devuelve el valor de la cima de la pila }
    end;


