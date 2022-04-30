import 'package:flutter/material.dart';

class InfoItem extends StatefulWidget {
  const InfoItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconLeading,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Icon iconLeading;

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.iconLeading,
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kanit',
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kanit',
          color: Color(0xff3949ab),
        ),
      ),
    );
  }
}
