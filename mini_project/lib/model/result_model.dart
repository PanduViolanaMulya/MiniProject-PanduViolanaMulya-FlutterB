class ResultModel {
  late int quizNumber;
  late int session;
  late int id;
  late String quizGrade;
  late String quizSubject;
  late String quizYourAnswer;
  late String quizCorrextAnswer;
  int quizPoint = 0;

  ResultModel({
    required this.quizNumber,
    required this.session,
    required this.quizGrade,
    required this.quizSubject,
    required this.quizYourAnswer,
    required this.quizCorrextAnswer,
    required this.quizPoint,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': quizNumber,
      'session': session,
      'id': id,
      'grade': quizGrade,
      'subject': quizSubject,
      'yourAnswer': quizYourAnswer,
      'correctAnswer': quizCorrextAnswer,
      'point': quizPoint,
    };
  }

  ResultModel.fromMap(Map<String, dynamic> map) {
    quizNumber = map['number'];
    session = map['session'];
    id = map['id'];
    quizGrade = map['grade'];
    quizSubject = map['subject'];
    quizYourAnswer = map['yourAnswer'];
    quizCorrextAnswer = map['correctAnswer'];
    quizPoint = map['point'];
  }
}
// List<ResultModel> result = [];
