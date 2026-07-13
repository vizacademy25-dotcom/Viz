const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf8');

// Replace button clicks
html = html.replace(
  /onclick="openEnrollModal\('Graphic Design'[^"]+"/g,
  'onclick="window.location.href=\'course-details.html?course=graphic-design\'"'
);
html = html.replace(
  /onclick="openEnrollModal\('Video Editing'[^"]+"/g,
  'onclick="window.location.href=\'course-details.html?course=video-editing\'"'
);
html = html.replace(
  /onclick="openEnrollModal\('Motion Graphics'[^"]+"/g,
  'onclick="window.location.href=\'course-details.html?course=motion-graphics\'"'
);

// Remove modal HTML
html = html.replace(/<!-- Enroll Modal -->[\s\S]*?(?=<\/body>)/, '');

fs.writeFileSync('index.html', html);
console.log('index.html updated successfully.');
