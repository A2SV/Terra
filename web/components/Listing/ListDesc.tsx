import React from "react";
import { IoIosCheckmarkCircleOutline } from "react-icons/io";
import { IoCaretDownCircleOutline, IoCalendarOutline } from "react-icons/io5";
import { SlMap } from "react-icons/sl";

const ListDesc: React.FC = () => {
  const features = [
    "Air Conditioning",
    "Barbeque",
    "Dryer",
    "Gym",
    "Laundry",
    "Lawn",
    "Microwave",
    "Outdoor Shower",
    "Refrigerator",
    "Sauna",
    "Swimming Pool",
    "TV Cable",
    "Washer",
    "WiFi",
    "Window Coverings",
  ];
  return (
    <div className="flex flex-col w-full lg:w-8/12 bg-gray-50">
      <div className="bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <div className="flex flex-row justify-between border-b-2 mt-3 items-center pt-3 pb-5">
          <p className="text-lg font-roboto">Description</p>
        </div>
        <p className="py-10">
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
          tincidunt ut laoreet <br /> dolore magna aliquam erat volutpat. Ut wisi enim ad minim
          veniam, quis nostrud exerci tation ullamcorper <br /> suscipit lobortis nisl ut aliquip ex
          ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in <br /> vulputate
          velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et
          accumsan et <br /> iusto odio dignissim qui blandit praesent luptatum zzril delenit augue
          duis dolore te feugait nulla facilisi.
        </p>
        <p className="pb-10">
          Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod
          mazim placerat facer <br /> possim assum. Typi non habent claritatem insitam; est usus
          legentis in iis qui facit eorum claritatem. <br /> Investigationes demonstraverunt
          lectores legere me lius quod ii legunt saepius. Claritas est etiam processus <br />{" "}
          dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera
          gothica, quam nunc <br /> putamus parum claram, anteposuerit litterarum formas humanitatis
          per seacula quarta decima et quinta <br />
          decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
        </p>
      </div>

      <div className="bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <div className="flex flex-row justify-between border-b-2 mt-3 items-center pt-3 pb-5">
          <p className="text-lg font-roboto">Address</p>
          <button className="bg-sky-400 py-1 w-[28%] px-3 rounded flex items-center text-xs justify-between text-white">
            <SlMap />
            Open on Google Maps
          </button>
        </div>

        <div className="flex flex-row justify-between">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Address</p>
              <p>2436 SW 8th St</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">City</p>
              <p>Miami</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">State/county</p>
              <p>Florida</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Zip/Postal Code</p>
              <p>33140</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Area</p>
              <p>West Flagger</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Country</p>
              <p>United States</p>
            </div>
          </div>
        </div>
      </div>
      <div className="w-full bg-white px-0 lg:px-12 rounded py-14">
        <div className="flex flex-row justify-between border-b-2 items-center pt-4 pb-8">
          <p className="text-lg font-roboto">Details</p>
          <p className="font-light text-sm text-gray-400 flex items-center">
            <IoCalendarOutline className="mr-1" />
            Updated on April 4, 2020 at 5:18 pm
          </p>
        </div>

        <div className="flex flex-row justify-between border bg-terrablue bg-opacity-10 border-sky-500 mt-8 mb-3 px-8 rounded">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property ID:</p>
              <p>HZ40</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Price:</p>
              <p>$4,500/mo</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Size:</p>
              <p>1200 Sq m</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Bedrooms:</p>
              <p>4</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Bathrooms:</p>
              <p>2</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Garage:</p>
              <p>1</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Garage Size:</p>
              <p>200 Sq m</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Year Built:</p>
              <p>2016</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Type:</p>
              <p>Apartment</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Status:</p>
              <p>For Rent</p>
            </div>
          </div>
        </div>

        <p className="font-medium border-b-2 pt-6 pb-10">Additional details</p>

        <div className="flex flex-row justify-between py-8">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Deposit:</p>
              <p>20%</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Pool Size:</p>
              <p>300 Sqft</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Last remodel year:</p>
              <p>1987</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Amenities:</p>
              <p>Clubhouse</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Additional Rooms::</p>
              <p>Guest Bath</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Equipment:</p>
              <p>Grill - Gas</p>
            </div>
          </div>
        </div>
      </div>

      <div className="w-full bg-white px-0 lg:px-12 rounded mb-16 mt-14 py-6">
        <p className="text-lg font-roboto">Features</p>
        <div className="grid grid-cols-3 space-y-5 my-6">
          {features.map((feature, index) => (
            <div
              key={index}
              className={`flex items-center space-x-2 ${
                feature === "Air Conditioning" ? "pt-5" : ""
              }`}
            >
              <IoIosCheckmarkCircleOutline />
              <p className="">{feature}</p>
            </div>
          ))}
        </div>
      </div>

      <div className="w-full bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <p className="text-lg font-roboto">Floor Plans</p>
        <div className="flex flex-row justify-between border-b-2 py-4">
          <p className="font-bold flex items-center">
            <IoCaretDownCircleOutline className="text-blue" />
            City
          </p>
          <p>Miami</p>
        </div>
        <div className="flex flex-row justify-between border-b-2 py-4">
          <p className="font-bold flex items-center">
            <IoCaretDownCircleOutline className="text-blue" />
            State/county
          </p>
          <p>Florida</p>
        </div>
      </div>
    </div>
  );
};

export default ListDesc;
