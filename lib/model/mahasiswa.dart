class Mahasiswa {
  String name;
  String jurusan;

  Mahasiswa({required this.name, required this.jurusan});

  factory Mahasiswa.fromJson(Map<String, dynamic> obj) {
    return Mahasiswa(name: obj['name'], jurusan: obj['jurusan']);
  }
}
