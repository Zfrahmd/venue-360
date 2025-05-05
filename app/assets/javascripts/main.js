$(document).ready(function() {
// jQuery(document).ready(function() {
// document.addEventListener("turbo:load", function() { 
    
    // Initialize modals
    var loginModal = new bootstrap.Modal(document.getElementById('loginModal'));
    var signupModal = new bootstrap.Modal(document.getElementById('signupModal'));
    //var adminLoginModal = new bootstrap.Modal(document.getElementById('adminLoginModal'));
    
    // Open modals when buttons are clicked
    document.getElementById('openLoginModal').onclick = function() {
        loginModal.show();
    }
    
    document.getElementById('openSignupModal').onclick = function() {
        signupModal.show();
    }
});
