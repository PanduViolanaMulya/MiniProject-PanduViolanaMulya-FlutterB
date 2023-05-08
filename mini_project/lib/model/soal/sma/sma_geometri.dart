class GeometriSMA {
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  GeometriSMA({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<GeometriSMA> geometriSMA = [
  GeometriSMA(
    soal:
        'Sebuah kubus ABCD.EFGH memiliki rusuk sepanjang 4 satuan. Maka jarak antara garis AB ke garis GH adalah ...',
    jawabA: '2 *sqrt(4)',
    jawabB: '2',
    jawabC: '2 *sqrt(2)',
    jawabD: '4',
    benar: 'a',
    available: true,
  ),
  GeometriSMA(
    soal:
        'Sebuah balok PRRS.TUVW memiliki panjang PQ 12, lebar QR 4, dan tinggi RU 8. Hitunglah jarak antara bidang PQR dan UVW',
    jawabA: '10',
    jawabB: '2*sqrt(35)',
    jawabC: '8',
    jawabD: '4*sqrt(5)',
    benar: 'c',
    available: false,
  ),
];
