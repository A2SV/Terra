import React from "react";
import { render, screen } from "@testing-library/react";
import AuthBackground from "@/components/Authentication/AuthBackground";

describe("AuthBackground", () => {
  it("renders without crashing", () => {
    render(<AuthBackground description="Test Description" />);
    expect(screen.getByText(/Welcome to Terra/i)).toBeInTheDocument();
  });

  it("displays the description prop correctly", () => {
    const testDescription = "Test Description";
    render(<AuthBackground description={testDescription} />);
    expect(screen.getByText(`${testDescription} today`)).toBeInTheDocument();
  });

  it("renders exactly two images", () => {
    render(<AuthBackground description="Test Description" />);
    const images = screen.getAllByRole("img");
    expect(images).toHaveLength(2);
  });

  it("matches snapshot", () => {
    const { asFragment } = render(<AuthBackground description="Snapshot Description" />);
    expect(asFragment()).toMatchSnapshot();
  });
});
