import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ListingCard from "@/components/Listing/Cards/ListingCard";

// Mock Carousel component
jest.mock("@/components/Carousel/Carousel", () => {
  const MockCarousel = () => <div data-testid="mock-carousel" />;
  MockCarousel.displayName = "MockCarousel";
  return MockCarousel;
});

describe("ListingCard", () => {
  it("renders the component correctly", () => {
    render(<ListingCard />);

    // Check for presence of key elements
    expect(screen.getByText("Featured")).toBeInTheDocument();
    expect(screen.getByText("For Rent")).toBeInTheDocument();
    expect(screen.getByText("$321,347")).toBeInTheDocument();
    expect(screen.getByText("Apartment")).toBeInTheDocument();
    expect(screen.getByText("Beautiful home located in Taifa")).toBeInTheDocument();
    expect(screen.getByText("Accra | Taifa")).toBeInTheDocument();
    expect(screen.getByText("3")).toBeInTheDocument();
    expect(screen.getByText("2")).toBeInTheDocument();
    expect(screen.getByText("3000 sq.ft")).toBeInTheDocument();

    // Check for images
    expect(screen.getByAltText("Single Listing Profile")).toBeInTheDocument();
    expect(screen.getByAltText("bed")).toBeInTheDocument();
    expect(screen.getByAltText("shower")).toBeInTheDocument();
    expect(screen.getByAltText("construction")).toBeInTheDocument();

    // Check for mock carousel
    expect(screen.getByTestId("mock-carousel")).toBeInTheDocument();
  });
});
