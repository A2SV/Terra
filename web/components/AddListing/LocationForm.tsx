import React, { useState, useEffect, useRef } from "react";
import dynamic from "next/dynamic";
import axios from "axios";

const GoogleMapComponent = dynamic(() => import("./GoogleMapComponent"), { ssr: false });

const LocationForm: React.FC = () => {
  const [location, setLocation] = useState("");
  const [coordinates, setCoordinates] = useState<{ lat: number; lng: number } | null>(null);
  const [suggestions, setSuggestions] = useState<any[]>([]);

  const inputRef = useRef<HTMLInputElement | null>(null);

  const fetchSuggestions = async (input: string) => {
    if (input) {
      try {
        const response = await axios.get(`/api/places/autocomplete?input=${input}`);
        console.log("Suggestions:", response.data.predictions);
        setSuggestions(response.data.predictions);
      } catch (error) {
        console.error("Error fetching suggestions:", error);
      }
    }
  };

  const handleSelectSuggestion = async (placeId: string) => {
    try {
      const response = await axios.get(`/api/places/details?placeId=${placeId}`);
      const location = response.data.result.geometry.location;
      console.log("Selected Location:", location);
      setCoordinates({ lat: location.lat, lng: location.lng });
      setLocation(response.data.result.name);
      setSuggestions([]);
    } catch (error) {
      console.error("Error fetching place details:", error);
    }
  };

  useEffect(() => {
    const handleLoad = () => {
      if (inputRef.current) {
        const autocomplete = new google.maps.places.Autocomplete(inputRef.current, {
          types: ["geocode"],
        });

        autocomplete.addListener("place_changed", () => {
          const place = autocomplete.getPlace();
          if (place.geometry && place.geometry.location) {
            const location = place.geometry.location;
            setCoordinates({ lat: location.lat(), lng: location.lng() });
            setLocation(place.formatted_address || "");
          }
        });
      }
    };

    if (typeof google !== "undefined" && google.maps && google.maps.places) {
      handleLoad();
    } else {
      window.addEventListener("load", handleLoad);
      return () => window.removeEventListener("load", handleLoad);
    }
  }, []);

  const handleLocationChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setLocation(e.target.value);
    fetchSuggestions(e.target.value);
  };

  return (
    <div className="p-4">
      {/* <div className="mb-4">
        <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="virtual-tour">
          Virtual Tour
        </label>
        <input
          id="virtual-tour"
          type="url"
          placeholder="Paste virtual tour URL"
          className="w-full px-3 py-2 rounded-md focus:outline-none focus:ring focus:ring-indigo-200"
        />
      </div> */}

      <div className="mb-4">
        <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="video">
          Video
        </label>
        <input
          id="video"
          type="url"
          placeholder="Copy any online video link e.g. YouTube, Facebook, Instagram or .mp4"
          className="w-full px-3 py-2 rounded-md focus:outline-none focus:ring focus:ring-indigo-200"
        />
      </div>

      <div className="mb-12">
        <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="location">
          Location
        </label>
        <input
          id="location"
          type="text"
          placeholder="Enter location"
          value={location}
          onChange={handleLocationChange}
          ref={inputRef}
          className="w-full px-3 py-2 rounded-md focus:outline-none focus:ring focus:ring-indigo-200"
        />
        {suggestions.length > 0 && (
          <ul className="absolute bg-white border border-gray-200 w-full mt-2 z-10">
            {suggestions.map((suggestion) => (
              <li
                key={suggestion.place_id}
                className="p-2 cursor-pointer hover:bg-gray-200"
                onClick={() => handleSelectSuggestion(suggestion.place_id)}
              >
                {suggestion.description}
              </li>
            ))}
          </ul>
        )}
      </div>

      <div className="relative mb-4">
        <GoogleMapComponent coordinates={coordinates} />
      </div>
    </div>
  );
};

export default LocationForm;