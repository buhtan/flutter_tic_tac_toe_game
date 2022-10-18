import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int xpuan = 0;
  int opuan = 0;
  bool isChange = true;
  int drawP = 0;
  List<String> tic = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Skor taplosu',
                    style: myNewFontWhite,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Oyuncu X: ',
                            style: myNewFontWhite,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            xpuan.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                      Text('    '),
                      Column(
                        children: [
                          Text(
                            'Oyuncu O:',
                            style: myNewFontWhite,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            opuan.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (isChange && tic[index] == '') {
                        setState(() {
                          tic[index] = 'X';
                          isChange = !isChange;
                          win();
                          drawP += 1;
                          if (drawP == 9) {
                            showDraw();
                            drawP = 0;
                          }
                        });
                      } else if (isChange == false && tic[index] == '') {
                        setState(() {
                          tic[index] = 'O';
                          isChange = !isChange;
                          win();

                          drawP += 1;
                          if (drawP == 9) {
                            showDraw();
                            drawP = 0;
                          }
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey)),
                      child: Center(
                        child: Text(tic[index], style: myNewFontWhite),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'TİC TAC TOE',
                    style: myNewFontWhite,
                  ),
                  Text(
                    '@BUHTANTURHAN',
                    style: myNewFontWhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void win() {
    if (tic[0] == tic[1] && tic[0] == tic[2] && tic[0] != '') {
      showWin(tic[0]);
    }
    if (tic[3] == tic[4] && tic[3] == tic[5] && tic[3] != '') {
      showWin(tic[3]);
    }
    if (tic[6] == tic[7] && tic[6] == tic[8] && tic[6] != '') {
      showWin(tic[6]);
    }
    if (tic[0] == tic[3] && tic[0] == tic[6] && tic[0] != '') {
      showWin(tic[0]);
    }
    if (tic[1] == tic[4] && tic[1] == tic[7] && tic[1] != '') {
      showWin(tic[1]);
    }
    if (tic[2] == tic[5] && tic[2] == tic[8] && tic[2] != '') {
      showWin(tic[2]);
    }
    if (tic[6] == tic[4] && tic[6] == tic[2] && tic[6] != '') {
      showWin(tic[6]);
    }
    if (tic[0] == tic[4] && tic[0] == tic[8] && tic[0] != '') {
      showWin(tic[0]);
    }
  }

  void showWin(String x) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.grey[700],
            title: Text(
              'Kazanan ' + x + ' Tarafı!!!',
              style: myNewFontWhite,
              textAlign: TextAlign.center,
            ),
          );
        });
    if (x == 'X') {
      xpuan += 1;
    } else {
      opuan += 1;
    }

    for (int i = 0; i < tic.length; i++) {
      tic[i] = '';
    }

    setState(() {
      drawP = 0;
    });
  }

  void showDraw() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.grey[700],
            title: Center(
                child: Text(
              'Berabere :<',
              style: myNewFontWhite,
            )),
          );
        });
    for (int i = 0; i < tic.length; i++) {
      tic[i] = '';
    }

    setState(() {
      drawP = 0;
    });
  }
}
