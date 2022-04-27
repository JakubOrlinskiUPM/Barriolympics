import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEventStepNavigation extends StatelessWidget {
  const EditEventStepNavigation({
    Key? key,
    required this.index,
    required this.isSaveEnabled,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final int index;
  final bool isSaveEnabled;
  final Function nextStep;
  final Function previousStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index > 0
              ? TextButton.icon(
                  onPressed: () {
                    previousStep();
                  },
                  icon: Icon(Icons.navigate_before),
                  label: Text("Back"),
                )
              : Container(),
          ElevatedButton.icon(
            onPressed: isSaveEnabled
                ? () {
                    nextStep();
                  }
                : null,
            icon: Icon(Icons.save_outlined),
            label: Text("Save"),
          ),
        ],
      ),
    );
  }
}
