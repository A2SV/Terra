import React from "react";
import { render, screen } from "@testing-library/react";
import ExploreProperty from "../../components/General/ExploreProperty";

describe("ExploreProperty Component", () => {
  test("renders Explore Cities heading", () => {
    render(<ExploreProperty />);
    const headingElement = screen.getByText(/Explore Cities/i);
    expect(headingElement).toBeInTheDocument();
  });

  test("renders city cards with correct details", () => {
    render(<ExploreProperty />);

    const cityCards = screen.getAllByText(/East Legon/i);
    const propertyCounts = screen.getAllByText(/200 properties/i);

    expect(cityCards).toHaveLength(9); // There are 9 city cards as per the provided code
    expect(propertyCounts).toHaveLength(9);

    cityCards.forEach((cityCard, index) => {
      expect(cityCard).toBeInTheDocument();
      expect(propertyCounts[index]).toBeInTheDocument();
    });
  });

  test("renders More Details buttons with icons", () => {
    render(<ExploreProperty />);

    const moreDetailsButtons = screen.getAllByText(/More Details/i);
    expect(moreDetailsButtons).toHaveLength(9);

    moreDetailsButtons.forEach((button) => {
      expect(button).toBeInTheDocument();
      const arrowIcon = button.nextSibling;
      expect(arrowIcon).toBeInTheDocument();
      expect(arrowIcon).toHaveClass("w-10"); // Check for class name of the icon
    });
  });
});
