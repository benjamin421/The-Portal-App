import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final onTap;
  final String title, date;

  const PostContainer({Key key, this.onTap, this.title, this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(9.0),
          child: Image.asset(
            'assets/theportal.jpeg',
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title",
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 5),
            Text(
              "$date",
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}
