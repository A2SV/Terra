import React from "react";
import { render, screen } from "@testing-library/react";
import Review from "@/components/Listing/Review";

jest.mock("@/components/Review/ReviewForm", () => {
  const ReviewForm = () => <div data-testid="review-form">ReviewForm</div>;
  ReviewForm.displayName = "ReviewForm";
  return ReviewForm;
});

jest.mock("@/components/Review/ReviewCard", () => {
  const ReviewCard = ({
    heading,
    description,
    star,
    upvote,
    downvote,
    time,
  }: {
    heading: string;
    description: string;
    star: number;
    upvote: number;
    downvote: number;
    time: string;
  }) => (
    <div data-testid="review-card">
      <p>{heading}</p>
      <p>{description}</p>
      <p>{star}</p>
      <p>{upvote}</p>
      <p>{downvote}</p>
      <p>{time}</p>
    </div>
  );
  ReviewCard.displayName = "ReviewCard";
  return ReviewCard;
});

jest.mock("@/components/Review/ReviewStars", () => {
  const ReviewStars = ({ rating }: { rating: number }) => (
    <div data-testid="review-stars">{rating}</div>
  );
  ReviewStars.displayName = "ReviewStars";
  return ReviewStars;
});

jest.mock("react-icons/md", () => {
  const MdUnfoldMore = () => <div data-testid="icon-unfold-more">Icon</div>;
  MdUnfoldMore.displayName = "MdUnfoldMore";
  return { MdUnfoldMore };
});

describe("Review component", () => {
  it("should render the ReviewForm component", () => {
    render(<Review />);
    expect(screen.getByTestId("review-form")).toBeInTheDocument();
  });

  it("should display the number of reviews and average rating", () => {
    render(<Review />);
    expect(screen.getByText("6 Reviews")).toBeInTheDocument();
    expect(screen.getByText("(4.17 out of 5)")).toBeInTheDocument();
  });

  it("should render the ReviewStars component with correct rating", () => {
    render(<Review />);
    expect(screen.getByTestId("review-stars")).toHaveTextContent("4");
  });

  it("should render the sort by text and icon", () => {
    render(<Review />);
    expect(screen.getByText("Sort by:")).toBeInTheDocument();
    expect(screen.getByTestId("icon-unfold-more")).toBeInTheDocument();
  });

  it("should render the leave a review button", () => {
    render(<Review />);
    expect(screen.getByRole("button", { name: /leave a review/i })).toBeInTheDocument();
  });

  it("should render the ReviewCard components with correct props", () => {
    render(<Review />);
    expect(screen.getAllByTestId("review-card").length).toBe(2);
    expect(screen.getByText("Top Properties for sale in Sialkot")).toBeInTheDocument();
    expect(screen.getByText("Konda")).toBeInTheDocument();
  });
});
