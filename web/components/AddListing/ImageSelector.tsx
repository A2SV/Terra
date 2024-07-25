"use client";
import React, { useState } from "react";
import addImage from "../../public/add_listing_screen/addImage.svg";
import Image from "next/image";

const ImageSelector: React.FC<{ handleInputChange: (name: string, value: string[]) => void }> = ({
  handleInputChange,
}) => {
  const [selectedImages, setSelectedImages] = useState<File[]>([]);

  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      const newImages = Array.from(e.target.files);
      setSelectedImages((prevImages) => {
        const updatedImages = [...prevImages, ...newImages];
        handleInputChange(
          "selectedImages",
          updatedImages.map((img) => URL.createObjectURL(img))
        );
        return updatedImages;
      });
    }
  };

  const handleRemoveImage = (index: number) => {
    setSelectedImages((prevImages) => {
      const updatedImages = prevImages.filter((_, i) => i !== index);
      handleInputChange(
        "selectedImages",
        updatedImages.map((img) => URL.createObjectURL(img))
      );
      return updatedImages;
    });
  };

  return (
    <div className="max-w-4xl mx-auto p-4">
      <div className="grid grid-cols-4 gap-4 mb-4">
        {selectedImages.map((image, index) => (
          <div key={index} className="relative">
            <Image
              src={URL.createObjectURL(image)}
              alt={`selected ${index}`}
              width={100}
              height={100}
              className="w-[100vh] h-20 lg:w-[90vh] lg:h-28 object-cover rounded-md"
            />
            <button
              onClick={() => handleRemoveImage(index)}
              className="absolute top-2 right-2 bg-white text-red-500 rounded-full w-6 h-6 flex items-center justify-center"
            >
              &times;
            </button>
          </div>
        ))}
      </div>
      <div className="flex flex-start">
        <label className="w-28 h-28 cursor-pointer hover:bg-gray-100">
          <Image src={addImage} alt="add image" />
          <input
            type="file"
            className="hidden"
            accept="image/*"
            multiple
            onChange={handleImageChange}
          />
        </label>
      </div>
    </div>
  );
};

export default ImageSelector;
