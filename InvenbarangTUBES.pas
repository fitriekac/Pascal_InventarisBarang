program Inventarisbarang;

uses crt;
Type
        BARANG = record
                 nama : string;
                 jumlah,kode : integer;

end;
var
        BRG : Array[1..50] of BARANG;
        a,nbrg : integer;

        procedure updatebarang() forward;

procedure menuutama() forward;
Procedure inputbarang ();
var
        i,n:integer;
        a : string;

begin
        clrscr;
        writeln('==================================================================================================');
        writeln('-------------------------------------------INPUT BARANG-------------------------------------------');
        writeln('==================================================================================================');
        write ('Masukan Jumlah Data Yang ingin dimasukan : ');
        readln(n);
        for i := nbrg+1 to nbrg+n do
        begin
                write('kode barang: ');
                readln(BRG[i].kode);
                write('nama barang: ');
                //for i := 1 to 6 do
               // begin
                readln(BRG[i].nama);
               // end;
                write('jumlah barang: ');
                //begin
                readln(BRG[i].jumlah);
               // end;
               writeln('---------------------DATA TERINPUT SUKSES-----------------------');
        end;
        nbrg:=nbrg+n;
        write ('Tekan enter untuk kembali ke menu utama');
        readln;
        menuutama();


end;


procedure updatebarang();
var
        lo,i,k : integer;
begin
         i:=1;
         writeln('================================== UPDATE BARANG =================================');
         writeln('HANYA DAPAT UPDATE JUMLAH');
         write('MASUKAN NO BARANG YANG INGIN DIUPDATE JUMLAH : ');
         readln(lo);
         for i:=1 to nbrg do
                if (lo=BRG[i].kode) then
                begin
                        write('MASUKAN JUMLAH BARANG : ');
                        readln(k);
                        BRG[i].jumlah:=k;
                end
                else
                begin
                        write('MAAF KODE TIDAK DITEMUKAN');
                end;
         write('TEKAN ENTER UNTUK KEMBALI');
         readln;
         menuutama();
end;
procedure lihat();
var
        i :integer;
begin
        clrscr;
        for i := 1 to nbrg do
        begin
                writeln('-------------------DATA KE - ',i,'----------------------');
                writeln('            Nama : ',BRG[i].nama);
                writeln('            Kode : ',BRG[i].kode);
                writeln('            Jumlah : ',BRG[i].jumlah);
        end;
        writeln('TEKAN ENTER UNTUK KEMBALI ');
        readln;
        menuutama();

end;
procedure tambahstock();
var
        i,b : integer;
		k : boolean;
begin
        k := false;
		write('Tambah Stock');
        write('Masukan kode barang yang ingin ditambah stock : ');
        readln(a);
        for i:=1 to nbrg do
        begin
                if a = BRG[i].kode then
                begin
                        write('Masukan jumlah barang: ');
                        readln(b);
                        BRG[i].jumlah:=BRG[i].jumlah+b;
						k :=true;
                end;
        end;
		if k = false then 
			write('DATA TIDAK DITEMUKAN');
		write('TEKAN ENTER UNTUK KEMBALI');
		readln;
        menuutama();
end;

procedure serching();
var
        a,i : integer;
begin
        i:=1;
        write('Masukan Kode : ');
        readln(a);
        while a <> BRG[i].kode do
                i:=i+1;
        if a= BRG[i].kode then
        begin
                writeln('Kode : ',BRG[i].kode);
                writeln('NAMA : ',BRG[i].nama);
                writeln('JUMLAH : ',BRG[i].jumlah);
        end;
        writeln('TEKAN ENTER UNTUK KEMBALI ');
        readln;
        menuutama();
end;
procedure deletebarang();
var
        i,a : integer;

begin
        write('masukan NO urut barang (LIHAT PADA MENU 5) : ');
        readln(a);
        i:=a+1;
        while (i<=100) and (BRG[i].kode <> 0) do
        begin
                BRG[i-1] := BRG[i];
                if BRG[i].kode = BRG[i].kode then
                begin
                        BRG[i].kode := 0;
                        BRG[i].nama :='';
                        BRG[i].jumlah:=0;
                        write('sukses');
                end;
                i:=i+1;
        end;
        write('TEKAN ENTER UNTUK KEMBALI');
        readln;
        menuutama();


end;

procedure menuutama();
var
        pilih,a,i : integer;
begin
        clrscr;
        i:=1;
        writeln('====================================================================================');
        writeln('-------------------------------------MENU UTAMA-------------------------------------');
        writeln('====================================================================================');
        writeln;
        writeln('1. INPUT BARANG');
        writeln('2. UPDATE BARANG');
        writeln('3. TAMBAH STOCK');
        writeln('4. DELETE BARANG');
        writeln('5. LIHAT');
        writeln('6. SEARCHING ');
        write ('MASUKAN PILIHAN : ');
        readln(pilih);
                case pilih of

                        1 : inputbarang();
                        2 : updatebarang();
                        3 : tambahstock();
                        4 : deletebarang();
                        5 : lihat();
                        6 : serching();
                end;


end;
begin
        menuutama();
end.
