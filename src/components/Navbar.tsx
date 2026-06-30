import { useState, useEffect } from 'react';
import { Menu, X, Triangle } from 'lucide-react';

const Navbar = () => {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: 'Home', active: true },
    { name: 'About', active: false },
    { name: 'Course', active: false },
    { name: 'Contact', active: false },
  ];

  return (
    <nav 
      className={`fixed top-0 left-0 right-0 z-50 h-[80px] transition-all duration-300 flex items-center ${
        scrolled ? 'glass-nav text-white' : 'bg-transparent text-white'
      }`}
    >
      <div className="max-w-[1280px] mx-auto px-6 w-full flex justify-between items-center">
        
        {/* Logo */}
        <div className="flex items-center gap-3 cursor-pointer">
          <div className="flex flex-col gap-[2px]">
             <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2 2L20 8L8 11L22 17L10 20L14 24" stroke="#ff5a1f" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"/>
             </svg>
          </div>
          <div className="flex flex-col">
            <span className="font-bold text-3xl leading-none tracking-[0.2em] text-white">VIZ</span>
            <span className="text-[9px] tracking-[0.4em] text-viz-orange font-semibold flex items-center justify-center gap-1 mt-1">
              <span className="w-2 h-[1px] bg-viz-orange"></span>
              ACADEMY
              <span className="w-2 h-[1px] bg-viz-orange"></span>
            </span>
          </div>
        </div>

        {/* Desktop Nav */}
        <div className="hidden md:flex items-center gap-8">
          {navLinks.map((link) => (
            <a 
              key={link.name} 
              href={`#${link.name.toLowerCase()}`}
              className={`text-sm font-medium transition-colors hover:text-viz-orange relative group ${
                link.active ? 'text-white' : 'text-gray-300'
              }`}
            >
              {link.name}
              {link.active && (
                <span className="absolute -bottom-2 left-0 w-full h-[2px] bg-viz-orange rounded-full"></span>
              )}
            </a>
          ))}
        </div>

        {/* CTA */}
        <div className="hidden md:block">
          <button className="bg-viz-orange text-white px-6 py-2.5 rounded-xl font-semibold text-sm transition-all duration-300 hover:scale-[1.03] hover:box-glow">
            Get Started
          </button>
        </div>

        {/* Mobile Toggle */}
        <div className="md:hidden">
          <button onClick={() => setMobileMenuOpen(!mobileMenuOpen)} className="text-white">
            {mobileMenuOpen ? <X /> : <Menu />}
          </button>
        </div>
      </div>

      {/* Mobile Menu */}
      {mobileMenuOpen && (
        <div className="absolute top-[80px] left-0 right-0 bg-viz-black border-t border-white/10 p-6 flex flex-col gap-4 md:hidden">
          {navLinks.map((link) => (
            <a 
              key={link.name} 
              href={`#${link.name.toLowerCase()}`}
              className="text-white font-medium text-lg border-b border-white/10 pb-2"
              onClick={() => setMobileMenuOpen(false)}
            >
              {link.name}
            </a>
          ))}
          <button className="bg-viz-orange text-white px-6 py-3 rounded-xl font-semibold mt-4">
            Get Started
          </button>
        </div>
      )}
    </nav>
  );
};

export default Navbar;
