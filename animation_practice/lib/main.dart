import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Flutter code sample for [Hero].

void main() {
  // Slow down time to see Hero flight animation.
  timeDilation = 8.0;
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HeroExample(),
    );
  }
}

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animation Practice'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          ListTile(
            leading: Hero(
              tag: 'hero-default-tween',
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.limeAccent[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'Uses default rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: Hero(
              tag: 'hero-custom-tween',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.pink[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'Uses custom rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => _gotoDetailsPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Click me',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Page'),
        ),
        body: Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: 'hero-custom-tween',
                createRectTween: (Rect? begin, Rect? end) {
                  return MaterialRectCenterArcTween(begin: begin, end: end);
                },
                child: BoxWidget(
                  size: const Size(800.0, 800.0),
                  color: Colors.limeAccent[700]!.withOpacity(0.5),
                ),
              ),
              Hero(
                tag: 'hero-default-tween',
                child: BoxWidget(
                  size: const Size(800.0, 800.0),
                  color: Colors.pink[700]!.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
    );
  }
}
