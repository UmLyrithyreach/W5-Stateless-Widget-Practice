import 'package:flutter/material.dart';

enum ProductType { Dart, Flutter, Firebase }

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        backgroundColor: Colors.blue, // 🔹 background like in your image
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductItem(
                text: 'Dart',
                description: 'Programming language',
                type: ProductType.Dart,
              ),
              SizedBox(height: 16),
              ProductItem(
                text: 'Flutter',
                description: 'UI toolkit',
                type: ProductType.Flutter,
              ),
              SizedBox(height: 16),
              ProductItem(
                text: 'Firebase',
                description: 'Backend services',
                type: ProductType.Firebase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const ProductCard({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children,
    );
  }
}

class ProductItem extends StatelessWidget {
  final String text;
  final String description;
  final ProductType type;

  const ProductItem({
    super.key,
    required this.text,
    required this.description,
    required this.type,
  });

  String get _assetPath {
    switch (type) {
      case ProductType.Dart:
        return 'lib/assets/assets/ex3/dart.png';
      case ProductType.Flutter:
        return 'lib/assets/assets/ex3/flutter.png';
      case ProductType.Firebase:
        return 'lib/assets/assets/ex3/firebase.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: ProductCard(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(_assetPath, width: 80, height: 80),
          const SizedBox(height: 16),
          ProductCard(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
