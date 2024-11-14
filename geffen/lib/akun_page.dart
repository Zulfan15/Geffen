import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi Pengguna
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // Ganti dengan path gambar profil Anda
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Pengguna',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'email@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            // Opsi Akun
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Navigasi ke halaman profil
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                // Navigasi ke halaman pengaturan
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Ubah Kata Sandi'),
              onTap: () {
                // Navigasi ke halaman ubah kata sandi
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
              onTap: () {
                // Logika untuk keluar dari akun
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Konfirmasi'),
                    content: Text('Apakah Anda yakin ingin keluar?'),
                    actions: [
                    TextButton(
                      child: Text('Batal'),
                      onPressed: () {
                      Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Keluar'),
                      onPressed: () {
                      // Tambahkan logika untuk keluar dari akun di sini
                      Navigator.of(context).pop();
                      // Contoh: Navigator.pushReplacementNamed(context, '/login');
                      Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                    ],
                  );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}