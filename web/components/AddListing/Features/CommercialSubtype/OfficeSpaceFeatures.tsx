import React from "react";

const OfficeSpaceFeatures: React.FC = () => {
  return (
    <div className="p-6">
      <form action="" className="space-y-4">
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
                className="mt-1"
              />
              <label htmlFor="receptionNo" className="pl-2">
                No
              </label>
            </div>
          </div>
        </div>
      </form>
    </div>
  );
};

export default OfficeSpaceFeatures;