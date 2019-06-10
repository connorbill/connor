var fs = require('fs');
var path = require('path');
var version = process.env.VERSION || require('../../package.json').version;
var content = { '0.9.9': '0.9', '1.0.0': '1.0' };
if (!content[version]) content[version] = '1.0';
fs.writeFileSync(path.resolve(__dirname, '../../src/versions.json'), JSON.stringify(content));
