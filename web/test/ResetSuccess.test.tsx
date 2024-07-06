import React from "react";
import { fireEvent, render, screen } from "@testing-library/react";
import ResetSuccess from "@/components/Authentication/ResetSuccess";

describe("ResetSuccess", () => {
  it("should render success message correctly", () => {
    render(<ResetSuccess onSubmit={() => {}} />);
    expect(screen.getByText(/Your password has been reset! successfully/)).toBeInTheDocument();
  });

  it('should call onSubmit when "Back to login" button is clicked', () => {
    const mockOnSubmit = jest.fn();
    render(<ResetSuccess onSubmit={mockOnSubmit} />);
    const button = screen.getByRole("button", { name: "Back to login" });
    fireEvent.click(button);
    expect(mockOnSubmit).toHaveBeenCalled();
  });
});
