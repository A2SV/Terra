import React from "react";
import { render, fireEvent, screen } from "@testing-library/react";
import SignUpCard from "@/components/SignUpCard";

describe("SignUpCard Component", () => {
  test("renders SignUpCard component", () => {
    render(<SignUpCard />);
    expect(
      screen.getByText("Enter your details and join the Terra family today")
    ).toBeInTheDocument();
  });

  test("shows email validation error for invalid email", () => {
    render(<SignUpCard />);
    const emailInput = screen.getByPlaceholderText("Enter your Email Address");
    fireEvent.change(emailInput, { target: { value: "invalid-email" } });
    fireEvent.blur(emailInput);
    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
  });

  test("does not show email validation error for valid email", () => {
    render(<SignUpCard />);
    const emailInput = screen.getByPlaceholderText("Enter your Email Address");
    fireEvent.change(emailInput, { target: { value: "valid@example.com" } });
    fireEvent.blur(emailInput);
    expect(screen.queryByText("Invalid email address")).not.toBeInTheDocument();
  });

  test("toggles password visibility", () => {
    render(<SignUpCard />);
    const passwordInput = screen.getByPlaceholderText("Enter your Password");
    const toggleButton = screen.getAllByRole("button", { name: /Show password/i })[0];

    fireEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "text");

    fireEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "password");
  });
});
