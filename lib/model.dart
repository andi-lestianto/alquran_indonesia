class Blog {
  final String nama;
  final String keterangan;

  const Blog({
    required this.nama,
    required this.keterangan,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      nama: json['nama'],
      keterangan: json['keterangan'],
    );
  }
}
