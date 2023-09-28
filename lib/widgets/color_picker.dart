import 'package:flutter/material.dart';
import 'package:full_example/enterprise_color_picker/colorpicker.dart';

class PrimaryThemeSelectionWidget extends StatefulWidget {
  final Color primaryColorCode;
  const PrimaryThemeSelectionWidget(
      {super.key, required this.primaryColorCode});

  @override
  State<PrimaryThemeSelectionWidget> createState() =>
      _PrimaryThemeSelectionWidgetState();
}

class _PrimaryThemeSelectionWidgetState
    extends State<PrimaryThemeSelectionWidget> {
  // late String colorValue;
  // late Color selectedPrimaryColor;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   selectedPrimaryColor = widget.primaryColorCode;
  //   colorValue =
  //       "#${widget.primaryColorCode.toString().split("xff")[1].replaceAll(")", "")}";
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(covariant PrimaryThemeSelectionWidget oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   setState(() {
  //     selectedPrimaryColor = widget.primaryColorCode;
  //     colorValue =
  //         "#${widget.primaryColorCode.toString().split("xff")[1].replaceAll(")", "")}";
  //   });
  //   super.didUpdateWidget(oldWidget);
  // }

  Color selectedPrimaryColor = Colors.blue;
  String colorValue = "#206574";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: selectedPrimaryColor,
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            const SizedBox(width: 8.0),
            Container(
              height: 55,
              width: 200,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F4F7), //AppColors.grey3,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  colorValue,
                  // style: AppStyle().regularStyle.copyWith(
                  //     fontSize: AppStyle.fontSize14,
                  //     fontWeight: FontWeight.w400,
                  //     color: AppColors.grey9),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 500),
        CustomColorPicker(
          hexInputBar: true,
          enableAlpha: false,
          pickerColor: Colors.blueGrey,
          onColorChanged: (Color value) {
            if (ThemeData.estimateBrightnessForColor(value) ==
                Brightness.dark) {
              setState(() {
                selectedPrimaryColor = value;
                colorValue =
                    "#${value.toString().split("xff")[1].replaceAll(")", "")}";
              });
            } else {}
          },
          //themeLogic.getCustomThemeColor.primaryColor,
          //onColorChanged: themeLogic.setCustomPrimaryThemeColor,
        ),
      ],
    );
  }
}
