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

    expect(screen.getByText("What types of properties can I list on Terra?")).toBeInTheDocument();
    expect(screen.getByText("How do I create a listing on Terra?")).toBeInTheDocument();
    expect(screen.getByText("How can I ensure my listing gets noticed?")).toBeInTheDocument();
    expect(
      screen.getByText("How can I get my property featured on the homepage?")
    ).toBeInTheDocument();
    expect(screen.getByText("Can I edit my listing after it's published?")).toBeInTheDocument();
    expect(screen.getByText("Is there a fee for listing a property on Terra?")).toBeInTheDocument();
  });
});
