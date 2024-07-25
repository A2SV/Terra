import React, { useState } from "react";

const HouseFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [numStories, setNumStories] = useState<string | number>("");
  const [garageSpaces, setGarageSpaces] = useState<boolean>(false);
  const [studentFriendly, setStudentFriendly] = useState<boolean>(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, type, value, checked } = e.target;
    if (type === "checkbox") {
      const inputValue = checked;
      handleInputChange(name, inputValue);
      if (name === "garageSpaces") setGarageSpaces(inputValue);
      if (name === "studentFriendly") setStudentFriendly(inputValue);
    } else {
      const inputValue = value;
      handleInputChange(name, inputValue);
      if (name === "numStories") setNumStories(inputValue);
    }
  };

  return (
    <div>
      <div className="p-6">
        <form className="space-y-4">
          <div className="grid grid-cols-3 gap-4">
            <div>
              <label className="block text-sm text-black font-semibold pt-2 pr-5">
                Number of stories
              </label>
              <input
                type="number"
                name="numStories"
                value={numStories}
                onChange={handleChange}
                placeholder="Enter value"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
            <div className="flex">
              <label className=" text-sm text-black font-semibold pr-5 pl-5 pt-2">
                Garage spaces
              </label>
              <input
                type="checkbox"
                name="garageSpaces"
                checked={garageSpaces}
                onChange={handleChange}
                className="pl-5"
              />
            </div>
            <div className="flex">
              <label className="block text-sm text-black font-semibold pl-5 pt-2">
                Student-Friendly
              </label>
              <input
                type="checkbox"
                name="studentFriendly"
                checked={studentFriendly}
                onChange={handleChange}
              />
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default HouseFeatures;
