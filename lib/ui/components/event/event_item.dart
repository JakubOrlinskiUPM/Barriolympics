import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/event.dart';
import 'package:flutter/rendering.dart';

import '../../../models/event.dart';

class EventItem extends StatefulWidget {
  const EventItem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: Text(widget.event.name!),
                  subtitle: Text(widget.event.description!)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.event.imageUrl!.length,
                    itemBuilder: (context, index) {
                      return Image.network(widget.event.imageUrl!);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(padding: EdgeInsets.all(6));
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Row(children: [
                    const Spacer(),
                    const Text('Time: '),
                    Text(widget.event.time!.hour.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2),
                    const Text('h-'),
                    Text(widget.event.time!.hour.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2),
                    const Text('h'),
                  ]),
                  Row(children: [
                    const Spacer(),
                    const Text('Date: '),
                    Text(widget.event.date!.day.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2),
                    const Text('/'),
                    Text(widget.event.date!.month.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2),
                  ])
                ],
              )
            ])
        )
    );
  }
}
// =======
//     return ConstrainedBox(
//         constraints: const BoxConstraints(
//             maxHeight: 255, minHeight: 250, maxWidth: 450, minWidth: 450),
//         child: Container(
//             child: Stack(children: [
//           Align(
//               alignment: Alignment.topCenter,
//               child: Card(
//                 semanticContainer: true,
//                 clipBehavior: Clip.hardEdge,
//                 child: Image.network(
//                   widget.event.imageUrl!,
//                   fit: BoxFit.scaleDown,
//                   color: Colors.black12,
//                   colorBlendMode: BlendMode.overlay,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               )),
//           Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                       alignment: Alignment.center,
//                       child: Stack(children: <Widget>[
//                         Text(
//                           widget.event.name!,
//                           style: TextStyle(
//                               fontSize: 25.0,
//                               fontWeight: FontWeight.bold,
//                               foreground: Paint()
//                                 ..style = PaintingStyle.stroke
//                                 ..strokeWidth = 3
//                                 ..color = Colors.black),
//                         ),
//                         Text(
//                           widget.event.name!,
//                           style: const TextStyle(
//                             color: Color(0xffff6900),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25.0,
//                           ),
//                         ),
//                       ])),
//                   // In case we need a description for each event!!!!!:
//                   // Padding(padding: const EdgeInsets.all(5), child:
//                   // Stack(children: <Widget>
//                   // [
//                   //   Text(widget.event.description!,
//                   //     style: TextStyle(
//                   //         fontSize: 15.0,
//                   //         fontWeight: FontWeight.bold,
//                   //         foreground: Paint()
//                   //           ..style = PaintingStyle.stroke
//                   //           ..strokeWidth = 3
//                   //           ..color = Colors.black
//                   //     ),
//                   //   ),
//                   //   Text(widget.event.description!,
//                   //     style: const TextStyle(
//                   //       color: Color(0xffff6900),
//                   //       fontWeight: FontWeight.bold,
//                   //       fontSize: 15.0,
//                   //
//                   //     ),
//                   //   ),
//                   // ]
//                   // )
//                   // ),
//                   const Spacer(),
//                   // Color(0x8aff6900)
//                   Container(
//                       child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                         Card(
//                             color: Colors.white54,
//                             child: Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Column(
//                                   children: [
//                                     Row(children: [
//                                       const Icon(Icons.access_time_outlined,
//                                           size: 15),
//                                       Text(
//                                           widget.event.time!.hour
//                                               .toString(),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyText2),
//                                       const Text('h-'),
//                                       Text(
//                                           widget.event.time!.hour
//                                               .toString(),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyText2),
//                                       const Text('h'),
//                                     ]),
//                                     Row(children: [
//                                       const Icon(Icons.date_range_outlined,
//                                           size: 15),
//                                       Text(
//                                           widget.event.date!.day
//                                               .toString(),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyText2),
//                                       const Text('/'),
//                                       Text(
//                                           widget.event.date!.month
//                                               .toString(),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyText2),
//                                     ]),
//                                   ],
//                                 ))),
//                         const Spacer(),
//                         Card(
//                             color: Colors.white54,
//                             child: Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Row(children: [
//                                   const Icon(Icons.location_on, size: 15),
//                                   Text(widget.event.location!.locationName,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyText2),
//                                 ])))
//                       ]))
//                 ],
//               ))
//         ])));
// >>>>>>> 4360769a04d26bfe9b5dd4cd3f613c885e261f2d
//   }
