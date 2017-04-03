$(document).ready(function() {
  $('.button-collapse').sideNav()
  $('.tooltipped').tooltip({ delay: 50 });
  $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 5 // Creates a dropdown of 15 years to control year
    });
  $('select').material_select();
})
