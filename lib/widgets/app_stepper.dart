import 'package:flutter/material.dart' hide Step, Stepper;

@immutable
class Step {
  const Step({
    required this.icon,
    this.title,
    this.content,
    this.isCompleted = false,
  });

  final IconData icon;
  final Widget? title;
  final Widget? content;
  final bool isCompleted;
}

class Stepper extends StatelessWidget {
  const Stepper({
    super.key,
    required this.steps,
  });

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < steps.length; i += 1)
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          width: 48.0,
                          height: 48.0,
                          child: Icon(
                            steps[i].icon,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(start: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [steps[i].title ?? const SizedBox()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  steps.length - 1 == i
                      ? Container()
                      : PositionedDirectional(
                          start: 24.0,
                          top: 8.0,
                          bottom: 8.0,
                          child: SizedBox(
                            width: 24.0,
                            child: Center(child: _buildDashedLine(context)),
                          ),
                        ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                      start: 70.0,
                      end: 24.0,
                      bottom: 24.0,
                    ),
                    child: Column(
                        children: [steps[i].content ?? const SizedBox()]),
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }

  _buildDashedLine(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.vertical,
      children: List.generate(5, (_) {
        return Center(
          child: SizedBox(
            width: 1.0,
            height: 8.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class HorizontalStepper extends StatelessWidget {
  const HorizontalStepper({
    super.key,
    required this.steps,
  });

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(60, 0),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              children: [
                for (int i = 0; i < steps.length; i += 1)
                  Expanded(
                    flex: i == 1 ? 2 : 1,
                    child: steps.length - 1 == i
                        ? Container()
                        : SizedBox(
                            height: 1.0,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: steps[i].isCompleted
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                              ),
                            ),
                          ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            children: [
              for (int i = 0; i < steps.length; i += 1)
                Expanded(
                  flex: i == 1 ? 2 : 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: (i == 0) ? 0.0 : 8.0,
                      right: (i == steps.length - 1) ? 0.0 : 4.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: steps[i].isCompleted
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      width: 48.0,
                      height: 48.0,
                      child: Icon(
                        steps[i].icon,
                        color: steps[i].isCompleted
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
