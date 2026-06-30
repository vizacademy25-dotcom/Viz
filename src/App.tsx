import Navbar from './components/Navbar';
import Hero from './components/Hero';
import About from './components/About';
import Courses from './components/Courses';
import Contact from './components/Contact';
import Footer from './components/Footer';

function App() {
  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-grow">
        <Hero />
        <About />
        <Courses />
        <div className="max-w-[1280px] mx-auto px-6 w-full -mt-16 mb-24 relative z-20">
          <Contact />
        </div>
      </main>
      <Footer />
    </div>
  );
}

export default App;
