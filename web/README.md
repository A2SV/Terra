# Terra

This is the frontend repository for Terra.

## Tools Used

- **Next.js**: A React framework for server-side rendering and static site generation.
- **React**: A JavaScript library for building user interfaces.
- **TypeScript**: A typed superset of JavaScript that compiles to plain JavaScript.
- **Tailwind CSS**: A utility-first CSS framework for rapid UI development.
- **Redux Toolkit**: A toolset for efficient Redux development.
- **Jest**: A delightful JavaScript testing framework with a focus on simplicity.
- **ESLint**: A tool for identifying and reporting on patterns found in ECMAScript/JavaScript code.
- **Prettier**: An opinionated code formatter.
- **Husky**: Git hooks made easy.
- **Axios**: A promise-based HTTP client for the browser and Node.js.

## Setup

Follow these steps to set up the project locally:

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-repo/terra.git
    cd terra
    ```

2. **Install dependencies:**

    ```sh
    npm install
    ```

3. **Set up environment variables:**

    Create a [.env](http://_vscodecontentref_/1) file in the root directory and add the following variables:

    ```plaintext
    NEXTAUTH_URL=http://localhost:3000
    NEXT_PUBLIC_GOOGLE_CLIENT_ID=your-google-client-id
    NEXT_PUBLIC_GOOGLE_CLIENT_SECRET=your-google-client-secret
    NEXT_PUBLIC_BASE_URL=https://terra-wb9c.onrender.com/api/
    NEXT_PUBLIC_GOOGLE_MAP_API_KEY=your-google-map-api-key
    NEXTAUTH_SECRET=your-next-auth-secret
    NEXTAUTH_SALT=your-next-auth-salt
    ```

4. **Run the development server:**

    ```sh
    npm run dev
    ```

5. **Build the project:**

    ```sh
    npm run build
    ```

6. **Start the production server:**

    ```sh
    npm start
    ```

## Running Tests

To run tests, use the following command:

```sh
npm run test
```

To check test coverage, use the following command:

```sh
npm run coverage
```