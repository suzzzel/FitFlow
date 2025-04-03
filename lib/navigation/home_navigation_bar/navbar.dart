// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnItemChanged = void Function(int newPosition);

class NavBar extends StatefulWidget {
  final OnItemChanged onItemChanged;
  final List<NavBarData> navBarItems;
  final int currentIndex; // Вынес индекс для родителя

  const NavBar({
    super.key,
    required this.onItemChanged,
    required this.navBarItems,
    required this.currentIndex,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 45, left: 21, right: 21),
      height: 65,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .secondaryFixed
                    .withOpacity(0.67),
                offset: const Offset(0, 4),
                blurRadius: 20)
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ]),
          color: Colors.transparent.withOpacity(0.67),
          borderRadius: BorderRadius.circular(99)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.navBarItems.map((item) {
            final index = widget.navBarItems.indexOf(item);
            return GestureDetector(
              onTap: () => widget.onItemChanged(index),
              child: NavBarItem(
                key: UniqueKey(),
                data: item,
                isSelected: index == widget.currentIndex,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final NavBarData data;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _widthAnimation = Tween<double>(begin: 0, end: 17).animate(_controller)
      ..addListener(() => setState(() {}));

    if (widget.isSelected) _controller.forward();
  }

  // сделал корректное отображение анимации
  @override
  void didUpdateWidget(NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      widget.isSelected ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 45,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: widget.isSelected
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ],
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17, right: 23),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.height * 0.02,
              child: FittedBox(
                child: Image.asset(
                  widget.data.iconPath,
                ),
              ),
            ),
            SizedBox(width: _widthAnimation.value),
            widget.isSelected
                ? AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.isSelected ? 1.0 : 0.0,
                    child: Text(
                      widget.data.text,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class NavBarData {
  final String iconPath;
  final String text;

  NavBarData({required this.iconPath, required this.text});
}
