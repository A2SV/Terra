"use client";

import React, { useEffect } from "react";
import ResetNew from "@/components/Authentication/ResetNew";
import ResetBackground from "@/components/Authentication/ResetBackground";
import { useSearchParams, useRouter } from 'next/navigation';

const Reset: React.FC = () => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const token = searchParams.get('token') || '';

  useEffect(() => {
    if (!token) {
      router.push('/404');
    }
  }, [token, router]);

  const CardWithProps = () => <ResetNew token={token} />;

  return (
    <div>
      <ResetBackground description="Reset password" Card={CardWithProps} />
    </div>
  );
};

export default Reset;