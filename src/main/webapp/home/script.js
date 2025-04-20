/**
 * 
 */
document.addEventListener("DOMContentLoaded", () => {
    console.log("Landing page loaded successfully");

    const btn = document.querySelector(".btn");
    if (btn) {
        btn.addEventListener("click", () => {
            alert("Redirecting to our collection!");
        });
    }
});