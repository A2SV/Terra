// SignUpCard.test.tsx
import React from "react";
import { render, screen, fireEvent, waitFor } from "@testing-library/react";
import SignUpCard from "@/components/Common/Auth/SignupCard";
import { signIn } from "next-auth/react";
import axios from "axios";
import { env } from "next-runtime-env";

// Mocking next-auth and axios
jest.mock("next-auth/react", () => ({
  signIn: jest.fn(),
}));

jest.mock("axios");

jest.mock("next-runtime-env", () => ({
  env: jest.fn(),
}));

describe("SignUpCard", () => {
  beforeEach(() => {
    (env as jest.Mock).mockReturnValue("http://localhost:3000/");
  });

  it("renders the SignUpCard component", () => {
    render(<SignUpCard />);
    expect(
      screen.getByText("Enter your details and join the Terra family today")
    ).toBeInTheDocument();
  });

  it("displays an error message for invalid email", () => {
    render(<SignUpCard />);
    fireEvent.change(screen.getByPlaceholderText("Enter Your Email Address"), {
      target: { value: "invalid-email" },
    });
    fireEvent.blur(screen.getByPlaceholderText("Enter Your Email Address"));

    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
  });

  it("displays an error message for mismatched passwords", async () => {
    render(<SignUpCard />);
    fireEvent.change(screen.getByPlaceholderText("Enter Your Password"), {
      target: { value: "Password123!" },
    });
    fireEvent.change(screen.getByPlaceholderText("Renter Your Password"), {
      target: { value: "Password456!" },
    });

    fireEvent.submit(screen.getByRole("button", { name: /Login/i }));

    await waitFor(() => {
      expect(screen.getByText("Passwords do not match")).toBeInTheDocument();
    });
  });

  it("submits the form successfully", async () => {
    (axios.post as jest.Mock).mockResolvedValueOnce({
      data: { message: "User registered successfully" },
    });

    render(<SignUpCard />);

    fireEvent.change(screen.getByPlaceholderText("Enter Your First Name"), {
      target: { value: "John" },
    });
    fireEvent.change(screen.getByPlaceholderText("Enter Your Last Name"), {
      target: { value: "Doe" },
    });
    fireEvent.change(screen.getByPlaceholderText("Enter Your Email Address"), {
      target: { value: "john.doe@example.com" },
    });
    fireEvent.change(screen.getByPlaceholderText("Enter Your Password"), {
      target: { value: "Password123!" },
    });
    fireEvent.change(screen.getByPlaceholderText("Renter Your Password"), {
      target: { value: "Password123!" },
    });

    fireEvent.submit(screen.getByRole("button", { name: /Login/i }));

    await waitFor(() => {
      expect(screen.getByText("User registered successfully")).toBeInTheDocument();
    });
  });

  it("handles Google sign-in button click", () => {
    render(<SignUpCard />);

    fireEvent.click(screen.getByText("Continue with Google"));

    expect(signIn).toHaveBeenCalledWith("google");
  });
});
