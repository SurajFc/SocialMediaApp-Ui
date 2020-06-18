import 'package:SocialMediaApp/data/data.dart';
import 'package:SocialMediaApp/models/user_model.dart';
import 'package:SocialMediaApp/utils/text_style.dart';
import 'package:flutter/material.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: CustomTextStyle(
            text: 'Following',
            size: 24.0,
            font: FontWeight.bold,
            spacing: 2.0,
          ),
        ),
        Container(
          height: 80.0,
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 70.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 70.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        user.profileImageUrl,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
