import React from "react";
import { render, screen } from "@testing-library/react";
import ResetBackground from "@/components/Authentication/ResetBackground";

describe("ResetBackground", () => {
  it("renders without crashing", () => {
    render(<ResetBackground />);
    expect(screen.getByText(/Forgot Password\?/i)).toBeInTheDocument();
    expect(screen.getByText(/Reset password/i)).toBeInTheDocument();
  });

  it("renders exactly two images", () => {
    render(<ResetBackground />);
    const images = screen.getAllByRole("img");
    expect(images).toHaveLength(2);
  });

  it("matches snapshot", () => {
    const { asFragment } = render(<ResetBackground />);
    expect(asFragment()).toMatchSnapshot();
  });
});
