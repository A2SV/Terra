import React from "react";
import { EmblaOptionsType } from "embla-carousel";
import "@/components/Silders/DetailCarousel/css/embla.css";
import "@/components/Silders/DetailCarousel/css/sandbox.css";
import EmblaCarousel from "@/components/Silders/ImageCarousel2/EmblaCarousel";

interface Props {
  images: string[];
}

const DetailCarousel = ({ images }: Props) => {
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

export default DetailCarousel;
