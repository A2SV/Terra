import React from "react";
import { render, screen } from "@testing-library/react";
import FAQ from "@/components/General/FAQ";

describe("FAQ Component", () => {
  test("renders the FAQ section with title and image", () => {
    render(<FAQ />);

    expect(screen.getByText("Frequently Asked Questions")).toBeInTheDocument();

    expect(screen.getByAltText("Woman thinking about a question")).toBeInTheDocument();
  });

  test("renders all accordion components with correct titles", () => {
    render(<FAQ />);

    expect(screen.getByText("What does Step Worth specialize in?")).toBeInTheDocument();
    expect(screen.getByText("How can I contact Step Worth?")).toBeInTheDocument();
    expect(screen.getByText("What sets Step Worth apart from competitors?")).toBeInTheDocument();
    expect(screen.getByText("Is Step Worth hiring?")).toBeInTheDocument();
    expect(
      screen.getByText("Do you offer custom solutions for unique project requirements?")
    ).toBeInTheDocument();
    expect(screen.getByText("What payment methods does Step Worth accept?")).toBeInTheDocument();
  });
});
