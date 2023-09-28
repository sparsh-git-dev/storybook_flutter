/// A complete example for Widgetbook manual approach
///
/// Use [WidgetbookFolder],[WidgetbookComponent], and [WidgetbookUseCase]
/// to create directories
/// [Ref link]: https://docs.widgetbook.io/getting-started/complete-example
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_example/widgets/check_box.dart';
import 'package:full_example/widgets/color_picker.dart';
import 'package:full_example/widgets/drop_down_widget.dart';
import 'package:full_example/widgets/elevated_button_widget.dart';
import 'package:full_example/widgets/elevated_button_widget_cancel.dart';
import 'package:full_example/widgets/first_name_text_field_widget.dart';
import 'package:full_example/widgets/last_name_text_field_widget.dart';
import 'package:full_example/widgets/radio_button.dart';
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
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Cancel Button',
                  builder: (context) => ElevatedButtonCancelWidget(),
                ),
                WidgetbookUseCase(
                  name: 'Save Button',
                  builder: (context) => ElevatedButtonSaveWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TextForm Fields',
              useCases: [
                WidgetbookUseCase(
                  name: 'First Name Text Field',
                  builder: (context) => const FirstNameTextFieldWidget(),
                ),
                WidgetbookUseCase(
                  name: 'Last Name Text Field',
                  builder: (context) => const LastNameTextFieldWidget(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Color picker',
              useCases: [
                WidgetbookUseCase(
                  name: 'primary color',
                  builder: (context) => const PrimaryThemeSelectionWidget(
                    primaryColorCode: Colors.green,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Check boxes',
              useCases: [
                WidgetbookUseCase(
                  name: 'Custom check box',
                  builder: (context) => CustomCheckboxListTile(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Radio button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Custom radio button',
                  builder: (context) => CustomRadioButton(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Dropdown',
              useCases: [
                WidgetbookUseCase(
                  name: 'Drop down widget',
                  builder: (context) => dropDownWidget(),
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

class StarWithCollar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(100, 100), // Adjust the size as needed
        painter: StarWithCollarPainter(),
      ),
    );
  }
}

class StarWithCollarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white // White collar color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width * 0.7, size.height * 0.7)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.85)
      ..lineTo(size.width * 0.25, size.height)
      ..lineTo(size.width * 0.3, size.height * 0.7)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
