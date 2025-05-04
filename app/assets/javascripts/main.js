// var signupModal = bootstrap.Modal.getInstance(document.getElementById('signupModal'));


/*document.getElementById('adminLoginForm').onsubmit = function(e) {
    e.preventDefault();
    const email = document.getElementById('adminEmail').value;
    const password = document.getElementById('adminPassword').value;
    
    // Simple admin login check (in a real app, this would be server-side)
    if (email === 'admin@luxstay.com' && password === 'admin123') {
        alert('Admin login successful! Admin controls now visible.');
        document.getElementById('adminActions').classList.remove('d-none');
        var adminLoginModal = bootstrap.Modal.getInstance(document.getElementById('adminLoginModal'));
        adminLoginModal.hide();
    } else {
        alert('Invalid admin credentials');
    }
}*/


// Carousel functionality
/*let currentSlide = 0;
const slides = document.querySelectorAll('.carousel-item');
const indicators = document.querySelectorAll('.indicator');

function showSlide(index) {
    if (index >= slides.length) index = 0;
    if (index < 0) index = slides.length - 1;
    
    document.getElementById('carouselInner').style.transform = `translateX(-${index * 100}%)`;
    
    // Update indicators
    indicators.forEach((indicator, i) => {
        if (i === index) {
            indicator.classList.add('active');
        } else {
            indicator.classList.remove('active');
        }
    });
    
    currentSlide = index;
}

function nextSlide() {
    showSlide(currentSlide + 1);
}

function prevSlide() {
    showSlide(currentSlide - 1);
}

function goToSlide(index) {
    showSlide(index);
}

// Auto-advance slides every 5 seconds
setInterval(nextSlide, 5000);
*/

// Book button functionality
// window.onload = function () {
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
