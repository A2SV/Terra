import React from "react";
import { render, screen } from "@testing-library/react";
import Review from "@/components/Listing/Review";

jest.mock("@/components/Review/ReviewForm", () => {
  const MockReviewForm = () => <div>ReviewForm Mock</div>;
  MockReviewForm.displayName = "MockReviewForm";
  return MockReviewForm;
});

jest.mock("@/components/Review/ReviewStars", () => {
  const MockReviewStars = ({ rating }: { rating: number }) => (
    <div>ReviewStars Mock - Rating: {rating}</div>
  );
  MockReviewStars.displayName = "MockReviewStars";
  return MockReviewStars;
});

jest.mock("@/components/Review/ReviewCard", () => {
  const MockReviewCard = ({
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
    <div>
      <div>{heading}</div>
      <div>{description}</div>
      <div>{star}</div>
      <div>{upvote}</div>
      <div>{downvote}</div>
      <div>{time}</div>
    </div>
  );
  MockReviewCard.displayName = "MockReviewCard";
  return MockReviewCard;
});

describe("Review Component", () => {
  test("renders the ReviewForm component", () => {
    render(<Review />);
    expect(screen.getByText("ReviewForm Mock")).toBeInTheDocument();
  });

  test("renders the ReviewStars component with correct rating", () => {
    render(<Review />);
    expect(screen.getByText("ReviewStars Mock - Rating: 4")).toBeInTheDocument();
  });

  test("renders the correct number of reviews", () => {
    render(<Review />);
    expect(screen.getByText("6 Reviews")).toBeInTheDocument();
  });

  test("renders the correct rating average", () => {
    render(<Review />);
    expect(screen.getByText("(4.17 out of 5)")).toBeInTheDocument();
  });

  test("renders the ReviewCard components with correct props", () => {
    render(<Review />);
    expect(screen.getByText("Top Properties for sale in Sialkot")).toBeInTheDocument();
    expect(screen.getByText("Konda")).toBeInTheDocument();
    expect(screen.getByText("Get")).toBeInTheDocument();
    expect(screen.getByText("Rashmi")).toBeInTheDocument();
    expect(screen.getByText("Sra Jkawgb")).toBeInTheDocument();
  });
});
