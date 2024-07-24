import React from "react";
import { render, screen } from "@testing-library/react";
import ListDesc from "@/components/Listing/ListDesc";

describe("ListDesc Component", () => {
  test("renders description section", () => {
    render(<ListDesc />);
    const descriptionElement = screen.getByText(/Description/i);
    expect(descriptionElement).toBeInTheDocument();
  });

  test("renders address section", () => {
    render(<ListDesc />);
    const addressElements = screen.getAllByText(/Address/i);
    const addressElement = addressElements[0];
    expect(addressElement).toBeInTheDocument();
  });

  test("renders features section", () => {
    render(<ListDesc />);
    const featuresElement = screen.getByText(/Features/i);
    expect(featuresElement).toBeInTheDocument();
  });

  test("renders video section", () => {
    render(<ListDesc />);
    const videoElement = screen.getByText(/Video/i);
    expect(videoElement).toBeInTheDocument();
  });

  test("renders all features", () => {
    render(<ListDesc />);
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
    features.forEach((feature) => {
      expect(screen.getByText(feature)).toBeInTheDocument();
    });
  });
});
