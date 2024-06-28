import SignupCard from "@/components/SignupCard";

import React from "react";
import { render, screen } from "@testing-library/react";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";
import { useRouter } from "next/navigation";
import { env } from "next-runtime-env";

// Mock environment variable
jest.mock("next-runtime-env", () => ({
  env: jest.fn(() => env("NEXT_PUBLIC_BASE_URL") + "UserAccount/register"),
}));

// Mock axios
const mock = new MockAdapter(axios);

// Mock useRouter
jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));

const push = jest.fn();
(useRouter as jest.Mock).mockReturnValue({ push });

// Mock environment variable
jest.mock("next-runtime-env", () => ({
  env: jest.fn(() => "http://blogapp.tryasp.net/api/"),
}));

describe("LoginCard", () => {
  beforeEach(() => {
    mock.reset();
    push.mockClear();
  });

  it("renders the login form", () => {
    render(<SignupCard />);
    expect(screen.getByPlaceholderText(/Email address/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/Password/i)).toBeInTheDocument();
    expect(screen.getByRole("button", { name: /Sign up/i })).toBeInTheDocument();
  });
});
