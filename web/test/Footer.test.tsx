import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Footer from "@/components/General/Footer";

describe("Footer Component", () => {
  beforeEach(() => {
    render(<Footer />);
  });

  test("has a newsletter subscription section", () => {
    expect(screen.getByPlaceholderText("enter your email address")).toBeInTheDocument();
    expect(screen.getByRole("button", { name: "Subscribe" })).toBeInTheDocument();
  });

  test("renders social links correctly", () => {
    const socialItems = ["Facebook", "Instagram", "Twitter", "Youtube"];
    socialItems.forEach((item) => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test("displays contact information", () => {
    expect(screen.getByText("terra@gmail.com")).toBeInTheDocument();
    expect(screen.getByText("terra_company")).toBeInTheDocument();
    expect(screen.getByText("American House, Accra")).toBeInTheDocument();
  });
});
