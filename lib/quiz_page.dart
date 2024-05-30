//quiz_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/last.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int currentQuestionIndex = 0;
  List<Question> questions = [
    Question(
      'Apa singkatan dari HTML?',
      [
        'Hyperlink Text Management Language',
        'Hyper Text Managing Language',
        'Hyper Text Markup Language',
        'Highly Typed Markup Language'
      ],
      2,
    ),
    Question(
      'Siapakah penemu bahasa pemrograman Python?',
      ['Guido van Rossum', 'Larry Page', 'Mark Zuckerberg', 'Jeff Bezos'],
      0,
    ),
    Question(
      'Apa kepanjangan dari IDE?',
      [
        'Integrated Development Environment',
        'Interactive Design Environment',
        'Internet Development Environment',
        'Integrated Design Environment'
      ],
      0,
    ),
    Question(
      'Apa fungsi dari perintah "git commit" dalam Git?',
      [
        'Mengganti nama repository',
        'Menyimpan perubahan ke dalam repository',
        'Mengunduh repository dari server',
        'Menghapus repository lokal'
      ],
      1,
    ),
    Question(
      'Apa yang dimaksud dengan HTTP?',
      [
        'High Text Transfer Protocol',
        'Hypertext Transfer Protocol',
        'Hyperlink Transfer Protocol',
        'Hypertext Typing Protocol'
      ],
      1,
    ),
    Question(
      'Siapakah penemu bahasa pemrograman Java?',
      ['James Gosling', 'Linus Torvalds', 'Bill Gates', 'Steve Jobs'],
      0,
    ),
    Question(
      'Apa yang dimaksud dengan CSS?',
      [
        'Cascaded Styling Sheets',
        'Cascaded Style Sheets',
        'Cascading Sheet Styles',
        'Cascading Style Sheets'
      ],
      3,
    ),
    Question(
      'Siapakah penemu bahasa pemrograman C?',
      ['Dennis Ritchie', 'Ken Thompson', 'Alan Turing', 'Grace Hopper'],
      0,
    ),
    Question(
      'Apa yang kepangjangan dari SQL?',
      [
        'System Question Language',
        'Structured Query Language',
        'Structured Question Language',
        'System Query Language'
      ],
      1,
    ),
    Question(
      'Siapakah penemu World Wide Web (WWW)?',
      ['Tim Berners-Lee', 'Bill Gates', 'Steve Jobs', 'Larry Page'],
      0,
    ),
  ];

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
      setState(() {
        score++;
      });
    }

    if (selectedIndex != questions[currentQuestionIndex].correctIndex) {
      // Jika jawaban salah, tampilkan jawaban yang benar
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Jawaban yang Benar:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(questions[currentQuestionIndex]
                      .options[questions[currentQuestionIndex].correctIndex]),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  goToNextQuestion(); // Lanjutkan ke pertanyaan berikutnya
                },
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    } else {
      goToNextQuestion(); // Lanjutkan ke pertanyaan berikutnya
    }
  }

  void goToNextQuestion() {
    if (currentQuestionIndex == questions.length - 1) {
      // Jika pertanyaan terakhir telah dijawab
      int finalScore = score * 10; // Mengalikan score dengan 10
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThankYouPage(score: score),
        ),
      );
    } else {
      // Pindahkan pengecekan jawaban ke pertanyaan berikutnya
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xDD0024F1), Color.fromRGBO(1, 1, 61, 0.818)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pertanyaan ${currentQuestionIndex + 1}:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  questions[currentQuestionIndex].questionText,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                questions[currentQuestionIndex].options.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 18),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      questions[currentQuestionIndex].options[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  String questionText;
  List<String> options;
  int correctIndex;

  Question(this.questionText, this.options, this.correctIndex);
}
