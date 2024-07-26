import React, { useState } from "react";

const GuestHouseFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [starRating, setStarRating] = useState<number | string>("");
  const [restaurantOnSite, setRestaurantOnSite] = useState<string>("Yes");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "starRating") setStarRating(value);
    if (name === "restaurantOnSite") setRestaurantOnSite(value);
  };

  return (
    <div className="p-6">
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="block text-sm text-black font-semibold">Star rating</label>
          <input
            className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
            type="number"
            name="starRating"
            value={starRating}
            onChange={handleChange}
            placeholder="Enter value"
          />
        </div>
        <div>
          <label className="block text-sm text-black font-semibold">Restaurant on-site</label>
          <select
            className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
            name="restaurantOnSite"
            value={restaurantOnSite}
            onChange={handleChange}
          >
            <option value="Yes">Yes</option>
            <option value="No">No</option>
          </select>
        </div>
      </div>
    </div>
  );
};

export default GuestHouseFeatures;
