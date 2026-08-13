import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/logic/providers/them_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/utils_app_helper.dart';
import '../../../../generated/assets.dart';

class CustomDropDownThem extends StatefulWidget {
  const CustomDropDownThem({super.key});

  @override
  State<CustomDropDownThem> createState() => _CustomDropDownThemState();
}

class _CustomDropDownThemState extends State<CustomDropDownThem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    final TextTheme textThem = GetThemData.getTextThemData(context);
    ThemeMode currentThem = Provider.of<ThemProvider>(context).currentThem;
    return DropdownMenu<ThemeMode>(
      initialSelection: currentThem,
      scrollPadding: .zero,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: .zero,
      ),
      width: 100,
      textAlign: .end,
      leadingIcon: const SizedBox(),
      alignmentOffset: const Offset(20, 0),
      trailingIcon: SvgPicture.asset(
        Assets.icons.dropDownIcon.path,
        fit: BoxFit.scaleDown,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          colorThem.secondaryHeaderColor,
          BlendMode.srcIn,
        ),
      ),
      selectedTrailingIcon: SvgPicture.asset(
        Assets.icons.dropDownIcon.path,
        fit: BoxFit.scaleDown,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          colorThem.secondaryHeaderColor,
          BlendMode.srcIn,
        ),
      ),
      menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(colorThem.primaryColor),
          alignment: .bottomStart,
          padding: const WidgetStatePropertyAll(
                  .zero
          )
      ),
      menuHeight: double.infinity,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: ThemeMode.dark,
          label: AppText.dark,
          enabled: true,
          style: ButtonStyle(
            alignment: .center,
            foregroundColor: WidgetStatePropertyAll(colorThem.secondaryHeaderColor),
            padding: const WidgetStatePropertyAll(.zero),
            textStyle: WidgetStatePropertyAll(textThem.bodyMedium),
          ),
        ),
        DropdownMenuEntry(
          value: ThemeMode.light,
          label: AppText.light,
          enabled: true,
          style: ButtonStyle(
            alignment: .center,
            padding: const WidgetStatePropertyAll(.zero),
            foregroundColor: WidgetStatePropertyAll(colorThem.secondaryHeaderColor),
            textStyle: WidgetStatePropertyAll(textThem.bodyMedium),
          ),
        ),
      ],
      onSelected: (themeMode) {
        if (themeMode != null) {
          changeThem(themeMode);
        }
      },
    );
  }

  void changeThem(ThemeMode newThem) {
    Provider.of<ThemProvider>(
      context,
      listen: false,
    ).changeThemMode(newThem: newThem);
  }
}