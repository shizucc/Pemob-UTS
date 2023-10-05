import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pemob_uts/model/mahasiswa.dart';
import 'package:http/http.dart' as http;

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  String url = "http://localhost/api_mahasiswa/index.php";

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> datas = json.decode(response.body);
      final List<Map<String, dynamic>> dataMap =
          datas.cast<Map<String, dynamic>>();
      return dataMap;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Mahasiswa")),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData) {
                  print("ehe");
                  final List<Map<String, dynamic>> mahasiswas = snapshot.data!;
                  print(mahasiswas);
                  return ListView.builder(
                      itemCount: mahasiswas.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> mahasiswa =
                            mahasiswas[index];
                        print(mahasiswa);
                        return Card(
                          child: Column(
                            children: [
                              Text(mahasiswa['nama']),
                              Text(mahasiswa['jurusan'])
                            ],
                          ),
                        );
                      });
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}
