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
import SpinnerComponent from "@/components/Common/Reusable/Spinner";

const HomePage = () => {
  const [showError, setShowError] = useState<boolean>(true);
  const [listings, setListings] = useState<Listing[]>([]);

  const { data, error, isLoading } = useGetAllListingsQuery();

  useEffect(() => {
    if (data && data.items) {
      setListings(data.items);
    }
  }, [data]);

  useEffect(() => {
    if (error) {
      setShowError(true);
      const timer = setTimeout(() => {
        setShowError(false);
      }, 4000);

      return () => clearTimeout(timer);
    }
  }, [error]);

  return (
    <div className="flex flex-col min-w-[100%]">
      <Navbar />
      <HeroSection />
      <div className="lg:mt-10  mt-0">
        <Select />
      </div>

      <div className="flex justify-center items-center lg:mx-24 mt-[50px] mb-[50px]">
        {isLoading ? (
          <div>
            <SpinnerComponent />
          </div>
        ) : error && showError ? (
          <ErrorMessage message="Error fetching listings" onClose={() => setShowError(false)} />
        ) : (
          <div className="flex flex-wrap justify-center">
            {listings.map((listing: Listing) => (
              <ListingCard key={listing.listerId} item={listing} />
            ))}
          </div>
        )}
      </div>

      <div className="mt-[10px] mb-[50px]">
        <ExploreProperty />
      </div>
      <div className="mt-[60px] ">
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
