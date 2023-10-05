import 'package:flutter/material.dart';

class AddMahasiswa extends StatefulWidget {
  const AddMahasiswa({super.key});

  @override
  State<AddMahasiswa> createState() => _AddMahasiswaState();
}

class _AddMahasiswaState extends State<AddMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Mahasiswa")),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
