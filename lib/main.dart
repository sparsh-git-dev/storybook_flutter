/// A complete example for Widgetbook manual approach
///
/// Use [WidgetbookFolder],[WidgetbookComponent], and [WidgetbookUseCase]
/// to create directories
/// [Ref link]: https://docs.widgetbook.io/getting-started/complete-example
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart' hide AlignmentAddon;

import 'components/container.dart';
import 'components/custom_card.dart';
import 'components/custom_text_field.dart';
import 'customs/custom_addon.dart';
import 'customs/custom_knob.dart';

void main() {
  runApp(WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  WidgetbookApp({super.key});
  bool radioButton = true;
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        AlignmentAddon(),
      ],
      directories: [
        WidgetbookFolder(
          name: 'Widgets',
          children: [
            WidgetbookComponent(
              name: 'CustomContainer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => greenContainerUseCase(context),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'CustomCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => const CustomCard(
                    child: Text('This is a custom card'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Custom Background Color',
                  builder: (context) => CustomCard(
                    backgroundColor: Colors.green.shade100,
                    child: const Text(
                      'This is a custom card with a custom background color',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Colored contanier',
              useCases: [
                WidgetbookUseCase(
                  name: 'green color',
                  builder: (context) => Container(
                    height: 200,
                    width: 200,
                    color: Colors.greenAccent,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'yellow color',
                  builder: (context) => Container(
                    height: 200,
                    width: 200,
                    color: Colors.yellow,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'blue color',
                  builder: (context) => Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Toggle Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'blue toggle button',
                  builder: (context) =>
                      StatefulBuilder(builder: (context, setStater) {
                    return CupertinoSwitch(
                        activeColor: Colors.blue,
                        value: radioButton,
                        onChanged: (value) {
                          setStater(
                            () {
                              radioButton = value;
                            },
                          );
                        });
                  }),
                ),
              ],
            ),
            // CustomTextField component use-cases
            WidgetbookComponent(
              name: 'CustomTextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => TextFormField(
                    style: TextStyle(color: Colors.blue), // Text color
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.yellow, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                      ),
                      labelText: 'Enter text',
                      labelStyle: TextStyle(color: Colors.pink), // Label color
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Hint Text',
                  builder: (context) => TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                      hintText: 'Enter text',
                      hintStyle: TextStyle(color: Colors.orange), // Label color
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'knobs',
          children: [
            WidgetbookComponent(
              name: 'RangeSlider',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) =>
                      StatefulBuilder(builder: (context, setstater) {
                    return Slider(
                      min: 0.0,
                      max: 100.0,
                      value: sliderValue,
                      onChanged: (value) {
                        setstater(() {
                          sliderValue = value;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
