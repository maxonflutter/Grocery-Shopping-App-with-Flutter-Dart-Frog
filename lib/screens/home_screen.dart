import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../widgets/app_bottom_nav_bar.dart';
import '../widgets/grocery_search_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final categories = Category.sampleData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Pickup',
              style: textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Location 1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              isLabelVisible: true,
              label: Text('2'),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: GrocerySearchTextFormField(),
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle(
              textTheme,
              'Popular Categories',
              onPressed: () {},
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      context.goNamed(
                        'category',
                        pathParameters: {'categoryId': category.id},
                      );
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Image.network(
                            category.imageUrl!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8.0),
                          Text(category.name, maxLines: 2),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSectionTitle(
    TextTheme textTheme,
    String title, {
    VoidCallback? onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
