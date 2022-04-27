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
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.event.fileUrl!,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.35, 1],
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.event.name!,
                        style: const TextStyle(
                          color: Color(0xffff6900),
                          fontSize: 25.0,
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(bottom: 6),
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Icon(Icons.date_range_outlined,
                                        size: 15),
                                    Text(widget.event.date!.day.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    const Text('/'),
                                    Text(widget.event.date!.month.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ]),
                                ],
                              ))),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const Icon(Icons.location_on, size: 15, color: Colors.white),
                        Text(widget.event.location!.locationName,
                            style: TextStyle(color: Colors.white)),
                      ]),
                      Row(
                          children: [
                            const Icon(Icons.access_time_outlined,
                                size: 15, color: Colors.white),
                            Text(widget.event.time!.hour.toString()+'h',
                                style: TextStyle(color: Colors.white)),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//     return ConstrainedBox(
//       constraints: const BoxConstraints(
//           maxHeight: 150, minHeight: 130, maxWidth: 450, minWidth: 450),
//       child: Container(
//         child: Stack(
//           children: [
//             Align(
//                 alignment: Alignment.topCenter,
//                 child: Card(
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           widget.event.imageUrl!,
//                         ),
//                       ),
//                     ),
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 )),
//             Container(
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                         alignment: Alignment.center,
//                         child: Stack(children: <Widget>[
//                           Text(
//                             widget.event.name!,
//                             style: TextStyle(
//                                 fontSize: 25.0,
//                                 fontWeight: FontWeight.bold,
//                                 foreground: Paint()
//                                   ..style = PaintingStyle.stroke
//                                   ..strokeWidth = 3
//                                   ..color = Colors.black),
//                           ),
//                           Text(
//                             widget.event.name!,
//                             style: const TextStyle(
//                               color: Color(0xffff6900),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25.0,
//                             ),
//                           ),
//                         ])),
//
//                     const Spacer(),
//                     // Color(0x8aff6900)
//                     Container(
//                         child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                           Card(
//                               color: Colors.white54,
//                               child: Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Column(
//                                     children: [
//                                       Row(children: [
//                                         const Icon(Icons.access_time_outlined,
//                                             size: 15),
//                                         Text(widget.event.time!.hour.toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText2),
//                                         const Text('h-'),
//                                         Text(widget.event.time!.hour.toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText2),
//                                         const Text('h'),
//                                       ]),
//                                       Row(children: [
//                                         const Icon(Icons.date_range_outlined,
//                                             size: 15),
//                                         Text(widget.event.date!.day.toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText2),
//                                         const Text('/'),
//                                         Text(
//                                             widget.event.date!.month.toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText2),
//                                       ]),
//                                     ],
//                                   ))),
//                           const Spacer(),
//                           Card(
//                               color: Colors.white54,
//                               child: Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Row(children: [
//                                     const Icon(Icons.location_on, size: 15),
//                                     Text(widget.event.location!.locationName,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText2),
//                                   ])))
//                         ]))
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
