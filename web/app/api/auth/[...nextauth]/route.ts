import NextAuth, { NextAuthOptions, Session } from "next-auth";
import GoogleProvider from "next-auth/providers/google";
import CredentialsProvider from "next-auth/providers/credentials";
import { env } from "next-runtime-env";
import { JWT } from "next-auth/jwt";

const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        email: { label: "Email", type: "email", placeholder: "Email address" },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials) {
        const loginUrl = `${env("NEXT_PUBLIC_BASE_URL")}auth/login`;
        const res = await fetch(loginUrl, {
          method: "POST",
          body: JSON.stringify(credentials),
          headers: { "Content-Type": "application/json" },
        });

        if (res.status === 200) {
          const jsonResponse = await res.json();
          if (jsonResponse.isSuccess) {
            return jsonResponse;
          } else {
            throw new Error(jsonResponse.message);
          }
        }

        throw new Error(res.statusText);
      },
    }),
    GoogleProvider({
      clientId: env("NEXT_PUBLIC_GOOGLE_CLIENT_ID")!,
      clientSecret: env("NEXT_PUBLIC_GOOGLE_CLIENT_SECRET")!,
    }),
  ],

  pages: {
    signIn: "/",
    signOut: "/",
  },

  callbacks: {
    async session({ session, token }: { session: Session; token: JWT }) {
      if (token) {
        session.user = session.user || { token: "", id: "" };
        session.user.token = token.accessToken as string;
        session.user.firstName = token.firstName as string;
        session.user.lastName = token.lastName as string;
        session.user.email = token.email as string;
        session.user.id = token.id as string;
      }
      return session;
    },
    async jwt({ token, user }: { token: JWT; account?: any; user: any }) {
      if (user) {
        token.accessToken = user.token;
        token.id = user.user.id;
        token.firstName = user.user.firstName;
        token.lastName = user.user.lastName;
        token.email = user.user.email;
        token.profilePicture = user.user.profilePicture;
      }
      return token;
    },
  },
  jwt: {
    maxAge: 30 * 24 * 60 * 60,
  },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
