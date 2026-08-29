#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        banks = [b for b in self._data.split('\n') if b]
        self._add_dataset('banks', banks)

    def generate_data(self) -> str:
        lines = []

        for bank in self._datasets['banks']:
            lines.append(f'({bank})')

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