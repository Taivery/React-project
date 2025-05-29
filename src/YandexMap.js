import React, { useEffect } from 'react';

function YandexMap() {
  useEffect(() => {
    if (window.ymaps) {
      window.ymaps.ready(() => {
        new window.ymaps.Map("map", {
          center: [55.751574, 37.573856],
          zoom: 10,
          controls: ['zoomControl', 'fullscreenControl'],
        });
      });
    }
  }, []);

  return <div id="map" style={{ width: '100%', height: '300px', borderRadius: '10px' }}></div>;
}

export default YandexMap;
