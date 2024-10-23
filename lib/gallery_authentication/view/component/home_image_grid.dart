import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';

class HomeImageGrid extends StatelessWidget {
  const HomeImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryHome_Provider providertrue =
        Provider.of<GalleryHome_Provider>(context, listen: true);
    GalleryHome_Provider providerfalse =
        Provider.of<GalleryHome_Provider>(context, listen: false);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: providertrue.galleryimage.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 3 - 12 * 2,
            width: MediaQuery.of(context).size.width / 3 - 12 * 2,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    '${providertrue.galleryimage[index].image}'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            children: [
              Text(
                '${providertrue.galleryimage[index].name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${providertrue.galleryimage[index].length}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
