import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String url;
  final double radius;
  final double roundness;
  final Widget placeHolder;
  final Alignment alignment;

  const ProfileAvatar(
      {Key key,
      @required this.url,
      this.radius = 44.0,
      this.roundness = 360.0,
      this.placeHolder = const Icon(
        Icons.people,
        size: 48,
      ),
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(roundness),
          border: Border.all(width: 0.1, color: Colors.grey),
          color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(roundness),
        child: CachedNetworkImage(
          // errorWidget: (context, error, item) {
          //   print(error);
          //   print(item);
          //   return Icon(Icons.error);
          // },
          alignment: alignment ?? Alignment.center,
          height: radius * 2,
          width: radius * 2,
          imageUrl: url ?? "",
          errorWidget: (context, url, child) {
            if (url == null || url.isEmpty)
              return Container(
                  padding: const EdgeInsets.all(4.0),
                  height: radius * 2,
                  width: radius * 2,
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: placeHolder,
                  ));
            return Container(
                padding: const EdgeInsets.all(4.0),
                height: radius * 2,
                width: radius * 2,
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text("Error loading"),
                ));
          },
          placeholder: (context, url) => Container(
              padding: const EdgeInsets.all(4.0),
              height: radius * 2,
              width: radius * 2,
              alignment: Alignment.center,
              child: FittedBox(
                child: placeHolder,
              )),
          useOldImageOnUrlChange: true,
          fadeInDuration: Duration(milliseconds: 0),
          fadeOutDuration: Duration(milliseconds: 0),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
