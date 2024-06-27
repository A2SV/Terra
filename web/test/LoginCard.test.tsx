import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import '@testing-library/jest-dom';
import LoginCard from "@/components/LoginCard"; 

describe("LoginCard", () => {
  test("renders login card with email and password inputs", () => {
    render(<LoginCard />);
    
    expect(screen.getByPlaceholderText("Enter your Email Address")).toBeInTheDocument();
    expect(screen.getByPlaceholderText("Enter your Password")).toBeInTheDocument();
  });

  test("toggles password visibility", () => {
    render(<LoginCard />);
    
    const passwordInput = screen.getByPlaceholderText("Enter your Password");
    const toggleButton = screen.getByRole("button", { name: "Show password" });
    

    expect(passwordInput).toHaveAttribute("type", "password");
    

    fireEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "text");
 
    fireEvent.click(toggleButton);
    expect(passwordInput).toHaveAttribute("type", "password");
  });

  test("validates email input", () => {
    render(<LoginCard />);
    
    const emailInput = screen.getByPlaceholderText("Enter your Email Address");
    
    fireEvent.change(emailInput, { target: { value: "invalid-email" } });
    fireEvent.blur(emailInput);
    
    expect(screen.getByText("Invalid email address")).toBeInTheDocument();
    
    fireEvent.change(emailInput, { target: { value: "valid@example.com" } });
    fireEvent.blur(emailInput);
    
    expect(screen.queryByText("Invalid email address")).not.toBeInTheDocument();
  });

});
