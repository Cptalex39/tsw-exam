    const outerButton1 = document.getElementById("outerButton1");
    const innerButtons1 = document.querySelectorAll(".dropdown-content .btn1");

    innerButtons1.forEach((button) => {
        button.addEventListener("click", () => {
            outerButton1.textContent = button.textContent;
        });
    });

        const outerButton2 = document.getElementById("outerButton2");
    const innerButtons2 = document.querySelectorAll(".dropdown-content .btn1");

    innerButtons2.forEach((button) => {
        button.addEventListener("click", () => {
            outerButton2.textContent = button.textContent;
        });
    });

        const outerButton3 = document.getElementById("outerButton3");
    const innerButtons3 = document.querySelectorAll(".dropdown-content .btn1");

    innerButtons3.forEach((button) => {
        button.addEventListener("click", () => {
            outerButton3.textContent = button.textContent;
        });
    });

        const outerButton4 = document.getElementById("outerButton4");
    const innerButtons4 = document.querySelectorAll(".dropdown-content .btn1");

    innerButtons4.forEach((button) => {
        button.addEventListener("click", () => {
            outerButton4.textContent = button.textContent;
        });
    });
