import 'package:flutter/material.dart';

void main() {
  runApp(const WisataDiengApp());
}

class WisataDiengApp extends StatelessWidget {
  const WisataDiengApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Dieng',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class Wisata {
  final String nama;
  final String gambar;
  final String jam;
  final String harga;
  final String lokasi;
  final String deskripsi;

  const Wisata({
    required this.nama,
    required this.gambar,
    required this.jam,
    required this.harga,
    required this.lokasi,
    required this.deskripsi,
  });
}

const List<Wisata> daftarWisata = [
  Wisata(
    nama: 'Kawah Sikidang',
    gambar: 'assets/kawah_sikidang.jpg',
    jam: '07.00 - 17.00',
    harga: 'Rp10.000',
    lokasi: 'Dieng, Banjarnegara',
    deskripsi:
        'Kawah Sikidang merupakan salah satu objek wisata terkenal di Dieng. '
        'Pengunjung dapat melihat aktivitas kawah dari jarak yang aman.',
  ),
  Wisata(
    nama: 'Telaga Warna',
    gambar: 'assets/telaga_warna.jpg',
    jam: '07.00 - 17.00',
    harga: 'Rp15.000',
    lokasi: 'Dieng, Wonosobo',
    deskripsi:
        'Telaga Warna terkenal dengan warna airnya yang dapat terlihat berbeda '
        'karena pengaruh cahaya dan kondisi alam.',
  ),
  Wisata(
    nama: 'Candi Arjuna',
    gambar: 'assets/candi_arjuna.jpg',
    jam: '07.00 - 17.00',
    harga: 'Rp10.000',
    lokasi: 'Dieng, Banjarnegara',
    deskripsi:
        'Candi Arjuna merupakan kompleks candi Hindu yang menjadi salah satu '
        'peninggalan sejarah di kawasan Dieng.',
  ),
  Wisata(
    nama: 'Bukit Sikunir',
    gambar: 'assets/bukit_sikunir.jpg',
    jam: '04.00 - 18.00',
    harga: 'Rp15.000',
    lokasi: 'Sembungan, Dieng',
    deskripsi:
        'Bukit Sikunir merupakan tempat populer untuk menikmati pemandangan '
        'matahari terbit dan keindahan alam Dieng.',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Dieng',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: daftarWisata.length,
        itemBuilder: (context, index) {
          return KartuWisata(wisata: daftarWisata[index]);
        },
      ),
    );
  }
}

class KartuWisata extends StatelessWidget {
  final Wisata wisata;

  const KartuWisata({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(wisata: wisata)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              wisata.gambar,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    wisata.lokasi,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Wisata wisata;

  const DetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              wisata.gambar,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      InfoWisata(
                        icon: Icons.access_time,
                        judul: 'Jam Buka',
                        isi: wisata.jam,
                      ),
                      InfoWisata(
                        icon: Icons.confirmation_number,
                        judul: 'Harga',
                        isi: wisata.harga,
                      ),
                      InfoWisata(
                        icon: Icons.location_on,
                        judul: 'Lokasi',
                        isi: wisata.lokasi,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    wisata.deskripsi,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      label: const Text('Lihat Lokasi'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWisata extends StatelessWidget {
  final IconData icon;
  final String judul;
  final String isi;

  const InfoWisata({
    super.key,
    required this.icon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 25),
          const SizedBox(height: 5),
          Text(judul, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 3),
          Text(
            isi,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
