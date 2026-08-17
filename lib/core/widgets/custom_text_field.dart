import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_border_radius.dart';
import 'package:news_app/core/utils/app_padding.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/generated/assets.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/utils_app_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.onSubmitted, required this.onClear,});
  final Function(String) onSubmitted;
  final Function() onClear;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController queryController =TextEditingController();
  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final TextTheme textTheme = GetThemData.getTextThemData(context);
    return TextField(
      style: textTheme.titleSmall,
      enabled: true,
      controller: queryController,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: .text,
      onSubmitted: (query) {
        queryController.text=query;
        widget.onSubmitted(query);
      },
      textInputAction: .search,
      cursorColor: colorTheme.secondaryHeaderColor,
      autocorrect: true,
      decoration: InputDecoration(
        hintText:AppText.search,
        hintStyle: textTheme.titleSmall,
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        fillColor: colorTheme.primaryColor,
        filled: true,
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16),
        prefixIcon: SvgPicture.asset(Assets.icons.search.path,colorFilter: ColorFilter.mode(colorTheme.secondaryHeaderColor, .srcIn),fit: .scaleDown,),
        prefixIconColor: colorTheme.secondaryHeaderColor,
        suffixIcon: IconButton(onPressed: widget.onClear, icon: const Icon(Icons.clear_outlined)),
        suffixIconColor:  colorTheme.secondaryHeaderColor,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppBorderRadius.r16),
    borderSide: BorderSide(
      color: GetThemData.getColorThemData(context).secondaryHeaderColor,
      style: BorderStyle.solid
    )
  );
}
