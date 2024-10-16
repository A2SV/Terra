import React from "react";
import { EmblaOptionsType } from "embla-carousel";
import "@/components/Carousel/css/embla.css";
import "@/components/Carousel/css/sandbox.css";
import EmblaCarousel from "@/components/Silders/ImageCarousel/EmblaCarousel";

interface Props {
  images: string[];
}

const Carousel = ({ images }: Props) => {
  const OPTIONS: EmblaOptionsType = { loop: true };
  return (
    <div>
      <main className="sandbox">
        <section className="sandbox__carousel">
          <EmblaCarousel images={images} options={OPTIONS} />
        </section>
      </main>
    </div>
  );
};

export default Carousel;
