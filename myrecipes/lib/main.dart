import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeList(),
    );
  }
}

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List of favourite recipes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'These are my favourite recipes',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RecipeCard(
            'mutton',
            'Wash, fry, spice, cook and serve',
            'https://tinyurl.com/4ww8shs3',
          ),
          RecipeCard(
            'spanish omelette',
            'Deep frying the potatoes in 1 – 2 cups of oil, depending on how many potatoes you are using. My mother, however, has managed to cut this amount down to 1/2 a cup, which gives exactly the same crisp and golden results, with half the fat! So long as you use a good quality nonstick pan to prevent sticking, 1/2 cup is the perfect amount of oil.',
            'https://tinyurl.com/24xe8jmv',
          ),
          RecipeCard(
            'beef stew',
            'Boil rice, cook beef and serve',
            'https://tinyurl.com/yje82j6y',
          ),
          RecipeCard(
            'pizza',
            'Prepare dough, add meat, chicken or any preferred flavor',
            'https://tinyurl.com/yej68ctc',
          )
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  RecipeCard(this.title, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        leading: Image.network(
          imageUrl,
          width: 75.0,
          height: 75.0,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetails(title, description, imageUrl),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  RecipeDetails(this.title, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
