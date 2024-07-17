import React from "react";
import { render, fireEvent, screen, waitFor } from "@testing-library/react";
import "@testing-library/jest-dom";
import axios from "axios";
import { useRouter } from "next/navigation";
import ResetInputEmail from "@/components/Authentication/ResetInputEmail";

jest.mock("axios");
jest.mock("next-runtime-env", () => ({
  env: jest.fn().mockReturnValue("http://mockapi.com/"),
}));
jest.mock("next/navigation", () => ({
  useRouter: jest.fn().mockReturnValue({
    push: jest.fn(),
  }),
}));

beforeAll(() => {
  window.alert = jest.fn();
});

describe("ResetInputEmail", () => {
  test("submits email and shows success message on successful submission", async () => {
    jest.spyOn(axios, "post").mockResolvedValue({ status: 200 });
    const push = jest.fn();
    (useRouter as jest.Mock).mockReturnValue({ push });

    render(<ResetInputEmail />);

    fireEvent.change(screen.getByPlaceholderText("Email Address"), {
      target: { value: "test@example.com" },
    });
    fireEvent.click(screen.getByRole("button", { name: /continue/i }));

    await waitFor(() =>
      expect(axios.post).toHaveBeenCalledWith("http://mockapi.com/Auth/forgot-password", {
        email: "test@example.com",
      })
    );
  });

  test("displays error message on failed submission", async () => {
    jest.spyOn(axios, "post").mockRejectedValue({
      response: {
        data: {
          data: "Error message",
        },
      },
    });

    render(<ResetInputEmail />);

    fireEvent.change(screen.getByPlaceholderText("Email Address"), {
      target: { value: "test@example.com" },
    });
    fireEvent.click(screen.getByRole("button", { name: /continue/i }));

    const errorMessage = await screen.findByText("Error message");
    expect(errorMessage).toBeInTheDocument();
  });
});
