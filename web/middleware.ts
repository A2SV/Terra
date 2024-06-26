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

  if (pathname === "/auth") {
    url.pathname = "/auth/login";
    return NextResponse.redirect(url);
  }

  if (pathname.startsWith("/auth")) {
    if (session !== null) {
      url.pathname = "/admin/dashboard";
      return NextResponse.redirect(url);
    }
  }

  if (pathname.startsWith("/admin")) {
    if (session === null) {
      url.pathname = "/auth/login";
      return NextResponse.redirect(url);
    }
  }

  return NextResponse.next();
};

export const config = {
  matcher: ["/admin/:path*", "/auth/:path*", "/(am|en)/:path*"],
};

export default createMiddleware({
  locales: ["en", "am"],
  defaultLocale: "en",
});
