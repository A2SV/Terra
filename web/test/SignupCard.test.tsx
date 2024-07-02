import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import SignupCard from "../components/SignupCard";
import { useRouter } from "next/navigation";
import { env } from "next-runtime-env";
import { signIn } from "next-auth/react";

// Mocking the modules
jest.mock("axios");
jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));
jest.mock("next-runtime-env", () => ({
  env: jest.fn(),
}));
jest.mock("next-auth/react", () => ({
  signIn: jest.fn(),
}));

describe("SignUpCard", () => {
  let push: jest.Mock;

  beforeEach(() => {
    push = jest.fn();
    (useRouter as jest.Mock).mockReturnValue({ push });
    (env as jest.Mock).mockReturnValue("http://mockapi.com/");
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  test("renders the component", () => {
    render(<SignupCard />);
    expect(
      screen.getByText("Enter your details and join the Terra family today")
    ).toBeInTheDocument();
  });

  test("validates email format", () => {
    render(<SignupCard />);
    const emailInput = screen.getByPlaceholderText("Enter your Email Address");
    fireEvent.change(emailInput, { target: { value: "invalid-email" } });
    fireEvent.blur(emailInput);
    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
  });

  test("handles Google sign-in", () => {
    render(<SignupCard />);
    fireEvent.click(screen.getByText("Continue with Google"));
    expect(signIn).toHaveBeenCalledWith("google");
  });
});
