import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _num1 = 0;
  int _num2 = 0;
  int _result = 0;
  bool _isFirstNumber = true;

  void _addNumbers() {
    setState(() {
      _result = _num1 + _num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text('CALCULATOR', textAlign: TextAlign.center, 
              style:TextStyle(fontSize: 50, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Color.fromARGB(255, 155, 198, 234),
              shadows: [Shadow(offset: Offset(2, 2), color: Color.fromARGB(255, 126, 163, 207))])),

            Stack(
              children: [
                // Big rectangle
                Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 155, 198, 234),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                // Small white rectangle
                Positioned(
                  top: 20,
                  left: 15,
                  child: Container(
                    width: 270,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        '$_result',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                // 3x3 button grid
                Positioned(
                  top: 110,
                  left: 15,
                  child: Column(
                    children: List.generate(3, (row) {
                      return Row(
                        children: List.generate(3, (col) {
                          int number = row * 3 + col + 1;
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if(_isFirstNumber)
                                  {
                                    _num1 = number;
                                    _result = _num1;
                                    _isFirstNumber = false;
                                  }
                                  else
                                  {
                                    _num2 = number;
                                    _addNumbers();
                                    _num1 = _result;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(82, 50), // button size
                              ),
                              child: Text('$number'),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 50,
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = 0;
                        _isFirstNumber = true;
                      });
                    },
                    child: Text('Restart'),
                  ),
                )

              ],
            )


          ],
        ),
      ),
      
    );
  }
}