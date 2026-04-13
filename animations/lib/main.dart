//Group 5 (details of members in README)

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit & Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ExplicitAnimationWidget(),
            Divider(thickness: 2),
            ImplicitAnimationWidget(),
          ],
        ),
      ),
    );
  }
}

class ExplicitAnimationWidget extends StatefulWidget {
  const ExplicitAnimationWidget({super.key});

  @override
  State<ExplicitAnimationWidget> createState() => _ExplicitAnimationWidgetState();
}

class _ExplicitAnimationWidgetState extends State<ExplicitAnimationWidget>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Explicit Animation (AnimationController)', 
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        FadeTransition(
          opacity: _animation,
          child: const FlutterLogo(size: 100),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
          },
          child: const Text('Replay Explicit Fade'),
        )
      ],
    );
  }
}

class ImplicitAnimationWidget extends StatefulWidget {
  const ImplicitAnimationWidget({super.key});

  @override
  State<ImplicitAnimationWidget> createState() => _ImplicitAnimationWidgetState();
}

class _ImplicitAnimationWidgetState extends State<ImplicitAnimationWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Implicit Animation (AnimatedContainer)', 
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          // Changing the size implicitly
          width: _isVisible ? 120 : 0,
          height: _isVisible ? 120 : 0,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _isVisible ? 1.0 : 0.0,
            child: const FlutterLogo(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: const Text('Toggle Implicit Fade'),
        )
      ],
    );
  }
}