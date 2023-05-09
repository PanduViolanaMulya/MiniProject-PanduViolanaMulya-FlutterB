class AljabarSD {
  final String subject = 'aljabar';
  final String grade = 'SD';
  final String soal;
  final String jawabA;
  final String jawabB;
  final String jawabC;
  final String jawabD;
  final String benar;
  bool available;

  AljabarSD({
    required this.soal,
    required this.jawabA,
    required this.jawabB,
    required this.jawabC,
    required this.jawabD,
    required this.benar,
    required this.available,
  });
}

List<AljabarSD> aljabarSD = [
  AljabarSD(
    soal: '2 + 3 x 6 = . . .',
    jawabA: '30',
    jawabB: '20',
    jawabC: '10',
    jawabD: '0',
    benar: 'b',
    available: true,
  ),
  AljabarSD(
    soal: '7 - 1 + 6 : 4 = . . .',
    jawabA: '2',
    jawabB: '1',
    jawabC: '0',
    jawabD: '3',
    benar: 'c',
    available: false,
  ),
  AljabarSD(
    soal: '9 x 13 = . . .',
    jawabA: '121',
    jawabB: '111',
    jawabC: '107',
    jawabD: '117',
    benar: 'd',
    available: false,
  ),
  AljabarSD(
    soal: '(15 + 30) : 5 = . . .',
    jawabA: '21',
    jawabB: '33',
    jawabC: '9',
    jawabD: '16',
    benar: 'c',
    available: false,
  ),
];
