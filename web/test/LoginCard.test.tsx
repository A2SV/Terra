import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import LoginCard from "../components/Common/Auth/LoginCard";
import { useRouter } from "next/navigation";
import { signIn } from "next-auth/react";

jest.mock("axios");
jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));
jest.mock("next-auth/react", () => ({
  signIn: jest.fn(),
}));

describe("LoginCard", () => {
  let push: jest.Mock;

  beforeEach(() => {
    push = jest.fn();
    (useRouter as jest.Mock).mockReturnValue({ push });
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  test("validates email format", () => {
    render(<LoginCard />);
    const emailInput = screen.getByPlaceholderText("Enter your Email Address");
    fireEvent.change(emailInput, { target: { value: "invalid-email" } });
    fireEvent.blur(emailInput);
    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
  });

  test("toggles password visibility", () => {
    render(<LoginCard />);
    const passwordInput = screen.getByPlaceholderText("Enter your Password");
    const toggleButton = screen.getByLabelText("Show password");

    expect(passwordInput).toHaveAttribute("type", "password");

    fireEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "text");

    setTimeout(() => {
      expect(passwordInput).toHaveAttribute("type", "password");
    }, 700);
  });

  test("handles Google sign-in", () => {
    render(<LoginCard />);
    fireEvent.click(screen.getByText("Continue with Google"));
    expect(signIn).toHaveBeenCalledWith("google");
  });
});
