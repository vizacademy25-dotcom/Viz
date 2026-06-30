import { Mail, MapPin, Phone } from 'lucide-react';

const Contact = () => {
  return (
    <section id="contact" className="w-full bg-viz-black rounded-3xl p-8 md:p-12 shadow-2xl overflow-hidden relative">
      {/* Background decoration */}
      <div className="absolute top-0 right-0 w-64 h-64 bg-viz-orange/10 rounded-full blur-[60px] -z-0"></div>
      
      <div className="relative z-10 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 md:gap-12 items-center">
        
        {/* Intro */}
        <div className="flex items-center gap-6 lg:col-span-1">
          <div className="w-14 h-14 rounded-2xl bg-white/5 border border-white/10 flex items-center justify-center shrink-0">
            <Mail className="w-6 h-6 text-viz-orange" />
          </div>
          <div>
            <h3 className="text-white/70 font-medium text-sm mb-1">Have questions?</h3>
            <p className="text-white text-lg font-bold">We'd love to <span className="text-viz-orange">hear from you.</span></p>
          </div>
        </div>

        {/* Email */}
        <div className="flex items-center gap-4 border-t border-white/10 pt-6 md:border-t-0 md:pt-0 lg:border-l lg:border-white/10 lg:pl-8">
          <Mail className="w-6 h-6 text-viz-orange shrink-0" />
          <a href="mailto:hello@vizacademy.com" className="text-white font-medium hover:text-viz-orange transition-colors truncate">
            hello@vizacademy.com
          </a>
        </div>

        {/* Phone */}
        <div className="flex items-center gap-4 border-t border-white/10 pt-6 md:border-t-0 md:pt-0 lg:border-l lg:border-white/10 lg:pl-8">
          <Phone className="w-6 h-6 text-viz-orange shrink-0" />
          <a href="tel:+911234567890" className="text-white font-medium hover:text-viz-orange transition-colors">
            +91 123 456 7890
          </a>
        </div>

        {/* Location */}
        <div className="flex items-center gap-4 border-t border-white/10 pt-6 md:border-t-0 md:pt-0 lg:border-l lg:border-white/10 lg:pl-8">
          <MapPin className="w-6 h-6 text-viz-orange shrink-0" />
          <span className="text-white font-medium">
            Kochi, Kerala, India
          </span>
        </div>

      </div>
    </section>
  );
};

export default Contact;
