import NextAuth, { NextAuthOptions } from "next-auth";
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
        const loginUrl = `${env("NEXT_PUBLIC_BASE_URL")}UserAccount/login`;
        const res = await fetch(loginUrl, {
          method: "POST",
          body: JSON.stringify(credentials),
          headers: { "Content-Type": "application/json" },
        });

        if (res.status === 200) {
          const jsonResponse = await res.json();
          if (res.ok) {
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
    signIn: "/login",
    signOut: "/login",
  },

  callbacks: {
    async session({ session, token }: any) {
      if (token) {
        session.user.token = token.accessToken;
        session.user.firstName = token.firstName;
        session.user.lastName = token.lastName;
        session.user.email = token.email;
        session.user.id = token.id;
      }
      return session;
    },
    async jwt({ token, user }: { token: JWT; account?: any; user: any }) {
      console.log("From JWT: ", user);
      if (user) {
        token.accessToken = user.token;
        token.id = user.userAccount.id;
        token.firstName = user.userAccount.firstName;
        token.lastName = user.userAccount.lastName;
        token.email = user.userAccount.email;
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
