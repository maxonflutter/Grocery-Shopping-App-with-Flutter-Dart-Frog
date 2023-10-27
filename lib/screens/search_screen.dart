import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../widgets/grocery_search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        toolbarHeight: 64,
        title: const Hero(
          tag: 'grocery_search_text_form_field',
          child: GrocerySearchTextFormField(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TRENDING SEARCHES',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.local_fire_department),
                    title: Text('Trending Search $index'),
                  ).animate(delay: const Duration(milliseconds: 800)).fadeIn(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 400),
                        begin: 0.0,
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
