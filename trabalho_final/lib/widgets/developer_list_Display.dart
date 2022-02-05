import 'package:flutter/material.dart';
import 'package:trabalho_final/models/developer.dart';
import 'package:trabalho_final/utilities/constants.dart';

class DeveloperListDisplay extends StatelessWidget {
  const DeveloperListDisplay({
    Key? key,
    required this.developer,
    required this.context,
  }) : super(key: key);

  final Developer developer;
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
                height: 30,
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
                      developer.developerName,
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
                height: 30,
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
                      developer.developerNumberOfGames.toString(),
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
