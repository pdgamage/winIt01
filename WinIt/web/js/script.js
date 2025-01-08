// JavaScript for handling bid button click
function placeBid() {
    // Show a confirmation message
    const confirmationMessage = document.getElementById("bid-confirmation");
    confirmationMessage.style.display = "block";

    // Simulate sending bid (you can replace this with an AJAX request)
    setTimeout(() => {
        alert("Bid placed successfully!");
    }, 500);
}
