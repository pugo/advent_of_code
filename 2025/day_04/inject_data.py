#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        lines = [l for l in self._data.split('\n') if l]
        self._add_dataset('grid', lines)

    def generate_data(self) -> str:
        lines = []

        for line in self._datasets['grid']:
            lines.append(f'({line})')

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