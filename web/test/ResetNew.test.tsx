import React from "react";
import { render, fireEvent, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ResetNew from "../components/ResetNew"; // Adjust the import path as necessary

describe("ResetNew Component", () => {
  test("renders without crashing", () => {
    render(<ResetNew />);
    expect(screen.getByPlaceholderText("Enter your password")).toBeInTheDocument();
    expect(screen.getByPlaceholderText("Re-enter your password")).toBeInTheDocument();
  });

  test("initially, both success and error modals should not be visible", () => {
    render(<ResetNew />);
    expect(
      screen.queryByText("Your password has been successfully reset.")
    ).not.toBeInTheDocument();
    expect(screen.queryByText("Passwords do not match. Please try again.")).not.toBeInTheDocument();
  });

  test("shows error modal when passwords do not match", () => {
    render(<ResetNew />);
    fireEvent.change(screen.getByPlaceholderText("Enter your password"), {
      target: { value: "password123" },
    });
    fireEvent.change(screen.getByPlaceholderText("Re-enter your password"), {
      target: { value: "differentPassword" },
    });
    fireEvent.click(screen.getByText("Set new password"));
    expect(screen.getByText("Passwords do not match. Please try again.")).toBeInTheDocument();
  });

  test("shows success modal when passwords match", () => {
    render(<ResetNew />);
    fireEvent.change(screen.getByPlaceholderText("Enter your password"), {
      target: { value: "matchingPassword" },
    });
    fireEvent.change(screen.getByPlaceholderText("Re-enter your password"), {
      target: { value: "matchingPassword" },
    });
    fireEvent.click(screen.getByText("Set new password"));
    expect(screen.getByText("Your password has been successfully reset.")).toBeInTheDocument();
  });

  test("password visibility toggles for both fields", () => {
    render(<ResetNew />);
    // Initially, password fields should have type "password"
    expect(screen.getByPlaceholderText("Enter your password")).toHaveAttribute("type", "password");
    expect(screen.getByPlaceholderText("Re-enter your password")).toHaveAttribute(
      "type",
      "password"
    );

    // Click the toggle visibility button for both fields
    const toggleButtons = screen.getAllByRole("button");
    fireEvent.click(toggleButtons[0]); // Assuming the first two buttons are for toggling visibility
    fireEvent.click(toggleButtons[1]);

    // Now, password fields should have type "text"
    expect(screen.getByPlaceholderText("Enter your password")).toHaveAttribute("type", "text");
    expect(screen.getByPlaceholderText("Re-enter your password")).toHaveAttribute("type", "text");
  });
});
