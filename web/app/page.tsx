import HomePage from "@/components/General/HomePage";
import React from "react";
// import ResultsListBackgroundImage from "../components/Common/Reusable/ResultsListBackgroundImage";
// import AdvancedListingSettings from "../components/Common/Reusable/AdvancedListingSettings";
import ListDec from "@/components/Listing/ListDesc";

const Home: React.FC = () => {
  return (
    <div>
      {/* <ResultsListBackgroundImage />
      <AdvancedListingSettings /> */}
      <HomePage />
      <ListDec />
    </div>
  );
};

export default Home;
