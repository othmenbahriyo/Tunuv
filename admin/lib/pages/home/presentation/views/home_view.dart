import 'package:admin/pages/catalogue/presentation/view/catalogue_view.dart';
import 'package:admin/pages/home/presentation/controller/home_controller.dart';
import 'package:admin/pages/home/presentation/views/widget/zoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Container(
            color: Colors.white,
            child: Scaffold(
              body: Obx(
                () => FlutterMap(
              options: MapOptions(
                center: LatLng(53.3498, -6.2603),
                zoom: 5.0,
                plugins: [
                  ZoomButtonsPlugin(),
                ],
              ),
              layers: [
                if (controller.layer == "0")
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    // For example purposes. It is recommended to use
                    // TileProvider with a caching and retry strategy, like
                    // NetworkTileProvider or CachedNetworkTileProvider
                    tileProvider: NonCachingNetworkTileProvider(),
                  ),
                if (controller.layer == "1")
                  TileLayerOptions(
                    wmsOptions: WMSTileLayerOptions(
                      baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
                      layers: ['s2cloudless-2018_3857'],
                    ),
                    subdomains: [
                      'a',
                      'b',
                      'c',
                      'd',
                      'e',
                      'f',
                      'g',
                      'h'
                    ],
                  ),
                if (controller.layer == "2")
                  TileLayerOptions(
                    urlTemplate:
                    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
                  ),
                MarkerLayerOptions(markers:  controller.markers)

              ],
              nonRotatedLayers: [
                ZoomButtonsPluginOption(
                  minZoom: 4,
                  maxZoom: 19,
                  mini: true,
                  padding: 10,
                  alignment: Alignment.bottomRight,
                ),
              ],
                ),
              ),
            )));
  }
}
