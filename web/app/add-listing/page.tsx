import Footer from "@/components/General/Footer";
import Navbar from "@/components/General/Navbar";
import Header from "@/components/AddListing/Header";
import GeneralInfo from "@/components/AddListing/GeneralInfo";
import SubmitButton from "@/components/AddListing/SubmitButton";

const Page = () => {
  return (
    <>
      <div>
        <Navbar />
        <Header />
        <GeneralInfo />
        <SubmitButton />
        <Footer />
      </div>
    </>
  );
};

export default Page;
