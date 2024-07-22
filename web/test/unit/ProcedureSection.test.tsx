import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ProcedureSection from "../../components/General/ProcedureSection";

describe("ProcedureSection Component", () => {
  test("renders without crashing", () => {
    render(<ProcedureSection />);
    expect(screen.getByAltText("main")).toBeInTheDocument();
  });

  test("all images are present", () => {
    render(<ProcedureSection />);
    expect(screen.getByAltText("main")).toBeInTheDocument();
    expect(screen.getByAltText("Text Image")).toBeInTheDocument();
    expect(screen.getByAltText("sub_section")).toBeInTheDocument();
  });

  test("renders the correct text content", () => {
    render(<ProcedureSection />);
    expect(screen.getByText("How to work Our")).toBeInTheDocument();
    expect(screen.getByText("Process")).toBeInTheDocument();
    expect(screen.getByText("Buy & Sell Your Home Property")).toBeInTheDocument();
  });
});
