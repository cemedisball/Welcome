import 'package:flutter/material.dart';

import '../data/data_image.dart';
import '../widgets/image_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _imageAsset = 'assets/images/';
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: _builderAppBar(screenSize),
      body: _buildbody(screenSize),
    );
  }

  _builderAppBar(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.height, 50.0),
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor:
            Colors.black.withOpacity((_scrollOffset / 350).clamp(0, 1)),
        title: Image.asset(
          '${_imageAsset}netflix1.png',
          width: 90,
        ),
        actions: [
          CircleAvatar(
            child: Icon(
              Icons.search, // Replace with the desired icon
              color: Colors.white, // Set the icon color
              size: 24, // Set the icon size
            ),
            backgroundColor: Colors
                .transparent, // Set the background color of the CircleAvatar
            radius: 35,
          )
        ],
      ),
    );
  }

  Widget _buildbody(Size screenSize) {
    return CustomScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        _contentHeader(screenSize),
        _buildMovieListSection('Popular on Netflix', DataImage.popularList),
        _buildMovieListSection('My List', DataImage.mylist),
        _buildMovieListSection('Trending List', DataImage.trendingList),
      ],
    );
  }

  SliverToBoxAdapter _contentHeader(Size screenSize) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: screenSize.height / 1.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${_imageAsset}GOT.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenSize.height / 3.0,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ),
          _buildTopMenu(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Text(
                  'Thai - Action - Drama - Fantasy',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        debugPrint('goto play screen');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 25, bottom: 8, top: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                              ),
                              Text('Play')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildTopMenu() {
    return const Positioned(
      left: 0,
      right: 0,
      top: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'TV SHOWS',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Movies',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 2),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildMovieListSection(
      String label, List<dynamic> imageList) {
    return SliverToBoxAdapter(
      child: ImageList(
        label: label,
        imageList: imageList,
      ),
    );
  }
}
