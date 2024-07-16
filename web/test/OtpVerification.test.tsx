import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import OtpVerification from "@/components/Authentication/OtpVerification";
import axios from "axios";
import { useRouter } from "next/navigation";

jest.mock("axios");
jest.mock("next/navigation", () => ({
  useRouter: jest.fn(),
}));

describe("OtpVerification", () => {
  let push: jest.Mock;

  beforeEach(() => {
    push = jest.fn();
    (useRouter as jest.Mock).mockReturnValue({ push });
    (axios.post as jest.Mock).mockResolvedValue({ status: 200 });
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  test("submits OTP successfully and navigates to reset page", async () => {
    render(<OtpVerification email="test@example.com" />);
    const submitButton = screen.getByText("Submit");
    fireEvent.click(submitButton);

    // Assuming the email used for the test is "test@example.com"
    await expect(axios.post).toHaveBeenCalledWith(expect.any(String), {
      otp: expect.any(String),
      email: "test@example.com",
    });
    expect(push).toHaveBeenCalledWith(`/reset/test@example.com`);
  });

  test("handles OTP resend", () => {
    render(<OtpVerification email="test@example.com" />);
    const resendLink = screen.getByText("Resend");
    fireEvent.click(resendLink);

    expect(axios.post).toHaveBeenCalledWith(expect.any(String), {
      email: "test@example.com",
    });
  });
});
