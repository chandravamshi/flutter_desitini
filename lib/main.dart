import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

StroyBrain storyBrain = StroyBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  void setNext(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/background.png'))),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(fontSize: 25.0),
                  ),
                )),
            Expanded(
                flex: 2,
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      setNext(1);
                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(fontSize: 20.0),
                    ))),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green)),
                    onPressed: () {
                      setNext(2);
                    },
                    child: Text(storyBrain.getChoice2(),
                        style: const TextStyle(fontSize: 20.0))),
              ),
            )
          ],
        )),
      ),
    );
  }
}
