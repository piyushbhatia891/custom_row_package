import 'package:flutter/material.dart';

class OrderRowWidget extends StatelessWidget {
  final bool isBorderProvided;
  final bool areChipsEnabled;
  final String title, subTitle, subTitle2, status, buttonText;
  final String imageUrl;
  final bool isTrailingSectionEnabled;
  final Route route;
  const OrderRowWidget(
      {Key key,
      this.title,
      this.subTitle,
      this.subTitle2,
      this.status,
      this.imageUrl,
      this.route,
      this.buttonText,
      this.isTrailingSectionEnabled = false,
      this.isBorderProvided = false,
      this.areChipsEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              width: 2.0,
              color: isBorderProvided
                  ? Colors.grey.shade200
                  : Colors.transparent)),
      child: Row(
        children: [
          Expanded(flex: 3, child: CircleImageWidget(imageUrl: imageUrl)),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: isTrailingSectionEnabled ? 2 : 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                Text(subTitle2,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                Text(subTitle,
                    style:
                        TextStyle(fontSize: 14.0, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Column(
            children: [
              Text(status,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              OutlineButton(
                onPressed: () {
                  Navigator.push(context, route);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                borderSide: BorderSide(width: 2.0, color: Colors.grey.shade400),
                child: Text(buttonText),
                textColor: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CircleImageWidget extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;
  final double borderSize, imageSize;
  const CircleImageWidget(
      {Key key,
      this.imageUrl,
      this.borderColor = Colors.orange,
      this.borderSize = 23.0,
      this.imageSize = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: borderSize,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: imageSize,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
