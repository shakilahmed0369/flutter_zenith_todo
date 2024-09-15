import 'package:flutter/material.dart';
import 'package:zenith_todo/pages/note_view.dart';
import 'package:zenith_todo/util/delete_popup.dart';
import 'package:zenith_todo/util/theme_colors.dart';

class Note extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  VoidCallback refresh;

  Note({
    super.key,
    required this.title,
    required this.description,
    required this.index,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.pushNamed(context, 'noteView',
            arguments: {'id': index});
        refresh();
      },
      onLongPress: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return DeletePopup(index: index, refresh: refresh);
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ThemeColors.seconderyColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
