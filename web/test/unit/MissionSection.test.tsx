import React from "react";
import { render, screen } from "@testing-library/react";
import MissionSection from "@/components/AboutUs/MissionSection";
import { useRouter } from "next/router";

// Mock the Navbar component with displayName
jest.mock("@/components/General/Navbar", () => {
  const MockNavbar = () => <div>Mock Navbar</div>;
  MockNavbar.displayName = "MockNavbar";
  return MockNavbar;
});

// Mock the Footer component with displayName
jest.mock("@/components/General/Footer", () => {
  const MockFooter = () => <div>Mock Footer</div>;
  MockFooter.displayName = "MockFooter";
  return MockFooter;
});

// Mock the next/image component with displayName
jest.mock("next/image", () => {
  const MockImage = (props: { src: string; alt: string; className: string }) => <img {...props} />;
  MockImage.displayName = "MockImage";
  return MockImage;
});

// Mock the next/router useRouter hook
jest.mock("next/router", () => ({
  useRouter: jest.fn(),
}));

describe("MissionSection", () => {
  beforeEach(() => {
    (useRouter as jest.Mock).mockReturnValue({
      route: "/",
      pathname: "",
      query: "",
      asPath: "",
      push: jest.fn(),
      replace: jest.fn(),
      reload: jest.fn(),
      back: jest.fn(),
      prefetch: jest.fn(),
      beforePopState: jest.fn(),
      isFallback: false,
    });
  });

  test("renders without crashing", () => {
    render(<MissionSection />);

    expect(screen.getByText(/Discover Your Ideal Home/i)).toBeInTheDocument();
    expect(screen.getByText(/with Terra/i)).toBeInTheDocument();
    expect(screen.getByText(/Our Vision/i)).toBeInTheDocument();
    expect(screen.getByText(/Why Choose Us/i)).toBeInTheDocument();
    expect(screen.getByText(/Mock Navbar/i)).toBeInTheDocument();
    expect(screen.getByText(/Mock Footer/i)).toBeInTheDocument();
  });
});
