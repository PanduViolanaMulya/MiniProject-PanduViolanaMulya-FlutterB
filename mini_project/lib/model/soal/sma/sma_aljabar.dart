class AljabarSMA {
  final String subject = 'Aljabar';
  final String grade = 'SMA';
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  AljabarSMA({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<AljabarSMA> aljabarSMA = [
  AljabarSMA(
    soal: 'f\'(x) = 3x^2 + 5. Berapakah integralnya?',
    jawabA: 'f(x) = 3x^3 + 5x^2 + C',
    jawabB: 'f(x) = x^3 + 5x + C',
    jawabC: 'f(x) = 6x + C',
    jawabD: 'f(x) = x^3 + 5x',
    benar: 'b',
    available: true,
  ),
  AljabarSMA(
    soal: 'Lim (3x^2 + 6x)/(4x^2 - 3) = . . .',
    jawabA: '0',
    jawabB: '3',
    jawabC: '3/4',
    jawabD: '4',
    benar: 'c',
    available: false,
  ),
];
