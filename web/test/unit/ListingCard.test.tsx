import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ListingCard from "@/components/Listing/Cards/ListingCard";
import { Listing } from "@/types/listingTypes";

// Mock Carousel component
jest.mock("@/components/Carousel/Carousel", () => {
  const MockCarousel = () => <div data-testid="mock-carousel" />;
  MockCarousel.displayName = "MockCarousel";
  return MockCarousel;
});

describe("ListingCard", () => {
  it("renders the component correctly", () => {
    const mockListing: Listing = {
      listerId: "123",
      paymentInformationId: "456",
      propertyLocationId: "789",
      id: "1",
      title: "Mock Title",
      description: "Mock Description",
      propertyType: 1, // Apartment
      publishStatus: 1, // Published
      marketStatus: 1, // Available
      listingType: 0, // For Rent
      propertySize: 1200,
      availableStartDate: "2023-01-01",
      availableEndDate: "2023-12-31",
      createdAt: "2023-01-01T00:00:00Z",
      updatedAt: "2023-01-02T00:00:00Z",
    };

    render(<ListingCard item={mockListing} />);

    // Check for presence of key elements
    expect(screen.getByText("Featured")).toBeInTheDocument();
    expect(screen.getByText("Accra | Taifa")).toBeInTheDocument();
    expect(screen.getByText("3")).toBeInTheDocument();
    expect(screen.getByText("2")).toBeInTheDocument();

    // Check for images
    expect(screen.getByAltText("Single Listing Profile")).toBeInTheDocument();
    expect(screen.getByAltText("bed")).toBeInTheDocument();
    expect(screen.getByAltText("shower")).toBeInTheDocument();
    expect(screen.getByAltText("construction")).toBeInTheDocument();

    // Check for mock carousel
    expect(screen.getByTestId("mock-carousel")).toBeInTheDocument();
  });
});
