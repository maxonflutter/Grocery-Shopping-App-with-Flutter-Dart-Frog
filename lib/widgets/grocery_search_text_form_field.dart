import 'package:flutter/material.dart';

class GrocerySearchTextFormField extends StatelessWidget {
  const GrocerySearchTextFormField({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: TextFormField(
        onTap: onTap,
        style: textTheme.bodyMedium!.copyWith(
          color: colorScheme.onPrimary,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          hintText: 'Search',
          hintStyle: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onPrimary,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onPrimary,
          ),
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
