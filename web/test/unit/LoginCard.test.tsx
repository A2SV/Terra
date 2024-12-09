import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import { useRouter } from "next/navigation";
import { signIn } from "next-auth/react";
import LoginCard from "@/components/Authentication/LoginCard";

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
    const emailInput = screen.getByPlaceholderText("john@gmail.com");
    fireEvent.change(emailInput, { target: { value: "invalid-email" } });
    fireEvent.blur(emailInput);
    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
  });

  test("handles Google sign-in", () => {
    render(<LoginCard />);
    fireEvent.click(screen.getByText("Continue with Google"));
    expect(signIn).toHaveBeenCalledWith("google");
  });
});
