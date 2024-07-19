import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import ResultsListBackgroundImage from "../../components/Common/Reusable/ResultsListBackgroundImage";

describe("ResultsListBackgroundImage Component", () => {
  test("renders the component", () => {
    render(<ResultsListBackgroundImage />);
    expect(screen.getByText("Advanced Search")).toBeInTheDocument();
    expect(screen.getByPlaceholderText("Location")).toBeInTheDocument();
  });

  test("initially selects 'all' button", () => {
    render(<ResultsListBackgroundImage />);
    expect(screen.getByText("All")).toHaveClass("bg-white text-black");
    expect(screen.getByText("For Rent")).toHaveClass("bg-terraOrange text-white");
    expect(screen.getByText("For Sale")).toHaveClass("bg-terraOrange text-white");
  });

  test("changes selection to 'For Rent' when clicked", () => {
    render(<ResultsListBackgroundImage />);
    fireEvent.click(screen.getByText("For Rent"));
    expect(screen.getByText("For Rent")).toHaveClass("bg-white text-black");
    expect(screen.getByText("All")).toHaveClass("bg-terraOrange text-white");
  });

  test("changes selection to 'For Sale' when clicked", () => {
    render(<ResultsListBackgroundImage />);
    fireEvent.click(screen.getByText("For Sale"));
    expect(screen.getByText("For Sale")).toHaveClass("bg-white text-black");
    expect(screen.getByText("All")).toHaveClass("bg-terraOrange text-white");
  });

  test("search button is clickable", () => {
    render(<ResultsListBackgroundImage />);
    const searchButton = screen.getByText("Search");
    fireEvent.click(searchButton);
    expect(searchButton).toBeEnabled();
  });
});
