import 'package:flutter/material.dart';

const corPrimaria = Color.fromRGBO(78, 185, 71, 1.0);
const backGroundColor = Color.fromRGBO(36, 45, 60, 1.0);
// api key
const apikey = 'key=53bb6c93b0194ef88499311cb89f58e8';
// urlRwagDefault get 100 games from the api
const urlRawgDefault = 'https://api.rawg.io/api/games?$apikey&page_size=14&page=1';
// urlRawgDeveloperDefault get the developer from the api 
const urlRawgDeveloperDefault = 'https://api.rawg.io/api/developers?$apikey';