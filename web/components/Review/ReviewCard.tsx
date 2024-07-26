import React from "react";
import Profile from "@/public/reviewer-avatar.svg";
import Image from "next/image";
import ReviewStars from "@/components/Review/ReviewStars";
import { ImAttachment } from "react-icons/im";
import { BsHandThumbsUp } from "react-icons/bs";

interface ReviewProps {
  star: number;
  heading: string;
  description: string;
  upvote: number;
  downvote: number;
  time: string;
}

const Review: React.FC<ReviewProps> = ({ star, heading, description, upvote, downvote, time }) => {
  return (
    <div className="w-screen md:w-9/12 min-h-36 flex mt-16 md:m-10">
      <div className="md:w-[10%] flex justify-center">
        <Image src={Profile} alt="Profile of Reviewer" className="size-14 sm:size-20" />
      </div>

      <div className="review w-[80%] ml-4 space-y-3 mt-1">
        <div className="flex items-center">
          <p className="font-roboto mr-2 text-sm sm:text-lg font-normal">{heading}</p>
          <ReviewStars rating={star} />
        </div>
        <div className="flex items-center">
          <ImAttachment className="text-gray-400 mr-4" />
          <p className="text-gray-400 font-roboto text-sm font-light">{time}</p>
        </div>
        <p className="font-roboto font-extralight text-sm sm:text-lg">{description}</p>
        <div className="feedback w-full flex sm:justify-end mb-2">
          <div className="w-28 flex">
            <div className="flex items-center mr-2">
              <BsHandThumbsUp className="text-green-600 text-xl mr-2 shrink-0 " />
              <p className="text-green-600 font-extralight text-xl">{upvote}</p>
            </div>
            <div className="neg flex items-center">
              <BsHandThumbsUp className="text-red-600 text-xl mr-2 rotate-180 shrink-0" />
              <p className="text-red-600 font-extralight text-xl">{downvote}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Review;
