/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        viz: {
          black: '#070707',
          orange: '#ff5a1f',
          white: '#ffffff',
          gray: '#777777',
          bg: '#fafafa'
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
      borderRadius: {
        'xl': '12px',
        '2xl': '18px',
        '3xl': '24px',
      },
      spacing: {
        'section': '100px',
      }
    },
  },
  plugins: [],
}
