import React from "react";
import { PiStarFill, PiStar } from "react-icons/pi";

interface ReviewStarsProps {
  rating: number;
  maxStars?: number;
}

const ReviewStars: React.FC<ReviewStarsProps> = ({ rating, maxStars = 5 }) => {
  const filledStars = Math.min(rating, maxStars);
  const emptyStars = maxStars - filledStars;

  return (
    <div className="flex">
      {Array.from({ length: filledStars }, (_, index) => (
        <PiStarFill key={index} className="text-reviewGold text-xl" />
      ))}
      {Array.from({ length: emptyStars }, (_, index) => (
        <PiStar key={index} className="text-gray-400 text-xl" />
      ))}
    </div>
  );
};

export default ReviewStars;
