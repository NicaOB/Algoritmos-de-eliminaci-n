program eliminacionLista;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
procedure cargarLista(var pri,ult:lista; num:integer);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:= num;
		nue^.sig:= nil;
		if (pri = nil) then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

procedure cargarDatos(var l:lista);
	var
		n:integer;
		ult:lista;
	begin
		writeln('Ingrese un numero: ');
		readln(n);
		while (n <> 0) do
			begin
				cargarLista(l,ult,n);
				writeln('Ingrese un numero: ');
				readln(n);
			end;
	end;

procedure eliminarDeLista(var l:lista; n:integer);
	var
		actual,ant,aux:lista;
	begin
		actual:= l;
		ant:= l;
		while(actual <> nil) do
			begin
				if(actual^.dato = n) then
					begin
						if(actual = l) then
							l:= l^.sig
						else
							ant^.sig:= actual^.sig;
						aux:= actual;
						actual:= actual^.sig;
						dispose(aux);
					end
				else
					begin
						ant:= actual;
						actual:= actual^.sig;
					end;
			end;
	end;

procedure mostrarLista(l:lista);
	begin
		while (l <> nil) do
			begin
				writeln(l^.dato);
				l:= l^.sig;
			end;
	end;

var
	l:lista;
	n:integer;
begin
	cargarDatos(l);
	mostrarLista(l);
	readln(n);
	writeln('---------------------------------');
	eliminarDeLista(l,n);
	mostrarLista(l);
end.
