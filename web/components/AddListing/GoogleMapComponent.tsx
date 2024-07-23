import React from "react";
import { GoogleMap, Marker, LoadScript } from "@react-google-maps/api";

interface MapProps {
  coordinates: { lat: number; lng: number } | null;
}

const GoogleMapComponent: React.FC<MapProps> = ({ coordinates }) => {
  const GOOGLE_MAP_API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAP_API_KEY;
  return (
    <LoadScript googleMapsApiKey={GOOGLE_MAP_API_KEY ?? ""}>
      <GoogleMap
        mapContainerStyle={{ width: "100%", height: "400px" }}
        center={coordinates || { lat: -37.816279, lng: 144.953736 }}
        zoom={coordinates ? 15 : 10}
      >
        {coordinates && <Marker position={coordinates} />}
      </GoogleMap>
    </LoadScript>
  );
};

export default GoogleMapComponent;
