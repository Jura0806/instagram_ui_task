import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_ui_task/models/post_model.dart';
import 'package:instagram_ui_task/models/story_class.dart';

class HomePage extends StatefulWidget {
static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Story> _stories =[
    Story(storyImg: "assets/images/user_5.jpeg",
        name: "You Story"),
    Story(storyImg: "assets/images/user_2.jpeg",
        name: "Sylvester"),
    Story(storyImg: "assets/images/user_3.jpeg",
        name: "Lavina"),
    Story(storyImg: "assets/images/user_4.jpeg",
        name: "Lucy"),
    Story(storyImg: "assets/images/user_1.jpeg",
        name: "Morgan"),
    Story(storyImg: "assets/images/user_1.jpeg",
        name: "Jasmin"),
  ];
  List<Post> _posts = [
    Post(userName: "Brianne",
        userImg: "assets/images/user_1.jpeg",
        caption: "Good Morning to you Guys! Whats up?",
        postImg: "assets/images/feed_1.jpeg"
    ),
    Post(userName: "Henri",
        userImg: "assets/images/user_2.jpeg",
        caption: "Good Morning to you Guys! Whats up?",
        postImg: "assets/images/feed_2.jpeg"),
    Post(userName: "Mariano",
        userImg: "assets/images/user_3.jpeg",
        caption: "Good Morning to you Guys! Whats up?",
        postImg: "assets/images/feed_3.jpeg"),
  ];
  int  like = 1;
  int dislike = 0;
  late int control;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: false,
        title: Text("Instagram", style: TextStyle(fontSize: 30, fontFamily: "Billabong", color: Colors.grey[400]), ),
        actions: [
          IconButton(onPressed: (){},
              icon: SvgPicture.asset("assets/images/share.svg", color: Colors.grey, height: 20,)
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // #stories
               Container(
                 color: Colors.black,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.symmetric(vertical: 10),
                 height: 110,
                 child: ListView(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                   children: _stories.map((story) {
                     return itemOffStory(story);
                   }).toList(),
                 ),
               ),
              // #post  header
                Container(
                  width: MediaQuery.of(context).size.width,
                 child: ListView.builder(
                   itemCount: _posts.length,
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (ctx, i) {
                     return itemOffPost(_posts[i]);
                   },
                 ),
                )
            ],
          ),
        ),
      )
    );
  }
  Widget itemOffStory(Story story){
    return Column(

      children: [
        story.name == "You Story" ?
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  width: 0.4,
                  color: Colors.grey
                )
              ),
              child: Container(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image(
                    image: AssetImage(story.storyImg),
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Positioned(
              left: 65,
              top: 55,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1.5,
                      color: Colors.white
                  ),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 14,),
                ),
              ),
            ),

          ],
        )
       : Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Color.fromRGBO(200, 300, 400, Colors.purple.opacity)
            ),
            borderRadius: BorderRadius.circular(70),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.storyImg),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        story.name == "You Story" ?
        SizedBox(height: 10,)
        : SizedBox(height: 5,),
        Center(child: Text(story.name, style: TextStyle(color: Colors.grey),)),
      ],
    );
  }

  Widget itemOffPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(200, 300, 400, Colors.purple.opacity),
                        )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                          image: AssetImage(post.userImg),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300]), )
                  ],
                ),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.more_horiz, color: Colors.grey, size: 28,),
                )

              ],
            ),
          ),
          FadeInImage(
            placeholder: AssetImage("assets/images/placeholder.png"),
           image: AssetImage(post.postImg),
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 15,
                        onPressed: (){
                          setState(() {
                            control = dislike;
                            dislike = like;
                            like = control;
                          });
                        },
                        icon: like ==0 ? SvgPicture.asset("assets/images/heart.svg", color: Colors.grey,height: 25,)
                            : SvgPicture.asset("assets/images/heart_red.svg",height: 25,),
                      ),
                      IconButton(
                        splashRadius: 15,
                        onPressed: (){},
                        icon: Icon(Icons.mode_comment_outlined, color: Colors.grey, size: 26,),
                      ),
                      IconButton(
                        splashRadius: 15,
                        onPressed: (){},
                        icon: SvgPicture.asset("assets/images/share.svg", color: Colors.grey, height: 20,),
                      ),
                    ],
                  ),
                  IconButton(onPressed: (){},
                    icon: Icon(Icons.bookmark_border_outlined, color: Colors.grey, size: 27,),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          text: TextSpan(
                            children:[
                              TextSpan(
                                text: "Liked By",
                                style: TextStyle(color: Colors.grey)
                              ),
                              TextSpan(
                                  text: " Sigmund,",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                  text: " Dayana,",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                  text: " Yeseniya",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                  text: " and",
                                  style: TextStyle(color: Colors.grey)
                              ),
                              TextSpan(
                                  text: " 1234 others",
                                  style: TextStyle(color: Colors.white,)
                              ),
                            ]
                          ),
                        ),
                        SizedBox(height: 5,),
                        RichText(
                          text:  TextSpan(
                            children: [
                              TextSpan(
                                text : "Brianne ",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                  text : " ${post.caption}",
                                  style: TextStyle(color: Colors.grey,)
                              )
                            ]
                          ),
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/user_5.jpeg"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  TextButton(onPressed: (){},
                                      child: Text("Add a comment..." , style: TextStyle(color: Colors.grey, fontSize: 13),)
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.red, size: 15,),
                                  SizedBox(width: 3,),
                                  Icon(Icons.add_circle_outline, color: Colors.grey, size: 15,)
                                ],
                              )
                            ],
                          ) ,

                        Text("February 2021", style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ],
                    ),
                  ),


            ],
          )
        ],
      ),
    );
  }
}
