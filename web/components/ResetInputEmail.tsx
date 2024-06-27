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
    <div className="flex-col flex-nowrap w-[26rem] p-0">
      <div className="flex justify-center items-center p-3 pl-2 pr-2 w-full text-sm font-sans">
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
                className="font-sans rounded-3xl w-full h-12 !border !border-slate-300 border-t-transparent bg-transparent px-3 py-1.5 font-normal shadow-md outline outline-0 ring-4 ring-transparent transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 focus:border-2 focus:!border-gray-900 focus:border-t-transparent focus:outline-0 focus:ring-gray-500/10 disabled:border-0 disabled:bg-blue-gray-50"
              />
            </label>
          </div>
          <div className="pt-9 text-sm font-sans">
            <button
              type="submit"
              className="rounded-3xl bg-terrablue w-36 h-12 text-white dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800 hover:bg-blue-800 focus:ring-blue-300 font-sans"
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
