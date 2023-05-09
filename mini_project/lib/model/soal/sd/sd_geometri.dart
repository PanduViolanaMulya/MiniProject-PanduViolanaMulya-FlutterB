class GeometriSD {
  final String subject = 'geometri';
  final String grade = 'SD';
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  GeometriSD({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<GeometriSD> geometriSD = [
  GeometriSD(
    soal: 'Sebuah persegi dengan panjang sisi 4 cm memiliki luas ...',
    jawabA: '16',
    jawabB: '8',
    jawabC: '20',
    jawabD: '12',
    benar: 'a',
    available: true,
  ),
  GeometriSD(
    soal: 'Segitiga siku-siku memiliki ... sudut tumpul',
    jawabA: '2',
    jawabB: '1',
    jawabC: '0',
    jawabD: '3',
    benar: 'c',
    available: false,
  ),
];
