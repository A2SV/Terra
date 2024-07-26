import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { getToken } from "next-auth/jwt";
import { env } from "next-runtime-env";
import createMiddleware from "next-intl/middleware";

export const middleware = async (req: NextRequest): Promise<NextResponse> => {
  const { pathname } = req.nextUrl;
  const session = await getToken({ req, secret: env("NEXTAUTH_SECRET") });
  const url = req.nextUrl.clone();

  if (pathname === "/admin") {
    url.pathname = "/admin/dashboard";
    return NextResponse.redirect(url);
  }

  if (pathname.startsWith("/add-listing")) {
    if (session === null) {
      url.pathname = "/auth";
      return NextResponse.redirect(url);
    }
  }

  return NextResponse.next();
};

export const config = {
  matcher: ["/admin/:path*", "/auth/:path*", "/(am|en)/:path*", "/add-listing"],
};

export default createMiddleware({
  locales: ["en", "am"],
  defaultLocale: "en",
});
