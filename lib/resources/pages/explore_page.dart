import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:frl_flutter/resources/widgets/custom_bottom_nav_widget.dart';

class ExplorePage extends NyStatefulWidget {
  static const path = '/explore';
  ExplorePage() : super(path, child: _ExplorePageState());
}

class _ExplorePageState extends NyState<ExplorePage> {
  List<Block> exploreBlocks = [];

  @override
  init() async {
    // Simulate fetching explore blocks from an API
    await fetchExploreBlocks();
  }

  Future<void> fetchExploreBlocks() async {
    // Simulated API call to fetch explore blocks
    await Future.delayed(Duration(seconds: 2));

    // Update the exploreBlocks list with the fetched data
    setState(() {
      exploreBlocks = [
        Block(
          title: "Creator Picks ⭐",
          collections: [
            Collection(
              title: "Best Asian Snacks",
              collectionBy: "@maomao",
              imageUrl: "public/assets/images/product-photo.png",
            ),
            Collection(
              title: "Creators Wish-lists",
              collectionBy: "@frl",
              imageUrl: "public/assets/images/product-photo.png",
            ),
          ],
        ),
        Block(
          title: "TikTok Viral ⭐",
          collections: [
            Collection(
              title: "Trending NOW",
              collectionBy: "@frl",
              imageUrl: "public/assets/images/product-photo.png",
            ),
            Collection(
              title: "HairTok",
              collectionBy: "@frl",
              imageUrl: "public/assets/images/product-photo.png",
            ),
          ],
        ),
      ];
    });
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NyFutureBuilder<List<Block>>(
                future: Future.value(exploreBlocks),
                child: (context, data) {
                  return ListView.builder(
                    itemCount: exploreBlocks.length,
                    itemBuilder: (context, index) {
                      final block = exploreBlocks[index];
                      return _buildExploreBlock(block);
                    },
                  );
                },
                loading:
                    CircularProgressIndicator(), // change the default loader
                useSkeletonizer: true, // enable the skeletonizer effect
                onError: (AsyncSnapshot snapshot) {
                  // handle exceptions thrown from your future.
                  print(snapshot.error.toString());
                  return Text("Error");
                },
              ),
            ),
            CustomBottomNav(currentIndex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreBlock(Block block) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            block.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: block.collections.length,
          itemBuilder: (context, index) {
            final collection = block.collections[index];
            return _buildCollectionItem(collection);
          },
        ),
      ],
    );
  }

  Widget _buildCollectionItem(Collection collection) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            collection.imageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.6),
              child: Text(
                collection.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Block {
  final String title;
  final List<Collection> collections;

  Block({required this.title, required this.collections});
}

class Collection {
  final String title;
  final String collectionBy;
  final String imageUrl;

  Collection({
    required this.title,
    required this.collectionBy,
    required this.imageUrl,
  });
}
