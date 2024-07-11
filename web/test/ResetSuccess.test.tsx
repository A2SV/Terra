import React from "react";
import { fireEvent, render, screen } from "@testing-library/react";
import ResetSuccess from "@/components/Authentication/ResetSuccess";

describe("ResetSuccess", () => {
  it("should render success message correctly", () => {
    render(<ResetSuccess />);
    expect(screen.getByText(/Your password has been reset! successfully/)).toBeInTheDocument();
  });

  it('should navigate to "/auth" when "Back to login" button is clicked', () => {
    render(<ResetSuccess />);
    const button = screen.getByRole("button", { name: "Back to login" });
    fireEvent.click(button);
  });
});
