import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'max_cost_widget.g.dart';

@riverpod
class MaxCost extends _$MaxCost {
  @override
  int build() => 25;

  void setMaxCost(int value) {
    state = value;
  }
}

class MaxCostWidget extends ConsumerStatefulWidget {
  const MaxCostWidget({super.key});

  @override
  ConsumerState<MaxCostWidget> createState() => _MaxCostWidgetState();
}

class _MaxCostWidgetState extends ConsumerState<MaxCostWidget> {
  int maxCost = 25;

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(maxCostProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Max Cost',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  min: 15,
                  max: 25,
                  value: maxCost.toDouble(),
                  onChanged: (value) {
                    setState(() => maxCost = value.toInt());
                  },
                  onChangeEnd: (value) {
                    ref
                        .read(maxCostProvider.notifier)
                        .setMaxCost(value.toInt());
                  },
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(maxCost.toString()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
