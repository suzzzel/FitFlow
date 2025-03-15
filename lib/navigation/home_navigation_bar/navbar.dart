// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnItemChanged = void Function(int newPosition);

class Navbar extends StatefulWidget {
  final OnItemChanged onItemChanged;
  final List<NavBarData> navBarItems;
  const Navbar(
      {super.key, required this.onItemChanged, required this.navBarItems});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedItem = 0;
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
          ...widget.navBarItems.map((item) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedItem = widget.navBarItems.indexOf(item);
                  });
                  widget.onItemChanged(_selectedItem);
                },
                child: NavBarItem(
                  key: UniqueKey(),
                  data: item,
                  isSelected: widget.navBarItems.indexOf(item) == _selectedItem,
                ),
              )),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final NavBarData data;
  final bool isSelected;

  const NavBarItem({super.key, required this.data, required this.isSelected});

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeAnimation;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    sizeAnimation = Tween<double>(begin: 0, end: widget.isSelected ? 17 : 0)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    if (widget.isSelected) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          gradient: widget.isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ])
              : null),
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
            SizedBox(
              width: sizeAnimation.value,
            ),
            widget.isSelected
                ? FittedBox(
                    child: Text(
                      widget.data.text,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
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
