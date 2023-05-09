class ResultModel {
  late String session;
  late int quizNumber;
  late String quizGrade;
  late String quizSubject;
  late String quizYourAnswer;
  late String quizCorrextAnswer;
  late int? quizPoint;

  ResultModel({
    required this.quizNumber,
    required this.quizGrade,
    required this.quizSubject,
    required this.quizYourAnswer,
    required this.quizCorrextAnswer,
    this.quizPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': quizNumber,
      'grade': quizGrade,
      'subject': quizSubject,
      'yourAnswer': quizYourAnswer,
      'correctAnswer': quizCorrextAnswer,
      'point': quizPoint,
    };
  }

  ResultModel.fromMap(Map<String, dynamic> map) {
    quizNumber = map['number'];
    quizGrade = map['grade'];
    quizSubject = map['subject'];
    quizYourAnswer = map['yourAnswer'];
    quizCorrextAnswer = map['correctAnswer'];
    quizPoint = map['point'];
  }
}
// List<ResultModel> result = [];
