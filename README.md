# Perancangan-Basis-Data
1. Toko beroperasi 24*7 hari dalam pembagian shift sebanyak 3 kali

-> Tiap shift akan berganti setiap 8 jam sekali

-> table shift = kode_shift,waktu shift (mulai dan berakhir)

2. Aplikasi mengandle lebih dari 1 toko

-> adanya kode tiap toko untuk membedakan antar toko

-> table toko = kode_toko, nama_toko, alamat_toko

3. Apikasi bisa mengeluarkan laporan penjualan keseluruhan toko berdasarkan periode tertentu

-> untuk tau periode tertentu berarti setiap transaksi yang terjadi harus ada tanggalnya

-> memanggil kode dengan SELECT * FROM tbtransaksi WHERE tgl between " " and " ";

4. Aplikasi bisa mengeluarkan laporan untuk menampilkan detail transaksi yang dilakukan disetiap akhir shift

-> Laporan akan keluar setiap jam 00.00, 08.00, dan 16.00


Pada perancangan kali ini terdapat 5 buah table
1. tbbarang = kode_barang*,nama_barang,stok, satuan_brg, harga_brg
2. tbtoko = kode_toko*,nama_toko, alamat_toko
3. tbshift = kode_shift*, waktu_mulai, waktu_akhir
4. tbtransaksi = no_transaksi*,kode_shift**, kode_toko**, tgl, total
5. tbdetail = id_detail*, no_transaksi**, kode_barang**, qty, subtotal


