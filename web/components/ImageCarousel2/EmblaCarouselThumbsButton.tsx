import React from "react";

interface ThumbProps {
  selected: boolean;
  onClick: () => void;
  imgSrc: string;
  index: number;
}

export const Thumb: React.FC<ThumbProps> = ({ selected, onClick, imgSrc }) => (
  <div className={`embla__slide embla__slide--thumb ${selected ? "is-selected" : ""}`}>
    <button
      onClick={onClick}
      className="embla__slide__inner embla__slide__inner--thumb"
      type="button"
    >
      <img className="embla__slide__thumbnail" src={imgSrc} alt="A cool cat." />
    </button>
  </div>
);
