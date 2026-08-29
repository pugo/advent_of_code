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

        for position in self._datasets['numbers']:
            items = position.split(' ')
            items[0] = items[0].replace('[', '(')
            items[0] = items[0].replace(']', ')')
            items[-1] = items[-1].replace('{', '[')
            items[-1] = items[-1].replace('}', ']')

            buttons = [i.replace(',', ' ').replace('(', '[').replace(')', ']') for i in items[1:-1]]
            lines.append(f'[{items[0]} [{' '.join(buttons)}] {items[-1].replace(',', ' ')}]')

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