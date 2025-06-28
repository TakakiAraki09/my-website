/** @type {import('tailwindcss').Config} */
module.exports = {
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/container-queries'),
  ],
  content: [
    './pages/**/*.{js,ts,jsx,tsx}',
    './components/**/*.{js,ts,jsx,tsx}',
  ],
  darkMode: false,
  theme: {
    borderRadius: {
      base: '2px',
      rounder: '6px',
      'inner-radius': '8px',
      'outer-radius': '12px',
      'full-radius': '100vmax',
    },
    extend: {
      fontFamily: {
        'noto-sans-jp': ['var(--font-noto-sans-jp)'],
        'noto-serif-jp': ['var(--font-noto-serif-jp)'],
        'kaisei-opti': ['var(--font-kaisei-opti)'],
      },
      spacing: {
        scrollbar: '20px',
        'layout-small': '320px',
        'layout-medium': '768px',
        'layout-large': '1280px',
        'layout-full': '100vw',

        'layout-offset-small': 'max(calc(50vw - 160px + 20px), 20px)',
        'layout-offset-medium': 'max(calc(50vw - 384px + 20px), 20px)',
        'layout-offset-large': 'max(calc(50vw - 640px + 20px), 20px)',
      },
    },
  },
};
