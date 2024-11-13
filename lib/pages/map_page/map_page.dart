import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:test_task/api/model/response/coordinate.dart';
import 'package:test_task/utils/extensions/build_context_ext.dart';

import '../../config/router/vinchesta_router.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  final List<String> field;
  final List<Coordinate> coordinates;

  const MapPage({
    super.key,
    required this.field,
    required this.coordinates,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Color? _getCellColor({
    required int x,
    required int y,
    required bool hasStone,
  }) {
    if (hasStone) {
      return const Color(0xFF000000);
    }
    if (x == widget.coordinates.last.x && y == widget.coordinates.last.y) {
      return const Color(0xFF009688);
    }
    if (x == widget.coordinates.first.x && y == widget.coordinates.first.y) {
      return const Color(0xFF64FFDA);
    }
    for (Coordinate coordinate in widget.coordinates) {
      if (coordinate.x == x && coordinate.y == y) {
        return const Color(0xFF4CAF50);
      }
    }
    return null;
  }

  String _getPath() {
    String pathString = '';
    for (int i = 0; i < widget.coordinates.length; i++) {
      final step = widget.coordinates[i];
      if (i != widget.coordinates.length - 1) {
        pathString += '(${step.x},${step.y})->';
      } else {
        pathString += '(${step.x},${step.y})';
      }
    }
    return pathString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: context.color.textNoBorderFieldDisabledBorder,
          ),
        ),
        backgroundColor: context.color.blueRegular,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            context.strings.previewScreen,
            style: context.text.appBarTitle,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.field.length,
            itemBuilder: (context, index) {
              final row = widget.field[index].split('');

              return Row(
                children: row.mapIndexed((rowIndex, cell) {
                  return Container(
                    width: MediaQuery.of(context).size.width / row.length,
                    height: MediaQuery.of(context).size.width / row.length,
                    decoration: BoxDecoration(
                      color: _getCellColor(
                        x: rowIndex,
                        y: index,
                        hasStone: cell == 'X',
                      ),
                      border: Border.all(
                        color: context.color.appBarDivider,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        style: cell == 'X'
                            ? context.text.vinchestaTextField
                            : null,
                        '($rowIndex,$index)',
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        Text(_getPath()),
      ],
    );
  }
}
