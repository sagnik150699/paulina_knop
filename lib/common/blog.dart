import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components.dart';

/// The main widget for displaying the blog section.
class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    // Determine if the device is a web device based on its width
    bool isWeb = MediaQuery.of(context).size.width > 800;

    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: !isWeb,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: isWeb ? 7.0 : 4.0),
                    child: AbelCustom(
                      text: "Welcome to my blog",
                      size: isWeb ? 30.0 : 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/blog.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: isWeb ? 500.0 : 400.0,
              ),
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('articles').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return BlogPost(
                      title: documentSnapshot["title"],
                      body: documentSnapshot["body"],
                      isWeb: isWeb,
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

/// A widget for displaying individual blog posts.
class BlogPost extends StatefulWidget {
  final String title;
  final String body;
  final bool isWeb;

  const BlogPost({
    Key? key,
    required this.title,
    required this.body,
    required this.isWeb,
  }) : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isWeb
          ? const EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
          : const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid, width: 1.0, color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: widget.title,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 7.0),
            Text(
              widget.body,
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
