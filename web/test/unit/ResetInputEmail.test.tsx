import React from "react";
import { fireEvent, render, screen } from "@testing-library/react";
import ResetInputEmail from "@/components/Authentication/ResetInputEmail";

describe("ResetInputEmail", () => {
  it("should display the correct text to the user", () => {
    render(<ResetInputEmail />);
    expect(
      screen.getByText(
        /Enter your email address, you will receive a link in your email to create a new password/
      )
    ).toBeInTheDocument();
  });

  it("should allow entering an email", () => {
    render(<ResetInputEmail />);
    const input: HTMLInputElement = screen.getByPlaceholderText("Email Address");
    fireEvent.change(input, { target: { value: "user@example.com" } });
    expect(input.value).toBe("user@example.com");
  });
});
