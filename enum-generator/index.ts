import { ApiDump } from "./api";
import * as fs from "fs";
import path from "path";
import fetch from "node-fetch";

new Promise((resolve, reject) => {
	setTimeout(reject, 10_000);
	fetch("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Watch/roblox/API-Dump.json")
		.then(response => {
			if (response.status !== 200) throw new Error("bad request");
			return response.json();
		})
		.then(({ Enums: enumTypes }: ApiDump) => {
			const init = [`local createEnumGroup = import("../createEnumGroup")\n\n`, `return createEnumGroup({`];
			for (const { Name: enumTypeName, Items: enumItems } of enumTypes) {
				init.push(`\n\t`, enumTypeName, ` = import("./`, enumTypeName, `");`);
				fs.writeFileSync(path.join("../lib/Enum", enumTypeName + ".lua"), [
					`local createEnum = import("../createEnum")\n\n`,
					`return createEnum("`,
					enumTypeName,
					`", {\n`,
					...enumItems.map(enumItem => "\t" + enumItem.Name + " = " + enumItem.Value + ",\n"),
					`})\n`
				].join(""));
			}
			init.push(`\n})\n`)
			fs.writeFileSync(path.normalize("../lib/Enum/init.lua"), init.join(""));
			resolve();
		})
		.catch(reject);
}).catch(e => {
	console.log(e);
});
