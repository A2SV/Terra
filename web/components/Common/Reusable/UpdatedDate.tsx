import React from "react";

type UpdatedDateProps = {
  updatedAt: string;
};

const UpdatedDate: React.FC<UpdatedDateProps> = ({ updatedAt }) => {
  const formatDate = (isoDate: string): string => {
    const date = new Date(isoDate);
    const options: Intl.DateTimeFormatOptions = {
      month: "long",
      day: "numeric",
      year: "numeric",
      hour: "numeric",
      minute: "numeric",
    };
    return date.toLocaleDateString("en-US", options);
  };

  const formattedDate = formatDate(updatedAt);

  return <p>Updated on {formattedDate}</p>;
};

export default UpdatedDate;
