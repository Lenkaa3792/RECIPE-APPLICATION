import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
            'Mutton Curry',
            'Wash, fry, spice, cook and serve',
            'https://tinyurl.com/4ww8shs3',
            [
              '500g mutton',
              '2 onions, finely chopped',
              '2 tomatoes, pureed',
              '1/2 cup yogurt',
              '1 tablespoon ginger-garlic paste',
              '1 teaspoon garam masala',
              '1 teaspoon turmeric powder',
              'Salt to taste',
            ],
            [
              'Wash the mutton thoroughly.',
              'Fry chopped onions until golden brown.',
              'Add ginger-garlic paste and sauté for 2 minutes.',
              'Add mutton and cook until browned.',
              'Add tomato puree, yogurt, and spices.',
              'Cook until mutton is tender.',
              'Garnish with coriander leaves and serve hot.'
            ],
          ),
          RecipeCard(
            'Spanish Omelette',
            'Deep frying the potatoes in 1 – 2 cups of oil, depending on how many potatoes you are using...',
            'https://tinyurl.com/24xe8jmv',
            [
              '4 potatoes, thinly sliced',
              '1 onion, sliced',
              '6 eggs',
              '1/2 cup olive oil',
              'Salt and pepper to taste',
            ],
            [
              'Heat olive oil in a non-stick pan.',
              'Fry the sliced potatoes until golden brown.',
              'Add sliced onions and cook until soft.',
              'Beat eggs, season with salt and pepper.',
              'Pour the egg mixture over the potatoes and onions.',
              'Cook until the edges set, then flip and cook the other side.',
              'Serve hot and enjoy!'
            ],
          ),
          RecipeCard(
            'Beef Stew',
            'Boil rice, cook beef and serve',
            'https://tinyurl.com/yje82j6y',
            [
              '500g beef, cubed',
              '3 carrots, sliced',
              '2 potatoes, diced',
              '1 onion, chopped',
              '2 cloves garlic, minced',
              '4 cups beef broth',
              '1/2 cup tomato paste',
              '1 teaspoon thyme',
              'Salt and pepper to taste',
            ],
            [
              'In a large pot, brown the beef over medium heat.',
              'Add garlic and onions, sauté until fragrant.',
              'Stir in tomato paste, beef broth, and thyme.',
              'Add carrots and potatoes, bring to a boil.',
              'Reduce heat and simmer until beef and vegetables are tender.',
              'Season with salt and pepper.',
              'Serve hot with rice.'
            ],
          ),
          RecipeCard(
            'Pizza',
            'Prepare dough, add meat, chicken or any preferred flavor',
            'https://tinyurl.com/yej68ctc',
            [
              'Pizza dough',
              '1/2 cup tomato sauce',
              '1 cup shredded mozzarella cheese',
              'Toppings of your choice (pepperoni, mushrooms, olives, etc.)',
            ],
            [
              'Preheat oven to 475°F (245°C).',
              'Roll out pizza dough and place on a baking sheet.',
              'Spread tomato sauce over the dough.',
              'Sprinkle shredded mozzarella cheese evenly.',
              'Add your favorite toppings.',
              'Bake in the preheated oven until the crust is golden and the cheese is bubbly.',
              'Slice and enjoy!'
            ],
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeCard(this.title, this.description, this.imageUrl, this.ingredients, this.instructions);

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
              builder: (context) => RecipeDetails(title, description, imageUrl, ingredients, instructions),
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
  final List<String> ingredients;
  final List<String> instructions;

  RecipeDetails(this.title, this.description, this.imageUrl, this.ingredients, this.instructions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            SectionTitle('Ingredients'),
            buildList(ingredients),
            SectionTitle('Instructions'),
            buildList(instructions),
          ],
        ),
      ),
    );
  }

  Widget buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('• $item', style: TextStyle(fontSize: 16.0)),
              ))
          .toList(),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
