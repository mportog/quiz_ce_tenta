class QuizzQuestions {
  List<Questions> questions;

  QuizzQuestions({this.questions});

  QuizzQuestions.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String question;
  String a;
  String b;
  String c;
  String d;
  String e;
  String correct;
  String message;

  Questions(
      {this.question,
      this.a,
      this.b,
      this.c,
      this.d,
      this.e,
      this.correct,
      this.message});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    e = json['e'];
    correct = json['correct'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['e'] = this.e;
    data['correct'] = this.correct;
    data['message'] = this.message;
    return data;
  }
}
