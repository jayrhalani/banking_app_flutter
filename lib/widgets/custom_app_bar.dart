import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.backgroundColor = Colors.white,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: MediaQuery.of(context).padding.top, // SafeArea effect
      ),
      height: height + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onBack == null
              ? const SizedBox(width: 48)
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0XFFE6E7E9),
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.only(right: 2),
                  width: 48,
                  height: 48,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: onBack,
                  ),
                ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Row(children: actions ?? [const SizedBox(width: 48)]),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    height +
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top,
  );
}
