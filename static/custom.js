// Custom JavaScript for Django Website
document.addEventListener('DOMContentLoaded', function() {
    console.log('Custom JavaScript loaded successfully!');
    
    // Smooth scrolling for navigation links
    const navLinks = document.querySelectorAll('a[href^="#"]');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            if (targetSection) {
                targetSection.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Add animation to cards
    const cards = document.querySelectorAll('.card');
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    cards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });

    // Form validation
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    field.classList.add('is-invalid');
                    isValid = false;
                } else {
                    field.classList.remove('is-invalid');
                }
            });

            if (!isValid) {
                e.preventDefault();
                alert('กรุณากรอกข้อมูลให้ครบถ้วน');
            }
        });
    });

    // Add loading animation
    const loadingSpinner = document.createElement('div');
    loadingSpinner.innerHTML = `
        <div class="loading-spinner" style="
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            opacity: 0;
            transition: opacity 0.3s ease;
        ">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">กำลังโหลด...</span>
            </div>
        </div>
    `;
    document.body.appendChild(loadingSpinner);

    // Show loading on form submission
    forms.forEach(form => {
        form.addEventListener('submit', function() {
            const spinner = document.querySelector('.loading-spinner');
            spinner.style.opacity = '1';
        });
    });
});

// Global function for modal
function showLearnMoreDialog() {
    console.log('showLearnMoreDialog function called');
    if (typeof bootstrap !== 'undefined') {
        var modal = new bootstrap.Modal(document.getElementById('learnMoreModal'));
        modal.show();
    } else {
        console.error('Bootstrap is not loaded');
        alert('Bootstrap ไม่ได้โหลด กรุณารีเฟรชหน้าเว็บ');
    }
}
