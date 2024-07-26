"use client";
import React, { useState, useEffect, useCallback, FC } from "react";
import { EmblaCarouselType } from "embla-carousel";
import useEmblaCarousel from "embla-carousel-react";
import { DotButton, PrevButton, NextButton } from "./EmblaCarouselArrowsDotsButtons";
// import Autoplay from "embla-carousel-autoplay";
import { Snackbar } from "@mui/material";

interface EmblaCarouselProps {
  options: any; // Adjust the type of 'options' as needed
  images: string[];
}

const EmblaCarousel: FC<EmblaCarouselProps> = ({ options, images }: EmblaCarouselProps) => {
  const [emblaRef, emblaApi] = useEmblaCarousel(options, []);
  const [prevBtnDisabled, setPrevBtnDisabled] = useState(true);
  const [nextBtnDisabled, setNextBtnDisabled] = useState(true);
  const [selectedIndex, setSelectedIndex] = useState(0);
  const [scrollSnaps, setScrollSnaps] = useState<number[]>([]);

  const slides = Array.from(Array((images ?? []).length).keys());
  const imageByIndex = (index: number): string => (images ?? [])[index % (images ?? []).length];

  const scrollPrev = useCallback(() => emblaApi && emblaApi.scrollPrev(), [emblaApi]);
  const scrollNext = useCallback(() => emblaApi && emblaApi.scrollNext(), [emblaApi]);
  const scrollTo = useCallback((index: number) => emblaApi && emblaApi.scrollTo(index), [emblaApi]);

  const onInit = useCallback((emblaApi: EmblaCarouselType) => {
    setScrollSnaps(emblaApi.scrollSnapList());
  }, []);

  const onSelect = useCallback((emblaApi: EmblaCarouselType) => {
    setSelectedIndex(emblaApi.selectedScrollSnap());
    setPrevBtnDisabled(!emblaApi.canScrollPrev());
    setNextBtnDisabled(!emblaApi.canScrollNext());
  }, []);

  const [open, setOpen] = useState(false);
  const [message] = useState("");

  useEffect(() => {
    if (!emblaApi) return;

    onInit(emblaApi);
    onSelect(emblaApi);
    emblaApi.on("reInit", onInit);
    emblaApi.on("reInit", onSelect);
    emblaApi.on("select", onSelect);
  }, [emblaApi, onInit, onSelect]);

  const handleClose = () => {
    setOpen(false);
  };

  const action = <button onClick={handleClose}>Close</button>;

  return (
    <div>
      <div className="main relative">
        <Snackbar
          open={open}
          autoHideDuration={6000}
          onClose={handleClose}
          message={message}
          action={action}
          className="absolute"
        />
        <div className="embla h-72">
          <div className="embla__viewport h-full" ref={emblaRef}>
            <div className="embla__container h-full">
              {slides.map((index) => (
                <div className="embla__slide h-full" key={index}>
                  <img
                    className="embla__slide__img h-full object-cover"
                    src={imageByIndex(index)}
                    alt="image"
                  />
                </div>
              ))}
            </div>
          </div>
          <div className="embla__buttons relative bottom-[12rem] flex justify-between">
            <PrevButton onClick={scrollPrev} disabled={prevBtnDisabled} />
            <NextButton onClick={scrollNext} disabled={nextBtnDisabled} />
          </div>
        </div>

        <div className="embla__dots w-24 mx-32">
          {scrollSnaps.map((_, index) => (
            <DotButton
              key={index}
              onClick={() => scrollTo(index)}
              className={"embla__dot".concat(
                index === selectedIndex ? " embla__dot--selected" : ""
              )}
            />
          ))}
        </div>
      </div>
    </div>
  );
};

export default EmblaCarousel;
