"use client";
import React, { useState, useEffect } from "react";
import { env } from "next-runtime-env";
import axios from "axios";

const LocationFormUpdate: React.FC = () => {
  const API_KEY = env("NEXT_PUBLIC_GOOGLE_MAPS_API_KEY");
  const [results, setResults] = useState<any>([]);
  const [searchTerm, setSearchTerm] = useState<string>("");

  useEffect(() => {
    if (searchTerm.length > 0) {
      handleSearch();
    }
  }, [searchTerm]);

  const handleSearch = () => {
    const url = `https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${searchTerm}&key=${API_KEY}&libraries=places`;
    try {
      const response: any = axios.get(url);
      setResults(response.data.predictions);
    } catch (error) {
      console.error("Error fetching suggestions:", error);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearchTerm(e.target.value);
  };

  return (
    <>
      <h1>Location Form Update</h1>
      <input
        id="location"
        placeholder="location"
        className="p-5 border-2 border-black"
        type="text"
        onChange={handleChange}
        value={searchTerm}
      />
      {results.map((result: any) => (
        <div key={result.id}>{result.description}</div>
      ))}
    </>
  );
};

export default LocationFormUpdate;
