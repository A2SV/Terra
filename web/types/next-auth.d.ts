// next-auth.d.ts
import "next-auth";

declare module "next-auth" {
  /**
   * Extends the built-in session.user object
   * with additional user fields.
   */
  interface User {
    firstName?: string | null;
    lastName?: string | null;
    email?: string | null;
    token: string | null;
  }

  /**
   * Extends the built-in session object
   * with additional session fields.
   */
  interface Session {
    user?: User;
  }
}
