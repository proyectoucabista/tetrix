program TetrisucabV2;
uses crt;

var ss,nn,x,y,pus,a,b,c,d,lin,cont,SumaP,NumFig,j:integer;

st:array[1..12,1..12] of integer;            //Declaramos una matriz del campo de juego 12x12
aletorio: array[1..4] of integer;           // Figuras escogidas por usuario
rango_azar:array[1..1000] of integer;         // Declaramos una matriz aleatoria de rand para crear una secuencia numérica de la apariencia de las formas, para determinar la siguiente forma.

  Contador_Figuras:integer;   // Declarar el contador de las figuras caídas
  Puntos,i:integer;          // Declara una variable para guardar el resultado del juego (puntos del juego)
  minutos,segundos:integer;
  nro_mov,eleccion:integer; // numero de movimientos y escoger en el programa
  mod_mov,tiempo:boolean; //activar movimientos en el cuerpo del programa
 procedure portada;
 begin
  TextColor(White);      // Establecer las letras en blanco
  TextBackGround(Blue);           // Establecer el color de fondo de las letras en azul
  GotoXY(8,14); write('CUIDA TU AMBIENTE');
  TextColor(White);
  GotoXY(15,5);  write('[][][] [][][] [][][] [][][]     []   []    []');
  GotoXY(15,6);  write('  []   []       []   []   []    []    []  []');
  GotoXY(15,7);  write('  []   [][][]   []   [][][]     []      []');
  GotoXY(15,8);  write('  []   []       []   []    []   []    []  []');
  GotoXY(15,9);  write('  []   [][][]   []   []      [] []  []      []');

  GotoXY(39,3);  write('(c) COPYRIGHT XD');
  GotoXY(22,19); write('PROYECTO UCAB 2020');

  GotoXY(10,20); write('>> Presiona cualquier tecla para continuar! <<');

  ReadKey;                   // ¡Espere a que se presione cualquier tecla!}

  clrscr;// borrar pantalla
 end;

 procedure escoger;
 type arreglo=array[1..8] of boolean;
  var terminar:integer;
    lista:arreglo;
  begin
    terminar:=0;
    eleccion:=0;
    for i:=1 to 8 do
    lista[i]:=false; // inicializar

  repeat

      if lista[1]=false then  // verificar cuales figuras fueron escogidas
      begin
         gotoxy(1,2); write('[][][]'); // mostrar figura si no se ha escogido
         gotoxy(1,8); write('  1');
      end
      else
      begin
        Textcolor(10);
        gotoxy(1,20); write('[][][]');  // se desplaza hacia abajo si escogio la figura
        gotoxy(1,24); write('  1');
        textcolor(white);
      end;

      if lista[2]=false then
      begin
          gotoxy(10,2); write('[]');
          gotoxy(10,3); write('[]');
          gotoxy(10,4); write('[]');
          gotoxy(10,8); write(' 2');
      end
      else
      begin
        Textcolor(10);
        gotoxy(10,20); write('[]');
        gotoxy(10,21); write('[]');
        gotoxy(10,22); write('[]');
        gotoxy(10,24); write(' 2');
        textcolor(white);
      end;
      if lista[3]=false then
      begin
        gotoxy(20,2); write('[]');
        gotoxy(20,3); write('[]');
        gotoxy(20,4); write('[][]');
        gotoxy(20,8); write('   3');
      end
      else
      begin
        Textcolor(10);
        gotoxy(20,20); write('[]');
        gotoxy(20,21); write('[]');
        gotoxy(20,22); write('[][]');
        gotoxy(20,24); write('   3');
        textcolor(white);
      end;
      if lista[4]=false then
      begin
        gotoxy(30,2); write('  []');
        gotoxy(30,3); write('  []');
        gotoxy(30,4); write('[][]');
        gotoxy(30,8); write('   4');
      end
      else
      begin
        Textcolor(10);
        gotoxy(30,20); write('  []');
        gotoxy(30,21); write('  []');
        gotoxy(30,22); write('[][]');
        gotoxy(30,24); write('   4');
        textcolor(white);
      end;
      if lista[5]=false then
       begin
        gotoxy(40,2); write('[][]');
        gotoxy(40,3); write('[]');
        gotoxy(40,4); write('[]');
        gotoxy(40,8); write(' 5');
       end
      else
      begin
        Textcolor(10);
        gotoxy(40,20); write('[][]');
        gotoxy(40,21); write('[]');
        gotoxy(40,22); write('[]');
        gotoxy(40,24); write(' 5');
        textcolor(white);
      end;
      if lista[6]=false then
        begin
          gotoxy(50,2); write(' [][]');
          gotoxy(50,3); write('   []');
          gotoxy(50,4); write('   []');
          gotoxy(50,8); write('   6');
        end
      else
      begin
        Textcolor(10);
        gotoxy(50,20); write(' [][]');
        gotoxy(50,21); write('   []');
        gotoxy(50,22); write('   []');
        gotoxy(50,24); write('   6');
        textcolor(white);
      end;
      if lista[7]=false then
        begin
          gotoxy(60,2); write('[][][]');
          gotoxy(60,3); write('  [] ');
          gotoxy(60,4); write('  [] ');
          gotoxy(60,8); write('   7 ');
        end
      else
      begin
        Textcolor(10);
        gotoxy(60,20); write('[][][]');
        gotoxy(60,21); write('  [] ');
        gotoxy(60,22); write('  [] ');
        gotoxy(60,24); write('   7 ');
        textcolor(white);
      end;
      if lista[8]=false then
        begin
          gotoxy(70,2);write('  []  ');
          gotoxy(70,3);write('  []  ');
          gotoxy(70,4);write('[][][]');
          gotoxy(70,8);write('  8');
        end
      else
      begin
        Textcolor(10);
        gotoxy(70,20);write('  []  ');
        gotoxy(70,21);write('  []  ');
        gotoxy(70,22);write('[][][]');
        gotoxy(70,24);write('  8');
        textcolor(white);
      end;

        terminar:=terminar+1; // determina si ya se escogieron las 4 figuras
        gotoxy(30,14);
        writeln('Escoge 4 figuras');
        gotoxy(30,15);
        readln(aletorio[terminar]); // escoge un numero del 1 al 8
        eleccion:=(aletorio[terminar]); // verificamos si ya esa figura esta escogida
        clrscr; // actualizar seleccion de figuras
        if (eleccion>8) or (eleccion<1) then
        begin
          gotoxy(30,18);
          Textcolor(12);
          writeln('>> Escoge una figura valida! ');
          terminar:=terminar-1;
        end
        else if lista[eleccion]=true then
        begin
          gotoxy(30,18);
          Textcolor(12);
          writeln('>> Ya escogiste esta figura!');
          terminar:=terminar-1;
        end
        else  // esa figura no se ha escogido se coloca en verdadero
        lista[eleccion]:=true;

    until terminar=4; // ya escogio 4 figuras

  end;

  // Procedimiento para dibujar celdas de campo
procedure k(x,y:integer);                 // Procedimiento k (x, y): dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
begin


  gotoxy(x*2+20,23-y);                      // Colocar el cursor de texto en la línea (X * 2 + 20) por X y (23-Y) la posición inicial del vaso
  if ss=0 then
  begin
   write('. ');                 // Si ss = 0, se muestran dos símbolos con un fondo vacío entre comillas '. 'Para borrar los rastros del movimiento de la figura a través de la pantalla.

  end;
  if ss=1 then
  begin
   write('[]');                 // ss = 1 entonces se emite el bloque de figuras de Tetris '[]'
  end;
  if ss=9 then  // ss = 9 Los caracteres de ASCII # 124  paredes de Tetris '||'
  begin
    textcolor(LightCyan);
    write(chr(124),chr(124));
    textcolor (white);
  end;
  if (ss=3) and (st[x,y]>0) then // si en donde hace la figura hay alguna cantidad entonces se para el juego
   pus:=1;    // ss = 3 y el índice de matriz no es un espacio vacío (el borde de vidrio), luego asigne pus = 1

  if (ss=4) and (st[x,y]=0) then   // Escribir el numero de la figura que ha salido de forma aleatoria
   st[x,y]:=NumFig;


end;  // Fin del procedimiento para dibujar celdas k (x, y)

// procediemiento para dibujar formas
procedure fig(x,y,n,s:integer); // El procedimiento fig (x, y, n, s) almacena información sobre los tipos de figuras de Tetris
begin

    if s=3 then
    pus:=0;

    ss:=s;
    k(x,y);


    case NumFig of  // figura escogidas por el usuario
     1:begin
          TextColor(white);
          k(x-1,y);
          k(x+1,y);
          k(x+1,y);
          // Patrón de forma 1
          //   [][][]
      end;


     2:begin
      TextColor(yellow);
      k(x,y+1);
      k(x,y-1);
      k(x,y-1);
      // Patrón de forma 2
      //   []
      //   []
      //   []

      end;

      3:
      begin
        Textcolor(12);
        k(x,y+1);
        k(x,y-1);
        k(x+1,y-1);
        // Plantilla de forma 3
        //   []
        //   []
        //   [][]
      end;

      4:
      begin
          Textcolor(13);
          k(x,y+1);
          k(x,y-1);
          k(x-1,y-1);       // Plantilla de forma 4
          //     []
          //     []
          //   [][]
      end;

      5:
      begin
        Textcolor(10);
        k(x,y+1);
        k(x+1,y+1);
        k(x,y-1);     // Plantilla de forma 5
        //   [][]
        //   []
        //   []
      end;
      6:
      begin
        Textcolor(yellow);
        k(x,y+1);
        k(x,y-1);
        k(x-1,y+1);      // Plantilla de forma 6
        //   [][]
        //     []
        //     []
      end;
      7:
      begin
      Textcolor(12);
      k(x,y-1);
      k(x-1,y);
      k(x+1,y);
       k(x,y-2); // Plantilla de forma 7
      //   [][][]
      //     []
      //     []


      end;
      8:
      begin
        Textcolor(13);
        k(x+1,y);
        k(x-1,y);
        k(x,y+1);
         k(x,y+2);   // Plantilla de forma 8

         //    []
        //     []
        //   [][][]
      end;

    end;
  end;  //  Fin del procedimiento de dibujo de figuras

//  Procedimiento de limpieza
procedure limpiar;
begin
  for x:=1 to 12 do
   for y:=1 to 12 do
       if (x=1) or (x=11) or (y=1) then
        st[x,y]:=9
          else
            st[x,y]:=0;
          //Se dibuja el contorno del vidrio y se reinicia el vidrio
end;  //  Fin del procedimiento de limpieza de cristales *

//  Procedimiento para crear las paredes
procedure paredes;
begin
   for x:=1 to 11 do
   begin
    for y:=1 to 11 do
    begin
      ss:=st[x,y];
      k(x,y);    // Llamada al procedimiento k (x, y) - dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
    end;
   end;

end; // Fin del procedimiento para extraer todo el vaso

procedure restar_mov;
begin
  if (mod_mov=true) and (nro_mov>0) then    //si se presiona una tecla se resta un movimiento TIENE que estar modalidad movimientos activado
              begin
                 if nro_mov<=10 then // colocar texto en rojo cuando quedan 10 movimientos
                  begin
                  nro_mov:=nro_mov-1;
                  gotoxy(55,11);
                  writeln('                  '); // borrar movimientos anteriores
                  textcolor(12); // color rojo
                  gotoxy(55,11);
                  writeln('movimientos ',nro_mov);
                  end
                 else
                 begin
                  nro_mov:=nro_mov-1;
                  gotoxy(55,11);
                  textcolor(yellow);
                  writeln('movimientos ',nro_mov);
                 end;
  end;
end;

// Procedimiento para controlar y mover figuras usando el teclado
procedure control;
var
i:integer;
key:char;
  begin
    for i:=1 to 10 do
       begin
        delay(d);     // Retraso basado en datos de la variable d
        key:=' ';
        if keypressed then
           key:=readkey;

     if nro_mov>=0 then // si no se acabaron los movimientos hacer
      begin
       if key='a' then                    // Si se presiona la tecla a, entonces izquierda <=== [a]
       begin

          restar_mov; // si se presiona la tecla se resta un movimiento
          fig(x-1,y,nn,3);
          if pus=0 then
          begin
                fig(x,y,nn,0);
                x:=x-1;
                fig(x,y,nn,1);
          end;
       end;
       if key='d' then                    // Si se presiona la tecla d, entonces derecha    ===> [d]
        begin

          restar_mov; // si se presiona la tecla se resta un movimiento

          fig(x+1,y,nn,3);
          if pus=0 then
           begin
             fig(x,y,nn,0);
             x:=x+1;
             fig(x,y,nn,1);
           end;
        end;
        if key='s' then
        begin
          restar_mov; // si se presiona la tecla se resta un movimiento
          d:=1;  // Si se presiona la tecla s, la figura vuela hacia abajo = [s] =
        end;
        if (nro_mov<2) and (mod_mov=true) then // si queda menos de un movimiento se acelera el juego
        d:=1;
       if nro_mov=0 then // si es ultimo movimiento restar para que no vuelva a entrar a el ciclo
       nro_mov:=nro_mov-1;

      end;
    end;
   // Fin del procedimiento para controlar y mover figuras usando el teclado
end;
// Procedimiento para crear una nueva forma actual y siguiente
procedure nuevafigura;
var FiguraActual,FiguraNext:integer;
frase:string;
begin
  FiguraNext:=rango_azar[Contador_Figuras+2]; // Definir la siguiente forma

  FiguraActual:=rango_azar[Contador_Figuras+1]; // Definir la forma actual numero al azar



   case FiguraActual of
    1:frase:=' En todo amar y servir ';
    2:frase:=' Dile NO a las drogas! ';
    3:frase:=' No contamines tu pais ';
    4:frase:=' Siembra una semilla ! ';
   end;

   gotoxy(20,2);write('         ',chr(92),chr(179),chr(186),'/');// \|||/
   gotoxy(20,3);write('         (O O)');
   gotoxy(20,4);write(chr(201),'======ooO-(_)-Ooo======',chr(187));
   gotoxy(20,5);write('                      '); // limpiar frase anterior
   gotoxy(20,5);write(chr(03),frase,chr(03)); // frase
   gotoxy(20,6);write(chr(200),'=======================',chr(188));

  gotoxy(55,10); writeln('               ');  // Borra la línea de puntos
  gotoxy(55,10); writeln('Puntos: ', Puntos);    // Puntos por el éxito en el juego

  gotoxy(55,12); writeln('nombre');
  gotoxy(55,13); writeln('ORIGEN (BOL)');



  // NumFig sera el numero al azar de la figura que sera intercambiado por los numero de figura escogidos por el usuario
    case FiguraActual of   // cambiar numero del 1 a 4 por numeros escogidos por el usuario para las figuras
       1:NumFig:=aletorio[1];
       2:NumFig:=aletorio[2];
       3:NumFig:=aletorio[3];
       4:NumFig:=aletorio[4];
    end;

  gotoxy(55,14); writeln('           ');
  gotoxy(55,14); writeln('NumFig ',NumFig);



  gotoxy(55,2); writeln('RECORD 1000');
  gotoxy(55,3); writeln('PROXIMA FIGURA ');    // Información sobre la siguiente forma
                        gotoxy(56,4); writeln('               ');    // Espacios, 15 piezas cada uno, para borrar los rastros de mostrar la siguiente figura del movimiento anterior
                        gotoxy(56,5); writeln('               ');      //
                        gotoxy(56,6); writeln('               ');      //
                        gotoxy(56,7); writeln('               ');      //
                        gotoxy(56,8); writeln('               ');      //
                        gotoxy(56,9); writeln('               ');      //
                        fig(20,17,FiguraNext,1); // Dibuja una figura, que saldrá de la siguiente 20 = coordenada x, 17 = coordenada y, NextFigure = nn valor, 1 = [] de qué elemento se dibuja la figura

  nn:=NumFig; // Dibuja la figura actual definida en la variable Figura actual

  textcolor(11); //mensajes
  gotoxy(20,24);
  writeln('COLOCA LA BASURA EN SU LUGAR :)');
  textcolor(white);
end; // Fin del procedimiento para crear una nueva forma actual y siguiente

 PROCEDURE cargando;
 var rodar:integer;
begin
  rodar:=0;

  for i:=1 to 200 do
  begin
   Textcolor(LightGreen);
   gotoxy(35,10);
    write('Cargando...');
    rodar:=rodar+1;

    Textcolor(11);

    if rodar<5 then
    begin
       gotoxy(40,13);
       write('[]');  //cubo1

        gotoxy(38,16);
        write('  ');  // borrar anterior

          gotoxy(37,15);
        write('  ');   // borrar anterior
     end
     else if rodar<10 then
     begin
       gotoxy(42,14);
       write('[]');  //cubo2
     end
     else if rodar<15 then
       begin
         gotoxy(43,15); // cubo3
         write('[]');

         gotoxy(38,14);
          write('  ');    //borrar anterior
       gotoxy(40,13);
       write('  ');  //borrar anterior
         gotoxy(42,14);
       write('  ');  //cubo2
       end
     else if rodar<20 then
       begin
         gotoxy(42,16);
         write('[]');    // cubo4
       end
     else if rodar<25 then
       begin
         gotoxy(40,17);
         write('[]');   // subo5
       end
     else if rodar<30 then
       begin
        gotoxy(38,16);
        write('[]');  // cubo6

         gotoxy(43,15); // borrar anterior
         write('  ');

         gotoxy(42,16);
         write('  ');    // borrar anterior

        gotoxy(40,17);
         write('  ');   // borrar anterior
       end
     else if rodar<35 then
       begin
        gotoxy(37,15);
        write('[]');   // cubo7
       end
     else if rodar<40 then
       begin
          gotoxy(38,14);
          write('[]');    //cubo8
       end
       else if rodar>40 then
           rodar:=1;    // reiniciar cargando

       delay(1); // tiempo proceso
   end
 end;


procedure modalidad;
begin
       clrscr;  // borrar pantalla
       writeln('Que modalidad desea jugar?');
       writeln('>> Por Movimientos (1)');
       writeln('>> Modo normal     (2)');
       writeln('>> Modo tiempo     (3)');
       readln(eleccion);

       case eleccion of
        1:
          begin
            mod_mov:=true;
            repeat
              writeln('Por Cuantos Movimientos Desea Jugar?');
              readln(nro_mov);

              if (nro_mov<0) or (nro_mov>100) then
                writeln('Por favor escriba un numero de movimiento valido!!');

            until (nro_mov>0) and (nro_mov<=100);
          end;
        3:
          begin
            tiempo:=true;
            repeat
              writeln('cuantos minutos deseas jugar? (Maximo 100 minutos)');
              readln(minutos);

              if (minutos<0) OR (minutos>100) then
                writeln('Por favor escriba un tiempo valido!!');

            until (minutos>0) AND(minutos<=100);
            segundos:=1; // segundos
          end;
       end;
end;

 // INICIAR PROGRAMA PRINCIPAL
begin

 Repeat
   //INICIALIZAR
  nro_mov:=1;
  mod_mov:=false;
  tiempo:=false;
  minutos:=0;
  Puntos:=0;
  SumaP:=0;
  lin:=0; // lineas completadas

  // FIN INICIALIZAR
  TextBackground(Blue);   // Establecer el color de fondo azul
  Clrscr;                   // pantalla limpia

  portada;  // portada pricipal

  escoger; // escoger figura

  modalidad; // escoger modalidad de juego

  cargando; // cargando partida

  randomize; // Encender el generador de números aleatorios  por cada iteración
    for i:=1 to 1000 do
     rango_azar[i]:=(1+ random(4));  // Crea una secuencia aleatoria, casi infinita para determinar la forma actual y la siguiente


  clrscr;    // Limpia la pantalla de la pantalla de bienvenida

  textcolor(Yellow);                       // La línea superior izquierda, preguntando "¿cómo jugar?"
  gotoxy(01,10);
  Writeln('    Controles ');
  Writeln;
  Writeln('  <A> izquierda');
  Writeln('  <D> Derecha');
  Writeln('  <S> Abajo');

  limpiar; // Procedimiento para poner a cero los espacios vacios de la matriz
  paredes; // Procedimiento para dibujar las paredes

  repeat // ¡Empieza a repetir el bucle principal del juego! Siempre que haya un espacio vacío en el campo para el movimiento y la aparición de nuevas piezas.

    nuevafigura; // Aquí se sabrá qué forma será la próxima y actual

    // Coordenadas de la aparicion de la nueva forma
    if NumFig=8 then // si es la figura ocho, movemos su coordenada de aparicion un poco mas abajo
      y:=10
      else
    y:= 11;

    x:= 6;
    fig(x, y, NumFig, 3);
    d:= 80-(lin * 3); //  velocidad del juego


    { textcolor(white); // Para Visualizar en tiempo real los numeros de las figuras
     cont:=0;
       for i:=11 downto 1 do
        begin
        for j:=1 to 11 do
         begin
         cont:=cont+1;
         write(st[j,i]);
         if cont=11 then
         begin
           writeln;
           cont:=0;
         end;

         end;
       end; }

    if pus = 0 then // Si la celda está vacía y no hay colisión con el vidrio y los ladrillos colocados anteriormente en el vidrio
     begin // then
      Repeat // repetir hasta colisión
       fig(x, y, NumFig, 1); // La figura actual se dibuja antes del movimiento, 1 = [] de qué elemento se dibuja la figura
       control; // Llamar al procedimiento para el control de movimientos

       if tiempo=true then // si funcion tiempo esta activado hacer
        begin
          // Mostrar tiempo en pantalla
          textcolor(yellow);
          gotoxy(55,19);
          write('          ');
          gotoxy(55,19);
          write(minutos,':',segundos);


         segundos:=segundos-1;
         if segundos=0 then  // si segundos llega a cero reiniciar tiempo
          begin
            segundos:=59;
            minutos:=minutos-1;
          end;
        end;

        fig(x, y-1, NumFig, 3); // Dibuja una figura con un desplazamiento a lo largo del eje Y, siempre que ss = 3 y el índice de matriz no sea un espacio vacío (el borde del vidrio o el borde de las figuras), luego asigna pus = 1 y evita que la figura caiga un elemento antes del borde del vidrio
        if pus = 0 then
         begin
           fig(x, y, NumFig, 0);  // borra el rastro que deja la figura
           y:= y-1;
         end; // Se extrae una cifra de los elementos del campo de libro de pedidos vacío '. '
      until pus = 1; // Ocurrió una colisión

      fig(x, y, NumFig, 4); // !!!!! Dibuja la figura actual que no se puede mover y escribe su posición en la matriz de elementos del libro de pedidos st []

      Contador_Figuras:=Contador_Figuras + 1; // Contador de cifras para depuración


      for y:=11 downto 2 do // Comprobando filas llenas
       begin // Comienza a verificar las filas llenas
        a:=0;

        for x:=2 to 11 do
         begin
          if st[x,y]>0 then // si hay un elemento aumenta en +1
           a:=a+1;
         end;
        If a=10 then // Si la suma de las celdas es 10, entonces la fila está llena, la matriz se movera hacia abajo
         begin // Comienza a cambiar la matriz
          cont:=0;
          lin:=lin+1; // lineas completadas , por cada linea se acelera el juego
          SumaP:=0; // Reiniciar suma
           for b:=y to 11 do
             for c:=1 to 11 do
              begin
              cont:=cont+1;
               if cont<=10 then
                   SumaP:=SumaP+st[c,b];

               st[c, b]:=st[c, b + 1]; // Desplaza la matriz hacia abajo
              end;
            Puntos:=Puntos+100*(SumaP-9); // puntos actual + lo calculado -9 que es una columna de la pared

         end; // Fin del cambio de matriz
       end; // Fin de la comprobación de filas llenas

     paredes; // Procedimiento para dibujar elementos de toda la cartera de pedidos
     pus:=0;
     end;


    //Acabar por movimientos o tiempo
    if (nro_mov<1) or (minutos<0) then  // si se acaban los movimientos se termina el juego
    begin
       pus:=1;
       if mod_mov=true then
       begin
        textcolor(12); // color rojo
        gotoxy(55,11);
        writeln('                   '); // borrar mensaje anterior
        gotoxy(55,11);
        writeln('Sin Movimientos !');
       end
       else
       begin
         textcolor(12);
         gotoxy(55,16);
         write('          ');
         gotoxy(55,19);
         write('0:0'); // al acabarse el tiempo muestra mensaje en pantalla
         gotoxy(55,16);
         write('Se te acabo tu tiempo !');
       end;

    end;
    until pus = 1; // ¡Deja de repetir el ciclo principal del juego! Porque no hay espacio vacío.

       textcolor(11); //color azul
       gotoxy(55,15);
       writeln ('JUEGO CONCLUIDO!'); // Escribir "Fin del juego"

        // observar matriz con los numeros al finalizar juego
       cont:=0;
       for i:=11 downto 1 do
        begin
        for j:=1 to 11 do
         begin
         cont:=cont+1;
         write(st[j,i]);
         if cont=11 then
         begin
           writeln;
           cont:=0;
         end;

         end;
       end;

       repeat
         gotoxy(55,17);
         writeln('Deseas Continuar jugando? ');
         gotoxy(55,18);
         writeln('SI   [1]');
         gotoxy(55,19);
         writeln('NO   [2]');
         gotoxy(55,20);
         write('>>');
         gotoxy(57,20);
         readln(eleccion);
         gotoxy(57,20);
         write('     '); // si escoge opcion ivalida borra numero ingresado
       until (eleccion=1) or (eleccion=2); // repetir hasta escoger opcion valida(numeros)

 until eleccion=2; // acabar ciclo si escoge que no desea continuar jugando


End.
