const original = {
    "r1c1": 5,
    "r1c2": 3,
    "r1c5": 7,
    "r2c1": 6,
    "r2c4": 1,
    "r2c5": 9,
    "r2c6": 5,
    "r3c2": 9,
    "r3c3": 8,
    "r3c8": 6,
    "r4c1": 8,
    "r4c5": 6,
    "r4c9": 3,
    "r5c1": 4,
    "r5c4": 8,
    "r5c6": 3,
    "r5c9": 1,
    "r6c1": 7,
    "r6c5": 2,
    "r6c9": 6,
    "r7c2": 6,
    "r7c7": 2,
    "r7c8": 8,
    "r8c4": 4,
    "r8c5": 1,
    "r8c6": 9,
    "r8c9": 5,
    "r9c5": 8,
    "r9c8": 7,
    "r9c9": 9,
};

let table = document.getElementsByTagName("table")[0];

for (row = 1; row <= 9; row++) {
	let tr = document.createElement("tr");
	for (col = 1; col <= 9; col++) {
		let td = document.createElement("td");
		let coordinates = "r" + row + "c" + col;

		let input = document.createElement("input");
		input.value = original[coordinates] || "";
		input.type = "number";
		input.min = "1";
		input.max = "9";
		input.readOnly = input.value !== "";
		td.appendChild(input);
		tr.appendChild(td);
	}
	table.appendChild(tr);
}

function checkSolved() {
    let remain = Array.from(Array(10).keys());
    remain = remain.slice(1);

	for (row = 1; row <= 9; row++) {
		let tr = document.getElementsByTagName("tr")[row];
		let input = tr.getElementsByTagName("input")[col];
		if (remain.includes(input)) {
			let index = remain.indexOf(input.value);
			remain.splice(index, 1);
		} else {
			alert("Error found");
			return;
		}
	}

    for (let box = 0; box < 9; box++) {
        remain = remain.slice(1);
        
        for (let col = 0; col < 9; col++) {
            let c = Math.floor(col / 3);
            for (let row = 0; row < 9; row++) {
                let r = Math.floor(row / 3);
                
                if (c !== box % 3 || r !== Math.floor(box / 3)) continue;
            }
        }
    }
}