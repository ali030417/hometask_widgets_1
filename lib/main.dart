import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BodyPart? deffendingBodyPart;
  BodyPart? attacingBodyPart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd5def0),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Row(
            children: [
              SizedBox(width: 16),
              Expanded(child: Center(child: Column(
                children: [
                  Text('You'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                ],
              ))),
              SizedBox(width: 12),
              Expanded(child: Center(child: Column(
                children: [
                  Text('Empty'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                ],
              ))),
              SizedBox(width: 16),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text('Deffend'.toUpperCase()),
                    const SizedBox(height: 13),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: deffendingBodyPart == BodyPart.head,
                      bodyPartSetter: _selectDeffendingBodyPart,
                    ),
                    const SizedBox(height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: deffendingBodyPart == BodyPart.torso,
                      bodyPartSetter: _selectDeffendingBodyPart,
                    ),
                    const SizedBox(height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: deffendingBodyPart == BodyPart.legs,
                      bodyPartSetter: _selectDeffendingBodyPart,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Text('Attact'.toUpperCase()),
                    const SizedBox(height: 13),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: attacingBodyPart == BodyPart.head,
                      bodyPartSetter: _selectAttacingBodyPart,
                    ),
                    const SizedBox(height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: attacingBodyPart == BodyPart.torso,
                      bodyPartSetter: _selectAttacingBodyPart,
                    ),
                    const SizedBox(height: 13),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: attacingBodyPart == BodyPart.legs,
                      bodyPartSetter: _selectAttacingBodyPart,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: (){
                      if(attacingBodyPart != null && deffendingBodyPart != null){
                        setState(() {
                          attacingBodyPart = null;
                          deffendingBodyPart = null;
                        });
                      }
                    },
                    child: ColoredBox(
                      color: attacingBodyPart == null || deffendingBodyPart == null ? Colors.black38 : const Color.fromRGBO(0, 0, 0, 87),
                      child: Center(
                        child: Text(
                          'Go'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(
            height: 40
          )
        ],
      ),
    );
  }

  void _selectDeffendingBodyPart(final BodyPart value) {
    setState(() {
      deffendingBodyPart = value;
    });
  }

  void _selectAttacingBodyPart(final BodyPart value) {
    setState(() {
      attacingBodyPart = value;
    });
  }
}

class BodyPart {
  final String name;

  const BodyPart._(this.name);

  static const head = BodyPart._('Head');
  static const torso = BodyPart._('Torso');
  static const legs = BodyPart._('Legs');

  @override
  String toString() {
    return 'BodyPart{name: $name}';
  }
}

class BodyPartButton extends StatelessWidget {
  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyPartSetter;

  const BodyPartButton({
    super.key,
    required this.bodyPart,
    required this.selected,
    required this.bodyPartSetter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyPartSetter(bodyPart),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
          color:
              selected ? const Color(0xff1C79CE): Colors.black38,
          child: Center(
            child: Text(bodyPart.name.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
