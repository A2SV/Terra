import React, { useState } from "react";

const OfficeSpaceFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [officeType, setOfficeType] = useState<string>("Open Plan");
  const [meetingRooms, setMeetingRooms] = useState<string>("Yes");
  const [receptionArea, setReceptionArea] = useState<string>("Yes");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "officeType") setOfficeType(value);
    if (name === "meetingRooms") setMeetingRooms(value);
    if (name === "receptionArea") setReceptionArea(value);
  };

  return (
    <div className="p-6">
        <div className="grid grid-cols-2 gap-4 mb-5">
          <div className="flex">
            <label className="block text-sm text-black font-semibold pr-5 pt-1" htmlFor="openPlan">
              Open Plan
            </label>
            <input
              type="radio"
              id="openPlan"
              name="officeType"
              value="Open Plan"
              checked={officeType === "Open Plan"}
              onChange={handleChange}
              className="mt-1"
            />
          </div>
          <div className="flex">
            <label
              className="block text-sm text-black font-semibold pr-5 pt-1"
              htmlFor="individualOffices"
            >
              Individual Offices
            </label>
            <input
              type="radio"
              id="individualOffices"
              name="officeType"
              value="Individual Offices"
              checked={officeType === "Individual Offices"}
              onChange={handleChange}
              className="mt-1"
            />
          </div>
        </div>
        <div className="flex">
          <div>
            <label className="block text-sm text-black font-semibold pr-5 pt-1">
              Meeting rooms available
            </label>
            <div>
              <input
                type="radio"
                id="meetingRoomsYes"
                name="meetingRooms"
                value="Yes"
                checked={meetingRooms === "Yes"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="meetingRoomsYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="meetingRoomsNo"
                name="meetingRooms"
                value="No"
                checked={meetingRooms === "No"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="meetingRoomsNo" className="pl-2">
                No
              </label>
            </div>
          </div>
          <div className="pl-14">
            <label className="block text-sm text-black font-semibold pr-5 pt-1">
              Reception area
            </label>
            <div>
              <input
                type="radio"
                id="receptionYes"
                name="receptionArea"
                value="Yes"
                checked={receptionArea === "Yes"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="receptionYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="receptionNo"
                name="receptionArea"
                value="No"
                checked={receptionArea === "No"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="receptionNo" className="pl-2">
                No
              </label>
            </div>
          </div>
        </div>
    </div>
  );
};

export default OfficeSpaceFeatures;
