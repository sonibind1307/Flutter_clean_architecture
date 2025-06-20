import 'package:flutter/material.dart';

class HeroFirstPage extends StatelessWidget {
  const HeroFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation - Page 1")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const HeroSecondPage()));
          },
          child: Hero(
            tag: 'hero-logo',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://flutter.dev/assets/homepage/carousel/slide_1-bg-ef59e0c08ed8a07b69972c6e7f7a7e19db76b4f676b1db4024a1b9f65de45ea5.jpg',
                width: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation - Page 2")),
      body: Center(
        child: Hero(
          tag: 'hero-logo',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://flutter.dev/assets/homepage/carousel/slide_1-bg-ef59e0c08ed8a07b69972c6e7f7a7e19db76b4f676b1db4024a1b9f65de45ea5.jpg',
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}

