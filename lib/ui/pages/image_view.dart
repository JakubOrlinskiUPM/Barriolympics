import 'package:barriolympics/models/post.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key, required this.post, this.index = 0})
      : super(key: key);

  final Post? post;
  final int index;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void initState() {
    super.initState();
    _current = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.post == null) {
      Navigator.pop(context);
      return Container();
    }

    return Dismissible(
      key: const Key("ImageView"),
      direction: DismissDirection.vertical,
      onDismissed: (_) => Navigator.of(context).pop(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey.shade900.withOpacity(0.9),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  initialPage: _current,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: widget.post!.imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Hero(
                          tag: widget.post!.id.toString() + "-" + widget.post!.imageUrls.indexOf(url).toString(),
                          child: Image.network(url),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.post!.imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                            .withOpacity(_current == entry.key ? 0.95 : 0.3)),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
