// Ping Pong Analysis - Data Loader

async function loadAnalysisData() {
    try {
        const response = await fetch('results/analysis_results.json');
        if (!response.ok) throw new Error('Failed to load data');
        const data = await response.json();
        populatePageData(data);
        updateLastUpdated(data.metadata.last_updated);
    } catch (error) {
        console.error('Error loading analysis data:', error);
    }
}

function populatePageData(data) {
    updateElement('stat-observations', data.metadata.sample_size);
    updateElement('stat-correlation', `r=${data.inferential.correlation.r}`);

    updateElement('stat-total-obs', data.metadata.sample_size);
    updateElement('stat-mean-attempts', data.descriptive.attempts.mean);
    updateElement('stat-mean-time', data.descriptive.serve_time.mean);
    updateElement('stat-sd-attempts', data.descriptive.attempts.sd);
    updateElement('stat-sd-time', data.descriptive.serve_time.sd);

    if (data.categorical && data.categorical.handedness) {
        const rightProp = data.categorical.handedness.right_handed.proportion * 100;
        const leftProp = data.categorical.handedness.left_handed.proportion * 100;
        updateElement('right-handed-pct', rightProp.toFixed(1) + '%');
        updateElement('left-handed-pct', leftProp.toFixed(1) + '%');
        updateProgressBar('right-handed-bar', rightProp);
        updateProgressBar('left-handed-bar', leftProp);
    }

    updateElement('chi-sq-stat', `χ² = ${data.inferential.chi_square.statistic}`);
    updateElement('chi-sq-pvalue', data.inferential.chi_square.p_value);
    updateElement('chi-sq-conclusion', data.inferential.chi_square.conclusion);

    updateElement('t-test-stat', `t = ${data.inferential.t_test.statistic}`);
    updateElement('t-test-pvalue', data.inferential.t_test.p_value);
    updateElement('t-test-conclusion', data.inferential.t_test.conclusion);

    updateElement('correlation-r', `r = ${data.inferential.correlation.r}`);
    updateElement('correlation-pvalue', `< ${data.inferential.correlation.p_value}`);
    updateElement('correlation-interpretation', data.inferential.correlation.interpretation);
}

function updateElement(id, value) {
    const el = document.getElementById(id);
    if (el) el.textContent = value;
}

function updateProgressBar(id, percentage) {
    const el = document.getElementById(id);
    if (el) el.style.width = percentage + '%';
}

function updateLastUpdated(date) {
    const el = document.getElementById('last-updated');
    if (el) el.textContent = `Updated: ${date}`;
}

document.addEventListener('DOMContentLoaded', function () {
    loadAnalysisData();

    // Smooth scroll
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    // Mobile menu
    const menuToggle = document.getElementById('menuToggle');
    const nav = document.querySelector('.nav');

    if (menuToggle && nav) {
        menuToggle.addEventListener('click', function () {
            nav.classList.toggle('active');
        });
    }

    // Active section highlight
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link');

    window.addEventListener('scroll', () => {
        let current = '';
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            if (scrollY >= sectionTop - 200) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === `#${current}`) {
                link.classList.add('active');
            }
        });
    });
});

// Intersection observer for animations
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

document.querySelectorAll('.section, .content-card, .chart-card').forEach(el => {
    observer.observe(el);
});