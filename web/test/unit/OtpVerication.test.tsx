import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import OtpVerification from "@/components/Authentication/OtpVerification";

describe("Header", () => {
  it("renders the submit button", () => {
    render(<OtpVerification />);
    const submitButton = screen.getByRole("button", { name: "Submit" });
    expect(submitButton).toBeInTheDocument();
  });

  it("renders OTP Verification ", () => {
    render(<OtpVerification />);
    expect(screen.getByText("OTP Verification")).toBeInTheDocument();
  });

  it("renders exactly 2 images", () => {
    render(<OtpVerification />);
    const images = screen.getAllByRole("img");
    expect(images.length).toBe(2);
  });
});
