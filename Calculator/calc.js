function randInt(max) {
    return Math.floor(Math.random() * value);
}

function randRange(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}

function randomDice() {
    return randRange(0, 7);
}

function generate() {
    // let symbols =["-","+","*","/"];
    do {
        let num1 = randomDice();
        let num2 = randomDice();
        let formula = `${num1} + ${num2}`;
        result = eval(formula);
    } while (result < 1 || result > 6 || !Number.isInteger(result));
    document.getElementById("formula").innerText = formula;
}

function verifyRandom() {
    let results = {};
    let ROUNDS = 10_000;

    for (let i = 1; i <= ROUNDS; i++) {
        generate();
        let result = eval(document.getElementById("formula"));
        if (results[result] == undefined) results[result] = 0;
        results[result] += 1;
    }

    let percentages = {};
    for (let result in results) {
        percentages[result] = `${Math.round(results[result] / ROUNDS * 10000) / 100}%`;
    }
    console.log(percentages);
}
verifyRandom();