import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPianoScreen extends StatefulWidget {
  static const routeName = '/quiz-piano';

  const QuizPianoScreen({Key? key}) : super(key: key);

  @override
  State<QuizPianoScreen> createState() => _QuizPianoScreenState();
}

class _QuizPianoScreenState extends State<QuizPianoScreen> {
  PageController controller = PageController(initialPage: 0);
  int pertanyaanSekarang = 0;
  int skor = 0;

  List questions = [
    {
      "question": "Apa judul lagu yang termasuk pada piano grade 3",
      "answer": "A1: Minuet in G",
      "options": ["Minum", "Makan", "A1: Minuet in G", "Tidur"]
    },
    {
      "question": "Apa judul lagu yang termasuk pada piano grade 5",
      "answer": "A1: Allegro",
      "options": ["Minum", "Mandi", "A1: Allegro", "Tidur"]
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Piano - Soal ${pertanyaanSekarang + 1}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.lightBlue, Colors.lightBlue.shade200]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
          child: PageView.builder(
            itemCount: questions.length,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            itemBuilder: (context, index) {
              List options = questions[index]['options'];
              options.shuffle();
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                          "${pertanyaanSekarang + 1} / ${questions.length}"
                      )
                  ),
                  Card(
                    margin: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: Text(
                          questions[index]['question'],
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                        child: GridView.builder(
                          padding: EdgeInsets.all(16),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.7),
                          itemCount: options.length,
                          itemBuilder: (context, i) {
                            String option = options[i];
                            return InkWell(
                              onTap: () {
                                if(index + 1 == questions.length) {
                                  if(option == questions[index]['answer']) {
                                    skor += 1;
                                  }
                                  showDialog(context: context, barrierDismissible: false, builder: (context) {
                                    return WillPopScope(
                                      onWillPop: () async => false,
                                      child: AlertDialog(
                                        title: const Text(
                                          "Skor Akhir",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          "$skor / ${questions.length}",
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          ElevatedButton.icon(
                                            label: Text("Restart"),
                                            icon: const Icon(Icons.restart_alt),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                skor = 0;
                                                questions.shuffle();
                                                pertanyaanSekarang = 0;
                                                controller.jumpToPage(0);
                                              });
                                            },
                                          ),
                                          ElevatedButton.icon(
                                            label: Text("Selesai"),
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.of(context).popUntil(ModalRoute.withName('/detail'));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                } else {
                                  if(option == questions[index]['answer']){
                                    skor += 1;
                                  }
                                  setState(() {
                                    pertanyaanSekarang += 1;
                                  });
                                  controller.jumpToPage(index + 1);
                                }
                              },
                              child: Card(
                                child: Center(
                                  child: Text(option),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
