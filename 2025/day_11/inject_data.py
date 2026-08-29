#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        lines = [l for l in self._data.split('\n') if l]
        self._add_dataset('numbers', lines)

    def generate_data(self) -> str:
        items_per_line = 8
        lines = []

        # Make lines like: "(you) [(bbb) (ccc)]""
        for line in self._datasets['numbers']:
            parts = line.split(':')
            key = parts[0]
            values = parts[1].strip().split(' ')
            ps_values = [f'({v})' for v in values]

            lines.append(f'({key}) [{' '.join(ps_values)}]')

        return '\n'.join(lines)
    
    TAG_INJECTORS = {
        '<<INJECT DATA HERE>>': generate_data,
    }


if __name__ == '__main__':
    injector = Injector()
    injector.read()
    injector.parse_data()
    injector.inject()
    injector.write()