import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Keyboard extends StatefulWidget {

  final List<String> labels;
  final void Function(String)? onPressed;

  const Keyboard(this.labels, this.onPressed, {GlobalKey? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => KeyboardState();
}

class KeyboardState extends State<Keyboard> {
  late final Map<String, bool> states;

  void reset() => setState(() {
        states.updateAll((key, value) => true);
  });

  @override
  void initState() {
    states = Map.fromIterables(
        widget.labels, List.filled(widget.labels.length, true));
  }

  void handlePress(String label) {
    if(widget.onPressed != null) {
      setState(() {
      states.update(label, (value) => false);
      widget.onPressed!(label);
    });
    }
  }



  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        padding: const EdgeInsets.all(6),
        crossAxisCount: 8,
        children: states.entries.map((state) => TextButton(
            onPressed: () => state.value ? handlePress(state.key) : null,
            child: Text(state.key),
            style: TextButton.styleFrom(
                backgroundColor: state.value ? Colors.lightGreenAccent : Colors.redAccent))).toList()
    );
  }
}
