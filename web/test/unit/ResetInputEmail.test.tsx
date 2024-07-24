import React from "react";
import { render, screen, fireEvent, waitFor } from "@testing-library/react";
import "@testing-library/jest-dom";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";
import { useRouter } from "next/navigation";
import ResetInputEmail from "../../components/Authentication/ResetInputEmail";
import { env } from "next-runtime-env";

jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));

const mockRouter = useRouter as jest.Mock;

const mockAxios = new MockAdapter(axios);

describe("ResetInputEmail Component", () => {
  beforeEach(() => {
    mockRouter.mockReturnValue({
      push: jest.fn(),
    });
  });

  afterEach(() => {
    mockAxios.reset();
  });

  it("renders the component correctly", () => {
    render(<ResetInputEmail />);

    expect(screen.getByText(/Enter your email address/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/Email Address/i)).toBeInTheDocument();
    expect(screen.getByText(/Continue/i)).toBeInTheDocument();
  });

  it("handles form submission successfully", async () => {
    const email = "test@example.com";
    const token = "mockToken";
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");

    mockAxios.onPost(`${baseUrl}Auth/forgot-password`).reply(200, { token });

    render(<ResetInputEmail />);

    fireEvent.change(screen.getByPlaceholderText(/Email Address/i), {
      target: { value: email },
    });

    fireEvent.click(screen.getByText(/Continue/i));

    await waitFor(() => {
      expect(mockRouter().push).toHaveBeenCalledWith(`/reset-password/${token}/${email}`);
    });
  });

  it("displays an error message on failed submission", async () => {
    const email = "test@example.com";
    const errorMessage = "User not found";
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");

    mockAxios.onPost(`${baseUrl}Auth/forgot-password`).reply(400, { message: errorMessage });

    render(<ResetInputEmail />);

    fireEvent.change(screen.getByPlaceholderText(/Email Address/i), {
      target: { value: email },
    });

    fireEvent.click(screen.getByText(/Continue/i));

    await waitFor(() => {
      expect(screen.getByText(errorMessage)).toBeInTheDocument();
    });
  });

  it("displays a generic error message when no specific message is available", async () => {
    const email = "test@example.com";
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");

    mockAxios.onPost(`${baseUrl}Auth/forgot-password`).reply(500);

    render(<ResetInputEmail />);

    fireEvent.change(screen.getByPlaceholderText(/Email Address/i), {
      target: { value: email },
    });

    fireEvent.click(screen.getByText(/Continue/i));

    await waitFor(() => {
      expect(screen.getByText("An error occurred. Please try again.")).toBeInTheDocument();
    });
  });
});
