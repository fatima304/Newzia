import 'package:flutter/material.dart';
import 'package:mynewsapp/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  void _launchURL() async {
    final url = articleModel.Url;

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {}
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35),
            ),
            child: GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Image.network(
                articleModel.image ??
                    'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg?w=1060&t=st=1696779374~exp=1696779974~hmac=0e50880b8961104dba1ce32348c0557eac0e09397f0675090b142a85091e7b91',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 237, 236),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text(
                  articleModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 24, 24, 24),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articleModel.subTitle ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 57, 57, 57), fontSize: 14),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
