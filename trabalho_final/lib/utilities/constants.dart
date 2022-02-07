import 'package:flutter/material.dart';

const corPrimaria = Color.fromRGBO(255, 162, 0, 1.0);
const darkPrimalGreen = Color.fromRGBO(13, 13, 13, 1.0);
const backGroundColor = Color.fromRGBO(25, 25, 25, 1.0);
const colorNavBar = Color.fromRGBO(13, 13, 13, 1.0);
const lighterWhite = Color.fromRGBO(240, 240, 240, 1.0);
// rawg api key, it ca be swup to a new key if necessary.
const apikey = 'key=53bb6c93b0194ef88499311cb89f58e8';
// the size of the page is 14 do to the fact the aplication take more time to load the imagens the more games it have to load,
// and 14 is a good amount games and it load the images fast.
const gamesUrlPageSize = 'page_size=14';
// urlRwagDefault get games from the api
const urlRawgDefault =
    'https://api.rawg.io/api/games?$apikey&$gamesUrlPageSize&page=1';
const developerUrlPageSize = 'page_size=50';
// urlRawgDeveloperDefault get the developer from the api
const urlRawgDeveloperDefault =
    'https://api.rawg.io/api/developers?$apikey&$developerUrlPageSize&page=1';
const urlRawgPublisherDefault =
    'https://api.rawg.io/api/publishers?$apikey&$publisherUrlPageSize&page=1';
const publisherUrlPageSize = 'page_size=40';
// urlgameDetails get the info of the game
const urlGameDetailsDefault = 'https://api.rawg.io/api/games/id?$apikey';
