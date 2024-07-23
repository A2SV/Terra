import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import GeneralInfo from "@/components/AddListing/GeneralInfo";

describe("GeneralInfo Component", () => {
  test("renders without crashing", () => {
    render(<GeneralInfo />);
    expect(screen.getByText(/General Info/i)).toBeInTheDocument();
  });
});
