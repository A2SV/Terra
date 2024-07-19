import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import AdvancedListingSettings from "../../components/Common/Reusable/AdvancedListingSettings";

describe("AdvancedListingSettings Component", () => {
  test("renders the component", () => {
    render(<AdvancedListingSettings />);
    expect(screen.getByText("Amenities")).toBeInTheDocument();
    expect(screen.getByText("Land size")).toBeInTheDocument();
    expect(screen.getByText("Price Range")).toBeInTheDocument();
    expect(screen.getByText("Search")).toBeInTheDocument();
  });

  test("initial values for land size and price range sliders", () => {
    render(<AdvancedListingSettings />);
    expect(screen.getByText("200 - 4000 sqm")).toBeInTheDocument();
    expect(screen.getByText("$200 - $4000")).toBeInTheDocument();
  });

  test("changes land size slider value", () => {
    render(<AdvancedListingSettings />);
    const landSizeSliders = screen.getAllByLabelText("Land size range");

    fireEvent.change(landSizeSliders[0], { target: { value: 300 } });
    fireEvent.change(landSizeSliders[1], { target: { value: 3500 } });

    expect(screen.getByText("300 - 3500 sqm")).toBeInTheDocument();
  });

  test("changes price range slider value", () => {
    render(<AdvancedListingSettings />);
    const priceRangeSliders = screen.getAllByLabelText("Price range");

    fireEvent.change(priceRangeSliders[0], { target: { value: 500 } });
    fireEvent.change(priceRangeSliders[1], { target: { value: 3000 } });

    expect(screen.getByText("$500 - $3000")).toBeInTheDocument();
  });

  test("search button is clickable", () => {
    render(<AdvancedListingSettings />);
    const searchButton = screen.getByText("Search");
    fireEvent.click(searchButton);
    expect(searchButton).toBeEnabled();
  });
});
