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
import { useGetAllListingsQuery } from "../../redux/listingApi";
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
      }, 10000);

      return () => clearTimeout(timer);
    }
  }, [error]);

  return (
    <div className="flex flex-col min-w-[100%] m-0 p-0">
      <Navbar />
      <HeroSection />
      <div className="lg:mt-10  max-sm:-mt-36">
        <Select />
      </div>

      <div className="flex mx-auto lg:mx-4 mt-[10px] mb-[50px] md:mt-12 md:ml-6 lg:ml-24">
        {isLoading ? (
          <div className="flex w-full justify-center items-center">
            <SpinnerComponent />
          </div>
        ) : error && showError ? (
          <ErrorMessage message="Error fetching listings" onClose={() => setShowError(false)} />
        ) : (
          <div className="flex flex-wrap w-full md:gap-12 ">
            {listings.map((listing: Listing) => (
              <ListingCard key={listing.listerId} item={listing} />
            ))}
          </div>
        )}
      </div>

      <div className="-mt-4">
        <ExploreProperty />
      </div>
      <div className="">
        <ProcedureSection />
      </div>
      <div className="">
        <CreateListing />
      </div>
      <div className=" mt-[30px]">
        <FAQ />
      </div>
      <div className=" mt-[40px]">
        <Footer />
      </div>
    </div>
  );
};

export default HomePage;
