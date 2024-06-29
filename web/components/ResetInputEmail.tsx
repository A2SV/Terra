"use client";

import React, { useState } from "react";

type ResetEmailProps = {
  onSubmit: (email: string) => void;
};

const ResetInputEmail: React.FC<ResetEmailProps> = ({ onSubmit }) => {
  const [email, setEmail] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSubmit(email);
  };

  return (
    <div className="flex-col w-[26rem] p-0">
      <div className="flex justify-center items-center p-3 px-2 w-full text-sm font-sans">
        Enter your email address, you will receive a link in your email to create a new password
      </div>

      <div className="p-3">
        <form onSubmit={handleSubmit}>
          <span className="text-sm font-sans">Email Address</span>
          <div className="pt-3">
            <label>
              <input
                type="email"
                value={email}
                placeholder="Email Address"
                onChange={(e) => setEmail(e.target.value)}
                required
                className="font-sans rounded-3xl w-full h-12 !border !border-slate-300 border-t-transparent px-3 py-2 transition-all focus:border-1 focus:!border-gray-700"
              />
            </label>
          </div>
          <div className="pt-9 text-sm font-sans">
            <button
              type="submit"
              className="rounded-3xl bg-terrablue w-36 h-12 text-white hover:bg-blue-800 font-sans"
            >
              Continue
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ResetInputEmail;
