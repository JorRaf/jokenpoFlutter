'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/main.dart.js": "28f83e5db1029f05630be75f5d514150",
"/index.html": "d548e33887e7546d634a6c7d42973fd1",
"/manifest.json": "86ae70d37e7bafb010b0f8eeee09b7bf",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/AssetManifest.json": "11796693e6f471a43db36c4ea164eb5a",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/images/padrao.png": "589c46b59101f6116106c88f390fb683",
"/assets/images/tesoura.png": "d8f126622a2a6bb4ad64fd5ed5b35a8a",
"/assets/images/papel.png": "ada35938120c7c8b2a3164cc58fe1756",
"/assets/images/pedra.png": "db796ff45155ea8c0ced267298d1bb48",
"/assets/LICENSE": "a8049a27651f4d3f05d08ab3e9b17397"
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
