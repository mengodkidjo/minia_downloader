import 'package:flutter/material.dart';
import 'package:minia_downloader/styles/horizontal_space.dart';

class RowSetting extends StatefulWidget {
  const RowSetting(
      {super.key,
      required this.isChecked,
      required this.onClick,
      required this.title});
  final bool isChecked;
  final Function(bool) onClick;
  final String title;

  @override
  State<RowSetting> createState() => _RowSettingState();
}

class _RowSettingState extends State<RowSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.isChecked,
            onChanged: (value) {
              widget.onClick(!widget.isChecked);
              // setState(() {
              //   showTitle = !showTitle;
              // });
            }),
        HorizontalSpace.hSpace8,
        InkWell(
          onTap: () {
            setState(() {
              widget.onClick(!widget.isChecked);
            });
          },
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }
}
