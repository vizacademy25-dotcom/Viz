import { Play } from 'lucide-react';
import workspaceEditor from '../assets/workspace_editor.png';

const Hero = () => {
  return (
    <section className="min-h-screen bg-viz-black flex items-center pt-[80px] overflow-hidden relative">
      <div className="max-w-[1280px] mx-auto px-6 w-full grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        
        {/* Left Column */}
        <div className="text-white z-10 animate-fade-up">
          <p className="text-viz-orange font-bold text-sm tracking-widest uppercase mb-6">
            Learn. Create. Inspire.
          </p>
          <h1 className="text-[36px] md:text-[48px] lg:text-[72px] font-extrabold leading-[1.1] mb-8">
            MASTER CREATIVE SKILLS.<br />
            SHAPE <span className="text-viz-orange text-glow">YOUR FUTURE.</span>
          </h1>
          <p className="text-gray-300 text-lg md:text-xl max-w-lg mb-12 leading-relaxed">
            Industry-focused courses in Design, Video Editing, Motion Graphics and more. 
            Learn from experts and build real-world projects.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4">
            <a href="#courses" className="bg-viz-orange text-white px-8 py-4 rounded-xl font-semibold text-base transition-all duration-300 hover:scale-[1.03] hover:box-glow w-full sm:w-auto text-center inline-block">
              Explore Courses →
            </a>
            <button className="bg-transparent border border-white text-white px-8 py-4 rounded-xl font-semibold text-base transition-all duration-300 hover:bg-white/5 flex items-center justify-center gap-2 w-full sm:w-auto">
              <Play className="w-5 h-5" />
              Watch Intro
            </button>
          </div>
        </div>

        {/* Right Column */}
        <div className="relative z-10 animate-fade-up delay-200 lg:pl-10">
          {/* Abstract Triangle Background */}
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[150%] h-[150%] -z-10 flex items-center justify-center opacity-40">
             <svg viewBox="0 0 100 100" className="w-full h-full animate-[pulse_4s_ease-in-out_infinite]" fill="none" xmlns="http://www.w3.org/2000/svg">
                <polygon points="50,10 95,90 5,90" stroke="#ff5a1f" strokeWidth="0.5" strokeLinejoin="round" className="drop-shadow-[0_0_15px_rgba(255,90,31,0.8)]"/>
             </svg>
          </div>
          
          {/* Main Image Card */}
          <div className="relative rounded-xl overflow-hidden box-glow group">
            <img 
              src={workspaceEditor} 
              alt="Creative Workspace" 
              className="w-full h-auto object-cover transform transition-transform duration-700 group-hover:scale-105"
            />
            
            {/* Play Button Overlay */}
            <div className="absolute inset-0 bg-black/20 flex items-center justify-center">
              <button className="w-20 h-20 bg-white rounded-full flex items-center justify-center transition-transform duration-300 hover:scale-110 shadow-[0_0_30px_rgba(255,255,255,0.3)]">
                <Play className="w-8 h-8 text-viz-orange ml-1 fill-viz-orange" />
              </button>
            </div>

            {/* Floating Icons */}
            <div className="absolute top-8 -left-4 bg-[#0a0a1a] border border-[#2b2b5c] px-4 py-3 rounded-2xl shadow-[0_0_20px_rgba(43,43,92,0.5)] text-[#5c5cff] font-bold text-xl animate-[bounce_3s_infinite]">Pr</div>
            <div className="absolute bottom-16 -right-6 bg-[#0a1526] border border-[#23538f] px-4 py-3 rounded-2xl shadow-[0_0_20px_rgba(35,83,143,0.5)] text-[#3399ff] font-bold text-xl animate-[bounce_4s_infinite]">Ps</div>
            <div className="absolute bottom-8 -left-6 bg-[#1a051c] border border-[#5c1966] px-4 py-3 rounded-2xl shadow-[0_0_20px_rgba(92,25,102,0.5)] text-[#d455ff] font-bold text-xl animate-[bounce_3.5s_infinite]">Ae</div>
            <div className="absolute top-12 -right-4 bg-[#261005] border border-[#8f3a0a] px-4 py-3 rounded-2xl shadow-[0_0_20px_rgba(143,58,10,0.5)] text-[#ff7733] font-bold text-xl animate-[bounce_4.5s_infinite]">Ai</div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
