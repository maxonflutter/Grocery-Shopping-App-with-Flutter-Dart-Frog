import 'package:flutter/material.dart';

class GrocerySearchTextFormField extends StatelessWidget {
  const GrocerySearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onPrimary.withAlpha(200),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onPrimary,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: colorScheme.onPrimaryContainer.withAlpha(100),
        ),
      ),
    );
  }
}
