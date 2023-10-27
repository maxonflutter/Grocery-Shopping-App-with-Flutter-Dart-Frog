import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/category/category_bloc.dart';
import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';
import '../widgets/app_app_bar.dart';
import '../widgets/app_bottom_nav_bar.dart';
import '../widgets/grocery_modal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(
        categoryRepository: context.read<CategoryRepository>(),
        productRepository: context.read<ProductRepository>(),
      )..add(CategoryLoadEvent(categoryId: categoryId)),
      child: const CategoryView(),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppAppBar(),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state.status == CategoryStatus.initial ||
              state.status == CategoryStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == CategoryStatus.loaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.category!.name,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              builder: (context) {
                                return const GroceryModal(
                                  children: [
                                    _CategoryFilterPickerModal(),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.tune),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.categoryProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final product = state.categoryProducts[index];
                        return Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    product.imageUrl,
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 8.0,
                                    right: 8.0,
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<CartBloc>().add(
                                              AddToCart(
                                                userId: '12345',
                                                product: product,
                                              ),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                product.name,
                                style: textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              Text('${product.price}', maxLines: 1),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong!');
          }
        },
      ),
      bottomNavigationBar: const AppBottomNavBar(index: 1),
    );
  }
}

class _CategoryFilterPickerModal extends StatefulWidget {
  const _CategoryFilterPickerModal();

  @override
  State<_CategoryFilterPickerModal> createState() =>
      _CategoryFilterPickerModalState();
}

class _CategoryFilterPickerModalState
    extends State<_CategoryFilterPickerModal> {
  final TextEditingController categorySortByController =
      TextEditingController();
  late CategorySortBy? selectedCategorySortBy;
  late Map<CategoryPreferences, bool> checkboxValues;

  @override
  void initState() {
    selectedCategorySortBy = CategorySortBy.lowToHighPrice;
    checkboxValues = <CategoryPreferences, bool>{
      for (var v in CategoryPreferences.values) v: false
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<CategorySortBy>> iconEntries =
        <DropdownMenuEntry<CategorySortBy>>[];

    for (final CategorySortBy icon in CategorySortBy.values) {
      iconEntries.add(
        DropdownMenuEntry<CategorySortBy>(
          value: icon,
          label: icon.label,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sort By',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            DropdownMenu<CategorySortBy>(
              initialSelection: selectedCategorySortBy,
              controller: categorySortByController,
              width: constraints.maxWidth,
              leadingIcon: const Icon(Icons.swap_vert, color: Colors.white),
              textStyle: const TextStyle(color: Colors.white),
              dropdownMenuEntries: iconEntries,
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                outlineBorder: BorderSide.none,
              ),
              onSelected: (CategorySortBy? categorySortBy) {
                setState(() {
                  selectedCategorySortBy = categorySortBy;
                });
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Preferences',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            ...CategoryPreferences.values.map((e) {
              return _buildCheckbox(
                e.label,
                checkboxValues[e]!,
                (bool? value) {
                  setState(() {
                    checkboxValues[e] = value!;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                    child: Text(
                      'Clear',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('See Results'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  CheckboxListTile _buildCheckbox(
    String title,
    bool value,
    void Function(bool?) onChanged,
  ) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white)),
    );
  }
}
