class AljabarSMP {
  final String subject = 'aljabar';
  final String grade = 'SMP';
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  AljabarSMP({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<AljabarSMP> aljabarSMP = [
  AljabarSMP(
    soal: 'f(x) = x^2 + 6x + 8 = 0. Berapakah faktor dari x?',
    jawabA: 'x = 2 dan x = 3',
    jawabB: 'x = 4 dan x = 2',
    jawabC: 'x = -4 dan x = -2',
    jawabD: 'x = 3 dan x = 4',
    benar: 'b',
    available: true,
  ),
  AljabarSMP(
    soal: 'Berapakah nilai dari f(5) jika f(x) = 4x^2 - 7x + 5',
    jawabA: '70',
    jawabB: '270',
    jawabC: '170',
    jawabD: '370',
    benar: 'c',
    available: false,
  ),
];
