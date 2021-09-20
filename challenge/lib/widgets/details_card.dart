import 'package:challenge/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String url;
  final String type;
  const DetailsCard({
    Key key,
    this.imgUrl,
    this.name,
    this.url,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 60),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.50,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  child: Image.network(imgUrl)),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "$type Name",
                    style: muliSemiBold(19, Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    name,
                    style: muliSemiBold(15, Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Stream Url",
                    style: muliSemiBold(19, Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                url ?? "",
                style: muliSemiBold(15, Colors.blue),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
