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
        line = []        

        for position in self._datasets['numbers']:
            ps = ' '.join(position.split(','))
            line.append(f'[{ps}]')

            if len(line) == items_per_line:
                lines.append(' '.join(line))
                line = []

        if line:
            lines.append(' '.join(line))

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