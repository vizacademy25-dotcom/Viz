import { Clock, Calendar, ArrowRight } from 'lucide-react';
import aiArtwork from '../assets/ai_artwork.png';
import premiereEditing from '../assets/premiere_editing.png';
import afterEffects from '../assets/after_effects.png';

const Courses = () => {
  const courses = [
    {
      title: "Graphic Design",
      desc: "Learn design principles, typography, branding, and visual storytelling.",
      image: aiArtwork,
      duration: "24 Hours",
      perDay: "1 Hour",
      price: "₹ 7,499"
    },
    {
      title: "Video Editing",
      desc: "Master professional video editing using industry-standard tools.",
      image: premiereEditing,
      duration: "48 Hours",
      perDay: "1 Hour",
      price: "₹ 16,499"
    },
    {
      title: "Motion Graphics",
      desc: "Create stunning animations and visual effects for any platform.",
      image: afterEffects,
      duration: "72 Hours",
      perDay: "1 Hour",
      price: "₹ 28,499"
    }
  ];

  return (
    <section id="course" className="py-section bg-viz-bg">
      <div className="max-w-[1280px] mx-auto px-6 w-full">
        
        {/* Header */}
        <div className="text-center mb-16 animate-fade-up">
          <p className="text-viz-orange font-bold text-sm tracking-widest uppercase mb-4">
            Our Courses
          </p>
          <h2 className="text-[36px] md:text-[48px] font-bold leading-[1.2]">
            Learn What You <span className="text-viz-orange">Love</span>
          </h2>
        </div>

        {/* Course Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
          {courses.map((course, index) => (
            <div 
              key={index} 
              className="bg-white rounded-2xl overflow-hidden shadow-[0_8px_30px_rgba(0,0,0,0.04)] transition-all duration-300 hover:-translate-y-2 hover:shadow-[0_20px_40px_rgba(255,90,31,0.15)] group animate-fade-up"
              style={{ animationDelay: `${(index + 1) * 100}ms` }}
            >
              <div className="h-48 overflow-hidden relative">
                <img 
                  src={course.image} 
                  alt={course.title} 
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
              </div>
              
              <div className="p-8">
                <h3 className="text-2xl font-bold text-viz-black mb-3">{course.title}</h3>
                <p className="text-viz-gray mb-6 leading-relaxed line-clamp-2">{course.desc}</p>
                
                <div className="flex flex-col gap-3 mb-6">
                  <div className="flex items-center gap-3 text-viz-gray text-sm font-medium">
                    <Clock className="w-5 h-5 text-viz-black" />
                    Duration: {course.duration}
                  </div>
                  <div className="flex items-center gap-3 text-viz-gray text-sm font-medium">
                    <Calendar className="w-5 h-5 text-viz-black" />
                    Per Day: {course.perDay}
                  </div>
                </div>
                
                <div className="pt-6 border-t border-gray-100 flex items-center justify-between">
                  <span className="text-viz-gray text-sm font-medium">Price:</span>
                  <span className="text-xl font-bold text-viz-black">{course.price}</span>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* CTA */}
        <div className="flex justify-center animate-fade-up delay-300">
          <button className="bg-viz-black text-white px-8 py-4 rounded-xl font-semibold text-base transition-all duration-300 hover:scale-[1.03] hover:shadow-xl flex items-center gap-2 group">
            View All Courses
            <ArrowRight className="w-5 h-5 transition-transform duration-300 group-hover:translate-x-1" />
          </button>
        </div>

      </div>
    </section>
  );
};

export default Courses;
