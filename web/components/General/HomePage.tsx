"use client";
import React, { useState, useEffect } from "react";
import Navbar from "./Navbar";
import HeroSection from "./HeroSection";
import Select from "./Select";
import ListingCard from "../Listing/Cards/ListingCard";
import ExploreProperty from "./ExploreProperty";
import ProcedureSection from "./ProcedureSection";
import CreateListing from "./CreateListing";
import FAQ from "./FAQ";
import Footer from "./Footer";
import { Listing } from "@/types/listingTypes";
import { useGetAllListingsQuery } from "../../redux/getAllListingApi";
import ErrorMessage from "@/components/Common/Reusable/ErrorMessage";

const HomePage = () => {
  const [listings, setListings] = useState<Listing[]>([]);
  const { data, error, isLoading } = useGetAllListingsQuery();

  useEffect(() => {
    if (data && data.items) {
      console.log(data.items);
      setListings(data.items);
    }
  }, [data]);

  return (
    <div className="flex flex-col ">
      <Navbar />
      <HeroSection />
      <div className="lg:mt-10  mt-0">
        <Select />
      </div>

      <div className="flex justify-center items-center lg:mx-24 mt-[50px] mb-[50px]">
        {isLoading ? (
          <div>Loading...</div>
        ) : error ? (
          <ErrorMessage message="Error fetching listings" />
        ) : (
          <div className="flex flex-wrap justify-center gap-[40px]">
            {listings.map((listing: Listing) => (
              <ListingCard key={listing.id} item={listing} />
            ))}
          </div>
        )}
      </div>

      <div className="mt-[140px] mb-[50px]">
        <ExploreProperty />
      </div>
      <div className="mt-[150px] ">
        <ProcedureSection />
      </div>
      <div className=" mb-[50px]">
        <CreateListing />
      </div>
      <div className=" mt-[80px]">
        <FAQ />
      </div>
      <div className=" mt-[80px]">
        <Footer />
      </div>
    </div>
  );
};

export default HomePage;
