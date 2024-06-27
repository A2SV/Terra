import React from "react";
import { fireEvent, render, screen } from "@testing-library/react";
import ResetInputEmail from "@/components/ResetInputEmail";

describe("ResetInputEmail", () => {
  it("should display the correct text to the user", () => {
    render(<ResetInputEmail onSubmit={() => {}} />);
    expect(
      screen.getByText(
        /Enter your email address, you will receive a link in your email to create a new password/
      )
    ).toBeInTheDocument();
  });

  it("should allow entering an email", () => {
    render(<ResetInputEmail onSubmit={() => {}} />);
    const input: HTMLInputElement = screen.getByPlaceholderText("Email Address");
    fireEvent.change(input, { target: { value: "user@example.com" } });
    expect(input.value).toBe("user@example.com");
  });

  it("should submit the form with the email", () => {
    const handleSubmit = jest.fn();
    render(<ResetInputEmail onSubmit={handleSubmit} />);
    const input: HTMLInputElement = screen.getByPlaceholderText("Email Address");
    fireEvent.change(input, { target: { value: "user@example.com" } });
    const button = screen.getByRole("button", { name: "Continue" });
    fireEvent.click(button);
    expect(handleSubmit).toHaveBeenCalled();
  });
});
