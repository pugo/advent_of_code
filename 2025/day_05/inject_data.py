#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        write_ranges = True
        lines = self._data.split('\n')

        ranges = []
        ingredients = []

        for line in lines:
            if not line:
                write_ranges = False
                continue

            if write_ranges:
                ranges.append(line)
            else:
                ingredients.append(line)

        self._add_dataset('ranges', ranges)
        self._add_dataset('ingredients', ingredients)

    def generate_ranges_data(self) -> str:
        lines = []

        for line in self._datasets['ranges']:
            lines.append(f'({line})')

        return '\n'.join(lines)

    def generate_ingredients_data(self) -> str:
        items_per_line = 12
        lines = []
        line = []

        for ingredient in self._datasets['ingredients']:
            line.append(f'{ingredient}')
            if len(line) == items_per_line:
                lines.append(' '.join(line))
                line = []

        if line:
            lines.append(' '.join(line))

        return '\n'.join(lines)

    TAG_INJECTORS = {
        '<<INJECT RANGES DATA HERE>>': generate_ranges_data,
        '<<INJECT INGREDIENTS DATA HERE>>': generate_ingredients_data,
    }


if __name__ == '__main__':
    injector = Injector()
    injector.read()
    injector.parse_data()
    injector.inject()
    injector.write()