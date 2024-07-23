import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import HeroListing from "@/components/HeroListing/HeroListing";

jest.mock("@/components/DetailCarousel/DetailCarousel", () => {
  const MockDetailCarousel = () => <div data-testid="mock-detailcarousel" />;
  MockDetailCarousel.displayName = "MockDetailCarousel";
  return MockDetailCarousel;
});

describe("HeroListing", () => {
  it("renders the component correctly", () => {
    render(<HeroListing />);

    expect(screen.getByText("Overview")).toBeInTheDocument();
    const apartmentElements = screen.getAllByText("Apartment");
    expect(apartmentElements[0]).toBeInTheDocument();
    expect(screen.getByText("4")).toBeInTheDocument();
    expect(screen.getByText("2")).toBeInTheDocument();
    expect(screen.getByText("1")).toBeInTheDocument();
    expect(screen.getByText("1200")).toBeInTheDocument();
    expect(screen.getByText("2016")).toBeInTheDocument();
    expect(screen.getByText("Light And Modern Apartment")).toBeInTheDocument();
    expect(screen.getByText("$4,500/mo")).toBeInTheDocument();
    expect(screen.getByText("2436 SW 8th St, Miami, FL 33135, USA")).toBeInTheDocument();

    expect(screen.getByTestId("mock-detailcarousel")).toBeInTheDocument();
  });
});
