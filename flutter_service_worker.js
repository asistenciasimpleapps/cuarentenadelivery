'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "85131726f0f78d74d1ab731dcfb5aa4c",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/big_noodle_titling.ttf": "ff78c5e2b6c3846035dae28cdaa65583",
"assets/fonts/big_noodle_titling_oblique.ttf": "52629e481c4d4df7a9783ed08bdecdef",
"assets/FontManifest.json": "77efe804dad2a205a3dbed43ce557816",
"assets/LICENSE": "73d6bd7743f585ce4a69b750b3d5e4a9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/AssetManifest.json": "3c9e3e5e0de1bd51173d86535514054d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "8b085cf3bb370fdbe987bab1bb096401",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"index.html": "1c20f6267e602b30b8fda3c051ef4b0f",
"/": "1c20f6267e602b30b8fda3c051ef4b0f"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
