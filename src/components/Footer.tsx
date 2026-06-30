import { Instagram, Linkedin, Youtube, Triangle } from 'lucide-react';

const Footer = () => {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-viz-black pt-32 pb-8 border-t border-white/5 mt-auto relative z-10">
      <div className="max-w-[1280px] mx-auto px-6 w-full">
        
        <div className="flex flex-col md:flex-row justify-between items-center gap-8 mb-12">
          
          {/* Logo */}
          <div className="flex items-center gap-2">
            <Triangle className="text-viz-orange w-8 h-8 fill-viz-orange rotate-180" />
            <div className="flex flex-col">
              <span className="font-bold text-2xl leading-none tracking-widest text-white">VIZ</span>
              <span className="text-[10px] tracking-[0.3em] text-viz-orange font-semibold">ACADEMY</span>
            </div>
          </div>

          {/* Links */}
          <div className="flex items-center gap-8">
            <a href="#home" className="text-gray-400 hover:text-white transition-colors text-sm font-medium">Home</a>
            <a href="#about" className="text-gray-400 hover:text-white transition-colors text-sm font-medium">About</a>
            <a href="#course" className="text-gray-400 hover:text-white transition-colors text-sm font-medium">Course</a>
            <a href="#contact" className="text-gray-400 hover:text-white transition-colors text-sm font-medium">Contact</a>
          </div>

          {/* Socials */}
          <div className="flex items-center gap-6">
            <a href="#" className="text-gray-400 hover:text-viz-orange transition-colors">
              <Instagram className="w-5 h-5" />
            </a>
            <a href="#" className="text-gray-400 hover:text-viz-orange transition-colors">
              <Linkedin className="w-5 h-5" />
            </a>
            <a href="#" className="text-gray-400 hover:text-viz-orange transition-colors">
              <Youtube className="w-5 h-5" />
            </a>
          </div>

        </div>

        {/* Bottom Text */}
        <div className="text-center border-t border-white/10 pt-8">
          <p className="text-gray-500 text-xs">
            © {currentYear} Viz Academy. All rights reserved.
          </p>
        </div>

      </div>
    </footer>
  );
};

export default Footer;
