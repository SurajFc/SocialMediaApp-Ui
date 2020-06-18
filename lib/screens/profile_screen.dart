import 'package:SocialMediaApp/models/user_model.dart';
import 'package:SocialMediaApp/utils/text_style.dart';
import 'package:SocialMediaApp/widgets/custom_drawer.dart';
import 'package:SocialMediaApp/widgets/follow_widget.dart';
import 'package:SocialMediaApp/widgets/posts_caraousel.dart';
import 'package:SocialMediaApp/widgets/profile_clipper.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritePageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritePageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.user.backgroundImageUrl),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.user.profileImageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextStyle(
                text: widget.user.name,
                size: 25.0,
                font: FontWeight.bold,
                spacing: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Follow(
                  widget: widget,
                  text: 'Followers',
                  num: widget.user.followers.toString(),
                ),
                Follow(
                  widget: widget,
                  text: 'Following',
                  num: widget.user.following.toString(),
                ),
              ],
            ),
            PostsCaraousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCaraousel(
              pageController: _favoritePageController,
              title: 'Favorites',
              posts: widget.user.posts,
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
