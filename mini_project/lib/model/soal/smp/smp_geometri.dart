class GeometriSMP {
  final String subject = 'geometri';
  final String grade = 'SMP';
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  GeometriSMP({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<GeometriSMP> geometriSMP = [
  GeometriSMP(
    soal: 'Sebuah persegi dengan panjang sisi 4 cm memiliki luas ...',
    jawabA: '16',
    jawabB: '8',
    jawabC: '20',
    jawabD: '12',
    benar: 'a',
    available: true,
  ),
  GeometriSMP(
    soal: 'Luas Permukaan dari tabung jika Volumenya adalah 3140 adalah . . .',
    jawabA: '942',
    jawabB: '512',
    jawabC: '1256',
    jawabD: '1024',
    benar: 'c',
    available: false,
  ),
  GeometriSMP(
    soal:
        'Luas Permukaan dari balok jika panjangnya 16, lebarnya 10, dan tingginya 4 adalah . . .',
    jawabA: '720',
    jawabB: '240',
    jawabC: '640',
    jawabD: '360',
    benar: 'c',
    available: false,
  ),
];
