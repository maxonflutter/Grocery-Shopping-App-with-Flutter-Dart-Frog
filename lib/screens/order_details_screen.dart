import 'package:flutter/material.dart' hide Step, Stepper;

import '../widgets/app_stepper.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://images.unsplash.com/photo-1514425263458-109317cc1321?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3464&q=80',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            leading: BackButton(),
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.help_outline),
                label: const Text('Order Help'),
              ),
              const SizedBox(width: 8.0)
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: colorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ORDER STATUS',
                              style: textTheme.bodyLarge!.copyWith(
                                color: colorScheme.onInverseSurface,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Prepping',
                              style: textTheme.headlineSmall!.copyWith(
                                color: colorScheme.onInverseSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'READY BY',
                              style: textTheme.bodyLarge!.copyWith(
                                color: colorScheme.onInverseSurface,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '04:30 PM',
                              style: textTheme.headlineSmall!.copyWith(
                                color: colorScheme.onInverseSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                      child: HorizontalStepper(
                        steps: [
                          Step(
                            icon: Icons.receipt_long,
                            isCompleted: true,
                          ),
                          Step(icon: Icons.store),
                          Step(icon: Icons.location_on),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withAlpha(245),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(48.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Details',
                            style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('#123456', style: textTheme.bodyLarge),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 16.0),
                      Stepper(
                        steps: [
                          Step(
                            icon: Icons.shopping_cart,
                            title: Text(
                              'Pick Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Order placed on Nov 10th at 4:27pm',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Step(
                            icon: Icons.location_on,
                            title: Text(
                              'Drop Off',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              '2800 Wilshire Blvd, Santa Monica, CA 90403',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: 64,
            color: colorScheme.primaryContainer,
            elevation: 0.0,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 8.0,
            ),
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 48.0),
                backgroundColor: colorScheme.background,
                foregroundColor: colorScheme.primary,
              ),
              child: Text(
                'Order Again',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
