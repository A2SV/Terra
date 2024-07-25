import Footer from "@/components/General/Footer";
import Navbar from "@/components/General/Navbar";
import Header from "@/components/AddListing/Header";
import GeneralInfo from "@/components/AddListing/GeneralInfo";

const Page = () => {
  return (
    <>
      <div>
        <Navbar />
        <Header />
        <GeneralInfo />
        <Footer />
      </div>
    </>
  );
};

export default Page;
