import React from "react";
import ReviewForm from "@/components/Review/ReviewForm";
import ReviewCard from "@/components/Review/ReviewCard";
import ReviewStars from "@/components/Review/ReviewStars";
import { MdUnfoldMore } from "react-icons/md";

const Review = () => {
  return (
    <div className="">
      <ReviewForm />
      <div className="flex flex-col lg:flex-row w-screen md:w-9/12 items-center justify-between lg:p-12">
        <div className="flex mb-5 lg:mb-0 items-center">
          <p className="font-roboto text-base lg:text-xl font-normal mr-4">6 Reviews</p>
          <ReviewStars rating={4} />
          <p className="ml-1 font-roboto text-base lg:text-xl font-extralight">(4.17 out of 5)</p>
        </div>
        <div className="flex items-center">
          <p className="font-roboto text-sm font-light mr-2">Sort by:</p>
          <div className="flex cursor-pointer items-center">
            <p className="text-xs lg:text-sm font-roboto font-light text-slate-400 md:mr-4 ">
              Default Order{" "}
            </p>
            <MdUnfoldMore className=" text-gray-400 text-sm" />
          </div>

          <button className="bg-sky-400 text-white rounded font-roboto text-xs h-7 w-28 font-normal ml-6">
            Leave a Review
          </button>
        </div>
      </div>
      <ReviewCard
        heading="Top Properties for sale in Sialkot"
        description="Top Properties for sale in Sialkot By Khita Real Estate Agency Sialkot "
        star={5}
        upvote={0}
        downvote={0}
        time="2 weeks ago"
      />
      <ReviewCard
        heading="Konda"
        description="Hup"
        star={5}
        upvote={3}
        downvote={0}
        time="1 year ago"
      />
    </div>
  );
};

export default Review;
