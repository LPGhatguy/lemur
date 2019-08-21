"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs = __importStar(require("fs"));
const path_1 = __importDefault(require("path"));
const node_fetch_1 = __importDefault(require("node-fetch"));
new Promise((resolve, reject) => {
    setTimeout(reject, 10000);
    node_fetch_1.default("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Watch/roblox/API-Dump.json")
        .then(response => {
        if (response.status !== 200)
            throw new Error("bad request");
        return response.json();
    })
        .then(({ Enums: enumTypes }) => {
        const init = [`local createEnumGroup = import("../createEnumGroup")\n\n`, `return createEnumGroup({`];
        for (const { Name: enumTypeName, Items: enumItems } of enumTypes) {
            init.push(`\n\t`, enumTypeName, ` = import("./`, enumTypeName, `");`);
            fs.writeFileSync(path_1.default.join("../lib/Enum", enumTypeName + ".lua"), [
                `local createEnum = import("../createEnum")\n\n`,
                `return createEnum("`,
                enumTypeName,
                `", {\n`,
                ...enumItems.map(enumItem => "\t" + enumItem.Name + " = " + enumItem.Value + ",\n"),
                `})\n`
            ].join(""));
        }
        init.push(`\n})\n`);
        fs.writeFileSync(path_1.default.normalize("../lib/Enum/init.lua"), init.join(""));
        resolve();
    })
        .catch(reject);
}).catch(e => {
    console.log(e);
});
