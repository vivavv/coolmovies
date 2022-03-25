import { createTheme, Palette, PaletteOptions } from "@mui/material";
import { Shadows } from "@mui/material/styles/shadows";

declare module '@mui/material/styles' {
    interface Theme {
        shadows: Shadows,
        colors: {
            background: string,
            header: string,
            text: string,
            textDark: string,
            bubble: string,
            bubbleMedium: string
            bubbleDark: string,
            item: string,
            purple: string,
            gold: string,
            green: string,
        };
    }
    // allow configuration using `createTheme`
    interface ThemeOptions {
        shadows?: Shadows,
        colors?: {
            background?: string,
            header?: string,
            text?: string,
            textDark?: string,
            bubble?: string,
            bubbleMedium?: string
            bubbleDark?: string,
            item?: string,
            purple?: string,
            gold?: string,
            green?: string
        };
    }
}

export const theme = createTheme({
    shadows: Array(25).fill("none") as Shadows,

    colors: {
        background: "#242231",
        header: "#191722",
        text: "#c8cbd0",
        textDark: "#949bb1",
        bubble: "#3a364f",
        bubbleMedium: "#2f2c40",
        bubbleDark: "#0e0d13",
        item: "#45415e",
        purple: "#BEA9DF",
        gold: "#f7ca18",
        green: "#6FDBC0"
    }
});