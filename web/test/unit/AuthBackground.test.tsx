import React from "react";
import { render } from "@testing-library/react";
import AuthBackground from "@/components/Authentication/AuthBackground";

interface AuthBackgroundProps {
  description: string;
  Card: React.ComponentType;
}
const MockCard: React.FC = () => <div>Mock Card Content</div>;

describe("AuthBackground Component", () => {
  const defaultProps: AuthBackgroundProps = {
    description: "Test description",
    Card: MockCard,
  };

  test("renders without crashing", () => {
    render(<AuthBackground {...defaultProps} />);
  });

  test("renders the description correctly", () => {
    const { getByText } = render(<AuthBackground {...defaultProps} />);
    expect(getByText("Test description today")).toBeInTheDocument();
  });

  test("renders the logo", () => {
    const { getByAltText } = render(<AuthBackground {...defaultProps} />);
    expect(getByAltText("Logo")).toBeInTheDocument();
  });

  test("renders the card content", () => {
    const { getByText } = render(<AuthBackground {...defaultProps} />);
    expect(getByText("Mock Card Content")).toBeInTheDocument();
  });

  test("renders the background image on larger screens", () => {
    const { getByAltText } = render(<AuthBackground {...defaultProps} />);
    expect(getByAltText("Background")).toBeInTheDocument();
  });

  test("renders the welcome text", () => {
    const { getByText } = render(<AuthBackground {...defaultProps} />);
    expect(getByText("Welcome to Terra")).toBeInTheDocument();
  });
});
