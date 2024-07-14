import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import HeroSection from "@/components/Hero/HeroSection";

jest.mock("next/image", () => ({
  __esModule: true,
  default: ({ src, alt, ...props }: { src: string; alt: string; [key: string]: any }) => (
    <img src={src} alt={alt} {...props} />
  ),
}));

jest.mock("next/link", () => ({
  __esModule: true,
  default: ({ children, ...rest }: { children: React.ReactNode }) => {
    return <a {...rest}>{children}</a>;
  },
}));

describe("HeroSection", () => {
  test("renders the HeroSection component", () => {
    render(<HeroSection />);

    expect(screen.getByText("Discover Your Ideal Home")).toBeInTheDocument();
    expect(screen.getByText("with Terra")).toBeInTheDocument();
    expect(
      screen.getByText(/Seamlessly Rent, Buy, or Sell Properties. Uncover/)
    ).toBeInTheDocument();

    expect(screen.getByText("All")).toBeInTheDocument();
    expect(screen.getByText("Rent")).toBeInTheDocument();
    expect(screen.getByText("Buy")).toBeInTheDocument();

    expect(screen.getByRole("button")).toBeInTheDocument();
  });

  test("renders images correctly", () => {
    render(<HeroSection />);

    const heroImage = screen.getAllByRole("img")[0];
    expect(heroImage).toBeInTheDocument();
    expect(heroImage).toHaveAttribute("alt", "hero");

    const heroBackImage = screen.getAllByRole("img")[1];
    expect(heroBackImage).toBeInTheDocument();
    expect(heroBackImage).toHaveAttribute("alt", "hero");
  });
});
