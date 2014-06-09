module.exports = function(Handlebars) {
  Handlebars.registerHelper('upperCase', (function() {
    return function(options) {
      return options.charAt(0).toUpperCase() + options.slice(1);
    };
  })());
};
