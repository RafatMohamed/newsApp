import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/logic/providers/localization.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/utils_app_helper.dart';
import '../../../../generated/assets.dart';

class CustomDropDownLanguage extends StatefulWidget {
  const CustomDropDownLanguage({super.key});

  @override
  State<CustomDropDownLanguage> createState() => _CustomDropDownLanguageState();
}

class _CustomDropDownLanguageState extends State<CustomDropDownLanguage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    final TextTheme textThem = GetThemData.getTextThemData(context);
    return DropdownMenu<Locale>(
      initialSelection: context.locale,
      scrollPadding: .zero,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: .zero,
      ),
      width: 80,
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
          value: const Locale("en"),
          label: AppText.english,
          enabled: true,
          style: ButtonStyle(
            alignment: .center,
            foregroundColor: WidgetStatePropertyAll(colorThem.secondaryHeaderColor),
            padding: const WidgetStatePropertyAll(.zero),
            textStyle: WidgetStatePropertyAll(textThem.bodyMedium),
          ),
        ),
        DropdownMenuEntry(
          value: const Locale("ar"),
          label: AppText.arabic,
          enabled: true,
          style: ButtonStyle(
            alignment: .center,
            padding: const WidgetStatePropertyAll(.zero),
            foregroundColor: WidgetStatePropertyAll(colorThem.secondaryHeaderColor),
            textStyle: WidgetStatePropertyAll(textThem.bodyMedium),
          ),
        ),
      ],
      onSelected: (local) {
        if (local != null) {
          changeLang(local);
        }
      },
    );
  }

  void changeLang(Locale newLocal) {
    Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).changeLanguage(newLang: newLocal,context: context);
  }
}