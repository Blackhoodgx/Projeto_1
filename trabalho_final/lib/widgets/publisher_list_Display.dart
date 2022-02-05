import 'package:flutter/material.dart';
import 'package:trabalho_final/models/publisher.dart';
import 'package:trabalho_final/utilities/constants.dart';

class PublisherListDisplay extends StatelessWidget {
  const PublisherListDisplay({
    Key? key,
    required this.publisher,
    required this.context,
  }) : super(key: key);

  final Publisher publisher;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                height: 35,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 71, 104, 1.0),
                  border: Border.all(
                    color: corPrimaria,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      publisher.publisherName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 35,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 71, 104, 1.0),
                  border: Border.all(
                    color: corPrimaria,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      publisher.publisherNumberOfGames.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
