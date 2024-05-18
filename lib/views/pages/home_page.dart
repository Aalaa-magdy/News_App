import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:home_news_app/views/pages/news_details_page.dart';
import 'package:home_news_app/views/widgets/app_bar_icon.dart';
import 'package:home_news_app/views/widgets/custom_carousel_slider.dart';
import 'package:home_news_app/views/widgets/home_title_widget.dart';
import 'package:home_news_app/views/widgets/recommendation_item.dart';
import '../../models/news_item.dart';
class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
   Widget build(BuildContext  context){
     return Scaffold(

        body: SingleChildScrollView(
         child : Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical:32.0),
           child: Column(
           children:[
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const AppBarIcon(icon: Icons.menu),
                 Row(
                   children: const [
                     AppBarIcon(icon: Icons.search),
                     SizedBox(width:6.0),
                     AppBarIcon(icon:Icons.notifications)
                   ],
                 )
               ],
             ),
             const SizedBox(height :16.0),
             HomeTitleWidget(title: "Breaking News"),
             const SizedBox(height:8.0),
             CustomCarouselSlider(),
             const SizedBox(height:16.0),
             HomeTitleWidget(title: "Recommendation"),
             const SizedBox(height:8.0),
             ...news.map((newsItem)=> Padding(
               padding: const EdgeInsets.only(bottom:16.0),
               child: InkWell(
                   onTap: ()=>
                       Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
                         builder: (_) => NewsDetailsPage(newsItem: newsItem),))
                   ,child: RecommendationItem(newsItem: newsItem)),
             ) ).toList(),

           ]
                    ),
         ),

     ));
  }
}