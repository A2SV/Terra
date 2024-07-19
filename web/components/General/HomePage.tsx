import React from "react";
import Navbar from "./Navbar";
import HeroSection from "./HeroSection";
import Select from "./Select";
import ListingCard from "../Listing/Cards/ListingCard";
import ExploreProperty from "./ExploreProperty";
import ProcedureSection from "./ProcedureSection";
import CreateListing from "./CreateListing";
import FAQ from "./FAQ";
import Footer from "./Footer";

const HomePage = () => {
  return (
    <div className="flex flex-col">
      <Navbar />
      <HeroSection />
      <div className="lg:mt-10  mt-0">
        <Select />
      </div>

      <div className="flex justify-center items-center lg:mx-24 mt-[50px] mb-[50px]">
        <div className="flex flex-wrap justify-center gap-[50px]">
          <ListingCard />
          <ListingCard />
          <ListingCard />
          <ListingCard />
          <ListingCard />
          <ListingCard />
        </div>
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
