import ResultsListBackgroundImage from "@/components/Common/Reusable/ResultsListBackgroundImage";
import Filters from "@/components/General/Filters";
import React from "react";

const HelloWorld: React.FC = () => {
  return (
    <div>
      <ResultsListBackgroundImage />
      <div className="flex">
        <Filters />
      </div>
    </div>
  );
};

export default HelloWorld;
