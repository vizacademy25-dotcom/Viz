import fs from 'fs';
import * as cheerio from 'cheerio';

const files = ['index.html', 'course-details.html'];

function updateClasses(el, toAdd, toRemove) {
    if (toRemove && toRemove.length) {
        el.removeClass(toRemove.join(' '));
    }
    if (toAdd && toAdd.length) {
        el.addClass(toAdd.join(' '));
    }
}

const weightClasses = ['font-thin', 'font-extralight', 'font-light', 'font-normal', 'font-medium', 'font-semibold', 'font-bold', 'font-extrabold', 'font-black'];

function setWeight(el, weightClass) {
    el.removeClass(weightClasses.join(' '));
    el.addClass(weightClass);
}

files.forEach(file => {
    let content = fs.readFileSync(file, 'utf8');
    
    // Global replacement for font-display
    content = content.replace(/font-display/g, 'font-sans');
    
    const $ = cheerio.load(content, { decodeEntities: false });

    // Hero Headings (h1) -> 900 (font-black)
    $('h1').each((i, el) => {
        setWeight($(el), 'font-black');
    });

    // Section Headings (h2) -> 800 (font-extrabold)
    $('h2').each((i, el) => {
        setWeight($(el), 'font-extrabold');
    });

    // Card Titles (h3) -> 700 (font-bold)
    $('h3').each((i, el) => {
        setWeight($(el), 'font-bold');
    });

    // Navigation -> 600 (font-semibold)
    $('nav a').each((i, el) => {
        setWeight($(el), 'font-semibold');
    });

    // Buttons -> 600 (font-semibold)
    $('button, .btn, a.bg-viz-black, a.bg-viz-orange, a[href="#courses"]').each((i, el) => {
        setWeight($(el), 'font-semibold');
    });

    // Labels & Small Headings -> 500 (font-medium)
    $('h4, h5, label').each((i, el) => {
        setWeight($(el), 'font-medium');
    });

    // Body Text -> 400 (remove all explicit weights to inherit default font-normal)
    $('p, span').each((i, el) => {
        if ($(el).parents('button, h1, h2, h3, h4, h5, nav, a').length === 0) {
             $(el).removeClass('font-medium font-semibold font-bold font-extrabold font-black');
        }
    });

    fs.writeFileSync(file, $.html());
    console.log(`Updated ${file}`);
});
