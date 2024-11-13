import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_task/utils/extensions/build_context_ext.dart';

class ToastView extends StatelessWidget {
  final String message;

  final Color backgroundColor;
  final VoidCallback? onActionTap;
  final String? actionTitle;
  final bool titleCentered;

  const ToastView({
    super.key,
    required this.backgroundColor,
    required this.message,
    this.titleCentered = false,
    this.onActionTap,
    this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              message,
              style: context.text.mainPageTileLabel,
              maxLines: 5,
              textAlign: titleCentered ? TextAlign.center : TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
