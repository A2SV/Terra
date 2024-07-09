import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ListingCard from "@/components/Listing/Cards/ListingCard";

describe("ListingCard", () => {
  it("renders the component without crashing", () => {
    render(<ListingCard />);
    expect(screen.getByAltText("post")).toBeInTheDocument();
  });

  it("displays the location correctly", () => {
    render(<ListingCard />);
    expect(screen.getByText("Accra | Taifa")).toBeInTheDocument();
  });

  it("displays the property title", () => {
    render(<ListingCard />);
    expect(screen.getByText("Beautiful home located in Taifa, Burkina")).toBeInTheDocument();
  });

  it("displays the property price", () => {
    render(<ListingCard />);
    expect(screen.getByText("$321,347")).toBeInTheDocument();
  });

  it("displays the property details", () => {
    render(<ListingCard />);
    expect(screen.getByText("3")).toBeInTheDocument();
    expect(screen.getByText("2")).toBeInTheDocument();
    expect(screen.getByText("3000 sq.ft")).toBeInTheDocument();
  });

  it("renders the bookmark icon", () => {
    render(<ListingCard />);
    const bookmarkIcon = document.querySelector(".w-5.h-5.text-gray-400");
    expect(bookmarkIcon).toBeInTheDocument();
  });
});
